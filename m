Return-Path: <linux-arm-msm+bounces-65761-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B6A41B0B34E
	for <lists+linux-arm-msm@lfdr.de>; Sun, 20 Jul 2025 05:31:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9F53F7A8BC3
	for <lists+linux-arm-msm@lfdr.de>; Sun, 20 Jul 2025 03:29:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6B823157A48;
	Sun, 20 Jul 2025 03:30:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BzyWhakr"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F5783595E;
	Sun, 20 Jul 2025 03:30:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752982227; cv=none; b=ZpCOM44bVXUlxlAedc1r8Awc1+7lBEPnrR28F3L/fAnWM+bT22Vu6esdbuRKz7q5l3KEXvAD1bR4fozm6IN2y7GAGwqdRFCFonxlvCbqeb/dZctGuEHtmc6jOGmoBw+FmBwLxEF/95+kGUMJMF9H+8NuS/8p1VKir/2xQWqxm34=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752982227; c=relaxed/simple;
	bh=4ZBjiMODEL2Rlny7KTF1RbpQWQIkH+GM82PmA+4MqGE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JPDIhGoEKcHZ1bZZLo8HgRV7tM9sN8wxFGmJsPb0GFHg9POKNZQ/NJahNlrw0bwnCzXjnd4UjQm90YA90ESO2AOjdDDbRdeFCxVrwocAYKi2GxfvdUWusyFLTNSevso7068LsDpipwIycqJOMPpUFk1oaRMvh4trlOQDU3mh6KE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BzyWhakr; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DA345C4CEF4;
	Sun, 20 Jul 2025 03:30:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752982226;
	bh=4ZBjiMODEL2Rlny7KTF1RbpQWQIkH+GM82PmA+4MqGE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BzyWhakrNr+yz8vAAfJ5yQNFIhPq/omRbgS6It/Ud4VpPaAA47JoGgI0vbsUYpjtT
	 xqfdygYcrDtZco/0PpL4giNscaXUdvGVi/3u4RP7nUn099pFw9dj+c+QhGvpJ4w+Az
	 1qkXNCjX0VVYTUN1kXE8qYMQR10DfxL6YfObRePkF5/7SH5NwkQO+QQrHWJMpbCMjl
	 9oBKUAv/eqcDYZoyqZe7kUJd5dtAPAZzFJLJD1ziVwKPrDgviPqVsKei86XrbwnRyq
	 V7PRBdTRJrf77AhOa4X0UDZVA0DeTAgmi7bLuYeaoKr0rQQBz8aITA/D97i15w+dVs
	 IOXoX8bkv2Cvg==
Date: Sat, 19 Jul 2025 22:30:24 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, Ling Xu <quic_lxu5@quicinc.com>, 
	Dmitry Baryshkov <lumag@kernel.org>, Tengfei Fan <quic_tengfan@quicinc.com>, 
	Jagadeesh Kona <quic_jkona@quicinc.com>, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/4] arm64: dts: qcom: sm8150: use correct PD for
 DisplayPort controller
Message-ID: <ecmehyul7v7zibzs77kkysrxzuijmysvfrdkgxrynp5eyuvm77@mydt5lyixam5>
References: <20250718-fix-rpmhpd-abi-v2-0-0059edb9ddb3@oss.qualcomm.com>
 <20250718-fix-rpmhpd-abi-v2-2-0059edb9ddb3@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250718-fix-rpmhpd-abi-v2-2-0059edb9ddb3@oss.qualcomm.com>

On Fri, Jul 18, 2025 at 06:25:39PM +0300, Dmitry Baryshkov wrote:
> Commit 5dd110c90a50 ("arm64: dts: qcom: sm8150: add DisplayPort
> controller") specified SM8250_MMCX (= 6) for the DisplayPort power
> domain, however on SM8150 this indices maps to SM8150_MX_AO (= 6). Use
> correct indice instead (SM8150_MMCX = 9).
> 

Reviewed-by: Bjorn Andersson <andersson@kernel.org>

> Fixes: 5dd110c90a50 ("arm64: dts: qcom: sm8150: add DisplayPort controller")
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/sm8150.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm8150.dtsi b/arch/arm64/boot/dts/qcom/sm8150.dtsi
> index abf12e10d33f1ce5c74e3e9136585bcb0a578492..4b347ee3244100a4db515515b73575383c5a0cb7 100644
> --- a/arch/arm64/boot/dts/qcom/sm8150.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8150.dtsi
> @@ -3908,7 +3908,7 @@ mdss_dp: displayport-controller@ae90000 {
>  				#sound-dai-cells = <0>;
>  
>  				operating-points-v2 = <&dp_opp_table>;
> -				power-domains = <&rpmhpd SM8250_MMCX>;
> +				power-domains = <&rpmhpd SM8150_MMCX>;
>  
>  				status = "disabled";
>  
> 
> -- 
> 2.39.5
> 

