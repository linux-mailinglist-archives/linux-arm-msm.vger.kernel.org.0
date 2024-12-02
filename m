Return-Path: <linux-arm-msm+bounces-39819-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 779BE9DFE40
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Dec 2024 11:07:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5A86216376B
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Dec 2024 10:07:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 01B1A1FCFE5;
	Mon,  2 Dec 2024 10:06:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="SVJObg6z"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1C8A1FCCE8
	for <linux-arm-msm@vger.kernel.org>; Mon,  2 Dec 2024 10:06:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733134008; cv=none; b=gE0ku/iTE25H+nJ27tgZPYvKnqgpSh+J7XHFxvvQVETIbvv3RixneS8soceYZcBpHvwyMGdY4G8ApAABqif0yY5g1+nAX+DIiwBa4tP3WvFv8m9tkrtUSHCtYXlVmwVvYG9RlzjWPyy19G+HR2LJRAeMypN/WiJiUhpGOWj0ddg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733134008; c=relaxed/simple;
	bh=abn+V/VW2R04+ivG5L+16aCpi+lS1tSzUvuSfrCga00=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Mwz+D7lviUcoijf1AI3TVlC0zZ5Y9tqVZIVPTkDtRBetOD1h9ZjDluiUv/6wI++koCyX2jNiOS6PG0XdaAkAktyIdd3MBrJyqxgO+wcrCfHUgg7XDp8SbdrLryc0TR+Q6xAuncVOLV53mmin6ARDtpJXjkMtpne1B3vteXHbjd4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=SVJObg6z; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-53de035ea13so4062051e87.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Dec 2024 02:06:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733134005; x=1733738805; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xY822JqISKSBvZvj0s20BCeD1NcNyIjNyABXPzWHxOc=;
        b=SVJObg6zJfiDvEXHW9wN/Xt66jjvvewqW+4A3W55is9NW4eOytgpjytrJlpqv7Xc03
         PYRStxpTv34/mXZjiW8/jKuyzWw86lby1b88EyEUMU3HaJRjqDEJUbeqbShvZqqqXVwS
         IN6G1cuQuS/SHHLd5fYK+ppHcgWdiFsII09A2xJa+zzh9QSJZhXUVhFhn2WDTOPQeY9r
         Wx1mye/jEz6obNzfDV/WTsxUCyoSkBjvFNw9gsbf/gae0sgE9jiZeza+uKBc5zhvirS5
         XHAMO9JOqPAbCz+YCYYgimv0J3/8Q8pHkTc2zKmSXW/wQHby750WjCX7/QPfrJKabu2O
         N/3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733134005; x=1733738805;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xY822JqISKSBvZvj0s20BCeD1NcNyIjNyABXPzWHxOc=;
        b=hdAZ4mYNdfyPOaF6iWRpc4Arkcjkydql7fu+3iCUJJg2nXI6aPFZrfIdZnvb1o7Wnc
         jQyaO870pFaETXmJffHcYsqJyUGEPJOMfKMOOTYU8KsI6dwEbrz+aJpgjtKlAe9t7wrp
         h8SgMbMTgujVorMs7uWX4DfxuxuQTn94MCFJ+38TwnCYATQw1x7+x44l9ILcXyE8IAJe
         AAc64s3byhehNaMR3PAASFcU16vZK8W4BwHcqXMx8is6zSsemrpFaEjwse/qc9A1QBR/
         uHsIjJ+0NEE2GFOfhxXQkdA5YwzpJqEr34b4Rl8eCBLxfZCdQCMGSruXcgREpVpPwGG3
         lHlw==
X-Forwarded-Encrypted: i=1; AJvYcCX4+vboUsVNg3h4DT8EX12U2uyYt7sFYsSccKfSwNJ7HYIDo6QywqeBBhY+RPvP3l5V41fN7xIXA4yW6LC3@vger.kernel.org
X-Gm-Message-State: AOJu0YxfI6ZLAsFM2vTxXsG7NPUhMKLHXCJxPckc9BbZls2IxnfmMsbI
	OQO4o6sCNJCFFTvlcbEakHyJy2JP/GZav0O6jRXYBuBs/qnNSzuLXfkqhbXiHT8=
X-Gm-Gg: ASbGnctucye4WEEyoW93ikNLOfuzi2D9AFdFc47gyJ9hNTF+m7uKn91n6aWXz88UFuA
	7LBIZIlq2ZU4BwyhTXtgsyaucwuFMm05+K/KYS96pr04YZqW5/xR9oDVIpvXvyNhNOm/NJ1NPq/
	fpAcFDBjSCDW6fLO74IpWEPVtoc5/Rw4s7Q7NJ0L2VzeD4Vuiu00KUcztoQaJAz4nY3HE5G72Rg
	6Mng7DOYbXjvB6JuTiflizUzB3TRAsGUGRmWfgQ5bU/7tbofMYsNXWzAA==
X-Google-Smtp-Source: AGHT+IFP4lsbN034uazTQ5cwRdJDA12eq3+eRm1H0gkVc9pxfx7WQYmk4WuTYNRM7wHcbbplGL51oA==
X-Received: by 2002:a05:6512:3e1e:b0:53d:a9c4:9ed6 with SMTP id 2adb3069b0e04-53df00dc9a4mr9334930e87.25.1733134004996;
        Mon, 02 Dec 2024 02:06:44 -0800 (PST)
