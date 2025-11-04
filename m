Return-Path: <linux-arm-msm+bounces-80255-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 602F3C2FBB3
	for <lists+linux-arm-msm@lfdr.de>; Tue, 04 Nov 2025 08:56:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id CA89134D1A9
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Nov 2025 07:56:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C32BF3115A5;
	Tue,  4 Nov 2025 07:56:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AzVENB5W";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="a3J13E+W"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0015E310629
	for <linux-arm-msm@vger.kernel.org>; Tue,  4 Nov 2025 07:56:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762242994; cv=none; b=Zb6s6P0Pe1LbUauAu4PtZnGCWjOsqm5WVTmwo/fqgtc5zYb+STg1AZ48H3AkuLwGrVVReAdRYYoroH84PoJS21gh+UEfAeN3o+p1vlA2YCTZUqww3yuHloBV5DjjAmN0WsrKrHzRO0cbHIkg1JrMEs2h668NYZfNP7o9+pAkuIE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762242994; c=relaxed/simple;
	bh=dRqJWz7OIwNnKTzn33y4BQaTa8oSs2p8RyOoVIfWlw8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Xg8H/qRcaF5Z3EDR3wN2x0KBRNfJ8CJ1j6mIAgKlyntyO195c3yjLqV+VqIS1du1RmAUh+t1LAjpI7GnyfD02NK91oMtB64sF1plb3e/efeDaLH83g6CfCAJtImxxx/u5r1qa/WhDXGqKovhFGGrEaegrGQTtxIcqaed3bnjpDQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AzVENB5W; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=a3J13E+W; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A432CGp3694634
	for <linux-arm-msm@vger.kernel.org>; Tue, 4 Nov 2025 07:56:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LnqwEheiYw4eMqGgagIbYYTEmFr59FG4+mnaf+XhjEI=; b=AzVENB5WngnxwkUp
	EkJpuSTz2IorKgHWrq6O748UOXijIZ50wZt2OKZhPkA9/TKkS+05rGll/579BVw1
	Y2flZ51XkJ26CO/692mRcUMHRg/PWs1laXdlRD76/rE9W12P0QvEf0C9C4cTPwVC
	Ai2uJcGEKzoM07ncYb3ZE9ZvMR+ofHsAkr1r99gnreXRNAE0lw/s3M+3xe7H9242
	nKg3yMSgVzI+YQmqD2SWBSo3x4v2qLfRaCPASJsL20pSwZkcUG1gyA82iROBLBMh
	bVGhj4jmTnNfF/wjKwVrpXcBwHMWYBwt742SVR8dWFz0O1vfu84f5u+k+3KeOeN7
	ADkjZA==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a6u8b33pv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 04 Nov 2025 07:56:31 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-783c3400b5dso3590843b3a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 03 Nov 2025 23:56:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762242991; x=1762847791; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LnqwEheiYw4eMqGgagIbYYTEmFr59FG4+mnaf+XhjEI=;
        b=a3J13E+WbhCMLugcJ5Ew+9IerPc5OEUcVQJ+y6gvlFep88ZcUZozw3n9OZxq63Rl43
         52Io9KAM8cHQvJUV5gBw+4X1/Jl+1Da2dxBo17+YrIC0T6M0OTHHF7ndtfT6a7N3C5Hv
         eFNO1hnq22ksO3p23kWQSsKWnw+4o5YWEw+BwkxU7aKo5GjCxc8AqAbV3JbRyIlLd7i6
         /a+t29khcu9HvQik61BPOV9r+uMBP/xZhqzNhLJ7fgLYPiz9NAJ9T7FHyYtjlk21bW/s
         WfQMYnUVXC6wHs2m3zFFVwDNBeV/xJfib1nyL4KpHjQeXThlOgXXxKQOCKN0L5rRpajd
         RAdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762242991; x=1762847791;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LnqwEheiYw4eMqGgagIbYYTEmFr59FG4+mnaf+XhjEI=;
        b=XNWMro/NCK/YZ9+pQRtigZr9jKafZDIXrgaOr01+2vgw59jW+zHHux17Mk3h4Ab1iX
         T0WC9cPAj+VozDVKmipMPR0+eQ9ypXyFWRKisgCNqGGIUcew0BUGzCbqe1glYQd2MZPc
         AoOsD5cfR+fNv+9bUynL1QJ1KdjKFEGvl5MgYUKJox0E/PLo/1HRr+iBHvZ6fKw07/J4
         cRq02bUDj1Bm+0IPF3ZtMIBAxKTjerLMFBD8FPg13u4VERlw7g5tDCe9tv1XNMkTGYk4
         pTIdyKISVtna9UYmKSRJxPBY6dbMNV9XCv/U0fLVfrZf2lFocMESISxJnu8l1QRiun5C
         1j+g==
