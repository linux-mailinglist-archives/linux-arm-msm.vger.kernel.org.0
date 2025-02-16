Return-Path: <linux-arm-msm+bounces-48123-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 45B83A371A1
	for <lists+linux-arm-msm@lfdr.de>; Sun, 16 Feb 2025 02:46:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A947A3AF7EA
	for <lists+linux-arm-msm@lfdr.de>; Sun, 16 Feb 2025 01:45:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C8B2753A7;
	Sun, 16 Feb 2025 01:45:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QNGkFf93"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6883A171CD
	for <linux-arm-msm@vger.kernel.org>; Sun, 16 Feb 2025 01:45:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739670343; cv=none; b=hSTjFfoOWjh6llRykvECBaP/yxAiXE9a63h/DTsanKIuNGUs9MejOagab/6Y9zA09X4xSNGfC/WJQnIeaPv4dO7Kh5vM8M6FhuvJYL25VTcF+C/1pn+brxwxWL5wauy/tvs6naZgCY2sNdOkqzXajzyaTgpF9rTiG//Z/gYEU20=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739670343; c=relaxed/simple;
	bh=Fk5tEvSGj966u5MNAJ6KeljaVlxKuCrisn/aqCxdhBw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=BQlRCa4nk361RcbZHRKPRr/7kR21dgo/5gzMu5m9iw0lTfEbp3r5kB7cWVgV+NC/gUteXLIJ489uAwoHCRwDayRZk7sLm/O+PYc6uBpvuL8IMiAuS2z0+cO6+LwLP6gNBOcJKqaLSvHrRz7dvpGAlp8f7PXWNTmjahEfgaDqeEc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QNGkFf93; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51G1glWm013084
	for <linux-arm-msm@vger.kernel.org>; Sun, 16 Feb 2025 01:45:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=uBFsWeSYOmq
	gaCuFxuf/xhhEESZ518ip0a8YRr+64yE=; b=QNGkFf931rknH/8YWJAz9QemnD/
	f9RRsMjk5UY42TexsNNRuSOT5PlGKFuac1LCUTX46Q4AxVf9Vg8SQnNSIDq+JDCS
	LJkAZaZZJQsB4xzs+c+DTty0iJaYTm9RnxQaonF6VTjoEGMBlSIdJwxtrdlDCb/a
	6NwxEQRrNN1hiXkoIzjm9cPHcYlbNoVTYjvvE1CiimWecBrtbGXwEuvBzpCah6AM
	doEkLusongbS9ucxtJFGv93zaMsMBM0XQXTELuM+SYK3LZEwwuYsCsoLl7VJilXS
	7nqMcHTkiXus1EiuXt5YyIVH8YD35tHAnGEJ/2Dh48nv9b0OcPvSbGx1ouw==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44u46hr52g-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 16 Feb 2025 01:45:40 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-22107b29ac3so10999855ad.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 15 Feb 2025 17:45:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739670339; x=1740275139;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uBFsWeSYOmqgaCuFxuf/xhhEESZ518ip0a8YRr+64yE=;
        b=DPhRgreA0S1Da1vX4OcgMFh5Sk2jDTsWjlGxbdAWUn0HIyaklHJN2Yw7yHDIHAYWbj
         5b9zTc0pDzIGSAG10d9moUk8dJc5yEUEGd20qfXrcMoSdi6JSF7b+LwrjBrDRe8NkhMv
         IIaWBkVV8rLw7/Jhzi0N77cdW8f6NR+QQFio0ivKUNrCHFkPODIgvRjg79qYHzgpzhBS
         RtJEAwolhA1lctrO0x10szW1nHp7zXbrw4Ew1+oENGmUtqNJOl0TNJChaHpj/5EPQrO/
         cNwBWTBzoWegoY3XaJdNiZCNYfkxqyX3R+3mn7ahMWbPROHGLZJ0yplavTex/A9Q1gPo
         PUOA==
X-Gm-Message-State: AOJu0YyIqdZ0HWsYrrHE1au+F/xSnTquxzG002lLYtczbgFVpUujq4xU
	MPGkmP58LRf178Ajw5YWw7qqEqnHbDKFcejIuDZAMySraAAfksexMZ+yQEeFuaEvj2S7FfS2+Wa
	ENGzD6ch0x4we2ksE27ka43QK8h1mrKUwntqQhypH9i0pdIue73U9Y3znbOWIpfsn
X-Gm-Gg: ASbGncs2Jskntz9QYOzhCh1zHhudDOOwHxsz3tCwm2XAJM9RIlgxDza1QezReCXxNkZ
	38pOFafaVqG96qJOTn8TVBgoy3U3XHc14kaVUxVzUgO5RI2r4upAe9eGM8HMZawgMTr5rLPKyaA
	5E8AP+E0RuhP/PGKPkK8YXaNzvtBDHd+u+1UP905g9xRYokqeNnKoC+RSmRhjvkpIigCIxtFZ3j
	l7FhT5mpG/I7N8J1tpJEwcXx3XaRtau0C9IvJ+bstV7jFok0LfLHWlNnXsoNSlPfKJBZspYhY/b
	wZ+a4nogXY3Z5YcxmT1QBGeU72Bot8orzUvtR13w
X-Received: by 2002:a17:902:cf08:b0:220:fe36:650c with SMTP id d9443c01a7336-221047179dfmr77347075ad.23.1739670338771;
        Sat, 15 Feb 2025 17:45:38 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFtn0S+vjVcVhx9pqmU7t/1GUwT1n4B1MxV5GxUJhmy6ojrRHtS/+9ejqHefQ8Ia6K1n3p9LQ==
X-Received: by 2002:a17:902:cf08:b0:220:fe36:650c with SMTP id d9443c01a7336-221047179dfmr77346735ad.23.1739670338393;
        Sat, 15 Feb 2025 17:45:38 -0800 (PST)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-220d536455esm49896955ad.74.2025.02.15.17.45.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Feb 2025 17:45:38 -0800 (PST)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
To: andersson@kernel.org, robh@kernel.org, dmitry.baryshkov@linaro.org,
        manivannan.sadhasivam@linaro.org, krzk@kernel.org, helgaas@kernel.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        lpieralisi@kernel.org, kw@linux.com, conor+dt@kernel.org,
        linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree-spec@vger.kernel.org, quic_vbadigan@quicinc.com,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Subject: [PATCH V3 1/2] schemas: pci: bridge: Document PCI L0s & L1 entry delay
Date: Sun, 16 Feb 2025 07:15:09 +0530
Message-Id: <20250216014510.3990613-2-krishna.chundru@oss.qualcomm.com>
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
X-Proofpoint-ORIG-GUID: rl9kactEAaETBInPoXsVWoZsdeVzAkKs
X-Proofpoint-GUID: rl9kactEAaETBInPoXsVWoZsdeVzAkKs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-15_09,2025-02-13_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0
 priorityscore=1501 adultscore=0 suspectscore=0 bulkscore=0 impostorscore=0
 clxscore=1015 malwarescore=0 mlxlogscore=999 lowpriorityscore=0 mlxscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2501170000 definitions=main-2502160014

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


