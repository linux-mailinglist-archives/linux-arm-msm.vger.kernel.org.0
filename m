Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1BD07B11B1
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Sep 2019 17:02:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732860AbfILPBk (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 12 Sep 2019 11:01:40 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:35818 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732728AbfILPBk (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 12 Sep 2019 11:01:40 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id 974E26083C; Thu, 12 Sep 2019 15:01:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1568300497;
        bh=i+ZCbip0u88IAWK7ce9GsXf9y525lDvt+/EphHvi6U8=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=DT9Yh3HnMhFAQWwIG08o4ZAmQeAjKvbfpUIiVy2C+EqpVLYzmnAH+ueE2Qh/fnOqu
         vNrj+Li7olNpRB3Iwk/BrNvURKeMPe2wwhajd8qY1qbBcBTeiAqYhga8eWtaaGAlgj
         TW/+iAMKIhwg/hKfLUyodHZBgZaoqrJ9jIxPZSUo=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        pdx-caf-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        DKIM_INVALID,DKIM_SIGNED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        by smtp.codeaurora.org (Postfix) with ESMTP id 83F02602BC;
        Thu, 12 Sep 2019 15:01:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1568300494;
        bh=i+ZCbip0u88IAWK7ce9GsXf9y525lDvt+/EphHvi6U8=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=I/jYTab1GI1sk6etJGbFCmTP9Tx3PnpHoMmwKdMQO7sN90+jLCAQ/hSrHQFr1BzEU
         SUuKxCCVtb5noV0vOsu4nhmo5eyY0AxPzaNw6grBHOiRK1pRWDkzAtBOxLswdweOi5
         aFDBrN2ACFrwL1ijlbkGoww7Wi6XLfvrHLzUDhtw=
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Thu, 12 Sep 2019 20:31:34 +0530
From:   ppvk@codeaurora.org
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     adrian.hunter@intel.com, georgi.djakov@linaro.org,
        robh+dt@kernel.org, ulf.hansson@linaro.org,
        asutoshd@codeaurora.org, vbadigan@codeaurora.org,
        stummala@codeaurora.org, sayalil@codeaurora.org,
        rampraka@codeaurora.org, linux-mmc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org,
        Subhash Jadavani <subhashj@codeaurora.org>,
        Andy Gross <agross@kernel.org>, linux-mmc-owner@vger.kernel.org
Subject: Re: [RFC 1/2] mmc: sdhci-msm: Add support for bus bandwidth voting
In-Reply-To: <20190906210251.0A96C21670@mail.kernel.org>
References: <1567774037-2344-1-git-send-email-ppvk@codeaurora.org>
 <1567774037-2344-2-git-send-email-ppvk@codeaurora.org>
 <ae24703de33d4049c451dd4a331f7a5f@codeaurora.org>
 <20190906210251.0A96C21670@mail.kernel.org>
Message-ID: <6c633155857337a6d0d6a05b49b6bfaf@codeaurora.org>
X-Sender: ppvk@codeaurora.org
User-Agent: Roundcube Webmail/1.2.5
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2019-09-07 02:32, Stephen Boyd wrote:
> Quoting ppvk@codeaurora.org (2019-09-06 05:51:54)
>> +Georgi Djakov
>> 
>> On 2019-09-06 18:17, Pradeep P V K wrote:
>> > diff --git a/drivers/mmc/host/sdhci-msm.c
>> > b/drivers/mmc/host/sdhci-msm.c
>> > index b75c82d..71515ca 100644
>> > --- a/drivers/mmc/host/sdhci-msm.c
>> > +++ b/drivers/mmc/host/sdhci-msm.c
>> >  #define msm_host_writel(msm_host, val, host, offset) \
>> >       msm_host->var_ops->msm_writel_relaxed(val, host, offset)
>> >
>> > +#define SDHC_DDR "sdhc-ddr"
>> > +#define CPU_SDHC "cpu-sdhc"
> 
> Do you really need these defines? They're not used more than once or
> twice and just seem to make the code harder to read.
> 
Agree and will address this in my next patch set.

>> > +
>> >  struct sdhci_msm_offset {
>> >       u32 core_hc_mode;
>> >       u32 core_mci_data_cnt;
>> > @@ -228,6 +232,31 @@ struct sdhci_msm_variant_info {
>> >       const struct sdhci_msm_offset *offset;
>> >  };
>> >
>> > +struct msm_bus_vectors {
>> > +     uint64_t ab;
>> > +     uint64_t ib;
>> > +};
>> > +
>> > +struct msm_bus_path {
>> > +     unsigned int num_paths;
>> > +     struct msm_bus_vectors *vec;
>> > +};
>> > +
>> > +struct sdhci_msm_bus_vote_data {
>> > +     const char *name;
>> > +     unsigned int num_usecase;
>> > +     struct msm_bus_path *usecase;
>> > +
>> > +     unsigned int *bw_vecs;
>> > +     unsigned int bw_vecs_size;
>> > +
>> > +     struct icc_path *sdhc_ddr;
>> > +     struct icc_path *cpu_sdhc;
>> > +
>> > +     uint32_t curr_vote;
>> > +
> 
> Please use u32 instead of uint32_t. Same comment for u64.

Ok. I will address this in my next patch set.

> 
>> > +};
>> > +
>> >  struct sdhci_msm_host {
>> >       struct platform_device *pdev;
>> >       void __iomem *core_mem; /* MSM SDCC mapped address */
>> > @@ -1678,6 +1714,341 @@ static void
>> > sdhci_msm_set_regulator_caps(struct sdhci_msm_host *msm_host)
>> >       pr_debug("%s: supported caps: 0x%08x\n", mmc_hostname(mmc), caps);
>> >  }
>> >
>> > +static int sdhci_msm_dt_get_array(struct device *dev, const char
>> > *prop_name,
>> > +                              u32 **bw_vecs, int *len, u32 size)
>> > +{
>> > +     int ret = 0;
>> > +     struct device_node *np = dev->of_node;
>> > +     size_t sz;
>> > +     u32 *arr = NULL;
>> > +
>> > +     if (!of_get_property(np, prop_name, len)) {
>> > +             ret = -EINVAL;
>> > +             goto out;
>> > +     }
>> > +     sz = *len = *len / sizeof(*arr);
>> > +     if (sz <= 0 || (size > 0 && (sz > size))) {
>> > +             dev_err(dev, "%s invalid size\n", prop_name);
>> > +             ret = -EINVAL;
>> > +             goto out;
>> > +     }
>> > +
>> > +     arr = devm_kzalloc(dev, sz * sizeof(*arr), GFP_KERNEL);
>> > +     if (!arr) {
>> > +             ret = -ENOMEM;
>> > +             goto out;
>> > +     }
>> > +
>> > +     ret = of_property_read_u32_array(np, prop_name, arr, sz);
>> > +     if (ret < 0) {
>> > +             dev_err(dev, "%s failed reading array %d\n", prop_name, ret);
>> > +             goto out;
>> > +     }
>> > +     *bw_vecs = arr;
>> > +out:
>> > +     if (ret)
>> > +             *len = 0;
>> > +     return ret;
>> > +}
>> > +
>> > +/* Returns required bandwidth in Bytes per Sec */
>> > +static unsigned long sdhci_get_bw_required(struct sdhci_host *host,
>> > +                                     struct mmc_ios *ios)
>> > +{
>> > +     unsigned long bw;
>> > +     struct sdhci_pltfm_host *pltfm_host = sdhci_priv(host);
>> > +     struct sdhci_msm_host *msm_host = sdhci_pltfm_priv(pltfm_host);
>> > +
>> > +     bw = msm_host->clk_rate;
>> > +
>> > +     if (ios->bus_width == MMC_BUS_WIDTH_4)
>> > +             bw /= 2;
>> > +     else if (ios->bus_width == MMC_BUS_WIDTH_1)
>> > +             bw /= 8;
>> > +
>> > +     return bw;
>> > +}
>> > +
>> > +static int sdhci_msm_bus_get_vote_for_bw(struct sdhci_msm_host *host,
>> > +                                        unsigned int bw)
>> > +{
>> > +     struct sdhci_msm_bus_vote_data *bvd = host->bus_vote_data;
>> > +
>> > +     unsigned int *table = bvd->bw_vecs;
> 
> Should probably be a const bw_vecs pointer so that it can't be modified
> after the fact.

Agree and will address this in my next patch set.

> 
>> > +     unsigned int size = bvd->bw_vecs_size;
>> > +     int i;
>> > +
>> > +     for (i = 0; i < size; i++) {
>> > +             if (bw <= table[i])
>> > +                     break;
> 
> return i;

Ok. I will address this in my next patch set.

> 
>> > +     }
>> > +
> 
> return i - 1;

Ok. I will address this in my next patch set.

> 
>> > +     if (i && (i == size))
>> > +             i--;
>> > +
>> > +     return i;
> 
> And then this is useless.....

Agree and will address this in my next patch set.

> 
>> > +}
>> > +
>> > +/*
>> > + * This function must be called with host lock acquired.
>> > + * Caller of this function should also ensure that msm bus client
>> > + * handle is not null.
> 
> If it was NULL it would be pretty sad.

Agree but this is handled in the caller of this fun.
and will update in my next patch set.

> 
>> > + */
>> > +static inline int sdhci_msm_bus_set_vote(struct sdhci_msm_host
>> > *msm_host,
>> > +                                          int vote,
>> > +                                          unsigned long *flags)
>> > +{
>> > +     struct sdhci_host *host =  platform_get_drvdata(msm_host->pdev);
>> > +     struct sdhci_msm_bus_vote_data *bvd = msm_host->bus_vote_data;
>> > +     struct msm_bus_path *usecase = bvd->usecase;
>> > +     struct msm_bus_vectors *vec = usecase[vote].vec;
>> > +     int ddr_rc = 0, cpu_rc = 0;
> 
> Why initialize to 0?

upon error with icc_set_bw(), ddr_rc and cpu_rc will update with 
non-zero
values, which will be further used for error checking.
Hence i initialize to 0. (this check can even done, without 
initialization to 0).

> 
>> > +
>> > +     if (vote != bvd->curr_vote) {
>> > +             spin_unlock_irqrestore(&host->lock, *flags);
>> > +             pr_debug("%s: vote:%d sdhc_ddr ab:%llu ib:%llu cpu_sdhc ab:%llu
>> > ib:%llu\n",
>> > +                             mmc_hostname(host->mmc), vote, vec[0].ab,
>> > +                             vec[0].ib, vec[1].ab, vec[1].ib);
>> > +             ddr_rc = icc_set_bw(bvd->sdhc_ddr, vec[0].ab, vec[0].ib);
>> > +             cpu_rc = icc_set_bw(bvd->cpu_sdhc, vec[1].ab, vec[1].ib);
>> > +             spin_lock_irqsave(&host->lock, *flags);
> 
> This is some tricky spin-lockery.

True. Removed the lock, not required here now.
I will update this in my next patch set.

> 
>> > +             if (ddr_rc || cpu_rc) {
>> > +                     pr_err("%s: icc_set() failed\n",
>> > +                             mmc_hostname(host->mmc));
>> > +                     goto out;
>> > +             }
>> > +             bvd->curr_vote = vote;
>> > +     }
>> > +out:
>> > +     return cpu_rc;
>> > +}
>> > +
>> > +/*
>> > + * Internal work. Work to set 0 bandwidth for msm bus.
>> > + */
>> > +static void sdhci_msm_bus_work(struct work_struct *work)
>> > +{
>> > +     struct sdhci_msm_host *msm_host;
>> > +     struct sdhci_host *host;
>> > +     unsigned long flags;
>> > +
>> > +     msm_host = container_of(work, struct sdhci_msm_host,
>> > +                             bus_vote_work.work);
>> > +     host =  platform_get_drvdata(msm_host->pdev);
>> > +
>> > +     /* Check handle and return */
> 
> This comment is useless, please remove it.

Ok. I will address this in my next patch.

> 
>> > +     if (!msm_host->bus_vote_data->sdhc_ddr ||
>> > +                     !msm_host->bus_vote_data->cpu_sdhc)
>> > +             return;
>> > +     spin_lock_irqsave(&host->lock, flags);
>> > +     /* don't vote for 0 bandwidth if any request is in progress */
>> > +     if (!host->mmc->ongoing_mrq)
>> > +             sdhci_msm_bus_set_vote(msm_host, 0, &flags);
>> > +     else
>> > +             pr_warn("Transfer in progress.Skipping bus voting to 0\n");
> 
> Missing space after the full stop. Also, useless warning so just remove
> it?

Ok. I will address this in my next patch. I will mark it as debug 
instead of warn.
> 
>> > +     spin_unlock_irqrestore(&host->lock, flags);
>> > +}
>> > +
>> > +/*
>> > + * This function cancels any scheduled delayed work and sets the bus
>> > + * vote based on bw (bandwidth) argument.
>> > + */
>> > +static void sdhci_msm_bus_cancel_work_and_set_vote(struct sdhci_host
>> > *host,
>> > +                                             unsigned int bw)
>> > +{
>> > +     int vote;
>> > +     unsigned long flags;
>> > +     struct sdhci_pltfm_host *pltfm_host = sdhci_priv(host);
>> > +     struct sdhci_msm_host *msm_host = sdhci_pltfm_priv(pltfm_host);
>> > +
>> > +     cancel_delayed_work_sync(&msm_host->bus_vote_work);
>> > +     spin_lock_irqsave(&host->lock, flags);
> 
> Why does the lock need to be held? Is the interconnect framework not
> consistent with itself?

Agree. It is not required here, i will address this in my next
patch set.

> 
>> > +     vote = sdhci_msm_bus_get_vote_for_bw(msm_host, bw);
>> > +     sdhci_msm_bus_set_vote(msm_host, vote, &flags);
>> > +     spin_unlock_irqrestore(&host->lock, flags);
>> > +}
>> > +
>> > +
>> > +#define MSM_MMC_BUS_VOTING_DELAY     200 /* msecs */
>> > +#define VOTE_ZERO  0
>> > +
>> > +/* This function queues a work which will set the bandwidth requiement
>> > to 0 */
> 
> This comment style is wrong. Also s/requiement/requirement/

Ok. I will address this in my next patch set.

> 
>> > +static void sdhci_msm_bus_queue_work(struct sdhci_host *host)
>> > +{
>> > +     unsigned long flags;
>> > +     struct sdhci_pltfm_host *pltfm_host = sdhci_priv(host);
>> > +     struct sdhci_msm_host *msm_host = sdhci_pltfm_priv(pltfm_host);
>> > +
>> > +     spin_lock_irqsave(&host->lock, flags);
>> > +     if (msm_host->bus_vote_data->curr_vote != VOTE_ZERO)
>> > +             queue_delayed_work(system_wq,
>> > +                                &msm_host->bus_vote_work,
>> > +                                msecs_to_jiffies(MSM_MMC_BUS_VOTING_DELAY));
>> > +     spin_unlock_irqrestore(&host->lock, flags);
> 
> Ok it seems that the sdhci code isn't consistent with itself?

yes but it is not required to be held it now. I will address this in my
next patch set.

> 
>> > +}
>> > +
>> > +static struct sdhci_msm_bus_vote_data
>> > *sdhci_msm_get_bus_vote_data(struct device
>> > +                                    *dev, struct sdhci_msm_host *host)
>> > +
>> > +{
>> > +     struct platform_device *pdev = to_platform_device(dev);
>> > +     struct device_node *of_node = dev->of_node;
>> > +     struct sdhci_msm_bus_vote_data *bvd = NULL;
>> > +     struct msm_bus_path *usecase = NULL;
>> > +     int ret = 0, i = 0, j, k, num_paths, len;
>> > +     const uint32_t *vec_arr = NULL;
>> > +     bool mem_err = false;
>> > +
>> > +     if (!pdev) {
>> > +             dev_err(dev, "Null platform device!\n");
>> > +             return NULL;
>> > +     }
>> > +
>> > +     bvd = devm_kzalloc(dev, sizeof(struct sdhci_msm_bus_vote_data),
> 
> sizeof(*bvd) is better and shorter!

Agree and will address this in my next path set.

> 
>> > +                             GFP_KERNEL);
>> > +     if (!bvd) {
>> > +             ret = -ENOMEM;
>> > +             dev_err(dev, "No sufficient memory!\n");
> 
> Don't print errors for allocation failures

Ok. I will address this in my next patch set.

> 
>> > +             return bvd;
>> > +     }
>> > +     ret = sdhci_msm_dt_get_array(dev, "qcom,bus-bw-vectors-bps",
>> > +                             &bvd->bw_vecs, &bvd->bw_vecs_size, 0);
>> > +     if (ret) {
>> > +             dev_info(dev, "No dt property of bus bw. voting defined!\n");
>> > +             dev_info(dev, "Skipping Bus BW voting now!!\n");
> 
> Is this debug junk? Why does the user care?

Yes, it is just a debug info. I will mark it as debug and
will address this in my next patch set.

> 
>> > +             host->skip_bus_bw_voting = true;
>> > +             if (ret != -EINVAL && ret != -ENOMEM)
>> > +                     goto free;
>> > +             goto err;
>> > +     }
>> > +
>> > +     ret = of_property_read_string(of_node, "qcom,msm-bus,name",
>> > &bvd->name);
>> > +     if (ret) {
>> > +             dev_err(dev, "Error: (%d) Bus name missing!\n", ret);
>> > +             goto err;
>> > +     }
>> > +
>> > +     ret = of_property_read_u32(of_node, "qcom,msm-bus,num-cases",
>> > +             &bvd->num_usecase);
>> > +     if (ret) {
>> > +             dev_err(dev, "Error: num-usecases not found\n");
>> > +             goto err;
>> > +     }
>> > +
>> > +     usecase = devm_kzalloc(dev, (sizeof(struct msm_bus_path) *
>> > +                                bvd->num_usecase), GFP_KERNEL);
>> > +     if (!usecase)
>> > +             goto err;
>> > +
>> > +     ret = of_property_read_u32(of_node, "qcom,msm-bus,num-paths",
>> > +                                &num_paths);
>> > +     if (ret) {
>> > +             dev_err(dev, "Error: num_paths not found\n");
>> > +             goto out;
>> > +     }
>> > +
>> > +     vec_arr = of_get_property(of_node, "qcom,msm-bus,vectors-KBps",
> 
> Why are all the properties qcom specific?
> 
These are few qcom properties, required for bus bw voting.
Like the num-paths(sdhc-ddr, cpu-sdhc),num-cases like
clock operating frequencies (0,50MHz,200MHz),vectors-KBps to
hold the average and peak bandwidth values.

>> > &len);
>> > +     if (vec_arr == NULL) {
> 
> A more consistent style is if (!vec_arr)

Agree and will address this in my next patch set.

> 
>> > +             dev_err(dev, "Error: Vector array not found\n");
>> > +             goto out;
>> > +     }
>> > +
>> > +     for (i = 0; i < bvd->num_usecase; i++) {
>> > +             usecase[i].num_paths = num_paths;
>> > +             usecase[i].vec = devm_kzalloc(dev, num_paths *
> 
> Use devm_kcalloc().

Ok. I will address this in my next patch set.
> 
>> > +                                           sizeof(struct msm_bus_vectors),
>> > +                                           GFP_KERNEL);
>> > +             if (!usecase[i].vec) {
>> > +                     mem_err = true;
>> > +                     dev_err(dev, "Error: Failed to alloc mem for vectors\n");
>> > +                     goto out;
>> > +             }
>> > +             for (j = 0; j < num_paths; j++) {
>> > +                     int idx = ((i * num_paths) + j) * 2;
>> > +
>> > +                     usecase[i].vec[j].ab = (uint64_t)
>> > +                             be32_to_cpu(vec_arr[idx]);
>> > +                     usecase[i].vec[j].ib = (uint64_t)
>> > +                             be32_to_cpu(vec_arr[idx + 1]);
>> > +             }
>> > +     }
>> > +
>> > +     bvd->usecase = usecase;
>> > +     return bvd;
>> > +out:
>> > +     if (mem_err) {
> 
> Should be possible to not have this flag.

Ok, i will check not to have this flag.
and will address this in my next patch set.

> 
>> > +             for (k = i - 1; k >= 0; k--)
>> > +                     devm_kfree(dev, usecase[k].vec);
>> > +     }
>> > +     devm_kfree(dev, usecase);
>> > +free:
>> > +     devm_kfree(dev, bvd->bw_vecs);
>> > +err:
>> > +     devm_kfree(dev, bvd);
> 
> You don't need to devm_kfree() anything, just let probe fail it.

Agree. Also considering the probe on the existing targets, it should not 
fail.
due to this new bus bw voting.  I will handle accordingly ,to not use 
devm_kfree()
and will address this in my next patch set.
> 
>> > +     bvd = NULL;
>> > +     return bvd;
>> > +}
>> > +
>> > +static int sdhci_msm_bus_register(struct sdhci_msm_host *host,
>> > +                             struct platform_device *pdev)
>> > +{
>> > +     struct sdhci_msm_bus_vote_data *bsd;
>> > +     struct device *dev = &pdev->dev;
>> > +
>> > +     bsd = sdhci_msm_get_bus_vote_data(dev, host);
>> > +     if (!bsd) {
>> > +             dev_err(&pdev->dev, "Failed: getting bus_scale data\n");
>> > +             return PTR_ERR(bsd);
>> > +     }
>> > +     host->bus_vote_data = bsd;
>> > +
>> > +     bsd->sdhc_ddr = of_icc_get(&pdev->dev, SDHC_DDR);
>> > +     if (IS_ERR(bsd->sdhc_ddr)) {
>> > +             dev_err(&pdev->dev, "Error: (%ld) failed getting %s path\n",
> 
> We don't need "Error: " prefix. That's what the kernel log level is 
> for.

Agree. I will address this in my next patch set.

> 
>> > +                     PTR_ERR(bsd->sdhc_ddr), SDHC_DDR);
>> > +             return PTR_ERR(bsd->sdhc_ddr);
>> > +     }
>> > +
>> > +     bsd->cpu_sdhc = of_icc_get(&pdev->dev, CPU_SDHC);
>> > +     if (IS_ERR(bsd->cpu_sdhc)) {
>> > +             dev_err(&pdev->dev, "Error: (%ld) failed getting %s path\n",
>> > +                     PTR_ERR(bsd->cpu_sdhc), CPU_SDHC);
>> > +             return PTR_ERR(bsd->cpu_sdhc);
>> > +     }
>> > +
>> > +     INIT_DELAYED_WORK(&host->bus_vote_work, sdhci_msm_bus_work);
> 
> Why is it in a workqueue context? Is there any reason it can' be done 
> in
> whatever calling context it is?
> 
If is in delayed workqueue context (setting the vote to zero), we can 
reduce the overhead
of calling many involved functions, when there are back to back requests 
for bus bw vote.
This can also improve the device suspend trigger to actual suspend 
latency.

>> > +
>> > +     return 0;
>> > +}
>> > +
>> > +static void sdhci_msm_bus_unregister(struct device *dev,
>> > +                             struct sdhci_msm_host *host)
>> > +{
>> > +     struct sdhci_msm_bus_vote_data *bsd = host->bus_vote_data;
>> > +     int i;
>> > +
>> > +     icc_put(bsd->sdhc_ddr);
>> > +     icc_put(bsd->cpu_sdhc);
> 
> Is there a devm_icc_get() API? If not, please add it and use it.

Do you mean devm_clk_get() ? i didn't find any API with name 
devm_icc_get().
Can you please elaborate more on this ?

> 
>> > +
>> > +     for (i = 0; i < bsd->num_usecase; i++)
>> > +             devm_kfree(dev, bsd->usecase[i].vec);
>> > +     devm_kfree(dev, bsd->usecase);
>> > +     devm_kfree(dev, bsd->bw_vecs);
>> > +     devm_kfree(dev, bsd);
> 
> Again, not sure we need any devm_kfree() stuff.

Agree. I will address this in my next patch set.

> 
>> > +}
>> > +
>> > +static void sdhci_msm_bus_voting(struct sdhci_host *host, u32 enable)
>> > +{
>> > +     struct mmc_ios *ios = &host->mmc->ios;
>> > +     unsigned int bw;
>> > +
>> > +     bw = sdhci_get_bw_required(host, ios);
>> > +     if (enable)
>> > +             sdhci_msm_bus_cancel_work_and_set_vote(host, bw);
>> > +     else
>> > +             sdhci_msm_bus_queue_work(host);
>> > +}
>> > +
>> >  static const struct sdhci_msm_variant_ops mci_var_ops = {
>> >       .msm_readl_relaxed = sdhci_msm_mci_variant_readl_relaxed,
>> >       .msm_writel_relaxed = sdhci_msm_mci_variant_writel_relaxed,
>> > @@ -1839,6 +2210,13 @@ static int sdhci_msm_probe(struct
>> > platform_device *pdev)
>> >               dev_warn(&pdev->dev, "TCXO clk not present (%d)\n", ret);
>> >       }
>> >
>> > +     ret = sdhci_msm_bus_register(msm_host, pdev);
>> > +     if (ret && !msm_host->skip_bus_bw_voting)
> 
> Can this be a check for a NULL icc handle instead of the bool?

Considering the support of bus bandwidth on the existing devices,
this bool check will help the device probe for its continuity or fail.
Hence this check is used instead of NULL icc handle.
Any how the NULL icc handle check is added in the bus bw vote setting.
