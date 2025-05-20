Return-Path: <linux-arm-msm+bounces-58773-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 11DC8ABE368
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 May 2025 21:09:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DB7F7161A50
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 May 2025 19:09:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 34115280008;
	Tue, 20 May 2025 19:09:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VF78do8q"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D93C2701A0
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 May 2025 19:09:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747768143; cv=none; b=ufK7OxWcOWoVcmGyFavEXEu/n+hiQT93q3YUhtrPkGFs6NOzZBFjbXUovHeuyFpBuKk8vWyVt9A7r14VB8lWRGPb/nhzdWzQCrn27mPiUzwib694XwrE/cX4sN/ZfohE/3WrCHambFVfxstGo1VlidLcLmYSTP43ugl4WOVAeeY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747768143; c=relaxed/simple;
	bh=ZBvYKn5K11+lNsz4zT1zMYa5IeR/X4du0GnqkshS5cY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XWkhhQX79QtOs16h0rRe9XhXi8LUUZCtr43wLRwlkQDIPpx3HteqkWI8oAH9L4GFLvVKvN3znL5AimUdvvgCdnCj5yToo/wKs5ybO/L5FYBVm/mJWQjtGA1S0Vy7teZUtyqbTZeDEywK60UQ2IFV3GgysTz3cCVVRQPEfDkZmP8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VF78do8q; arc=none smtp.client-ip=209.85.160.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f180.google.com with SMTP id d75a77b69052e-47745b4b9aaso11537141cf.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 20 May 2025 12:09:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747768140; x=1748372940; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lvaowTnmN7oLC96D2HQ8Iw/m6LXgQG1UkyHMoTmfSNI=;
        b=VF78do8qSEfEPP2ASD+3uEpJNGt3vD7doXcjFAf8GAdg8d0P+tslmoX5AuYGT8x2W/
         U2eYRHrW6gP/UguTCJUCpB/EZLKzVT3lPDJwC8NGfrUXFW/zscmusCshfaXvMQEf61ir
         dbkoiJQSYXqNW2dMP3IHLv0nlzmp41oU5qHi8EQOulaC8Dj6xMD9OdNSzZDwoaU2iQH5
         gtNGT117wCIYNKya0GlE/rEVk0K7JYE4+Mlp/uUJ8YEzL3zOY7psQbesnhdBjIevh1tM
         LXhZv5hW0T/PgThRF4kDu3cHICuIZ1oDxiLGVJKlg5mYz/Qw3bAt50xJ53CSZPb2Tzy8
         bvoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747768140; x=1748372940;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lvaowTnmN7oLC96D2HQ8Iw/m6LXgQG1UkyHMoTmfSNI=;
        b=KdWM3BmQAjBEu8avsWbfZyWNvPum5tS802atB1Ymza9nwSEc0AQTUEuSuCnIVH5JKi
         BYZ9XDkgAVpKxDo6ZQYAy2YuvOT6qzBWKVNVGQK7dSL0k+gsaNtcb2m/QvNNRfxbqCEw
         wA+nU4+sQwEpo2DcqF8zG9NprwyzT+sYHzkA3dj4Fxps+CiJQeiBwBRycyQdsIYjtmxq
         ACiVpJ8xt1dyu9XsmvydDBgmmBzNTt23fJic/aEx2P1OLdAlg8oCJpV/g2saqjk0mk/q
         KaweUgMQ0bZSlO6EL2V81P2mbiNLg3E/iXjb3IvCsWt06cbAQYrRVixetYsbot/+R7Tp
         vFIA==
X-Forwarded-Encrypted: i=1; AJvYcCVLm6T9otU1LfCcaJRfgProHqfCCIaQQ0ZX3etXmhagR8q3ALs9OKTLScnj5G2OnoxIqFgXKtKxYHp+zHXg@vger.kernel.org
X-Gm-Message-State: AOJu0YwH+Hh69VHgyOF8I/sOa9dMkw8tge1MVlxtgkxVsmj3iF5gLNwH
	uTRV2JQ590xXkXoqn/lyB4Sfsgk+kToIwbGznOCDXjHm68R6RFA8OQua
X-Gm-Gg: ASbGncthUoC8SKhmbP949SSsAJvmy+BbwJDyml0znLGvxmoDcwaeA+7egd7X8fomvzO
	N5lShXmkCcItWHI3/9uiLVmiOfwkzuifMPuK0wIjCnmtv/piwOVk8dSQI5jaui1C3yGaYvUzkas
	lzC1NXyI2mwsE1JuRFp6ksDKqB6fXKlER7ZAj/Fh79442TuYp7M1YKDWYJfLI0G5y+jPQeJXTKP
	jkpUjzyPcCnp9kDCZyytKxhs2/KYa5zGEWFrnwOv9kFS2LaoPpfgYT2bN/Gj7J3OR1c86IAchui
	V+zfQNko560049ZbCQ9dJYdCj+uwbFui0omtGuFxmVBztiHw3LXIK2/sSu5emN0i0Q2kIXOYmEN
	QRRZCW9m+tyGrxt05uNbZySKiYhVsDg==
