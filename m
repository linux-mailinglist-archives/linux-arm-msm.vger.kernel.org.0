Return-Path: <linux-arm-msm+bounces-49709-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BF844A48236
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Feb 2025 15:58:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5E5273B2F9B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Feb 2025 14:58:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CB50325F798;
	Thu, 27 Feb 2025 14:57:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="sIfbzkkg"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5FC225F795
	for <linux-arm-msm@vger.kernel.org>; Thu, 27 Feb 2025 14:57:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740668272; cv=none; b=RAecJjKNizXVMH6lguZ9B1XnMflnRBl4wYqs5Oy3ZPX2a4jbbfLMe6lXPTLyQ5c/eLLBAvDjUxTIkcjUeMW702d8x/sAycffGk+5w8a196z1FrAydDXBqFCAsba+1u14xkps65CBdDTEOGOXkk1nsjmaDhCzA0SOMgEImqYuHm8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740668272; c=relaxed/simple;
	bh=DDXrrba6/WpzP8bI9c/CPfIOz9zI6g2hO9iOlccn1Sg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=um/4SIfLCS467V/pguCs8rwaj9whIXoQCcOZwrfNIXZKJyzI+5lQrcN7CVCyx20jX5ytXO4VeZQs9TtfJ6xV9AZiUe+I8HVnG/zRg05qjmncM2+/quM0Hmfx30W5RzeZrNnK3jRFouz9KZZpCEoGn38L5FTO19zaGi+dmLCdfvw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=sIfbzkkg; arc=none smtp.client-ip=209.85.208.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-30a317e4c27so10471631fa.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 27 Feb 2025 06:57:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740668269; x=1741273069; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=o6kWm1WxAljHizi3xT8gP5C7gJ5IPTi+Bx7Iv+hmWHQ=;
        b=sIfbzkkgLHNyfgVCSp/oKxGS4T31vpSW5HhBsYfo2BlJAGMAWeEBHHsUDXXLHlOE2h
         1nKlNadr/jmZV40UZ6LTelZT2yM39izHFMNWtU7EzoUxYqKqQx0g6oGXQU+VCOpbCgrg
         uiI5379Z0oapoaD2+XXz9rcmuw4v+gmGmxLjuEvcnzEUqF86EAbMc82NqtjeA+UlKPGF
         /Rc/an+QIbCRZkTgMNxG+EoUGwmaPbgP6tncvyiZx8V+ozsm9wu1oPNusX0Tc3eZCcWi
         +toXS4hF3NECMf76qHBiVUAQdn37nJmR9PXhZD7bAvIeQjd3GPxiH6CaZq+J4aGo6sBm
         EglA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740668269; x=1741273069;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=o6kWm1WxAljHizi3xT8gP5C7gJ5IPTi+Bx7Iv+hmWHQ=;
        b=KFYcPtcLfdOqRWp9iC7ojjwH+yAG3TuvUc/Yq4kme0gONB9M94CKP5CVmh8A79TmIC
         izjamC8ViUPqfI2ypsxrvAMI4JBuegdook2zI7ZVOVEfjxFP5hNOWGjzTd+iisIGbFd0
         ze/D+15DVXisHxxWFs9+VEEOSyUyuuhJgXzoaDOWVhJShzcFXdX8oXGCi+2ayW31BWOh
         0TVp9Xm4ap/p+a70OTj/ucNIAkJK76hXpKYRS1ay9TAXvuDGzqWfbI4rLocMsmb9wWzv
         AjYNcbUivlJpHZarqyYt0uWa+VvQr6WtDqgyloNgNuL9J1T9lu807eIDjn9zX6onMGNd
         Urjw==
X-Forwarded-Encrypted: i=1; AJvYcCWtdQgE8Q9YEbPdlNkIuQo98fvseuSonrFHrQpI6pnEKf26/TskpRn+//8FYtbB/eXTiARiTnZhQT4QgN6i@vger.kernel.org
X-Gm-Message-State: AOJu0Yx/U8d74VsFQ+TDQ+PR7nfOjZWGtbJUNrrJ8vM02PJHQuFz/tVA
	moLbU9ytJQ+S7Wpwb0rnNvHKgYlYaZ7wC2Tehs6aoTjo9eQ012bJkvYRMguH8Dg=
X-Gm-Gg: ASbGncslohaKl5IRw5nWTU8d9b7Wcgw+v54Kw0hLZa1s/yG/Xl32IvsKydNqmFjHhQh
	ws2kQ7Fmd1AZ5zdvNg9fvoExIRJUmo712xGA6/mulRGuYZq5o1rMQW0dWHNxUCoQbExHMX8zoGG
	pnsZWtRPsHXoeaO1l3MN+G6PXiDJyWAwyigYOR9qBoLePlTs+yQV6DZQ1kfLvqthHVrRaYa2dNE
	aa4MZ6x8UXbuhA2BSn3AF07yn8Pe7yZc6umfDd42KRSxcXVKXJ/GAm1elZxdPZ5fB0NvOSxZsUR
	WAbEN73bYOod6RMJQUieQPil0roVHjZmAHWGi2I/vecpMq5ThMvBspe6dGO8MkFWxwdRbyWmU9K
	vBUE14w==
