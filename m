Return-Path: <linux-arm-msm+bounces-52009-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 33283A693A8
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Mar 2025 16:37:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DD0AF1896FC6
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Mar 2025 15:11:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5A6361E7C02;
	Wed, 19 Mar 2025 15:05:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fQIxiPWS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E9DE1A287E;
	Wed, 19 Mar 2025 15:05:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742396756; cv=none; b=JDW747tY1XLsaHcxgMKNvcpyDvvU4ScLOTjQVmJgVeXjlpmu7aWdvpVn3cf7Ln8oA631wDYhwY2+Gg0XFoZkFFOR/eP0jHuiRlSJYea5YPQ5L5p2+nFd/HHM99NM9z1oZotyagSxbIHp8kqcdFFdsjFJt2GKYaBVM2KfwmsvqgA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742396756; c=relaxed/simple;
	bh=8k/NN1IRWjEMB310zakuzqWSMhP6sJUbg/j5NSqk/z8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=s0i2g17MaP1/+NehfZc6VkDOxSSaBZ5iO1te8bPno0DcbTWIGayU2OBkp+9Eb85M3WAsDr7swXsJNOgfTpHNFoEibm7anEMAxCNmjGPId4yWNMg2r8Fjkc2r3A4Pxf55/hxNLzyuE0KtsiQbiXL28vemQF6M38ZgoG4sQSW1pew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fQIxiPWS; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-391342fc1f6so5666371f8f.1;
        Wed, 19 Mar 2025 08:05:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742396753; x=1743001553; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=HOyGSoTfNZpOOzMSJjC6LVqzO57/1qzFZh1n8PH/Tyo=;
        b=fQIxiPWSfiELLOP6pu+mTjQWdmohZO6Tz3ILAeJDRmBOJZedmBWnPOaFhzTmlDGauV
         c2kGS4fnn+0Ns34LP40sOxUyrvvMbT0Y848cxp/lkTpa0y+tAH/gD5HqfErYXTGF3v7z
         pNRU4Rqac8rnCfC0kObLeJ/Vxk5+x8qDn983iOTzmaLVty0yh07eGj/B7OVeCho16S7v
         qIc4yjhEoUXC6Y+xgcZpAvsyT4Lt9MR/zMyePIGMbN0U62To6pHvO8NwFiCp8LcbHaey
         Y4qoT6LfZhzBmi5DoYzM3zsq6X40T12MPCz+VctTj+h8dNy4MiBLV2jVFj8dPUElY/tM
         Pn5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742396753; x=1743001553;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HOyGSoTfNZpOOzMSJjC6LVqzO57/1qzFZh1n8PH/Tyo=;
        b=rQR/tcydMYZvCtLI4SASDQBJ3zoDzRJ0jjmVi3WwyQsrxmlBT1+sp4tUbdpvNJC+g7
         3FTlEpkvf+e1NDSaaa+pihbJF/39l29k9RK2yNgdKawPcxuoZ6O3gLPk1ayBe/eZDsAv
         bUZgX2TkklTCdls+WZf8Lik86Ky1z5xD+XGKYuSMwMLLQGQzOC0+/laTG5yZm1HJbXua
         Nu1ito9LCNseCCNC34J53z0hBGxaTCF/FP2COqKUhWmM+BRAN5t01/6c9mGv5G/nkGLb
         qJlqmVRe5mbJ8ABLl9UC5zrHZm4doLWq+2rYrn1tDyfGOYQtJbWxfEaVriSXvnW20RQk
         7vZg==
X-Forwarded-Encrypted: i=1; AJvYcCVwR9oQj0CC4amfIncrhhv3Gtd5K7MunQA/1ZxKQdA3bF58xv0sO+bUV9EKuirT3CD8a76D2iUTEyaaj3kT@vger.kernel.org, AJvYcCW+qP4z9IJQJnO009SsiMzICKUZxUC70LjgXGIrBIGEx3yiUchHYUrpD1+59TqloxXQoviqzETpUjswVJOcxg==@vger.kernel.org, AJvYcCWikIe+/PVd425RO41ktSdyDGJtfaR/8Nwme4wFpNL/nrP6QAvafhj6kWKqOActV9s0sgtMlsAhySL3@vger.kernel.org
X-Gm-Message-State: AOJu0YxKd47Ch2jKwYEl5dWtRSfg+BV8OoPZtFcY2BDZ+W8ZbPRiB/4e
	DLEZJ2f2sLverN19b/FVR3oay9P08aZYgcRLQi3nZs/7wrVCMf38tzLoHb4ACO0xwmdL9t7NnUP
	RV6BO3c456egH6hfSKFBweItR/v6UEXw=
X-Gm-Gg: ASbGnctz9BwTcRQk4+ZwxVjCNH4hffiv9OzrG0qmZ2+RpX7o2wFzBGJSlw1gdFRFYEN
	98PRfjUY3es7Hme9WwgK6I4d3oivwTxHKi51BHtnRT/6vgwg9lCuUi+bk3qtW+KBPl2s1MkoZac
	3Wody3gN/qdRucb0DCi+I9705I
X-Google-Smtp-Source: AGHT+IGC/R96rPwTERLJePIydO6jKIySRg2zYE+ph5TmCcY3KwvMWmVEkhFCZCeurqMtuMEnbnzNGRWgGuqjV8M2Z0E=
X-Received: by 2002:a05:6000:1a8d:b0:390:f358:85db with SMTP id
 ffacd0b85a97d-399739cb803mr2722684f8f.30.1742396751967; Wed, 19 Mar 2025
 08:05:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250318-xps13-fingerprint-v1-0-fbb02d5a34a7@oss.qualcomm.com> <20250318-xps13-fingerprint-v1-2-fbb02d5a34a7@oss.qualcomm.com>
