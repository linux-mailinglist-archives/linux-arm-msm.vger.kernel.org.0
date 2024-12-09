Return-Path: <linux-arm-msm+bounces-41103-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 7755A9E96D2
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Dec 2024 14:29:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1462E188C9E8
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Dec 2024 13:25:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 50BE61ACEAD;
	Mon,  9 Dec 2024 13:23:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="adE3Ub5B"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BD4E1ACEC3
	for <linux-arm-msm@vger.kernel.org>; Mon,  9 Dec 2024 13:23:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733750593; cv=none; b=ncdUMkinoUSkU311XaR2lbnFPDB60oLRtAz9HOAvvEOjooFiPytRJEMMSj2aAQbZdfyHtPqpIOQwxExXeIrN8lIkHh60Avky8zuGMZmKH5RIWrAMVanxLdbU8GCOwKHuTcWsu49+AGbf2WpzNQHwuN7fVPZA90mOScBiA3KbqZQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733750593; c=relaxed/simple;
	bh=04S6B0nJf9Hn+gzERCF/uMkmUx0R4j34PMLxCp3iOME=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lNMxh3TNtItLe1JLYNFX2pHT3AmmGAYiB1WpkoShsqz5WxD289X1TNdSIVjPJTCcVwQoQS4mIGqIF8HGMD8KQ3qvFXTjpG9o/WbdmqSUoYsk0XVjKbGe6Y6NWCFiP2GoziEj0/znEILo7rz2SXVifnVqZTRTmvy2HUk3tsmuMZc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=adE3Ub5B; arc=none smtp.client-ip=209.85.208.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-30036310158so22857351fa.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Dec 2024 05:23:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733750589; x=1734355389; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=P1Q3KowuVs0mZ0rb0Ic9ZcrPzwsNDNKvHLsAlNmDHFg=;
        b=adE3Ub5BZfR6CrZ2XJUHI82jOpLKlD7RblzqWlFNs5L4C9VqHSuE0bVU8LmlzIj46Y
         wpwJZuPcKuvs/NBG5HwfgfDWgfgwBH4PXs3eHkSmXTkmyq/Wpl2cd5Pm9PZjb1jOfaqc
         3Gup/6gjbPgBAMha3i8Xo2tKgTk3HaGHocuPdWcNXOTIZ7smxJK9P130BXiytoJSP8GW
         /6G5JSFyO0UBmhgP69y8xI4GrKEn5kuPG/6q94ysm/ZgoXcpHKMgC8FftVzY6EygFODw
         50OZVTsGC3lpwybc2O0ZikoacQjZnSO91pVH9q8i5tsbXusnqSK8EK70t7D718AMD9Q3
         3CNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733750589; x=1734355389;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=P1Q3KowuVs0mZ0rb0Ic9ZcrPzwsNDNKvHLsAlNmDHFg=;
        b=iSlXaH8eoHMlrxqQoHiZ5L7FCxUn7Pl9GG5GlljDQrTwnvGANmV5BoY8S5hVmdtOTI
         umte3WsFKeXEvsQZ2bwllvHArLRTgfo5eRvMnluFCAtBIPvHITMKhW0eJwbZwpFTGlVU
         AU8yU//XL+BJF3GzUazzdWpgxNpnxelTM6vFX0gzzvvABtbzEf+t8i0AJxO1epZjQHNr
         c0qHo8l+O9MZ0P4F7QBU3abcCd9ApV5Pryu2jvwOdWPv0IUq3uCsYFfRoJIQ8hLuNpu4
         LWfw7JFfcWwUX6d5mn6297DcSDrDOU/567z5kaeLJNDNUslhoQlr3ZqdKHYdfTvWyCxA
         2CSQ==
