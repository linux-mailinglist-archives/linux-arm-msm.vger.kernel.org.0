Return-Path: <linux-arm-msm+bounces-74842-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 82280B9CF05
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Sep 2025 02:53:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 389883B6B6E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Sep 2025 00:53:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 665A92DC764;
	Thu, 25 Sep 2025 00:52:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QkMLuuqs"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B64AA2DAFBB
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 00:52:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758761561; cv=none; b=A4jAEeZkkNF5M9+QBUshRFEC5L4KTqt1MrKm4kxuTKPtq9aTlBXaQ4l+I7AISKXsX9Fxrb4/y6ODXW2UjkC5fgjzSn9LNqMGa7gHUpDTZm4PQlx1UmASIQRE38TorO0yjKm3QPGddovVUHa2RkxZC2uV5w4VBmXLzNHVfhjQKRE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758761561; c=relaxed/simple;
	bh=y84fa6fvuCZpJxjEsWR6XfroWoXIZOXTyVARiLBoUh8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=abynAeX5CgZXeO4ZEjPWgyWSiv1vieedlb+5gU1Dq/BWuZBCN1d1JwvF75GOJGL8yITv1H0vtJTSJP8bGZzKWSv2ckRpo1HazdoLIdk2XEnAzAPCSVNQJDVppneYTBKH/pwG8Mj0grLFj/hDOo7tsbVOHsdQPmMRpik2ZybVdXU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QkMLuuqs; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58OD3tBo018716
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 00:52:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=g6hGIMMv3wb
	uPomMpx8H8k/GiKEKmx7JPEl9gfJaIng=; b=QkMLuuqsFM29KbrDAK/a+azVlvh
	YnT80zPogffOPos/f7UhMCxbu8q8dg6fw2va0FA4lDlJNTygR1GmoLIiI/gNjYAU
	RRyFkrHEm8JmqfN7RBUHDFT/R2c26xLpD1lGNmAsdM5gQZ+LTCSGl4ZbrktblIAl
	hlbaNy2aPmXqx0lf3jd22IyFnuSzga2dTFEn8vxDFp5SrllI6T/IMrSAAGRr7d0L
	wgFo9Ynh0Yyd6zU6jBtGT5qLUFawM9jb7Tm5RA957Io1oPcRulDaxeKdj+O3iKHu
	iqzoBu69UWqPxV/xIRGnyEjVTQNpW+RAFi/AsEbSnS1Nsv+o/DCXkvThaPw==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49bhvjyj3v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 00:52:39 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2697410e7f9so8596845ad.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Sep 2025 17:52:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758761558; x=1759366358;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=g6hGIMMv3wbuPomMpx8H8k/GiKEKmx7JPEl9gfJaIng=;
        b=LSrtly8ma10PqZ8AghtLWmixwszR4fjWI+fUue+oZAFNUay5pSZosJlj5cpBIgFg2E
         zKwWN4iVNg2oS3zE2Fo7DSYVO0YuGS+2NkD+0qrMHYMkAoicQzyOgvrIdRSIjgKYO6JK
         kU9iZ3XmxT/2LAP1/54UwPRKOnBiigetSHNM5uoWSvq29InV0d2Jw7HpejTygFQaYwgj
         Px2mzac3NbiNbgDPpchY0YXX1kmWih2s403DksK7epsDG242++Zlst244uJZaOc/Qfvi
         tJqKEGS9Zog6PHVlc0j1GydetIcF8rivs3pJXWRYb36aS4L/XGE+7tNTSWu1/ZIMPNZ2
         ncaw==
X-Gm-Message-State: AOJu0YxH6htxzW3szpanBHTqJgwhE+ABkXnf33DNmEHuRj+5zBsT5iPA
	ahklp3CdKVGKyMl47hKIQFG7JxzRiVvO2iEHQQS81T1KRHGyS1/m4nEffI0do3u1rmVcz0ViTUQ
	JerMQpsr8BHJuc1DZKLPNQLHPIn/pDysfXY4OTgWKJoz5tY+9ttXdwl9jZqX6LqV3f2+b
X-Gm-Gg: ASbGncvEqIPakQ2TXzZ2CFYEfQMh8qKB3F1HZElQSJUdthMq4pNST7qunZDQNV+YNmj
	gLxyjzir5a9GZVuWZ40OpgLx6JQHO/I3zA+jho/TYJeuXbaQeK8vgaT066SMir9/oGjsAiDx5rw
	CqOmGIyVITyurdAd2DeTrn9E8x2iPCFdFkuhy77hB3+Y4VeErcEwv3/FqrlY1uzmIHSVgtD7Q8q
	awjF7vgenpKyREj9xjXxIOP4+Y/2sFEzeLyQ87zr81htKLUYy3BVCHrxwLSIm+Ntyp1P2ost2eQ
	NuQFrAqHhpUNtkBiQNPN85Eiwy2+Nr488eq0bV3EjW99vd456rhWogUKL7mpIIQT7iwIwrseuUE
	rzKDAiEuZC9Ox/yI+
