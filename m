Return-Path: <linux-arm-msm+bounces-70108-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A2E41B2F28A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 Aug 2025 10:43:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 40EB81CE0F19
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 Aug 2025 08:35:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2142F26B09A;
	Thu, 21 Aug 2025 08:34:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="MWtOBtum"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 391133594F
	for <linux-arm-msm@vger.kernel.org>; Thu, 21 Aug 2025 08:34:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755765247; cv=none; b=CBHvkgaacSxQXuQKB9csWUrNDETtBHTcC1EPjB87vLazeAD7n4a7vONijuksfFdfLZAMVMEsxT3k6DKhFYHkTaa6HtUHY13uaZIqc7RFTUZ5wyeyFuRaVgA2EqG9XeO84T/2RlRp93rolKJNNRUvVF1JpZ0PNuT7b1Ck5yzrv0w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755765247; c=relaxed/simple;
	bh=wLUC/1W7EfFeUkMtGcj1FzsRd9x+m0ZbSOIe9wVACeQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=YQzfvSm8OqVkhV5jVGy4wU0oA5CpxNfnqHUT+FVsBWpnz1AfjkWyFpGwBBEmmpwpIdJqRtJ5hqQolGOedlMhl87N5Iwf7bOHKvuucSz4poKkwUJIKSzsiRwI7J8ZdTKkzzcYWPs/qfYTKit1BDYjcWBwk3ehZgclI2m7QLPON7U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=MWtOBtum; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-3b9e7437908so499359f8f.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 21 Aug 2025 01:34:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755765243; x=1756370043; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=eFk83CXRUT92P3+BiK0rArrXXY+KdlyqnAXLmJEMLjY=;
        b=MWtOBtumbtGLO4eucaKH19C3h16GukiBdmQeS/W+Zr5+Mbfdg8LwYxtnZ03f9n59f+
         QXNTQH8BPlmknTZExrVXCSvpDKlcXh6D914w3CeyAe3CRGb1K82P5bKtLjZEbmefObcR
         gL0pAI1UfBk3F+vOzCEcdPjIJwu+xeG2hHrWIaxQhUks5IDjKlQ+3bQKHbXf+9UV1qHF
         E1qfbJsNOsH1oBzr0gW+P+Kiwl08Oku6MTnSwOWLYOdZWz+fTzZs1R92aFbs5nXI8Uic
         cuvc6t2NKgSeBzIBVhvVe31nxi5YF05H3WNhC1Pav43rwdSbL5KkfREoi8UOexjqCIMc
         8uSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755765243; x=1756370043;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eFk83CXRUT92P3+BiK0rArrXXY+KdlyqnAXLmJEMLjY=;
        b=S/j1sJzJ8tbfTxsOhWe5oqt2sBn2ZeHkxc+fDwpZZJgjvCM15u2im6INE3QFkrCm+Z
         aN+7COPl+8XObSTiE77BIOQoSJQcKJLaVgT29HML3LRFf62e7eu6/+B5Tyg2mYHhYfdi
         xWc6reTB1di3VibP0djpDrTYUyZzkDD012P9M3abUS8Vfv5p7P7VMD8rKe8dGppouKht
         Dq4korVfUk7tfMOk/Oc+uvNeuQn39D04iWsociUwPG0frgVICqYmSd5bUDY7wCP25uf4
         TmW1fPm8LIWePpGb0CHTPhhq72yvTVn5+McGQo3xYEer3luU4rWTimRqK9YNygndz2mm
         viRg==
X-Forwarded-Encrypted: i=1; AJvYcCXZ6dZvvA0xMsq2VvBm6OpkQjTitTBgfZDT0vKrGFH1LKeD6cRktOGDB2XRfpeY3Wp6Ax6H8l9GG3jkLkhz@vger.kernel.org
X-Gm-Message-State: AOJu0YxAlK9PfZl7cdwMwuFZDjXhDmK63dwU+piN+q8yaYNWvTQpO+R9
	iPtRrw6srvdRjT5qMR7Hr7rhe0MzQslmxXyUjqXLlqLzjS48sSrRkmBFdYHtsOfwSz1ELegYIPU
	/z7Po
X-Gm-Gg: ASbGncsvwv7FZpPCfnOG++uL2FtsED2NlXYlKY/uSgkqba2MbwzA/jSOZJPlaKaUfM7
	r3OWjXxosavJSsNwMxWDRDdpSIa1eqLrGSwlcnIhSafm6bTHbOd4+3zf76ssSU5dLLtN01NoEod
	iE6CQZ7wdKLb+kunpHW4IeUpMfGdtWWoKIi1ily0dz/BaXKWOByklX+2xwlC9X+Xfh0DUpR28Ub
	Z5jo4UIpP+f+4eF0BLc4XqJhCET7rOaA2OtWPQdtQt+InMFZuZQPu4o+d+k9Y+rlIXD5q9nHm3b
	H+RnUPbwub0MxzF+Rd1BkBh9PT56ZwDiMJMbD5IfbgmMNtjX/Ucr/6TyLt2K8RVsSTTuEJEMoyX
	MptWO7QhED4HSxZ9EC6YvqrffWIVmN6LPjiei
X-Google-Smtp-Source: AGHT+IHW+YsmBVfepjw0RvvbIvLuyUZUzNrK5+vJha1JHDeloaVHEaX39wtYCOugbW2Umy9rn6hFAA==
X-Received: by 2002:a5d:64e7:0:b0:3b7:899c:e867 with SMTP id ffacd0b85a97d-3c497741f55mr1258810f8f.59.1755765243275;
        Thu, 21 Aug 2025 01:34:03 -0700 (PDT)
