Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 214A2395A2B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 31 May 2021 14:12:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231377AbhEaMNv (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 31 May 2021 08:13:51 -0400
Received: from so254-9.mailgun.net ([198.61.254.9]:54549 "EHLO
        so254-9.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231331AbhEaMNu (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 31 May 2021 08:13:50 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1622463131; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=kj0/j5b+35di4Lm+Repozi+vu/XaMEIvwlRxt8/z5/w=;
 b=hbygZlal7cdpdasr2HTWAGDG+i/HNhVsnPytyaHLLfqUWe/O0N783TWlgWB3FTSq1cv4p+zj
 sBsWv9ngAE7q69FMXHJYssjHVfbMNrHlJULErhmRBFsIm4ootSPNwCnljHag9PqCEligvh8d
 KLnY4PJhYxI0B9KhLVHZNQOkRt4=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n07.prod.us-east-1.postgun.com with SMTP id
 60b4d299265e7370f727ebc3 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 31 May 2021 12:12:09
 GMT
Sender: kathirav=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id E8836C4338A; Mon, 31 May 2021 12:12:08 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: kathirav)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 92A9EC433F1;
        Mon, 31 May 2021 12:12:08 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Mon, 31 May 2021 17:42:08 +0530
From:   Kathiravan T <kathirav@codeaurora.org>
To:     Robert Marko <robimarko@gmail.com>
Cc:     agross@kernel.org, bjorn.andersson@linaro.org, robh+dt@kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: ipq8074: disable USB phy by default
In-Reply-To: <20210526150125.1816335-1-robimarko@gmail.com>
References: <20210526150125.1816335-1-robimarko@gmail.com>
Message-ID: <92bd27423bbec56881c47eea6c382f42@codeaurora.org>
X-Sender: kathirav@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2021-05-26 20:31, Robert Marko wrote:
> One of the QUSB USB PHY-s has been left enabled by
> default, this is probably just a mistake as other
> USB PHY-s are disabled by default.
> 
> It makes no sense to have it enabled by default as
> not all board implement USB ports, so disable it.
> 
> Signed-off-by: Robert Marko <robimarko@gmail.com>

Always, it is better to disable in SOC DTS and enable only in the board 
DTS files.

Reviewed-by: Kathiravan T <kathirav@codeaurora.org>

> ---
>  arch/arm64/boot/dts/qcom/ipq8074.dtsi | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/ipq8074.dtsi
> b/arch/arm64/boot/dts/qcom/ipq8074.dtsi
> index 555a107959831..20059d0f7d714 100644
> --- a/arch/arm64/boot/dts/qcom/ipq8074.dtsi
> +++ b/arch/arm64/boot/dts/qcom/ipq8074.dtsi
> @@ -286,6 +286,7 @@ qusb_phy_0: phy@79000 {
>  			clock-names = "cfg_ahb", "ref";
> 
>  			resets = <&gcc GCC_QUSB2_0_PHY_BCR>;
> +			status = "disabled";
>  		};
> 
>  		qmp_pcie_phy0: phy@84000 {

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a 
member of Code Aurora Forum, hosted by The Linux Foundation
