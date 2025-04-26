Return-Path: <linux-arm-msm+bounces-55802-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C792A9D948
	for <lists+linux-arm-msm@lfdr.de>; Sat, 26 Apr 2025 10:16:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A68D43B90F0
	for <lists+linux-arm-msm@lfdr.de>; Sat, 26 Apr 2025 08:16:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AB59C21D3E2;
	Sat, 26 Apr 2025 08:16:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EKxNffB2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 288847A13A;
	Sat, 26 Apr 2025 08:16:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745655396; cv=none; b=ZGJhjQqYqn0ciLgsEFSamDXDeVSHTy47rMXtp/Y1Wtx9sXh8HdE258T0deQxUk7BhmsjZ91cDn4gk99RvYWb91uO+65vnqQGVSusCdAL7rwatk0B3OfH3Zln5wwmgNzaDot2aGfbRgQOJlb2FHhH7SNjm/L1UqrRbwin3bNEE40=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745655396; c=relaxed/simple;
	bh=f5nFF9hrf8k+mrJsshn3YqKT1TsxR5hPPisEV2OefvY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=jAfvkzidhxLYmWcp7dbkaEFHceFUSnEpcgP6aUZi1NMS8rpKDNUbOBaJGco7Jxry1S6o/wWZLOc2DFZ5xyvDfqnuNvXXrUY+v+40iujB8yMFjqgleZgtnWAcouZZksZEqe2wVnETsV1hHMIGuMP64vZCrc4UN6UHFnQUNRIs3VU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EKxNffB2; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-22d95f0dda4so48227015ad.2;
        Sat, 26 Apr 2025 01:16:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745655394; x=1746260194; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=f5nFF9hrf8k+mrJsshn3YqKT1TsxR5hPPisEV2OefvY=;
        b=EKxNffB2kmw7X3O4tbt/WQxN0/bBYWR+9ySAASb03QPl/KWbvIwt+9YrH9Tlzqn5JP
         ikR4r5KB6liNRX/H/5oqc0raK6GZjNKrSTW6+6ZtvbW/aozg6SpF6dz//LxWEEhjM7lb
         sb38ikCCr4RYmaK6PVRtvKaq1GnsT4ty/ig32oHw4xv02nYJ7u3aznibMVpShOyxAaqi
         v4w4DSwHqsiXGkbOKCqqRzv6TvxAMD/UhUd94iETFl7Xabit0PbSOyrAm3nPgj6EbYcA
         oAaAyd/30Gz5m6BOY2/AaFFrlUTxLgy+FHwQD3oQHH3Ad93C2NwbZLGQm0uwd3jDrUEF
         K8kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745655394; x=1746260194;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=f5nFF9hrf8k+mrJsshn3YqKT1TsxR5hPPisEV2OefvY=;
        b=WL0mAk5XZCD7Ni6GQOywFhjL0g/zYqnlPCOiMAVCgdtE4OJC2X1VBwy5Un4z+5eijf
         EWOrxjLdbBN999Svq1+5v/UdPY7ylNmAOYBV+jfI7oxHEiJrGMNTli+g9e2mp3ysQMt0
         xbqj+XUJia4LccuTilyiV40KltRjm6x4AR89KFGC+bDqPV6qgs2W34tCnL33s4BliCSr
         sqz5P5pc3NXtQGr1q6oMfrPNnDs3YtIK/TvmQX3aGRt7crlqOnakZTNL+hGjsfaK5AA+
         eKNrsLSkJRqg309xYfgLwl6eKsFFCfReCfY9lZdVcJyDIdH3f2Mi109CtoDd1N3BgCHh
         Ye5A==
X-Forwarded-Encrypted: i=1; AJvYcCVKH6jmlq89Uh2+HPEPN2w9BPw46zW1/cEHjM+O1ms2eluxpAQjIl7IIjOSDwJzVQ7ESCtH1BVIER/CmfZF@vger.kernel.org, AJvYcCW9BHL+8f1ew7FIdJaNrU0DoK0QKN27Q8EicOeJj3i5EHJLXSPDqms/p3M8qrjAQ5nC/D6OlGi8ZomgtQByTg==@vger.kernel.org, AJvYcCXf96T4KjIiA0q1I5AkE49OiW3/Ig1fy6suhlf82VJJ1Xb3IMrF0bo68rjTYHSla4Ut95aMls0XThO7@vger.kernel.org
X-Gm-Message-State: AOJu0YxX/oAfTVPg/gUqt08Uj/pZluL4/YNVjeQZutvSkWV7qnE4/+hb
	PS+KgyrEdhtuPvKgvTY0UckTCcVcCzOLvsm6QMf8RAvLEKVyJRczUUhBDw==
