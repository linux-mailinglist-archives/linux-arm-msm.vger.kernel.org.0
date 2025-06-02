Return-Path: <linux-arm-msm+bounces-60062-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id F1E41ACAF4D
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Jun 2025 15:44:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 06767189FC84
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Jun 2025 13:45:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6C3F22192EC;
	Mon,  2 Jun 2025 13:44:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bs0vK6AW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8CA870825;
	Mon,  2 Jun 2025 13:44:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748871887; cv=none; b=T6e/4nbftbt79yB4rpqrK1btxKu8kBZL6dtKi0pujEi1zSfm2d+u0ZCiWg5mI2wlamZP/TVqH7uAnRkqpQCeb61UeajyP111FMDgEvEHaVHYMs79NQeYvwxcaCaVq69OC+h/rhuSDR/yxjOyg8pnt12hUI+MPJJLOOOFFh0ntSk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748871887; c=relaxed/simple;
	bh=PBjdw75nG2B+DZlXL6ieuXIjx1Is8+ut5awWeFQLto0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Fc5uKPFIyWunQJNEc21CST1IIFSKGktxjMcT8vJvlp6mYEaflLaJ+A860kn1BolGjItMeCTJKj3wNjldcf63KaObL7lJ5Q47FapDhNI7VVmay8zd0pQdXBUMA+qn0stqb23QHj7S8cP3amuPEJ1Egq+LUJz+TCeIE46DFt302MA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bs0vK6AW; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-22c33677183so34374845ad.2;
        Mon, 02 Jun 2025 06:44:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748871885; x=1749476685; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rFBx5jKDuVRtha+SRezclpTFWVzFgQykHX5dVfLDSwI=;
        b=bs0vK6AWwrIfu13lE6N+NG7s1sP9C8k46CLQkLwE1JSr19I7ZDHce4XwjQzDu3f2bT
         QefBrC/qUFmQBfqNr4xkC9KTpLaLF1j/kdvxqS1TT2bOpVu3OggYrIo3TVE6AW/4O8HK
         LWm3Q03dRp8Ln9BcW04Wwb+TzsAAXHYlO0xA/y93Dtmq1HA47DenH54WZ+XBZAjZ8hXk
         Lm/LSpOCDide5CzubX0Yj2ms0tPEtnoB/qr3W4Ld0toVqjPgiZks4i+VxKyj4oNk130G
         zfUz5WmaZlOuG8YoqiU2q6EOmCHXE+R0dNT0MClnJaFIYlHwTvtvE48NUTbKTn2pW+XU
         3rJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748871885; x=1749476685;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rFBx5jKDuVRtha+SRezclpTFWVzFgQykHX5dVfLDSwI=;
        b=ahFG+KsPt5p28TDeH9ZQoLk8POSyUApruJr5HGR0h0COYCgVfm+0tMMGODORAnV63c
         Xy1aXvWODC1Fv1HRnRuOdoykt3OKdsA6z/GYIk7Smcp7/FohhXY8kU2nGxfgcrRtA4Nw
         aobFeGa5GXfHNI2dzFSnP5gG/GbJ18ui6X4uQ7jVW5P2jGmPLohKCnrCIoE6AgAyqd1v
         7EABp242aYqJslSVdyf/r7BCxO/3FRFf/JFwKlGwMNM2SnJt88lOIVstYVu2OAfSTkHY
         6Ix10cPYDvn3y9A1n+HSSVBsKVieNpPVOaLjmHZBiDzsM8dIGg2V4in0LcvXPCbsPXg6
         D2ag==
X-Forwarded-Encrypted: i=1; AJvYcCWyiJ7duV731u3+p/P5WGLKhbyRu7oEfxeozFAsyBwhYCXrdg+Q6t0g6qW3JKyzquFkIPrg5dwXQ8TQ@vger.kernel.org, AJvYcCX+eEzUfPR+QYPLEmeiTG8z8ZjEW1zKOqHFyLGIrksTJc2MpVSs0EtzHGi3zW/uEl5AN3aYPZArNQaOHsxDfw==@vger.kernel.org, AJvYcCXSLMMwNy6HLKmcFr/k+HqeSDv0LeoqdipXDrGOzf1dhnyCDyoiUsPddoxbRIthBljH+x55QBBiYySz6fgv@vger.kernel.org
X-Gm-Message-State: AOJu0Yyq/J55plLsi8SNh4OvTRwhuPVPxsm4qt5ftw95SbRfCQ+RGSDX
	5mLovfLF5l6JenpkvEyoT/Jekfbhyi/1a/limlf8pe1nackVzaVwxWPL
