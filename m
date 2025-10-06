Return-Path: <linux-arm-msm+bounces-76118-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id F00B2BBFAA7
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Oct 2025 00:21:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8C2723BB74B
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Oct 2025 22:20:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 925F11D7995;
	Mon,  6 Oct 2025 22:20:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ICoNp2R4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5608120298C
	for <linux-arm-msm@vger.kernel.org>; Mon,  6 Oct 2025 22:20:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759789216; cv=none; b=W4vIbiJfdQ8MpJiAbVpdcJqRE5QLzQddnLlVlHR3L4Y2aBhOefiByobOjS1MJRidjhhF9EzKadKPIyJeuXZ+IjggF0y648Mf9VHmN39SRjWjhFBqDEnrVaw3dBAl+y7jQPaHmkFSWcw68yVfkp+UVt0ukS+itlkPMl6EZfcPkb0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759789216; c=relaxed/simple;
	bh=y84fa6fvuCZpJxjEsWR6XfroWoXIZOXTyVARiLBoUh8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=jpNwnUQDNMfQIRT898elyKKCvErcZSN3//Z9kqUDaJUqRhbjjHRvisQ9bpdF4Q3KmjWFwDQ8M35xzTMIkSo2aUDQV5HpFMGAaZmIriku5Odd/4G4r9XlTpygzqq7GrUviZvbY/ZmbCbahPdJ97OcPS2cMnJCKUpmoWENVbROjFc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ICoNp2R4; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 596F0IUB027970
	for <linux-arm-msm@vger.kernel.org>; Mon, 6 Oct 2025 22:20:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=g6hGIMMv3wb
	uPomMpx8H8k/GiKEKmx7JPEl9gfJaIng=; b=ICoNp2R4zS26XwjqroKXK5XltGH
	CswvdsstUgTIoEjd12evPOYEDG/cUADcf/2e+dAvOIGX64SEGFu8+zagkdQsBYHE
	tTrLiGsjCDnMoPDr64FNK00D7jhudTTraCimJSZpOZyCrC+xAgZKjv7XSoxW2YsW
	mLrVwoLx/pVHZi1Fioa4mrxDlkrsUCjFPzR762PjZ3o4foM6n6z/7ExBPIHJ8+y8
	TZPPEHGYXUZBg9tMrAiwGKF0t1ZBdQtK/dRbaI+uZSOsz3trSFtZ9uT7Z/XS+kcz
	UucLm2y1evG37Rz4Y+4a/jDGLT4apOeEMbTvVj6cX9LZVOHbzftp/b4Tp2A==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49jvrhn5ej-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 06 Oct 2025 22:20:13 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-783c3400b5dso3379999b3a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Oct 2025 15:20:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759789212; x=1760394012;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=g6hGIMMv3wbuPomMpx8H8k/GiKEKmx7JPEl9gfJaIng=;
        b=dd0vd6bSUoPgOf51lTILCSEEKMPlwuVOt0wFAKth0FtLTIDM85ikGdcFJE2XfHN4NX
         GYIIf0wR+hVy08aekztqBFVEUicKqUGWDWQr+tt65b61dQWb4VmUy1wgQXLSDYY8LNhy
         d4DbJTt/WkwUdAPR6Z+tLy+F9WCTI213bEVcNiUVta7yvEkq0UePIQ9NqrZQqSr/g5Kc
         9smXlliZ5X7GQ/+clM1GVD1ej3y5Wc5HywYLBDwrkwnFSB+QL4S/UmLV6jC/2A1EpEzt
         bwZFDw1AtMh+qALA5AuZb7VBd/iaF7DPsYGLE4VDlwZBpU12HZ6iowmlvOF8siplOSwp
         anKw==
X-Gm-Message-State: AOJu0YzZ2Nace5m+n3zbC0wQHlPtllxhFp9hr52eI+7bnh127lU56Lvi
	8Z7PLYIOH7q4R3aqt0kt2lMVX1SavsqmSIjO9YxlrWiGrvo/fX/NHyLeNXVtNY3tI6susKBpUqk
	LJnSwreFmKFGEIpe/m/C/Z2Gwy/RKxVIGPat9pEunu8WYNEH9OvQQ+gMNBqRaHxwhv+XG
