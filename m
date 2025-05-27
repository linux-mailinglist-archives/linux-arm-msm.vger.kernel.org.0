Return-Path: <linux-arm-msm+bounces-59568-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 364B5AC51C4
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 May 2025 17:13:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 15AFE4A0E61
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 May 2025 15:13:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B7A352798EA;
	Tue, 27 May 2025 15:12:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="cUXEcSxk"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A60E2798F0
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 May 2025 15:12:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748358777; cv=none; b=FxldLb76XebM3bPWzlgxWG1XrhxozN5NjREDj2Z7ne5sXHuqEJEdHm/df2MdVcRoUJsY/qDthWa25QOeqSNRY9aUseY3eVNJfSXHdnDuCoWv8CSZyR8yBHt0OkeXd60ooeUOpE0UKr2gryJEFp5nkZgP+Zs/5zvf6yWGK8YK3eg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748358777; c=relaxed/simple;
	bh=foj6Mg3x/CZH0RCul7O2lAVcplsDCmzvRCH9CjdMXJE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=S93gyuHuqKehlaXGNtQDRI/M4pZmBBrXwf0NSUcfxHJoGm9OkEheYPzUoQzS89m9LdzqD5bQeC+Je/UV/C2sJULtGj8c4Xn0KBqAZvmmybmapFpLOe4jTUqoL/CF092Uq02ulhsAWBCebtSpw6Hp7uGsH0h7V+oF4D5wUdzVGU0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=cUXEcSxk; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-acacb8743a7so623597266b.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 May 2025 08:12:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748358773; x=1748963573; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=01tap7U3QIuQgQFu9YDVIO3GLqIFX8BsxyAQoNTTsI4=;
        b=cUXEcSxkPd6BdcauX/sOkyZsBDXbMeLU2T7IgLv+DIh+khkUyb3gRmZZje46JKKpYB
         qcDj1wQ3eE488ikniWqcGHb+ZV/N9Ha5TSG1aLagAI5VW66H2gCGlchC9CSUma+J1YZT
         lJw94eJXy4cVmrAzWZX5jc8NYCpHngzAz0hYgJvzs+VI6RJqt/16mgD3BUO0sswX+Ypx
         EqgkbYYUfG+JgoXHEZKhaCh71HH9A6KJHQ6sd1f0wj1pmiozqhherCdNE4aa7DpYxglx
         5S46aj2zcg5jqfg7O5rENXH8s8Asd37XXrWRRzSMQM7u7Qenl6QGameiYV0C6vKQTaz2
         Wx9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748358773; x=1748963573;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=01tap7U3QIuQgQFu9YDVIO3GLqIFX8BsxyAQoNTTsI4=;
        b=oIbRi1/BOXuAH1ZA9j0xYAsj926rTLbVdQmZCYTncAFPOvJmIEXPGIuD00barE83FS
         leGdts9lr70dH8ct+Q43yNOYhLpJA5KzIbhsa5nb6HU3mby8cxkelA4MttzxF1H6irUo
         OlxTvp+4H6Q5+GMFzSCdJFTr93zVaoK+abXcCpCVg1ajEc24iZem9v0vcnXt39ugV+2V
         3xBk8SLR4CnjNrkY0k3Vp8uwz1PmhWVB2aaCv2r19acZkKXAc8fkLPShbBTQ3GDJO8pU
         DgUUw4lNT6rI0kHesdT48sZEVZgwZZFYY00MbHykWtQbxcEsg3Cdokq0RvWmklcFggJL
         fojQ==
X-Forwarded-Encrypted: i=1; AJvYcCV0LwfDgb+LSq65fzBzwbI5Wl8TJL6MdfKZByT3NaercqucG8jODloKnp0IphHvBD2t/IE/1cBsqz0Blee/@vger.kernel.org
X-Gm-Message-State: AOJu0Yz9xyF4fr2G+yBVb9Ip4fGSy5fGU8rS0fEzzx9LbTbTyZ4usiui
	WDNScdLkkbY3i8LYIpoG7H5wDoigfNkc7RUjgYfn+p189k1vDrr7CEmu1AK6CRutsuM=
X-Gm-Gg: ASbGnctQoHwSIVyGkrRKIN2PZ3hRFtb9UeJXXUNg++uLcNsDt986ogsN0Hyr/U4ryAD
	19MBv7zh8QFHkbf32Kt2o+yIRSVuASBpv4FJ6FJpj+cn8T4pKHydS4MnRyHkHmhwMGhxVFHA1fM
	8uqb8N+dNAgSBFfOJtO8nflEtZDPBME3x+QOoHkN8eQSrG/qxb2miuiBNOpL7j5XEb+qUJiqPT6
	Et0Yn8I7lEtANIwITckLNMlqEO6888eKxe2kapMmsqe3XXgpkqJqIfhjf0L1yPE2EN5H19ng6iX
	3czXshOLikVRN2XWqbjoXTb9Pis8hzFKY+QaY5f/ENY9+ZiBSOZ5OhZ+y7llLA==
X-Google-Smtp-Source: AGHT+IHGkA6Uo8LD9tkuQuwyXfuusDiBwWChLJF7JfBM0uVDLhyEXQU5t/MUQ712GYV369Vupq6chg==
X-Received: by 2002:a17:907:94d0:b0:ad5:6e40:9830 with SMTP id a640c23a62f3a-ad8989f83b2mr100640066b.20.1748358773107;
        Tue, 27 May 2025 08:12:53 -0700 (PDT)
