Return-Path: <linux-arm-msm+bounces-60626-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C5F66AD1DC3
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Jun 2025 14:31:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E16FF1888444
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Jun 2025 12:31:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 93A5A2641E8;
	Mon,  9 Jun 2025 12:25:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Wq3JmM9K"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F431263F44;
	Mon,  9 Jun 2025 12:25:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749471902; cv=none; b=H/fye/RGpL38rpZMrNwX3tkuLm61fVrBFVn+DlybKsV5GGFI0lt5IoT7CE70nK//HV+qA5eXwQQoRnM6Jx+vUfPUIj7BPLGcJqk8o/9XclZQcFKgX4CmkNv3yTfdoh5h175+2oPdR4rDjdKP3O8EOMbaTPJI6Xs08E3SADeOJnY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749471902; c=relaxed/simple;
	bh=xvA5JDAxBQguzpuEdnQLdzXYmBdFV8V2PLGrKthBfco=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=o9dZXT64AAabWaYSYNMrkpYnhK1cDWw3rzGA6ipSokCQ3jgZXlcU3oEmULicS0f40YlVHK3N+2dLrel0+Ia5XVYy2Am5DVWUh57Wucye+Bjk/wUPLuyVNSJlW1KKTRr5fJGXEkMbQb8RIuXFcTf+3MXQtvPBb9mARqANEIWVx98=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Wq3JmM9K; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55995ujh026582;
	Mon, 9 Jun 2025 12:24:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6K/9mlbJ+VE4/Rl/GSCBDhLkQFJyku3IF4fes+JKkRg=; b=Wq3JmM9K4Mwy40sA
	NcdKgB1RuQ0TgGR4Pjv2MKKLNxFMVlslss1nJa9Hkn3hJm9Ht4TpJWM0s6f0k5Oy
	fewpbXeOGFpBciKPgvVhclLwNgc2+kXhLhlqvFJdDU9vLIR43csxLCy9n8G+8N30
	vwXQRAVJaIo3Pg9BsWhHXlMw02ijbpmImOF7ffJ3haMHBe8CJbBO3KRLsydbHjfV
	9hZ4iwPhU1zxrdAS5y0rBFE0cqwaYZ8MHG7oeawSsZAIasyYsmnsDruoLqp92Atb
	w5EyScNRaCNeBuEwjmJl2M966xc+Xe1FkDHyR4F6FvKbEmHbQizaJp1TS3XUMui3
	tJdO3Q==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 474dn65vwx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 09 Jun 2025 12:24:51 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 559COoGt002077
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 9 Jun 2025 12:24:50 GMT
Received: from cse-cd01-lnx.ap.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 9 Jun 2025 05:24:46 -0700
From: Yongxing Mou <quic_yongmou@quicinc.com>
Date: Mon, 9 Jun 2025 20:21:51 +0800
Subject: [PATCH v2 32/38] drm/msm: add support for non-blocking commits
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250609-msm-dp-mst-v2-32-a54d8902a23d@quicinc.com>
References: <20250609-msm-dp-mst-v2-0-a54d8902a23d@quicinc.com>
In-Reply-To: <20250609-msm-dp-mst-v2-0-a54d8902a23d@quicinc.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov
	<lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang
	<jessica.zhang@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten
	<marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, "Simona
 Vetter" <simona@ffwll.ch>
CC: <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <freedreno@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
        "Yongxing
 Mou" <quic_yongmou@quicinc.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1749471763; l=1813;
 i=quic_yongmou@quicinc.com; s=20241121; h=from:subject:message-id;
 bh=WemJZbQwLWPltCU8OpRXtEzwTUoxAcsQYN9MkD6VWfI=;
 b=gqt5n/2M57yEnttRdEcPLespOXxcMpmDSoLte85+NxV779kqst2xW7sX7Vg16AiIsiIbkoSzm
 mC/tPWtv9oUAbbl1hyjmXdtZ+XNBcvHdmGzER99oveMWHRMg/aaUsua
