Return-Path: <linux-arm-msm+bounces-74489-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 38D38B941CF
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Sep 2025 05:34:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E6A9B16889E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Sep 2025 03:34:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 17B8826158C;
	Tue, 23 Sep 2025 03:34:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="E/kWVSfI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85BD33595C
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Sep 2025 03:34:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758598472; cv=none; b=MOA9E8yU0K1UDW9h+GqKbhhG3g6oodLzD/Dxn1KxdzIlwoZnGT4YCJ+J2wOVxfd7dvVswxYK+I5RQdTECnb4HWdDixOONeeki+/52YLYpilvKPGFgO6HMsqkxzXeWPCqAuUi0D7Tan2+pLPClQHHUzKbsn/pNT/180nE51r9iyk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758598472; c=relaxed/simple;
	bh=z70XtjlA3PaP7+9TFnB4vei5jQgBcOgF9YqqYVgtTU4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=GM6iKIEdHhvdocTBvMzrBY62wt6ozCiq23xWWU39IHB+NMNvfyOQ6VIIrwUhwrKn1fWyvpqdAHQ94qxC1sTVr034FwJIbfu8HAYS4j4p7mu0c4nIfZw+d2utGvPYgvERrkNbKJyxD0JbpqC8+FL9qtxaPJ2PdMqPGM/WsKp58e4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=E/kWVSfI; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58MIjTuG022699
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Sep 2025 03:34:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=CqMl3zt67dOMtfRi8y5JBj
	xZMNIF04qtFXafIqlDiGo=; b=E/kWVSfIEg8QfOINo8jo+EgYB7aako/0DbqdWR
	Tw6fVlql5WSkYAQkX4pkVCmy67ctvYjtjPCmr6jmLNMkqlTHWP1BFIcHm+GX+t3/
	O9ATP0vvrJg+ZKDGSe2Cpz97JD1s+ysqxzCHdTYQVGKQDs2OSs7iTpap6GsqmUSk
	OlshgKCzu9DRItIgncttZAiKa9BnOOg+HJAVDMRoWTyDTWHnIrPLP29jjCrSXsAW
	7wxFOCOsl7r8pC2pQNXLCf05MPJnnPpfaXgZOR4vZCtczQayezK/kbQNd7NiAfFN
	XZDb+xZSTKj0TfNJHwdxJ2jTDKDTM1HwAcM3FHH75asYzHCA==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49b3nyasmy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Sep 2025 03:34:29 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-32ec69d22b2so4988874a91.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 22 Sep 2025 20:34:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758598469; x=1759203269;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CqMl3zt67dOMtfRi8y5JBjxZMNIF04qtFXafIqlDiGo=;
        b=qKrXX3KR4RRr02PHLwZVt/GnnAcibm1xKcRl96My+YQSAvFf30vxDC+KveAwyXX4hO
         vNEkytFyv53C/nLpmDcQQCyfdZNDHwaAfsbAz1CDvO+0ruP8JJbuDMI98dFmsBmUH8Rr
         jy8McDNSHdKzdvn6drZQMyzb4OGEQwj+1jvvsPtMi2+vYZGqCOIuv7rYRBbrgWh+S/ib
         DOXWl1mGdgqio3Am/bVj3hSvJYFcMxkkXDEbqz1qPXzpn0WjXRxmWer8AhlO+KB75mnu
         gBcK/bTY8pBR35xAva4ma7fiUjXNCt1LIbuZVc7g3aLIY73+JvKzM/0IDLZBpHfAaOKf
         84Zg==
X-Gm-Message-State: AOJu0YyFN2v2Lm6wln+yBm+yJ95pjULmvdgv9CPMQm6brP0GNgvHssYa
	vXpd1Lul0RtjSnH0v8cT0uiGH5sPN4E2eiMmCDY7fOdI4rsDk4vG4ShhHCib4v+OTCqNEyMGk/R
	64eA7v3Tj4hH7VaqGt00Q1H4q/bKRMLIGVBsb5ae30NVq02QMTtpAxrSX41XbJTCsgmnP
