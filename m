Return-Path: <linux-arm-msm+bounces-59324-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BF0BAC33FD
	for <lists+linux-arm-msm@lfdr.de>; Sun, 25 May 2025 12:52:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E5F99188632F
	for <lists+linux-arm-msm@lfdr.de>; Sun, 25 May 2025 10:52:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 211ED1EEA3C;
	Sun, 25 May 2025 10:51:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gGYCUPeC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4D281E5B64;
	Sun, 25 May 2025 10:51:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748170315; cv=none; b=FYQGaAKCPFTgvUOBSNfUxO5JSjVcKKs9RM38vVjnyqr83cNrGmfsjg60dVynDU3JbUxQBTayg7r10ZNI41HxlDElCy+54GGgNNHd/OHuxecnFr0WNeuXAFDRYXlPfV0+mtDEEQzfSHUiTzV81ye8DjsKiM/fpFrMTPeVmMov7+U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748170315; c=relaxed/simple;
	bh=BTN2MNtrfCfkupbqHYhUYAsOcmK/hFrk0TQchHuVOI4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=NhmNryksdGfgKKsnPdraAhEmv1kg8cbHKMpUdtl8+R9zMq36BhbGhXwlGR8oPwCFEStS8yMo1TCHssvsGyaqduReka8/JtUNm2ha9wqU2bt0XtAXP6oLn0TqYxPH3E+XralV/NX/jeJKnPG3Bu4zQmWUte36D9Kzzj2n0GRN6KA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gGYCUPeC; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-23449dde9ccso1288735ad.3;
        Sun, 25 May 2025 03:51:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748170313; x=1748775113; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Bo5qTdWekZc+pL4KCI6n58JxkT8Fq7p0AQIuMCPdbDg=;
        b=gGYCUPeCzBnToePkKU/qZkJi3Hj0PtKVQzy9nKLJJV7m1C5B1ZbwJsjboT3q0IJk9y
         uLLtCc13BGJkf8AFWRarHD7MT+YukX325xnHbArB8Krtdf0IDqDID0CC0TYdG1gWJbOn
         L1OGsLuIwuF0ThjRn6BZYi1xWN9S6HUEx2FB0nlA/aYsaQtlDdUM/BoEZOkBpAecTNWa
         RVgM783zViZ07sGH3pPpNDHbvZuA0a/v3BrgXHF8gvdx+518lZAIbhtdRjWmgsqqTRgu
         kLxTIq9apX0IMcCYxU+IMmwFjS6xKMYWuwW1FAlwLazkr1/Gz5qRLHIMAQx+6CtICQEZ
         jRVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748170313; x=1748775113;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Bo5qTdWekZc+pL4KCI6n58JxkT8Fq7p0AQIuMCPdbDg=;
        b=ZyWvtLOvvznkv8WnzZK6Qw5y4h12I4LkY0d49zr9eTXur5/+0AMeNBaeBXzxKQMK9S
         OFi0OvoVjwIvtKVXPpXHQ+LHB38HsrsZ1Wu3nMRuzQ2NuszRGu1dp6SfvfulY9WXFAPY
         vzlt5YTXujnkNcVzhBm4Ma1Kknp9vPbx/syoJnccmRt17iM5D5cs01KMuGURHrW37jj+
         UfpFVFaPVh61LKieIwRYyE6yJjR/V3HRq+hatMDZaVgOG4yt3ZVU0fodp/Lbip3zqorB
         KeSYKdVmRQZNtsL58RbUJ1dNS94m/k66CYkSO4yGyfU6AwoMnnvFT1FJqQR7/lIP+a74
         zxqg==
