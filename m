Return-Path: <linux-arm-msm+bounces-79017-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 0604CC118B9
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Oct 2025 22:24:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 1756C4FBBFA
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Oct 2025 21:23:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0422A32ABF3;
	Mon, 27 Oct 2025 21:22:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UaHUcm/3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E320232A3F2
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Oct 2025 21:22:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761600176; cv=none; b=Jm5KOkA3+P/k4ffZbUcgl5yXlXkrCAei0ptqgWmVW3gFkrdPi+ZRbtURn9hgMdjTxI+7891qAB+x2K16ClHxj/rN4WVMVrS9Njv9+Po5vBPU9/vKM85iZRAtyxhVYTH7Y4o3QvGBJ6G7/TpXxcV3P9PWK8AEr7iGhc5OZrPPwQY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761600176; c=relaxed/simple;
	bh=RDsD42oo5DJKHd422ZHzHYbF0EKZmLoAokYu3cCm21o=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=slv0u70/QRK7gPjUBfL2hM3GNgkB3MAEvZzi9i6A1vEZbaXzoVO32552nSZV+LGK2+7c2Z9ufXsb8p4jE2dLqzbieL4k8AzOZmnMjUcrwajtaG9nxHeeDh7k+FBffmkPwpT1gb0EXkIg/VRuJ6HXNs2gNvBUTZZgT0JhpH/Q/BM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UaHUcm/3; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59RG396E3207011
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Oct 2025 21:22:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=+O6l/ytORujA0aTPgLT44s9iI67++3hpcID
	aF4LLtAw=; b=UaHUcm/3x/wW/WnSgg8sod9kchXZhNEZx98dPlkgg2w/QAYlbAi
	6JmcuJnZfUm6U+KmOPWLrSotMQBkDWMNsW4lNYCKf4LgvVRbw7b4aZUntoShNsMV
	vAfAr0i//FaHf/B0YrrKzcaT+uw329IP68bA3q4Bbsw5dMiiw00k+RZ/E2LQ0KGG
	T5QYryRCWIPp+u8TBsF9zZlsckE3B7+yAxt8qTHPltJRRr1BB0SZNqpYea5qtTAQ
	RJRkvD49c3vHOJatwQcLPBX2boebNZgz49+y+tfdEVCWgsvanBuqXARJQPqmluYN
	zwPJuuqYQXNgU+Gz4nKARWgUiIpzDvzWf+g==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a2bwtguse-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Oct 2025 21:22:53 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-290ab8f5af6so32302605ad.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Oct 2025 14:22:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761600173; x=1762204973;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+O6l/ytORujA0aTPgLT44s9iI67++3hpcIDaF4LLtAw=;
        b=uhY2sqtRlZbKHWCYbI0XSot4rfEbUiSX0MaDC6r4qn09PQsiLMHRrm7j6a6+Uo7BQh
         Y141WuYxyT7cSx2KwjHnyINGoTWxIUgAg3PG8cM1hRXt3v69BRKkF1AVXhfFyCSzLMw/
         psvUaIsWXXjJD1eVPVLchmCGMEjdfPKnC1eDh0jrVECC7UyG2OWVRuIZ7RxIimaL2CYM
         Y3GIjBIEqcn7mg5ed+Waq8UTAuOgAAZrEB9/bzw9+napf9hjxKaJlugwJq/INaqsK4LC
         bbkCZIhcT1RB6y6ZREggGl4qLIBIQC0kCbucr6VeJuj6+J5VzH+u6uVuc9ph5a1LLgcX
         dO7g==
X-Gm-Message-State: AOJu0YygkpUM3jF/KiS2EhH4oorxxjLfnYX6ia/LuUo28hdI87+P9ap4
	8+IwJZtegAuV0U0hg9CHP/gkBYVJakM/Hq3wvg8VvAFs0ur7wqEbsm8rf35LMmJ1LmQU5cuMIHf
	Njpnle2Fug06X8RZ97MJKJRiNcfx+5XE3Kkb+WNmYUqpRjihPvpV+6I73IT9TJSIW32SL
