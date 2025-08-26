Return-Path: <linux-arm-msm+bounces-70806-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B311B353C0
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 Aug 2025 08:03:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DFDE917C8A6
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 Aug 2025 06:03:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CF1212F532B;
	Tue, 26 Aug 2025 06:03:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VFm5ATKf"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43D822F5488
	for <linux-arm-msm@vger.kernel.org>; Tue, 26 Aug 2025 06:03:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756188194; cv=none; b=IouTffUKKixEETdlW5k7cHHXhgt4keAlH8KyoA7G/YepKzaXxM/IOanB3PDa/Twzfmdgc9B47oumDNXlIQr2bph5UvYpTvd4bebAY7CVMCbZfa3SaYsuq9JYpMHZArTqixCaikprrTEhzwtY4kOYubl2MV5dh/C8RLZVD35KO+A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756188194; c=relaxed/simple;
	bh=wLHX/edGylOks4bBIcp7t2+Ibr+czy8bMk8mFVTI4wY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lZ2sDLiQlrBB5e42Gz3hGyiyvr1nCUvtNVxgwRNqhj5oRFSJwQCEy20IEW2b3fHa8Z6BMR1b+DxllFyGis3L2eKcLpVOShfMHDcohBlXJJIpl6l5SO0QQBG9oJvuanRJLWK0OfVP3IJFwPa4E7EiSLJTOvHlicV9+MagDd/mOtA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VFm5ATKf; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57Q0V752026012
	for <linux-arm-msm@vger.kernel.org>; Tue, 26 Aug 2025 06:03:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	EQ8qWf1BjUWyH0kwW3Y/Fg9kx15qSwsugIaZ01MX7o4=; b=VFm5ATKfASULWytl
	+mbVQv1PYpvkOHxvBDdTIMcQhZbl8M2m9k4Rj9HM7OYT9RM7G1nXMPk+EFhTRv3C
	cRGIEYTqCQpxmteSaF4y8pPo7irmIlRfSirx2P6S6OkyQmllvQy/szTRXmY2cn8K
	mf7k9JW9zkRfEOcD8/JC1mBCw3OT53DfoIDBXkrWlZHDLXahYCKkpy2HNUXcjKGp
	6H+8dzPb4EpFIpoTTgaamLawKGJx5WRPfmpJuS8+V5J1Q0EnBrmTv8FpZJZFQ4fR
	UE9XUBbebwjBcNmwtpQoCLwJ5+HValHF5P+0z/gvWr2LEgIszn0cFgjfOYmmiX3P
	y8F6cQ==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48s2eugreu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 26 Aug 2025 06:03:12 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-32505dbe21cso3669358a91.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 25 Aug 2025 23:03:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756188191; x=1756792991;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EQ8qWf1BjUWyH0kwW3Y/Fg9kx15qSwsugIaZ01MX7o4=;
        b=BKKEjW8bTUYmWTupKjvJMZBsBeBWAPy4TOwAy2QnDgXs9MXN48V01ib3irQ6WuJ2Em
         0/eoYSwcvIy9+6haAmVe3ciXhGybZSz0jNn5XVKTUP0b3j+hSx9Og9owRqvZ6gg/ZXvD
         poWkDu4KrZo/Aa2kKML7TBqvYxqiWomw9WO8AP82Uu6QPEabzDpri7lmT6y0ZQ3gjF5d
         HrGphmtv3rGHeYMeX4oAkxx6MEgJIGKu4pf8FOHtWMDv3bKrZAvERNbtkRPmetwg/3pD
         IZgI550Jyrx4gj28Y9MB2+Vhk7Vu3nfD/4adQfx0eIxkkPHAWPrW66SLwGa9nbXF+2a4
         BUOw==
X-Gm-Message-State: AOJu0YxV/g915FyHEvaYosf8ZHPTxQG+a5ftKObTwXg9qTcw2SxPU5B8
	8B4wFFBpmJ7SDV11qgSteH9MdTnwlmE8Fh2jDG7Q2Ztm0EfF1GuuhaQ8tD5bG/WH3opTHEQ7aLY
	AtLEYF0aH01anW7cnpLnSlN9NDOB/utWhSslOop6tnIxGz+iH93hZ8zClIML86lzGvqJE
X-Gm-Gg: ASbGncv03MfvKGwiGgNvZHDxeNlfOtBJzLoUx5hG6uq92AsO9rYy5whs7/3PP9bs/e7
	PI1fMSXmhgJAOVifqXy5nU5G5TIMslUe89b/JKSKWJH+HXbMw42qOUyvGnbNUrQqvD5fyrPK2eB
	5rrRz1PXvqdsjTqB8m5Ulm1jjmeoGVdVxo9Ng1XhrufzaHHm9/WYF3NSmjHujy4cM28sX8hvC14
	bPn5H7GtAklilhH4Hzop7YuppJMo7EDFLceLTjvJjvsbjXdwc5l50qB0Nj6aTK9Xxa6OCtIzTFF
	HOtPk9DFZUR/ZUMujizZ7glwOvHpGsAgty91u3tWsYossbSCzRoPT8FbgGvxo96S4QjFclFherb
	O86zMN0+KqS9oJ/I=
