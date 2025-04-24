Return-Path: <linux-arm-msm+bounces-55259-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 5027FA9A218
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Apr 2025 08:29:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 45CB446083D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Apr 2025 06:27:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BDD1A1F3D5D;
	Thu, 24 Apr 2025 06:24:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Xt2b3oIR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68A291DF990;
	Thu, 24 Apr 2025 06:24:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745475899; cv=none; b=jZUzxgrFQcy80uPf33nFjqkKCyuF5UVO9z4TjltIApoFF0A7cCbhhrYKR18cMpMRPSapf42m8/dpo8wemMq7HdQ2f9jk+q3cIKhZPqLM5fjGvwUUZmaYlkDUXN33ZzKpcsFLaej1s9sigNNRntEtiLXYQYp59dby4RRLXmzBuow=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745475899; c=relaxed/simple;
	bh=SdKoJ+wrgbmbqtCuuf5Qj63KLZ54K3vcbb8D6elfkjs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=XDWHDJ2sxfSOcES22nrZhYX5Q8Ona/ICgnS9PHB3ZuVvZnFnpOLV+ulE0VGDXWWd4KA2Xv/xqyBNRNLY50z9ICK9sL7r/ZuR5Rb8Js3bv3W+AxfldUJxfgFp+IdJ1FiYKg0sGBmd0g5C2SY+91Vt+PQOMtJLB/VIKorK40G4ndg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Xt2b3oIR; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53O0F63K028369;
	Thu, 24 Apr 2025 06:24:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=hVCi7gtLhpA
	XdSAk9dtD/5Maw7VEwUB2kEsjxp7ZhWY=; b=Xt2b3oIR5qTBVm6UzG6rkDmjbAz
	RYxhwoD2n3e3OJ3DsLJLFJqRxr6SKCG2zpf5MiVtJPR2LvJ4off2fE+PMu3qHXLP
	8YB2DroVTNZl6udb45hulbNnxWJkzIuhQ/cEAZdHu+WeJB37pIkv9Ek0+0/CFxkl
	uV5uwx4XD9OK0JZQBwW1R5r/CNWxQAXN3W6u+Uz4ic5t3tAIAzrlpoVB4oNFA/L8
	671jfZVlTyoiQ238aU2zEar7i9FDKjKcr5x0elh8ZqnC8bAwWo8370VAvBNE+tyF
	0OmuMG+TUkwcFI/NR+Fq4wHkqh1xScCuelCJuusgo0+dCFrTPpIk2+7AKiw==
Received: from apblrppmta02.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jgy4epv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 24 Apr 2025 06:24:40 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 53O6OZcg003919;
	Thu, 24 Apr 2025 06:24:36 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 4644wn010r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 24 Apr 2025 06:24:36 +0000