X-Google-Smtp-Source: AGHT+IHrhoVKr8ZuMW3LLmVacxqlRwznTBlrPPx7593+XpI6zjzFhRF7/0TUgT772pugTudEsg+iFQ==
X-Received: by 2002:a05:622a:22a4:b0:494:b869:ac06 with SMTP id d75a77b69052e-494b869b287mr85977441cf.6.1747768140371;
        Tue, 20 May 2025 12:09:00 -0700 (PDT)
Received: from [192.168.124.1] (syn-067-243-142-039.res.spectrum.com. [67.243.142.39])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-494ae445b99sm76554051cf.48.2025.05.20.12.08.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 May 2025 12:08:59 -0700 (PDT)
From: Connor Abbott <cwabbott0@gmail.com>
Date: Tue, 20 May 2025 15:08:54 -0400
Subject: [PATCH v8 1/7] iommu/arm-smmu-qcom: Enable threaded IRQ for Adreno
 SMMUv2/MMU500
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250520-msm-gpu-fault-fixes-next-v8-1-fce6ee218787@gmail.com>
References: <20250520-msm-gpu-fault-fixes-next-v8-0-fce6ee218787@gmail.com>
In-Reply-To: <20250520-msm-gpu-fault-fixes-next-v8-0-fce6ee218787@gmail.com>
To: Rob Clark <robdclark@gmail.com>, Will Deacon <will@kernel.org>, 
 Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>, 
 Sean Paul <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Marijn Suijten <marijn.suijten@somainline.org>
Cc: iommu@lists.linux.dev, linux-arm-msm@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, freedreno@lists.freedesktop.org, 
 Connor Abbott <cwabbott0@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1747768138; l=2173;
 i=cwabbott0@gmail.com; s=20240426; h=from:subject:message-id;
 bh=ZBvYKn5K11+lNsz4zT1zMYa5IeR/X4du0GnqkshS5cY=;
 b=ViPeijvXoIUFv2QAC6sXPESomfVyzJ6s9UWCJTU2K3EndiqfiDH0VcJPIhmS25TOOhh6IVZsY
 tWgr3r9EDqOCOO+X64zLIEayNFmirrauIr4/BJjbDt38yQUW2T81wXA
X-Developer-Key: i=cwabbott0@gmail.com; a=ed25519;
 pk=dkpOeRSXLzVgqhy0Idr3nsBr4ranyERLMnoAgR4cHmY=

The recommended flow for stall-on-fault in SMMUv2 is the following:

1. Resolve the fault.
2. Write to FSR to clear the fault bits.
3. Write RESUME to retry or fail the transaction.

MMU500 is designed with this sequence in mind. For example,
experimentally we have seen on MMU500 that writing RESUME does not clear
FSR.SS unless the original fault is cleared in FSR, so 2 must come
before 3. FSR.SS is allowed to signal a fault (and does on MMU500) so
that if we try to do 2 -> 1 -> 3 (while exiting from the fault handler
after 2) we can get duplicate faults without hacks to disable
interrupts.

However, resolving the fault typically requires lengthy operations that
can stall, like bringing in pages from disk. The only current user,
drm/msm, dumps GPU state before failing the transaction which indeed can
stall. Therefore, from now on we will require implementations that want
to use stall-on-fault to also enable threaded IRQs. Do that with the
Adreno MMU implementations.

Signed-off-by: Connor Abbott <cwabbott0@gmail.com>
---
 drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
index 59d02687280e8d37b5e944619fcfe4ebd1bd6926..4d3b99babd3584ec971bef30cd533c35904fe7f5 100644
--- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
+++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
@@ -585,6 +585,7 @@ static const struct arm_smmu_impl qcom_adreno_smmu_v2_impl = {
 	.alloc_context_bank = qcom_adreno_smmu_alloc_context_bank,
 	.write_sctlr = qcom_adreno_smmu_write_sctlr,
 	.tlb_sync = qcom_smmu_tlb_sync,
+	.context_fault_needs_threaded_irq = true,
 };
 
 static const struct arm_smmu_impl qcom_adreno_smmu_500_impl = {
@@ -594,6 +595,7 @@ static const struct arm_smmu_impl qcom_adreno_smmu_500_impl = {
 	.alloc_context_bank = qcom_adreno_smmu_alloc_context_bank,
 	.write_sctlr = qcom_adreno_smmu_write_sctlr,
 	.tlb_sync = qcom_smmu_tlb_sync,
+	.context_fault_needs_threaded_irq = true,
 };
 
 static struct arm_smmu_device *qcom_smmu_create(struct arm_smmu_device *smmu,

-- 
2.47.1


