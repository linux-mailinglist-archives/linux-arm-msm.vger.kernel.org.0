Return-Path: <linux-arm-msm+bounces-10874-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id BEC95852F5E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Feb 2024 12:32:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E316D1C21BBF
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Feb 2024 11:32:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF98136AE4;
	Tue, 13 Feb 2024 11:32:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="o6376yxm"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29C0E249F3
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Feb 2024 11:31:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707823920; cv=none; b=CeFRxj6PSt/713wPNJvABxULbceQqXPe3caCtxeQ0d4q2z9D8KlvdoMrN3lVCAhBNe1G7XwPzA7idUsq2LLD78MDg7hT8/YMymC9dTNLflJkFt3weoJL27xJPG+4Y5Wme0cN+izbejSjG/bPWm28fmNgyyCHdjq6O+umzBO6wTM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707823920; c=relaxed/simple;
	bh=VNzyMFgzRDdRImzMyBRwcnt+hLSTpHjtx1cCpgED+8w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=bYHu3eNQoZLfMhOXr2v92akCNea5zGVlOmhdwCMZC105ipFqTDTyzn/r2V+3NI4JhV5vZ8NlirjTHvibmQXqwmprgf9XSJjBwFFRRKqC5bSISkpyrVWDkg48DGOF1v9p12v1GwNgjj8ZJ4wCQYEDgGU09h0NLOmfdjSwNQmzGsc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=o6376yxm; arc=none smtp.client-ip=209.85.208.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-2d10d2da73dso4144111fa.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 13 Feb 2024 03:31:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1707823917; x=1708428717; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=uS8cnA3pBTNOupO3BurZcxkLrZDtBZi6I8VrC2BbWF8=;
        b=o6376yxmANSe5MpuHYnIZMdoz3sOmjan1ZXPvQQq+fwZyP5ERFJYfSj17UbCXj2PIv
         iXWUtd9Ock3BnwHgSNdWPpbm3fh+AG9vJKC102rUVEy19KvUkoBdUz0h3GMiIlgD1l1e
         j22BPLEmc/G8dEknKJJC3SMhr02yavR3Jzt1aMj/u0w7/FtfADKuN9ns+dy2+0Mlhj0a
         qG68MnvFnVgPNmPNG9jXPaQiIvPLQF4cEf322Q1iWvAnssSrgjgfOzwQX0+vD3YQuXg0
         SJOiEsOKyTrdOouSAQ8exkFSPSSEPIUOpIAALFCYl+Qy1OYwKds/pCBcdx+xy5EkBnSZ
         DbgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707823917; x=1708428717;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uS8cnA3pBTNOupO3BurZcxkLrZDtBZi6I8VrC2BbWF8=;
        b=kelynK4c2ijwT79KRRhPTjE6yKYfKEyP0EmTJiB/HO75KHqRUcunvI9cJEoKUB7haO
         XpelOH/c3hA4eDNHFczImaWet7n9pMPdi4lArKj+C+IneVKhCoQ3bwcHzBIkMAET9TUL
         2D8I66Ma+A8P6EmftMW+f64wm43V5iC0A1md9kUKdZom+xBCnPpotzYj4ZsA07M3LBMh
         m7kv6GYBba02ITnlprmX11ooVgCKTw3lwKYAdfgis6cza68b5l4On1pFaypKhXx2FqZp
         2AtLiiIrszcReG4F0zevEzzdVQX7/MNpyk4x9caQakyHWW6xvPY+NJm00o6Nk42QuRv6
         c3cg==
X-Forwarded-Encrypted: i=1; AJvYcCXMo7aqr93RUSzoa3bOyJDVG3pk83mpELkWOC0xWrlADo7msCb+N8duaCR9dCNa9h+LZcMJao8pGbV52EhlUd4nPVonL58Kukxevb+R/Q==
X-Gm-Message-State: AOJu0YxeOjr8IgRZystKDcVZrW4g4YaE7qJi3lkfWNvLcSewRtjtwnaY
	hy2SLboo09w3KWA5DnmI17CPQjkGYvqcbm0ylgCxXsapin8bmocSxHRq56U9jiw=
X-Google-Smtp-Source: AGHT+IFXqJMFeYMCwF/rJEi6gj2CPKIuIyx+ghUQ5Ar/LaUFd19fuMycEe/DMkqbxy8nFFZs+dYtHQ==
X-Received: by 2002:a2e:b5a7:0:b0:2d0:a249:c04 with SMTP id f7-20020a2eb5a7000000b002d0a2490c04mr5848422ljn.51.1707823917042;
        Tue, 13 Feb 2024 03:31:57 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWhBpnYHiCIPH+b0alrOINE7gSo++GX62QVo/r4qLptcCg++0dLshB8MG1whe+Rn8Ywo37DC1tim8a/Ln5JTZEHGc6v/N0N9S4u79H4vHQG4mhJVC+0PKI6sNmprrOkgoipCT8trMvOpMtnp4kSfzq5XdXgwyN0tUPsGJiO9uoap2csEPlqLqsgZDwhZZ3qGwxSb9kRgFB61yg7Fqx+zivdMrqKe/7nZGwkHynPH8Y=
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id f10-20020a2ea0ca000000b002d0ac71862csm460885ljm.9.2024.02.13.03.31.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Feb 2024 03:31:56 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 13 Feb 2024 13:31:56 +0200
Subject: [PATCH] Revert "iommu/arm-smmu: Convert to domain_alloc_paging()"
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240213-iommu-revert-domain-alloc-v1-1-325ff55dece4@linaro.org>
X-B4-Tracking: v=1; b=H4sIACtTy2UC/x2MQQqAIBAAvxJ7bqEskfpKdBBdayE1tCKI/p50H
 JiZBzIlpgxj9UCiizPHUKCtKzCrDgsh28IgGtE3ou2Qo/cnFpXSgTZ6zQH1tkWDTisxkOyUdRJ
 KvydyfP/vaX7fDxokJQJrAAAA