X-Received: by 2002:a17:902:e84f:b0:26a:8171:dafa with SMTP id d9443c01a7336-27ed49df04amr17503605ad.21.1758761558247;
        Wed, 24 Sep 2025 17:52:38 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFhvOp7wNsS51SpI6EOA2HUs8VBQEy/ZyUwfDL4ym4Id0/ZhPRPzk6mTrQR2czfWa7itiQZ0Q==
X-Received: by 2002:a17:902:e84f:b0:26a:8171:dafa with SMTP id d9443c01a7336-27ed49df04amr17503285ad.21.1758761557758;
        Wed, 24 Sep 2025 17:52:37 -0700 (PDT)
Received: from hu-wcheng-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-27ed6ac27d4sm5238105ad.135.2025.09.24.17.52.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Sep 2025 17:52:37 -0700 (PDT)
From: Wesley Cheng <wesley.cheng@oss.qualcomm.com>
To: krzk+dt@kernel.org, conor+dt@kernel.org, dmitry.baryshkov@oss.qualcomm.com,
        kishon@kernel.org, vkoul@kernel.org, gregkh@linuxfoundation.org,
        robh@kernel.org
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Wesley Cheng <wesley.cheng@oss.qualcomm.com>
Subject: [PATCH v2 04/10] dt-bindings: usb: qcom,snps-dwc3: Add Glymur compatible
Date: Wed, 24 Sep 2025 17:52:22 -0700
Message-Id: <20250925005228.4035927-5-wesley.cheng@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250925005228.4035927-1-wesley.cheng@oss.qualcomm.com>
References: <20250925005228.4035927-1-wesley.cheng@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: lGVYw-jXyoAzZDLqMngIUd_1MflIcZRL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIzMDAxMSBTYWx0ZWRfX4Yk3/OCTkEM9
 OIAR84v6uVzFRAzPBzpe/vzpb7y2rAEc5ywmHrMqLOxnZadYOsPrT9M4xkNHppVFq0l4roFe5MR
 MWWZUcrP3I7EQd/yXD+2ZNGTsyyMdYfkT6GPNqmQKoRY2zM9yrWyzLDllCH9EPB15Bx6Qn1zQqm
 mEdmngtJ2h1Tw6AG486Rqpnvg1Hcoq+vTAPuhLXxMdE0WMgPMXGTcSed3KHSWtjA6RvSzjJS7np
 5FDwoEZhhUXssUodEDW3iLv3jQjofZScgG1EOfDUvzalrgwnoiGS2GHRIh9CFE/BXMLZ0z1rEFv
 pWIBAJSYgs6yZukb8q3YQ3zZSGGKp4XkDgAlX9IsidX5zhGyzPnwAbLNpxb43+xBgsq+vgfuS6n
 fo9hhpAH
X-Proofpoint-GUID: lGVYw-jXyoAzZDLqMngIUd_1MflIcZRL
X-Authority-Analysis: v=2.4 cv=Csq/cm4D c=1 sm=1 tr=0 ts=68d49257 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=JYTQWVwI1XGucIoeipMA:9
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-24_07,2025-09-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 adultscore=0 impostorscore=0 phishscore=0
 clxscore=1015 spamscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509230011

Introduce the compatible definition for Glymur QCOM SNPS DWC3.

Signed-off-by: Wesley Cheng <wesley.cheng@oss.qualcomm.com>
---
 .../bindings/usb/qcom,snps-dwc3.yaml          | 26 +++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml b/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml
index dfd084ed9024..eaa0067ee313 100644
--- a/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml
+++ b/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml
@@ -24,6 +24,8 @@ properties:
   compatible:
     items:
       - enum:
+          - qcom,glymur-dwc3
+          - qcom,glymur-dwc3-mp
           - qcom,ipq4019-dwc3
           - qcom,ipq5018-dwc3
           - qcom,ipq5332-dwc3
@@ -386,6 +388,28 @@ allOf:
             - const: mock_utmi
             - const: xo
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - qcom,glymur-dwc3
+              - qcom,glymur-dwc3-mp
+
+    then:
+      properties:
+        clocks:
+          maxItems: 7
+        clock-names:
+          items:
+            - const: cfg_noc
+            - const: core
+            - const: iface
+            - const: sleep
+            - const: mock_utmi
+            - const: noc_aggr_north
+            - const: noc_aggr_south
+
   - if:
       properties:
         compatible:
@@ -455,6 +479,7 @@ allOf:
         compatible:
           contains:
             enum:
+              - qcom,glymur-dwc3
               - qcom,milos-dwc3
               - qcom,x1e80100-dwc3
     then:
@@ -518,6 +543,7 @@ allOf:
         compatible:
           contains:
             enum:
+              - qcom,glymur-dwc3-mp
               - qcom,sc8180x-dwc3-mp
               - qcom,x1e80100-dwc3-mp
     then:

