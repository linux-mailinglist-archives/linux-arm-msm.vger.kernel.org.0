Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E97C318150F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2020 10:36:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728852AbgCKJf1 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 11 Mar 2020 05:35:27 -0400
Received: from mail27.static.mailgun.info ([104.130.122.27]:50674 "EHLO
        mail27.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726934AbgCKJf1 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 11 Mar 2020 05:35:27 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1583919325; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=QyNiJ+0qok89TnybJL0siB5PS2p4435lMsK9Zo6fR2M=; b=IWBOQBV+5S1z4H7ymBaE1EtSqtPxPO85j4qflwM6ZA85uvQI8aWIzogvUjzSPwFE9zVK8X+F
 M60U2Txrck/JTfvXNcK9iI7NmEU3AoOrJd4AgZ25GAHL/V0v3Eng2In8BqweuI195KOOKCy8
 vNzYGQfUmFLjWns+JWRseEdel/0=
X-Mailgun-Sending-Ip: 104.130.122.27
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e68b0dd.7f22429b1768-smtp-out-n03;
 Wed, 11 Mar 2020 09:35:25 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 58BECC4478C; Wed, 11 Mar 2020 09:35:24 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from [10.206.13.37] (blr-c-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.19.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: mkshah)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id C69D4C432C2;
        Wed, 11 Mar 2020 09:35:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org C69D4C432C2
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=mkshah@codeaurora.org
Subject: Re: [RFT PATCH 2/9] drivers: qcom: rpmh-rsc: Document the register
 layout better
To:     Douglas Anderson <dianders@chromium.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Rajendra Nayak <rnayak@codeaurora.org>, mka@chromium.org,
        evgreen@chromium.org, swboyd@chromium.org,
        Lina Iyer <ilina@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20200306235951.214678-1-dianders@chromium.org>
 <20200306155707.RFT.2.Iaddc29b72772e6ea381238a0ee85b82d3903e5f2@changeid>
From:   Maulik Shah <mkshah@codeaurora.org>
Message-ID: <285d3315-7558-d9f6-fe65-24d8ad07949d@codeaurora.org>
Date:   Wed, 11 Mar 2020 15:05:18 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200306155707.RFT.2.Iaddc29b72772e6ea381238a0ee85b82d3903e5f2@changeid>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Doug,

On 3/7/2020 5:29 AM, Douglas Anderson wrote:
> Perhaps it's just me, it took a really long time to understand what
> the register layout of rpmh-rsc was just from the #defines.  
i don't understand why register layout is so important for you to understand?

besides, i think all required registers are properly named with #define

for e.g.
/* Register offsets */
#define RSC_DRV_IRQ_ENABLE              0x00
#define RSC_DRV_IRQ_STATUS              0x04
#define RSC_DRV_IRQ_CLEAR               0x08

now when you want to enable/disable irq in driver code, its pretty simple to figure out
that we need to read/write at RSC_DRV_IRQ_ENABLE offset.

this seems unnecessary change to me, can you please drop this when you spin v2?

Thanks,
Maulik
> It's much
> easier to understand this if we define some structures.  At the moment
> these structures aren't used at all (so think of them as
> documentation), but to me they really help in understanding.
>
> These structures were all figured out from the #defines and
> reading/writing functions.  Anything that wasn't used in the driver is
> marked as "opaque".
>
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---
>
>  drivers/soc/qcom/rpmh-rsc.c | 67 +++++++++++++++++++++++++++++++++++++
>  1 file changed, 67 insertions(+)
>
> diff --git a/drivers/soc/qcom/rpmh-rsc.c b/drivers/soc/qcom/rpmh-rsc.c
> index 5c88b8cd5bf8..0a409988d103 100644
> --- a/drivers/soc/qcom/rpmh-rsc.c
> +++ b/drivers/soc/qcom/rpmh-rsc.c
> @@ -61,6 +61,73 @@
>  #define CMD_STATUS_ISSUED		BIT(8)
>  #define CMD_STATUS_COMPL		BIT(16)
>  
> +/*
> + * The following structures aren't used in the code anywhere (right now), but
> + * help to document how the register space is laid out.  In other words it's
> + * another way to visualize the "Register offsets".
> + *
> + * Couch this in a bogus #ifdef instead of comments to allow the embedded
> + * comments to work.
> + */
> +#ifdef STRUCTS_TO_DOCUMENT_HW_REGISTER_MAP
> +
> +/* 0x14 = 20 bytes big (see RSC_DRV_CMD_OFFSET) */
> +struct tcs_cmd_hw {
> +	u32 msgid;
> +	u32 addr;
> +	u32 data;
> +	u32 status;
> +	u32 resp_data;
> +};
> +
> +/* 0x2a0 = 672 bytes big (see RSC_DRV_TCS_OFFSET) */
> +struct tcs_hw {
> +	/*
> +	 * These are only valid on TCS 0 but are present everywhere.
> +	 * Contains 1 bit per TCS.
> +	 */
> +	u32 irq_enable;
> +	u32 irq_status;
> +	u32 irq_clear;			/* Write only; write 1 to clear */
> +
> +	char opaque_00c[0x4];
> +
> +	u32 cmd_wait_for_cmpl;		/* Bit field, 1 bit per command */
> +	u32 control;
> +	u32 status;			/* status is 0 if tcs is busy */
> +	u32 cmd_enable;			/* Bit field, 1 bit per command */
> +
> +	char opaque_01c[0x10];
> +
> +	struct tcs_cmd_hw tcs_cmd_hw[MAX_CMDS_PER_TCS];
> +
> +	char opaque_170[0x130];
> +};
> +
> +/* Example for sc7180 based on current dts */
> +struct rpmh_rsc_hw_sc7180 {
> +	char opaque_000[0xc];
> +
> +	u32 prnt_chld_config;
> +
> +	char opaque_010[0xcf0];
> +
> +	/*
> +	 * Offset 0xd00 aka qcom,tcs-offset from device tree.  Presumably
> +	 * could be different for different SoCs?  Currently driver stores
> +	 * a pointer to the first tcs in tcs_base.
> +	 *
> +	 * Count of various TCS entries also comes from dts.
> +	 */
> +	struct tcs_hw active[2];
> +	struct tcs_hw sleep[3];
> +	struct tcs_hw wake[3];
> +	struct tcs_hw control[1];
> +};
> +
> +#endif /* STRUCTS_TO_DOCUMENT_HW_REGISTER_MAP */
> +
> +
>  static u32 read_tcs_cmd(struct rsc_drv *drv, int reg, int tcs_id, int cmd_id)
>  {
>  	return readl_relaxed(drv->tcs_base + RSC_DRV_TCS_OFFSET * tcs_id + reg +

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, hosted by The Linux Foundation