To: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>, 
 Joerg Roedel <joro@8bytes.org>, Jason Gunthorpe <jgg@ziepe.ca>, 
 Rob Clark <robdclark@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev, 
 linux-arm-msm@vger.kernel.org
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=openpgp-sha256; l=2391;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=VNzyMFgzRDdRImzMyBRwcnt+hLSTpHjtx1cCpgED+8w=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQ+rpYB1d74MqZZ1PjrGqpvbq6yfbHAycGuRvfz8+9/k8M
 ymzTJNORmMWBkYuBlkxRRafgpapMZuSwz7smFoPM4iVCWQKAxenAEykL5f9f7HHmaTpk1e9EDDf
 J1OzzO5e2RXZ7AkKW7yaZwo5W4h7eckpG1RMaarY7W5r5DD/6gTd3MXSe0Nk7K/PYOxc7Xhai9n
 ZY6/P63XtFV5dkV92s6cWH5ayFv8vVrvzpHa0HNOhnr03Z2w6WCb7pThI8u9k52ecMV2zuoxbvj
 9QEq547fVyUu4dNsuoNDHbb/dNl78ui37y64T1upp5yn+6uK2mJ8z66rHO8e48pjffPfxSvH8JL
 OBZkiv8vEee5+bjDWkFbhVuNukMl5yi7iadS5zZsWuxkWOk2N/vk3yLOw12X2B7tvPidM/TIRdt
 b/C7nVRenVqrGKt1z3ufjFdUyvmkT3zdKpdmsyYFdMQAAA==
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

This reverts commit 9b3febc3a3da ("iommu/arm-smmu: Convert to
domain_alloc_paging()"). It breaks Qualcomm MSM8996 platform. Calling
arm_smmu_write_context_bank() from new codepath results in the platform
being reset because of the unclocked hardware access.

Fixes: 9b3febc3a3da ("iommu/arm-smmu: Convert to domain_alloc_paging()")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/iommu/arm/arm-smmu/arm-smmu.c | 17 ++++++-----------
 1 file changed, 6 insertions(+), 11 deletions(-)

diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu.c b/drivers/iommu/arm/arm-smmu/arm-smmu.c
index 68b6bc5e7c71..6317aaf7b3ab 100644
--- a/drivers/iommu/arm/arm-smmu/arm-smmu.c
+++ b/drivers/iommu/arm/arm-smmu/arm-smmu.c
@@ -859,10 +859,14 @@ static void arm_smmu_destroy_domain_context(struct arm_smmu_domain *smmu_domain)
 	arm_smmu_rpm_put(smmu);
 }
 
-static struct iommu_domain *arm_smmu_domain_alloc_paging(struct device *dev)
+static struct iommu_domain *arm_smmu_domain_alloc(unsigned type)
 {
 	struct arm_smmu_domain *smmu_domain;
 
+	if (type != IOMMU_DOMAIN_UNMANAGED) {
+		if (using_legacy_binding || type != IOMMU_DOMAIN_DMA)
+			return NULL;
+	}
 	/*
 	 * Allocate the domain and initialise some of its data structures.
 	 * We can't really do anything meaningful until we've added a
@@ -875,15 +879,6 @@ static struct iommu_domain *arm_smmu_domain_alloc_paging(struct device *dev)
 	mutex_init(&smmu_domain->init_mutex);
 	spin_lock_init(&smmu_domain->cb_lock);
 
-	if (dev) {
-		struct arm_smmu_master_cfg *cfg = dev_iommu_priv_get(dev);
-
-		if (arm_smmu_init_domain_context(smmu_domain, cfg->smmu, dev)) {
-			kfree(smmu_domain);
-			return NULL;
-		}
-	}
-
 	return &smmu_domain->domain;
 }
 
@@ -1600,7 +1595,7 @@ static struct iommu_ops arm_smmu_ops = {
 	.identity_domain	= &arm_smmu_identity_domain,
 	.blocked_domain		= &arm_smmu_blocked_domain,
 	.capable		= arm_smmu_capable,
-	.domain_alloc_paging	= arm_smmu_domain_alloc_paging,
+	.domain_alloc		= arm_smmu_domain_alloc,
 	.probe_device		= arm_smmu_probe_device,
 	.release_device		= arm_smmu_release_device,
 	.probe_finalize		= arm_smmu_probe_finalize,

---
base-commit: 46d4e2eb58e14c8935fa0e27d16d4c62ef82849a
change-id: 20240213-iommu-revert-domain-alloc-fa729e537df5

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