X-Forwarded-Encrypted: i=1; AJvYcCUmYH0ZTFwmefG6RWGz51cXGlztFQP2aC7WjSrvLa8HSYB/sVeWE/sO58yWJI/vVopXle1oJ2QO7mBbBaZK@vger.kernel.org
X-Gm-Message-State: AOJu0YxfTHiT9GRwaxdxyeajMLM28wvp/8IvUScPb4RLYuGb7q9cQ6sQ
	p89IUKPeqoBewfrRu3abJl1IJK8vVtdlBdh13ye/3K7WEk6kLXbcaTgz5OJOcrA=
X-Gm-Gg: ASbGnctC6iLQAPooAdIvft8xWn5YJbvzHJFo4bx+oQASyNIK8cek4ACT/CNBloprjpU
	lf2zBLAycfZXZxkhBY6RN4Msnkuq8nUi3AVRBDK3Z92QlQEO44VbQ1P2WmZ7t/WQOo0YuIV8o87
	5+Zupu3p8D4yD6k5PZAZS/MwJG1xpiDScuVV3asrt5dGJodqVOy7OeVZi3TW7PCn2rD2Y3cR3F5
	hejUOK6rfvcqYSGS3x0SiZsdwUe8Qjd1pet5AGc+j0IOWvzXGtyijjrMxUh736qyGJyFxUvAqSr
	6e+/1t3xzNfATiRUz18ABpIIzK+ghQ==
X-Google-Smtp-Source: AGHT+IHzRS3kKeuBIaVbiSldvKszXqHDXCVoEU74JuhkpXf+Z7S09whtCDZ/ssVTFfacSGsQVfKscw==
X-Received: by 2002:a2e:a817:0:b0:302:17e7:e18a with SMTP id 38308e7fff4ca-30217e7e59cmr24900501fa.26.1733750589475;
        Mon, 09 Dec 2024 05:23:09 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3003b760a56sm8652811fa.18.2024.12.09.05.23.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Dec 2024 05:23:08 -0800 (PST)
Date: Mon, 9 Dec 2024 15:23:05 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Johan Hovold <johan+linaro@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jonathan Marek <jonathan@marek.ca>, Stephan Gerhold <stephan.gerhold@linaro.org>, 
	Abel Vesa <abel.vesa@linaro.org>, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, regressions@lists.linux.dev
Subject: Re: [PATCH v2 0/2] arm64: dts: qcom: x1e80100: fix USB OTG
 regressions
Message-ID: <iw2c4fceyppf2w2gueevsqsz2z7hatbqo33vufx3veatprczu5@u4k3j2igy6ee>
References: <20241209111905.31017-1-johan+linaro@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241209111905.31017-1-johan+linaro@kernel.org>

On Mon, Dec 09, 2024 at 12:19:03PM +0100, Johan Hovold wrote:
> A recent change enabling OTG mode on the Lenovo ThinkPad T14s USB-C
> ports can break SuperSpeed device hotplugging.
> 
> Abel noticed that the corresponding commit for the CRD also triggers a
> hard reset during resume from suspend.
> 
> With retimer (and orientation detection) support not even merged yet,
> let's revert at least until we have stable host mode in mainline.
> 
> Note that Stephan and Dmitry have already identified other problems with
> the offending commits here:
> 
> 	https://lore.kernel.org/all/ZxZO6Prrm2ITUZMQ@linaro.org/
> 	https://lore.kernel.org/all/hw2pdof4ajadjsjrb44f2q4cz4yh5qcqz5d3l7gjt2koycqs3k@xx5xvd26uyef
> 
> Johan
> 
> 
> Changes in v2
>  - revert also the corresponding patch for the CRD which breaks suspend

As you are reverting two commits, please revert the third one too, it
breaks pmic-glink.

> 
> 
> Johan Hovold (2):
>   Revert "arm64: dts: qcom: x1e78100-t14s: enable otg on usb-c ports"
>   Revert "arm64: dts: qcom: x1e80100-crd: enable otg on usb ports"
> 
>  .../boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dts  |  8 ++++++++
>  arch/arm64/boot/dts/qcom/x1e80100-crd.dts            | 12 ++++++++++++
>  2 files changed, 20 insertions(+)
> 
> -- 
> 2.45.2
> 

-- 
With best wishes
Dmitry

