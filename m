Return-Path: <linux-arm-msm+bounces-43798-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 83AF89FFE81
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Jan 2025 19:36:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4C0F1162357
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Jan 2025 18:36:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B4CAD1B413E;
	Thu,  2 Jan 2025 18:32:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fwwkpPtg"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F32E1B4143;
	Thu,  2 Jan 2025 18:32:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735842758; cv=none; b=uyBNQejIRHTWBS6wWTwJWQukPZME9HSzYLkLDs0kIcuniuBWKaehJ94bVX46nD4yXcbtEHp6+xVXcxRWOLX5rPPkZ4EI2bs00L+Qm9eEnlkW1SWT3oNNHfuJzHhTv1XcScFEWU/I9CwM/tJ/b/RClAOJIRyI6QAdnGlRbiudO1I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735842758; c=relaxed/simple;
	bh=cN4J+UpgOxehArmN/mUgiApP4PZbJeqcXPOMBYKIKD8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ed/SIF/90Ff3CHr2ei3f8DzSPuJJFzbs3vwLKcIYw7GvexaW51pQ+lr6R7ehiA+XLWePQUjUN3qD6jHrvi/D+oC0QiG1y2MF29yBAH3FxJYK//yv4JGaP8+PqLKe3fHKmIbdYrndLKDgD7HgAf3yBMDlFT8MOMrQdMviP0BfsnU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fwwkpPtg; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-2ee397a82f6so16377269a91.2;
        Thu, 02 Jan 2025 10:32:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1735842756; x=1736447556; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ZmBLyMaEsdOn4Q5STQE+mhdoJd5pHTPZlhfFO4wWcQY=;
        b=fwwkpPtg/4J/+SmPiBHF4XmYERY7HL8QZcRNUhDHBTe7FYhJRMmO7+Xh8lfkXrDxx/
         8CdxKCqL8r0VlQ70KWrj17PztabOqAklMHhfn3P9jr5mkRCHq3YgqGNIcV0cr2C1fKM9
         WHMT7+kBSyUEdG/oOSAlspZxf60EsB6AwZ0v4aUJsjvBV8fRynWCBCSJAyrwkJpp8zw+
         GDzSuyGphT62tyqQui15aucHqenDZm3DbsfOAEqYPVU1urc+KuGXrlK5bGQ+NQQ/n7y5
         g7WxCgQ7T8F7+YbPqzNXSppJiaq9IMizKvqsSyYVhvj7wK6Jr7W3gVSjvBWVI8M+G5ay
         chlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735842756; x=1736447556;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZmBLyMaEsdOn4Q5STQE+mhdoJd5pHTPZlhfFO4wWcQY=;
        b=bymf1vi4Iyokss8mYzo3IU/a+dXhS73XrZ6sN5voWX5WyOWLMde3c6JL/23/ZUS0/d
         JCqTN4zw4I6gDgmxGoIU/KSGA9pONbYLLMUy1ECuJShLLa6Tg5dvcst1atIsFCpyaECY
         ltqXcKXRmAvtWpOoB1AmFR0JgStpZtiymvlyUoJ5PB99kq8IZ6IOqCPpllDGGpAXhaF0
         BLY9OopgSPFueQVwanXYxtn41LtvBehyG6DquEvYPeT8mojjxE5jhVGG43Oroda5eW+f
         KqylqwVnbaZBvBj1rU7vc3gHL1H0FUQFg4bpfQFQb0c48AiN+b2jkrqiyMIoEU2XwPcc
         VVDg==
X-Forwarded-Encrypted: i=1; AJvYcCXFVc+j9I83mIbbSmVsTsS2NXS+nOUKASThsiIa0znO3PWs7To9TRQZMaC40Ebsvlu040/e8ESJObnApaM=@vger.kernel.org
X-Gm-Message-State: AOJu0YwDNodNl2rvEMY1eQ+O0ccaF0HHNWWyV/5W2o0MiPNyrPNxCSET
	xSlKhXZy61BrRTwZnz6Tj5jwltl/6xpyRgCzm5XhHLf7Jj4aCAY7
X-Gm-Gg: ASbGncuZ/kVcx5qhG5XGr5x9EqJhIqF7xbgJuifS4062loyUtPTS5fMC1hFh74+3gY9
	RvfCHrhnhLz7mYLCvfhF5WLwlNM3zT5qbGY9MeCuIz6ctQDGLOmeo4aQp8eZYQjh7W6nO9qDqfQ
	HJzRBl+gyJgq74+Fpp9rV9TX1OZXihs4T7TeZZuXFqHN4JMc1S2Km2lFIQ8tEc21eljrBW78yHB
	G0vzxoJ7Msmrv8C2o7QPsomWnWZXxzEK6bAAx2MAkBI6g0z8zk2LvKa1mBysXB8gduU/NTZQ/k3
	s7OKawfxXuLyGk6iAxpE2EwYRRRzuLE=
