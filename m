Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 84E1435706C
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 Apr 2021 17:35:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243426AbhDGPfr (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 7 Apr 2021 11:35:47 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:41527 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S242421AbhDGPfq (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 7 Apr 2021 11:35:46 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1617809737; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=nd57I/K2A3dpSnUNYDp++raVjkKKSdKT7SxaZpZvh5w=;
 b=W5OSuQfS9rH/wNfrif4x/fT2Fa56DldxA/+KgVgpARA3OOtJPoHJaHvuf/Ydix9nXnA4tVzF
 Dvx9UMtU8TYiqR9YGn/Ppx2MrZ25vqTswbLXRPAQQBUOozblse/ImJ1jdxzwMYVsmJIFy89D
 gd9SUqzhDgNEqd5e8wURl67bdlA=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n03.prod.us-east-1.postgun.com with SMTP id
 606dd14803cfff3452d577ec (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 07 Apr 2021 15:35:36
 GMT
Sender: schowdhu=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id B9E8CC43463; Wed,  7 Apr 2021 15:35:35 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: schowdhu)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id EFB2DC433C6;
        Wed,  7 Apr 2021 15:35:33 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Wed, 07 Apr 2021 21:05:33 +0530
From:   schowdhu@codeaurora.org
To:     Stephen Boyd <swboyd@chromium.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
        Sibi Sankar <sibis@codeaurora.org>,
        Rajendra Nayak <rnayak@codeaurora.org>, vkoul@kernel.org
Subject: Re: [PATCH V2 2/5] soc: qcom: dcc: Add driver support for Data
 Capture and Compare unit(DCC)
In-Reply-To: <161732463842.2260335.16117110131113613939@swboyd.mtv.corp.google.com>
References: <cover.1616651305.git.schowdhu@codeaurora.org>
 <dc058ed6d05f1aec4e97fee6d4c007abdf3b54a0.1616651305.git.schowdhu@codeaurora.org>
 <161704834593.3012082.17486072850156076295@swboyd.mtv.corp.google.com>
 <326da78181b566ee7d48683d68bb89d7@codeaurora.org>
 <161732463842.2260335.16117110131113613939@swboyd.mtv.corp.google.com>
Message-ID: <189ed453f5f25c6be9a0b4519cbac0eb@codeaurora.org>
X-Sender: schowdhu@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2021-04-02 06:20, Stephen Boyd wrote:
> Quoting schowdhu@codeaurora.org (2021-04-01 07:04:07)
>> On 2021-03-30 01:35, Stephen Boyd wrote:
>> > Quoting Souradeep Chowdhury (2021-03-25 01:02:33)
>> >> diff --git a/drivers/soc/qcom/dcc.c b/drivers/soc/qcom/dcc.c
>> >> new file mode 100644
>> >> index 0000000..a55d8ca7
>> >> --- /dev/null
>> >> +++ b/drivers/soc/qcom/dcc.c
>> >> @@ -0,0 +1,1549 @@
> [..]
>> >
>> >> +       void __iomem            *base;
>> >> +       u32                     reg_size;
>> >> +       struct device           *dev;
>> >> +       struct mutex            mutex;
>> >
>> > In particular what this mutex is protecting.
>> 
>> Ack. The mutex is used to protect the access as well as manipulation 
>> of
>> the main instance of dcc_drvdata structure
>> initialized during probe time. This structure contains the useful 
>> driver
>> data information and is set using the call
>> platform_set_drvdata(pdev, drvdata) which links this data to the
>> platform device and hence needs to be protected via
>> mutex locks. The same convention is followed across other similar
>> drivers exposing userspace like the llcc driver.
> 
> The region that the mutex is protecting seems quite large. That's
> probably because I don't understand the driver.
> 
>> >
>> >> +
>> >> +       mutex_lock(&drvdata->mutex);
>> >> +
>> >> +       for (curr_list = 0; curr_list < drvdata->nr_link_list;
>> >> curr_list++) {
>> >> +               if (!drvdata->enable[curr_list])
>> >> +                       continue;
>> >> +               ll_cfg = dcc_readl(drvdata, DCC_LL_CFG(curr_list));
>> >> +               tmp_ll_cfg = ll_cfg & ~BIT(9);
>> >> +               dcc_writel(drvdata, tmp_ll_cfg,
>> >> DCC_LL_CFG(curr_list));
>> >> +               dcc_writel(drvdata, 1, DCC_LL_SW_TRIGGER(curr_list));
>> >> +               dcc_writel(drvdata, ll_cfg, DCC_LL_CFG(curr_list));
>> >> +       }
>> >
>> > Does the mutex need to be held while waiting for ready?
>> 
>> Yes, to maintain consistency because inside the dcc_ready function,
>> there is access to dcc_drvdata structure set
>> on the platform device.
> 
> Is the drvdata going to be modified somewhere else?

Ack. Not considering holding mutex locks for Read operations.

> 
>> >> +
>> >> +               dev_info(drvdata->dev, "All values written to
>> >> enable.\n");
>> >
>> > Debug print?
>> 
>> Ack
>> 
>> >
>> >> +               /* Make sure all config is written in sram */
>> >> +               mb();
>> >
>> > This won't work as intended.
>> 
>> This was called to prevent instruction reordering if the driver runs 
>> on
>> multiple
>> CPU cores. As the hardware manipulation has to be done sequentially
>> before the
>> trigger is set. Kindly let me know the concern in this case.
> 
> Device I/O with the proper accessors is sequential even if the process
> moves to a different CPU. Is that what you're worried about? The 
> comment
> says "make sure it is written to sram", which should be achieved by
> reading some register back from the device after all the writes so that
> the driver knows the writes have been posted to the device. I believe
> this mb() is doing nothing.

Ack

> 
>> 
>> >
>> >> +
>> >> +               drvdata->enable[list] = true;
>> >> +
>> >> +               /* 5. Configure trigger */
>> >> +               dcc_writel(drvdata, BIT(9), DCC_LL_CFG(list));
>> >> +       }
>> >> +
>> >> +err:
>> >> +       mutex_unlock(&drvdata->mutex);
>> >> +       return ret;
>> >> +}
>> >> +
>> >> +static void dcc_disable(struct dcc_drvdata *drvdata)
>> >> +{
>> >> +       int curr_list;
>> >> +
>> >> +       mutex_lock(&drvdata->mutex);
>> >> +
>> >> +       if (!dcc_ready(drvdata))
>> >> +               dev_err(drvdata->dev, "DCC is not ready Disabling
>> >> DCC...\n");
>> >
>> > Is that two sentences? And a debug print?
>> 
>> Ack.
>> 
>> >
>> >> +
>> >> +       for (curr_list = 0; curr_list < drvdata->nr_link_list;
>> >> curr_list++) {
>> >> +               if (!drvdata->enable[curr_list])
>> >> +                       continue;
>> >> +               dcc_writel(drvdata, 0, DCC_LL_CFG(curr_list));
>> >> +               dcc_writel(drvdata, 0, DCC_LL_BASE(curr_list));
>> >> +               dcc_writel(drvdata, 0, DCC_FD_BASE(curr_list));
>> >> +               dcc_writel(drvdata, 0, DCC_LL_LOCK(curr_list));
>> >> +               drvdata->enable[curr_list] = false;
>> >> +       }
>> >> +       memset_io(drvdata->ram_base, 0, drvdata->ram_size);
>> >> +       drvdata->ram_cfg = 0;
>> >> +       drvdata->ram_start = 0;
>> >> +       mutex_unlock(&drvdata->mutex);
>> >> +}
>> >> +
>> >> +static ssize_t curr_list_show(struct device *dev,
>> >> +       struct device_attribute *attr, char *buf)
>> >> +{
>> >> +       int ret;
>> >> +       struct dcc_drvdata *drvdata = dev_get_drvdata(dev);
>> >> +
>> >> +       mutex_lock(&drvdata->mutex);
>> >> +       if (drvdata->curr_list == DCC_INVALID_LINK_LIST) {
>> >> +               dev_err(dev, "curr_list is not set.\n");
>> >> +               ret = -EINVAL;
>> >> +               goto err;
>> >> +       }
>> >> +
>> >> +       ret = scnprintf(buf, PAGE_SIZE, "%d\n", drvdata->curr_list);
>> >> +err:
>> >> +       mutex_unlock(&drvdata->mutex);
>> >> +       return ret;
>> >> +}
>> >> +
>> >> +static ssize_t curr_list_store(struct device *dev,
>> >> +                                               struct
>> >> device_attribute *attr,
>> >> +                                               const char *buf,
>> >> size_t size)
>> >> +{
>> >> +       struct dcc_drvdata *drvdata = dev_get_drvdata(dev);
>> >> +       unsigned long val;
>> >> +       u32 lock_reg;
>> >> +       bool dcc_enable = false;
>> >> +
>> >> +       if (kstrtoul(buf, 16, &val))
>> >> +               return -EINVAL;
>> >> +
>> >> +       if (val >= drvdata->nr_link_list)
>> >> +               return -EINVAL;
>> >> +
>> >> +       mutex_lock(&drvdata->mutex);
>> >> +
>> >> +       dcc_enable = is_dcc_enabled(drvdata);
>> >> +       if (drvdata->curr_list != DCC_INVALID_LINK_LIST && dcc_enable)
>> >> {
>> >> +               dev_err(drvdata->dev, "DCC is enabled, please disable
>> >> it first.\n");
>> >> +               mutex_unlock(&drvdata->mutex);
>> >> +               return -EINVAL;
>> >> +       }
>> >> +
>> >> +       lock_reg = dcc_readl(drvdata, DCC_LL_LOCK(val));
>> >> +       if (lock_reg & 0x1) {
>> >> +               dev_err(drvdata->dev, "DCC linked list is already
>> >> configured\n");
>> >> +               mutex_unlock(&drvdata->mutex);
>> >> +               return -EINVAL;
>> >> +       }
>> >> +       drvdata->curr_list = val;
>> >> +       mutex_unlock(&drvdata->mutex);
>> >> +
>> >> +       return size;
>> >> +}
>> >> +
>> >> +static DEVICE_ATTR_RW(curr_list);
>> >> +
>> >> +
>> >> +static ssize_t trigger_store(struct device *dev,
>> >> +                                       struct device_attribute *attr,
>> >> +                                       const char *buf, size_t size)
>> >> +{
>> >> +       int ret = 0;
>> >> +       unsigned long val;
>> >> +       struct dcc_drvdata *drvdata = dev_get_drvdata(dev);
>> >> +
>> >> +       if (kstrtoul(buf, 16, &val))
>> >> +               return -EINVAL;
>> >> +       if (val != 1)
>> >> +               return -EINVAL;
>> >> +
>> >> +       ret = dcc_sw_trigger(drvdata);
>> >> +       if (!ret)
>> >> +               ret = size;
>> >> +
>> >> +       return ret;
>> >> +}
>> >> +static DEVICE_ATTR_WO(trigger);
>> >> +
>> >> +static ssize_t enable_show(struct device *dev,
>> >> +       struct device_attribute *attr, char *buf)
>> >> +{
>> >> +       int ret;
>> >> +       bool dcc_enable = false;
>> >> +       struct dcc_drvdata *drvdata = dev_get_drvdata(dev);
>> >> +
>> >> +       mutex_lock(&drvdata->mutex);
>> >> +       if (drvdata->curr_list >= drvdata->nr_link_list) {
>> >> +               dev_err(dev, "Select link list to program using
>> >> curr_list\n");
>> >> +               ret = -EINVAL;
>> >> +               goto err;
>> >> +       }
>> >> +
>> >> +       dcc_enable = is_dcc_enabled(drvdata);
>> >> +
>> >> +       ret = scnprintf(buf, PAGE_SIZE, "%u\n",
>> >> +                               (unsigned int)dcc_enable);
>> >> +err:
>> >> +       mutex_unlock(&drvdata->mutex);
>> >
>> > What does the mutex being held serve here?
>> 
>> As mentioned earlier, the mutex has been used while accessing
>> dcc_drvdata structure.
>> 
> 
> And what purpose does it serve? I suppose curr_list can be modified? 
> But
> then when this function returns it could be disabled before userspace
> sees the value so I'm still lost why we care to hold the lock this 
> long.

Ack.

> 
>> >
>> >> +       return ret;
>> >> +}
>> >> +
>> >> +static ssize_t enable_store(struct device *dev,
>> >> +                               struct device_attribute *attr,
>> >> +                               const char *buf, size_t size)
>> >> +{
>> >> +       int ret = 0;
>> >> +       unsigned long val;
>> >> +       struct dcc_drvdata *drvdata = dev_get_drvdata(dev);
>> >> +
>> >> +       if (kstrtoul(buf, 16, &val))
>> >> +               return -EINVAL;
>> >> +
>> >> +       if (val)
>> >> +               ret = dcc_enable(drvdata);
>> >> +       else
>> >> +               dcc_disable(drvdata);
>> >> +
>> >> +       if (!ret)
>> >> +               ret = size;
>> >> +
>> >> +       return ret;
>> >> +
>> >> +}
>> >> +
>> >> +static DEVICE_ATTR_RW(enable);
>> >> +
>> >> +static ssize_t config_show(struct device *dev,
>> >> +       struct device_attribute *attr, char *buf)
>> >> +{
>> >> +       struct dcc_drvdata *drvdata = dev_get_drvdata(dev);
>> >> +       struct dcc_config_entry *entry;
>> >> +       char local_buf[64];
>> >> +       int len = 0, count = 0;
>> >> +
>> >> +       buf[0] = '\0';
>> >
>> > Why?
>> 
>> The strlcat function is used here to concatenate the buffer with the
>> config values.
>> The strlcat function in C needs a NULL terminated string both as it's
>> source and
>> destination. That's why this has been initialized with NULL 
>> termination.
>> 
> 
> sysfs files shall be one value per file, i.e. something that a machine
> reads. This function looks like a debugfs function.

Ack

> 
>> 
>> >
>> >> +
>> >> +       mutex_lock(&drvdata->mutex);
>> >> +       if (drvdata->curr_list >= drvdata->nr_link_list) {
>> >> +               dev_err(dev, "Select link list to program using
>> >> curr_list\n");
>> >> +               count = -EINVAL;
>> >> +               goto err;
>> >> +       }
>> >> +
>> >> +       list_for_each_entry(entry,
>> >> +       &drvdata->cfg_head[drvdata->curr_list], list) {
>> >> +               switch (entry->desc_type) {
>> >> +               case DCC_READ_WRITE_TYPE:
>> >> +                       len = snprintf(local_buf, 64, "Index: 0x%x,
>> >> mask: 0x%x, val: 0x%x\n",
>> >> +                               entry->index, entry->mask,
>> >> entry->write_val);
>> >> +                       break;
>> >> +               case DCC_LOOP_TYPE:
>> >> +                       len = snprintf(local_buf, 64, "Index: 0x%x,
>> >> Loop: %d\n",
>> >> +                               entry->index, entry->loop_cnt);
>> >> +                       break;
>> >> +               case DCC_WRITE_TYPE:
>> >> +                       len = snprintf(local_buf, 64,
>> >> +                               "Write Index: 0x%x, Base: 0x%x,
>> >> Offset: 0x%x, len: 0x%x APB: %d\n",
>> >> +                               entry->index, entry->base,
>> >> entry->offset, entry->len,
>> >> +                               entry->apb_bus);
>> >> +                       break;
>> >> +               default:
>> >> +                       len = snprintf(local_buf, 64,
>> >> +                               "Read Index: 0x%x, Base: 0x%x, Offset:
>> >> 0x%x, len: 0x%x APB: %d\n",
>> >> +                               entry->index, entry->base,
>> >> entry->offset,
>> >> +                               entry->len, entry->apb_bus);
>> >> +               }
>> >> +
>> >> +               if ((count + len) > PAGE_SIZE) {
>> >> +                       dev_err(dev, "DCC: Couldn't write complete
>> >> config\n");
>> >> +                       break;
>> >> +               }
>> >> +               strlcat(buf, local_buf, PAGE_SIZE);
>> >> +               count += len;
>> >> +       }
>> >> +
>> >> +err:
>> >> +       mutex_unlock(&drvdata->mutex);
>> >> +       return count;
>> >> +}
>> >
>> >> +
>> >> +       /* EOF check */
>> >> +       if (drvdata->ram_size <= *ppos)
>> >> +               return 0;
>> >> +
>> >> +       if ((*ppos + len) > drvdata->ram_size)
>> >> +               len = (drvdata->ram_size - *ppos);
>> >> +
>> >> +       buf = kzalloc(len, GFP_KERNEL);
>> >> +       if (!buf)
>> >> +               return -ENOMEM;
>> >> +
>> >> +       memcpy_fromio(buf, drvdata->ram_base + *ppos, len);
>> >> +
>> >> +       if (copy_to_user(data, buf, len)) {
>> >
>> > Is there any sort of memcpy_fromio_to_user() API? That would avoid the
>> > extra buffer allocation by copying to userspace in the readl loop.
>> 
>> No. For directly copying io data to userspace we need to use direct 
>> I/O
>> which is used for
>> special cases like tape drivers. In this case the complexity of using 
>> it
>> outweighs it's
>> advantages. Also this is a fixed transfer of data in the form of
>> dcc_sram content rather
>> than bulk transfers.
> 
> Tape drivers? Huh? Can you please look into adding a
> memcpy_fromio_to_user() API that does this without allocating memory 
> for
> a buffer?

So in case of fixed read and writes, buffered i/o is more efficient than 
direct
i/o. In this case an effort to copy directly from i/o space to user 
space might
introduce latency. Let me know if I am missing anything here.

> 
>> 
>> >
>> >> +               dcc->loopoff = DCC_FIX_LOOP_OFFSET;
>> >> +       else
>> >> +               dcc->loopoff = get_bitmask_order((dcc->ram_size +
>> >> +                               dcc->ram_offset) / 4 - 1);
>> >> +
>> >> +       mutex_init(&dcc->mutex);
>> >> +       dcc->enable = devm_kcalloc(dev, dcc->nr_link_list,
>> >> +                       sizeof(bool), GFP_KERNEL);
>> >> +       if (!dcc->enable)
>> >> +               return -ENOMEM;
>> >> +
>> >> +       dcc->configured = devm_kcalloc(dev, dcc->nr_link_list,
>> >> +                       sizeof(bool), GFP_KERNEL);
>> >> +       if (!dcc->configured)
>> >> +               return -ENOMEM;
>> >> +
>> >> +       dcc->nr_config = devm_kcalloc(dev, dcc->nr_link_list,
>> >> +                       sizeof(u32), GFP_KERNEL);
>> >> +       if (!dcc->nr_config)
>> >> +               return -ENOMEM;
>> >> +
>> >> +       dcc->cfg_head = devm_kcalloc(dev, dcc->nr_link_list,
>> >> +                       sizeof(struct list_head), GFP_KERNEL);
>> >> +       if (!dcc->cfg_head)
>> >> +               return -ENOMEM;
>> >
>> > These are a lot of allocations. Any chance we can do one instead of
>> > this
>> > many?
>> 
>> All these variable have predefined requirement of sizes
>> so they need to be allocated separately.
> 
> Gather requirements, do some addition, and then allocate one chunk of
> memory?

Ack
