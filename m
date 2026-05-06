Return-Path: <linux-arm-msm+bounces-106128-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GIqgEghb+2kuZwMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106128-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 06 May 2026 17:15:20 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C8B704DCFB3
	for <lists+linux-arm-msm@lfdr.de>; Wed, 06 May 2026 17:15:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 02EBF302A4D1
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 May 2026 15:14:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA3633F20E9;
	Wed,  6 May 2026 15:14:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=imd-tec.com header.i=@imd-tec.com header.b="DNQ17v0/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D25A47DF9D
	for <linux-arm-msm@vger.kernel.org>; Wed,  6 May 2026 15:14:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778080450; cv=none; b=UFKZOnCP8xUz26De74wWLGMO7rIBFlmNZp4jK1NnBqeVnoEesGMvv7yp4yAJbK2kNC5Nbj85NrvZ2PjFbSa90fil8R+6knCTI1O7jxO0CoAbHcFXYpv4nBPIgO43/hpgF8bjkj3hBhiVx55mRA8qGjUmysxpteUjlMumP2330FU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778080450; c=relaxed/simple;
	bh=6uxmBcsusZraeh4PG9F1SE0HCI0qSLyvABncvHgVrrw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=l5vktOl4v3ZvuVF8JWPW6vWkHZazCFvsT4WT7EZoqm56u+6u4LLgZWp3Zxf5hWaIyv6tWgqKBCkkkI9OGvQdJuAqwOT8BLbbeW1sJtayh9vDXpKKQZKQAxNoQiHNZCKI0C9D5spMIt1AsjFjP4bogZnogB2ehfpQl9AxBXDcrdY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=imd-tec.com; spf=pass smtp.mailfrom=imd-tec.com; dkim=pass (2048-bit key) header.d=imd-tec.com header.i=@imd-tec.com header.b=DNQ17v0/; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=imd-tec.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=imd-tec.com
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-488af9fdaa7so34893825e9.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 06 May 2026 08:14:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=imd-tec.com; s=google; t=1778080447; x=1778685247; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=IqBw8Kd6OtjjnQiFLsdPfhJ7HyL89HYldEhFC8X0GH0=;
        b=DNQ17v0/9S0QPq+fGJQdHrALvbwpzxoj6RmDJFsbf5jLvjMPnlEVUcMS0jjgAi2AYf
         O3eY5fGSaMIigEABwmqAlQZixfn+knoD9zRhu2O9DSwirSv94zWeiMESMzxl6TCbBWMP
         TLfSKa+v0nbbPcd/i8ZY6jbCcMOby2N/V55r/ai0JV8u5eZ9QqrGLq98UkILHnhgGw5k
         Pkyl6QmLeigrP2PPSrgSKMYif6f3l8aqWjVJM+X7FSAuORIf6ToEFK7rtpGnNPf1Tu+V
         +FSwQHLjMzri9BFwvMPVDF4xvCTzpDUANtlWj40rv49LAoTy/YKBd8BSj6F0Hckm2vvC
         42uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778080447; x=1778685247;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IqBw8Kd6OtjjnQiFLsdPfhJ7HyL89HYldEhFC8X0GH0=;
        b=BO3K4ccMChujrPv8+no+Yzs3cvI8gd04wu9kiW8N3T8tnDnlm08pKaXGaDlxOP7qEg
         tcjHsm+y6EfSr6J8nlc6NJOx7XM3C37kYrmDP1ByyHA1uEUg6rtNtZXbaFdGamET7qLu
         REISRPBf9oKH+ZX+wPb8P/hdMmpbgahNAzHLkFWg5FXR6lb0XtkgPeZcAUWDNaYQFJuU
         gjwI94vTTD88uyleYxCufp5Wn2YpkPr6vCGi03D0OFWuY/gQa3mUHOoB3J948B57N0Zp
         9TwaxpjhjpMBjeOrS5hf1NOdzEHufXvTq/uS93dhTQNes/OX6y/Hf3lRQv3UrR779puO
         FUjw==
