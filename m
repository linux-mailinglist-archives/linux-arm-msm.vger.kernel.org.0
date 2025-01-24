Return-Path: <linux-arm-msm+bounces-46055-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B595BA1B34D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Jan 2025 11:11:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 02D35166048
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Jan 2025 10:11:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F353721ADAE;
	Fri, 24 Jan 2025 10:10:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FVlqwrG8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75F1621ADA3
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Jan 2025 10:10:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737713456; cv=none; b=KaBmv0W1y7ePHpOvIt4iHTv6IjIszKdt8ebtrnLpu96vkNcE59rXgQJasRnR5+cB8h17IAXjLo926lh+MVshGnSuLCImPAa1WAI1yRCXchxMyauIwVPzlFe4y0i2NpPYAeNHiBpF8+mbe8L+FtoiYCp4t0y2HpBVydMFYX9mdjQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737713456; c=relaxed/simple;
	bh=Fk5tEvSGj966u5MNAJ6KeljaVlxKuCrisn/aqCxdhBw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=GY5AluznhOH+J274c3DtGxV7ppGwEU7EaVD83ttEYT3cdjU1zcDsgDB80iUdvybpZd0dQ/ee71d9Tz+U6O3RCbi4UnioKsuxuL+m/HGDUeuO0XugDF3bGzkORBBAZAh2G9vYFaYJFID38BqypodPetdEPmcwbCYvsm2ZWoTLt9g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FVlqwrG8; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50OA5V3R010861
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Jan 2025 10:10:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=uBFsWeSYOmq
	gaCuFxuf/xhhEESZ518ip0a8YRr+64yE=; b=FVlqwrG8kWkeOwjHm9xKD+PcQG9
	fw4csyL8n+BKPWeO3L9hkJxkGu1Id58THTwtWf7wt9eZvvRiDQt7Suq/HumcQXOE
	ULoVPw7DXNnxI7kT6jyb0IniKSdh3qp9NZvpu1ER/dM5uxYIqXjCqD1koLulzQIm
	gHLv+Fde3fjDbB1yHgTpqjCFrzMICjavnPUwCdIMdvTaZPNMeOcQ9ChVIJ3oZDbR
	CYxRfirfpo8I8YMKEntEXOYmgyn2ndtHboJetU0QgkdAcxW73NlxaAYjwcIKxzdN
	v7SRa0kcHeLTgZQaIg49ciozSc7OgGIBxzjm6hXhUkxfk26aEy9LfznZexg==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44c8ta80h7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Jan 2025 10:10:54 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-21640607349so47596035ad.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 24 Jan 2025 02:10:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737713454; x=1738318254;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uBFsWeSYOmqgaCuFxuf/xhhEESZ518ip0a8YRr+64yE=;
        b=Rq/ReMu8KuWgSnBkRQQU2JP0EsWC1a3/kB/lw/0U5bOD/z9Ioqj4eRXWcKaAwQYBgt
         QgBXHwEEKutvJA+z8TC3rw/p0Z7Nzo9WIgvWcrgNLSl87VYvlEQk5oql3D9AMwcZNFDe
         VH8hE8ENTp63HM3AyT+i/o5FMogw609VNvtRAJaShzsh/9bhMQ526xSgz7ys08a4sk1L
         LvBF5Hx+Jor3ILnSLxI4lWVHxRpLXy1hpw2w63uTR6z8YmBSEdHKIj8JV/OnGdXIiGsk
         bxKzodLKE3rpo+nYLSmWCOysPVKtGgJKXSTEPZ3JjNJZTXsaeRjgt5HPD6J1EI9lJCLM
         mLLQ==
X-Gm-Message-State: AOJu0Yz69aqiATtDMybkizZq4BpIXtAYMGyp4yot12vkIcCXBWSGMcqy
	1BOeykgCPnmCgqVeKtkHrPmvzmrDIIV4otHgrmdPbHXRkYrNEmCAhkNRh1sHUyfeIZO6XpPfgrp
	SC9Td/W8eat+YwfPixkp/GUI9b4wQJPD//E7zPV3YjU3XOkhBRk9GXAE4GRMeavBwH8xMrL0K
