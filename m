Return-Path: <linux-arm-msm+bounces-57197-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 59D76AAEEE3
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 May 2025 01:01:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4A9693AF646
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 May 2025 23:01:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 105501C84BF;
	Wed,  7 May 2025 23:01:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="e/xMjO/M"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B3A535957;
	Wed,  7 May 2025 23:01:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746658884; cv=none; b=fOBzVFagidcYVr5ZhJABBiGz0nIc9u5G4KFJYVoq4blygJ4W2I3/wgwX8utIByTVCnxJm1ydfHEcGnukNrD0EFQlUJ/t1Q7VIrYKpcdOrG7MSL/uG/7bB2vwoh+QA4J626YDLR6AZUrjN+M9jbSkw93Bkwq61U4EgodWSzcCaeg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746658884; c=relaxed/simple;
	bh=IJGD8WjSwE0pEbGjAHMxWpU5Ipj2/WSn14WYwHmI8Sk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=an1a5ourzGbs/ZI6C3JlNO2XYO/XSvKWEC6ma3Y9aSbyQqGIpJndxodimdhNHP2qo2c4xjjfzKuczyVpOJS6ITcWEl3hE4LkNV2LAk0zNsXpTbqzGZ9/vHyVKlBUR8K6/xlk5AUTCpe221lAt4xLeYB+PA+WhO1fEEBYyULRkyw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=e/xMjO/M; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-5fc3f0a5506so649654a12.0;
        Wed, 07 May 2025 16:01:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746658880; x=1747263680; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=d29g+oKQGWaixqIeAK1Ckbfb+nM3h9Ahj4fH0G4rL1g=;
        b=e/xMjO/M0xNtioFM6ry5/33ecjWeykmkNzZcGvNKRD7QH/X2rnYnn4GfkBKhMlw4/i
         oBkKytOR+FDAZIBWt6AF45EAfQFdcdjshw/qsfrRAjsYvvl9mJGWPsfDwtiUWKqa/0o8
         H39/or0r190Q1yjkNoQyDsAeC5aMsKLLxekI21MucFbNl4m4WF5aDTYYfCFK5J6imdyq
         3IDW8IsUHeZXlUUo8KJxJnXX83YBLznrTIKwESpQnLl47Qg4TSprG6Ic4LFMAmUkNSis
         mZW9SutpOkKq+cYMf58mP1SKkAqR8qs2tr8U63mb+6XAWNpcYLKySOuQgLK0ksFxfp1I
         8S9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746658880; x=1747263680;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=d29g+oKQGWaixqIeAK1Ckbfb+nM3h9Ahj4fH0G4rL1g=;
        b=oBE2PDw+txWK6G1T/rPgIaDPX142jJQxDQmN48101mwWsavp0cFgc1m5VxklZH7XpM
         5+17Js2mdFZqNl4tlb9fW6w8OFkS3Ho/3LTqTIoxd1A9yNtH8FecrB9cNKM3tz5GNgxl
         ybyFnG4pJOFy8u5UTzBh/WjO8BcqY3VwbHiOMJra0NcDU/id3KDfQQMOks2c4xqhgdgR
         Njx6PwSiY5SkPJ8mfk+jjJrC6nsJ8PDWz9JICCZq1LhbCuEtxY9Qy4YmNnPB2pTmPZFO
         k5SyWVAYx1yXVvvvK78EvD+RyYhhwg8bozSrumc9I8nhslktDut7Qjg3YFzDFLBit186
         9viw==
X-Forwarded-Encrypted: i=1; AJvYcCUkFQHkJZo9bJVwEM+fC/UVENqHh1ldMOOS5RBnwDEv+6VkQgdCPQED5jU9Ta7pwGjDqzYP+JdvRtpPeL1N@vger.kernel.org, AJvYcCVcyW4AzNXOBZjhF+LwtM1VcAISZND0KhAeKCKvYtyQ835gRaw+77d5St+RvU1BTZEC+qBaC2uiroRY61HD@vger.kernel.org
X-Gm-Message-State: AOJu0YzyAIkRa95UJVCHEfHDtRlnjV6IsKrpCIJOMFArUR4KX77Yy7e3
	xTsHR0BWNmG/xXqw+A+jvsq/b0wK4gzV09SnVc4atclBf2Lohvo=