X-Gm-Gg: ASbGncuqXLJz+6MrmnESLmvEm4e+BoLQwDoy0dHiThdh48miz+pTgh9R+NBaoYoQDi0
	VFfdkj2a7vEG1V8wDlJlo45qn9njI3+G1+B34vc+ErOhERYjcDeWaw9HY2kKgWeWIO1ESwDtyAN
	36X/KuiOgh5lr+j8eUX74TnvaoBqB4rTnJ6kWCddvCMr3tobG0qpu92NMYmazL5Eu7nQZ+3SH7K
	VcLe2wzR21n4p53B9xxcP+XRYZRsKfHmISVEd+TLB+UDcs6mhLRdhNgUwCoEsaIeX5fkDYXtbnx
	gO81aEJfNgivuE9HOpiKmaqhYH3jLeXncRxOfDARo8mWTp18Y34+CXPapKXC+NT+wGeNwZl/w0m
	A4txER3R9JzhNMiBQKgzi6FPCO7Hjer7P1y8uAay0p6/iGJkf+bxn/Q5M0dNMYQ==
X-Received: by 2002:a17:902:ea03:b0:270:4964:ad82 with SMTP id d9443c01a7336-294cb522a71mr14434895ad.38.1761600172879;
        Mon, 27 Oct 2025 14:22:52 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHvCQDV37IQteLNOCsBWF5wZ6TKuLII+PWlxpIKAJcNJ/kKTw5cH84AL6IFMDWMIEOjzjjcQw==
X-Received: by 2002:a17:902:ea03:b0:270:4964:ad82 with SMTP id d9443c01a7336-294cb522a71mr14434655ad.38.1761600172332;
        Mon, 27 Oct 2025 14:22:52 -0700 (PDT)
Received: from hu-amelende-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29498e42afdsm91073055ad.99.2025.10.27.14.22.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Oct 2025 14:22:51 -0700 (PDT)
From: Anjelique Melendez <anjelique.melendez@oss.qualcomm.com>
To: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/2] soc: qcom: pmic_glink: Add support for battery management running on SOCCP
Date: Mon, 27 Oct 2025 14:22:48 -0700
Message-Id: <20251027212250.3847537-1-anjelique.melendez@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=L40QguT8 c=1 sm=1 tr=0 ts=68ffe2ad cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=qMsUIMY-mLJ0Ph_xJfoA:9 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-GUID: jYRg8HikEuXbDKEdkV4lGvOYqNweyntP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDI3MDE5NyBTYWx0ZWRfX1poB42Nn4ZdA
 nQPcl3pJfIYFfTStcYT8mrfuqAJ8p424z2nFuQ1qYJqWG4qTCTm/YjjcsgrP/zEbe+oYrekMeve
 OY6Z+wb/Ixop5ycTl90BCmuBJscylwEa/pmrT4QWnqXkUJSmY4l/c0VuTFHtES/8e5aTxVfHF9f
 M91DT/9K4pZDl0ZZPM6EMB6yaYOjokCH/KfRcs9Sg4/4P28KMKp2zFDEKI4UQdduNUxCbdub7W3
 1UTTmfOF7OxmQ6AMH/5op7I+DZGXC+ltjgwJx1YLEJ0YGcqWgs12fUARbxgBdtMLLM5FqOghCku
 QBAojjmJP4knF9nPnUcqYWYMiJ2cvA1NvaWY06kiI6/BhugTeMSqFwqzY66evJ9SMED4TdiReqn
 GI7+x9CFS/Oc0XkUHJzYy4ZUwrfVgw==
X-Proofpoint-ORIG-GUID: jYRg8HikEuXbDKEdkV4lGvOYqNweyntP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-27_08,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 adultscore=0 clxscore=1015 suspectscore=0
 malwarescore=0 phishscore=0 lowpriorityscore=0 bulkscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510020000 definitions=main-2510270197

System On Chip Control Processor (SOCCP) is a subsystem that can have
battery management firmware running on it to support Type-C/PD and
battery charging. Add support for devices, such as Kaanpali and Glymur, 
which are running battery management on SOCCP.

Changes since V1:
  - Corrected bindings dependencies 
  - Renamed pmic_glink_data variables
  - Dropped "soc: qcom: pmic_glink: Add support for SOCCP remoteproc channels"
    since it was applied from its original series: https://lore.kernel.org/all/176157405464.8818.5887965202916918883.b4-ty@kernel.org/
  - Link: https://lore.kernel.org/all/20251017003033.268567-1-anjelique.melendez@oss.qualcomm.com/

Anjelique Melendez (2):
  dt-bindings: soc: qcom: qcom,pmic-glink: Add Kaanapali and Glymur
    compatibles
  soc: qcom: pmic_glink: Add charger PDR service path and service name
    to client data

 .../bindings/soc/qcom/qcom,pmic-glink.yaml    |  7 ++
 drivers/soc/qcom/pmic_glink.c                 | 66 ++++++++++++-------
 2 files changed, 49 insertions(+), 24 deletions(-)

-- 
2.34.1


