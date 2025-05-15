Return-Path: <linux-arm-msm+bounces-58140-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 24D61AB906F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 May 2025 22:00:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7992D3AD947
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 May 2025 20:00:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2F1CD29B765;
	Thu, 15 May 2025 19:59:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="is+b4yhO"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com [209.85.222.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83F5C29B773
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 May 2025 19:59:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747339188; cv=none; b=jLehTamGOUgR/5Py5YLOkaj1MKNtR54jWoLZ5qI1yB9knKpNRraZsdFgNOqS9RUIhdqDFJh3t/5mIFVMPsQGgJixpgaz+5G43jgm+fEJxzYseaKMg2Q9wZu/XTbNVeHxaRoy5H/mL2h4zfBhB7tAeLR4MjPHDturaqyXwpi+kDg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747339188; c=relaxed/simple;
	bh=aRsZmjoGo/cSFHXwutiwXX9pdz9qjGh+q+3C5UDfQvg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=sQ/b46+8PR+BoHiZHFeJxTRQNdDu80FXSMULGPeToMje/OCc8tBWfbtC1K0pWaU5KtopG1bFg/is42NrmXBS3uoQWB4PQAN/dIF/rkE5s0MDJq83lQn+ilJ95uASiMzXsA0WAdEU8m9/JGHKiuwNCf+g0U9jXbs8PGSByKqqhiw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=is+b4yhO; arc=none smtp.client-ip=209.85.222.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f175.google.com with SMTP id af79cd13be357-7c921ec37e5so10624885a.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 15 May 2025 12:59:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747339185; x=1747943985; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=W9GO00zbxnFbKyoYKR1MGg1EYQGaCXyOc2lNqTvdH6I=;
        b=is+b4yhOqO4XccVREl7VkmDsuowbjyaVQcdnNWz+RIYdIHZ4zjzzFOPCcpqiw2C1YU
         W3sVEQQTRJ3Bdc4T0DSJP16f9RYuC3tVzAz4a0Dnvj6t2N8Vlbv+lKNZTtS9Z1uIKbx2
         40BJSYtMc8PNpcaAhyMrG1gzUEKKl0BpQk/21iRRYtEX2NZNg04TJRiQvmKZRbJ0E3WE
         4ZxOYeeMvw5YZqiIVAYQG4Alq+6aR7ms62h3cMY+V83kehbMV3a+bhqMBno00L6CQ1Wf
         1SlhGPURFVWo9MWh3i2yOPGH9sQ0HwXh1HzW/sjlg3dBziYNNgkzXlUuZmko0EGPWB6C
         zySQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747339185; x=1747943985;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=W9GO00zbxnFbKyoYKR1MGg1EYQGaCXyOc2lNqTvdH6I=;
        b=J0lKoueKvx3bsP1JJAp7zSRH16fiT7lXsZiSzv6yJSy8o7f/ajoR0UvLjNYhxm0LTG
         9gdXzNnCo/dhnc2VoLHHSqtP4UTriVP2rnwz7CHhS7oZLFXZvok3Kx7z0bZJOrjSPkKS
         3M/jNIBEhq7E6kGoOwNTPH+bO+GZum6A1avxCnNNoFJnItxcef7hJzirkk3fkHysco/C
         WvQMdMOYB/x1ljfsKbOuCoYi+HMiY5JQMpmev/5CzIWaznzkldLpaCHLt6l85pRipgmn
         9ESHZ2zvjl+hiAJn2CS9EFapKHAmH7tfLw4LByH+8Q9GGx0QCIb0VwCKS0W1vFTLgz3C
         /Epg==
X-Forwarded-Encrypted: i=1; AJvYcCW2OThskAKW5ZxcJTcb7YT/hcqX3POF4QT032AiE4CYyVC40UjJounIPBTxajC0o9lblpA46GcoTW6suIYl@vger.kernel.org
X-Gm-Message-State: AOJu0Yz5hoeikyO5R26xs61/EmF6aTITJlUFIh/t9he7g87fIZCHbhq8
	sW7FF+St9PM8c1HeC8BjymtKmjr3t8s4XT/t2ZzgFbm+DKtBFOiCVvzL
X-Gm-Gg: ASbGncvrGNJtlUWvXGad49m2kC7AitLRwUoMuFYDOo9Sd3dCXWjT78KK1vtK/7khJma
	O2mmsEUDYsg/Iw+I+frkJTgG5FbN4dsZqNCsiOoSoVb9KZ35iTd68Re9KJwUNu2NbFWfj//4LNa
	H5PlD0tFhlceplwWMYMvP+BTBz1pO6qT0rJqJm+a/blxz3AQvGkYZJEnRKWYRgsQomz0npMM/78
	32dXbFV9c5i8gjc6kwJZODwWoDRvrb3lEyPgana3JKh1xKMuZB4yq57CW4CMoSrNpVkhgnrdgDf
	31VtvSm4KnP/uq/xKbm2Z3JgBEe8Uh5kdt7QPOdwQ4VLwLM7y/JKJDjVgpGETsiALPyyFA0BwX5
	SJtrakoE1cSI5D9B8hlU=
X-Google-Smtp-Source: AGHT+IG6CqnqToKilBZg3d95WbqLz8tctrzr994PFqGigAXmx649QoHO+YFYQoHsNTC0rhdZ3luaSQ==
X-Received: by 2002:a05:620a:2803:b0:7c3:d1b9:e667 with SMTP id af79cd13be357-7cd4671faaemr58332985a.5.1747339185205;
        Thu, 15 May 2025 12:59:45 -0700 (PDT)
Received: from [192.168.124.1] (syn-067-243-142-039.res.spectrum.com. [67.243.142.39])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-494ae4fd80bsm1957231cf.56.2025.05.15.12.59.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 May 2025 12:59:44 -0700 (PDT)
From: Connor Abbott <cwabbott0@gmail.com>
Date: Thu, 15 May 2025 15:58:49 -0400
Subject: [PATCH v6 7/7] iommu/smmu-arm-qcom: Delete resume_translation()
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250515-msm-gpu-fault-fixes-next-v6-7-4fe2a583a878@gmail.com>
References: <20250515-msm-gpu-fault-fixes-next-v6-0-4fe2a583a878@gmail.com>
In-Reply-To: <20250515-msm-gpu-fault-fixes-next-v6-0-4fe2a583a878@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1747339176; l=1531;
 i=cwabbott0@gmail.com; s=20240426; h=from:subject:message-id;
 bh=aRsZmjoGo/cSFHXwutiwXX9pdz9qjGh+q+3C5UDfQvg=;
 b=+pdVVw82/z0eIgzgC6o+AzTuVq7FlJ1dneFaBpTdAtknFxz/eSWyUdXaQGcHd4MoAd4oA8kti
 e6nMCOZKmtuBM8tRS1ISKqELZJCTLF3R76A1EnTAP8F/VIbPZJpnnUk
X-Developer-Key: i=cwabbott0@gmail.com; a=ed25519;
 pk=dkpOeRSXLzVgqhy0Idr3nsBr4ranyERLMnoAgR4cHmY=

Unused since "drm/msm: Delete resume_translation()".

Signed-off-by: Connor Abbott <cwabbott0@gmail.com>
---
 include/linux/adreno-smmu-priv.h | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/include/linux/adreno-smmu-priv.h b/include/linux/adreno-smmu-priv.h
index 8ed94fb39e6ec6a3d8e6fabe61ff142682f1764c..80bb36e09f07901fd73c522ec077b0b3211adc50 100644
--- a/include/linux/adreno-smmu-priv.h
+++ b/include/linux/adreno-smmu-priv.h
@@ -46,9 +46,8 @@ struct adreno_smmu_fault_info {
  * @get_fault_info: Called by the GPU fault handler to get information about
  *                  the fault
  * @set_stall:     Configure whether stall on fault (CFCFG) is enabled. If
- *                 stalling on fault is enabled, the GPU driver must call
- *                 resume_translation()
- * @resume_translation: Resume translation after a fault
+ *                 stalling on fault is enabled, the GPU driver should return
+ *                 -EAGAIN from the fault handler if retrying is required.
  *
  *
  * The GPU driver (drm/msm) and adreno-smmu work together for controlling
@@ -66,7 +65,6 @@ struct adreno_smmu_priv {
     int (*set_ttbr0_cfg)(const void *cookie, const struct io_pgtable_cfg *cfg);
     void (*get_fault_info)(const void *cookie, struct adreno_smmu_fault_info *info);
     void (*set_stall)(const void *cookie, bool enabled);
-    void (*resume_translation)(const void *cookie, bool terminate);
 };
 
 #endif /* __ADRENO_SMMU_PRIV_H */

-- 
2.47.1


