Return-Path: <linux-arm-msm+bounces-30821-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D907796CD32
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Sep 2024 05:26:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 45E0528608C
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Sep 2024 03:26:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 891F5148823;
	Thu,  5 Sep 2024 03:26:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="DXfXB1Fv"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD98C145B27
	for <linux-arm-msm@vger.kernel.org>; Thu,  5 Sep 2024 03:26:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725506780; cv=none; b=CTO9Odl119dy51F1nofeXyw0/opsyQlx9LnzMLaMjuwv4iIjHlyhK9eQr3mMrGzP47/oOutylaIUQvZfXjKBkgKVdKeDm1isPvN7LKngq7P1vwRkdT7kxqkzTSE++3nefLDbREq/DXoMNfqgsueyHVjijd2rVZT3kE4lJyZNu6Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725506780; c=relaxed/simple;
	bh=F9C+Oqk1Y88LBjszt+kJ0vjfDky4vE/BJ9fNTH+vsZM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bP5sQuqauqukkepXX3teGFJ8yYauZPHPkgJyKAR+7Do2rZgTzS85OPecBnUVVMwwFyj1H3+kQVViX+75L9wKfSRJduLhqS69Fj3p6vJG1Z4fpMi+i1yYsTQjxApSmH5g39yTcv48DOS+du/4z/WWHt0PbvXlVHe+WkwKlpuMIp8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=DXfXB1Fv; arc=none smtp.client-ip=209.85.208.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-2f401c20b56so12454491fa.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 04 Sep 2024 20:26:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1725506777; x=1726111577; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YU8j84JZB809IcncSQWLx7Izd+21A+I9iJZxkqhYAfM=;
        b=DXfXB1Fv/CRJ9sxfUwXzofPa7qmpZ3m1w3e7EF9SXMslBx/g9/kMQkXzo+I92lIZQ9
         oSdfjM2cje/buGIgB+ByVBH/Z8+eCx7eK3O05XXUYPfvUJhpez/+Okqmq//3DxgQzD+Y
         nIblF3WYRIyGDMMzpVu/owfVSYN2eo/5bqBxF5yZfsNX9c93RlrNrOTKlsngfPtA3PtC
         TOBklC2z/AwmEsjXIjeqnHc3gjWrRt5vodu4I3ToJ0amZPQmMyVd5xSAIeQF/l76SA3e
         T8xuTvs/cKTbnBAneEY9O8PQeUV4Unfy6bk38dv32Rynr0wkHt14QNbOqLoyxYdqYvUb
         p2wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725506777; x=1726111577;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YU8j84JZB809IcncSQWLx7Izd+21A+I9iJZxkqhYAfM=;
        b=np8+DcFLsBQuw76bv7ou9YajJum9BknAtjYzzX4weiXFFHHHQrR/3UzJjFvsz6ZjL3
         ZnsMjbeRSENbntN7TYSVhbfBMy5j7UT4bv8/FdnMzu4EBRWC8l+MvywFLjJVaGBEuMHF
         K+8LjTp3hZHLAdEMdMwBvx3ZhbG3UZ4Ob4G8/eUSBncZM4LdlJk9YSHEAnJyS45hzBFf
         JcRp4KbOXcBDGVh5HOtLGVMcgiKoxYp/p/n4snYukrnRpBUnmKwIMyawVpXVJ6NJssgF
         qmT803AvAkPm/4j31sMXVd5xcP9v9Nxnye2QlThIE+ZyOOLVZhd8dLM5xtSHRjaf2vLB
         crcQ==
X-Gm-Message-State: AOJu0YxsNYIfxqgagmRHrd3QgqOBWVCxUoD+eTtlk3RuNcv6AEnCGB82
	SJ8XqIXk8X7Rex3KoikNMDnJTs/0/RcZbEiCwL5PJbT4h8CXiragKrZq54moz/4=
X-Google-Smtp-Source: AGHT+IGsEWNXC2f1c3D0I+zxRSTqAMuxXvpOEo91BcFHWNG5/aUwRnJA/fWQmf3Mdhco8AyTjrh9zw==
X-Received: by 2002:a05:6512:1188:b0:52f:441:bdd6 with SMTP id 2adb3069b0e04-535674e7e79mr1533655e87.0.1725506776531;
        Wed, 04 Sep 2024 20:26:16 -0700 (PDT)
Received: from umbar.lan ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53540841a3csm2533860e87.226.2024.09.04.20.26.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Sep 2024 20:26:16 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 05 Sep 2024 06:26:13 +0300
Subject: [PATCH 1/3] drm/msm/dpu: on SDM845 move DSPP_3 to LM_5 block
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240905-dpu-fix-sdm845-catalog-v1-1-3363d03998bd@linaro.org>
References: <20240905-dpu-fix-sdm845-catalog-v1-0-3363d03998bd@linaro.org>
In-Reply-To: <20240905-dpu-fix-sdm845-catalog-v1-0-3363d03998bd@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Sumit Semwal <sumit.semwal@linaro.org>, 
 Sravanthi Kollukuduru <skolluku@codeaurora.org>, 
 Rajesh Yadav <ryadav@codeaurora.org>, 
 Archit Taneja <architt@codeaurora.org>, 
 Jami Kettunen <jami.kettunen@somainline.org>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Jeykumar Sankaran <jsanka@codeaurora.org>, 
 Chandan Uddaraju <chandanu@codeaurora.org>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1116;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=F9C+Oqk1Y88LBjszt+kJ0vjfDky4vE/BJ9fNTH+vsZM=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBm2STW6BXa+LG+21cLphfZoxD9U8XBc0s/zxIHx
 DMxe6ZCcLCJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZtkk1gAKCRCLPIo+Aiko
 1WD1B/sERkzjfa0PtufXwoDP1wA9cOwPVuN3B1cfX80GzU4cgDDJM7bYvRJFk3bQDDYrHfaIBjz
 37smnHdSIuQU4E5JKPFz93dYiXqozXYeuCBa+0TnYxGB55Hqn1WS21h/PLZWY2rLgHL0tHGcsCn
 WZtBoxTh+TbXooB/CaGb5rbFCBF0hLSIzzCS4NzuMzrTk1uads2oo+87hHNZYpFGs7JkuYS4G8e
 JCnuei9zRkTecd8AlcWT16hbXa7vFjJM+DprcEaAxSc1hSq2hZ5+t1vIoiqX2zlDVXwojGKiCV5
 evZcaBtnsmpygJT8XRK2J1ImcrI81Pejvwl68qeMJ4jZHq4i
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

On the SDM845 platform the DSPP_3 is used by the LM_5. Correct
corresponding entries in the sdm845_lm array.

Fixes: c72375172194 ("drm/msm/dpu/catalog: define DSPP blocks found on sdm845")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h
index 7a23389a5732..59eeea3dd2e9 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h
@@ -161,7 +161,6 @@ static const struct dpu_lm_cfg sdm845_lm[] = {
 		.features = MIXER_SDM845_MASK,
 		.sblk = &sdm845_lm_sblk,
 		.pingpong = PINGPONG_NONE,
-		.dspp = DSPP_3,
 	}, {
 		.name = "lm_4", .id = LM_4,
 		.base = 0x0, .len = 0x320,
@@ -175,6 +174,7 @@ static const struct dpu_lm_cfg sdm845_lm[] = {
 		.sblk = &sdm845_lm_sblk,
 		.lm_pair = LM_2,
 		.pingpong = PINGPONG_3,
+		.dspp = DSPP_3,
 	},
 };
 

-- 
2.39.2


