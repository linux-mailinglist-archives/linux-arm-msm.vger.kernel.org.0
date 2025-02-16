Return-Path: <linux-arm-msm+bounces-48124-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C6EFA371A3
	for <lists+linux-arm-msm@lfdr.de>; Sun, 16 Feb 2025 02:46:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6800A1892ECE
	for <lists+linux-arm-msm@lfdr.de>; Sun, 16 Feb 2025 01:46:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6198FBE46;
	Sun, 16 Feb 2025 01:45:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lLGV0P/i"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCFAD2E64A
	for <linux-arm-msm@vger.kernel.org>; Sun, 16 Feb 2025 01:45:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739670348; cv=none; b=Xdxta/6nF2gNYlFUNd6JLR0f54UQ61yZfbhjgzjEnnIdEWIMNpxVt2iAgnueXzab579ZgrRFHL3JnzdBQs0qPCB1Fqzi3OyXPsj5ui0PkRvFjoICOCS8ODe0kx57aMKKvz5m8d5VV005kxKO6YLBYUULpakQ/UkSdA8mnBy0QU4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739670348; c=relaxed/simple;
	bh=BGcJQ3Ll6glAfMQXdp/lUcU5Vrse7Olu5opVqRzh+DE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=du8MPPrnLdT7gZMQWwLaKkRBdyXA79Fa6mLpG3Oca7UxCQU3h/Q2P5PRhf1xyWT0VnHDTSzAIc26QudUMXK4QI/8X18TjdEXQBTE5rD1qud1mVEA6kMW7c4dmOuLzC42i4oGv6tCe0mVKLV8g93dyzZVGFaMuxxB0qvDAwixxUM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lLGV0P/i; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51G1LNPo027154
	for <linux-arm-msm@vger.kernel.org>; Sun, 16 Feb 2025 01:45:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=jPVONscn72E
	ctMrzq7jWfE2rC2sdmlOx+fZ773e4rMw=; b=lLGV0P/iKQys++M8x2cRh1fr0F+
	DT8hJ4pTVDTP7qL0hD+mHtNxFYiCla0zGqXc9Vn9e6eleDlTTw39JIX6NfhR+MBL
	m8K/eqypNXRtXJSibsSPu+AzYiCl0GyHMR+/Wb72LfKH1fn/ItDbAbH/n7wdhOpi
	K+NnjK84Rt13viM2rGlgedAM5c1HQLWi3suDnRkIikD8sRLkImarbVSd0h+cmIw1
	PYA1WFZgbjTH2J7Yugxx34v1xznI1s9mDFVGhNneTYAHqxmt3KmCAABzLAth7jom
	m3bBIWsKt4zMi/2bbzBeEzdjTMOzVSn+8mcKBnO54EfkX2IVXODcChXgiLw==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44tkrwhbyc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 16 Feb 2025 01:45:45 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-22112e86501so7975695ad.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 15 Feb 2025 17:45:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739670344; x=1740275144;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jPVONscn72EctMrzq7jWfE2rC2sdmlOx+fZ773e4rMw=;
        b=BenSgXU2GJVAAtRtne1EJcd4VzB69BvcAMhJEPnStQp+QVmEZOEV7iuSW4ttqLOUAd
         LlPccTSvaqnqUIS7ykVPePneuuh0b90SKtcnkOmNAV1l4cWnu1QEh0my+1tx5BNGyVzS
         JvwH1et0H3yteclfIS/M8Fgh4VL1WzkSobnyba5mSC0ziyBFXfE3fkbZaVxHunYi31BT
         HCErZpDhKj5IUA9OcU45a76OaFy4TYljyNKwiS8Y8bv0615Hdq3vOZpB9RF+czHcq1ts
         BLvFBz4ujTIqvhbw6kq/4Wg/Q2kCBrywugbbCGgKjK4F5mhSEIm12W6FhArgdt+41M05
         OMZw==