X-Gm-Gg: ASbGncvBTPUV47500yPXMTIeMkYXESYAMQ7kKGoQmPTgrbOirGYYU1Mgr9xFmCzL9MM
	+9SI/oUzYvs17nvWcmBqsN/kPd9n4dCt/qNSPECVyrXVVFRUfaA8cAx/qTMKau29UTl7+jdQojl
	vO8muObwDSFAHEvxgYNtgUTqVH8JY/mG68l3Aij1hO3wS714rzBO9ANflCb+44dAV00wxjypzJl
	lkKJlwwD4xzq+PXO1tjMhqh4ODKpacLyMkHGEQEpUfpzqSlA0Y/lQ8VsfSrkU+XcHdsraiKMmm5
	HkuYpTasmXzc07NU/LRdlR9VYWaDI4iYZx39nTM=
X-Google-Smtp-Source: AGHT+IH2uRpVPaRuKcj/Dnooeg5tCZHg5INKprYzVhvYC8u33M/5h6/1Yrvk8VqXDWgVX0OSW7Ou1w==
X-Received: by 2002:a17:903:41c8:b0:224:76f:9e44 with SMTP id d9443c01a7336-22dbf4c84e4mr63259185ad.8.1745655394358;
        Sat, 26 Apr 2025 01:16:34 -0700 (PDT)
Received: from nuvole.. ([144.202.86.13])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22db5219c47sm44906405ad.240.2025.04.26.01.16.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Apr 2025 01:16:33 -0700 (PDT)
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
Date: Sat, 26 Apr 2025 16:14:23 +0800
Message-ID: <20250426081424.422590-1-mitltlatltl@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <q6zqfk3l2khp3tkodxd4pzhufiesyjcypl66zoqzslolwoveyo@ltrw2iulrkqs>
References: <q6zqfk3l2khp3tkodxd4pzhufiesyjcypl66zoqzslolwoveyo@ltrw2iulrkqs>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On Sat, Apr 26, 2025 at 3:41 AM Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com> wrote:
> On Wed, Apr 16, 2025 at 08:02:01PM +0800, Pengyu Luo wrote:
> > In downstream tree, many registers need to be overridden, it varies
> > from devices and platforms, with these registers getting more, adding
> > a handler for this is helpful.
>
> It should be noted that previously all values were applied during _init
> phase, before checking the status etc. Now the overrides are programmed
> from the set_mode. Should you still program sane defaults at the init
> stage too?
>

I think programming in set_mode is ok. When we init(dwc3_core_init), we
set_mode(dwc3_core_init_mode) later, please check
https://elixir.bootlin.com/linux/v6.14.3/source/drivers/usb/dwc3/core.c#L2287

Actually, in the downstream, all the things are done in init, it
overrides first, then masked write the deaults, finally it set_mode,
you can check here
https://github.com/OnePlusOSS/android_kernel_oneplus_sm8650/blob/oneplus/sm8650_v_15.0.0_pad_pro/drivers/usb/repeater/repeater-qti-pmic-eusb2.c#L356

> BTW, is there a real need to override those for the platform you are
> working on? Could you please provide some details, maybe in the cover
> letter.

I am not quite sure, recently, I expirenced mode switching failure,
when I `echo device > /sys/kernel/debug/usb/a600000.usb/mode`, Ethernet
Gadget wouldn't work again, my desktop can't connect to it.

BTW, as you can see in line 356, it is most likely that overrides
related to charging feature. I have not ported charging yet, but adding
more overrides seems harmless, and if overriding, distinguishing which
mode seems necessary, even if some devices use the same sequence. So I
sent the patch.

Best wishes,
Pengyu

