Return-Path: <linux-arm-msm+bounces-69420-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 20D6EB288BD
	for <lists+linux-arm-msm@lfdr.de>; Sat, 16 Aug 2025 01:28:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 115DB17B1F3
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 Aug 2025 23:28:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AF3932D372F;
	Fri, 15 Aug 2025 23:28:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ORlsdhRQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 445C926B747;
	Fri, 15 Aug 2025 23:28:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755300520; cv=none; b=jwCBMn4um+TRwjXS23Ip/8RrqK3knHIet3HcdRL+HSNuUhtoWIvITqKfJFYD/r5CxJB3l3RH/7xEELuc4pcBtoe62YTVVT8pzpCjnqyHyWYCfEoGMlhFPacc9fIylZAOelrEXVPGZIFfPuzk7dAPe+Xe8wtj6qNn1q1Mlf8/a8E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755300520; c=relaxed/simple;
	bh=UvoYpGdpZ518sX1C9ntrRKU5XcSUp21l1zLHFegmRU0=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=QgMnsVefoqHrui7yryZ9gVV+SsJOsALGXITrJnEiS9RxQW6dba6coeYvyE4vgu6HlIG8XfIuXVKEL/EezGnvSlfp5hpxgTRUjd3iUbFm7+OxpCj9hV6riJA9av/zjILUzxkd7YmSMXcb8LEgRC2Sqblcu4lb4C1aDNU21DfNjBg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ORlsdhRQ; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-244582738b5so21324275ad.3;
        Fri, 15 Aug 2025 16:28:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755300516; x=1755905316; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=vJTHdLNFpJHwfmgbDDHn1yEdiFV4xKdd+LYG/JjzbEo=;
        b=ORlsdhRQtkpqUdgnXT1PmdSXSyR1EDT5yUCshZpiBYcR2U8O3b/KHNqXh8IF8m6gLb
         shWbaT2k5WIQKIdQWcaqGi7WLYB8uxd9kzwJCXtZMhb5RzVcri6H0SHU5mpN77KwqwtJ
         ym3huelUXDyOCUmBumrvm5xY9w+w4yGX7gNVahlngTW93lUKuk+/bxM2t8tP7yjuxsVq
         oOoxWh7wSWHL9GcUhwKPA2dDYddFrJqt5paHCFS2fCPPSs0y5ls/0qSQtBUQqa69uRxX
         klwJH4UVCMxPp8wKl+EuyulFzNn6OgqslUTszc5zSMdWgRDJ4v9E2rrQpsD9nUSKTu69
         0qBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755300516; x=1755905316;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:cc:to:from:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vJTHdLNFpJHwfmgbDDHn1yEdiFV4xKdd+LYG/JjzbEo=;
        b=dHl8BUfv9CS66na14GaNAxFcvGYVt0a7NJDEgZKnY2i6nitKgtMCLISiutoU/zRK4m
         T0g2Bk4ND5EbqSjBLGJbd1qqLWzZS+2ypXfttMA54gnrQeRXGKEYy7MIDrftehgi7Zv8
         R5Q5j4YY6pkMoOpoOLePY3L79nnHiX47eUkTL628Au3IGttC98VeRtVtGnIDRfeHfPD6
         QhygEwcV5OYCsOGozyw+uLz2ub1sRAMUwq9oE4BJ0Ke606TrHDZubqEs8uAHjuNhceFd
         KbpNu9TnJTdjRZh4KDI4rowknJ71jVeMSR1XWrZ57YdXaRX2jpwqHectE+wCCuvjPHjf
         rfww==
X-Forwarded-Encrypted: i=1; AJvYcCVtI++qQm4Pe1y/nDgVOFRNvjnc1Juz4QO98CYMzUNfhxZh49mcjUQEA9b7M8E2fl0HyoC2O7Pr4R9q@vger.kernel.org, AJvYcCX49eKExEN845wUJIROyCcHicNnNpb0cmNxnRXrl+bNI1dPr3Y5u1knT9NQlXDXwoB9jp7iPANZ7AnF5ZygjQ==@vger.kernel.org, AJvYcCXZY5NMvWhhJ77BNV+cORtz9F8eGRgAwRkydWW5qpzTrncwtD/Rm804gfoJIh9Rm4tBN/4XhPpc+GF7t36N@vger.kernel.org
X-Gm-Message-State: AOJu0Yw2rIgwgga5QCfizelmZmFPPuTt0xT33V/MpcFlXoL9QCoKqCMR
	oDzJMbdq6N+ebBdMLZl991fqKAoOcEbvzaavnzxZH+ueJ8FQe4GFxY4p
