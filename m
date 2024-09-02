Return-Path: <linux-arm-msm+bounces-30370-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A16AF967CE8
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Sep 2024 02:04:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B76701C20B54
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Sep 2024 00:04:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 51ABF382;
	Mon,  2 Sep 2024 00:04:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="oxmbq/Q/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73F452F36
	for <linux-arm-msm@vger.kernel.org>; Mon,  2 Sep 2024 00:04:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725235478; cv=none; b=kuZiNk3HwX8RmpgC3zO2krnKKzEouJOzeJin0ckdmfXxf5hsRGtvGguEro00CQ7YzNmg4FGysRLpmdeSGJhFyhxOM3dZuHfGmT/NgpWyNODlt7iLNRKhqhe8xke5HEIzJZj7wo+yKGk7rwXk/BMXiHGWc5kxPqwGYw4R1te0oAg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725235478; c=relaxed/simple;
	bh=AIMKk0vr05j/JN7kUcIvr6QlblRYNrqTgw7hPd6ATWo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sptzjPGASk+qCSGOA4YwAinKCcdPxU6xOdwHCCEl8pq8mdoOHgzugUugtvuhFVgFVq1dyTJHGep1HtAncn4nOXajpBEGVFVQjJnOl5JfahgOVV1ZCn8EFJU/mZQmH47+nJ/qLPVGQqAF27/BfDCxk9fefZsJIxxJPyuwvPZqVBk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=oxmbq/Q/; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-5334c4cc17fso5026758e87.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 01 Sep 2024 17:04:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1725235475; x=1725840275; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=TMHycy7n+Kn0NxUFPMQh5Vl2qyUVAHQKpnXTaZwIUyk=;
        b=oxmbq/Q/y1lY5i+0z3g03XGLoZvFcX1ob/+mHCNEmLorik3n3VAmnaDV2w4+y+hYws
         NamDxZfVyTH/J1krIYl/tmQJW01FKFqXi0YHyMS+M7COtvn0viI4YVFe7TudH4+36uGY
         utcKIxNo0PXTisKvYGbkWE4vooP63Hdfb6UiqEfzGIx1lOlbhmJEAkxC3C9oBun4BAcB
         NO0RMZbyD0LKdmhte6Nb63GJMjO7D6MdYlvu4yqyWWQVEuY0stDERWz6swJZRZ6A2b+V
         xSnTdY07WBc1u5Zale5rW7xhoujBgPKENkFDJ/uhXF6sr0n8B1J6Cw9SuhfZ6Nq0JfpJ
         wRSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725235475; x=1725840275;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TMHycy7n+Kn0NxUFPMQh5Vl2qyUVAHQKpnXTaZwIUyk=;
        b=bd9w577HZ/EUjtfAPOhL9/D2IZi5OkLwJWs7XdgusEbVd2gUEQR2+tZTKjZejIHklc
         S+ktml6N5HdEWtYW5QLiIaoiPHgp/blx7VYxTF4kyB7F417UCcVI99RGODhMmogWhtdf
         ZAsQ1IpENc56kjA9d1iEGo1FsjdSVAdb4gOWj/4iIhfo+Kmiq6wfCrSE6XsIiPHC22Zq
         dyKsB5VmClVr897eh4pNeWgdBeYGBUaT3LROzFq6WNOXt+UZIfDjSZ2gctXtjVCU5e55
         nKEkSPh/2ytgEaSlqKZ+ISYJ4skCPN5e9zLThCDC94W7yEgzpkFpeEwQRlDLQc344prz
         GRAA==
X-Forwarded-Encrypted: i=1; AJvYcCWcCuQjd9YWlGenmD9ylFVJdZ2hq6KAIkuCKOpXGfgN3Xkr4+wZONdUKRxjHO5AXv9bQQo1wWguECI0CiXO@vger.kernel.org
X-Gm-Message-State: AOJu0YwtDiH8+PWKXOnrmTaVXdDJ8CCPCb2/tD344ERXSPdMDFUQ4QOY
	m6OklPKnM6aC3RnKFyejpsO6+KI6Fno07RRRnJx1B/YlyPzQ8vhj0IK6e0VmM5E=
X-Google-Smtp-Source: AGHT+IEW3UU73BtIfl6ednpkPRqDPpo9RjV+JHef1ejW/weH2euNFXBre9ESSLDiegYPQExAAt2qgQ==
X-Received: by 2002:ac2:4e0d:0:b0:52f:d69e:bb38 with SMTP id 2adb3069b0e04-53546afd7c6mr5964332e87.2.1725235473827;
        Sun, 01 Sep 2024 17:04:33 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5354079babdsm1395025e87.50.2024.09.01.17.04.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Sep 2024 17:04:33 -0700 (PDT)