X-Gm-Message-State: AOJu0YwLKe0Vez+AP9Alcj3NPoPQ4/VyskDfZJMv8rfw3d/l1iEkz8As
	2+sI0bADoCVsz8fkiH4hl0IvxaRvIg8hVzCJAa0lfPyRyKWTa5nH7N08O+YkChMugRpbwL0/80/
	XCM5A1KpYLNkMrUPqMX0mkT5Gguk0YhlviBKmxsmnirFrNaa9n6tqnhGaAK7kFH9Kx2AZ
X-Gm-Gg: ASbGncuUgFWNGSAADY7TPkmLSIyjCvv71WS/A9ajsQPDJSPO4LuZ2aRGqz2pSkfYEiY
	WntVRYydD7t7P62RNFk5G2cvJPafHBmvInevFZwBUqMq/ukBZbdr541WLX8OG1O5emHSXXn90GS
	/zkS7/RGbryAKooZXO8/+AH92TA/H7g44AeKTaTQHBJGJvkXjBtpliaxwk70TRdR3LL1lJuJz3a
	yboYa9h0z2eyz/72jHxDP0dbPNvZkoaLfuedfXvZBj2CZzWx9EN6BRrJdJU9D865wpNKsMdF9e9
	RI7QHuGgNPX0C/rqJodBamb6fUpW0w7bLlyyEDzMXG2TvRizYW/aWZGPS8b/iYtR02XyDckSYRV
	daujuO5sPKTFTaL+K3hAjzpSaeb5bYbU/lh1x87pKeJxSRg==
X-Received: by 2002:a05:6a21:9986:b0:341:b744:8a8 with SMTP id adf61e73a8af0-348cc3d8693mr19912033637.46.1762242990752;
        Mon, 03 Nov 2025 23:56:30 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGRudDMzRLwmeLEBc53Nk7dLsiNT62spK/lGojAWczSZXtwaaATy2sH3JUzHTKWBolJh5mrnQ==
X-Received: by 2002:a05:6a21:9986:b0:341:b744:8a8 with SMTP id adf61e73a8af0-348cc3d8693mr19912005637.46.1762242990311;
        Mon, 03 Nov 2025 23:56:30 -0800 (PST)
Received: from hu-qianyu-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-34159a16652sm3627951a91.20.2025.11.03.23.56.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Nov 2025 23:56:30 -0800 (PST)
From: Qiang Yu <qiang.yu@oss.qualcomm.com>
Date: Mon, 03 Nov 2025 23:56:25 -0800
Subject: [PATCH v6 2/3] phy: qcom-qmp: pcs: Add v8.50 register offsets
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251103-glymur-pcie-upstream-v6-2-18a5e0a538dc@oss.qualcomm.com>
References: <20251103-glymur-pcie-upstream-v6-0-18a5e0a538dc@oss.qualcomm.com>
In-Reply-To: <20251103-glymur-pcie-upstream-v6-0-18a5e0a538dc@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Qiang Yu <qiang.yu@oss.qualcomm.com>,
        Prudhvi Yarlagadda <quic_pyarlaga@quicinc.com>,
        Wenbin Yao <wenbin.yao@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1762242987; l=1673;
 i=qiang.yu@oss.qualcomm.com; s=20250513; h=from:subject:message-id;
 bh=229Z+uA9EBUjxLvNJs5f/sN8K/iZsIa19KeM+KZknsc=;
 b=q8xidLCpIC96Q19jrYcE/OJoc0nCHSImvrMYdK2myUfIqf5LunzD7Q+O6BihZZotNJzcLkZ1T
 S6vf+ayA5+gBzGy6Kvi8NBz98XYuKVdqnD4900rW2JuTZQobQBi/m3v