X-Google-Smtp-Source: AGHT+IFle+ByWFKvSAisfuqZrntUlT1vHp52/oS2NVYwgUxcznsQotmllj3S/yU1ebMvTGen2ti2HA==
X-Received: by 2002:a2e:81d2:0:b0:2fb:cc0:2a05 with SMTP id 38308e7fff4ca-30a80cba36dmr62735011fa.37.1740668268815;
        Thu, 27 Feb 2025 06:57:48 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30b8688a587sm1920371fa.111.2025.02.27.06.57.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Feb 2025 06:57:48 -0800 (PST)
Date: Thu, 27 Feb 2025 16:57:46 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Nikita Travkin <nikita@trvn.ru>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] {vision/navigation}-mezzanine: Fix overlay root node
Message-ID: <axorlloo25pdox6kjl23l4kzosofxhqkygxbtcbtx3sbgj54m7@hn3jyf4oaeno>
References: <20250226-qcom-nonroot-overlays-v1-0-26c6e7605833@trvn.ru>
 <vq5dcsi55aqn56h6ihysqk4lainhmjbyvot3jiqkxm3i7igsak@da5u6ro7rkvg>
 <62a53d3222dfc516accd8dcd5e1adca0@trvn.ru>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <62a53d3222dfc516accd8dcd5e1adca0@trvn.ru>

On Thu, Feb 27, 2025 at 02:01:41PM +0500, Nikita Travkin wrote:
> Dmitry Baryshkov писал(а) 27.02.2025 09:16:
> > On Wed, Feb 26, 2025 at 07:29:54PM +0500, Nikita Travkin wrote:
> >> While considering to propose WoA EL2 dt overlays upstream I was looking
> >> at existing overlays and noticed that some of them are broken: they put
> >> seemingly meaningful fixups into the overlay's "/" node, which places
> >> them into the overlay "metadata" itself, not into a fixup fragment to be
> >> applied to the actual dtb. This series fixes those two by changing to
> >> full path "&{/}" which should work as it was initially intended.
> >> 
> >> See demonstration of the problem below:
> >> 
> [...]
> >> $ dtc extra.dtbo
> >> /dts-v1/;
> >> 
> >> / {
> >> 	foo;
> >> 
> >> 	bar {
> >> 		baz;
> >> 	};
> > 
> > Is this behaviour documented somewhere? I'd say, it would be a surprise
> > to me.
> > 
> 
> According to dtc docs [1],
> 
>    3.b) The Device Tree fragments must be compiled with the same option but they
>    must also have a tag (/plugin/) that allows undefined references to nodes
>    that are not present at compilation time to be recorded so that the runtime
>    loader can fix them.
> 
> so per my understanding "plugin" directive only changes the meaning of
> references (i.e. stuff with "&"), to generate fragments/fixups, which
> are the only way libfdt combines overlays into the base dtb.
> 
> I suppose the old way of "manually" writing fragments (and thus writing
> to / as raw nodes) was kept because phandle/path based updates were
> added later to dtc and many overlays were still defining raw fragments...
> 
> "/" also allows one to write "raw" nodes into the overlay, which is
> sometimes used by downstreams. (i.e. they put custom extensions to the
> overlay format [2] or add metadata into / of the dtbo like "compatible"
> values to reject incompatible overlays from applying. [3]) This is
> actually why I started looking here in the first place as for woa el2
> overlays I was asked to add compatible metadata as, apparently, NixOS
> tooling requires it to validate the overlays [4].

I see. Thanks a lot for the explanation and for the pointers!

> 
> [1] https://web.git.kernel.org/pub/scm/utils/dtc/dtc.git/tree/Documentation/dt-object-internal.txt#n120
> [2] https://github.com/raspberrypi/linux/blob/rpi-6.6.y/arch/arm/boot/dts/overlays/adafruit-st7735r-overlay.dts#L73
> [3] https://github.com/radxa-pkg/radxa-overlays/blob/main/arch/arm64/boot/dts/rockchip/overlays/rk3588-i2c0-m1.dts#L5
> [4] https://github.com/TravMurav/slbounce/blob/main/dtbo/x1e-el2.dtso#L12
> 
> >> 
> >> 	fragment@0 {
> >> 		target-path = "/";
> >> 
> >> 		__overlay__ {
> >> 			whatever-comes-next-after-baz;
> >> 		};
> >> 	};
> >> };
> >> 
> >> $ dtc combine.dtb
> >> /dts-v1/;
> >> 
> >> / {
> >> 	whatever-comes-next-after-baz;
> >> 	compatible = "fake,board";
> >> 	fake,value = <0x2a>;
> >> };
> >> 
> >> In the resulting dtb foo bar and baz are missing.
> >> 
> >> Signed-off-by: Nikita Travkin <nikita@trvn.ru>
> >> ---
> >> Nikita Travkin (2):
> >>       arm64: dts: qcom: qrb5165-rb5-vision-mezzanine: Fix broken overlay root
> >>       arm64: dts: qcom: sdm845-db845c-navigation-mezzanine: Fix the overlay root
> >> 
> >>  arch/arm64/boot/dts/qcom/qrb5165-rb5-vision-mezzanine.dtso       | 2 +-
> >>  arch/arm64/boot/dts/qcom/sdm845-db845c-navigation-mezzanine.dtso | 2 +-
> >>  2 files changed, 2 insertions(+), 2 deletions(-)
> >> ---
> >> base-commit: 8433c776e1eb1371f5cd40b5fd3a61f9c7b7f3ad
> >> change-id: 20250226-qcom-nonroot-overlays-bfe21d33be8c
> >> 
> >> Best regards,
> >> -- 
> >> Nikita Travkin <nikita@trvn.ru>
> >>

-- 
With best wishes
Dmitry

