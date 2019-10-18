Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 50EBBDC2CE
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Oct 2019 12:31:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2408081AbfJRKbr (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 18 Oct 2019 06:31:47 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:40394 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729479AbfJRKbr (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 18 Oct 2019 06:31:47 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id 2084A6121D; Fri, 18 Oct 2019 10:31:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1571394706;
        bh=JsxKFSAy1iuf/aPktsC6FZcWFRE+QUyAl6FXx4ZIliQ=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=RWOqByZZFhO30hXT5mph+CcZRdB2FdL4DN8NACEA6PLudAh9mwFGB7h0/bzUFgrM3
         PvhD+o5btMTaDxkRp0f9pFUIXwSkjmxZu4I3nOdU5JI/IB/B4j4HzAVV74NUX9l5t9
         A6BVriwNLe2/e2WqDSNpaa4nVa6sBqEKb+SRNsLY=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        pdx-caf-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        DKIM_INVALID,DKIM_SIGNED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        by smtp.codeaurora.org (Postfix) with ESMTP id 2BAF960D8F;
        Fri, 18 Oct 2019 10:31:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1571394705;
        bh=JsxKFSAy1iuf/aPktsC6FZcWFRE+QUyAl6FXx4ZIliQ=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=PLEjqrTKNVywoJ79b0L13gACxAMsJ/2aGT7iUIgh/M8z1sbbNVoBNz9aZ8I+FicJw
         QKBwcdjHsOfst1MaOgV54d9YmiJt4a9k4A+6JRVr9SsnKzs/IH9Oq43tNWB/Jo5SqY
         q1A0mR6Hui5m0HIWVdCzyj6nIK1DnFBwhOKWYZAM=
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Fri, 18 Oct 2019 16:01:45 +0530
From:   Sibi Sankar <sibis@codeaurora.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Andy Gross <agross@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm-owner@vger.kernel.org
Subject: Re: [PATCH v2] arm64: dts: qcom: c630: Enable adsp, cdsp and mpss
In-Reply-To: <20191018055706.3729469-1-bjorn.andersson@linaro.org>
References: <20191018055706.3729469-1-bjorn.andersson@linaro.org>
Message-ID: <3e528de55c8d9ff36c6e532ffb1c3cf8@codeaurora.org>
X-Sender: sibis@codeaurora.org
User-Agent: Roundcube Webmail/1.2.5
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2019-10-18 11:27, Bjorn Andersson wrote:
> Specify the firmware-name for the adsp, cdsp and mpss and enable the
> nodes.
> 
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Reviewed-by: Sibi Sankar <sibis@codeaurora.org>

> ---
>  .../boot/dts/qcom/sdm850-lenovo-yoga-c630.dts      | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts
> b/arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts
> index ded120d3aef5..13dc619687f3 100644
> --- a/arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts
> +++ b/arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts
> @@ -20,6 +20,11 @@
>  	};
>  };
> 
> +&adsp_pas {
> +	firmware-name = "qcom/LENOVO/81JL/qcadsp850.mbn";
> +	status = "okay";
> +};
> +
>  &apps_rsc {
>  	pm8998-rpmh-regulators {
>  		compatible = "qcom,pm8998-rpmh-regulators";
> @@ -229,6 +234,11 @@
>  	status = "disabled";
>  };
> 
> +&cdsp_pas {
> +	firmware-name = "qcom/LENOVO/81JL/qccdsp850.mbn";
> +	status = "okay";
> +};
> +
>  &gcc {
>  	protected-clocks = <GCC_QSPI_CORE_CLK>,
>  			   <GCC_QSPI_CORE_CLK_SRC>,
> @@ -296,6 +306,10 @@
>  	};
>  };
> 
> +&mss_pil {
> +	firmware-name = "qcom/LENOVO/81JL/qcdsp1v2850.mbn",
> "qcom/LENOVO/81JL/qcdsp2850.mbn";
> +};
> +
>  &qup_i2c12_default {
>  	drive-strength = <2>;
>  	bias-disable;

-- 
-- Sibi Sankar --
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project.
