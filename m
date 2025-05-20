Return-Path: <linux-arm-msm+bounces-58764-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E54A2ABE20F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 May 2025 19:45:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5AA318C6062
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 May 2025 17:45:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B277F25C6FA;
	Tue, 20 May 2025 17:45:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cMRMIbQQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com [209.85.219.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB12025A2D9
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 May 2025 17:45:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747763111; cv=none; b=mxk9oFSjJxWhxFc7x2nxrMXiWGaDjbaBFvrkaFH26Yab9jwCslv3rUpbVIqxXNZB94ZMTJzslmkG5wPuIyX1BPT6YQs2kPi2kNPaauSFcp5erfO3RMfXPSCbCCA9A8H9Hw6jNbB72q/DNJw4w0U0XFfjsduTkmBuznXOYM0/0PE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747763111; c=relaxed/simple;
	bh=T92V8eX3Vz4beQQo+V6nyo4FyO6B+nwmyPWJT1oO+Pk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LFPxC7PbWBYNDq9cXtx9WLLdowJsZESBuByN97CxKatFTfMin+U/1DE+BLmXF2EYP/drBO2dLXKeYgjSLS8EQSD+Rsh1rBC/FROPc/bgfZ33IwFyHVPcC02dxsGRBSJhksgQL6vl0hphAP6Wielj0zOOeCkQo6Q9Gmbezynx0CU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cMRMIbQQ; arc=none smtp.client-ip=209.85.219.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f42.google.com with SMTP id 6a1803df08f44-6f8a694d622so11895936d6.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 20 May 2025 10:45:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747763108; x=1748367908; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=k/0lqXBgLimY0A+nlogIvRC91H4XJPyHb2uLAtGHc+4=;
        b=cMRMIbQQ9q2f/RpAnvFt/uCRCoDJ+MAlOPjMXBiOVpM6PSdcPy+PTgemSDFgVWsZsy
         IEX/+oCclFIApABAdo05qVrOP/xCuYl16fA3awcDNgyGFu1Rl92Kuh7U9Tvv61+pIXB/
         e2jqt8Jf+xoVLh7zsEnriJaaP1GDC40l28a7IsYFKyQCnC6nMb318BvtcMQYRhadZuaN
         h7ilJIyvrlfGQqUFWt2WF8VvUpfZOvTr+6N3JiekueMP2C59ErTNZC+mmrkc9zHSTnnn
         DwRU+Sfqs6hxVbw+gbYg/zWFXS0XnCzyoS9XvkNsvE5BfD7AHg4vm8q1igjcPtprlhGh
         Gp+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747763108; x=1748367908;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=k/0lqXBgLimY0A+nlogIvRC91H4XJPyHb2uLAtGHc+4=;
        b=CtAs4QaPVVS5+O9kfW9LhFRcvsZE1Sd2/Aqa+hnaeclaut0XIbtpysp8QXkUxnjQbk
         4dDX/gZcStx/vg59rwVTdBiUzqIpjd5KiEchM6CU0afQ6Ia4BYFsK9kVGPbkzq+qOLFX
         oSI9NyiSLeId28dXT84jXjr2Xbea0+ZRa0Kg+KtZ0gxjw2DCChSoy/mzPNINuRyQfPFM
         ayXRzUOZOZeSMYxhLpysj5EAV+dA2mkSgww6wdxKQ9JB0jiX3VEYXXBltFjeOW/xIO+S
         dtAcHZL5L6qJWbuovnAVQJqpiWQbk6/kdKobAm2xy4qNQ0WB41ACML58RAe9itnNd2As
         5vAA==
X-Forwarded-Encrypted: i=1; AJvYcCWlG5xhysJs963z1DuEmwRv+cv8FEgKcXBqiWasubGKRz5HCAMpQvaXFDFT2qpMFKU5poX+8Dcb3yE1oRYe@vger.kernel.org
X-Gm-Message-State: AOJu0Yw3r7pVovtGGfF7K6OrnAmjdFFaFwxkAHoTFXPezTdDMFx+TUky
	2tU4jkCEn1Kq+eRyNIU2+95ubSn7+cR+S9RAXfNWeeZ5z0QZgYJ/A2vzSjogakKE
X-Gm-Gg: ASbGncu3JsURFNbJQcBbOArMmy4JNZF90yuS7J3HvOnPmiw5hmMEWVYb9YR1vXIgNr6
	Swti2Os1WALwA18LLMor9/ARMok4M0ofnTLNpKfp7Dz/YWfe6RgYSQdNnVwbCKdQeRcLmPm7gNH
	KjnKT9gxRz5zK4FWEBYmGHIpQumq351SGuODv5gn3NhSjr2Ik9sGxfsDHKmc3y+sBODjd4JOzqa
	CeeCQ5ACY7ngL22jqFaxbLOqPHNvdVqYuVQGJ8omUS7y9sOpUndrM2z1viV5yBsR+uu4gDQGMqC
	k6rp76KboS+yLvYfiO3FJP/DNPfywRZDClzsW8SV6JgCM/QvzNqY2wc0Y2L+MeX2sAdUU6itZ7w
	oIsbKrzkdU0D/1qU6uLY=
X-Google-Smtp-Source: AGHT+IFCdFtXD0ROOtYtBP0OI+hMuOVWsDmLO4ZEV9rDAumTtHnKdWFKDekI52EYfVxWEILyc/wwTA==
X-Received: by 2002:ad4:5f8e:0:b0:6f5:3c5e:27fc with SMTP id 6a1803df08f44-6f8b089442dmr94348406d6.4.1747763108580;
        Tue, 20 May 2025 10:45:08 -0700 (PDT)
Received: from [192.168.124.1] (syn-067-243-142-039.res.spectrum.com. [67.243.142.39])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6f8b096ddb4sm74126586d6.78.2025.05.20.10.45.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 May 2025 10:45:08 -0700 (PDT)
From: Connor Abbott <cwabbott0@gmail.com>
Date: Tue, 20 May 2025 13:44:56 -0400
Subject: [PATCH v7 7/7] iommu/smmu-arm-qcom: Delete resume_translation()
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250520-msm-gpu-fault-fixes-next-v7-7-96cd1cc9ae05@gmail.com>
References: <20250520-msm-gpu-fault-fixes-next-v7-0-96cd1cc9ae05@gmail.com>
In-Reply-To: <20250520-msm-gpu-fault-fixes-next-v7-0-96cd1cc9ae05@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1747763098; l=1671;
 i=cwabbott0@gmail.com; s=20240426; h=from:subject:message-id;
 bh=T92V8eX3Vz4beQQo+V6nyo4FyO6B+nwmyPWJT1oO+Pk=;
 b=vtKS5WA2jt4fvTdysRQedDxOh8WN7S66xhFGBrNMjcLIhRmubh69gcLR/NbqQtWPPrry50qfq
 lDnb+3B5orhDydZLJby6AbGaTMBEjlxIm7FW0NgjDlqGLt+O1uUASXR
X-Developer-Key: i=cwabbott0@gmail.com; a=ed25519;
 pk=dkpOeRSXLzVgqhy0Idr3nsBr4ranyERLMnoAgR4cHmY=

Unused since "drm/msm: Delete resume_translation()".

Signed-off-by: Connor Abbott <cwabbott0@gmail.com>
---
 include/linux/adreno-smmu-priv.h | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/include/linux/adreno-smmu-priv.h b/include/linux/adreno-smmu-priv.h
index d83c9175828f792f1f43bcc8056102a43d822c96..4106b6b372117119bbebe67896de18fc6286fb44 100644
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
  * @set_prr_bit:   [optional] Configure the GPU's Partially Resident
  *                 Region (PRR) bit in the ACTLR register.
@@ -71,7 +70,6 @@ struct adreno_smmu_priv {
     int (*set_ttbr0_cfg)(const void *cookie, const struct io_pgtable_cfg *cfg);
     void (*get_fault_info)(const void *cookie, struct adreno_smmu_fault_info *info);
     void (*set_stall)(const void *cookie, bool enabled);
-    void (*resume_translation)(const void *cookie, bool terminate);
     void (*set_prr_bit)(const void *cookie, bool set);
     void (*set_prr_addr)(const void *cookie, phys_addr_t page_addr);
 };

-- 
2.47.1


