Return-Path: <linux-arm-msm+bounces-12298-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 32462860804
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 Feb 2024 02:07:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1C6AE282A4B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 Feb 2024 01:07:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D117F3209;
	Fri, 23 Feb 2024 01:06:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="MV1X/+8A"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28638C154;
	Fri, 23 Feb 2024 01:06:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708650410; cv=none; b=YMEIx0nUggdNOs3AM0RsDKdcAF4kGHv/71vi5m0/fZ/y95po4876n59SYUS7VPeHD/qdODuWawQr6sT4DmXqbuGzKw3SVxkIVltBQXBgo8ihKaSk6r55LqzL4Cz4OYjYeTu0SKqDjaDt+USWJIzRZoELSgHiw6KpPbCNloZq1R8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708650410; c=relaxed/simple;
	bh=UtkeNLNiPshRs2HQjzMI09jh6wdcEdgPl6S0msvUJck=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:To:CC; b=uLLpTFHboGYLtD2UshPt9WGFDnM7c4m7gnI+O+jZJBkbaTQS2mN7S4DXhLYikENfyn58v1sd/2T8dLAEf58wySuMZFiduXzx9UJBU6TwPYTTpVfYWla1Iu1ipC679OcdGy5IFmEvtpESZ7hzfNhMzW0WBGDPSlfcXvAww1eqeeA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=MV1X/+8A; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 41N0POC8030809;
	Fri, 23 Feb 2024 01:06:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	from:date:subject:mime-version:content-type
	:content-transfer-encoding:message-id:to:cc; s=qcppdkim1; bh=bn/
	99WGihbbZNg79VWmJiaPSADc/KaYVbVREEAS/UJc=; b=MV1X/+8AyfvJRl6yjcI
	qZJpfzaLUH+S+SUklAkmNwKHx7lJAW0NDPC8SN2Vy8buqu5jmqVgczjWAqQ31uxX
	y3Ek+QZrf5bmwG7zXDEQampzDgAFdgZcETy6f/3DI4S0P0FkKY4SEcpBsaSo58tL
	IF/TnmxPhKbBjBcP3C3UIqX8DQXm2Gj+h1rp8USvDT8KpxbwYxfP6FYOrdrTNOFP
	M/4CMiltAe1VOWYU1ShopmleLbqy+11wWHzUh9N+pEvod6OUGCEfSUTAUFCtSlQi
	TpO/YGHVXEr4l89L7p4y+tYC0etgj7iOYS6STtIJvYkAYUnA9jHX6OrJSvGFwRJp
	/Gw==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3wdw13ap2b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 23 Feb 2024 01:06:43 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 41N16gCZ028619
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 23 Feb 2024 01:06:42 GMT
Received: from [169.254.0.1] (10.49.16.6) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Thu, 22 Feb
 2024 17:06:39 -0800
From: Jeff Johnson <quic_jjohnson@quicinc.com>
Date: Thu, 22 Feb 2024 17:06:38 -0800
Subject: [PATCH] accel/qaic: Constify aic100_channels
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20240222-mhi-const-accel-qaic-v1-1-028db0dd9098@quicinc.com>
X-B4-Tracking: v=1; b=H4sIAJ3v12UC/x3MTQ5AQAxA4atI15pQxM9VxGJU0YTBjIhE3N3E8
 lu894AXp+KhiR5wcqnXzQakcQQ8GzsJ6hAMlFCeEBGusyJv1p9omGXBwyhjVlV1WpS9lIYhpLu
 TUe9/23bv+wFkLbUIZgAAAA==
To: Jeffrey Hugo <quic_jhugo@quicinc.com>,
        Carl Vanderlip
	<quic_carlv@quicinc.com>,
        Pranjal Ramajor Asha Kanojiya
	<quic_pkanojiy@quicinc.com>,
        Oded Gabbay <ogabbay@kernel.org>
CC: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <linux-kernel@vger.kernel.org>, <kernel@quicinc.com>,
        Jeff Johnson
	<quic_jjohnson@quicinc.com>
X-Mailer: b4 0.13.0
X-ClientProxiedBy: nalasex01c.na.qualcomm.com (10.47.97.35) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: xgDZy7F6NZFJKUABblT2SA3Z4RM1k9Ei
X-Proofpoint-GUID: xgDZy7F6NZFJKUABblT2SA3Z4RM1k9Ei
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-22_15,2024-02-22_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=985
 malwarescore=0 impostorscore=0 bulkscore=0 adultscore=0 mlxscore=0
 clxscore=1011 lowpriorityscore=0 spamscore=0 priorityscore=1501
 phishscore=0 suspectscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2402120000 definitions=main-2402230005

MHI allows the channel configs to be const, so constify
aic100_channels to prevent runtime modification.

Signed-off-by: Jeff Johnson <quic_jjohnson@quicinc.com>
---
 drivers/accel/qaic/mhi_controller.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/accel/qaic/mhi_controller.c b/drivers/accel/qaic/mhi_controller.c
index cb77d048ed54..3f81d6396c85 100644
--- a/drivers/accel/qaic/mhi_controller.c
+++ b/drivers/accel/qaic/mhi_controller.c
@@ -20,7 +20,7 @@ static unsigned int mhi_timeout_ms = 2000; /* 2 sec default */
 module_param(mhi_timeout_ms, uint, 0600);
 MODULE_PARM_DESC(mhi_timeout_ms, "MHI controller timeout value");
 
-static struct mhi_channel_config aic100_channels[] = {
+static const struct mhi_channel_config aic100_channels[] = {
 	{
 		.name = "QAIC_LOOPBACK",
 		.num = 0,

---
base-commit: 3ab6aff5793c3c7bdf6535d9b0024544a4abbdd5
change-id: 20240222-mhi-const-accel-qaic-3889157be7ac


