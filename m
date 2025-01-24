Return-Path: <linux-arm-msm+bounces-46057-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DFB7A1B352
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Jan 2025 11:11:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1906B188E376
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Jan 2025 10:11:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C0C2721A433;
	Fri, 24 Jan 2025 10:11:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Q3hQPxrO"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46867219A9D
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Jan 2025 10:10:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737713461; cv=none; b=WM2JGZyAtaLQI0BExDZrwxOuQWNBa28ATDYDriTbuZ7qH+ZcA7aEnbb2BmopgQZehOGtgQl8wohCd/o67SliwxxuI5swNzvlpdC0HMYclbHYO8OSFLUT7NYRoS2kXwoNlJKP8rxjX9cOia6qjpjjw/C+jpJBbKFRRRxDK1ub4Xw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737713461; c=relaxed/simple;
	bh=N2lF14aGwlo/azpWF8BRBrEW5+wH2aHyY+T2Zoz8R8E=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Ln/iVNyDMQjHcImk/0TK88wO68/vtUoU6FvJBCfHoKKxxMprOqsrWOt1XUYiTtAInjtJnnpRnHyVlHP95+omCwc1RZNTF7A/VyKzLRavACy5zQKQBD9UuMgkdilTbCC/J7/0Zb5bDQKGp57HHGNcJvlFyVMi4fHYUleLYScd5jk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Q3hQPxrO; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50O6AaoF005640
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Jan 2025 10:10:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=QTuzQaNN61y
	5MqpLSwcmOsw3cjnsMlfMXyB5by59pS4=; b=Q3hQPxrOOGpKzb5YmLU2pPiHj43
	rU9xFVN5EZaUW3EO4scLVnyRapoTSdivZhDxZ77e9D5sVxtmQNufOO6rQh7rwWaH
	8kBKRWlc7T/CxtZoOATBbi+3hXK/nEUknCZ91PXHHL/I/wZoDP1cZKPDyNBQHncO
	ph1K2SGB5y6zQooMj14HeOFVRFM1AXoq7/dBWWOxlfjSEpBuEi82WQr2nrahZ+ao
	coQI8rqFEfgBNJ83DqJhRcF3O5z7Uu+tXEs3MEgYDx8lctLUa5Gct0txizabrsnq
	xGQfTwFcC/cpWzyo3RhSOy8Y7IBGHCKS+ivxkNZvg5khSpLBHWDAQQI9glA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44c5c50kd7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Jan 2025 10:10:59 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-21631cbf87dso40081745ad.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 24 Jan 2025 02:10:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737713458; x=1738318258;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QTuzQaNN61y5MqpLSwcmOsw3cjnsMlfMXyB5by59pS4=;
        b=eRDVosv4aOrGsmR5+OBb/wjBWItFx1zgV2NF6uja1735blZTGV4osVVQJeYAsKyHbY
         D4mlj7rcAGJCYViEoVTSSPnAe9nY2UT9WIpb359KtTmhB4kjVPrIUTZeZutLQoIwYpwE
         qfBZ7Ho+fFn+/CMB2TIbWQ0CJm4MBR85xiTn12NVsrBJuER21dsTc1yAHewnRNjo3bw8
         K09vFJru+CaclYiQ56Yd57W1ANOBivRBoumn/BU37WubEE4Fgj6fdLqN7eCqfpqcu6o/
         yC5dydqJzgqWDNyEqL20aknIU1rqLFT1tRTwRz1QBbYBg5BHh2FkC5rN5VTwnzWoAoKb
         WQsQ==
X-Gm-Message-State: AOJu0Yxb7vlIxksf1E8pXvgsesUZoRx78xKIokaaBa4ZuhntnoaQcXOd
	eB4IDDeHTiDe0MSVjIZQhMya9Gc0qp2J92IqTIFB8x0aGxKDQ+EIuUuBz/nnwiES52qrASbODZt
	Eg2dsh7HZ4MehLp19n1fyAiWmw61iEggHax+RX/WTuGKkTCk+/Ocsey0Kf6JVoH+0
