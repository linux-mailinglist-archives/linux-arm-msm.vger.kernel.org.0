Return-Path: <linux-arm-msm+bounces-74195-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EBF5B89E69
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Sep 2025 16:24:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BBE93A04D5B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Sep 2025 14:24:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D9A183148B6;
	Fri, 19 Sep 2025 14:23:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CUjREkX7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C905313D75
	for <linux-arm-msm@vger.kernel.org>; Fri, 19 Sep 2025 14:23:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758291830; cv=none; b=aS8irQQBQsGDGBDIVprpDcefh174zvTwe+R8EiCJHooLK/znz8/0ymbuT/RdhpzzPNoP1k7Yq5VgyoHt6IeFpIvS0KObkEdFuRqsSbK2ZSkKCYHFZ4DwbLQdXP93X71ZMR0cVeNT0l/7IZbpDIwx0Czc14cp5cVX6izKbv68x8E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758291830; c=relaxed/simple;
	bh=WrctqBG5yal8gLgqGrzL6aanaaRl0HBq6tsGt6dAVGE=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=V06IiiqK7/3yBNqRz5GqcKhF6HXR0JIDtZDN4s/IknE0FDY+hges73mp3UDQrqd+mXhsBgtkTCi+LfC0oZ1ad6GPQ+ZP4ib3LqjAM0qRKsG8sjtFjHxrbZi5vdTsGdWZVQefNCq09qG/Wxx3o5bel10m3ECCS7G2ajPKaITgXws=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CUjREkX7; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58J6UnrL032419
	for <linux-arm-msm@vger.kernel.org>; Fri, 19 Sep 2025 14:23:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=H0MOngd9nnOaMlhiVp3d7MqH4YoWgLyveqG
	b+3qi4Vc=; b=CUjREkX7e+91P4hZSHghPs8G3g49mWfx+bJA8NQAcxe5eKd0wmP
	G8dFbKIhCur0NciKhFAQMaPN5ry1OeyuvUZFqt6DqQxqACQjK5Oly2zW9LuHH2OD
	kJOIbySvNFsxAMol1MGiHnGoeA4PPk/vtGKQ1wqlOnQ4ySE2IFNtAejJzyYHdmtM
	+bu8HMH10Wv+JG2jux7sDsW53Sk/kKlXbTJUeNxUB3VxQTY1tmdbuxZmj5KTxwXV
	yrlrYvKmEXHwxak3PN8c4vtLa5LLisL7+W11gQowbqqIBsz66YT3i/U37/nXMUxW
	f5thC3XPz8Ugv+PE9VLq7p7BIWWLN3SAblQ==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 497fxytqaq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 19 Sep 2025 14:23:46 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-77ec1f25fedso846074b3a.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 19 Sep 2025 07:23:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758291825; x=1758896625;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=H0MOngd9nnOaMlhiVp3d7MqH4YoWgLyveqGb+3qi4Vc=;
        b=ivB7UXvHe9Z5/aSnyrCWU60Awn/GE0Q629PCLnkESinmd7nwRRYlM4GrTJ8b7pkfDc
         o/oHGl1w7Pu3KdOl9NhblNa6cR0qYMBA++YsAgfnHbMGt5pzH0EqkIXcuuKDcod3HiA9
         5J2gCC4yFNwdBcG5BkvAT/OrNarQmvcm9aiVMrIUwSZqjbnIL5qPGvfQ0PLO5v8yJNnA
         qzmDGF66Lfcp74eOm5c3IUFhrCNzZaCdXXZWvlbmOA5ZAXBaxcg2j7ImA/PjjbsO+dCi
         0SW/igoQMk5DJGYpr6qJiFTwf5KvYCpoKI8Bq80HJ7EZO5ypmThsnyex+UTg27ziewNB
         EJXA==
X-Gm-Message-State: AOJu0Yy0MkxI0eHsRPuH+En7qE4dGz81XG2qtnm8gt9rzRMOsi0iLCAs
	s1BRBmeN3X2Ey9DnajpqKiP3ooijfqKV6ZmTGSiZ9p8hUw50dBzjXqrJvdGALbpEqAGu6nk6E0n
	jnxezJrYyKg76+NHH4/fqib2Yf4eR34ENfZRutgcq5E06j6YY27J1LORtKe3a04Xk2agq