X-Forwarded-Encrypted: i=1; AFNElJ8l8Rx9kFM1/NQXH6fMf0ecTABfLrviOLIORUBjmyxt0lCRcV1imaq7OVK9VaXc2WW9m80MYjJ0Kw6Wyml9@vger.kernel.org
X-Gm-Message-State: AOJu0YziTJA26FqpCTgMaTOkIjJaeJuiX+HgSDEthZEYukza6k8tIVSF
	bLVKTjU2lvXXfPp08YMTvXJuGufsvg9Ilcl0Sh+KLbAFbFg+dE3q9eXpeddNj7B5E/0=
X-Gm-Gg: AeBDieudtrYt5AkXmkX1wD2roLRLjUpVo/twc577wpFvpnYhhj5jmYOEuxn+pnOLFgp
	Dxyn7CsM+7vqAfc4D02VI1SqfPT7xRX+5tmHtlkaPCC72UPUfTRxHei6FNGMPxok2/Z3zPJIh+B
	ZaAlefnAcW4W9q9/cC9JJv5lwKizfXgPdWFu9HW/+xL99rCYEYGYasRuXIWzp9qnkROc9urR8nC
	1aV6DY2WBXMe2JkauEPouTH9V4Yjgf7AevPt0Gk0AAKI7SmG/TanSeyPyQd6TwbrzZq2J+njuIN
	wvV7Qevzz0mV0ADqRjI8PPEJEql8n8KFflReNzyGwE4elL1YAqwG0tjtpqA/Ppho0RroWbECljt
	hw9XPHyPy/M5/HnJovX8TvmKpte3vxeunX/SmkJFaBS1/eZBf+HHaWEjVbof12GTEv/Q1qomyaC
	M5VgJ64Iuhj6r+5T2UI/eKeQjpQJHp6ZUIIzEOpbaeQOpKcoyCNp5aLBam78QshKnUrYtUPQ6LY
	zKXgZyFlv7Q4noW1/vCNUA5UgwLio5wjIN3ml4xkmjnduW3YwsoxA==
X-Received: by 2002:a05:600c:a111:b0:480:1c69:9d36 with SMTP id 5b1f17b1804b1-48e51f2f83dmr51500945e9.17.1778080447300;
        Wed, 06 May 2026 08:14:07 -0700 (PDT)
Received: from will-Legion-Slim-5-16APH8 ([2a00:23c6:2736:8e01:5fbb:faec:b3da:7ea1])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48e538b26a3sm95055395e9.9.2026.05.06.08.14.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 May 2026 08:14:06 -0700 (PDT)
Date: Wed, 6 May 2026 16:14:05 +0100
From: William Bright <william.bright@imd-tec.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v2 4/4] arm64: dts: qcom: Add IMDT QCS8550 SBC
Message-ID: <aftavTZafl6bCQhD@will-Legion-Slim-5-16APH8>
References: <20260505-imdt-qcs8550-sbc-rfc-v2-0-b4767d0dd421@imd-tec.com>
 <20260505-imdt-qcs8550-sbc-rfc-v2-4-b4767d0dd421@imd-tec.com>
 <20260506-aquatic-shrew-of-engineering-09fbe8@quoll>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260506-aquatic-shrew-of-engineering-09fbe8@quoll>
