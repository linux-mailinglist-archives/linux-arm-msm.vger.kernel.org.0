Return-Path: <linux-arm-msm+bounces-43983-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 39F4FA021EA
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Jan 2025 10:33:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C065F3A1C13
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Jan 2025 09:33:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B211E1D8A0D;
	Mon,  6 Jan 2025 09:33:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IJpz3M34"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 234681D61B5
	for <linux-arm-msm@vger.kernel.org>; Mon,  6 Jan 2025 09:33:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736156015; cv=none; b=T3pRnvQxyARjQG91dVDNsfM3mG4PLsRg8NkopXsP5Ipy7BcwZOkAAEG8jKyL2FFmCSwkrQd9OkUXzWinqI/cMzBSI2AQoxmYG2GXwbMu8T/ISNtGWa6x0TEOzThSFBWndfD9z5eYudTUPIfTBxf1AKezVF/BPhz7HGDKhLY3TpU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736156015; c=relaxed/simple;
	bh=u6ITWZK6Pnui8R/rp+fW3eZGVRboaltac30M06+tTJY=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=YM93gRTyfH5IULZ4/q/dtO4+dfhSCGVLh41QgFmTnwFApFWbT6T5Mcc8XCnqu4V/5LZSU74hZsuuZikNTECrvFkp5SX7pCPAwJHJq/GEMmX1+2UQfBSlmMUSQ92RZp3lRowHrVHyJsVIXYK/9tAOpGCxIylTcbMUabmGjV9pcFI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IJpz3M34; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 505NVfPD024636
	for <linux-arm-msm@vger.kernel.org>; Mon, 6 Jan 2025 09:33:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=Ooc8CaBX+hRHDY5DeK/hHvsWjudmqQEAdI9
	cWCPXiSU=; b=IJpz3M34yCiwp5zx/LTp3uU6muWxlExxrA73fpDOmFtdnnfKxZH
	ujwFw4wA7tbbuN/HcU9KO/j0Bian2erDSOh7uHcqa/FexMvDzTcnfPWQmwVj1YQG
	egmpeGb2kwhuhUdt0t12tQzxh1CGJPOl4qwfhLK9DPq2wxyYaNTY5lVUCGmpP2h2
	DekO4nXZrtWXQWYkWzu+DDOa5IIgf/X8MPPQ+04D8UFbCiwGBcL0j+hpBiDWgMED
	FJYlGTluvt+/4Sa9LIfuZ4wN4WgGX8rvIoLE/C9OHlnmNZOdK5BnQZ6A/tSFdvGV
	ppcEFvhwCeci6TkfD7z1qDy4SE+nzI6paWQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43yxnn9c2w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jan 2025 09:33:33 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2166d99341eso203248495ad.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jan 2025 01:33:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736156012; x=1736760812;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ooc8CaBX+hRHDY5DeK/hHvsWjudmqQEAdI9cWCPXiSU=;
        b=eRQIkj4aTdHtj+ksnPfycSG8Rb5QC1YM1vn5GGWPy9mxX5uLOIUrB3KkjA+cO22+6s
         8Z6EFVP0yv7bnWVmLfh3IdqlfRM6SF5NZFeV2QgFBpwNDP9BErLoJA4DTRs+OUkKe8Uh
         C6YrC9D8wXvbE5fXCWYevfwqPDNL31ocjsZ5Tv7KrbLuVeWfM20vd6uKwcR2EN7/seSH
         juUAAXZlRA5ZkfjDOa/1vs6Ynlz4R/WATit1tlhB2N0KMyHH0PIFE7MLv8GGtA53TtFS
         NqlX5THSSqvoC0J9fg7HOpVwwT1HqSBJUesOofEodsukdQWQVoEakf20309x99zzRk1S
         BL/Q==
X-Gm-Message-State: AOJu0YwYErOmObzDbY8s/TEPNQlk/n5rPnUhuLgsRDl0aFU4W7O2XQ26
	U8JQbQ0zmJJ8bN+ybA1rKJzvXk9o6/MRfuJbPGjiBhWF4sab4dqa7dCynp85/VkBPaMz5I4iTHp
	zG7eLCA72+AQNHPj59dDqf//XiWxuryBm+gCFzIAd810kfEWRkgeiRJloR8NfO4nm
