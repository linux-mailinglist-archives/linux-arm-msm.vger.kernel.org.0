Return-Path: <linux-arm-msm+bounces-59031-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E4FD4AC095D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 May 2025 12:05:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DE60E3AFA5A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 May 2025 10:05:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D082D288CB1;
	Thu, 22 May 2025 10:05:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bzPGSthB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2381A288CA5;
	Thu, 22 May 2025 10:05:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747908336; cv=none; b=YL0oh4KPpsK2Hb2ek90Kk9XwpI6bbe6gFKfff7twX2TZZEXf6qN6Um/SLiBOXShga5FRNQ8st+PfugjAf2sa0+j7coD7HD6s7vGlQbOfHp3UbygWFEaavBj8q0cVI8Xofd6aBLnbsN33vfy3u9CSV1tl9FGJG8heNyTY+f/kW2E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747908336; c=relaxed/simple;
	bh=Ob+QEu5u3fO6lExHb8kQbJFszSV5G/Su1RL5pxKqsGo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ReIHBO6czuD6WHiWot19nVQpOZ7PWXuK4AW8Hw8UJ9ebAk1c5/FA0IhL0IwqqLc61LtjA7IXUfcJPlcV3BoNzHAORrEqBBXYYNM/GFvf9dUTgt5HpP/JGHg4cmteP62xjRjS58Of4aamBZ7Um/j4TN+AECdzSd5IwCMsLRmLa2I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bzPGSthB; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-231fd67a9aeso44906105ad.1;
        Thu, 22 May 2025 03:05:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747908333; x=1748513133; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+ZWNM0qOAzKcTeNIPBms1QuvvuHZdYXPVwXg7CaBMsk=;
        b=bzPGSthBZ9ys+fJJS+IWNesm6RggRYU0FK+v7PaWukBPPl6P3ldHpN6a/FzxDft2HM
         jDgAvMe5nhFZlDSfCME7K1yuG02u+MlBJQN8Cc+cxFkcgCgN59RdAFPwW7sXK/PPQTKG
         Ge0gynBpvxK2viKjh3rWVmSJst/k5JbUQpEmQxuj8CYBepDJiqTKlpCQLsgL7ZICv+ai
         Eu72JiXJyGyeVV0GOb+YGu6kajvxwsatwwbeIS9gHujxTbpLtO9LSK9UtYsCGadHw8Hr
         j2VErZEcDOB+dFHxfVB4t9Ve5sBTX2D8PJalpgGSCF3rVAQ7Etmw/7FDA6JVGlSZk2mP
         3mXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747908333; x=1748513133;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+ZWNM0qOAzKcTeNIPBms1QuvvuHZdYXPVwXg7CaBMsk=;
        b=CbAk/cPJ5iiAlJYt1iFkbvVSFosPSw3pHIFk86Bv9eCbVhR7eFPeUv0LdsW80RhWwK
         gT2KuiD7YNag/q/cEgq2jeU0YtTiLyGkmxkpNNABjQypvxMLkPhVvRgLdrueFSZldgzT
         za2U6wxAudlYqIi718bGjKziKlsISImdBk7QUykSiQx2NR0Ec2vXQeK/BSIkU/S0rBHt
         efEoLzZ2y1BElgs5z/9KbKqj3dkmPgEbkdm3/t1flrxbEKHNPSKfU0FRek+OeaulyojM
         iPEwPq/BNr6+X9CHVFlw8W+L32spYvSmq1caToJq+3hwiThkQNYlCIhCHHJH40KYSJXI
         7MBg==
X-Forwarded-Encrypted: i=1; AJvYcCUIfVDvUai9+LHQVS5C5Kh33a4vpJfUv046qWIB0r8/0X5+D7AvlBw6UPmmAqKC5svuGxvmu6XCVVTQkIqBsQ==@vger.kernel.org, AJvYcCVgoX95NlDEDIxgOMugE4uu1odpOlZlAsNiIBz3jph/jrXvVQLPyBfxs/D0boIyQNCLhFPTYTnPYtaB@vger.kernel.org, AJvYcCX7XMWLrz8jrw3Q7Ol+gLfLRMjixOSrNxbNHnXxoCqGSjHNvSoGuDk+9rUfiLttuxf9i2pU5EiQ+UFLM/eQ@vger.kernel.org
X-Gm-Message-State: AOJu0YzIkng2YQ66bgRWL5v/H7VBll1nUpHmXV9DNmxGxloIQI8KbPVC
	z23ibQ3jNhQAmS9NvC+P/hGA5bw8EUN4/azxLCXE399WCR53JRZNkUDR2Dp8Rw==
X-Gm-Gg: ASbGncuKBEFY4Y2nf5wx4XdGAXRer5Yg6fxEcNjC9NnyabJ1xV+3BcoXZKncvJ4KrOQ
	nDu9eLt3SKa/JBZLCptMQq55CpIFM3o+Xv+WN28eTmABhRnKhd179lCGLo/xGSi8/G8KzOEifTN
	BIAjCE1XOxiRqn73qtxqFmm4fi06QGuU+zq5dryUxn1NPiVDJbxI7L9LnB7ldj1vSrAyczmZf3j
	B3jkEPYnaSQ1SPjlQrl0t5btd4x2z3bm4WUfm+UMh+peGqB/4j3ElbaMHWrAS1z4a0xpU8vmEwQ
	e+KnVJAypeLc28bDTIJKWpKBv/J4q98vBsSrIFanQJv+j3Lyv6MmqaUU3JXU
