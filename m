Return-Path: <linux-arm-msm+bounces-52869-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 52ED5A76350
	for <lists+linux-arm-msm@lfdr.de>; Mon, 31 Mar 2025 11:40:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F12F1167BDA
	for <lists+linux-arm-msm@lfdr.de>; Mon, 31 Mar 2025 09:40:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB0AF1DC991;
	Mon, 31 Mar 2025 09:40:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fyJlEn4l"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2D151D79BE;
	Mon, 31 Mar 2025 09:40:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743414016; cv=none; b=W31u9peAuX3o2BDvNJf9lReQuTKlK0KH+jljpcNcnZuzvmcbiK63OBYKJnZGuqNr6I01TT74kwlO7yF7bqKf4Hj85HsPgPaASPJsdc5JyijGQhmD4WnPhuRmOgsQsC0Yo7P3sXitQtpve47wU4OG865U5M/qEKkFAFPX2XkeTDA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743414016; c=relaxed/simple;
	bh=nMX3IGJ7GC9vrEVtIfGPy59MwqtQlNq1k/SBbKyNANs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Lug1BaHUuziR+ae2P7zxdbKeE639HoUsqpLTKnlR36IggKw3bWu68QhgTyQAkoaBX/Z0mv2fG5fmJXj01zOVm61bj6XukUIYzMMrCWAhGF3Hy2nkdxaZsieije+CupBHDY5/viNlUVcH9J6CDom+I8pQtkEoBLDBrF4FSAdSZis=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fyJlEn4l; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-3914aba1ce4so3649422f8f.2;
        Mon, 31 Mar 2025 02:40:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743414013; x=1744018813; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=JjQZlyI0PFgPo2HUEqF8PMucWTYolhHAAwqiEE3bdvA=;
        b=fyJlEn4lAHlB+mKXvyFjDPqbLq41j7EQ7VCl/VcqmPhCfdlLpiNLsEd0fgdtYxgYGC
         NOol9AC6uymNhlDX0vEkZLS31LwemSc1LJkIC+xY6REWoekXVSbg0ciQiHG+GQn4a++K
         yI4AkY5OENmFWPcfZ5EFlora5ZOTDXQOA5CAvylWgvudcBTxBye8tyOte+KKV5kqXc6G
         ANs0VXTLIrHAPxRxvD+icawSgE9MEMZpXR3SLwoiPwTmSFaz93h8VWdxbdqd3Tw0lWgQ
         h3YR8a2ShPDJwZZQ6jTkLuDKTbDKnNSnVJfDQ1nGIlRFsHfA6wNv7mS1j5WZ/M0koImt
         qa2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743414013; x=1744018813;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JjQZlyI0PFgPo2HUEqF8PMucWTYolhHAAwqiEE3bdvA=;
        b=v5QfPZpeWH1erbiF5reiDedZSm7GLTOJlYWdiPTMRX1fghsH8QrNgQJUBuU9MrBfpY
         9WzpiXFCzK0eaxOelmZVYMwh2l+KsPLejDf/lP1KhsXrrHP6bnhMpgd46gx4+Y23EinN
         CbSyROwMMmJDiXYaEfjr6k7mFRg6V7xXqKEnwp8f+WsFrnoBc7UIOwACCuubHypars0g
         il//BQanjFtrPLvY21YvkmM5+THykLUBUmh3vUce7lI8aG/USVB8iEUkFcpT8IsFG++c
         TogUkGyDQTLCABpo+iZ+CpXBPXbX1jn0ho4L0Twi6e5QuCgyONvPvkK4a/ZI+PY6mkry
         b4Ag==
