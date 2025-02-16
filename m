Return-Path: <linux-arm-msm+bounces-48122-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EC87A3719E
	for <lists+linux-arm-msm@lfdr.de>; Sun, 16 Feb 2025 02:45:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 993701892F19
	for <lists+linux-arm-msm@lfdr.de>; Sun, 16 Feb 2025 01:45:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3FAACDF59;
	Sun, 16 Feb 2025 01:45:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IFBbSwP+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12F5133EC
	for <linux-arm-msm@vger.kernel.org>; Sun, 16 Feb 2025 01:45:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739670340; cv=none; b=q/W7I6QkJsLhWlEfy6bRGV6xNDlxEcCCDlLh5BIrvEZdooPrzjFFsm55HD4Z2ZKyiUchJ3ZOnSVk0b2WMxPWwebehkKj5+fFT2EQqDYHKUKR4CiGALCbcouT0WikJ0ortROXERJvsy23+P+30YRZFaDtNEaP1pD+JikofigmN+s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739670340; c=relaxed/simple;
	bh=6d/C0OzP206Bfx6ax3rRPN3TPah22XiTEZpdfRfQaV0=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=bfwQrXSdP516sJ7RU4jA8HobcYevODYESA4JEwe4elRIUZ99Bq51F1o99tKwX5pxUFYPPGeSOxvPTyi7BfFcOveJ0f/WERb6IJ2PPnCU7tXhykDB3cmBwI2AYgUWtqmTD24Usg6iskuiQDYuDkoORcXwW92F3QoyNy9EBBrUSzc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IFBbSwP+; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51FN91T6024682
	for <linux-arm-msm@vger.kernel.org>; Sun, 16 Feb 2025 01:45:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=QChqI6vVHRRW6C7u3A4HFPKyjHOOONIPmTq
	BbAmlM34=; b=IFBbSwP+L+TKBLOwDGTSfMR5We3MsKpzulNpXwSmmpszde/zIOm
	Q8atyutJnYwGXXt5ApAhqftF4z3CgCIRxqaY4ffma2ANRT2wy/VpyT2ARs5t3vJf
	aVQCycsROPe94dL9Dz37E7CF0ZNfPZ5HyD0ICHeO4zWWN9UFkyB5CKQ9oaOSwMnz
	baNoZWcwENPE2huuhp7qJSzqnXVzKMBlg/pZygLUzuDyyJQ6hk1OZUQPJpTq2vrD
	GAdTggzkFcElz/AbFews+Q/PPuLkXeJWxyPayXAPdLyHrnuTWqM3z/VRssjLnUYN
	FMiqu6+jWjsEV2jndKlSmjhAbmhl4uF0MlQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44tkqj9b6v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 16 Feb 2025 01:45:35 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-220d1c24b25so68769565ad.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 15 Feb 2025 17:45:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739670334; x=1740275134;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QChqI6vVHRRW6C7u3A4HFPKyjHOOONIPmTqBbAmlM34=;
        b=lhGe5FYCrEynhZUsLzHQI51Lw+Sb303G14tlOG+dmBkcKbQZZKwW6Dt6AFtll/vFYy
         u0KmNk866dV9k7E2VgGgc7oHbMk5GlBvklTeXJssPyWUNDuuq5DULcB+Uq9lt7pTlf7J
         Bj0MsF5KJ1wB4waViNUJiV7ZmR0IB66XrcwN5BwiB2wb58opUF6zZl5sb6ctrIds0Bci
         YxWZs9p8vHDvKLn5bQTweiXy9SpqMnaHpMuvp/swmbHOwTgPcPCKK8rv7ajIeiqZ5MVn
         sDprBIfgAXbXPt+ngtupJLUxoo8Ojla9gACVivg3ubhbMB+ZgtVuiUiDvyV4XCrNliWd
         nmjQ==
X-Gm-Message-State: AOJu0YxkES90bsQjOmZiABrHobakQoBdvp+T/+ae8ND/nx0RVLrQuwXa
	GPkLE9S9O2DQbkr7GIzVe9a8nTLDAK1Bwqylgxa8MAtx7KsAbLBg1RGPjVeHEXMORtN6RclBJR9
	2/mQGyIdcuUHZxGv6+0D9tN3SIpMt3cFo0EWf3TBcxnX6vWdVkvd0FKuf7Hi6NYDJ