Received: from umbar.lan ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53df646f191sm1418314e87.136.2024.12.02.02.06.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Dec 2024 02:06:44 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 02 Dec 2024 12:06:32 +0200
Subject: [PATCH v2 02/14] drm/msm/dp: fix msm_dp_utils_pack_sdp_header
 interface
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241202-fd-dp-audio-fixup-v2-2-d9187ea96dad@linaro.org>
References: <20241202-fd-dp-audio-fixup-v2-0-d9187ea96dad@linaro.org>
In-Reply-To: <20241202-fd-dp-audio-fixup-v2-0-d9187ea96dad@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Paloma Arellano <quic_parellan@quicinc.com>
Cc: Douglas Anderson <dianders@chromium.org>, 
 Stephen Boyd <swboyd@chromium.org>, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2535;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=abn+V/VW2R04+ivG5L+16aCpi+lS1tSzUvuSfrCga00=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnTYasgk4X/0Ogz40yCleICJWnJzduNvDdpABSX
 EAM9EF7/gWJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ02GrAAKCRCLPIo+Aiko
 1fp6CACtGFwJ9kceGBynmVPKNUl3XYUj79S1auIEEtiA3kP/JftPdu5WqzGTXBEZVw6xwsmATbO
 cOaI7cYBxA6aFk6raoT346wHwii/UrN2/rvHd2ZAuTGUlp+YfxR/m3/Jr6aS/aekEvlpJ4DWjud
 e/O9fpQU8CkiPREcnFOdwfBa+MLSV3zV/gQ7XgpcqOu+Ftdyjx0sT5TU211n8TGFHt1ooX4Ryvk
 0p/hawRQ7uiloIIyMFJ3cmTPChJxRNZQIZ5u4qlW4KH0fr9OikX6kVZDJNXPHXl9Cvy5OtYZ4cy
 GrOvwQeH4lSMso097djgxo6OIFbZramAvOViCxmINzYqZ5Zk
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

The msm_dp_utils_pack_sdp_header() accepts an unlimited-size u32 pointer
for the header output, while it expects a two-element array. It performs
a sizeof check which is always true on 64-bit platforms (since
sizeof(u32*) is 8) and is always falce on 32-bit platforms. It returns
an error code which nobody actually checks.

Fix the function interface to accept u32[2] and return void, skipping
all the checks.

Fixes: 55fb8ffc1802 ("drm/msm/dp: add VSC SDP support for YUV420 over DP")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/dp/dp_utils.c | 10 +---------
 drivers/gpu/drm/msm/dp/dp_utils.h |  2 +-
 2 files changed, 2 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_utils.c b/drivers/gpu/drm/msm/dp/dp_utils.c
index 2a40f07fe2d5e20114a7692d1269bb8fd5bddbbd..4a5ebb0c33b85e3d55eb974d74c1f54591301b35 100644
--- a/drivers/gpu/drm/msm/dp/dp_utils.c
+++ b/drivers/gpu/drm/msm/dp/dp_utils.c
@@ -74,14 +74,8 @@ u8 msm_dp_utils_calculate_parity(u32 data)
 	return parity_byte;
 }
 
-ssize_t msm_dp_utils_pack_sdp_header(struct dp_sdp_header *sdp_header, u32 *header_buff)
+void msm_dp_utils_pack_sdp_header(struct dp_sdp_header *sdp_header, u32 header_buff[2])
 {
-	size_t length;
-
-	length = sizeof(header_buff);
-	if (length < DP_SDP_HEADER_SIZE)
-		return -ENOSPC;
-
 	header_buff[0] = FIELD_PREP(HEADER_0_MASK, sdp_header->HB0) |
 		FIELD_PREP(PARITY_0_MASK, msm_dp_utils_calculate_parity(sdp_header->HB0)) |
 		FIELD_PREP(HEADER_1_MASK, sdp_header->HB1) |
@@ -91,6 +85,4 @@ ssize_t msm_dp_utils_pack_sdp_header(struct dp_sdp_header *sdp_header, u32 *head
 		FIELD_PREP(PARITY_2_MASK, msm_dp_utils_calculate_parity(sdp_header->HB2)) |
 		FIELD_PREP(HEADER_3_MASK, sdp_header->HB3) |
 		FIELD_PREP(PARITY_3_MASK, msm_dp_utils_calculate_parity(sdp_header->HB3));
-
-	return length;
 }
diff --git a/drivers/gpu/drm/msm/dp/dp_utils.h b/drivers/gpu/drm/msm/dp/dp_utils.h
index 88d53157f5b59e352a29075e4e8deb044a6de3bd..2e4f98a863c4cb971e621ac24b8b58f035236e73 100644
--- a/drivers/gpu/drm/msm/dp/dp_utils.h
+++ b/drivers/gpu/drm/msm/dp/dp_utils.h
@@ -31,6 +31,6 @@
 u8 msm_dp_utils_get_g0_value(u8 data);
 u8 msm_dp_utils_get_g1_value(u8 data);
 u8 msm_dp_utils_calculate_parity(u32 data);
-ssize_t msm_dp_utils_pack_sdp_header(struct dp_sdp_header *sdp_header, u32 *header_buff);
+void msm_dp_utils_pack_sdp_header(struct dp_sdp_header *sdp_header, u32 header_buff[2]);
 
 #endif /* _DP_UTILS_H_ */

-- 
2.39.5


