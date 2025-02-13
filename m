Return-Path: <linux-arm-msm+bounces-47923-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A295A34AB9
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Feb 2025 17:51:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A91611886021
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Feb 2025 16:46:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 78EE52046BA;
	Thu, 13 Feb 2025 16:45:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gzuUXITn"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E2D32040B7;
	Thu, 13 Feb 2025 16:45:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739465103; cv=none; b=HV/0SckY1xVQKo9YHYLlbvC77X5Dvmiskp/4jyF54CsAbMNsXAkAJph87raja+Ty1kG/jzUdI5dUymz8zo9C+5+iIGu2ZVQdQk0DW2R+Ktcn8GWIOkLjEMnArJ8cRPAy/W5/gobt+RRnrA7+Xr+GXO8ydWkDpED7ybI4iNTezQg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739465103; c=relaxed/simple;
	bh=wS6QvXcMhwE4DWtt5Jqf+sbLLz2q6PyWoErAL8pV51Q=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=UKFzAxvQ6l1rq9iI2aD4+L6zVTi2kDcUjypHK0hrEoPEEdgfNlyqcEFL/GJsuSqhHwRoOJUVl2roGahOzf3kV4jprXk9jwkt4o1n4TKGvPIUxfNBz85gimf7vG6W/hFkqOpVTwp4RkJvHUOWMszyqm0XAN9THbRAAMWhkhSYVPw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gzuUXITn; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D2D3EC4CED1;
	Thu, 13 Feb 2025 16:44:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739465102;
	bh=wS6QvXcMhwE4DWtt5Jqf+sbLLz2q6PyWoErAL8pV51Q=;
	h=From:Date:Subject:To:Cc:From;
	b=gzuUXITncKYYEdOxAs/G1DWbhDBn8K0kJWkWUxKB9xPygLVOJmWldv/6l+4qGtv88
	 xxdv/uYYU8jHOFmd2S4ZF3hdqJEDNaWBl2CSNN6njyQMDioocYHD/f8UMImSK53L3Q
	 kQ7LLqy24xvUd//Y6E3pH4ue32SrznhBjdr3jc+WOQ8zzLOOKPtQkfsvSBh/01hJyt
	 KB3fbuT4rggpc/tIbfcw4l6eJfR/hHqGqAsDs/geMXmD4K7m19xmSZkrltKyzgr7gF
	 fqZluUt4Z00lRhc9a3oVryJeqdf7mFZVsxXaYwkMNSCTq/a/9VlJGwr8GIHjuYxL3r
	 /rw7mhLmwn8bA==
From: Konrad Dybcio <konradybcio@kernel.org>
Date: Thu, 13 Feb 2025 17:44:43 +0100
Subject: [PATCH] drm/msm/a6xx: Only print the GMU firmware version once
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250213-topic-gmu_no_spam-v1-1-1e4afdd898b6@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAHohrmcC/x3MQQqAIBBA0avErBPKlKirREjoaLNIRSuC8O5Jy
 7f4/4WMiTDD3LyQ8KZMwVf0bQN637xDRqYaeMdlx/uBnSGSZu64lA8qx+1gwmqhhZxGKQ3ULia
 09PzPZS3lAxDyuWBjAAAA
X-Change-ID: 20250213-topic-gmu_no_spam-4fc4c459755d
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: Marijn Suijten <marijn.suijten@somainline.org>, 
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Jens Glathe <jens.glathe@oldschoolsolutions.biz>, 
 Abel Vesa <abel.vesa@linaro.org>, Rob Clark <robdclark@chromium.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1739465097; l=1615;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=rviqRqqnKwEysjKAw+EBRbtmuL1NqJ2+/UqeC8Tajzg=;
 b=UsgAMcHRTZSaBEBYLKKtu4FbqbYob0qDF9JDQfaySiUiCius4FDEb3ZnBpefhpdxw+YbegUIP
 XbZhoE2tGW+AxqEo35/fegDk7OUpXW+Dh9r7OHzFV4sTFLlsJidsF2L
X-Developer-Key: i=konrad.dybcio@oss.qualcomm.com; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

We only fetch it once from userland, so let's also only notify the
user once and not on every runtime resume.

As you can notice by the tags chain, more than one user found this
annoying.

Reported-by: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
Suggested-by: Abel Vesa <abel.vesa@linaro.org>
Suggested-by: Rob Clark <robdclark@chromium.org>
Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
index 65d38b25c0707a3c7fff08d110b4ac2b9d410473..699b0dd34b18f0ec811e975779ba95991d485098 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
@@ -813,10 +813,10 @@ static int a6xx_gmu_fw_load(struct a6xx_gmu *gmu)
 	}
 
 	ver = gmu_read(gmu, REG_A6XX_GMU_CORE_FW_VERSION);
-	DRM_INFO("Loaded GMU firmware v%u.%u.%u\n",
-		 FIELD_GET(A6XX_GMU_CORE_FW_VERSION_MAJOR__MASK, ver),
-		 FIELD_GET(A6XX_GMU_CORE_FW_VERSION_MINOR__MASK, ver),
-		 FIELD_GET(A6XX_GMU_CORE_FW_VERSION_STEP__MASK, ver));
+	DRM_INFO_ONCE("Loaded GMU firmware v%u.%u.%u\n",
+		      FIELD_GET(A6XX_GMU_CORE_FW_VERSION_MAJOR__MASK, ver),
+		      FIELD_GET(A6XX_GMU_CORE_FW_VERSION_MINOR__MASK, ver),
+		      FIELD_GET(A6XX_GMU_CORE_FW_VERSION_STEP__MASK, ver));
 
 	return 0;
 }

---
base-commit: df5d6180169ae06a2eac57e33b077ad6f6252440
change-id: 20250213-topic-gmu_no_spam-4fc4c459755d

Best regards,
-- 
Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>