X-Gm-Gg: ASbGncv5f6l7hzMEdbb829Op8cqjhmaWDbd93BU/eSyD8UegQPpb+AaLeEUDdQsdubK
	dJdVF7iw64UsVdKh+YdjtnCFjpLU4grnNfUVS506zc0m9APckm4Q55a62qvMsMMMHMg8VLj2WFF
	W6+CEY/xBkw9F3x+jdnx9bPm0v7AFeZeprG6sWjp1V+Wz7tIxdNFuJ95SF5MAHCV9KZma+rW3KU
	fsP6LKNcGTS0SeESRjwj5PoeYOcER7ZUQ1B6fqadmEUEJA9tsZooPDrusAtaPXPlL6fmBwIAKbS
	jJ13jkwr2gXtPGnNgzx1mbfHM2VcZhhWgvShAxyWpR2e8diMcBAr4OwHH3uLAJJQ8kkPIJpnBTP
	Mx+AdPCqvCk0tDfo=
X-Received: by 2002:a17:90b:4a8a:b0:327:9e88:7714 with SMTP id 98e67ed59e1d1-332a97051f7mr1424931a91.37.1758598468688;
        Mon, 22 Sep 2025 20:34:28 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGGaQO6ihKBW3xkSc8PIrCXw4QAcXrVgJ7KnAuMkzQC3LfolzXsmSMKqreW7zKPvv6VPmnjpw==
X-Received: by 2002:a17:90b:4a8a:b0:327:9e88:7714 with SMTP id 98e67ed59e1d1-332a97051f7mr1424886a91.37.1758598467987;
        Mon, 22 Sep 2025 20:34:27 -0700 (PDT)
Received: from hu-jingyw-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-332a68ca970sm551251a91.0.2025.09.22.20.34.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Sep 2025 20:34:27 -0700 (PDT)
From: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Date: Mon, 22 Sep 2025 20:34:20 -0700
Subject: [PATCH] dt-bindings: mailbox: qcom-ipcc: Add bindings for physical
 client ids
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250922-ipcc-header-v1-1-f0b12715e118@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIADsV0mgC/x3MQQrCQAxG4auUrA20Q4voVcRFJv11snAsiUih9
 O6OXX6L9zYKuCHo2m3k+FrYuzYMp460SH2CbW6m1Kepv6TEtqhygcxw1uGseQRkzIlasTgeth6
 32705S4CzS9Xyf7wkPnDa9x+AYoYidgAAAA==
To: Manivannan Sadhasivam <mani@kernel.org>,
        Jassi Brar <jassisinghbrar@gmail.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, Jingyi Wang <jingyi.wang@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-99b12
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758598466; l=2809;
 i=jingyi.wang@oss.qualcomm.com; s=20250911; h=from:subject:message-id;
 bh=z70XtjlA3PaP7+9TFnB4vei5jQgBcOgF9YqqYVgtTU4=;
 b=cxVPGGbfxjC2F1PcGqruRrsgdUs31aO1IfiD1jGhWW3930RXlSsK78wZ42baKsOU1e9EDn+1+
 EcBjE+gkIglDqnZybU+op/sWSduC/RvvjgZM9IpXowFtwm8TFRsX0Gx
X-Developer-Key: i=jingyi.wang@oss.qualcomm.com; a=ed25519;
 pk=PSoHZ6KbUss3IW8FPRVMHMK0Jkkr/jV347mBYJO3iLo=
X-Authority-Analysis: v=2.4 cv=EuPSrTcA c=1 sm=1 tr=0 ts=68d21545 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=-Du5U2n_gXvbfj3Jl44A:9
 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-GUID: C2SeYuKHcanwrdlsFnviRCbUr4i9zupM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIyMDA5MCBTYWx0ZWRfX9uANa7aExZY4
 10G41/J5gqZ5altefq/fnAi+TTTi0kQiOJGh/nNnvxvroFNdLTojfbeFX1S3got/uK8rELBHCae
 /ZSk22Qz7jwIGyxxkn0Edkm+E/oFSK91g08mOCDrjUGxgCOeAPsO2dNuKcjWLU94jqyDiYAUm0S
 WJ1X+84elsTo2waIJItuXkX1apN6s3wrRKewxMjS92hcBb1DO33ekOr3k8jZdiegLa/pPFpodhg
 WyOreb1HONvkA1Cesv1V6iLvwmVgyGgfQ/dbFXjM4KFp1o+t10iBesSmtP+1sAReK3nLMuQ1Yh3
 x6Yzr18YeFcSKwKasL+emnVLz0+JtRg9Ze7ialRNhbrotPPvZLdPFbSp6IhBrU1EmPWmpERaprJ
 7CZdgoQv