X-Gm-Message-State: AOJu0Yx4jDxwTLdVGAlNs7Nb2D5XCGs0RUy7sfYNOQ1xIBnvi5kDv6Yt
	SUP6uvorCtZ9RHuDVChE9MUPLZ9J1mEWG0l1C0WsEVUzfjetz7pDQRci4l3jRLuL4k0gGFvYhfp
	oMqZp8SAh+uJ1FlrOQ5cxjlAswNhQa9HUW7L80g8/JEPt7747UOKTSKcPhGFuz1F3+vl6wG30
X-Gm-Gg: ASbGncuAwRCX+jiWuMHn9uth5xAE+GStrp9/eQzd2p5IoBe25LU8V/ZRAemna2ndHjU
	K1o40xYaYlgDOOArMH4WGYDawAUfbdgKneNjeKnUoMnspdgVuTZS77YY6B26z31p+ou+Z2LqlvY
	r2dHX/5oXNgqiLUb2uQ2qUjVIKukBXVE3zNNMwgjJEtZFQtXk8L7xNPXOWJFIWP1VbqfjcLNbaw
	HmHsfjJvEHQy3kr8I56H5l7G8VhRnoGOzjf52Z59m92jTia3BIo7wEnUObUltntpzsZKKiRpDGd
	G6pZDM2Ts2UGUaVTBv0XZQdhATb0HJbdhaDDzdjV
X-Received: by 2002:a17:902:e5d0:b0:215:89a0:416f with SMTP id d9443c01a7336-22104058b35mr58608865ad.30.1739670343807;
        Sat, 15 Feb 2025 17:45:43 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEOZ+s1hML65+t/oMtnG25500NghTCO06Dip85+ffWni6ZFpcXj+VIoxImhNSiQ1ejvbPABEw==
X-Received: by 2002:a17:902:e5d0:b0:215:89a0:416f with SMTP id d9443c01a7336-22104058b35mr58608675ad.30.1739670343430;
        Sat, 15 Feb 2025 17:45:43 -0800 (PST)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-220d536455esm49896955ad.74.2025.02.15.17.45.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Feb 2025 17:45:42 -0800 (PST)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
To: andersson@kernel.org, robh@kernel.org, dmitry.baryshkov@linaro.org,
        manivannan.sadhasivam@linaro.org, krzk@kernel.org, helgaas@kernel.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        lpieralisi@kernel.org, kw@linux.com, conor+dt@kernel.org,
        linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree-spec@vger.kernel.org, quic_vbadigan@quicinc.com,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Subject: [PATCH V3 2/2] schemas: pci: bridge: Document PCIe N_FTS
Date: Sun, 16 Feb 2025 07:15:10 +0530
Message-Id: <20250216014510.3990613-3-krishna.chundru@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250216014510.3990613-1-krishna.chundru@oss.qualcomm.com>
References: <20250216014510.3990613-1-krishna.chundru@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: r6FXgPJF987YGg55rBQpgBfszmBuNPdp
X-Proofpoint-GUID: r6FXgPJF987YGg55rBQpgBfszmBuNPdp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-15_09,2025-02-13_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0
 mlxlogscore=946 spamscore=0 lowpriorityscore=0 impostorscore=0
 phishscore=0 clxscore=1015 adultscore=0 priorityscore=1501 bulkscore=0
 mlxscore=0 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2501170000 definitions=main-2502160014

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
 dtschema/schemas/pci/pci-bus-common.yaml | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/dtschema/schemas/pci/pci-bus-common.yaml b/dtschema/schemas/pci/pci-bus-common.yaml
index a9309af..ca97a00 100644
--- a/dtschema/schemas/pci/pci-bus-common.yaml
+++ b/dtschema/schemas/pci/pci-bus-common.yaml
@@ -128,6 +128,16 @@ properties:
     $ref: /schemas/types.yaml#/definitions/uint32
     enum: [ 1, 2, 4, 8, 16, 32 ]
 
+  n-fts:
+    description:
+      The number of Fast Training Sequences (N_FTS) required by the
+      Receiver (this component) when transitioning the Link from L0s
+      to L0; advertised during initial Link training. Each entry in
+      the array specifies a PCIe data rate
+    $ref: /schemas/types.yaml#/definitions/uint8-array
+    minItems: 1
+    maxItems: 5
+
   reset-gpios:
     description: GPIO controlled connection to PERST# signal
     maxItems: 1
-- 
2.34.1


