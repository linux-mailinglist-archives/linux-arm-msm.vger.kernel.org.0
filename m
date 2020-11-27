Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ED9752C6700
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Nov 2020 14:40:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730446AbgK0NjS (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 27 Nov 2020 08:39:18 -0500
Received: from z5.mailgun.us ([104.130.96.5]:45695 "EHLO z5.mailgun.us"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729459AbgK0NjS (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 27 Nov 2020 08:39:18 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1606484357; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=8CY6rA1bX1wd5JOfrduQy972wRe+K2gtfAhU+3VG+18=;
 b=iwzfcVpk0H2DGR45SqFRqCNLelK3g747kZl2ah3xSvLIS/iwLZbNDIIUvCp6zuSxCo5r+0Dt
 IlBbp4IhBDuGKxNyB960OfS17EYK05gFMsTraYH0GIFd9sgU9OuwWdE/Nt00T0+qRq0WxGAM
 LRfJdH1P4CKdp6AniCDjUq6l8uQ=
X-Mailgun-Sending-Ip: 104.130.96.5
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n04.prod.us-east-1.postgun.com with SMTP id
 5fc1017fb9b39088ed632f10 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 27 Nov 2020 13:39:11
 GMT
Sender: saiprakash.ranjan=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 3BB04C43461; Fri, 27 Nov 2020 13:39:10 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: saiprakash.ranjan)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 3443CC433ED;
        Fri, 27 Nov 2020 13:39:09 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Fri, 27 Nov 2020 19:09:09 +0530
From:   Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
To:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc:     agross@kernel.org, bjorn.andersson@linaro.org, robh+dt@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH 3/3] soc: qcom: llcc-qcom: Add support for SM8250 SoC
In-Reply-To: <20201127121127.158082-4-manivannan.sadhasivam@linaro.org>
References: <20201127121127.158082-1-manivannan.sadhasivam@linaro.org>
 <20201127121127.158082-4-manivannan.sadhasivam@linaro.org>
Message-ID: <9b7ed6f800980361dc216275fcf63b26@codeaurora.org>
X-Sender: saiprakash.ranjan@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Mani,

On 2020-11-27 17:41, Manivannan Sadhasivam wrote:
> SM8250 SoC uses LLCC IP version 2. In this version, the WRSC_EN 
> register
> needs to be written to enable the Write Sub Cache for each SCID. Hence,
> use a dedicated "write_scid_en" member with predefined values and write
> them for SoCs enabling the "llcc_v2" flag.
> 
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> ---
>  drivers/soc/qcom/llcc-qcom.c       | 40 ++++++++++++++++++++++++++++++
>  include/linux/soc/qcom/llcc-qcom.h |  1 +
>  2 files changed, 41 insertions(+)
> 
> diff --git a/drivers/soc/qcom/llcc-qcom.c 
> b/drivers/soc/qcom/llcc-qcom.c
> index 16b421608e9c..3ec4cdffa852 100644
> --- a/drivers/soc/qcom/llcc-qcom.c
> +++ b/drivers/soc/qcom/llcc-qcom.c
> @@ -47,6 +47,7 @@
> 
>  #define LLCC_TRP_SCID_DIS_CAP_ALLOC   0x21f00
>  #define LLCC_TRP_PCB_ACT              0x21f04
> +#define LLCC_TRP_WRSC_EN              0x21f20
> 
>  #define BANK_OFFSET_STRIDE	      0x80000
> 
> @@ -73,6 +74,7 @@
>   *               then the ways assigned to this client are not flushed 
> on power
>   *               collapse.
>   * @activate_on_init: Activate the slice immediately after it is 
> programmed
> + * @write_scid_en: Bit enables write cache support for a given scid.
>   */
>  struct llcc_slice_config {
>  	u32 usecase_id;
> @@ -87,12 +89,14 @@ struct llcc_slice_config {
>  	bool dis_cap_alloc;
>  	bool retain_on_pc;
>  	bool activate_on_init;
> +	bool write_scid_en;
>  };
> 
>  struct qcom_llcc_config {
>  	const struct llcc_slice_config *sct_data;
>  	int size;
>  	bool need_llcc_cfg;
> +	bool llcc_v2;
>  };

We can extract the version from HW info register and so
would not have to maintain a flag for every new version
of LLCC. I had a patch to do that which I have sent to you
now, perhaps you can check if that works for you and take
it with this series?

Thanks,
Sai

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a 
member
of Code Aurora Forum, hosted by The Linux Foundation
