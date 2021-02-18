Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A238431E51D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Feb 2021 05:20:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230063AbhBREUW (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 17 Feb 2021 23:20:22 -0500
Received: from mail.kernel.org ([198.145.29.99]:48542 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229752AbhBREUV (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 17 Feb 2021 23:20:21 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 32B2E64E28;
        Thu, 18 Feb 2021 04:19:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1613621981;
        bh=GFaBtKmcknpiGdoo8JBOGy+CIuH6tMaUPNstbP+H9zA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Y2DUNduYpbRZIzO/Ltb7rfB+SOSLd+hh30GKWbyqDQagaHGMa5pXT7C+ov7vws064
         c6x2I6eA6vgaH0736X8YZpGVOC9HNvV0CihcdKRdSk8X4xaOdosCJbV64Ay/i4FwIV
         +K5Kd5sm1LH8wSYFQPTkl/XJTlfSZ5aie6FXv9V6zXmPHyBFwaGpAOPWM0Glz2E1cY
         qrESh82cMYliyy+IWkNp0EsPq+jr2mxHw7kbIoukOyMMRx3kG1ZwetE9cxpIyl9xPw
         sCYCt0JGbojFTM13Q7S6wFdwFT8J494soDpbt7GPiTYaIo6bRkyw+KlOQv5eo2DBLh
         r+mSWBabv41Kw==
Date:   Thu, 18 Feb 2021 09:49:37 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     =?iso-8859-1?Q?An=EDbal_Lim=F3n?= <anibal.limon@linaro.org>
Cc:     bjorn.andersson@linaro.org, agross@kernel.org,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: db410c: Update firmware-name for wcnss
 and mpss
Message-ID: <20210218041937.GU2774@vkoul-mobl.Dlink>
References: <20200108055735.660475-1-bjorn.andersson@linaro.org>
 <20210217223406.1422005-1-anibal.limon@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210217223406.1422005-1-anibal.limon@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 17-02-21, 16:34, Aníbal Limón wrote:
> From: Bjorn Andersson <bjorn.andersson@linaro.org>
> 
> Enable the mpss remoteproc node and specify the firmware-name for this
> and the wcnss remoteproc on the Dragonboard 410c.
> 
> Link: https://lore.kernel.org/r/20200108055735.660475-1-bjorn.andersson@linaro.org
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> [rebased and moved to use pronto label]
> Signed-off-by: Vinod Koul <vkoul@kernel.org>
> Tested-by: Aníbal Limón <anibal.limon@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/apq8016-sbc.dtsi | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/apq8016-sbc.dtsi b/arch/arm64/boot/dts/qcom/apq8016-sbc.dtsi
> index 3c7f97539390..8f1ada75d3ed 100644
> --- a/arch/arm64/boot/dts/qcom/apq8016-sbc.dtsi
> +++ b/arch/arm64/boot/dts/qcom/apq8016-sbc.dtsi
> @@ -301,6 +301,11 @@ &lpass {
>  	status = "okay";
>  };
>  
> +&mpss {
> +	status = "okay";
> +	firmware-name = "qcom/msm8916/mba.mbn", "qcom/msm8916/modem.mdt";

Shouldn't this one be mba.mdt?

> +};
> +
>  &pm8916_resin {
>  	status = "okay";
>  	linux,code = <KEY_VOLUMEDOWN>;
> @@ -308,6 +313,7 @@ &pm8916_resin {
>  
>  &pronto {
>  	status = "okay";
> +	firmware-name = "qcom/msm8916/wcnss.mdt";
>  };
>  
>  &sdhc_1 {
> -- 
> 2.30.0

-- 
~Vinod
