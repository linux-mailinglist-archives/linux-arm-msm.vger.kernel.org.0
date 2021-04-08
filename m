Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6F317357BBA
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 Apr 2021 07:17:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229552AbhDHFRu (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 8 Apr 2021 01:17:50 -0400
Received: from so254-9.mailgun.net ([198.61.254.9]:52812 "EHLO
        so254-9.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229506AbhDHFRu (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 8 Apr 2021 01:17:50 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1617859059; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=rNM54h1kFxbzKZTRSekPMOTljmJgxx9lrWlM3GtgRsg=;
 b=mTFqVLf66KbjTWWkI8klivLfCZeRmld9vTh2u0YcA30Qt0A0AXQyl1/RBN3lms4Ak4ObrHCc
 I1iNrvbGBdpfeiwa8RShw1o0FbQ1WImVWwCzpQ+isqqMywQqKTX++eG6ZZxsg5vvo6bBDuD9
 2kQjyS/HoxSMGGDkO2aYnCl5CXU=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n06.prod.us-west-2.postgun.com with SMTP id
 606e91e4febcffa80f8cc6d8 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 08 Apr 2021 05:17:24
 GMT
Sender: sibis=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 6C146C433C6; Thu,  8 Apr 2021 05:17:24 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: sibis)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id B18F9C433CA;
        Thu,  8 Apr 2021 05:17:23 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Thu, 08 Apr 2021 10:47:23 +0530
From:   Sibi Sankar <sibis@codeaurora.org>
To:     Sujit Kautkar <sujitka@chromium.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Rajendra Nayak <rnayak@codeaurora.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Doug Anderson <dianders@chromium.org>
Subject: Re: [PATCH] arm64: dts: qcom: Move rmtfs memory region
In-Reply-To: <20210330014610.1451198-1-sujitka@chromium.org>
References: <20210330014610.1451198-1-sujitka@chromium.org>
Message-ID: <d38851ce189cd8555f719e5e38053b82@codeaurora.org>
X-Sender: sibis@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hey Sujit,
Thanks for the patch.

On 2021-03-30 07:16, Sujit Kautkar wrote:
> Move rmtfs memory region so that it does not overlap with system
> RAM (kernel data) when KAsan is enabled. This puts rmtfs right
> after mba_mem which is not supposed to increase beyond 0x94600000
> 
> Signed-off-by: Sujit Kautkar <sujitka@chromium.org>
> ---
>  arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi | 2 +-
>  arch/arm64/boot/dts/qcom/sc7180.dtsi         | 4 ++--
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi
> b/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi
> index 07c8b2c926c0..fe052b477b72 100644
> --- a/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi
> @@ -45,7 +45,7 @@ trips {
> 
>  /* Increase the size from 2MB to 8MB */
>  &rmtfs_mem {
> -	reg = <0x0 0x84400000 0x0 0x800000>;
> +	reg = <0x0 0x94600000 0x0 0x800000>;

Sorry for the late comments. Can you
please do the same for sc7180-idp
as well?

Reviewed-by: Sibi Sankar <sibis@codeaurora.org>

>  };
> 
>  / {
> diff --git a/arch/arm64/boot/dts/qcom/sc7180.dtsi
> b/arch/arm64/boot/dts/qcom/sc7180.dtsi
> index 1ea3344ab62c..ac956488908f 100644
> --- a/arch/arm64/boot/dts/qcom/sc7180.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc7180.dtsi
> @@ -110,9 +110,9 @@ tz_mem: memory@80b00000 {
>  			no-map;
>  		};
> 
> -		rmtfs_mem: memory@84400000 {
> +		rmtfs_mem: memory@94600000 {
>  			compatible = "qcom,rmtfs-mem";
> -			reg = <0x0 0x84400000 0x0 0x200000>;
> +			reg = <0x0 0x94600000 0x0 0x200000>;
>  			no-map;
> 
>  			qcom,client-id = <1>;

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project.
