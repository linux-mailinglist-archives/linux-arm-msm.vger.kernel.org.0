Return-Path: <linux-arm-msm+bounces-16355-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 327D5897895
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Apr 2024 20:49:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 63F3E1C25B72
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Apr 2024 18:49:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A330154446;
	Wed,  3 Apr 2024 18:49:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fFzbgTvT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49C6E15443A;
	Wed,  3 Apr 2024 18:49:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712170152; cv=none; b=GFwqhVo54DACotO266Mv1KmAVLbMkPhU2DFSA2pg/i3RkF4hzam45Gg5uNabPY8Wtz+NSYllihw9jTG4W1FkProeI9rr9+FcTB0LNDCPjjn8C+2c5Ku0iuVIkBOzi/lGhPiYuV9kRg5rEFkd5KmZLLasGlvPAT7HWHrnDNciE+c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712170152; c=relaxed/simple;
	bh=JKM5//cniCgGWiAkMt6BL9AsQQvGCAfAneEWSePSz+A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eopJY4LAywXKqq5l3Hymr9kUCFGZnHMiNRs6VgNxq9LIjsuYPllIK9D99jD2Rjas0A+UCg82zc7TtUi7iV5jot1QOjO60qhN05mw+Trb+oBWmDi8ssWUNu/rRM6tgaIcoBp3VZx2C42+rY6LtTrn+y1r9Pg/Q3m9T9L6ao/9czE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fFzbgTvT; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DA097C433F1;
	Wed,  3 Apr 2024 18:49:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712170151;
	bh=JKM5//cniCgGWiAkMt6BL9AsQQvGCAfAneEWSePSz+A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fFzbgTvTalr1RD/I3zgRhTnt/ugqud5qonc50YyoZe4YQW4R1j3bCf3l3iOIK6vSY
	 B4SVft2dI4Bs75WpkpbIFqqqyNKIS3Hqxi06rRzv0yrXMwOpbXh79/VKWni3pAoL6c
	 g7UZs671R4JvQ5ToULLJK3lOy27M011/PiPGruEsf6aR0WsD3AkbtGWUikXj/SojJu
	 bsTec0IYpGK1Jt77vThLiBoMg0RQnaYn77ihO1kxMs/IOGTvNS0h0X0hr17Hjar5Sp
	 ePkrBzHmOLmNdoJ0R7cbda3nsgpvPvBQRHokg16JmABLYcp/uh6SHm1Kr1IXpF81sM
	 zp6ckEWWI+ddw==
Date: Wed, 3 Apr 2024 13:49:09 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: Raymond Hackley <raymondhackley@protonmail.com>
Cc: linux-kernel@vger.kernel.org, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Conor Dooley <conor+dt@kernel.org>, Stephan Gerhold <stephan@gerhold.net>, 
	Nikita Travkin <nikita@trvn.ru>, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	~postmarketos/upstreaming@lists.sr.ht, Joe Mason <buddyjojo06@outlook.com>
Subject: Re: [PATCH v2] arm64: dts: qcom: msm8916-samsung-fortuna: Add
 touchscreen
Message-ID: <dyeqnhgvlzw44baihb257lhacei723iqoskthh2bjsfsgvxfrq@6hnk4f3ncsfl>
References: <20240312074536.62964-1-raymondhackley@protonmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240312074536.62964-1-raymondhackley@protonmail.com>

On Tue, Mar 12, 2024 at 07:45:42AM +0000, Raymond Hackley wrote:
> diff --git a/arch/arm64/boot/dts/qcom/msm8916-samsung-fortuna-common.dtsi b/arch/arm64/boot/dts/qcom/msm8916-samsung-fortuna-common.dtsi
[..]
> +&blsp_i2c5 {
> +	status = "okay";
> +
> +	touchscreen: touchscreen@20 {
> +		compatible = "zinitix,bt541";
> +		reg = <0x20>;
> +
> +		interrupts-extended = <&tlmm 13 IRQ_TYPE_EDGE_FALLING>;
> +
> +		touchscreen-size-x = <540>;
> +		touchscreen-size-y = <960>;
> +
> +		vcca-supply = <&reg_vdd_tsp_a>;
> +		vdd-supply = <&pm8916_l6>;
> +
> +		pinctrl-0 = <&tsp_int_default>;
> +		pinctrl-names = "default";
> +
> +		linux,keycodes = <KEY_APPSELECT KEY_BACK>;

linux,keycodes is not a valid property of zinitix,bt541 according to the
DeviceTree binding. Is there a binding update for this somewhere?

Regards,
Bjorn

