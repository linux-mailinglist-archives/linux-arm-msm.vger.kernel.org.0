Return-Path: <linux-arm-msm+bounces-56074-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DA14AA0723
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Apr 2025 11:27:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0A79D48291C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Apr 2025 09:27:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7226B2BE118;
	Tue, 29 Apr 2025 09:25:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YZ4INpv2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3390E2BE0F6;
	Tue, 29 Apr 2025 09:25:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745918756; cv=none; b=SM4AP4I9VVsRFplRgPfyPuKCHAL0XobjR/3RcVGZV5ICMITNhOOqlCDnPu9WAAbrO+e2iqCaGnseLCULWBoYjHsMax6UTI25lKUBs2xeh5GwsfcCtywBX/ZiOlGyG5yCmBED8bhGPt+7Oz1IY4qyJZTVPynBOw9B7mUbrkalT6g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745918756; c=relaxed/simple;
	bh=aNHSzTuJO9qrwmXkoGFBppKTK0tfmRMsHjRBAWKQAcU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=WM+J88ZPCAjLItAiLLq4emKCSw9NjC2DoF5eOji+HbBCs+KKw0gmuFAhugJIYtQZqfQ9XnoHJuUdg0KMpwUlq8+EYPuGJMOwkM0XJrvf9s9rsa4vaP8BW3zvCyCgtO2tzunHVExr12hk32F8LMqh1PM/OTKGFUHA2etXKuyttNY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YZ4INpv2; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-224341bbc1dso61270965ad.3;
        Tue, 29 Apr 2025 02:25:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745918752; x=1746523552; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aNHSzTuJO9qrwmXkoGFBppKTK0tfmRMsHjRBAWKQAcU=;
        b=YZ4INpv2NkTQga5ysoZspYmc/o3CeU5nDg8wAMfHDM5xgx/YTClN66jKRMHDuZRj0j
         S/BaVNiuH0CKWr9JJ+Iie1smcTVCL8B8z9KHuV06151wqDpB3Hd6iRJz/W2Y2qXZSyPw
         TecZj6hDD6AJ0Ee5DlNUErVo2WeaaC1Cr7KCFAfwYK5aE+j7dAaTN5d153AEtA6EKfAv
         p1BmCtttEu2qpoI65y6W2/zPowURFlwEOJw0L/1I/CLDhRcJcceGwBygpFSDWrnJgVmW
         i2C4U08NuGAB5B61tC//T2DetD1mxRDJBZWtmvhSZ2E8cKtbEf4PhtzspGIpbtY8p62w
         pp7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745918752; x=1746523552;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aNHSzTuJO9qrwmXkoGFBppKTK0tfmRMsHjRBAWKQAcU=;
        b=mn7yL9Kx2TLQdlYXMuJ3myTH56HvH6x2VBvtjTPGlfAks9SqaIdKEp+o92OMBCaODY
         H72rO9W8ms5gBAT8B/MZODS7zZxsX9iG94YrUNuJPHYmkOxmn7M8KZojSv7aRorXDaDz
         dtpYbUaZac2DQLULQtmjmuvrK6nctGpYNXHtNL8dxtLqZA+xUDW4251zbERqFUjawfY/
         W2yonEmLfcfHgZViTJ/Q7KK8rm19wv/9TGcDPp6W3QQMOMItTXzOf/d9+Ah05quHD7si
         GNH1OGP5D7RySZ5RWXsR3Ar/ZsqrjNlXRxj7NaHWo9smYvwFxPFqER5KOn7yNeZkwU+m
         tGFQ==
X-Forwarded-Encrypted: i=1; AJvYcCU4QDeDBB7u09VAmD7EHD5xZTbnYuFklKna9r3vjo4jSECfxtzCp8BlxKrkB7Hg4kOKHPK4vdU5hq0n@vger.kernel.org, AJvYcCWOnHhtw++g2xeTJayGaFWYI8MzpE7Bm7svPoYi1Wc7jDnq0+GrqUyhR8Sm4aElTm++OyKzVA/D22iJklIn@vger.kernel.org, AJvYcCXW7w6Ww7Uh5k84wyR7DR9ZVyz0N/TrfhSwzGlzCSIIrJuo/pJC+VsDoBeqPZ38ohV5r9hNvfaJHigfiqojlw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwUJDnutrJpN9MR8J2+uHMUqYll/MpicPzzl9ycUMHnNS5wiVIB
	PcjWJ0IrLZmI+M8Fu2hcfEWrWCkLrc0U/esTxW5/CaYKecX5Ikjh