X-Proofpoint-ORIG-GUID: C2SeYuKHcanwrdlsFnviRCbUr4i9zupM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-23_01,2025-09-22_05,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 malwarescore=0 spamscore=0 adultscore=0
 clxscore=1011 priorityscore=1501 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509220090

Physical client IDs instead of virtual client IDs are used for qcom new
platforms in the Inter Process Communication Controller (IPCC) driver
as virtual physical mapping logic is removed in HW. Add the bindings.

Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
---
 include/dt-bindings/mailbox/qcom-ipcc.h | 48 +++++++++++++++++++++++++++++++++
 1 file changed, 48 insertions(+)

diff --git a/include/dt-bindings/mailbox/qcom-ipcc.h b/include/dt-bindings/mailbox/qcom-ipcc.h
index fd85a79381b3..dc07ca27db09 100644
--- a/include/dt-bindings/mailbox/qcom-ipcc.h
+++ b/include/dt-bindings/mailbox/qcom-ipcc.h
@@ -36,4 +36,52 @@
 #define IPCC_CLIENT_GPDSP0		31
 #define IPCC_CLIENT_GPDSP1		32
 
+/* Physical client IDs */
+#define IPCC_MPROC_AOP                  0
+#define IPCC_MPROC_TZ                   1
+#define IPCC_MPROC_MPSS                 2
+#define IPCC_MPROC_LPASS                3
+#define IPCC_MPROC_SDC                  4
+#define IPCC_MPROC_CDSP                 5
+#define IPCC_MPROC_APSS                 6
+#define IPCC_MPROC_SOCCP                13
+#define IPCC_MPROC_DCP                  14
+#define IPCC_MPROC_SPSS                 15
+#define IPCC_MPROC_TME                  16
+
+#define IPCC_COMPUTE_L0_CDSP            2
+#define IPCC_COMPUTE_L0_APSS            3
+#define IPCC_COMPUTE_L0_GPU             4
+#define IPCC_COMPUTE_L0_CVP             8
+#define IPCC_COMPUTE_L0_CAM             9
+#define IPCC_COMPUTE_L0_CAM1            10
+#define IPCC_COMPUTE_L0_DCP             11
+#define IPCC_COMPUTE_L0_VPU             12
+#define IPCC_COMPUTE_L0_SOCCP           16
+
+#define IPCC_COMPUTE_L1_CDSP            2
+#define IPCC_COMPUTE_L1_APSS            3
+#define IPCC_COMPUTE_L1_GPU             4
+#define IPCC_COMPUTE_L1_CVP             8
+#define IPCC_COMPUTE_L1_CAM             9
+#define IPCC_COMPUTE_L1_CAM1            10
+#define IPCC_COMPUTE_L1_DCP             11
+#define IPCC_COMPUTE_L1_VPU             12
+#define IPCC_COMPUTE_L1_SOCCP           16
+
+#define IPCC_PERIPH_CDSP                2
+#define IPCC_PERIPH_APSS                3
+#define IPCC_PERIPH_PCIE0               4
+#define IPCC_PERIPH_PCIE1               5
+
+#define IPCC_FENCE_CDSP                 2
+#define IPCC_FENCE_APSS                 3
+#define IPCC_FENCE_GPU                  4
+#define IPCC_FENCE_CVP                  8
+#define IPCC_FENCE_CAM                  8
+#define IPCC_FENCE_VPU                  20
+#define IPCC_FENCE_SOCCP                24
+#define IPCC_FENCE_CAM1                 10
+#define IPCC_FENCE_DCP                  11
+
 #endif

---
base-commit: ae2d20002576d2893ecaff25db3d7ef9190ac0b6
change-id: 20250922-ipcc-header-c17cb4eea4b2

Best regards,
-- 
Jingyi Wang <jingyi.wang@oss.qualcomm.com>