X-Gm-Gg: ASbGnctpCPmu72NIIsXoy288Ku1GajG0TpwKWtAT43LZfgx1rAFa8x0i4LsO6Q4wA57
	Gh1Kl899s7x4HZKJMwgDW/TSigknTcWsY3efODw55Xnypdmdy32t+H7GbTLbKSZJe8xlHSmXe3A
	dn9hneD3wL1EPc2ZALj6v6ytyKQmUvHSVsEccAyY2SOLamq4p5YYJCzIdW6nHtLa7btfc6YLb82
	UNGldRTSYsQs4pgV0nWGNy4rwl15w+8tzEuNn8QQALKJ+4m6868BmGxr9c1945rfSKwdG3IpMZA
	VpqhinfCEKGMb6nvXOTSUhdQQeScrg==
X-Received: by 2002:a17:902:cf0e:b0:212:4c82:e3d4 with SMTP id d9443c01a7336-21c356093bcmr449066655ad.46.1737713458442;
        Fri, 24 Jan 2025 02:10:58 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEPdt/tWXnYv0ZJnPog4hmu7Y653tEvtmLqJ8rL0b6LAjLhAX1Bo1hz2SKucKP3+NMNwSY2mg==
X-Received: by 2002:a17:902:cf0e:b0:212:4c82:e3d4 with SMTP id d9443c01a7336-21c356093bcmr449066285ad.46.1737713458082;
        Fri, 24 Jan 2025 02:10:58 -0800 (PST)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21da4141dacsm12773825ad.133.2025.01.24.02.10.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jan 2025 02:10:57 -0800 (PST)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
To: andersson@kernel.org, robh@kernel.org, dmitry.baryshkov@linaro.org,
        manivannan.sadhasivam@linaro.org, krzk@kernel.org, helgaas@kernel.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        lpieralisi@kernel.org, kw@linux.com, conor+dt@kernel.org,
        linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree-spec@vger.kernel.org, quic_vbadigan@quicinc.com,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Subject: [PATCH V2 2/2] schemas: pci: bridge: Document PCIe N_FTS
Date: Fri, 24 Jan 2025 15:40:38 +0530
Message-Id: <20250124101038.3871768-3-krishna.chundru@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250124101038.3871768-1-krishna.chundru@oss.qualcomm.com>
References: <20250124101038.3871768-1-krishna.chundru@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: yX1FG192Q2u4Z99scT98MuSuMwTit-9K
X-Proofpoint-ORIG-GUID: yX1FG192Q2u4Z99scT98MuSuMwTit-9K
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-24_04,2025-01-23_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 phishscore=0 suspectscore=0 priorityscore=1501 mlxlogscore=999
 malwarescore=0 spamscore=0 adultscore=0 bulkscore=0 impostorscore=0
 mlxscore=0 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501240073

Per PCIe r6.0, sec 4.2.5.1, during Link training, a PCIe component
captures the N_FTS value it receives.  Per 4.2.5.6, when
transitioning the Link from L0s to L0, it must transmit N_FTS Fast
Training Sequences to enable the receiver to obtain bit and Symbol
lock.

Components may have device-specific ways to configure N_FTS values
to advertise during Link training.  Define an n_fts array with an
entry for each supported data rate.

Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
 dtschema/schemas/pci/pci-bus-common.yaml | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/dtschema/schemas/pci/pci-bus-common.yaml b/dtschema/schemas/pci/pci-bus-common.yaml
index a9309af..968df43 100644
--- a/dtschema/schemas/pci/pci-bus-common.yaml
+++ b/dtschema/schemas/pci/pci-bus-common.yaml
@@ -128,6 +128,15 @@ properties:
     $ref: /schemas/types.yaml#/definitions/uint32
     enum: [ 1, 2, 4, 8, 16, 32 ]
 
+  n-fts:
+    description:
+      The number of Fast Training Sequences (N_FTS) required by the
+      Receiver (this component) when transitioning the Link from L0s
+      to L0; advertised during initial Link training
+    $ref: /schemas/types.yaml#/definitions/uint8-array
+    minItems: 1
+    maxItems: 5
+
   reset-gpios:
     description: GPIO controlled connection to PERST# signal
     maxItems: 1
-- 
2.34.1