Received: from [127.0.0.2] ([2a02:2454:ff21:ef41:a59f:f2cf:3ca3:965])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45b4db2a491sm18681295e9.8.2025.08.21.01.34.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Aug 2025 01:34:02 -0700 (PDT)
From: Stephan Gerhold <stephan.gerhold@linaro.org>
Date: Thu, 21 Aug 2025 10:33:53 +0200
Subject: [PATCH] iommu/arm-smmu-qcom: Enable use of all SMR groups when
 running bare-metal
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250821-arm-smmu-qcom-all-smr-v1-1-7f5cbbceac3e@linaro.org>
X-B4-Tracking: v=1; b=H4sIAPDZpmgC/x3MSwqAMAwA0atI1gYaUSheRVyUmmrA+klRhOLdL
 S7fYiZDYhVO0FcZlG9Jsm8FVFfgF7fNjDIVQ2Oazljq0GnEFOOFp98junUtUqTgLXkytjUBSns
 oB3n+7zC+7wdtNni7ZwAAAA==
X-Change-ID: 20250815-arm-smmu-qcom-all-smr-1fc81c10840f
To: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>, 
 Joerg Roedel <joro@8bytes.org>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>, 
 Manivannan Sadhasivam <mani@kernel.org>, Johan Hovold <johan@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>, iommu@lists.linux.dev, 
 linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2

Some platforms (e.g. SC8280XP and X1E) support more than 128 stream
matching groups. This is more than what is defined as maximum by the ARM
SMMU architecture specification. Commit 122611347326 ("iommu/arm-smmu-qcom:
Limit the SMR groups to 128") disabled use of the additional groups because
they don't exhibit the same behavior as the architecture supported ones.

It seems like this is just another quirk of the hypervisor: When running
bare-metal without the hypervisor, the additional groups appear to behave
just like all others. The boot firmware uses some of the additional groups,
so ignoring them in this situation leads to stream match conflicts whenever
we allocate a new SMR group for the same SID.

The workaround exists primarily because the bypass quirk detection fails
when using a S2CR register from the additional matching groups, so let's
perform the test with the last reliable S2CR (127) and then limit the
number of SMR groups only if we detect that we are running below the
hypervisor (because of the bypass quirk).

Fixes: 122611347326 ("iommu/arm-smmu-qcom: Limit the SMR groups to 128")
Signed-off-by: Stephan Gerhold <stephan.gerhold@linaro.org>
---
I modified arm_smmu_find_sme() to prefer allocating from the SMR groups
above 128 (until they are all used). I did not see any issues, so I don't
see any indication that they behave any different from the others.
---
 drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c | 27 +++++++++++++++++----------
 1 file changed, 17 insertions(+), 10 deletions(-)

diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
index 57c097e87613084ffdfbe685d4406a236d3b4b74..c939d0856b719cd2a5501c1206c594dfd115b1c5 100644
--- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
+++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
@@ -431,17 +431,19 @@ static int qcom_smmu_cfg_probe(struct arm_smmu_device *smmu)
 
 	/*
 	 * Some platforms support more than the Arm SMMU architected maximum of
-	 * 128 stream matching groups. For unknown reasons, the additional
-	 * groups don't exhibit the same behavior as the architected registers,
-	 * so limit the groups to 128 until the behavior is fixed for the other
-	 * groups.
+	 * 128 stream matching groups. The additional registers appear to have
+	 * the same behavior as the architected registers in the hardware.
+	 * However, on some firmware versions, the hypervisor does not
+	 * correctly trap and emulate accesses to the additional registers,
+	 * resulting in unexpected behavior.
+	 *
+	 * If there are more than 128 groups, use the last reliable group to
+	 * detect if we need to apply the bypass quirk.
 	 */
-	if (smmu->num_mapping_groups > 128) {
-		dev_notice(smmu->dev, "\tLimiting the stream matching groups to 128\n");
-		smmu->num_mapping_groups = 128;
-	}
-
-	last_s2cr = ARM_SMMU_GR0_S2CR(smmu->num_mapping_groups - 1);
+	if (smmu->num_mapping_groups > 128)
+		last_s2cr = ARM_SMMU_GR0_S2CR(127);
+	else
+		last_s2cr = ARM_SMMU_GR0_S2CR(smmu->num_mapping_groups - 1);
 
 	/*
 	 * With some firmware versions writes to S2CR of type FAULT are
@@ -464,6 +466,11 @@ static int qcom_smmu_cfg_probe(struct arm_smmu_device *smmu)
 
 		reg = FIELD_PREP(ARM_SMMU_CBAR_TYPE, CBAR_TYPE_S1_TRANS_S2_BYPASS);
 		arm_smmu_gr1_write(smmu, ARM_SMMU_GR1_CBAR(qsmmu->bypass_cbndx), reg);
+
+		if (smmu->num_mapping_groups > 128) {
+			dev_notice(smmu->dev, "\tLimiting the stream matching groups to 128\n");
+			smmu->num_mapping_groups = 128;
+		}
 	}
 
 	for (i = 0; i < smmu->num_mapping_groups; i++) {

---
base-commit: 8f5ae30d69d7543eee0d70083daf4de8fe15d585
change-id: 20250815-arm-smmu-qcom-all-smr-1fc81c10840f

Best regards,
-- 
Stephan Gerhold <stephan.gerhold@linaro.org>