X-Developer-Key: i=qiang.yu@oss.qualcomm.com; a=ed25519;
 pk=Rr94t+fykoieF1ngg/bXxEfr5KoQxeXPtYxM8fBQTAI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTA0MDA2NCBTYWx0ZWRfXzHCJXKCKKt1L
 +HuxMgMNDccUjAvGG1MReXhF4fTs7WuDoZQu7Xls4XQ8/xG6IgsYHoJq7RvbjijlwQZffBmjeIF
 8V+Nsa9N+1FrsIkEvCfgwoqC13K1vouf5Bk6gHgoAlJY9BoiF9JyW+pK3m5vmkNn5NtFrXTvjob
 DeicuJufvARpo+wt5pblm+NjcPCTaBNArpkSC93TUuXsWSyL8Y2LyOj6euU1JhTS3w5x4LfuJMV
 /c4CULpP3vMWluQQmOEYtJcPrJT5XOAJk1pCBc5LssquyZ3Ttn9EXx1GBnbnKWKDHGRqyXXFFNb
 GN2JiIMi0d5QEIAV0UA0GK2QwaPBy8Y1zvYl3H6HElwDjUkvEZBDf0YP4BqyPZ75XGTEA7OWzNF
 xmPmc1w9jcGsTBuPgt5c0vU4YPs91A==
X-Proofpoint-GUID: sQZq70CdoSJQhdNNdI-gOpqsUB28Zt2E
X-Authority-Analysis: v=2.4 cv=Ha8ZjyE8 c=1 sm=1 tr=0 ts=6909b1af cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=MyfKwbsdfMS_-thd9JUA:9 a=QEXdDO2ut3YA:10 a=zc0IvFSfCIW2DFIPzwfm:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: sQZq70CdoSJQhdNNdI-gOpqsUB28Zt2E
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-03_06,2025-11-03_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 spamscore=0 lowpriorityscore=0
 malwarescore=0 clxscore=1015 phishscore=0 suspectscore=0 adultscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511040064

From: Prudhvi Yarlagadda <quic_pyarlaga@quicinc.com>

The new Glymur SoC bumps up the HW version of QMP phy to v8.50 for PCIE
g5x4. Add the new PCS offsets in a dedicated header file.

Signed-off-by: Prudhvi Yarlagadda <quic_pyarlaga@quicinc.com>
Signed-off-by: Wenbin Yao <wenbin.yao@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
---
 drivers/phy/qualcomm/phy-qcom-qmp-pcs-v8_50.h | 13 +++++++++++++
 drivers/phy/qualcomm/phy-qcom-qmp.h           |  2 ++
 2 files changed, 15 insertions(+)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-pcs-v8_50.h b/drivers/phy/qualcomm/phy-qcom-qmp-pcs-v8_50.h
new file mode 100644
index 0000000000000000000000000000000000000000..325c127e8eb7ad842018dce51d09a6ee54ed86ff
--- /dev/null
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-pcs-v8_50.h
@@ -0,0 +1,13 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#ifndef QCOM_PHY_QMP_PCS_V8_50_H_
+#define QCOM_PHY_QMP_PCS_V8_50_H_
+
+#define QPHY_V8_50_PCS_STATUS1			0x010
+#define QPHY_V8_50_PCS_START_CONTROL			0x05c
+#define QPHY_V8_50_PCS_POWER_DOWN_CONTROL			0x64
+
+#endif
diff --git a/drivers/phy/qualcomm/phy-qcom-qmp.h b/drivers/phy/qualcomm/phy-qcom-qmp.h
index f58c82b2dd23e1bda616d67ab7993794b997063b..da2a7ad2cdccef1308a2b7aa71a2e5cf8bd7c1d7 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp.h
+++ b/drivers/phy/qualcomm/phy-qcom-qmp.h
@@ -58,6 +58,8 @@
 
 #include "phy-qcom-qmp-pcs-v8.h"
 
+#include "phy-qcom-qmp-pcs-v8_50.h"
+
 /* QPHY_SW_RESET bit */
 #define SW_RESET				BIT(0)
 /* QPHY_POWER_DOWN_CONTROL */

-- 
2.34.1


