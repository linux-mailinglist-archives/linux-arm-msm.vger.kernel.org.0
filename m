Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 710EF1A1F58
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Apr 2020 12:59:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728228AbgDHK75 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 8 Apr 2020 06:59:57 -0400
Received: from mail26.static.mailgun.info ([104.130.122.26]:62829 "EHLO
        mail26.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728309AbgDHK7z (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 8 Apr 2020 06:59:55 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1586343594; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=r5DKOOU0exG1TjFOCwtyNf3GO9Obz3idKawjGYbp8UI=; b=Df6UR5vqXDRVCJdChD7+qqofenBog0WpOX9rkruB3qC+k2mbTzQ6p7Hu6Zeu54xOEIaE/Np1
 /VDjfDXXCAkX1jWpjBW6tJJfj6a3Nmo/0lBQOBYYKyIM7fi4N1MJ1Y053guSTsu+/ZIkOH7H
 /n+3tdWbxkUIymgQm7Nalnnzuik=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e8daea9.7f2eaf9fb650-smtp-out-n05;
 Wed, 08 Apr 2020 10:59:53 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 68708C433D2; Wed,  8 Apr 2020 10:59:52 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from [192.168.43.137] (unknown [106.213.202.231])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: mkshah)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 1B5A0C433F2;
        Wed,  8 Apr 2020 10:59:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 1B5A0C433F2
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=mkshah@codeaurora.org
Subject: Re: [PATCH v3 02/10] drivers: qcom: rpmh-rsc: Document the register
 layout better
To:     Douglas Anderson <dianders@chromium.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     mka@chromium.org, Lina Iyer <ilina@codeaurora.org>,
        Rajendra Nayak <rnayak@codeaurora.org>, swboyd@chromium.org,
        evgreen@chromium.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20200407235024.260460-1-dianders@chromium.org>
 <20200407164915.v3.2.Iaddc29b72772e6ea381238a0ee85b82d3903e5f2@changeid>
From:   Maulik Shah <mkshah@codeaurora.org>
Message-ID: <1663ffc6-c5dc-dc23-4f02-742cecb1468e@codeaurora.org>
Date:   Wed, 8 Apr 2020 16:29:43 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200407164915.v3.2.Iaddc29b72772e6ea381238a0ee85b82d3903e5f2@changeid>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

Reviewed-by: Maulik Shah <mkshah@codeaurora.org>

Thanks,
Maulik

On 4/8/2020 5:20 AM, Douglas Anderson wrote:
> Perhaps it's just me, it took a really long time to understand what
> the register layout of rpmh-rsc was just from the #defines.  Let's add
> a bunch of comments describing which blocks are part of other blocks.
>
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---
>
> Changes in v3:
> - Extra blank line removed (Maulik).
> - IRQ registers aren't in TCS0 (Maulik).
> - One space after a period now (Maulik).
> - Plural of TCS fixed to TCSes following Maulik's example.
> - Rebased atop v16 ('Invoke rpmh_flush...') series.
>
> Changes in v2:
> - Now prose in comments instead of struct definitions.
> - Pretty ASCII art from Stephen.
>
>   drivers/soc/qcom/rpmh-rsc.c | 79 ++++++++++++++++++++++++++++++++++---
>   1 file changed, 74 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/soc/qcom/rpmh-rsc.c b/drivers/soc/qcom/rpmh-rsc.c
> index 7d9e2c2f0e27..46455b1d93f1 100644
> --- a/drivers/soc/qcom/rpmh-rsc.c
> +++ b/drivers/soc/qcom/rpmh-rsc.c
> @@ -43,14 +43,29 @@
>   #define DRV_NCPT_MASK			0x1F
>   #define DRV_NCPT_SHIFT			27
>   
> -/* Register offsets */
> +/* Offsets for common TCS Registers, one bit per TCS */
>   #define RSC_DRV_IRQ_ENABLE		0x00
>   #define RSC_DRV_IRQ_STATUS		0x04
> -#define RSC_DRV_IRQ_CLEAR		0x08
> -#define RSC_DRV_CMD_WAIT_FOR_CMPL	0x10
> +#define RSC_DRV_IRQ_CLEAR		0x08	/* w/o; write 1 to clear */
> +
> +/*
> + * Offsets for per TCS Registers.
> + *
> + * TCSes start at 0x10 from tcs_base and are stored one after another.
> + * Multiply tcs_id by RSC_DRV_TCS_OFFSET to find a given TCS and add one
> + * of the below to find a register.
> + */
> +#define RSC_DRV_CMD_WAIT_FOR_CMPL	0x10	/* 1 bit per command */
>   #define RSC_DRV_CONTROL			0x14
> -#define RSC_DRV_STATUS			0x18
> -#define RSC_DRV_CMD_ENABLE		0x1C
> +#define RSC_DRV_STATUS			0x18	/* zero if tcs is busy */
> +#define RSC_DRV_CMD_ENABLE		0x1C	/* 1 bit per command */
> +
> +/*
> + * Offsets for per command in a TCS.
> + *
> + * Commands (up to 16) start at 0x30 in a TCS; multiply command index
> + * by RSC_DRV_CMD_OFFSET and add one of the below to find a register.
> + */
>   #define RSC_DRV_CMD_MSGID		0x30
>   #define RSC_DRV_CMD_ADDR		0x34
>   #define RSC_DRV_CMD_DATA		0x38
> @@ -67,6 +82,60 @@
>   #define CMD_STATUS_ISSUED		BIT(8)
>   #define CMD_STATUS_COMPL		BIT(16)
>   
> +/*
> + * Here's a high level overview of how all the registers in RPMH work
> + * together:
> + *
> + * - The main rpmh-rsc address is the base of a register space that can
> + *   be used to find overall configuration of the hardware
> + *   (DRV_PRNT_CHLD_CONFIG). Also found within the rpmh-rsc register
> + *   space are all the TCS blocks. The offset of the TCS blocks is
> + *   specified in the device tree by "qcom,tcs-offset" and used to
> + *   compute tcs_base.
> + * - TCS blocks come one after another. Type, count, and order are
> + *   specified by the device tree as "qcom,tcs-config".
> + * - Each TCS block has some registers, then space for up to 16 commands.
> + *   Note that though address space is reserved for 16 commands, fewer
> + *   might be present. See ncpt (num cmds per TCS).
> + *
> + * Here's a picture:
> + *
> + *  +---------------------------------------------------+
> + *  |RSC                                                |
> + *  | ctrl                                              |
> + *  |                                                   |
> + *  | Drvs:                                             |
> + *  | +-----------------------------------------------+ |
> + *  | |DRV0                                           | |
> + *  | | ctrl/config                                   | |
> + *  | | IRQ                                           | |
> + *  | |                                               | |
> + *  | | TCSes:                                        | |
> + *  | | +------------------------------------------+  | |
> + *  | | |TCS0  |  |  |  |  |  |  |  |  |  |  |  |  |  | |
> + *  | | | ctrl | 0| 1| 2| 3| 4| 5| .| .| .| .|14|15|  | |
> + *  | | |      |  |  |  |  |  |  |  |  |  |  |  |  |  | |
> + *  | | +------------------------------------------+  | |
> + *  | | +------------------------------------------+  | |
> + *  | | |TCS1  |  |  |  |  |  |  |  |  |  |  |  |  |  | |
> + *  | | | ctrl | 0| 1| 2| 3| 4| 5| .| .| .| .|14|15|  | |
> + *  | | |      |  |  |  |  |  |  |  |  |  |  |  |  |  | |
> + *  | | +------------------------------------------+  | |
> + *  | | +------------------------------------------+  | |
> + *  | | |TCS2  |  |  |  |  |  |  |  |  |  |  |  |  |  | |
> + *  | | | ctrl | 0| 1| 2| 3| 4| 5| .| .| .| .|14|15|  | |
> + *  | | |      |  |  |  |  |  |  |  |  |  |  |  |  |  | |
> + *  | | +------------------------------------------+  | |
> + *  | |                    ......                     | |
> + *  | +-----------------------------------------------+ |
> + *  | +-----------------------------------------------+ |
> + *  | |DRV1                                           | |
> + *  | | (same as DRV0)                                | |
> + *  | +-----------------------------------------------+ |
> + *  |                      ......                       |
> + *  +---------------------------------------------------+
> + */
> +
>   static u32 read_tcs_cmd(struct rsc_drv *drv, int reg, int tcs_id, int cmd_id)
>   {
>   	return readl_relaxed(drv->tcs_base + RSC_DRV_TCS_OFFSET * tcs_id + reg +

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, hosted by The Linux Foundation
