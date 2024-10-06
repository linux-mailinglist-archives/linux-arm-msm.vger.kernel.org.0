Return-Path: <linux-arm-msm+bounces-33214-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D43EF991C3E
	for <lists+linux-arm-msm@lfdr.de>; Sun,  6 Oct 2024 05:29:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7C60B1F21F18
	for <lists+linux-arm-msm@lfdr.de>; Sun,  6 Oct 2024 03:29:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E40CE14A0A4;
	Sun,  6 Oct 2024 03:29:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QvlS4A0N"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6090AD55;
	Sun,  6 Oct 2024 03:29:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728185345; cv=none; b=NDUSCIKT2Ss28kN2O14kKf+/84q6ABDHKUNMLZZ8Ngp9RZEdXRkNtkrMVmc+nhsxe6Kidp6pZ7Y84PVtkL+8gyrrNplEL0pZk7kqjoKVmdKipiNPwcVl+kiKulLCGeL8xCOsbSLjj5Bq3wgzEUUSa2sm3JhYqqdKqy0r5XXLBYY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728185345; c=relaxed/simple;
	bh=sn+rhuJFS4QcAX7nHTjMNJqUeOzV5xBHQDk6dVxGcFI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ssZpC7buYp7TptimgZ/zTlpFCd7iBoGJSXtMHkZeG/puIztmBAbdn8+lnVoZ+7+sFlNocCOURsHGVKOKyywwh66K/aBOu3sdOF8hqAcauTc7FRpNv17MekyDH1l04BMi9j0jObSG+w/PKCjAhHReGPaf3gKcx3QFaci7XvpwRr8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QvlS4A0N; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5DD55C4CEC7;
	Sun,  6 Oct 2024 03:29:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728185345;
	bh=sn+rhuJFS4QcAX7nHTjMNJqUeOzV5xBHQDk6dVxGcFI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QvlS4A0NP0//x72QRsOWfdhC16oDn8p0xxy1TS2pbVn7BySM0+RvCzHr79SFWIYZ4
	 4Otz53pJGhB8YFCpiHL+3StUBGkLIXo2NwLlI7JLe+kR+ojPFoNJl7kWBIejQgwPrv
	 itUAv7lUGBBibBkMqdDjcZDndEg+KZlNax6RoGv1fyW++2yCexdy5uw86xCR6KlFZC
	 BKePBEqcp/LoKFF9kaobmq6KOmdzvKtIA3MKiwsJPkB74GiMAW85gBOzOxSA7Aq0yJ
	 hmNZ/0SJ3SbMR8+bacqjmeV2rUQGVclJVhfL518JZuBpHoSXbY0zn1YYt+zhasapB4
	 PVIKAoH4137sQ==
Date: Sat, 5 Oct 2024 22:29:02 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: Rakesh Kota <quic_kotarake@quicinc.com>
Cc: konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, quic_kamalw@quicinc.com, quic_jprakash@quicinc.com
Subject: Re: [PATCH] arm64: dts: qcom: qcm6490: Allow UFS regulators
 load/mode setting
Message-ID: <qwkuuh4yceordfjsvfn4gs6kpj6fkqx77yrsz3fbw5efffjjsx@dnsiz3eqj5cr>
References: <20241004080110.4150476-1-quic_kotarake@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241004080110.4150476-1-quic_kotarake@quicinc.com>

On Fri, Oct 04, 2024 at 01:31:10PM GMT, Rakesh Kota wrote:
> The UFS driver expects to be able to set load (and by extension, mode)
> on its supply regulators. Add the necessary properties to make that
> possible.
> 
> While at it, UFS rails have different voltage requirement for UFS2.x
> v/s UFS3.x. Bootloader sets the proper voltage based on UFS type.
> There can be case where the voltage set by bootloader is overridden
> by HLOS client.
> 

It's generally not accepted to do "while at it"-changes, but it happens
that I accept it. This one however, is controversial. We tend to want to
properly describe the voltage constraints, so this departure from that
stance definitely isn't an acceptable "while at it"-change...

> To prevent above issue, add change to remove voltage voting support
> for dedicated UFS rails.

You state that the bootloader will configure the appropriate voltage, I
don't see a issue description.


Either way, please split this in two.

Regards,
Bjorn

> 
> Signed-off-by: Rakesh Kota <quic_kotarake@quicinc.com>
> ---
>  arch/arm64/boot/dts/qcom/qcm6490-idp.dts | 12 ++++++++----
>  1 file changed, 8 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/qcm6490-idp.dts b/arch/arm64/boot/dts/qcom/qcm6490-idp.dts
> index 84c45419cb8d..8a4df9c2a946 100644
> --- a/arch/arm64/boot/dts/qcom/qcm6490-idp.dts
> +++ b/arch/arm64/boot/dts/qcom/qcm6490-idp.dts
> @@ -258,13 +258,15 @@ vreg_l6b_1p2: ldo6 {
>  			regulator-name = "vreg_l6b_1p2";
>  			regulator-min-microvolt = <1140000>;
>  			regulator-max-microvolt = <1260000>;
> +			regulator-allow-set-load;
> +			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM RPMH_REGULATOR_MODE_HPM>;
>  			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
>  		};
>  
>  		vreg_l7b_2p952: ldo7 {
>  			regulator-name = "vreg_l7b_2p952";
> -			regulator-min-microvolt = <2400000>;
> -			regulator-max-microvolt = <3544000>;
> +			regulator-allow-set-load;
> +			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM RPMH_REGULATOR_MODE_HPM>;
>  			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
>  		};
>  
> @@ -277,8 +279,8 @@ vreg_l8b_0p904: ldo8 {
>  
>  		vreg_l9b_1p2: ldo9 {
>  			regulator-name = "vreg_l9b_1p2";
> -			regulator-min-microvolt = <1200000>;
> -			regulator-max-microvolt = <1304000>;
> +			regulator-allow-set-load;
> +			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM RPMH_REGULATOR_MODE_HPM>;
>  			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
>  		};
>  
> @@ -467,6 +469,8 @@ vreg_l10c_0p88: ldo10 {
>  			regulator-name = "vreg_l10c_0p88";
>  			regulator-min-microvolt = <720000>;
>  			regulator-max-microvolt = <1050000>;
> +			regulator-allow-set-load;
> +			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM RPMH_REGULATOR_MODE_HPM>;
>  			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
>  		};
>  
> -- 
> 2.34.1
> 