X-Gm-Gg: ASbGncs3CIRfPYas3pEsa5cTAw9DOV+sD2FFs2d33xkLk3FnzAt+fkQVa/KZdFNEf6Z
	3hQBafqaFbtik9qcBAaYhWE5VcMW1QMXvSLQFD/xMxDzp1mRvP8Ujf5q8qLmoLWZ6/O2buWrk8R
	8KAjijeEWy3RLqXlrpmXCdbv04ehdMk/HcB81q7pJMqWx1M9DhbDxsezEKfSsVAeUfq3XAeV9kd
	PHuBkc6T3U/HPlUFCEiJBqzUcwMa6aoU4wwDzg7fg/xa2jSN9J3eDdd4Nqj0uSoZ3fP4eMXras9
	6oktU5RXhAMZMlv/SPIcKIP5T8kwWehfbR8KrdSPmF5r1xVQkTg9TOvI
X-Google-Smtp-Source: AGHT+IEIfm5RN/LToCmwcsXr0u+32oBo8dQ4kyit6fh9zoBiJPeVih3IpeDTTICh9ZavlCdXci5edA==
X-Received: by 2002:a05:6402:5c8:b0:5fa:a635:481c with SMTP id 4fb4d7f45d1cf-5fbe9e51d2dmr4345754a12.17.1746658880134;
        Wed, 07 May 2025 16:01:20 -0700 (PDT)
Received: from alex-x1.lan ([84.226.118.249])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5fa777c8b12sm10507906a12.24.2025.05.07.16.01.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 May 2025 16:01:18 -0700 (PDT)
From: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>,
	Dmitry Baryshkov <lumag@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Cc: Rob Clark <robdclark@gmail.com>,
	Sean Paul <sean@poorly.run>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	laurentiu.tudor1@dell.com,
	abel.vesa@linaro.org,
	johan@kernel.org,
	Aleksandrs Vinarskis <alex.vinarskis@gmail.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Jessica Zhang <quic_jesszhan@quicinc.com>,
	Johan Hovold <johan+linaro@kernel.org>
Subject: [PATCH v5 1/4] drm/msm/dp: Fix support of LTTPR initialization
Date: Thu,  8 May 2025 00:58:59 +0200
Message-ID: <20250507230113.14270-2-alex.vinarskis@gmail.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250507230113.14270-1-alex.vinarskis@gmail.com>
References: <20250507230113.14270-1-alex.vinarskis@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Initialize LTTPR before msm_dp_panel_read_sink_caps, as DPTX shall
(re)read DPRX caps after LTTPR detection, as required by DP 2.1a,
Section 3.6.7.6.1.

Fixes: 72d0af4accd9 ("drm/msm/dp: Add support for LTTPR handling")

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
Tested-by: Jessica Zhang <quic_jesszhan@quicinc.com> # SA8775P
Tested-by: Johan Hovold <johan+linaro@kernel.org>
Tested-by: Rob Clark <robdclark@gmail.com>
---
 drivers/gpu/drm/msm/dp/dp_display.c | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index bbc47d86ae9e..fc07cce68382 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -367,12 +367,12 @@ static int msm_dp_display_send_hpd_notification(struct msm_dp_display_private *d
 	return 0;
 }
 
-static void msm_dp_display_lttpr_init(struct msm_dp_display_private *dp)
+static void msm_dp_display_lttpr_init(struct msm_dp_display_private *dp, u8 *dpcd)
 {
 	u8 lttpr_caps[DP_LTTPR_COMMON_CAP_SIZE];
 	int rc;
 
-	if (drm_dp_read_lttpr_common_caps(dp->aux, dp->panel->dpcd, lttpr_caps))
+	if (drm_dp_read_lttpr_common_caps(dp->aux, dpcd, lttpr_caps))
 		return;
 
 	rc = drm_dp_lttpr_init(dp->aux, drm_dp_lttpr_count(lttpr_caps));
@@ -385,12 +385,17 @@ static int msm_dp_display_process_hpd_high(struct msm_dp_display_private *dp)
 	struct drm_connector *connector = dp->msm_dp_display.connector;
 	const struct drm_display_info *info = &connector->display_info;
 	int rc = 0;
+	u8 dpcd[DP_RECEIVER_CAP_SIZE];
 
-	rc = msm_dp_panel_read_sink_caps(dp->panel, connector);
+	rc = drm_dp_read_dpcd_caps(dp->aux, dpcd);
 	if (rc)
 		goto end;
 
-	msm_dp_display_lttpr_init(dp);
+	msm_dp_display_lttpr_init(dp, dpcd);
+
+	rc = msm_dp_panel_read_sink_caps(dp->panel, connector);
+	if (rc)
+		goto end;
 
 	msm_dp_link_process_request(dp->link);
 
-- 
2.45.2