X-Gm-Gg: ASbGncvmgmLCQMQdAO/3h+umMk822Owvz5eirH6JjJQQLvD/ORzMDc69NhQz7nJWRft
	7h5IHLfPC/7AUBpPoWz9j0zX+jcJYeXUPaz8VHGNqqOvjBDmgTL5qignhJLu77J/iAdmpLYKDEf
	DZDg9rnKFEIwV/u7Kp74u2XwbCDktVU2pNHEztBNTAZGVTl98s/4QV5zJYK5isedUy+kDRqvdWI
	mX+7h32Nwty0i3wjJijK7PoLIfAoN0incH07KvGBl3xgFhDCteCqNOCoEvCJajHujArNbXd087T
	5qxBDfniKIy6AamKNxcUFCRXN67Q5Bo4ycFEbGV8p1a8qG4s7lne6r5gUcTktc+f+EIo6qupNnJ
	y0gPhtpOOsa+TOWFp2jV4Pg==
X-Received: by 2002:a05:6a00:3e1b:b0:792:574d:b1d with SMTP id d2e1a72fcca58-792575c7065mr731266b3a.14.1759789212556;
        Mon, 06 Oct 2025 15:20:12 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFwVIZrtgir0jsxXPAjMTVqs04hKUgCAEt4yAQwrK5Enm7r/n2TXNbFI5l+MOzSFJexLm8MIQ==
X-Received: by 2002:a05:6a00:3e1b:b0:792:574d:b1d with SMTP id d2e1a72fcca58-792575c7065mr731243b3a.14.1759789212105;
        Mon, 06 Oct 2025 15:20:12 -0700 (PDT)
Received: from hu-wcheng-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-78b01fb281bsm13734968b3a.37.2025.10.06.15.20.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Oct 2025 15:20:11 -0700 (PDT)
From: Wesley Cheng <wesley.cheng@oss.qualcomm.com>
To: krzk+dt@kernel.org, conor+dt@kernel.org, konrad.dybcio@oss.qualcomm.com,
        dmitry.baryshkov@oss.qualcomm.com, kishon@kernel.org, vkoul@kernel.org,
        gregkh@linuxfoundation.org, robh@kernel.org
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Wesley Cheng <wesley.cheng@oss.qualcomm.com>
Subject: [PATCH v5 04/10] dt-bindings: usb: qcom,snps-dwc3: Add Glymur compatible
Date: Mon,  6 Oct 2025 15:19:56 -0700
Message-Id: <20251006222002.2182777-5-wesley.cheng@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251006222002.2182777-1-wesley.cheng@oss.qualcomm.com>
References: <20251006222002.2182777-1-wesley.cheng@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA0MDAzNiBTYWx0ZWRfX1/8XCNUwvTL3
 ee/vJdv53lJohzXFKKHcbOfrK6GChiqPMWwCI1aUWcbeZVBO11f+jOobZUJu6ocoqCAhmV6xKwu
 qJC19N5Nys/1QUZzFJmAnzH535Td3B2DfL1ZxbgeIjlMF1w1avoONVjO5QsEdEzRamUxGsDTxBb
 wpAkPoMXYL3QZyiRWdJ4+cFoXWsw8GalRo3Lji4EhucjiBdH75XD7FkVXGLMlglP+acgUiHY510
 PD5w7u2b+OAH+yy5oddiTG5nQDyozAmo8s35YRC2gp+89xfQT2F7G9PzdCVthVfErQVh+hvL24k
 WjwAufjS55hMvmQzUmVCJGjrxw4Jbth4KmL54uIF8S2QlgS7YSAg8qmIM1ND6FeXsAQKSn4sXBm
 LODLCUjNacR9+Z59r9Kx64qEBove1g==
X-Proofpoint-GUID: h0A-Tts71WMMcqeQJ14S_LwvkgtFtcvQ
X-Authority-Analysis: v=2.4 cv=XIQ9iAhE c=1 sm=1 tr=0 ts=68e4409d cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=x6icFKpwvdMA:10 a=EUspDBNiAAAA:8 a=JYTQWVwI1XGucIoeipMA:9
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-ORIG-GUID: h0A-Tts71WMMcqeQJ14S_LwvkgtFtcvQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-06_06,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 lowpriorityscore=0 impostorscore=0 phishscore=0
 clxscore=1015 adultscore=0 spamscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2510040036

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

