Return-Path: <linux-arm-msm+bounces-50534-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 32ABFA551C2
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Mar 2025 17:48:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AACAA167C46
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Mar 2025 16:48:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A5CBE25C6EC;
	Thu,  6 Mar 2025 16:46:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="umUoEtpX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAAFE25B69D
	for <linux-arm-msm@vger.kernel.org>; Thu,  6 Mar 2025 16:46:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741279564; cv=none; b=OfGzzsWTXjzpw9CSJHn6hadDQPonXVZQozAszbl6dBz0DAH9fh3j6EahWrIKlpUSsvV61u6+gd3Bi3ewpP18LbeBuVz0fqzvrJKuXJ4c9NC9ZjNnyXMEALTmAfbzcUdDLxVcKsv7aWufAIXKckd/wsgZwmItKQxTv18pZtYd2d4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741279564; c=relaxed/simple;
	bh=TFqb6nBt6h/0td1uTW45nWiS8RKPJqUeWeIGjdp/DUs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JYWRuYQVdtqhf3GzcfaNqOJ4zMlgthDu0tjGyYiXWliqV3OKAJs4m2rj2zuX85mi2JugYW6vn3HezgRRtt7bgXtPmPS5zOnq0cZuH8KnL9jrwyBEGU/6BHRtHMQTBEPDeemYWsdybCfWd42u3LcXKsyynQl9BPg7ocPI2I79u6A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=umUoEtpX; arc=none smtp.client-ip=209.85.208.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-30795988ebeso9396671fa.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 06 Mar 2025 08:46:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741279561; x=1741884361; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=iYkKdW4t5OSFScRUxZzZa9zKFqxQ50ly8uK9WVZ07tM=;
        b=umUoEtpXyA8DNsbuXKB4TRycGHlKq/HKfpfcaF8jd9CvESP528Djkx8c7R03U0blZb
         G/xferS3kGofdnLagkKEPjpuKn737XFLZofAlIBLf4Od0wf4yNpiZJALksQ5cNVLJYLl
         aitegvl2YpsnyugKQcc6xASsp7YFggyJDK8gXOGIk0QWfOMJ4u6FxawQ0LQ2rfluZunG
         uE08sJwtG0zOjH6PoxxGsQuhaYRECT72ddeokk1bDbc0FjIUjV0RjUxh9qQ+/60ZWlo/
         T+kKkh2TnEJWV7nPrbZjFotux2JGmtXJuc758niA6gk1dOsWK5ZrW/70EwR1MvKU8WKc
         Rfog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741279561; x=1741884361;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iYkKdW4t5OSFScRUxZzZa9zKFqxQ50ly8uK9WVZ07tM=;
        b=AGTOYtmR5d8+9CoX7Y9Da9W7c2uOqWuFr9v2c35Cyhh60hL3i7cdsaJY6iBkLOjwxk
         7zdhuwl/nMmj4ORzHXuwAIavnKuUVLSwUXx/xICCkCxPu17+oG1nyzVDVTHSY71OrOmD
         Zbuzb0vD+3CmS/JhmWZ8r43GZi3w98NTAhqeZFVtdqLCwWWtsGQxPvyTFPvqcAVG6I2m
         mNVBF9ObQeOx/MdcPvak2+5WRo9/IEHptePWFnz/x6euvLRvfxqspFeS288uoPMWY1D7
         3UB4l3ML6FXBGJRt6ksGCGxlW/q8VoQVsPvt5bEVGoB7Zs+mYJ2VVoxnqgk4OAdEkgmw
         akyw==
X-Forwarded-Encrypted: i=1; AJvYcCUOuDPTgnelJQN+RSjiFM8A22cOQreU0TaIMQ/uLiIZNC556s2kVx6/D1jzs4yYobDQGAhoiDF/9YiCmbrr@vger.kernel.org
X-Gm-Message-State: AOJu0Yx8QQ91tlBTGOxiMJ1+v3lCGSErBskKc0o1+kuChUPriwdPWqeT
	BAlzrUjnuE/rwW76NiehZfHalBEihzi+Hh5jkv3t4Ty05uqTxzrDMThj2Jw3pjM=