X-Gm-Gg: ASbGncsyXtFIdKr/XnvHUvfFqlofHEkmVBuKb/5RB9h7zRh1nLHYB/u7z+NH0wgEfHN
	HJa95884iEksgyjkoSFG9/kF1uke8ok0CdcBIAn+aZUo4QwTSahd9EpZHo8Ib44NIv+Qc+OgRFh
	ZfQEQuQ1Dtp8dolFBUogbKAw8AVom4FX9pymPGF/P6E4+ppzwwylVB0aFO3KvKNYxMWusW9V2E7
	Xh1I+ee9MJeWJpCMesMRVB0WI2S96ec7D7A5FTKwDSQ+Ptlo9oIMMb4IPqJ8BpK7FX7hl+KD7Zz
	eAwkFQqXWrhD7RS1o0uMr9sn8oh/gUD5lKt00Hfg4FkgVXy3blkucmnyAaG2KbTbERZfXa7rQPD
	36NscRKainRTx5U02ViNzFfe1ZjVagkRt1QBFzHGH8hX1iq/hzh16UbOoj79d1CjecT4=
X-Google-Smtp-Source: AGHT+IFzx9EtbLSYVs1fz25p0drTFKOY0IALI0Ty8HFwEEwX9LRI2JXlSWi6o2ZeRHrSFKMPMeeoLg==
X-Received: by 2002:a17:902:cccb:b0:235:7c6:ebdb with SMTP id d9443c01a7336-2446d6dc1bemr48990105ad.10.1755300516361;
        Fri, 15 Aug 2025 16:28:36 -0700 (PDT)
Received: from ehlo.thunderbird.net (201-0-28-218.dsl.telesp.net.br. [201.0.28.218])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2446cb0101esm22696205ad.46.2025.08.15.16.28.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 15 Aug 2025 16:28:35 -0700 (PDT)
Date: Fri, 15 Aug 2025 20:28:32 -0300
From: =?ISO-8859-1?Q?Eric_Gon=E7alves?= <ghatto404@gmail.com>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
CC: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_v1_2/2=5D_arm64=3A_dts=3A_qcom=3A_add_?=
 =?US-ASCII?Q?initial_support_for_Samsung_Galaxy_S20_FE?=
User-Agent: K-9 Mail for Android
In-Reply-To: <xmxo5uogkexiwq5zh2eza53pnl5jrqidd7an7bftjtq4wpaup5@mlekuufdbg5v>
References: <20250815151426.32023-1-ghatto404@gmail.com> <20250815151426.32023-3-ghatto404@gmail.com> <xmxo5uogkexiwq5zh2eza53pnl5jrqidd7an7bftjtq4wpaup5@mlekuufdbg5v>
Message-ID: <31CA09B3-E451-4EC1-8273-A1F09735D1FB@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable



On August 15, 2025 19:03:20 GMT-03:00, Dmitry Baryshkov <dmitry=2Ebaryshko=
v@oss=2Equalcomm=2Ecom> wrote:
>On Fri, Aug 15, 2025 at 03:14:26PM +0000, Eric Gon=C3=A7alves wrote:
>> Add new device support for the Samsung Galaxy S20 FE 4G/5G
>>  (SM-G980/SM-G981B) phone
>>=20
>> What works:
>> - SimpleFB
>> - Pstore/ramoops
>
>While the patch is correct, are there any obstacles in enabling more
>devices on the phone? I'd say, buttons, remoteprocs, PCI and USB
>peripherals should be low hanging fruits=2E If you can read pmic_array
>from debugfs/qcom_socinfo, then you should be able to identify PMICs and
>add corresponding regulators too=2E
>
>> Signed-off-by: Eric Gon=C3=A7alves <ghatto404@gmail=2Ecom>
>> ---
>>  arch/arm64/boot/dts/qcom/Makefile             |  1 +
>>  =2E=2E=2E/boot/dts/qcom/sm8250-samsung-r8q=2Edts      | 47 +++++++++++=
++++++++
>>  2 files changed, 48 insertions(+)
>>  create mode 100644 arch/arm64/boot/dts/qcom/sm8250-samsung-r8q=2Edts
>
Hello Dmitry,

Recently my device's battery stopped responding and I was not able to work=
 on the DT any further, so I decided to upstream what I already have so far=
=2E Thanks for the feedback, I'll include more features on future patches=
=2E

Best regards,
Eric

