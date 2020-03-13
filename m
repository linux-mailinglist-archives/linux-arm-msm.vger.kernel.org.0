Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CBA96183F2C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2020 03:37:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726393AbgCMChp (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 12 Mar 2020 22:37:45 -0400
Received: from mail26.static.mailgun.info ([104.130.122.26]:31285 "EHLO
        mail26.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726371AbgCMChm (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 12 Mar 2020 22:37:42 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1584067061; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=8+Fp02besIsFwZ5qqgYlxtsBb8MnCynSCHmXef2Td1g=;
 b=bkjZUC8433QzzqJ0v2iAJJmbtpByCQ+CpHmCSgnQ1mSk6k7/JvJZA/o2L9zKPGh7/BgRu1Og
 n0AxkhfpK/T3Zc87+n/GvdjWHpVPE/IAZjIiL+uByIqEzI3RUot/sguA8FAu66hcs2OybKc6
 J7jjSLAXrZ05x8Ub14ak2LSB21g=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e6af1f4.7f0d07e552d0-smtp-out-n01;
 Fri, 13 Mar 2020 02:37:40 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 627C9C433BA; Fri, 13 Mar 2020 02:37:40 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: sibis)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id C57FBC433D2;
        Fri, 13 Mar 2020 02:37:39 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Fri, 13 Mar 2020 08:07:39 +0530
From:   Sibi Sankar <sibis@codeaurora.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Andy Gross <agross@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm-owner@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: sdm845-mtp: Relocate remoteproc
 firmware
In-Reply-To: <20200302020757.551483-1-bjorn.andersson@linaro.org>
References: <20200302020757.551483-1-bjorn.andersson@linaro.org>
Message-ID: <05311a9c9899a13c6479f6628d506f08@codeaurora.org>
X-Sender: sibis@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2020-03-02 07:37, Bjorn Andersson wrote:
> Update the firmware-name of the remoteproc nodes to mimic the firmware
> structure on other 845 devices.
> 
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/sdm845-mtp.dts | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sdm845-mtp.dts
> b/arch/arm64/boot/dts/qcom/sdm845-mtp.dts
> index 09ad37b0dd71..fa7f4373a668 100644
> --- a/arch/arm64/boot/dts/qcom/sdm845-mtp.dts
> +++ b/arch/arm64/boot/dts/qcom/sdm845-mtp.dts
> @@ -50,6 +50,7 @@ vreg_s4a_1p8: pm8998-smps4 {
> 
>  &adsp_pas {
>  	status = "okay";
> +	firmware-name = "qcom/sdm845/adsp.mdt";
>  };
> 
>  &apps_rsc {
> @@ -350,6 +351,7 @@ vreg_s3c_0p6: smps3 {
> 
>  &cdsp_pas {
>  	status = "okay";
> +	firmware-name = "qcom/sdm845/cdsp.mdt";
>  };
> 
>  &gcc {
> @@ -372,6 +374,11 @@ &i2c10 {
>  	clock-frequency = <400000>;
>  };
> 
> +&mss_pil {
> +	status = "okay";

status okay isn't really needed...

Reviewed-by: Sibi Sankar <sibis@codeaurora.org>

> +	firmware-name = "qcom/sdm845/mba.mbn", "qcom/sdm845/modem.mbn";
> +};
> +
>  &qupv3_id_1 {
>  	status = "okay";
>  };

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project.