X-Forwarded-Encrypted: i=1; AJvYcCUYfwXi5cW/ikO7zEeTrUHHmU74gQSBwcwCLlT3rS7M/73TZlEEo7JnSTchTJBcR2d7IjFP72yg6NmH5JOH@vger.kernel.org, AJvYcCW4HrDp4eucV70d3HCpz9G/MyKLxNR9NZJXSeRf3WfabwNa8KjwP+kxqRMB2A2d6L/QfDoEBqLnPykzUHgCPw==@vger.kernel.org, AJvYcCWHGV5yDihEOz39jaskGyq3gQtCUYFeE78zfNE9lNZvE/8pOPMCxsAHTOpRkaJrFFxSIHXs5YfHEnAu@vger.kernel.org
X-Gm-Message-State: AOJu0YytYz4XfNtjb/pRyYNWQvwjkvKL5+YbttRZ3/3lwbNQ8MdXn11F
	IbOAKyNgMCTN4K7QU2JtAviccRbR+bEUB/fbo5tR++fPBKNJfcKt0sjp
X-Gm-Gg: ASbGnctfdbx1yTDgX7Q88iaadk6fPUMcMovp5xHI+WrMwe024hu9jTId1OUeuqptuD/
	gd2NnwQItFyTNvbQ+tASssImeSBga61EMIOtovf5yiyQAo9QoYJcr9nwpRQP2Uc8Ml99ETwmu85
	iAUO8cKfhGJLEtfTVDVMzLCm4hhCiE5zlnJIb4Ws3QEWh8gogL3v6CanlgXP8AroM/2M9WoAwME
	i/Y/GxyaOocVilH1vR833f2AmRjjIDEyjZCnpUMGr5qkJ7KKuRP6wsngKLHzTxJxtcJItpEVssh
	k9tY5F1qzU37R4Z2DNLw/8QsYgZcmWRmUSuFqPmy1qSr8kszSA==
X-Google-Smtp-Source: AGHT+IEMaKSDD4fczj1RIxfDGO3S/3u5mprTQSOr0sWZhxUeOFAsoyS1ZLloG4n7aaopnUVmt4Fl1A==
X-Received: by 2002:a17:902:e80e:b0:223:f408:c3f8 with SMTP id d9443c01a7336-23414f4b157mr73367815ad.14.1748170312889;
        Sun, 25 May 2025 03:51:52 -0700 (PDT)
Received: from nuvole.. ([144.202.86.13])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2340531be32sm30847255ad.28.2025.05.25.03.51.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 May 2025 03:51:52 -0700 (PDT)
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
Date: Sun, 25 May 2025 18:51:43 +0800
Message-ID: <20250525105144.1328104-1-mitltlatltl@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <53e1127d-77fb-4bb7-a125-18d7afc0d843@oss.qualcomm.com>
References: <53e1127d-77fb-4bb7-a125-18d7afc0d843@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On Thu, May 22, 2025 at 11:05 PM Konrad Dybcio <konrad.dybcio@oss.qualcomm.com> wrote:
> On 5/21/25 10:37 AM, Pengyu Luo wrote:
> > On Wed, May 21, 2025 at 5:54 AM Konrad Dybcio <konrad.dybcio@oss.qualcomm.com> wrote:
> >> On 5/20/25 6:42 PM, Pengyu Luo wrote:
> >>> The OnePlus Pad Pro is an Android tablet based on the Qualcomm SM8650
> >>> platform. Its device codename is "caihong". This patch adds an initial
> >>> devicetree for basic functionality.
>
> [...]
>
> >>> +&i2c2 {
> >>> +     status = "okay";
> >>> +
> >>> +     /* secondary kinetic,ktz8866@11 */
> >>
> >> You can describe it, the driver sets some nonzero default brightness
> >>
> >
> > But the backlight framework won't index them, which causes sysfs
> > collision when the second instance is registering.
>
> Have you talked to the backlight maintainers? This shouldn't be too
> complex to figure out

Last time I tried to touch ktz8866 source, the reviewer advised me to
add an backlight API to register the secondary devie. Since I am still
working on the other parts when I am free, it remains unresolved. Now
that you reminded me, then I tried to do it.

https://lore.kernel.org/linux-fbdev/20250525104022.1326997-1-mitltlatltl@gmail.com/

Best wishes,
Pengyu