X-Developer-Key: i=quic_yongmou@quicinc.com; a=ed25519;
 pk=zeCnFRUqtOQMeFvdwex2M5o0Yf67UHYfwCyBRQ3kFbU=
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA5MDA5MyBTYWx0ZWRfX8gcoFU6Yar9j
 wH1hoFbuH5Ahlu/BzPCQoHAt5E0OApMRVqcu6jzg8duRGKnlR7jBUUKxiPIm2A/BmOA7tkCPtXN
 1rx4oI/+XhcQQ0kebpc8edJfJtMoTVEaGzdLdT0PPwTVu+t/0HGu1PRqENSSS5NAFAx0fO5ieA2
 WUxXJ25kTIHGvgxwOoja3TK6/ZnKNzu3obYc+TVk+ZB2CkTLSKfquM7i8XOP8vEUlRIkvC1b/Oq
 BYonAUHcgDdpo1x1daQTYO5h5lGVItWikLLycRLVmSHTXTPkHEUNBxBOQNMRFazEibsh45pI+qG
 U0jJmkG6NhxhU9i0Dp13PGHrfpS4HMuqnmYsjpkf9CpN5uIlGELLcNHcvywstejEJmJJRPtl4Iy
 xpexq1bSlzp1kHfcncuWiA6GMKkQIfK63XdmYcjPqjMWyU+mBalYKCZZgJ4sP//g2sYWqD62
X-Proofpoint-GUID: -Q3s2Nv9yWYQNAyeFJ-V6Zbhnu4Gq_Oj
X-Authority-Analysis: v=2.4 cv=FaQ3xI+6 c=1 sm=1 tr=0 ts=6846d293 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=COk6AnOGAAAA:8
 a=pGLkceISAAAA:8 a=jKAzz6rg_GqWmbSyGTEA:9 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: -Q3s2Nv9yWYQNAyeFJ-V6Zbhnu4Gq_Oj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-09_05,2025-06-05_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 bulkscore=0 phishscore=0 adultscore=0
 mlxlogscore=999 mlxscore=0 spamscore=0 suspectscore=0 malwarescore=0
 priorityscore=1501 clxscore=1015 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506090093

From: Abhinav Kumar <quic_abhinavk@quicinc.com>

Hook up the mst framework APIs with atomic_commit_setup() and
atomic_commit_tail() APIs to handle non-blocking commits.

Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
---
 drivers/gpu/drm/msm/msm_atomic.c | 3 +++
 drivers/gpu/drm/msm/msm_kms.c    | 2 ++
 2 files changed, 5 insertions(+)

diff --git a/drivers/gpu/drm/msm/msm_atomic.c b/drivers/gpu/drm/msm/msm_atomic.c
index 87a91148a731dc911f30695add4c8f5002770220..655a5c90487d7176422c2be630aa029d2c64042e 100644
--- a/drivers/gpu/drm/msm/msm_atomic.c
+++ b/drivers/gpu/drm/msm/msm_atomic.c
@@ -4,6 +4,7 @@
  * Author: Rob Clark <robdclark@gmail.com>
  */
 
+#include <drm/display/drm_dp_mst_helper.h>
 #include <drm/drm_atomic_uapi.h>
 #include <drm/drm_vblank.h>
 
@@ -221,6 +222,8 @@ void msm_atomic_commit_tail(struct drm_atomic_state *state)
 
 	trace_msm_atomic_commit_tail_start(async, crtc_mask);
 
+	drm_dp_mst_atomic_wait_for_dependencies(state);
+
 	kms->funcs->enable_commit(kms);
 
 	/*
diff --git a/drivers/gpu/drm/msm/msm_kms.c b/drivers/gpu/drm/msm/msm_kms.c
index 35d5397e73b4c5cb90b1770e8570277e782be7ec..ec33afe27506892591e4c3e2671dab7a872b5525 100644
--- a/drivers/gpu/drm/msm/msm_kms.c
+++ b/drivers/gpu/drm/msm/msm_kms.c
@@ -10,6 +10,7 @@
 #include <linux/sched/mm.h>
 #include <uapi/linux/sched/types.h>
 
+#include <drm/display/drm_dp_mst_helper.h>
 #include <drm/drm_drv.h>
 #include <drm/drm_mode_config.h>
 #include <drm/drm_vblank.h>
@@ -28,6 +29,7 @@ static const struct drm_mode_config_funcs mode_config_funcs = {
 
 static const struct drm_mode_config_helper_funcs mode_config_helper_funcs = {
 	.atomic_commit_tail = msm_atomic_commit_tail,
+	.atomic_commit_setup = drm_dp_mst_atomic_setup_commit,
 };
 
 static irqreturn_t msm_irq(int irq, void *arg)

-- 
2.34.1