Received: from APBLRPPMTA02.qualcomm.com (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 53O6Oa24003994;
	Thu, 24 Apr 2025 06:24:36 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com (hu-amakhija-hyd.qualcomm.com [10.213.99.91])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 53O6OZkY003947
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 24 Apr 2025 06:24:36 +0000
Received: by hu-devc-hyd-u22-c.qualcomm.com (Postfix, from userid 4090850)
	id DBE205A0; Thu, 24 Apr 2025 11:54:33 +0530 (+0530)
From: Ayushi Makhija <quic_amakhija@quicinc.com>
To: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc: Ayushi Makhija <quic_amakhija@quicinc.com>, robdclark@gmail.com,
        dmitry.baryshkov@oss.qualcomm.com, sean@poorly.run,
        marijn.suijten@somainline.org, andersson@kernel.org, robh@kernel.org,
        robh+dt@kernel.org, krzk+dt@kernel.org, konradybcio@kernel.org,
        conor+dt@kernel.org, andrzej.hajda@intel.com,
        neil.armstrong@linaro.org, rfoss@kernel.org,
        Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
        jernej.skrabec@gmail.com, quic_abhinavk@quicinc.com,
        quic_rajeevny@quicinc.com, quic_vproddut@quicinc.com,
        quic_jesszhan@quicinc.com,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: [PATCH v5 11/11] drm/bridge: anx7625: change the gpiod_set_value API
Date: Thu, 24 Apr 2025 11:54:31 +0530
Message-Id: <20250424062431.2040692-12-quic_amakhija@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250424062431.2040692-1-quic_amakhija@quicinc.com>
References: <20250424062431.2040692-1-quic_amakhija@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI0MDA0MCBTYWx0ZWRfX6FarFfVhAbTP 3l0QX11ANsmg3oGoZJVONa5RykAevxrZLnoSTSqA7RwSzO26T0Q5PbSjjK9EXUK8rCMueEIVQ1G Gdep7mxxcBwsjXDuWKIAkeTvWGBBqhLV762z2AiAHVSpkGO3ksxLem9E2hTbCJ1syoj3duW6i+s
 JJ8XA3vTfZz/smRLuHReyj4C3+9h4LZmCIoioIbiPuYEH6rnZfrXqxsdvTTVY6fOdzSl4DdStqE 42a7fy39g+AeG9gl19RXdcoR2NU5ReDHmMtnAz9kPbjuDyhmmvRr00kTFQ6Dr2Y7ycwtqCZzbvp MLpAeNsjueSrGADWYqiSxRP1RJSmYqycor6AXpbMh6uJQ7TLM7pfiydeRSaUCIUUFt+uLtpSAWa
 6XBJq2bOeCW5I2bFiiaBWNzrkBfM1s4udQWFc8++3k1ItBViMGu97KAiEqdvOXy+3nnkp+zg
X-Proofpoint-GUID: 3Fjfht5TouTk55Xyv179oXI4V3hsGabw
X-Proofpoint-ORIG-GUID: 3Fjfht5TouTk55Xyv179oXI4V3hsGabw
X-Authority-Analysis: v=2.4 cv=M5VNKzws c=1 sm=1 tr=0 ts=6809d928 cx=c_pps a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17 a=XR8D0OoHHMoA:10 a=COk6AnOGAAAA:8 a=KKAkSRfTAAAA:8 a=qu7jSu7UeuI-ykz2460A:9 a=TjNXssC_j7lpFel5tvFf:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.680,FMLib:17.12.80.40
 definitions=2025-04-24_02,2025-04-22_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0
 lowpriorityscore=0 adultscore=0 spamscore=0 priorityscore=1501 mlxscore=0
 mlxlogscore=999 malwarescore=0 impostorscore=0 clxscore=1015
 suspectscore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504240040

Use gpiod_set_value_cansleep() instead of gpiod_set_value()
to fix the below call trace in the boot log:

[    5.690534] Call trace:
[    5.690536]  gpiod_set_value+0x40/0xa4
[    5.690540]  anx7625_runtime_pm_resume+0xa0/0x324 [anx7625]
[    5.690545]  __rpm_callback+0x48/0x1d8
[    5.690549]  rpm_callback+0x6c/0x78

Certain GPIO controllers require access via message-based buses
such as I2C or SPI, which may cause the GPIOs to enter a sleep
state. Therefore, use the gpiod_set_value_cansleep().

Signed-off-by: Ayushi Makhija <quic_amakhija@quicinc.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/bridge/analogix/anx7625.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/bridge/analogix/anx7625.c b/drivers/gpu/drm/bridge/analogix/anx7625.c
index 365d1c871028..f6f730262511 100644
--- a/drivers/gpu/drm/bridge/analogix/anx7625.c
+++ b/drivers/gpu/drm/bridge/analogix/anx7625.c
@@ -1257,10 +1257,10 @@ static void anx7625_power_on(struct anx7625_data *ctx)
 	usleep_range(11000, 12000);
 
 	/* Power on pin enable */
-	gpiod_set_value(ctx->pdata.gpio_p_on, 1);
+	gpiod_set_value_cansleep(ctx->pdata.gpio_p_on, 1);
 	usleep_range(10000, 11000);
 	/* Power reset pin enable */
-	gpiod_set_value(ctx->pdata.gpio_reset, 1);
+	gpiod_set_value_cansleep(ctx->pdata.gpio_reset, 1);
 	usleep_range(10000, 11000);
 
 	DRM_DEV_DEBUG_DRIVER(dev, "power on !\n");
@@ -1280,9 +1280,9 @@ static void anx7625_power_standby(struct anx7625_data *ctx)
 		return;
 	}
 
-	gpiod_set_value(ctx->pdata.gpio_reset, 0);
+	gpiod_set_value_cansleep(ctx->pdata.gpio_reset, 0);
 	usleep_range(1000, 1100);
-	gpiod_set_value(ctx->pdata.gpio_p_on, 0);
+	gpiod_set_value_cansleep(ctx->pdata.gpio_p_on, 0);
 	usleep_range(1000, 1100);
 
 	ret = regulator_bulk_disable(ARRAY_SIZE(ctx->pdata.supplies),
-- 
2.34.1