X-Gm-Gg: ASbGncvk4KU7KLFqtWfY4Y3JyhAw4KDLe1tmwwoILpjsumSMgxkTEvFpxX2AqZnmwcG
	BuPS9CypWr2LWHLWqiuT4Z96qzL73uyQnHnec+EcNmhh085+I0B7U8IGB6U0L6dEEWGXf8pGKXu
	i3RR117zE2riFpLslriQmyCwHpfZWfwdknp6rWKOum8mKeHN4MEVARxeYENy5vvf2GOoZJdEcm8
	QLiJNgnIgtY0VIhnKYeRRQfngscOOCYj4hgeTpBN2wJbr5IDm2/snhD3ABGPIXsSgA0Xre8ZuG2
	l2/hR+Dy097dpujWRQ9tKsrkAeciZcv8Qhv2bUg=
X-Google-Smtp-Source: AGHT+IHb3XDR+CIyVLJfE/+/qfZBH7IaetKlrGWMj5W8hWYAtZ5uFrtXFPsJJcx6PAeNDXijkIAQxw==
X-Received: by 2002:a17:903:28d:b0:223:f408:c3cf with SMTP id d9443c01a7336-22de70276d4mr36675615ad.21.1745918752192;
        Tue, 29 Apr 2025 02:25:52 -0700 (PDT)
Received: from nuvole.. ([144.202.86.13])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22db5221600sm97440105ad.213.2025.04.29.02.25.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Apr 2025 02:25:51 -0700 (PDT)
From: Pengyu Luo <mitltlatltl@gmail.com>
To: dmitry.baryshkov@oss.qualcomm.com
Cc: abel.vesa@linaro.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	kishon@kernel.org,
	krzk+dt@kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-phy@lists.infradead.org,
	mitltlatltl@gmail.com,
	robh@kernel.org,
	sfr@canb.auug.org.au,
	vkoul@kernel.org
Subject: Re: [PATCH v2 2/2] phy: qualcomm: phy-qcom-eusb2-repeater: rework reg override handler
Date: Tue, 29 Apr 2025 17:23:29 +0800
Message-ID: <20250429092331.53054-1-mitltlatltl@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <n5z5atbxkwqllni6cgygcw5nn7z4w3yjznhpkaajw6tggenxb3@kxpk2e6vmvlj>
References: <n5z5atbxkwqllni6cgygcw5nn7z4w3yjznhpkaajw6tggenxb3@kxpk2e6vmvlj>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On Tue, Apr 29, 2025 at 12:58 AM Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com> wrote:
> On Sat, Apr 26, 2025 at 04:14:23PM +0800, Pengyu Luo wrote:
> > On Sat, Apr 26, 2025 at 3:41 AM Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com> wrote:
> > > On Wed, Apr 16, 2025 at 08:02:01PM +0800, Pengyu Luo wrote:
> > > > In downstream tree, many registers need to be overridden, it varies
> > > > from devices and platforms, with these registers getting more, adding
> > > > a handler for this is helpful.
> > >
> > > It should be noted that previously all values were applied during _init
> > > phase, before checking the status etc. Now the overrides are programmed
> > > from the set_mode. Should you still program sane defaults at the init
> > > stage too?
> > >
> >
> > I think programming in set_mode is ok. When we init(dwc3_core_init), we
> > set_mode(dwc3_core_init_mode) later, please check
> > https://elixir.bootlin.com/linux/v6.14.3/source/drivers/usb/dwc3/core.c#L2287
>
> Yes, but that happens after reading status regs, etc.
>
> > Actually, in the downstream, all the things are done in init, it
> > overrides first, then masked write the deaults, finally it set_mode,
> > you can check here
> > https://github.com/OnePlusOSS/android_kernel_oneplus_sm8650/blob/oneplus/sm8650_v_15.0.0_pad_pro/drivers/usb/repeater/repeater-qti-pmic-eusb2.c#L356
>
> I'd stick to this approach too. Program everything in init, then
> program mode-dependent regs in set_mode.
>

If so, I don't mind programming the defaults in init, then programming
overrides in set_mode.

> >
> > > BTW, is there a real need to override those for the platform you are
> > > working on? Could you please provide some details, maybe in the cover
> > > letter.
> >
> > I am not quite sure, recently, I expirenced mode switching failure,
> > when I `echo device > /sys/kernel/debug/usb/a600000.usb/mode`, Ethernet
> > Gadget wouldn't work again, my desktop can't connect to it.
>
> Do you have at least a list of the properties / registers that
> downstream programs on your platform? I mean, it's not infrequent that
> vendor kernel is more versatile than necessary, as it is being used
> during bringup / etc. I'd suggest to limit supported overrides to those
> necessary for your platform (and add a comment that there were other
> available).
>

Yes, I only added the necessary overrides(0x54, and mode handling).
Please check

https://github.com/OnePlusOSS/android_kernel_modules_and_devicetree_oneplus_sm8650/blob/oneplus/sm8650_v_15.0.0_pad_pro/kernel_platform/qcom/proprietary/devicetree/oplus/oplus_misc/oplus-misc-23926.dtsi#L26

Best wishes,
Pengyu