In-Reply-To: <20250318-xps13-fingerprint-v1-2-fbb02d5a34a7@oss.qualcomm.com>
From: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
Date: Wed, 19 Mar 2025 16:05:41 +0100
X-Gm-Features: AQ5f1JpkAuHBa-ujJG783-R3MMWDYz5CK-ClmB7izDMWS65sqz5YqQlN7PR71j8
Message-ID: <CAMcHhXoE+UvoKmy1ULJoAq1nrr+PO6qie3vxLuqQbUpiE=SMBQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] arm64: dts: qcom: x1e80100-dell-xps13-9345: Enable
 fingerprint sensor
To: bjorn.andersson@oss.qualcomm.com
Cc: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 19 Mar 2025 at 04:22, Bjorn Andersson via B4 Relay
<devnull+bjorn.andersson.oss.qualcomm.com@kernel.org> wrote:
>
> From: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
>
> The fingerprint sensor, hidden in the power button, is connected to one
> of the USB multiport ports; while the other port is unused.
>
> Describe the USB controller, the four phys and the repeater involved to
> make the fingerprint sensor operational.
>
> Signed-off-by: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
> ---

Thanks for getting to the bottom of this, it was certainly a long
awaited feature :)

>  .../boot/dts/qcom/x1e80100-dell-xps13-9345.dts     | 59 +++++++++++++++++++++-
>  1 file changed, 57 insertions(+), 2 deletions(-)
>
> diff --git a/arch/arm64/boot/dts/qcom/x1e80100-dell-xps13-9345.dts b/arch/arm64/boot/dts/qcom/x1e80100-dell-xps13-9345.dts
> index 967f6dba0878b51a985fd7c9570b8c4e71afe57d..a35557c562d771e2ce209fca05b82c1943d70f63 100644
> --- a/arch/arm64/boot/dts/qcom/x1e80100-dell-xps13-9345.dts
> +++ b/arch/arm64/boot/dts/qcom/x1e80100-dell-xps13-9345.dts
> @@ -744,8 +744,21 @@ touchscreen@10 {
>
>  &i2c9 {
>         clock-frequency = <400000>;
> -       status = "disabled";
> -       /* USB3 retimer device @0x4f */
> +       status = "okay";
> +
> +       eusb6_repeater: redriver@4f {
> +               compatible = "nxp,ptn3222";
> +               reg = <0x4f>;
> +               #phy-cells = <0>;
> +
> +               vdd3v3-supply = <&vreg_l13b_3p0>;
> +               vdd1v8-supply = <&vreg_l4b_1p8>;
> +
> +               reset-gpios = <&tlmm 184 GPIO_ACTIVE_LOW>;
> +
> +               pinctrl-0 = <&eusb6_reset_n>;
> +               pinctrl-names = "default";
> +       };
>  };
>
>  &i2c17 {
> @@ -967,6 +980,14 @@ edp_reg_en: edp-reg-en-state {
>                 bias-disable;
>         };
>
> +       eusb6_reset_n: eusb6-reset-n-state {
> +               pins = "gpio184";
> +               function = "gpio";
> +               drive-strength = <2>;
> +               bias-disable;
> +               output-low;
> +       };
> +
>         hall_int_n_default: hall-int-n-state {
>                 pins = "gpio92";
>                 function = "gpio";
> @@ -1172,3 +1193,37 @@ &usb_1_ss1_dwc3_hs {
>  &usb_1_ss1_qmpphy_out {
>         remote-endpoint = <&retimer_ss1_ss_in>;
>  };
> +
> +&usb_mp {
> +       status = "okay";
> +};
> +
> +&usb_mp_hsphy0 {
> +       vdd-supply = <&vreg_l2e_0p8>;
> +       vdda12-supply = <&vreg_l3e_1p2>;
> +
> +       phys = <&eusb6_repeater>;

I was under the impression that the fingerprint reader is on the 2nd
port of the root hub, as:
* In ACPI, the only USB device of MP is listed under PRT1, PRT0 is empty
* On Windows the device is listed as PORT2...HUB1...
* `lsusb -t` for the device gives `Port 002: Dev 002,...12M`

Do `usb_mp_hsphy0` and `usb_mp_hsphy1` translate to port 1 and 2
respectively? Because if yes, repeater may belong to `usb_mp_hsphy1`
instead?

Current series works. Moving `phys = <&eusb6_repeater>;` to
`usb_mp_hsphy1` also works, I'm assuming because we are not actually
disabling unused phys.

Tested-by: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>


> +
> +       status = "okay";
> +};
> +
> +&usb_mp_hsphy1 {
> +       vdd-supply = <&vreg_l2e_0p8>;
> +       vdda12-supply = <&vreg_l3e_1p2>;
> +
> +       status = "okay";
> +};
> +
> +&usb_mp_qmpphy0 {
> +       vdda-phy-supply = <&vreg_l3e_1p2>;
> +       vdda-pll-supply = <&vreg_l3c_0p9>;
> +
> +       status = "okay";
> +};
> +
> +&usb_mp_qmpphy1 {
> +       vdda-phy-supply = <&vreg_l3e_1p2>;
> +       vdda-pll-supply = <&vreg_l3c_0p9>;
> +
> +       status = "okay";
> +};
>
> --
> 2.48.1
>
>