X-Gm-Gg: ASbGncvFxEAfSsHpC0Ms3PB4EaYtkuMDT4f3UYhcvMwKvlNcnAjIR5z4em8UmYRul6I
	a3ZEwWMQFNM0GsvMWF41D5kgXZTKQ/c9OFhb0Glm1/Fb5RdpHx1Oyx4uOcJXm9DC6ErubcDqznO
	5TQug505nKPIMFsTo26ctJGHMsSdiHW1oHSTca/mPxgUVSNA9bwS6bUJnDa026QGlQk39GDG/qt
	TRmhlVVZ7p2hNC+gl47xdOsZF+QYb4r9eNtodiy7li24K1agMe8A6YgcUCOy42i1rUzQztw/0P9
	RnQvX40Uf1nn1EBmhOASMp/lckuxOQ==
X-Received: by 2002:a17:902:da82:b0:215:f1c2:fcc4 with SMTP id d9443c01a7336-21c3560f672mr436882835ad.41.1737713453668;
        Fri, 24 Jan 2025 02:10:53 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE/nEpZtyW54k6KlPky+UJchioawmSuyEs/SdUstEm5FKB1Ac0u4oF2S05Nb02C99nATcAMAQ==
X-Received: by 2002:a17:902:da82:b0:215:f1c2:fcc4 with SMTP id d9443c01a7336-21c3560f672mr436882485ad.41.1737713453326;
        Fri, 24 Jan 2025 02:10:53 -0800 (PST)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21da4141dacsm12773825ad.133.2025.01.24.02.10.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jan 2025 02:10:53 -0800 (PST)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
To: andersson@kernel.org, robh@kernel.org, dmitry.baryshkov@linaro.org,
        manivannan.sadhasivam@linaro.org, krzk@kernel.org, helgaas@kernel.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        lpieralisi@kernel.org, kw@linux.com, conor+dt@kernel.org,
        linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree-spec@vger.kernel.org, quic_vbadigan@quicinc.com,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Subject: [PATCH V2 1/2] schemas: pci: bridge: Document PCI L0s & L1 entry delay
Date: Fri, 24 Jan 2025 15:40:37 +0530
Message-Id: <20250124101038.3871768-2-krishna.chundru@oss.qualcomm.com>
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
X-Proofpoint-GUID: ctnPVftj4GgMAx4J6P6Oht2odavRnR1O
X-Proofpoint-ORIG-GUID: ctnPVftj4GgMAx4J6P6Oht2odavRnR1O
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-24_04,2025-01-23_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 clxscore=1015
 lowpriorityscore=0 phishscore=0 mlxscore=0 priorityscore=1501
 malwarescore=0 adultscore=0 mlxlogscore=999 bulkscore=0 spamscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501240073

Some controllers and endpoints provide provision to program the entry
delays of L0s & L1 which will allow the link to enter L0s & L1 more
aggressively to save power.

These values needs to be programmed before link training.

Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
 dtschema/schemas/pci/pci-bus-common.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/dtschema/schemas/pci/pci-bus-common.yaml b/dtschema/schemas/pci/pci-bus-common.yaml
index 94b648f..a9309af 100644
--- a/dtschema/schemas/pci/pci-bus-common.yaml
+++ b/dtschema/schemas/pci/pci-bus-common.yaml
@@ -150,6 +150,12 @@ properties:
     description: Disables ASPM L0s capability
     type: boolean
 
+  aspm-l0s-entry-delay-ns:
+    description: ASPM L0s entry delay
+
+  aspm-l1-entry-delay-ns:
+    description: ASPM L1 entry delay
+
   vpcie12v-supply:
     description: 12v regulator phandle for the slot
 
-- 
2.34.1