X-Forwarded-Encrypted: i=1; AJvYcCUhiCay+Q87a21cUhqtCYU2BC0RrqBlqRSd02AS9Z+qMbvPJdjhcFhC7KDiEfk+yi3zJWZ5/LFMXeY4@vger.kernel.org, AJvYcCVkyL4rvWm0M4c29uji+2ocVJ4dn8kL6bWQD4fui6AfRZayo9Hn3ASnwqWhmFHF3oh/4JMVUhU4tF2nwvUxWQ==@vger.kernel.org, AJvYcCWUro2+6256t4EGpQy6dnuPuOH2TnDPLlHDopy5GR7oYzI1tALEpkC7Zh+PiyIuAW1hx53/DWb0+gztBQCj@vger.kernel.org
X-Gm-Message-State: AOJu0YxrAbDKMKpsFYCSVr+MQ9Z8l1mXPGCj5E/wBCoKtsRRBHY9mjUb
	ZnHUme+mhG+LwFn/MHhYcE2aw0hqyQyUMWCxGgi63suNWIatsBu+qh8AHk+11ijJfx+C4hJJVQa
	hHfozwLkow0UJXtMda+4ZpxFNdcP2Ixg=
X-Gm-Gg: ASbGncuUTUPagO5JkG9v+zmadS8AO18+HcfT36JZI9oy5vYFawxqWlUlpJpbZjEnc2o
	cNX7ms4IauHxxMux4C+73jMFbo7EY5VuwNLNR4oG35AFqasIPix/6WLDi8Swz/ElYV8vivYVYqh
	e2aQ8ikFljjx3lNbXHeQuXKcT7Dx0=
X-Google-Smtp-Source: AGHT+IGJqETcPiW9nG9rhNnFNRquMrUSFnDjKfV9Q56KVX9uQRQYNIALdhSGqE9iIde5xBqD+kdC0uMd3Q0vlpx9Qw0=
X-Received: by 2002:a05:6000:4014:b0:391:3f4f:a17f with SMTP id
 ffacd0b85a97d-39c12114f62mr5643753f8f.42.1743414012823; Mon, 31 Mar 2025
 02:40:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250331073423.3184322-1-alex.vinarskis@gmail.com>
 <Kmx7uzaPq9EGzQRvF45vBLhnHsciykaPCkrFKQdJlalp9j3T9eM0ENFJjIf_zYng1nEoq9cLOfzgLb03XgK2sg==@protonmail.internalid>
 <20250331073423.3184322-2-alex.vinarskis@gmail.com> <c88b3350-00a8-4596-8713-a8acd829155d@linaro.org>
In-Reply-To: <c88b3350-00a8-4596-8713-a8acd829155d@linaro.org>
From: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
Date: Mon, 31 Mar 2025 11:40:00 +0200
X-Gm-Features: AQ5f1Jpqv0NDNXC-FdJm04Wx102tcPpJbWFWkPH75cy5r-kM_euDXLOH6zcg1B8
Message-ID: <CAMcHhXrg61wnNyh6oExNjY5L0xORGQtzJTrs56rj58QZJXDc0A@mail.gmail.com>
Subject: Re: [PATCH v2 1/1] arm64: dts: qcom: x1e80100-dell-xps-9345: Add
 WiFi/BT pwrseq
To: "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>
Cc: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	laurentiu.tudor1@dell.com, dmitry.baryshkov@oss.qualcomm.com
Content-Type: text/plain; charset="UTF-8"