X-Received: by 2002:a17:903:38cd:b0:240:3c0e:e8c3 with SMTP id d9443c01a7336-2462ef8580emr177832195ad.51.1756188190755;
        Mon, 25 Aug 2025 23:03:10 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFAUELHtk5K6KRa6C1C1Au2wwI+x8CZXl27V1FbFgEQCwGoYHIKELa3efUez6ZgqI049IYx/w==
X-Received: by 2002:a17:903:38cd:b0:240:3c0e:e8c3 with SMTP id d9443c01a7336-2462ef8580emr177831725ad.51.1756188190255;
        Mon, 25 Aug 2025 23:03:10 -0700 (PDT)
Received: from hu-wenbyao-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-24668864431sm84989705ad.93.2025.08.25.23.03.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Aug 2025 23:03:09 -0700 (PDT)
From: Wenbin Yao <wenbin.yao@oss.qualcomm.com>
Date: Mon, 25 Aug 2025 23:01:49 -0700
Subject: [PATCH v3 3/4] phy: qcom-qmp: pcs: Add v8.50 register offsets
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250825-glymur_pcie5-v3-3-5c1d1730c16f@oss.qualcomm.com>
References: <20250825-glymur_pcie5-v3-0-5c1d1730c16f@oss.qualcomm.com>
In-Reply-To: <20250825-glymur_pcie5-v3-0-5c1d1730c16f@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pci@vger.kernel.org, Wenbin Yao <wenbin.yao@oss.qualcomm.com>,
        konrad.dybcio@oss.qualcomm.com, qiang.yu@oss.qualcomm.com,
        Prudhvi Yarlagadda <quic_pyarlaga@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1756188184; l=1620;
 i=wenbin.yao@oss.qualcomm.com; s=20250806; h=from:subject:message-id;
 bh=xFfJjLvYqUF/UNP8tW/CbteYsphSvzn4abnhCjQHkoU=;
 b=Qs01wuS9m1UMrZwLtH1ruCc370ngOt8oQwHvNAqEnU0hUprid143sfRe5X7pool7NNgfl45vw
 RqRIgjvPW9+CHp3WK1eOTu3CiRCBopkm9FcVVZRBXFbXUdPCnfthxaq
X-Developer-Key: i=wenbin.yao@oss.qualcomm.com; a=ed25519;
 pk=nBPq+51QejLSupTaJoOMvgFbXSyRVCJexMZ+bUTG5KU=
X-Proofpoint-ORIG-GUID: AmOdmAL4UXOV505vUo2I-RfiqWw_DaLx
X-Proofpoint-GUID: AmOdmAL4UXOV505vUo2I-RfiqWw_DaLx
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODI2MDAwMSBTYWx0ZWRfX3EZwszv/w+e4
 EGz1N/NVxeoifKy+dQ5cXABB7v4+7R2Wd/Y0PnXOltmAmEmyuLW6eDxflFqS5LiGOgsc7gNn6q/
 8wqoz8vCSeTiVGHsjBTxgb4zLrDDRLjkC0IxnKy24xVozXMkVps/ShiKFdzojXuaCa4AgX/GtKN
 4nmqfxEzS2mz5JiEq6xLzFzFsrqIHM6feC66XSpWbjGErZUMF3SBIb2hpeVmnpQlryntbaEf+tS
 dSUeo4Zx3DDIucUh7GJQ6hKMtZRC7Sxt6n4vfWOEc6pvByqyzNMUvdZs0Uv6Z/Lcc9UkT5LDkgw
 eeIGPHwgqPF/cJtMhIQhGHG5kgPraZm1gLxmvqNEwZ1mP99DOvjxUOgclXdcYxq5JAnHP4MlAYB
 9etnV4/K
X-Authority-Analysis: v=2.4 cv=PJUP+eqC c=1 sm=1 tr=0 ts=68ad4e20 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=MyfKwbsdfMS_-thd9JUA:9 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-26_01,2025-08-26_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 impostorscore=0 phishscore=0 priorityscore=1501 spamscore=0
 adultscore=0 clxscore=1015 malwarescore=0 bulkscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508260001

From: Prudhvi Yarlagadda <quic_pyarlaga@quicinc.com>

The new Glymur SoC bumps up the HW version of QMP phy to v8.50 for PCIE
g5x4. Add the new PCS offsets in a dedicated header file.

Signed-off-by: Prudhvi Yarlagadda <quic_pyarlaga@quicinc.com>
Signed-off-by: Wenbin Yao <wenbin.yao@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
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