X-Gm-Gg: ASbGncsAs4lfNUT1wJG+BEj1q9j1/koozJpl7zmWrZp7j34eoE6IfFviZpmjH/8VBSE
	n3FisSnY6is2c8nj4298RWU/TenlpaXV4sauW87WlkmfgdSD+MIjzn2l2SEjudPJ4IebR2C1Brn
	dRXPw5sTT6siyOeV83HBokwl90qAsdnij1D8WzKy8hpZRtTEMUZwnCYAF4/RdgXyvkLedUF7wXB
	MkPfHkH68gpKXmYQZ8XtFc7gqk9LliPFHbrtu8QJpRF5395iVWkty6Kv532dbWb48xql/0YfjSX
	dzsuVVSC1cCMq4sKCgGtYFjVNE8VXo7aBWkhpRfz1BBm34jZDUJc3RqJgOMidYBtA6rFg9Hyb0O
	ccfQF9uZ3L+NKvVg2YHcwSkFC
X-Google-Smtp-Source: AGHT+IGpbLi2y4PhgwxHevBiZsJmX/UmrqptJ9oIY8nq8Avmeb5P0twX8p0VwFnIZrkkMoJhAI8b8w==
X-Received: by 2002:a05:651c:22c:b0:30b:a4f6:bb35 with SMTP id 38308e7fff4ca-30bd7a65210mr22112421fa.22.1741279560809;
        Thu, 06 Mar 2025 08:46:00 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30be98d0800sm2597551fa.5.2025.03.06.08.45.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Mar 2025 08:45:59 -0800 (PST)
Date: Thu, 6 Mar 2025 18:45:57 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Georg Gottleuber <g.gottleuber@tuxedocomputers.com>, 
	Georg Gottleuber <ggo@tuxedocomputers.com>, Bjorn Andersson <andersson@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
	wse@tuxedocomputers.com, cs@tuxedocomputers.com
Subject: Re: [PATCH] arm64: dts: qcom: Add device tree for TUXEDO Elite 14
 Gen1
Message-ID: <jxld7w4i7nut35pnmaxgsnmccg3efffas3rubouxcpxbxrrrxh@rrl47w24ju3i>
References: <57589859-fec1-4875-9127-d1f99e40a827@tuxedocomputers.com>
 <75c17309-3072-4321-ab15-69d60190f2f7@kernel.org>
 <d98ad83e-6479-4453-bd1d-4f3703b0dad2@tuxedocomputers.com>
 <aa837beb-ef4e-43ec-b8fa-54a21df1202c@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aa837beb-ef4e-43ec-b8fa-54a21df1202c@kernel.org>

On Thu, Mar 06, 2025 at 03:03:32PM +0100, Krzysztof Kozlowski wrote:
> On 06/03/2025 14:56, Georg Gottleuber wrote:
> > 
> >> ...
> >>
> >>> +
> >>> +       eusb3_repeater: redriver@47 {
> >>> +               compatible = "nxp,ptn3222";
> >>> +               reg = <0x47>;
> >>> +               #phy-cells = <0>;
> >>> +
> >>> +               vdd1v8-supply = <&vreg_l4b_1p8>;
> >>> +               vdd3v3-supply = <&vreg_l13b_3p0>;
> >>> +
> >>> +               reset-gpios = <&tlmm 124 GPIO_ACTIVE_LOW>;
> >>> +
> >>> +               pinctrl-0 = <&eusb3_reset_n>;
> >>> +               pinctrl-names = "default";
> >>
> >> No graph? Isn't it needed?
> > 
> > What do you mean by ‘no graph’?
> 
> ports connecting this within USB graph between controller and connector.
> Just like other devices with redriver.

No, eUSB2 redrivers don't need (and don't use) OF graph, they are
basic PHYs. See Documentation/devicetree/bindings/phy/nxp,ptn3222.yaml

So this one is correct.

-- 
With best wishes
Dmitry