X-Gm-Gg: ASbGncu2SxpKf8iqHPpiFeD73BOYP6Pw+brEXN9zOr/VKMLbfA+KPMDeRCsoKLbtZi3
	+1C8x0NpPsqsDj+nIceZx6Pu5Eql7qut0l/dptvqaTzjXzE2g76NhIiU6lhM8UuDNi1UV/foHHz
	RhDA+S2suNbBI7lonaWPP77NOFCJ2UJ1Wj5scpczh6a0ECAFHepBSmGHGaxZ1IXPRJiZP+qQXKK
	QJoO7PFnCm2MABamTKMbFe5r70mqtfdCEXKWkbi0491KoismOSjrXKOMDWpKhnFh5XrUOCyjW/a
	X3fSsj4/TUFv+sH8
X-Received: by 2002:a17:902:f685:b0:219:e4b0:4286 with SMTP id d9443c01a7336-219e6ebcabdmr705471505ad.29.1736156012417;
        Mon, 06 Jan 2025 01:33:32 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFgBkTe3UZfkvpcZzMY3x0JbZEG0gq0kNqGGbjEBJ5gyLmgAR+ikmyKbTEvWQACPEWxprKFPw==
X-Received: by 2002:a17:902:f685:b0:219:e4b0:4286 with SMTP id d9443c01a7336-219e6ebcabdmr705471305ad.29.1736156012068;
        Mon, 06 Jan 2025 01:33:32 -0800 (PST)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-219dc9f625csm281079085ad.208.2025.01.06.01.33.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jan 2025 01:33:31 -0800 (PST)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
To: andersson@kernel.org, robh@kernel.org, dmitry.baryshkov@linaro.org,
        manivannan.sadhasivam@linaro.org, krzk@kernel.org, helgaas@kernel.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        lpieralisi@kernel.org, kw@linux.com, conor+dt@kernel.org,
        linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree-spec@vger.kernel.org, quic_vbadigan@quicinc.com,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Subject: [PATCH V1] schemas: pci: bridge: Document PCI L0s & L1 entry delay and nfts
Date: Mon,  6 Jan 2025 15:03:04 +0530
Message-Id: <20250106093304.604829-1-krishna.chundru@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 1e2w216RE32uKbsQ2Id7uiXQ1zBvW6Uw
X-Proofpoint-ORIG-GUID: 1e2w216RE32uKbsQ2Id7uiXQ1zBvW6Uw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 mlxlogscore=999
 lowpriorityscore=0 impostorscore=0 clxscore=1015 priorityscore=1501
 bulkscore=0 malwarescore=0 spamscore=0 phishscore=0 suspectscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501060083

Some controllers and endpoints provide provision to program the entry
delays of L0s & L1 which will allow the link to enter L0s & L1 more
aggressively to save power.

As per PCIe spec 6 sec 4.2.5.6, the number of Fast Training Sequence (FTS)
can be programmed by the controllers or endpoints that is used for bit and
Symbol lock when transitioning from L0s to L0 based upon the PCIe data rate
FTS value can vary. So define a array for each data rate for nfts.

These values needs to be programmed before link training.

Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
- This change was suggested in this patch: https://lore.kernel.org/all/20241211060000.3vn3iumouggjcbva@thinkpad/
---
 dtschema/schemas/pci/pci-bus-common.yaml | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/dtschema/schemas/pci/pci-bus-common.yaml b/dtschema/schemas/pci/pci-bus-common.yaml
index 94b648f..f0655ba 100644
--- a/dtschema/schemas/pci/pci-bus-common.yaml
+++ b/dtschema/schemas/pci/pci-bus-common.yaml
@@ -128,6 +128,16 @@ properties:
     $ref: /schemas/types.yaml#/definitions/uint32
     enum: [ 1, 2, 4, 8, 16, 32 ]
 
+  nfts:
+    description:
+      Number of Fast Training Sequence (FTS) used during L0s to L0 exit for bit
+      and Symbol lock.
+    $ref: /schemas/types.yaml#/definitions/uint32-array
+    minItems: 1
+    maxItems: 5
+    items:
+      maximum: 255
+
   reset-gpios:
     description: GPIO controlled connection to PERST# signal
     maxItems: 1
@@ -150,6 +160,12 @@ properties:
     description: Disables ASPM L0s capability
     type: boolean
 
+  aspm-l0s-entry-delay-ns:
+    description: Aspm l0s entry delay.
+
+  aspm-l1-entry-delay-ns:
+    description: Aspm l1 entry delay.
+
   vpcie12v-supply:
     description: 12v regulator phandle for the slot
 
-- 
2.34.1


