Return-Path: <linux-arm-msm+bounces-75182-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 16341BA136D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Sep 2025 21:36:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 23FAC7BA976
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Sep 2025 19:35:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA77931B816;
	Thu, 25 Sep 2025 19:36:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="S4n5h9fc";
	dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="vZiG+hlB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AAB52E8B8A;
	Thu, 25 Sep 2025 19:36:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.75.144.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758828997; cv=none; b=WeybF3s1H+cCiiR6SYE5eMyJUzWi0KekTw7HMZqJhDLShghJXWwiYIllcGEqz38EoNFyZ6lkiG6RbToVe6d40x2znaXIGEZuW5x+zM7bPw18FO2xQKLgUU3C+6NsA1SB03S5qP8H56SDjMKNnAEaSu1PJFgG7EfoThnt5dLYcOU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758828997; c=relaxed/simple;
	bh=wUCV5gZxAYMRE5R8Fyb0RkkstbddJPktPAhrNem9sMU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SsYeFdN3ElxrsZocQpQvdWbJ+qAHYZGZ6J3jJHS2zgT+qRpleXz5R8IVxECGGUV+Tdh5sPFhfiK6kqEAb3X5fnBt8KiR7NREsicqz2ImcOPoe+dWfchUZLKd7k8eTpoSsnt+nmujrUvnt9jyyk3NgdE09w1kHDuVER6ONaWCfN4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org; spf=pass smtp.mailfrom=mainlining.org; dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=S4n5h9fc; dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=vZiG+hlB; arc=none smtp.client-ip=5.75.144.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org; c=relaxed/relaxed;
	h=From:To:Subject:Date:Message-ID; t=1758828885; bh=qajMjw3QsMJTz3D164BqXP1
	pakOaeLD61QWvXvNAFNU=; b=S4n5h9fcKQ0Y21h8RuONku8Hocsd+4OTv9Xfp/hFb9A/6vsk3h
	O+WXPt6klKux5I7ya2oSnGOOIHue/pH17CheCrkrphrxc0crsi3pXJ8gIHfVmokCGgg+6RUWFJu
	n1YL6DWXNLhQ+nNSiZ610tAe/OkZuPrI3pl2UQ/6Nqx8Pf/OB8R5OpcmifF8EvQufiYLLEy9Ano
	keW4SYqS4OSFJbW36G0usaZp5BpNj7/Gpo+RLoovpore3BFByg4GbOwg94LchskyOxt0h9POIF1
	tPQAJ/hoc/S5P7FGJWqW3LanOM50f/SYJxJh6RhQ9O0FaCfrZP9TikZXA90sSJhqqlg==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org; c=relaxed/relaxed;
	h=From:To:Subject:Date:Message-ID; t=1758828885; bh=qajMjw3QsMJTz3D164BqXP1
	pakOaeLD61QWvXvNAFNU=; b=vZiG+hlBLFjNzb7KoNNG/kytOS7piGnGwYp9/mFOPP0t7PXiWl
	4gm0IRw5gHJJFsdrMy+WpcgJIVs0XxmOzRDg==;
Message-ID: <44229f2c-7004-480f-973b-a36e3288959b@mainlining.org>
Date: Thu, 25 Sep 2025 21:34:44 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/8] arm64: dts: qcom: sdm845-oneplus: Correct panel reset
 gpio polarity
To: david@ixit.cz, Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Thierry Reding
 <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Casey Connolly <casey.connolly@linaro.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 phone-devel@vger.kernel.org
References: <20250925-s6e3fc2x01-v1-0-9293016768f7@ixit.cz>
 <20250925-s6e3fc2x01-v1-5-9293016768f7@ixit.cz>
Content-Language: en-US
From: Jens Reidel <adrian@mainlining.org>
In-Reply-To: <20250925-s6e3fc2x01-v1-5-9293016768f7@ixit.cz>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/25/25 11:12, David Heidelberg via B4 Relay wrote:
> From: David Heidelberg <david@ixit.cz>
> 
> Reset GPIO should be active in high state as usually the board doesn't
> invert the polarity.
> 
> Fixes: 288ef8a42612 ("arm64: dts: sdm845: add oneplus6/6t devices")
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---
>   arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi b/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi
> index aff5e80c1eba43e830991c2afd53b6322893cd27..7f968f90a83b869395bedd5de510ba96de3c4e94 100644
> --- a/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi
> @@ -456,7 +456,7 @@ display_panel: panel@0 {
>   		vci-supply = <&panel_vci_3v3>;
>   		poc-supply = <&panel_vddi_poc_1p8>;
>   
> -		reset-gpios = <&tlmm 6 GPIO_ACTIVE_LOW>;
> +		reset-gpios = <&tlmm 6 GPIO_ACTIVE_HIGH>;
>   
>   		pinctrl-names = "default";
>   		pinctrl-0 = <&panel_reset_pins &panel_te_pin &panel_esd_pin>;
> 

Hi David,

according to the schematics available to me, this GPIO is active low (as 
on most other Qualcomm phones). I'd suggest dropping this and the driver 
change.

Best regards,
Jens