On Mon, 31 Mar 2025 at 10:33, Bryan O'Donoghue
<bryan.odonoghue@linaro.org> wrote:
>
> On 31/03/2025 08:33, Aleksandrs Vinarskis wrote:
> > Add the WiFi/BT nodes for XPS and describe the regulators for the WCN7850
> > combo chip using the new power sequencing bindings. All voltages are
> > derived from chained fixed regulators controlled using a single GPIO.
> >
> > Based on the commit d09ab685a8f5 ("arm64: dts: qcom: x1e80100-qcp: Add
> > WiFi/BT pwrseq").
> >
> > With that fixed commit f5b788d0e8cd ("arm64: dts: qcom: Add support for
> > X1-based Dell XPS 13 9345")
> >
> > Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> > Signed-off-by: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
> > ---
> >   .../dts/qcom/x1e80100-dell-xps13-9345.dts     | 144 ++++++++++++++++++
> >   1 file changed, 144 insertions(+)
> >
> > diff --git a/arch/arm64/boot/dts/qcom/x1e80100-dell-xps13-9345.dts b/arch/arm64/boot/dts/qcom/x1e80100-dell-xps13-9345.dts
> > index d259a0d12d7b..c924f2a67939 100644
> > --- a/arch/arm64/boot/dts/qcom/x1e80100-dell-xps13-9345.dts
> > +++ b/arch/arm64/boot/dts/qcom/x1e80100-dell-xps13-9345.dts
> > @@ -22,6 +22,7 @@ / {
> >
> >       aliases {
> >               serial0 = &uart21;
> > +             serial1 = &uart14;
> >       };
> >
> >       gpio-keys {
> > @@ -288,6 +289,101 @@ vreg_vph_pwr: regulator-vph-pwr {
> >               regulator-always-on;
> >               regulator-boot-on;
> >       };
> > +
> > +     vreg_wcn_0p95: regulator-wcn-0p95 {
> > +             compatible = "regulator-fixed";
> > +
> > +             regulator-name = "VREG_WCN_0P95";
> > +             regulator-min-microvolt = <950000>;
> > +             regulator-max-microvolt = <950000>;
> > +
> > +             vin-supply = <&vreg_wcn_3p3>;
> > +     };
> > +
> > +     vreg_wcn_1p9: regulator-wcn-1p9 {
> > +             compatible = "regulator-fixed";
> > +
> > +             regulator-name = "VREG_WCN_1P9";
> > +             regulator-min-microvolt = <1900000>;
> > +             regulator-max-microvolt = <1900000>;
> > +
> > +             vin-supply = <&vreg_wcn_3p3>;
> > +     };
> > +
> > +     vreg_wcn_3p3: regulator-wcn-3p3 {
> > +             compatible = "regulator-fixed";
> > +
> > +             regulator-name = "VREG_WCN_3P3";
> > +             regulator-min-microvolt = <3300000>;
> > +             regulator-max-microvolt = <3300000>;
> > +
> > +             gpio = <&tlmm 214 GPIO_ACTIVE_HIGH>;
> > +             enable-active-high;
> > +
> > +             pinctrl-0 = <&wcn_sw_en>;
> > +             pinctrl-names = "default";
> > +
> > +             regulator-boot-on;
> > +     };
> > +
> > +     wcn7850-pmu {
> > +             compatible = "qcom,wcn7850-pmu";
> > +
> > +             vdd-supply = <&vreg_wcn_0p95>;
> > +             vddio-supply = <&vreg_l15b_1p8>;
> > +             vddaon-supply = <&vreg_wcn_0p95>;
> > +             vdddig-supply = <&vreg_wcn_0p95>;
> > +             vddrfa1p2-supply = <&vreg_wcn_1p9>;
> > +             vddrfa1p8-supply = <&vreg_wcn_1p9>;
> > +
> > +             wlan-enable-gpios = <&tlmm 117 GPIO_ACTIVE_HIGH>;
> > +             bt-enable-gpios = <&tlmm 116 GPIO_ACTIVE_HIGH>;
> > +
> > +             pinctrl-0 = <&wcn_wlan_bt_en>;
> > +             pinctrl-names = "default";
> > +
> > +             regulators {
> > +                     vreg_pmu_rfa_cmn: ldo0 {
> > +                             regulator-name = "vreg_pmu_rfa_cmn";
> > +                     };
> > +
> > +                     vreg_pmu_aon_0p59: ldo1 {
> > +                             regulator-name = "vreg_pmu_aon_0p59";
> > +                     };
> > +
> > +                     vreg_pmu_wlcx_0p8: ldo2 {
> > +                             regulator-name = "vreg_pmu_wlcx_0p8";
> > +                     };
> > +
> > +                     vreg_pmu_wlmx_0p85: ldo3 {
> > +                             regulator-name = "vreg_pmu_wlmx_0p85";
> > +                     };
> > +
> > +                     vreg_pmu_btcmx_0p85: ldo4 {
> > +                             regulator-name = "vreg_pmu_btcmx_0p85";
> > +                     };
> > +
> > +                     vreg_pmu_rfa_0p8: ldo5 {
> > +                             regulator-name = "vreg_pmu_rfa_0p8";
> > +                     };
> > +
> > +                     vreg_pmu_rfa_1p2: ldo6 {
> > +                             regulator-name = "vreg_pmu_rfa_1p2";
> > +                     };
> > +
> > +                     vreg_pmu_rfa_1p8: ldo7 {
> > +                             regulator-name = "vreg_pmu_rfa_1p8";
> > +                     };
> > +
> > +                     vreg_pmu_pcie_0p9: ldo8 {
> > +                             regulator-name = "vreg_pmu_pcie_0p9";
> > +                     };
> > +
> > +                     vreg_pmu_pcie_1p8: ldo9 {
> > +                             regulator-name = "vreg_pmu_pcie_1p8";
> > +                     };
> > +             };
> > +     };
> >   };
> >
> >   &apps_rsc {
> > @@ -861,6 +957,23 @@ &pcie4_phy {
> >       status = "okay";
> >   };
> >
> > +&pcie4_port0 {
> > +     wifi@0 {
> > +             compatible = "pci17cb,1107";
> > +             reg = <0x10000 0x0 0x0 0x0 0x0>;
> > +
> > +             vddaon-supply = <&vreg_pmu_aon_0p59>;
> > +             vddwlcx-supply = <&vreg_pmu_wlcx_0p8>;
> > +             vddwlmx-supply = <&vreg_pmu_wlmx_0p85>;
> > +             vddrfacmn-supply = <&vreg_pmu_rfa_cmn>;
> > +             vddrfa0p8-supply = <&vreg_pmu_rfa_0p8>;
> > +             vddrfa1p2-supply = <&vreg_pmu_rfa_1p2>;
> > +             vddrfa1p8-supply = <&vreg_pmu_rfa_1p8>;
> > +             vddpcie0p9-supply = <&vreg_pmu_pcie_0p9>;
> > +             vddpcie1p8-supply = <&vreg_pmu_pcie_1p8>;
> > +     };
> > +};
> > +
> >   &pcie6a {
> >       perst-gpios = <&tlmm 152 GPIO_ACTIVE_LOW>;
> >       wake-gpios = <&tlmm 154 GPIO_ACTIVE_LOW>;
> > @@ -1127,6 +1240,37 @@ reset-n-pins {
> >                       drive-strength = <2>;
> >               };
> >       };
> > +
> > +     wcn_wlan_bt_en: wcn-wlan-bt-en-state {
> > +             pins = "gpio116", "gpio117";
> > +             function = "gpio";
> > +             drive-strength = <2>;
> > +             bias-disable;
> > +     };
> > +
> > +     wcn_sw_en: wcn-sw-en-state {
> > +             pins = "gpio214";
> > +             function = "gpio";
> > +             drive-strength = <2>;
> > +             bias-disable;
> > +     };
>
> wcn_sw should come before wcn_wlan

Indeed, will fix.

>
> > +};
> > +
> > +&uart14 {
> > +     status = "okay";
> > +
> > +     bluetooth {
> > +             compatible = "qcom,wcn7850-bt";
> > +             max-speed = <3200000>;
> > +
> > +             vddaon-supply = <&vreg_pmu_aon_0p59>;
> > +             vddwlcx-supply = <&vreg_pmu_wlcx_0p8>;
> > +             vddwlmx-supply = <&vreg_pmu_wlmx_0p85>;
> > +             vddrfacmn-supply = <&vreg_pmu_rfa_cmn>;
> > +             vddrfa0p8-supply = <&vreg_pmu_rfa_0p8>;
> > +             vddrfa1p2-supply = <&vreg_pmu_rfa_1p2>;
> > +             vddrfa1p8-supply = <&vreg_pmu_rfa_1p8>;
> > +     };
> >   };
>
> Other than that this looks fine and is equivalent to what I have on
> Insprion14p - with the exception I see that I don't have the 3v3 rail,
> which I probably should.
>
> https://git.codelinaro.org/bryan.odonoghue/kernel/-/blob/x1e80100-6.14-rc6-dell-xps-inspirion14-lenovo-slim7x-t14s-camss-sound-wip/arch/arm64/boot/dts/qcom/x1e80100-dell-inspirion-14-plus-7441.dts?ref_type=heads
>
> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

Thanks,
Alex

>
> ---
> bod

