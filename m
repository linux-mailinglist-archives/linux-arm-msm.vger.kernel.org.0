Return-Path: <linux-arm-msm+bounces-53287-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 41378A7CDDA
	for <lists+linux-arm-msm@lfdr.de>; Sun,  6 Apr 2025 14:21:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E2BA63B18A7
	for <lists+linux-arm-msm@lfdr.de>; Sun,  6 Apr 2025 12:21:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1791B20E71B;
	Sun,  6 Apr 2025 12:21:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dxAgbCgK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDEAC14A4F9;
	Sun,  6 Apr 2025 12:21:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743942113; cv=none; b=a69K13wVM25LKsqo1cF3CnXR3xJGDfH9bfIePbXVYGL8TgRVCznr9Ao5aF0UXthlCIziOz+LfYJ7IncJmjxciwrZqCnbFBxejfwfNlNYT9+8Z9o7dlKjY84D4k0HU4752UR9NobC6ChJSL8E3g5tE+X6xjGTl2EyqaaemZokts0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743942113; c=relaxed/simple;
	bh=AY+s8uk+3zEBzpGaOEXfbqJ8aK9Dqgyl5lmPlL0ivo0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Tt1D/qgykNq/I/y8b3hS97o8EYqQNulTFYHVquaS1Gi+wvCkTfzWFbbTBNbboSPLHHKlpxLwnlGbxC56Lj9PpKos5e1bCHdI3Ejsfz0a0szGYzLYIg908J9fRBzlvUUb+4J/eBKNrpbmpJBgZdIZ8eUhLY26oXzmI0QqyQ6V96M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dxAgbCgK; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6EFBBC4CEE3;
	Sun,  6 Apr 2025 12:21:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743942112;
	bh=AY+s8uk+3zEBzpGaOEXfbqJ8aK9Dqgyl5lmPlL0ivo0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=dxAgbCgKK6t2H0SjxgshKRvESDJ/4Ei3MdI607sU1vcJ9AD0evVsZiBSZALE0e26q
	 5ONvSMDnFP1Sw2/SU/utMb19AGK5K/ttSkC4Z6x3VGfLiXYkeHl1b8sZAZm1Mc+FnX
	 rPayO2jn0Tooxbmd6dmW6Pd0UdRJjjcdrkS2jahZwT2hc5dg4hhCBUnQ7JLXjvTkK/
	 Nq3WGSWE8Ow9ZjErtWc9ZRMrI4uR0wI96ErLydk6od7MJDKJoOVTHVFL2gjoKhyLO4
	 /XHZZpoAAVrDsrNOoOiBpZoKgfp5AkLKMDH1LNhMIWqbhu+QlHRHvGQNacI7t90nYP
	 jYkEs+4xsuBAg==
Message-ID: <e9265770-784a-4682-b3b3-bace88aef36c@kernel.org>
Date: Sun, 6 Apr 2025 14:21:47 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] phy: qualcomm: phy-qcom-eusb2-repeater: rework reg
 override handler
To: Pengyu Luo <mitltlatltl@gmail.com>, Bjorn Andersson
 <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org
References: <20250405174319.405975-1-mitltlatltl@gmail.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 fv0=
In-Reply-To: <20250405174319.405975-1-mitltlatltl@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 05/04/2025 19:43, Pengyu Luo wrote:
> In downstream tree, many registers need to be overrided, it varies
> from devices and platforms, not only HS trasmit amplitude(0x51),
> HS disconnect threshold(0x53), Tx pre-emphasis tuning(0x57).
> 
> The device I plan to upstream also uses it, so I write the patch for
> it (Oneplus Pad Pro / Oneplus Pad 2, sm8650-mtp based).
> 
> In upstream, only Sony Xperia 1 V is using this, so fixing it for sony,
> in downstream, some crd, mtp, htk devices also use it, I have no
> such device, don't set it for them.
> 
> Signed-off-by: Pengyu Luo <mitltlatltl@gmail.com>
> ---
>  .../qcom/sm8550-sony-xperia-yodo-pdx234.dts   |  5 +-
>  .../phy/qualcomm/phy-qcom-eusb2-repeater.c    | 86 +++++++++++++++----

DTS is always separate patch.

>  2 files changed, 72 insertions(+), 19 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm8550-sony-xperia-yodo-pdx234.dts b/arch/arm64/boot/dts/qcom/sm8550-sony-xperia-yodo-pdx234.dts
> index d90dc7b37..99f5fd32c 100644
> --- a/arch/arm64/boot/dts/qcom/sm8550-sony-xperia-yodo-pdx234.dts
> +++ b/arch/arm64/boot/dts/qcom/sm8550-sony-xperia-yodo-pdx234.dts
> @@ -673,9 +673,8 @@ cam_pwr_a_cs: cam-pwr-a-cs-state {
>  };
>  
>  &pm8550b_eusb2_repeater {
> -	qcom,tune-usb2-disc-thres = /bits/ 8 <0x6>;
> -	qcom,tune-usb2-amplitude = /bits/ 8 <0xf>;
> -	qcom,tune-usb2-preem = /bits/ 8 <0x7>;
> +	qcom,param-override-seq = <0x51 0x08 0x53 0x06 0x57 0x07>;
> +	qcom,host-param-override-seq = <0x51 0x08 0x53 0x06 0x57 0x07>;

There are no such properties.

It does not look like you tested the DTS against bindings. Please run
`make dtbs_check W=1` (see
Documentation/devicetree/bindings/writing-schema.rst or
https://www.linaro.org/blog/tips-and-tricks-for-validating-devicetree-sources-with-the-devicetree-schema/
for instructions).
Maybe you need to update your dtschema and yamllint. Don't rely on
distro packages for dtschema and be sure you are using the latest
released dtschema.

>  	vdd18-supply = <&pm8550_l15>;
>  	vdd3-supply = <&pm8550_l5>;
>  };


...

> +
>  static int eusb2_repeater_init_vregs(struct eusb2_repeater *rptr)
>  {
>  	int num = rptr->cfg->num_vregs;
> @@ -127,20 +189,12 @@ static int eusb2_repeater_init_vregs(struct eusb2_repeater *rptr)
>  static int eusb2_repeater_init(struct phy *phy)
>  {
>  	struct eusb2_repeater *rptr = phy_get_drvdata(phy);
> -	struct device_node *np = rptr->dev->of_node;
>  	struct regmap *regmap = rptr->regmap;
>  	const u32 *init_tbl = rptr->cfg->init_tbl;
> -	u8 tune_usb2_preem = init_tbl[TUNE_USB2_PREEM];
> -	u8 tune_hsdisc = init_tbl[TUNE_HSDISC];
> -	u8 tune_iusb2 = init_tbl[TUNE_IUSB2];
>  	u32 base = rptr->base;
>  	u32 val;
>  	int ret;
>  
> -	of_property_read_u8(np, "qcom,tune-usb2-amplitude", &tune_iusb2);
> -	of_property_read_u8(np, "qcom,tune-usb2-disc-thres", &tune_hsdisc);
> -	of_property_read_u8(np, "qcom,tune-usb2-preem", &tune_usb2_preem);

NAK, that's an ABI break.


Best regards,
Krzysztof