X-Google-Smtp-Source: AGHT+IHpGOLVThnWV3UDWPVggKt9JZyqBWGCDD4mG3rXl7oRcepmQ9fGjP9tbJJ2H/XG2/M6m4kRPA==
X-Received: by 2002:a05:6a00:3406:b0:725:eacf:cfdb with SMTP id d2e1a72fcca58-72abdeeed6emr71219209b3a.24.1735842756061;
        Thu, 02 Jan 2025 10:32:36 -0800 (PST)
Received: from localhost ([2a00:79e1:2e00:1301:12e9:d196:a1e9:ab67])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72aad8dbbabsm25601698b3a.101.2025.01.02.10.32.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jan 2025 10:32:35 -0800 (PST)
From: Rob Clark <robdclark@gmail.com>
To: iommu@lists.linux.dev
Cc: linux-arm-msm@vger.kernel.org,
	freedreno@lists.freedesktop.org,
	Robin Murphy <robin.murphy@arm.com>,
	Will Deacon <will@kernel.org>,
	Rob Clark <robdclark@chromium.org>,
	Rob Clark <robdclark@gmail.com>,
	Joerg Roedel <joro@8bytes.org>,
	linux-arm-kernel@lists.infradead.org (moderated list:ARM SMMU DRIVERS),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v2] iommu/arm-smmu-qcom: Only enable stall on smmu-v2
Date: Thu,  2 Jan 2025 10:32:31 -0800
Message-ID: <20250102183232.115279-1-robdclark@gmail.com>
X-Mailer: git-send-email 2.47.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Rob Clark <robdclark@chromium.org>

On mmu-500, stall-on-fault seems to stall all context banks, causing the
GMU to misbehave.  So limit this feature to smmu-v2 for now.

This fixes an issue with an older mesa bug taking outo the system
because of GMU going off into the weeds.

What we _think_ is happening is that, if the GPU generates 1000's of
faults at ~once (which is something that GPUs can be good at), it can
result in a sufficient number of stalled translations preventing other
transactions from entering the same TBU.

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
v2: Adds a modparam to override the default behavior, for debugging
    GPU faults in cases which do not (or might not) cause lockup.
    Also, rebased to not depend on Bibek's PRR support.

 drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c | 19 +++++++++++++++++--
 1 file changed, 17 insertions(+), 2 deletions(-)

diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
index 6372f3e25c4b..3239bbf18514 100644
--- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
+++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
@@ -16,6 +16,10 @@
 
 #define QCOM_DUMMY_VAL	-1
 
+static int enable_stall = -1;
+MODULE_PARM_DESC(enable_stall, "Enable stall on iova fault (1=on , 0=disable, -1=auto (default))");
+module_param(enable_stall, int, 0600);
+
 static struct qcom_smmu *to_qcom_smmu(struct arm_smmu_device *smmu)
 {
 	return container_of(smmu, struct qcom_smmu, smmu);
@@ -210,7 +214,9 @@ static bool qcom_adreno_can_do_ttbr1(struct arm_smmu_device *smmu)
 static int qcom_adreno_smmu_init_context(struct arm_smmu_domain *smmu_domain,
 		struct io_pgtable_cfg *pgtbl_cfg, struct device *dev)
 {
+	const struct device_node *np = smmu_domain->smmu->dev->of_node;
 	struct adreno_smmu_priv *priv;
+	bool stall_enabled;
 
 	smmu_domain->cfg.flush_walk_prefer_tlbiasid = true;
 
@@ -237,8 +243,17 @@ static int qcom_adreno_smmu_init_context(struct arm_smmu_domain *smmu_domain,
 	priv->get_ttbr1_cfg = qcom_adreno_smmu_get_ttbr1_cfg;
 	priv->set_ttbr0_cfg = qcom_adreno_smmu_set_ttbr0_cfg;
 	priv->get_fault_info = qcom_adreno_smmu_get_fault_info;
-	priv->set_stall = qcom_adreno_smmu_set_stall;
-	priv->resume_translation = qcom_adreno_smmu_resume_translation;
+
+	if (enable_stall < 0) {
+		stall_enabled = of_device_is_compatible(np, "qcom,smmu-v2");
+	} else {
+		stall_enabled = !!enable_stall;
+	}
+
+	if (stall_enabled) {
+		priv->set_stall = qcom_adreno_smmu_set_stall;
+		priv->resume_translation = qcom_adreno_smmu_resume_translation;
+	}
 
 	return 0;
 }
-- 
2.47.1


