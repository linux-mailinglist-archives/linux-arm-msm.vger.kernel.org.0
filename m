Return-Path: <linux-arm-msm+bounces-58779-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 358FCABE36A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 May 2025 21:09:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 95FCF3A5EDE
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 May 2025 19:09:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9343927FD79;
	Tue, 20 May 2025 19:09:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KaCkP+iV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com [209.85.219.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D18A428137F
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 May 2025 19:09:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747768151; cv=none; b=llmvkHmUuwZZt7aohbAI2jbqVDGBhlkSoU8JIc1naXaYwW07q7+5c5QeeXnwP1VfsPQzNzofvV1fzggUUP7JYGVnK8RBQF6RgglFWF1PISpjWMva5JuM212lC7QdRnWgd+7T1QzsYdCuNwQF2UQD1aAdNdCRJmhC+OQ9byncwfM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747768151; c=relaxed/simple;
	bh=T92V8eX3Vz4beQQo+V6nyo4FyO6B+nwmyPWJT1oO+Pk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=stOyKkiX+Pq2B91PWFwl11TUaoEFSqeiK4BOoPM52jzbomcAMhU25j8EUJY01X1k+hUEIpvE7gz2wUwJYzHXQdRv4SkAOZi1fbnHdh8hRIdzkomeXMqQ9NFBppXURCaSWohuJ+QhnZehpYfxc/6gm2rr5myntyfhVc/0nIxv2hQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KaCkP+iV; arc=none smtp.client-ip=209.85.219.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f51.google.com with SMTP id 6a1803df08f44-6eeceb05894so8083856d6.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 20 May 2025 12:09:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747768149; x=1748372949; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=k/0lqXBgLimY0A+nlogIvRC91H4XJPyHb2uLAtGHc+4=;
        b=KaCkP+iVUH3vnC3EnbId1PTIzQailqTd+DO2fV8MPiO16MMYCbtaInTHTJClZMnrnc
         rILiaO/VYgLKCXy0oVJHAIX4gcfa6RmBlKTVlVt1+8X7aJtu9M/il3FWTLD7khmXTOZP
         yK9cTnUMKChs/xVA3vDihW8ElOoB2J9caCcTYqpGjOW6STWsPGnpmwcW/feRHqmSryqD
         2u5FuDvXU9QsUoVMnYdVyS7kV+B6HDIx/Jr4xAxXMPpmdvb3URfn/c+jEA0ZcRGjP/eN
         eauKGxzQf1pYON5JgfgY+2VDmFAbs6VxmypXa3dA4UsUOsI2piuVF+WZ1hzGczNlHtKZ
         HAkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747768149; x=1748372949;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=k/0lqXBgLimY0A+nlogIvRC91H4XJPyHb2uLAtGHc+4=;
        b=S5zt4Kf08v5ktu0QYVSuItffKE4Z5psg68g6p97xFZVQwSHxOC/H7t6LkDvs3F9N5k
         78LnFfWeDRQ4vQloSsI28cvJPRRPOXIIep7oBRAHWiGbdrarXzhpvDtyStrumQc7DYan
         Zn6jRFUdqi4Ia05SMV5XYIQDwlwQ0zvZ2/2g4TnKH4bY/Z9A/q4S+dmJLJPxjj5DFG3R
         5LENyc+tKSZGMH66DSzkO/Zv0v4+sF2KKu/DnWIPe70Xps1Pu3qDD/k0dUXJCcKqPfnq
         9nlTQdNZgVS+W0VDPY9aZwZcFbSjuuGaH1mJcqmE6A1hBhCSgALWeh7FO/YuL93CaEZg
         eqmg==
X-Forwarded-Encrypted: i=1; AJvYcCWudHkkrtg7Pf06AT+Ecsl+2+7i8ZbhAz3yAopBKD3tpK15pF8beCZxlSw534APT7DUhXWmgCyVkVIH6C/3@vger.kernel.org
X-Gm-Message-State: AOJu0YyU1k90oWPVBBD3dmj8F9Lf2xp79X4eBnaOCg1r2SdFthN1dkwu
	M/E9v6quWGRBGQSQDUF6OIltR3u3+bmKj8N/h5skWBec98qzZGawNoI+za21vtqO
X-Gm-Gg: ASbGncuyL08ti4b+ieLro7kl+HiBqCHM6cS6MH87qAN/OKnZJv+cw1KWUhLe6jpGtpw
	nPZtdc/II9JlJZRtpMDWOem47UxuHxqoDLCjwJ6I+PW8ge0eIaURGkX6bPOkzlU863HiuQuSwpl
	hH35lHoPG3kpyF2ZoiJnlJ8RBQ1ZyK088A9dVAULlA3l9FI1OQ58XCgTCM/fsYvObGoQ/gccD+b
	/1LgzVoAL+1QE9JdlUfs5r5kUs8Q3snwrULkLBb3H4W1AFDH8phhDCNVKwvNcG+lZcn8YrYKnyF
	d3mNJD1JXdzcHyyhvkrSo2brxSdWqYCzIB62eMqctu7Xd4eB8Twoj2e2p9YygEpTxrxq3oZR5aH
	VJAUvDbscHNfoX3e87K/cKPzHnr0W3g==
X-Google-Smtp-Source: AGHT+IFR5pt9/GVP1EPATJ5cgZRIzs6LVruq0q5vYeQ0eAM0wqovWxYcOeeO8H0l7rzEaFl4O0FbJQ==
X-Received: by 2002:ac8:5893:0:b0:47a:e5b6:50d4 with SMTP id d75a77b69052e-494ae3f7e46mr90403491cf.10.1747768148499;
        Tue, 20 May 2025 12:09:08 -0700 (PDT)
Received: from [192.168.124.1] (syn-067-243-142-039.res.spectrum.com. [67.243.142.39])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-494ae445b99sm76554051cf.48.2025.05.20.12.09.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 May 2025 12:09:07 -0700 (PDT)
From: Connor Abbott <cwabbott0@gmail.com>
Date: Tue, 20 May 2025 15:09:00 -0400
Subject: [PATCH v8 7/7] iommu/smmu-arm-qcom: Delete resume_translation()
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250520-msm-gpu-fault-fixes-next-v8-7-fce6ee218787@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1747768138; l=1671;
 i=cwabbott0@gmail.com; s=20240426; h=from:subject:message-id;
 bh=T92V8eX3Vz4beQQo+V6nyo4FyO6B+nwmyPWJT1oO+Pk=;
 b=V6LelLjLszEjGIEg7Z7nBX+1w5ysEhFN0tIa8dRMNROYBzA6VMJ+NwDe2jnJAGKdUiJCz18nz
 McgNjrJt/A6BgWCGL2r/nQUpmNIJeHTCHHVFZazeqlf0zl9zY1lh5XO
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


