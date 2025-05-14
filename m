Return-Path: <linux-arm-msm+bounces-57862-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DEB0AB6F72
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 May 2025 17:17:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E4C618C45C7
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 May 2025 15:13:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 40239280331;
	Wed, 14 May 2025 15:11:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TDnbjE9H"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19D0C28031B;
	Wed, 14 May 2025 15:11:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747235506; cv=none; b=kUN4cC0qoLtf6v3yOrXgq9dyCeh2Y4CaOe1OAQIonSvUGb9k0cKZAJkb6k/f9UtFbp5OsfwgcSRkSnUb1V/CDtCoqDIn5ypjZDLerR0VthMCBKM/yo02jV3b0plKgPAbD+bHgU9aaiWNcySXcs1RyvOeWxcxkZzNnE0wJffrzJU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747235506; c=relaxed/simple;
	bh=JYsg4GBGu7X8acSehoDPknZmWOwg4HDhvlW5y2u+xS0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hcb+Zv1eXI0ul3PVb+GqLAMbd/o1xSHtNdOY4R+VWQFmCWS+8vNSyXuX5c6H/Op2m9+6UQDkR42hlW6GIhGoWNjBqg/meXU7FNToQ8hT+Hwgz/4ewQ1wekwLwdoJghaKJTNbX3qVj0ddc+OiJjYl3V7szr8xwXbP8BRUc2LzGQ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TDnbjE9H; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5B556C4CEED;
	Wed, 14 May 2025 15:11:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747235506;
	bh=JYsg4GBGu7X8acSehoDPknZmWOwg4HDhvlW5y2u+xS0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=TDnbjE9HEDLBe1QaFNmphHhODDrja+c9rBGNtYPBwELIWKQvYscSif2lWi/3sMC8Y
	 ZcMWEIQ76++TbC11PpxGW3KxTKuGuKOFo4AK2vzerCfLmfA0FDyjwGfoKqMHPKag56
	 DJUBTIOW9uAnkoMUZGx7gtqn3Y5YzcKrKT5VgFUp9PJm1d1HJN3clPEP5EX6btINl/
	 o68MQwxWg+FxXr47ajylY5yVX0LZtdeYcAvh3+/0fe4KNvgzFF4VUNeppCUhQ4rOv6
	 Cp1CaWc8Qi17mQGV99il7fVke1frQLRf7uKg3urwH4N5Ki3tW4Hgt7ghLOGoGsuQip
	 4ZQoq2wTtol3A==
From: Konrad Dybcio <konradybcio@kernel.org>
Date: Wed, 14 May 2025 17:10:32 +0200
Subject: [PATCH RFT v2 12/15] drm/msm/a6xx: Drop cfg->ubwc_swizzle override
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250514-topic-ubwc_central-v2-12-09ecbc0a05ce@oss.qualcomm.com>
References: <20250514-topic-ubwc_central-v2-0-09ecbc0a05ce@oss.qualcomm.com>
In-Reply-To: <20250514-topic-ubwc_central-v2-0-09ecbc0a05ce@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, 
 Akhil P Oommen <quic_akhilpo@quicinc.com>, Sean Paul <sean@poorly.run>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: Marijn Suijten <marijn.suijten@somainline.org>, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1747235442; l=1422;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=02lpGjZZUsNexzqxCrDQcZcbt5CcbZ+U+CYKmP30dAg=;
 b=lRcF9bzG3eYOlJ0ICMbtnj107R5FDgBAYugBbKk6ghiXGqK5sgd3ichMyFbihuMREGoU/oUvq
 BNkGUCoeE5bDu/EXshxpXH/ofR/FjbfrtTU+3XStq6SzRpDAVXuUy0e
X-Developer-Key: i=konrad.dybcio@oss.qualcomm.com; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

On A663 (SA8775P) the value matches exactly.

On A610, the value matches on SM6115, but is different on SM6125. That
turns out not to be a problem, as the bits that differ aren't even
interpreted.

Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 9 ++-------
 1 file changed, 2 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index ae0bb7934e7ed203aa3b81e28767de204f0a4d60..eaf468b67f97ff153e92a73a45581228fcf75e46 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -598,13 +598,10 @@ static int a6xx_calc_ubwc_config(struct adreno_gpu *gpu)
 	/* Copy the data into the internal struct to drop the const qualifier (temporarily) */
 	*cfg = *common_cfg;
 
-	cfg->ubwc_swizzle = 0x6;
 	cfg->highest_bank_bit = 15;
 
-	if (adreno_is_a610(gpu)) {
+	if (adreno_is_a610(gpu))
 		cfg->highest_bank_bit = 13;
-		cfg->ubwc_swizzle = 0x7;
-	}
 
 	if (adreno_is_a618(gpu))
 		cfg->highest_bank_bit = 14;
@@ -631,10 +628,8 @@ static int a6xx_calc_ubwc_config(struct adreno_gpu *gpu)
 		cfg->highest_bank_bit = 16;
 	}
 
-	if (adreno_is_a663(gpu)) {
+	if (adreno_is_a663(gpu))
 		cfg->highest_bank_bit = 13;
-		cfg->ubwc_swizzle = 0x4;
-	}
 
 	if (adreno_is_7c3(gpu))
 		cfg->highest_bank_bit = 14;

-- 
2.49.0