X-Gm-Gg: ASbGnctdDE/YkWL/l82l5bZbS2QfdN1xhELJ7tajrBeagZRhC+G2YfvA7erfQcuhRXy
	+9fnI10qrygmr5D8AS0+ApQEHQnCFKUsv/g/i/3vE58qcFMlnduQElj0b4TOwINFT/slqhX0f2I
	RUu+0EOiwRaAtalTLNS0RsBa1mHFFNr6hcoXZACHub+edMxaVxrm4d5kZyPbsXKoGRlSORdybxR
	kLTjdd0JtD2+ErFk1PFFuUXg8ZyzaxUnRnet2+lzQjvkiTw8eV+QeqJ7txtGh/60knGVI7i3qgz
	G7haZev9bIR/OZ1sIOotqpHSDrUlE8sZpQvOVy1gTdrtdFVeIFzNae6yTih2Mowqu1XuW/T4k2l
	KT3Pp0HIBUZSNTCLCLm9OhYwK1QAiulkhQ1gO0dmzuXvdTigcKxCf2lvNs32w
X-Received: by 2002:a05:6a20:7485:b0:262:23dd:2e93 with SMTP id adf61e73a8af0-2923a323a25mr5577765637.0.1758291824917;
        Fri, 19 Sep 2025 07:23:44 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGsFVhcjm0X3oNhORINQVqZ5ZFstDem6nqXS91CKPxgvJ43nQqgJn2edyW48rEB6IkCNBZ2ng==
X-Received: by 2002:a05:6a20:7485:b0:262:23dd:2e93 with SMTP id adf61e73a8af0-2923a323a25mr5577720637.0.1758291824430;
        Fri, 19 Sep 2025 07:23:44 -0700 (PDT)
Received: from hu-pankpati-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-77f097b60e7sm1335147b3a.1.2025.09.19.07.23.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Sep 2025 07:23:44 -0700 (PDT)
From: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
To: bhelgaas@google.com, lpieralisi@kernel.org, kwilczynski@kernel.org,
        mani@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, andersson@kernel.org
Cc: linux-arm-msm@vger.kernel.org, linux-pci@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] dt-bindings: PCI: qcom,pcie-x1e80100: Set clocks minItems for the fifth Glymur PCIe Controller
Date: Fri, 19 Sep 2025 19:53:25 +0530
Message-Id: <20250919142325.1090059-1-pankaj.patil@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=e50GSbp/ c=1 sm=1 tr=0 ts=68cd6772 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=UB6fr0ZYtwJW8fNbdQgA:9
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-GUID: POlMMPtzS4HL0QlsuRnjJRObLh7j6nFS
X-Proofpoint-ORIG-GUID: POlMMPtzS4HL0QlsuRnjJRObLh7j6nFS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTE2MDIwMiBTYWx0ZWRfX5gH0pb0YmPJd
 noozsDTxTucANvqsk+B6sfeft6Cqu7w5QeG0nY/VU7bRzISp98+lsvhOTLImEvfKBGAfZycg46x
 Ih7ux3DhuMSAcI2RW6azOj4IZnsQzcNYTm5UC6zsyfjcZQsudQfHcXXqS4boy0V2ikDKhao1aBO
 MGIllixBTjMMDQw/PmQCxa65XVO+5LEaAIGpkRPrP055jsxMGNPNmOPFiIMi6KtmkKDeYkx2GiU
 A6bU0RkaPQUQM4a10AHR5/vgDWeh7jAZq5yOKuztDOiOFYxAgljvgd7PFgoxkipP5aRKRaTxD5C
 +1gQGdWyppi/162yQiUW8nHBrCxPMqjnhnXrVCy3NO0K76j6D6nfeUWEBBkpuRpXWVQkKJgKHTU
 b2ZmY1ZZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-19_01,2025-09-19_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 clxscore=1015 spamscore=0 priorityscore=1501
 phishscore=0 malwarescore=0 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509160202

From: Qiang Yu <qiang.yu@oss.qualcomm.com>

On the Qualcomm Glymur platform, the fifth PCIe host is compatible with
the DWC controller present on the X1E80100 platform, but does not have
cnoc_sf_axi clock. Hence, set minItems of clocks and clock-names to six.

Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
Signed-off-by: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/pci/qcom,pcie-x1e80100.yaml | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/pci/qcom,pcie-x1e80100.yaml b/Documentation/devicetree/bindings/pci/qcom,pcie-x1e80100.yaml
index 257068a18264..61581ffbfb24 100644
--- a/Documentation/devicetree/bindings/pci/qcom,pcie-x1e80100.yaml
+++ b/Documentation/devicetree/bindings/pci/qcom,pcie-x1e80100.yaml
@@ -32,10 +32,11 @@ properties:
       - const: mhi # MHI registers
 
   clocks:
-    minItems: 7
+    minItems: 6
     maxItems: 7
 
   clock-names:
+    minItems: 6
     items:
       - const: aux # Auxiliary clock
       - const: cfg # Configuration clock
-- 
2.34.1


