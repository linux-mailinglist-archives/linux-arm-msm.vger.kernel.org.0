Return-Path: <linux-arm-msm+bounces-42874-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 228B99F87FB
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Dec 2024 23:37:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1CC4416B41C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Dec 2024 22:37:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1FBFA1C4A12;
	Thu, 19 Dec 2024 22:37:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="m/H3M8G7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBE2486337;
	Thu, 19 Dec 2024 22:37:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734647842; cv=none; b=UN/IBeBEzQAGZJYWxYQT1n/DZbZ+c370OG0y/0TzsSgh+Mhi0CtE4flX0uyKvyDEVFD0AoYKoa4rGUA0E/OMYveCBY809El0lrIQcGgOYVu7UMJyKZL9QcRkATD6QQONDRF9huaR1b47HLdKXs9gO/0G2riJPwFJqyfrXiRGHq8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734647842; c=relaxed/simple;
	bh=BXmHxRjbMYvi05HUYGxRCT9+m9iRMoBeThzeq5sctFE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=OIsxNQPNb4Ua48m4UZuQoXjr6qRqwxWsIjYRwb3QFObruY9W5dsgw0EqiIhYeZiPTwrkx69C7Ewlo39Tv0n2ea0baxx+tHbp2+8zY+BFuvwiJS1hmXxr+funjPejsIIxj65L/Tf9uiJmjld1YN8WFKF65D7LrAf9erfVWUnrKCI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=m/H3M8G7; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5F771C4CECE;
	Thu, 19 Dec 2024 22:37:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734647841;
	bh=BXmHxRjbMYvi05HUYGxRCT9+m9iRMoBeThzeq5sctFE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=m/H3M8G7uKq8FVmrLoCZEfswMbp/AkILH6cBoiKIqIWt7bgNow85aVpm7UNEz/IBw
	 cb7fudpjjYH0Ctm6L/54DczaE8JVJagscWlylKJslsBUzGjV3F5wrHBYEQxyJrB6yp
	 LmqKdB3F9fN7PHIpc/kxgFnzca4HMtYqUOMqCdatBJhCWkTw39rSVczP4xyAmwcbY0
	 LIKqbFrhYtw+C+RAAT6SGOBCLseyBW22q+WjXXxD/hDbfhrn3QfR1gi07gbbCIl6lB
	 AzD/CNRitqq1+NHCkL8s2625YTo4S9XfwGia3wvhN4+j3gxPcTaWzNf8odwciGkKXN
	 khGfWamIekf7A==
From: Konrad Dybcio <konradybcio@kernel.org>
Date: Thu, 19 Dec 2024 23:36:56 +0100
Subject: [PATCH 2/2] drm/msm/a6xx: Print GMU core firmware version at boot
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241219-topic-gmu_fw_ver-v1-2-d403a70052d8@oss.qualcomm.com>
References: <20241219-topic-gmu_fw_ver-v1-0-d403a70052d8@oss.qualcomm.com>
In-Reply-To: <20241219-topic-gmu_fw_ver-v1-0-d403a70052d8@oss.qualcomm.com>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: Marijn Suijten <marijn.suijten@somainline.org>, 
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Akhil P Oommen <quic_akhilpo@quicinc.com>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1734647828; l=1525;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=aoD1omnv30HwSwtIB66YPTfZG+VP+p+pQKMUtkvGd7g=;
 b=0Hgm0N3l/9kovPlli67XIRYIo4KRtswUlxP7o0iG2kfBS50vDyNnxRhq45igMzj29bd7yvg6y
 IaJ+ikGL17aC8yjrMHUD48pUy5P+l+/B0QMqwLroSNnobikvUhKOUQD
X-Developer-Key: i=konrad.dybcio@oss.qualcomm.com; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Log the version for informational purposes, such as for keeping track
of possible GMU fw-related failures in crash / CI logs.

Intentionally not implemented on the if (gmu->legacy) codepath, as
these registers seem not to be used on there.

Downstream additionally warns if the firmware version is too old for
a given GPU, but we already pair the binary to a given GPU, so let's
not go there at the moment.

Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
index 14db7376c712d19446b38152e480bd5a1e0a5198..a7ea2b2af1dc3816906236df929df36e37d8f606 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
@@ -729,6 +729,7 @@ static int a6xx_gmu_fw_load(struct a6xx_gmu *gmu)
 	const struct firmware *fw_image = adreno_gpu->fw[ADRENO_FW_GMU];
 	const struct block_header *blk;
 	u32 reg_offset;
+	u32 ver;
 
 	u32 itcm_base = 0x00000000;
 	u32 dtcm_base = 0x00040000;
@@ -775,6 +776,12 @@ static int a6xx_gmu_fw_load(struct a6xx_gmu *gmu)
 		}
 	}
 
+	ver = gmu_read(gmu, REG_A6XX_GMU_CORE_FW_VERSION);
+	DRM_INFO("Loaded GMU firmware v%u.%u.%u\n",
+		 FIELD_GET(A6XX_GMU_CORE_FW_VERSION_MAJOR__MASK, ver),
+		 FIELD_GET(A6XX_GMU_CORE_FW_VERSION_MINOR__MASK, ver),
+		 FIELD_GET(A6XX_GMU_CORE_FW_VERSION_STEP__MASK, ver));
+
 	return 0;
 }
 

-- 
2.47.1