X-Gm-Gg: ASbGncu+QwBWGl5EX0SUP9jcIVpcw6dUI4ud6EZOwXhiXwpJFQqwIfqIEhcPwWCZwU4
	ifemG3yFI2j4NTauum1uK52p/nSZDtOnwlqQ/g1g/hnEBck7RNP4tJI9MeDNJmlCC7mD3ORd9Kd
	/V111iQ004ugftsqtxkyJPPfwDeR9+McmwaMxe9Gq0YCDCrX7SbsISpxGOo8bpcK/nZWSUoq5q0
	C5yKpiSMX30sIkPLwle4mmor9o6PBCL5U+/V1DKsNjIx3tw+TRldGBbBSd7Rq737ylUPe1ILQDQ
	go84HkRo/PwHeX2W2HnHjIw5zq9zejJ2qLdrFvxiELPy/weBbQ==
X-Google-Smtp-Source: AGHT+IGZ3ISao9LOD02HFMyv7IYGlfRXgbofDUHMIrOHIClx9GbRhRLjxOBF6CIZaY+GlJ6G8Cmevg==
X-Received: by 2002:a17:902:ea11:b0:234:9068:ed99 with SMTP id d9443c01a7336-235395b1df0mr176410065ad.24.1748871885009;
        Mon, 02 Jun 2025 06:44:45 -0700 (PDT)
Received: from nuvole.. ([144.202.86.13])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23506cd7623sm70817855ad.114.2025.06.02.06.44.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Jun 2025 06:44:44 -0700 (PDT)
From: Pengyu Luo <mitltlatltl@gmail.com>
To: konrad.dybcio@oss.qualcomm.com
Cc: andersson@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	konradybcio@kernel.org,
	krzk+dt@kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	mitltlatltl@gmail.com,
	robh@kernel.org
Subject: Re: [PATCH 2/2] arm64: dts: qcom: sm8650: Add support for Oneplus Pad Pro (caihong)
Date: Mon,  2 Jun 2025 21:44:30 +0800
Message-ID: <20250602134431.114469-1-mitltlatltl@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <2e052c11-f22c-4d95-841e-cb4665d02451@oss.qualcomm.com>
References: <2e052c11-f22c-4d95-841e-cb4665d02451@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On Tue, May 27, 2025 at 7:11 PM Konrad Dybcio <konrad.dybcio@oss.qualcomm.com> wrote:
> On 5/25/25 12:51 PM, Pengyu Luo wrote:
> > On Thu, May 22, 2025 at 11:05 PM Konrad Dybcio <konrad.dybcio@oss.qualcomm.com> wrote:
> >> On 5/21/25 10:37 AM, Pengyu Luo wrote:
> >>> On Wed, May 21, 2025 at 5:54 AM Konrad Dybcio <konrad.dybcio@oss.qualcomm.com> wrote:
> >>>> On 5/20/25 6:42 PM, Pengyu Luo wrote:
> >>>>> The OnePlus Pad Pro is an Android tablet based on the Qualcomm SM8650
> >>>>> platform. Its device codename is "caihong". This patch adds an initial
> >>>>> devicetree for basic functionality.
> >>
> >> [...]
> >>
> >>>>> +&i2c2 {
> >>>>> +     status = "okay";
> >>>>> +
> >>>>> +     /* secondary kinetic,ktz8866@11 */
> >>>>
> >>>> You can describe it, the driver sets some nonzero default brightness
> >>>>
> >>>
> >>> But the backlight framework won't index them, which causes sysfs
> >>> collision when the second instance is registering.
> >>
> >> Have you talked to the backlight maintainers? This shouldn't be too
> >> complex to figure out
> >
> > Last time I tried to touch ktz8866 source, the reviewer advised me to
> > add an backlight API to register the secondary devie. Since I am still
> > working on the other parts when I am free, it remains unresolved. Now
> > that you reminded me, then I tried to do it.
> >
> > https://lore.kernel.org/linux-fbdev/20250525104022.1326997-1-mitltlatltl@gmail.com/
>
> I think this should be made more generic, so that devices with e.g.
> quad backlight can be easily accommodated for too.. Perhaps you could
> do something like PLATFORM_DEVID_AUTO with incrementing suffixes and

Agree, thanks.

> make `backlight = <&foo>;` on the panel accept an array of devices
> that would be controlled together

In this way, we keep them independent, but we control every backlight
in drm_panel. The questions are the systemd and distribution(sorry, I
am just a junior, I use them). Generally, the systemd will create
serivce for every backlight sysfs. I encountered that they saved
different backlight values, even if I set the same value manually.
As for distribution, it seems that only half backlight is controlled.
I encountered that only half backlight got dimmed.

Best wishes,
Pengyu