Date: Mon, 2 Sep 2024 03:04:31 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: quic_dikshita@quicinc.com, Vikash Garodia <quic_vgarodia@quicinc.com>, 
	Abhinav Kumar <quic_abhinavk@quicinc.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 07/29] media: iris: implement video firmware
 load/unload
Message-ID: <trgsgzvsfvlzbymjrlav6blhxojkyom2652rcxpi2xyh67eu46@27vaonzutgmc>
References: <20240827-iris_v3-v3-0-c5fdbbe65e70@quicinc.com>
 <20240827-iris_v3-v3-7-c5fdbbe65e70@quicinc.com>
 <293f3ddd-531b-443f-a58c-a789337e2b35@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <293f3ddd-531b-443f-a58c-a789337e2b35@linaro.org>

On Sat, Aug 31, 2024 at 02:18:16PM GMT, Bryan O'Donoghue wrote:
> On 27/08/2024 11:05, Dikshita Agarwal via B4 Relay wrote:
> > From: Dikshita Agarwal <quic_dikshita@quicinc.com>
> > 
> > Load/unload firmware in memory via mdt loader.
> > Firmware is loaded as part of core initialization
> > and unloaded as part of core de-initialization.
> > 
> > Signed-off-by: Dikshita Agarwal <quic_dikshita@quicinc.com>
> > ---
> >   drivers/media/platform/qcom/iris/Kconfig           |   2 +
> >   drivers/media/platform/qcom/iris/Makefile          |   1 +
> >   drivers/media/platform/qcom/iris/iris_core.c       |   8 ++
> >   drivers/media/platform/qcom/iris/iris_firmware.c   | 146 +++++++++++++++++++++
> >   drivers/media/platform/qcom/iris/iris_firmware.h   |  14 ++
> >   .../platform/qcom/iris/iris_platform_common.h      |  12 ++
> >   .../platform/qcom/iris/iris_platform_sm8250.c      |  10 ++
> >   .../platform/qcom/iris/iris_platform_sm8550.c      |  10 ++
> >   8 files changed, 203 insertions(+)
> > 

[skipped]

> > @@ -38,4 +45,7 @@ struct iris_platform_data sm8250_data = {
> >   	.clk_tbl = sm8250_clk_table,
> >   	.clk_tbl_size = ARRAY_SIZE(sm8250_clk_table),
> >   	.dma_mask = GENMASK(31, 29) - 1,
> > +	.fwname = "qcom/vpu/vpu20_p4.mbn",
> 
> 
> RB5/sm8250 on this kernel
> 
> https://git.codelinaro.org/bryan.odonoghue/kernel/-/tree/linux-stable-24-08-29-iris-v3-rb5?ref_type=heads
> 
> CONFIG_QCOM_VENUS = m
> 
> Loads fine and I can run this simple smoke test
> 
> ffplay -loglevel debug -codec:video h264_v4l2m2m -i sample-5s.mp4
> gst-launch-1.0 -vvv -e filesrc location=sample-5s.mp4 ! qtdemux ! parsebin !
> v4l2h264dec ! autovideosink
> 
> 
> CONFIG_QCOM_IRIS = m
> 
> [    2.130077] hw perfevents: enabled with armv8_pmuv3 PMU driver, 7
> counters available
> [   12.282381] qcom-iris aa00000.video-codec: Adding to iommu group 13
> [   12.463983] qcom-iris aa00000.video-codec: Direct firmware load for
> qcom/vpu/vpu20_p4.mbn failed with error -2
> [   12.474396] qcom-iris aa00000.video-codec: failed to request fw
> "qcom/vpu/vpu20_p4.mbn", error -2
> [   12.490919] qcom-iris aa00000.video-codec: firmware download failed
> [   12.516391] qcom-iris aa00000.video-codec: core init failed
> 
> In venus the firmware name is
> 
> .fwname = "qcom/vpu-1.0/venus.mbn"
> 
> What firmware reference are you testing on with your rb5/sm8250 stuff ?
> 
> Mine is linux-firmware / Debian sid.

linux-firmware Git supports both firmware names, but I agree, the driver
should be using the old firmware name. At least until linux-firmware
gets released and that name actually propagates to several distros.

> 
> root@linaro-gnome:~# dpkg -S /lib/firmware/qcom/vpu-1.0/venus.mbn
> firmware-qcom-soc: /lib/firmware/qcom/vpu-1.0/venus.mbn
> 
> https://packages.debian.org/sid/firmware-qcom-soc
> 
> Anyway I don't see much logic/justification for the firmware string change.
> 
> ---
> bod

-- 
With best wishes
Dmitry

