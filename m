Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D38FFAC1C7
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Sep 2019 23:02:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732994AbfIFVCx (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 6 Sep 2019 17:02:53 -0400
Received: from mail.kernel.org ([198.145.29.99]:57098 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725872AbfIFVCx (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 6 Sep 2019 17:02:53 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 0A96C21670;
        Fri,  6 Sep 2019 21:02:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1567803771;
        bh=vu/Y9mQ/3tPKAso8nFZd03gvXtZR6ZBsMNYJ09MsYdA=;
        h=In-Reply-To:References:To:From:Cc:Subject:Date:From;
        b=Cy1heF5xr8THKcx7wgy45QyPhO5UE4X7BDXhAqLGWx5hRIaAuClkAdb+TSbS8sSrh
         U+eO4OurktWAa74KGv9ZBKy26R0af3RerK0H2kLWoVAea2YAN+d/QkVumhVTppixoc
         bQGtH7AEcf9Q1RRYYob9eRJ/ZcEUNizU/8/ZL2CY=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <ae24703de33d4049c451dd4a331f7a5f@codeaurora.org>
References: <1567774037-2344-1-git-send-email-ppvk@codeaurora.org> <1567774037-2344-2-git-send-email-ppvk@codeaurora.org> <ae24703de33d4049c451dd4a331f7a5f@codeaurora.org>
To:     adrian.hunter@intel.com, georgi.djakov@linaro.org,
        ppvk@codeaurora.org, robh+dt@kernel.org, ulf.hansson@linaro.org
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     asutoshd@codeaurora.org, vbadigan@codeaurora.org,
        stummala@codeaurora.org, sayalil@codeaurora.org,
        rampraka@codeaurora.org, linux-mmc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org,
        Subhash Jadavani <subhashj@codeaurora.org>,
        Andy Gross <agross@kernel.org>
Subject: Re: [RFC 1/2] mmc: sdhci-msm: Add support for bus bandwidth voting
User-Agent: alot/0.8.1
Date:   Fri, 06 Sep 2019 14:02:50 -0700
Message-Id: <20190906210251.0A96C21670@mail.kernel.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting ppvk@codeaurora.org (2019-09-06 05:51:54)
> +Georgi Djakov
>=20
> On 2019-09-06 18:17, Pradeep P V K wrote:
> > diff --git a/drivers/mmc/host/sdhci-msm.c=20
> > b/drivers/mmc/host/sdhci-msm.c
> > index b75c82d..71515ca 100644
> > --- a/drivers/mmc/host/sdhci-msm.c
> > +++ b/drivers/mmc/host/sdhci-msm.c
> >  #define msm_host_writel(msm_host, val, host, offset) \
> >       msm_host->var_ops->msm_writel_relaxed(val, host, offset)
> >=20
> > +#define SDHC_DDR "sdhc-ddr"
> > +#define CPU_SDHC "cpu-sdhc"

Do you really need these defines? They're not used more than once or
twice and just seem to make the code harder to read.

> > +
> >  struct sdhci_msm_offset {
> >       u32 core_hc_mode;
> >       u32 core_mci_data_cnt;
> > @@ -228,6 +232,31 @@ struct sdhci_msm_variant_info {
> >       const struct sdhci_msm_offset *offset;
> >  };
> >=20
> > +struct msm_bus_vectors {
> > +     uint64_t ab;
> > +     uint64_t ib;
> > +};
> > +
> > +struct msm_bus_path {
> > +     unsigned int num_paths;
> > +     struct msm_bus_vectors *vec;
> > +};
> > +
> > +struct sdhci_msm_bus_vote_data {
> > +     const char *name;
> > +     unsigned int num_usecase;
> > +     struct msm_bus_path *usecase;
> > +
> > +     unsigned int *bw_vecs;
> > +     unsigned int bw_vecs_size;
> > +
> > +     struct icc_path *sdhc_ddr;
> > +     struct icc_path *cpu_sdhc;
> > +
> > +     uint32_t curr_vote;
> > +

Please use u32 instead of uint32_t. Same comment for u64.

> > +};
> > +
> >  struct sdhci_msm_host {
> >       struct platform_device *pdev;
> >       void __iomem *core_mem; /* MSM SDCC mapped address */
> > @@ -1678,6 +1714,341 @@ static void
> > sdhci_msm_set_regulator_caps(struct sdhci_msm_host *msm_host)
> >       pr_debug("%s: supported caps: 0x%08x\n", mmc_hostname(mmc), caps);
> >  }
> >=20
> > +static int sdhci_msm_dt_get_array(struct device *dev, const char=20
> > *prop_name,
> > +                              u32 **bw_vecs, int *len, u32 size)
> > +{
> > +     int ret =3D 0;
> > +     struct device_node *np =3D dev->of_node;
> > +     size_t sz;
> > +     u32 *arr =3D NULL;
> > +
> > +     if (!of_get_property(np, prop_name, len)) {
> > +             ret =3D -EINVAL;
> > +             goto out;
> > +     }
> > +     sz =3D *len =3D *len / sizeof(*arr);
> > +     if (sz <=3D 0 || (size > 0 && (sz > size))) {
> > +             dev_err(dev, "%s invalid size\n", prop_name);
> > +             ret =3D -EINVAL;
> > +             goto out;
> > +     }
> > +
> > +     arr =3D devm_kzalloc(dev, sz * sizeof(*arr), GFP_KERNEL);
> > +     if (!arr) {
> > +             ret =3D -ENOMEM;
> > +             goto out;
> > +     }
> > +
> > +     ret =3D of_property_read_u32_array(np, prop_name, arr, sz);
> > +     if (ret < 0) {
> > +             dev_err(dev, "%s failed reading array %d\n", prop_name, r=
et);
> > +             goto out;
> > +     }
> > +     *bw_vecs =3D arr;
> > +out:
> > +     if (ret)
> > +             *len =3D 0;
> > +     return ret;
> > +}
> > +
> > +/* Returns required bandwidth in Bytes per Sec */
> > +static unsigned long sdhci_get_bw_required(struct sdhci_host *host,
> > +                                     struct mmc_ios *ios)
> > +{
> > +     unsigned long bw;
> > +     struct sdhci_pltfm_host *pltfm_host =3D sdhci_priv(host);
> > +     struct sdhci_msm_host *msm_host =3D sdhci_pltfm_priv(pltfm_host);
> > +
> > +     bw =3D msm_host->clk_rate;
> > +
> > +     if (ios->bus_width =3D=3D MMC_BUS_WIDTH_4)
> > +             bw /=3D 2;
> > +     else if (ios->bus_width =3D=3D MMC_BUS_WIDTH_1)
> > +             bw /=3D 8;
> > +
> > +     return bw;
> > +}
> > +
> > +static int sdhci_msm_bus_get_vote_for_bw(struct sdhci_msm_host *host,
> > +                                        unsigned int bw)
> > +{
> > +     struct sdhci_msm_bus_vote_data *bvd =3D host->bus_vote_data;
> > +
> > +     unsigned int *table =3D bvd->bw_vecs;

Should probably be a const bw_vecs pointer so that it can't be modified
after the fact.

> > +     unsigned int size =3D bvd->bw_vecs_size;
> > +     int i;
> > +
> > +     for (i =3D 0; i < size; i++) {
> > +             if (bw <=3D table[i])
> > +                     break;

return i;

> > +     }
> > +

return i - 1;

> > +     if (i && (i =3D=3D size))
> > +             i--;
> > +
> > +     return i;

And then this is useless.....

> > +}
> > +
> > +/*
> > + * This function must be called with host lock acquired.
> > + * Caller of this function should also ensure that msm bus client
> > + * handle is not null.

If it was NULL it would be pretty sad.

> > + */
> > +static inline int sdhci_msm_bus_set_vote(struct sdhci_msm_host=20
> > *msm_host,
> > +                                          int vote,
> > +                                          unsigned long *flags)
> > +{
> > +     struct sdhci_host *host =3D  platform_get_drvdata(msm_host->pdev);
> > +     struct sdhci_msm_bus_vote_data *bvd =3D msm_host->bus_vote_data;
> > +     struct msm_bus_path *usecase =3D bvd->usecase;
> > +     struct msm_bus_vectors *vec =3D usecase[vote].vec;
> > +     int ddr_rc =3D 0, cpu_rc =3D 0;

Why initialize to 0?

> > +
> > +     if (vote !=3D bvd->curr_vote) {
> > +             spin_unlock_irqrestore(&host->lock, *flags);
> > +             pr_debug("%s: vote:%d sdhc_ddr ab:%llu ib:%llu cpu_sdhc a=
b:%llu=20
> > ib:%llu\n",
> > +                             mmc_hostname(host->mmc), vote, vec[0].ab,
> > +                             vec[0].ib, vec[1].ab, vec[1].ib);
> > +             ddr_rc =3D icc_set_bw(bvd->sdhc_ddr, vec[0].ab, vec[0].ib=
);
> > +             cpu_rc =3D icc_set_bw(bvd->cpu_sdhc, vec[1].ab, vec[1].ib=
);
> > +             spin_lock_irqsave(&host->lock, *flags);

This is some tricky spin-lockery.

> > +             if (ddr_rc || cpu_rc) {
> > +                     pr_err("%s: icc_set() failed\n",
> > +                             mmc_hostname(host->mmc));
> > +                     goto out;
> > +             }
> > +             bvd->curr_vote =3D vote;
> > +     }
> > +out:
> > +     return cpu_rc;
> > +}
> > +
> > +/*
> > + * Internal work. Work to set 0 bandwidth for msm bus.
> > + */
> > +static void sdhci_msm_bus_work(struct work_struct *work)
> > +{
> > +     struct sdhci_msm_host *msm_host;
> > +     struct sdhci_host *host;
> > +     unsigned long flags;
> > +
> > +     msm_host =3D container_of(work, struct sdhci_msm_host,
> > +                             bus_vote_work.work);
> > +     host =3D  platform_get_drvdata(msm_host->pdev);
> > +
> > +     /* Check handle and return */

This comment is useless, please remove it.

> > +     if (!msm_host->bus_vote_data->sdhc_ddr ||
> > +                     !msm_host->bus_vote_data->cpu_sdhc)
> > +             return;
> > +     spin_lock_irqsave(&host->lock, flags);
> > +     /* don't vote for 0 bandwidth if any request is in progress */
> > +     if (!host->mmc->ongoing_mrq)
> > +             sdhci_msm_bus_set_vote(msm_host, 0, &flags);
> > +     else
> > +             pr_warn("Transfer in progress.Skipping bus voting to 0\n"=
);

Missing space after the full stop. Also, useless warning so just remove
it?

> > +     spin_unlock_irqrestore(&host->lock, flags);
> > +}
> > +
> > +/*
> > + * This function cancels any scheduled delayed work and sets the bus
> > + * vote based on bw (bandwidth) argument.
> > + */
> > +static void sdhci_msm_bus_cancel_work_and_set_vote(struct sdhci_host=20
> > *host,
> > +                                             unsigned int bw)
> > +{
> > +     int vote;
> > +     unsigned long flags;
> > +     struct sdhci_pltfm_host *pltfm_host =3D sdhci_priv(host);
> > +     struct sdhci_msm_host *msm_host =3D sdhci_pltfm_priv(pltfm_host);
> > +
> > +     cancel_delayed_work_sync(&msm_host->bus_vote_work);
> > +     spin_lock_irqsave(&host->lock, flags);

Why does the lock need to be held? Is the interconnect framework not
consistent with itself?

> > +     vote =3D sdhci_msm_bus_get_vote_for_bw(msm_host, bw);
> > +     sdhci_msm_bus_set_vote(msm_host, vote, &flags);
> > +     spin_unlock_irqrestore(&host->lock, flags);
> > +}
> > +
> > +
> > +#define MSM_MMC_BUS_VOTING_DELAY     200 /* msecs */
> > +#define VOTE_ZERO  0
> > +
> > +/* This function queues a work which will set the bandwidth requiement=
=20
> > to 0 */

This comment style is wrong. Also s/requiement/requirement/

> > +static void sdhci_msm_bus_queue_work(struct sdhci_host *host)
> > +{
> > +     unsigned long flags;
> > +     struct sdhci_pltfm_host *pltfm_host =3D sdhci_priv(host);
> > +     struct sdhci_msm_host *msm_host =3D sdhci_pltfm_priv(pltfm_host);
> > +
> > +     spin_lock_irqsave(&host->lock, flags);
> > +     if (msm_host->bus_vote_data->curr_vote !=3D VOTE_ZERO)
> > +             queue_delayed_work(system_wq,
> > +                                &msm_host->bus_vote_work,
> > +                                msecs_to_jiffies(MSM_MMC_BUS_VOTING_DE=
LAY));
> > +     spin_unlock_irqrestore(&host->lock, flags);

Ok it seems that the sdhci code isn't consistent with itself?

> > +}
> > +
> > +static struct sdhci_msm_bus_vote_data
> > *sdhci_msm_get_bus_vote_data(struct device
> > +                                    *dev, struct sdhci_msm_host *host)
> > +
> > +{
> > +     struct platform_device *pdev =3D to_platform_device(dev);
> > +     struct device_node *of_node =3D dev->of_node;
> > +     struct sdhci_msm_bus_vote_data *bvd =3D NULL;
> > +     struct msm_bus_path *usecase =3D NULL;
> > +     int ret =3D 0, i =3D 0, j, k, num_paths, len;
> > +     const uint32_t *vec_arr =3D NULL;
> > +     bool mem_err =3D false;
> > +
> > +     if (!pdev) {
> > +             dev_err(dev, "Null platform device!\n");
> > +             return NULL;
> > +     }
> > +
> > +     bvd =3D devm_kzalloc(dev, sizeof(struct sdhci_msm_bus_vote_data),

sizeof(*bvd) is better and shorter!

> > +                             GFP_KERNEL);
> > +     if (!bvd) {
> > +             ret =3D -ENOMEM;
> > +             dev_err(dev, "No sufficient memory!\n");

Don't print errors for allocation failures

> > +             return bvd;
> > +     }
> > +     ret =3D sdhci_msm_dt_get_array(dev, "qcom,bus-bw-vectors-bps",
> > +                             &bvd->bw_vecs, &bvd->bw_vecs_size, 0);
> > +     if (ret) {
> > +             dev_info(dev, "No dt property of bus bw. voting defined!\=
n");
> > +             dev_info(dev, "Skipping Bus BW voting now!!\n");

Is this debug junk? Why does the user care?

> > +             host->skip_bus_bw_voting =3D true;
> > +             if (ret !=3D -EINVAL && ret !=3D -ENOMEM)
> > +                     goto free;
> > +             goto err;
> > +     }
> > +
> > +     ret =3D of_property_read_string(of_node, "qcom,msm-bus,name",=20
> > &bvd->name);
> > +     if (ret) {
> > +             dev_err(dev, "Error: (%d) Bus name missing!\n", ret);
> > +             goto err;
> > +     }
> > +
> > +     ret =3D of_property_read_u32(of_node, "qcom,msm-bus,num-cases",
> > +             &bvd->num_usecase);
> > +     if (ret) {
> > +             dev_err(dev, "Error: num-usecases not found\n");
> > +             goto err;
> > +     }
> > +
> > +     usecase =3D devm_kzalloc(dev, (sizeof(struct msm_bus_path) *
> > +                                bvd->num_usecase), GFP_KERNEL);
> > +     if (!usecase)
> > +             goto err;
> > +
> > +     ret =3D of_property_read_u32(of_node, "qcom,msm-bus,num-paths",
> > +                                &num_paths);
> > +     if (ret) {
> > +             dev_err(dev, "Error: num_paths not found\n");
> > +             goto out;
> > +     }
> > +
> > +     vec_arr =3D of_get_property(of_node, "qcom,msm-bus,vectors-KBps",=
=20

Why are all the properties qcom specific?

> > &len);
> > +     if (vec_arr =3D=3D NULL) {

A more consistent style is if (!vec_arr)

> > +             dev_err(dev, "Error: Vector array not found\n");
> > +             goto out;
> > +     }
> > +
> > +     for (i =3D 0; i < bvd->num_usecase; i++) {
> > +             usecase[i].num_paths =3D num_paths;
> > +             usecase[i].vec =3D devm_kzalloc(dev, num_paths *

Use devm_kcalloc().

> > +                                           sizeof(struct msm_bus_vecto=
rs),
> > +                                           GFP_KERNEL);
> > +             if (!usecase[i].vec) {
> > +                     mem_err =3D true;
> > +                     dev_err(dev, "Error: Failed to alloc mem for vect=
ors\n");
> > +                     goto out;
> > +             }
> > +             for (j =3D 0; j < num_paths; j++) {
> > +                     int idx =3D ((i * num_paths) + j) * 2;
> > +
> > +                     usecase[i].vec[j].ab =3D (uint64_t)
> > +                             be32_to_cpu(vec_arr[idx]);
> > +                     usecase[i].vec[j].ib =3D (uint64_t)
> > +                             be32_to_cpu(vec_arr[idx + 1]);
> > +             }
> > +     }
> > +
> > +     bvd->usecase =3D usecase;
> > +     return bvd;
> > +out:
> > +     if (mem_err) {

Should be possible to not have this flag.

> > +             for (k =3D i - 1; k >=3D 0; k--)
> > +                     devm_kfree(dev, usecase[k].vec);
> > +     }
> > +     devm_kfree(dev, usecase);
> > +free:
> > +     devm_kfree(dev, bvd->bw_vecs);
> > +err:
> > +     devm_kfree(dev, bvd);

You don't need to devm_kfree() anything, just let probe fail it.

> > +     bvd =3D NULL;
> > +     return bvd;
> > +}
> > +
> > +static int sdhci_msm_bus_register(struct sdhci_msm_host *host,
> > +                             struct platform_device *pdev)
> > +{
> > +     struct sdhci_msm_bus_vote_data *bsd;
> > +     struct device *dev =3D &pdev->dev;
> > +
> > +     bsd =3D sdhci_msm_get_bus_vote_data(dev, host);
> > +     if (!bsd) {
> > +             dev_err(&pdev->dev, "Failed: getting bus_scale data\n");
> > +             return PTR_ERR(bsd);
> > +     }
> > +     host->bus_vote_data =3D bsd;
> > +
> > +     bsd->sdhc_ddr =3D of_icc_get(&pdev->dev, SDHC_DDR);
> > +     if (IS_ERR(bsd->sdhc_ddr)) {
> > +             dev_err(&pdev->dev, "Error: (%ld) failed getting %s path\=
n",

We don't need "Error: " prefix. That's what the kernel log level is for.

> > +                     PTR_ERR(bsd->sdhc_ddr), SDHC_DDR);
> > +             return PTR_ERR(bsd->sdhc_ddr);
> > +     }
> > +
> > +     bsd->cpu_sdhc =3D of_icc_get(&pdev->dev, CPU_SDHC);
> > +     if (IS_ERR(bsd->cpu_sdhc)) {
> > +             dev_err(&pdev->dev, "Error: (%ld) failed getting %s path\=
n",
> > +                     PTR_ERR(bsd->cpu_sdhc), CPU_SDHC);
> > +             return PTR_ERR(bsd->cpu_sdhc);
> > +     }
> > +
> > +     INIT_DELAYED_WORK(&host->bus_vote_work, sdhci_msm_bus_work);

Why is it in a workqueue context? Is there any reason it can' be done in
whatever calling context it is?

> > +
> > +     return 0;
> > +}
> > +
> > +static void sdhci_msm_bus_unregister(struct device *dev,
> > +                             struct sdhci_msm_host *host)
> > +{
> > +     struct sdhci_msm_bus_vote_data *bsd =3D host->bus_vote_data;
> > +     int i;
> > +
> > +     icc_put(bsd->sdhc_ddr);
> > +     icc_put(bsd->cpu_sdhc);

Is there a devm_icc_get() API? If not, please add it and use it.

> > +
> > +     for (i =3D 0; i < bsd->num_usecase; i++)
> > +             devm_kfree(dev, bsd->usecase[i].vec);
> > +     devm_kfree(dev, bsd->usecase);
> > +     devm_kfree(dev, bsd->bw_vecs);
> > +     devm_kfree(dev, bsd);

Again, not sure we need any devm_kfree() stuff.

> > +}
> > +
> > +static void sdhci_msm_bus_voting(struct sdhci_host *host, u32 enable)
> > +{
> > +     struct mmc_ios *ios =3D &host->mmc->ios;
> > +     unsigned int bw;
> > +
> > +     bw =3D sdhci_get_bw_required(host, ios);
> > +     if (enable)
> > +             sdhci_msm_bus_cancel_work_and_set_vote(host, bw);
> > +     else
> > +             sdhci_msm_bus_queue_work(host);
> > +}
> > +
> >  static const struct sdhci_msm_variant_ops mci_var_ops =3D {
> >       .msm_readl_relaxed =3D sdhci_msm_mci_variant_readl_relaxed,
> >       .msm_writel_relaxed =3D sdhci_msm_mci_variant_writel_relaxed,
> > @@ -1839,6 +2210,13 @@ static int sdhci_msm_probe(struct=20
> > platform_device *pdev)
> >               dev_warn(&pdev->dev, "TCXO clk not present (%d)\n", ret);
> >       }
> >=20
> > +     ret =3D sdhci_msm_bus_register(msm_host, pdev);
> > +     if (ret && !msm_host->skip_bus_bw_voting)

Can this be a check for a NULL icc handle instead of the bool?