Received: from linaro.org ([2a02:2454:ff21:ef30:740:d24d:aec8:7c4d])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad882046cb5sm235749166b.55.2025.05.27.08.12.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 May 2025 08:12:52 -0700 (PDT)
Date: Tue, 27 May 2025 17:12:48 +0200
From: Stephan Gerhold <stephan.gerhold@linaro.org>
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Val Packett <val@packett.cool>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Johan Hovold <johan@kernel.org>
Subject: Re: [PATCH 2/4] arm64: dts: qcom: Add support for X1E80100 Dell
 Latitude 7455
Message-ID: <aDXWcASIH92C3oKo@linaro.org>
References: <20250525095341.12462-2-val@packett.cool>
 <20250525095341.12462-4-val@packett.cool>
 <a5tx3ekokrd5zif646ukd5z4gzkyod3b4vcjktwahtej7dpare@43djxfwza2jb>
 <9A47A2D6-93EA-4C73-A681-474C977474DD@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9A47A2D6-93EA-4C73-A681-474C977474DD@linaro.org>

On Tue, May 27, 2025 at 05:54:49PM +0530, Manivannan Sadhasivam wrote:
> On May 25, 2025 6:55:42 PM GMT+05:30, Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com> wrote:
> >On Sun, May 25, 2025 at 06:53:34AM -0300, Val Packett wrote:
> >> Add a device tree for the Dell Latitude 7455 (X Elite) laptop.
> >> 
> >> Working:
> >> - Wi-Fi (WCN7850 hw2.0)
> >> - Bluetooth
> >> - USB Type-C x2 (with DP alt mode)
> >> - USB Type-A
> >> - USB Fingerprint reader
> >> - eDP Display (with brightness)
> >> - NVMe
> >> - SDHC (microSD slot)
> >> - Keyboard
> >> - Touchpad
> >> - Touchscreen
> >> - Battery
> >> 
> >> Not included:
> >> - Audio
> >> - Camera
> >> 
> >> Signed-off-by: Val Packett <val@packett.cool>
> >> ---
> >>  arch/arm64/boot/dts/qcom/Makefile             |    2 +
> >>  .../dts/qcom/x1e80100-dell-latitude-7455.dts  | 1484 +++++++++++++++++
> >>  2 files changed, 1486 insertions(+)
> >>  create mode 100644 arch/arm64/boot/dts/qcom/x1e80100-dell-latitude-7455.dts
> >> 
> >
> [...]
> >> +
> >> +	vreg_wcn_3p3: regulator-wcn-3p3 {
> >> +		compatible = "regulator-fixed";
> >> +
> >> +		regulator-name = "VREG_WCN_3P3";
> >> +		regulator-min-microvolt = <3300000>;
> >> +		regulator-max-microvolt = <3300000>;
> >> +
> >> +		gpio = <&tlmm 214 GPIO_ACTIVE_HIGH>;
> >> +		enable-active-high;
> >> +
> >> +		pinctrl-0 = <&wcn_sw_en>;
> >> +		pinctrl-names = "default";
> >> +
> >> +		regulator-boot-on;
> >> +	};
> >> +
> >> +	/*
> >> +	 * TODO: These two regulators are actually part of the removable M.2
> >> +	 * card and not the mainboard. Need to describe this differently.
> >> +	 * Functionally it works correctly, because all we need to do is to
> >> +	 * turn on the actual 3.3V supply above.
> >> +	 */
> >
> >Indeed, it should be possible to describe just M.2 card, because in
> >theory nothing prevents you from swapping it with some other card.
> >I _think_, it should be possible to describe WiFI part by listing 3.3V
> >supply as slot supply. However I don't think we have a way "random BT
> >connected to the UART". So, this is probably suitable.
> 
> If it is *just* an M.2 card, then why the PMU node for WLAN is
> defined?

We keep discussing incomplete approaches for handling these M.2 cards,
but still haven't come up with a proper consensus for the whole setup.
This is why currently describing the PMU - even if it feels weird and
describes lots of redundant information - is the only working solution.

These are reasonably standard M.2 cards, with the following resources
that must be controlled:

 - Shared:
     - 3.3V supply
     - 1.8V supply
 - WiFi:
     - PCIe (discoverable)
     - wlan-enable-gpios (W_DISABLE1#)
 - Bluetooth
     - UART (non-discoverable, must be hardcoded in DT?)
     - bt-enable-gpios (W_DISABLE2#)

Currently, defining the PMU is required for the Bluetooth
(qcom,wcn7850-bt) and also the WiFi (pci17cb,1107) bindings. We need to
add proper alternatives for the M.2 case.

> PMU is defining the internal supplies of the M.2 cards. If
> that's not required, you'd be better off with defining the slot supply
> alone in the PCIe bridge node. Like,
> 
> In SoC dtsi:
> 
> pcieport0: pcie@0 {
> 	compatible "pciclass,0604"
> 	...
> };
> 
> In board dts:
> 
> &pcieport0 {
> 	vpcie3v3-supply = <&vreg_wcn_3p3>;
> };
>
> But I guess you are sticking with PMU for UART? Even in that case, the PCIe node should just define the slot supply.
>

Can this handle the standard 1.8V supply as well? What about the
wlan-enable-gpios (W_DISABLE1#)? I don't think it makes sense describing
the shared PMU only for Bluetooth. The question if the PMU really needs
to be modelled at all (rather than relying on reference counting for
regulators etc) is also still open though.

We need to start looking for solutions for the whole setup. We have
discussed lots of partial solutions over the last year, but eventually
always got stuck when putting things together for the whole M.2 card. :/

Thanks,
Stephan