X-Gm-Gg: ASbGncs8Hkq/CBJzAPNMFZwRZbKq8xudkw4L9upqKNNVH8P1qdZhfjPmZQqUvP76R4I
	xCrBr+GLfRSMBhCmm8oVHhm7/IDbGaeSF3bX6XrjdcUXV5RqmmnKnnCZJJdfjdox++Nm0aSgd/u
	qv2ZtypLzom6uTbfSpho77XTPiqf9q6glKA7/qvE/6zVLfbVIDSpLV9f4yPjhL1eyQa71eZUgw1
	yJnoUprtgTuE7+TI77zTpC5M696zla2IRB6fRuB398WaxzZxAbCl+KqIP3qGScpmkj4XbkrRxgy
	mSKdcn0i5HAFoZA5GIyEj5XnH2X7vzB5o+BSwuMA
X-Received: by 2002:a17:902:fb45:b0:21f:89e5:2704 with SMTP id d9443c01a7336-221040b1427mr59927845ad.34.1739670334388;
        Sat, 15 Feb 2025 17:45:34 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGk0Wm6pBDN1zI1JP/eN7P464Mszuon80WKDa6iniNlFdMaUXzJp9MDPJ+nFawzsFqmexnMJw==
X-Received: by 2002:a17:902:fb45:b0:21f:89e5:2704 with SMTP id d9443c01a7336-221040b1427mr59927565ad.34.1739670333991;
        Sat, 15 Feb 2025 17:45:33 -0800 (PST)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-220d536455esm49896955ad.74.2025.02.15.17.45.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Feb 2025 17:45:33 -0800 (PST)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
To: andersson@kernel.org, robh@kernel.org, dmitry.baryshkov@linaro.org,
        manivannan.sadhasivam@linaro.org, krzk@kernel.org, helgaas@kernel.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        lpieralisi@kernel.org, kw@linux.com, conor+dt@kernel.org,
        linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree-spec@vger.kernel.org, quic_vbadigan@quicinc.com,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Subject: [PATCH V3 0/2] schemas: pci: bridge: Document PCI L0s & L1 entry delay and N_FTS
Date: Sun, 16 Feb 2025 07:15:08 +0530
Message-Id: <20250216014510.3990613-1-krishna.chundru@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: m3_SR5Wj4PCruonui-0wBvEKrVUjk1jH
X-Proofpoint-ORIG-GUID: m3_SR5Wj4PCruonui-0wBvEKrVUjk1jH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-15_09,2025-02-13_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 clxscore=1015
 lowpriorityscore=0 spamscore=0 impostorscore=0 priorityscore=1501
 bulkscore=0 mlxlogscore=999 suspectscore=0 phishscore=0 mlxscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2501170000 definitions=main-2502160014

Some controllers and endpoints provide provision to program the entry
delays of L0s & L1 which will allow the link to enter L0s & L1 more
aggressively to save power.

Per PCIe r6.0, sec 4.2.5.1, during Link training, a PCIe component
captures the N_FTS value it receives.  Per 4.2.5.6, when
transitioning the Link from L0s to L0, it must transmit N_FTS Fast
Training Sequences to enable the receiver to obtain bit and Symbol
lock.

Components may have device-specific ways to configure N_FTS values
to advertise during Link training.  Define an n-fts array with an
entry for each supported data rate.

Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
changes in v3:-
- Update the description to specfify about entries of the array (rob)
changes in v2:-
- Split N_FTS & L1 and L0s entry delay in two patches (bjorn)
- Update the commit text, description (bjorn)

Krishna Chaitanya Chundru (2):
  schemas: pci: bridge: Document PCI L0s & L1 entry delay
  schemas: pci: bridge: Document PCIe N_FTS

 dtschema/schemas/pci/pci-bus-common.yaml | 12 ++++++++++++
 1 file changed, 12 insertions(+)

-- 
2.34.1