X-Google-Smtp-Source: AGHT+IFGZ347pUBknlna4lSwHzI6awybH8nfivRFT50DwTQo/IwwBrP3B6DWcfEFOdDOocoBfnU96Q==
X-Received: by 2002:a17:902:da2d:b0:232:2037:178e with SMTP id d9443c01a7336-232203718b1mr249593405ad.1.1747908333139;
        Thu, 22 May 2025 03:05:33 -0700 (PDT)
Received: from nuvole.. ([144.202.86.13])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-231d4ac93besm105198765ad.12.2025.05.22.03.05.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 May 2025 03:05:32 -0700 (PDT)
From: Pengyu Luo <mitltlatltl@gmail.com>
To: neil.armstrong@linaro.org
Cc: andersson@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	konrad.dybcio@oss.qualcomm.com,
	konradybcio@kernel.org,
	krzk+dt@kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	mitltlatltl@gmail.com,
	robh@kernel.org
Subject: Re: [PATCH 2/2] arm64: dts: qcom: sm8650: Add support for Oneplus Pad Pro (caihong)
Date: Thu, 22 May 2025 18:05:24 +0800
Message-ID: <20250522100526.914341-1-mitltlatltl@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <d455a8d0-0a43-4bb5-8592-f22f1835a3c6@linaro.org>
References: <d455a8d0-0a43-4bb5-8592-f22f1835a3c6@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On Wed, May 21, 2025 at 8:43 PM <neil.armstrong@linaro.org> wrote:
> On 21/05/2025 10:37, Pengyu Luo wrote:
> > On Wed, May 21, 2025 at 5:54 AM Konrad Dybcio <konrad.dybcio@oss.qualcomm.com> wrote:
> >> On 5/20/25 6:42 PM, Pengyu Luo wrote:
> >>> The OnePlus Pad Pro is an Android tablet based on the Qualcomm SM8650
> >>> platform. Its device codename is "caihong". This patch adds an initial
> >>> devicetree for basic functionality.
> >>>
> >>> Currently working components include:
> >>> - Backlight
> >>> - Bluetooth
> >>> - Battery charging (up to 5v 0.5a) & reporting via pmic-glink (There
> >>> are many unknown notifications)
> >>> - Display panel ([1])
> >>> - Keyboard (via BT)
> >>> - Power key & volume keys
> >>> - Touchscreen & stylus ([2])
> >>> - USB Type-c port
> >>> - UFS storage
> >>> - Wi-Fi
> >>>
> >>> The following components are currently non-functional:
> >>> - Audio
> >>> - Cameras
> >>> - Charging pump (dual sc8547)
> >>> - Keyboard (via pogo pin)
> >>> - Stylus wireless charger (cps8601)
> >>> - UCSI over GLINK (PPM init fails)
> >>>
> >>> [1]: The panel is a dual-DSI, dual-DSC display that requires setting
> >>>       'slice_per_pkt = 2' in the DPU configuration. The panel driver
> >>>       will be submitted separately later.
> >>> [2]: Touchscreen/stylus driver available at:
> >>>       https://github.com/OnePlusOSS/android_kernel_modules_and_devicetree_oneplus_sm8650/blob/oneplus/sm8650_v_15.0.0_pad_pro/vendor/oplus/kernel/touchpanel/oplus_touchscreen_v2/Novatek/NT36532_noflash/nvt_drivers_nt36532_noflash.c
> >>>       The downstream driver has been ported and tested locally, but
> >>>       requires cleanup, it may be submitted separately later.
> >>
> >> I have a Lenovo Tab P11 with a nt36523w (-23, not -32) for which I have once
> >> poked at the driver for.. I see the driver you posted mentions -23 as well,
> >> please keep me in the loop if you're going to upstream it
> >>
> >
> > I see. Actually, they share the most part of nt36xxx, but with
> > different memory maps. See
> > https://github.com/MiCode/Xiaomi_Kernel_OpenSource/blob/elish-r-oss/drivers/input/touchscreen/nt36xxx/nt36xxx_mem_map.h
> >
> >> [...]
> >>
> >>> +             /*
> >>> +              * This memory region is required to initialize the backlight
> >>> +              * and display for bootloader. Normally, this region is not
> >>> +              * needed. However, due to limitations in the current mainline
> >>> +              * KTZ8866 driver, dual backlight ICs cannot be properly
> >>> +              * initialized.
> >>> +              *
> >>> +              * A workaround involving secondary registration was proposed,
> >>> +              * but rejected by reviewers. This reserved region is kept as
> >>> +              * a temporary solution until a proper initialization method
> >>> +              * that satisfies upstream requirements is found.
> >>> +              */
> >>> +             splash_region {
> >>> +                     reg = <0 0xd5100000 0 0x2b00000>;
> >>> +                     no-map;
> >>> +             };
> >>
> >> I assume this means "if the bootloader sees /reserved-memory/splash_region,
> >> it keeps the display online" - let's not do that, as underscores are not
> >> allowed in node names (kernel coding style, not dt syntax)
> >>
> >
> > Right, without it, BL won't initialize backlight and display. We need
> > it to initialize backlight here since mainline ktz8866 won't program
> > partial registers properly. If there is no other workaround, I will
> > remove it to keep kernel coding style.
>
> Can't you add a simple-framebuffer for v1 and drop all the DSI stuff until
> you figured out the backlight and upstreamed the panel driver ?
>

I am thinking about it. But still, if backlight can't be properly
programmed, simple-framebuffer won't help.

Best wishes,
Pengyu