X-Rspamd-Queue-Id: C8B704DCFB3
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[imd-tec.com,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[imd-tec.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[imd-tec.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-106128-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[william.bright@imd-tec.com,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imd-tec.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]

On Wed, May 06, 2026 at 09:53:01AM +0200, Krzysztof Kozlowski wrote:
> On Tue, May 05, 2026 at 09:09:54PM +0100, William Bright wrote:
> > + compatible = "regulator-fixed";
> > + regulator-name = "cam_3v3_reg";
> > + regulator-min-microvolt = <3300000>;
> > + regulator-max-microvolt = <3300000>;
> > + vin-supply = <&hr_cam_pwr>;
> > + };
> > +
> > + display_panel_pwr_en: regulator-display-panel-en {
>
> Again, unused
>

For the camera regulators, I intended these to be used within device tree
overlays (I.E a DTSO would be made for an AR1335 connected to CSI0).
I don't have any camera device tree overlays in this patch series
as the only camera I have tested is the OnSemi AR1335 which isn't supported
upstream. So I will drop these camera regulator nodes.

> > + compatible = "regulator-fixed";
> > + regulator-name = "dsi_5v_en";
> > + regulator-min-microvolt = <5000000>;
> > + regulator-max-microvolt = <5000000>;
> > +
> > + pinctrl-names = "default";
> > + pinctrl-0 = <&dsi_5v_en_default>;
> > +
> > + gpio = <&tlmm 140 GPIO_ACTIVE_HIGH>;
> > + enable-active-high;
> > +
> > + vin-supply = <&som_vph_pwr>;
> > +
> > + regulator-always-on;
> > + regulator-boot-on;
> > + };
> > +
> > + /* Enables 1V2, 1V8_CAM and 3V3_CAM */
> > + hr_cam_pwr: regulator-hr-cam-pwr {
>
> And this becames unused after dropping fake regulators. Why don't you
> have proper users of these controllable supplies?
>

I will drop the on-board regulators for panels. These were intended to
be used by a panel DTSO. So I will these back in when I 
submit patches for a panel DTSO for this board.

> > + per_1v8_reg: regulator-per-1v8 {
>
> Drop node
>

I have omitted that its used by the LAN7430. I will add this
usage in V3.

> > + compatible = "regulator-fixed";
> > + regulator-name = "per_1v8_reg";
> > + regulator-min-microvolt = <1800000>;
> > + regulator-max-microvolt = <1800000>;
> > + vin-supply = <&per_pwr>;
> > + };
> > +
> > + per_3v3_reg: regulator-per-3v3 {
> > + compatible = "regulator-fixed";
> > + regulator-name = "per_3v3_reg";
> > + regulator-min-microvolt = <3300000>;
> > + regulator-max-microvolt = <3300000>;
> > + vin-supply = <&per_pwr>;
> > + };
> > +
> > + per_5v_reg: regulator-per-5v {
> > + compatible = "regulator-fixed";
> > + regulator-name = "per_5v_reg";
> > + regulator-min-microvolt = <5000000>;
> > + regulator-max-microvolt = <5000000>;
> > + vin-supply = <&per_pwr>;
> > + };
>
> Drop all these
>

per_3v3_reg: Used by the LAN7430 but omitted by accident so I will define 
  that it's used by the LAN7430 in V3.
per_5v_reg: Used by onboard audio but audio support is omitted within this 
  patch series so I will drop this regulator.

>
> Probably most of them are to be dropped :/
>

For V3, I will go through all of these and eliminate any redundant regulators
or add where they're used.
Most of them likely became unused when removing SDHC4 whilst
preparing this patch series.

> > +&lpass_rxmacro {
> > + status = "disabled";
> > +};
> > +
> > +&lpass_tlmm {
> > + status = "disabled";
> > +};
> > +
> > +&lpass_txmacro {
> > + status = "disabled";
> > +};
> > +
> > +&lpass_vamacro {
> > + status = "disabled";
> > +};
> > +
> > +&lpass_wsa2macro {
> > + status = "disabled";
> > +};
> > +
> > +&lpass_wsamacro {
> > + status = "disabled";
> > +};
>
> Why are all these LPASS codecs disabled?
>
> Best regards,
> Krzysztof
>

No audio driver support is included in this series, but disabling the LPASS
codec nodes is unnecessary so I'll drop these changes in V3.
Many thanks for your feedback.

Best regards,
William Bright


