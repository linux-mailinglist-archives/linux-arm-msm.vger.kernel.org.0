Return-Path: <linux-arm-msm+bounces-34596-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E72D29A0CA9
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Oct 2024 16:31:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 939D61F258BC
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Oct 2024 14:31:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 61796209F25;
	Wed, 16 Oct 2024 14:31:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rWmZmRtE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 372891586D3;
	Wed, 16 Oct 2024 14:31:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729089105; cv=none; b=t1SJfUBvQ8pV8QAkTcxLAMf0uWcWE2046QzoZLDyPITh22YZcMP+1vTY1jfDV4+HCs8Aseg82EySjfY5HgQOZGu5C0P1drBCp0glcylAbSKGUxiLDVhCFGyljbOjQ5lhnQoV1ngJDCo8PXLfl+UL7zjke63gljt+PFBtVqTHHC0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729089105; c=relaxed/simple;
	bh=0xfOv0zgOtoH74E1+U5BolLrIHlK5WA+900nCd8/6m4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eMoHHbF6BN34TPTcCC7Z+NU2LuZmylFLirP5RmGYK2afso2GsVfdGAoqKF6LS/wSw+REjRKIGVzQZGcGs+1wczlrxKiWibQdjVGXW64VM93hidTCVM8huft2L+WkX4KRhuAe9+M//qzFGQvxkMMmyZtAVhOF7jj0QrFLfIzhzaU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rWmZmRtE; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0C7F2C4CEC5;
	Wed, 16 Oct 2024 14:31:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729089104;
	bh=0xfOv0zgOtoH74E1+U5BolLrIHlK5WA+900nCd8/6m4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rWmZmRtEujt9bn1Vj7YsfEbqJeqaGr714tAtBsxFk787oKc27oN+6ZcdozKJ6ZGkK
	 +Kjb9oDhnth5XW2Tbs2RVEza0EntRZDOKkBsxmXaKTqo1VF5arrCA1Rymj1a+h7kpb
	 4NWtM68v3HhsnJwPW+2jSjf8s4MI8PtITJSl3BsStHeAI1wP0WJKfppR37VmRM//Yi
	 PYcmZnsJgkvt1p0EL/YIQXURNouH/5ebfLGJCZio9cAm/Xo++xnZa4oZ60v0A0TBSh
	 AgT6SRhvxy/qvlGQ8uTWJR5cqvHUNDJydIU/B+gdS44zmw/Dnmw3jKUeL2zFbzoKHM
	 YiWvBv/q3eucw==
Date: Wed, 16 Oct 2024 09:31:50 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: Maya Matuszczyk <maccraft123mc@gmail.com>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jos Dehaes <jos.dehaes@gmail.com>, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: Rename "Twitter" to "Tweeter"
Message-ID: <423uciiaksxtyqua6w22wzdms4a53jp7v6rbvhfpfxr2uot7hd@mkb4uqehgz23>
References: <20241015170157.2959-1-maccraft123mc@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241015170157.2959-1-maccraft123mc@gmail.com>

On Tue, Oct 15, 2024 at 07:01:56PM GMT, Maya Matuszczyk wrote:
> This makes the name consistent with both other x1e80100 devices and the
> dictionary. A UCM fix was merged already.
> 

Please, as you update the commit message, make sure that the subject
prefix matches other changes in the particular file.

Regards,
Bjorn

> Signed-off-by: Maya Matuszczyk <maccraft123mc@gmail.com>
> ---
>  arch/arm64/boot/dts/qcom/x1e80100-crd.dts | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/x1e80100-crd.dts b/arch/arm64/boot/dts/qcom/x1e80100-crd.dts
> index 10b28d870f08..004353220dc5 100644
> --- a/arch/arm64/boot/dts/qcom/x1e80100-crd.dts
> +++ b/arch/arm64/boot/dts/qcom/x1e80100-crd.dts
> @@ -177,9 +177,9 @@ sound {
>  		compatible = "qcom,x1e80100-sndcard";
>  		model = "X1E80100-CRD";
>  		audio-routing = "WooferLeft IN", "WSA WSA_SPK1 OUT",
> -				"TwitterLeft IN", "WSA WSA_SPK2 OUT",
> +				"TweeterLeft IN", "WSA WSA_SPK2 OUT",
>  				"WooferRight IN", "WSA2 WSA_SPK2 OUT",
> -				"TwitterRight IN", "WSA2 WSA_SPK2 OUT",
> +				"TweeterRight IN", "WSA2 WSA_SPK2 OUT",
>  				"IN1_HPHL", "HPHL_OUT",
>  				"IN2_HPHR", "HPHR_OUT",
>  				"AMIC2", "MIC BIAS2",
> @@ -933,7 +933,7 @@ left_tweeter: speaker@0,1 {
>  		reg = <0 1>;
>  		reset-gpios = <&lpass_tlmm 12 GPIO_ACTIVE_LOW>;
>  		#sound-dai-cells = <0>;
> -		sound-name-prefix = "TwitterLeft";
> +		sound-name-prefix = "TweeterLeft";
>  		vdd-1p8-supply = <&vreg_l15b_1p8>;
>  		vdd-io-supply = <&vreg_l12b_1p2>;
>  		qcom,port-mapping = <4 5 6 7 11 13>;
> @@ -986,7 +986,7 @@ right_tweeter: speaker@0,1 {
>  		reg = <0 1>;
>  		reset-gpios = <&lpass_tlmm 13 GPIO_ACTIVE_LOW>;
>  		#sound-dai-cells = <0>;
> -		sound-name-prefix = "TwitterRight";
> +		sound-name-prefix = "TweeterRight";
>  		vdd-1p8-supply = <&vreg_l15b_1p8>;
>  		vdd-io-supply = <&vreg_l12b_1p2>;
>  		qcom,port-mapping = <4 5 6 7 11 13>;
> -- 
> 2.45.2
> 

