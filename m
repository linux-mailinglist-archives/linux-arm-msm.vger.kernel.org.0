Return-Path: <linux-arm-msm+bounces-75723-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7144EBB1EBB
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Oct 2025 00:06:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2BBCA3BA0BE
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 Oct 2025 22:06:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 830BA3128C7;
	Wed,  1 Oct 2025 22:05:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DueehUeZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD689312816
	for <linux-arm-msm@vger.kernel.org>; Wed,  1 Oct 2025 22:05:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759356346; cv=none; b=OWOFvhOQ2rZgyBYM4+vFxBWWQKBj1xvgHy5L90rptpPblqVqS2odTLKRWRF/8ec4q97pd8NCxSUPCmv/b3SYf6Hs9ThDzkmCnsAB/9e51GULm3GIU/5qT0qzwF1/4s8H75Tmnqlg9lKv5qVWsmO7D0SYne8vj72IyXEiM4sZc4A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759356346; c=relaxed/simple;
	bh=y84fa6fvuCZpJxjEsWR6XfroWoXIZOXTyVARiLBoUh8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=E312RJodfQbszvZtXvnb/KgZ4g/GXtlffU3IhaKxl9lq+QpEzdSpIFgp9q0DEti3xU45IVTv0XH8O3/nZiLumIJt2MLgrr09BUkVozCSOeIOmWyRC7lKScPVpG02XfE7z8zLhGA7z5RFOxvxN7zgD2aPZ0wMmyGOZnKZsLkcnKc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DueehUeZ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 591IcMM6010597
	for <linux-arm-msm@vger.kernel.org>; Wed, 1 Oct 2025 22:05:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=g6hGIMMv3wb
	uPomMpx8H8k/GiKEKmx7JPEl9gfJaIng=; b=DueehUeZ+4geCNy8yp8SwdJiyHg
	Hz6h6cptSo4H/sSW4inm8OTiTt3cCWtnX7UpCJEJPk2scrUTJYOipJpUSH3tvbGM
	aZxZXI1Ozk1V4+EwGrkJ2mpkcgOgYfAl8n/Vz+yT64fJuOQEs946BY38DEFkyV3z
	8hrxMYo/0K0m9z/GejFvm/Aw4TNSZj6XllFb4Xiyr3UUPr+VhiDP1REzDPqeuxCH
	KmXzTOWqMjdeJKHvMaDV1bT5EhOAeUCu9aOYsi9jo2fZYFvz2Gkfm9umx9awLsTp
	lWKhRuvacWb60rmdLCeWOMd/G86OVUBS2y6HXRK7i3ELrlbRACyi/lIbj2A==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49e93hnqk3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 01 Oct 2025 22:05:44 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-32ec2211659so373302a91.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 01 Oct 2025 15:05:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759356343; x=1759961143;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=g6hGIMMv3wbuPomMpx8H8k/GiKEKmx7JPEl9gfJaIng=;
        b=IDaCzkhQUeqrgnb8bJDS0XWEmLdApR0lr+7rmIk181Ep4H/J6jy+ikeMu8px/9MtXt
         tvfG61KwBXv4wNrOC+PCwiQYQrWLI83uzqYpQKMdu6KZlBMW5fvv7HbKT6itmHYtPf1m
         0oZ7wlkhmNMecS6iOVko0L/LjDpi9Bryw9JEWY5P+Ebro7xzzqY7hVEG6cpUQfnqH1fn
         PF4cxew1oFKv4BKI/ak1oROieA/gCKFzoZqwpeOk4sxsmJDNh/TERWpJZnXSeiJskXdy
         95w8EacOJy9txukY5pxRiFjlrXdD5Txe468TaHPal4zQpxchBWmeO3oF7wdhdAsMrWgc
         py3A==
X-Gm-Message-State: AOJu0YzBwtb5siESsfXJl4KlYdU5QXG0VG5VpuDiWxhTHbY+84UPbBc2
	jJd3b2VlpciUC5R1GZEsyVUqeiggUgYXY1ODbp5iboRBNap3KUlxR1hVjR4LsZ2gLrl1etLCNHA
	qhoMc0Bp3pDC45AaKCA7/Z3z5g5cI6S7IDqQ/dqJDXRSRbSdiXlZm7I3gNThCqZBRk/Xd
X-Gm-Gg: ASbGncu/hS4EBOz27pwAKPDjQXH54HaZFnxHM9Gr40/sdbGmCIQXIjvw+9B9cMtaYab
	GAYX9Ig7z7AK6NxG/ojnKLFut/JWzMcBCZsme//phifQ2AV7vx17shupq0lTAawWgZnbvfr16eO
	Mzi4k4sFtoNr+4wKmaQpd4xRK/bUL62UBkG4hCbiazAbvZzs/CiZGZeEd8ZxV80oZVpcb1v2aPg
	y0TnUJqruLUqzLQSLQwowtTaQBzztB/Uu20YNMh96N6gqBWa8XPPuhkOXYFeV/IHxHkhlevjyTa
	N9esM3J8uiH8E02DqH/f3QgumEQBvT6WDhUJGUtbt1q7HaU8KIam8aH1oveWUfau//LcrBHS29M
	mv4SwX31luOJ/DaLRI4pvLw==
X-Received: by 2002:a17:90b:1b0f:b0:32e:a10b:ce33 with SMTP id 98e67ed59e1d1-339a6f3cde1mr5653493a91.21.1759356343290;
        Wed, 01 Oct 2025 15:05:43 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHMYMlMROsnj4h+It/s+6vj6sTVkjqirS+NPrscbKY0wqq9o3/qEeNlWw+iTriGWj/gWEZ7vg==
X-Received: by 2002:a17:90b:1b0f:b0:32e:a10b:ce33 with SMTP id 98e67ed59e1d1-339a6f3cde1mr5653469a91.21.1759356342817;
        Wed, 01 Oct 2025 15:05:42 -0700 (PDT)
Received: from hu-wcheng-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-339b4ea3c3dsm702085a91.5.2025.10.01.15.05.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Oct 2025 15:05:42 -0700 (PDT)
From: Wesley Cheng <wesley.cheng@oss.qualcomm.com>
To: krzk+dt@kernel.org, conor+dt@kernel.org, konrad.dybcio@oss.qualcomm.com,
        dmitry.baryshkov@oss.qualcomm.com, kishon@kernel.org, vkoul@kernel.org,
        gregkh@linuxfoundation.org, robh@kernel.org
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Wesley Cheng <wesley.cheng@oss.qualcomm.com>
Subject: [PATCH v4 04/10] dt-bindings: usb: qcom,snps-dwc3: Add Glymur compatible
Date: Wed,  1 Oct 2025 15:05:28 -0700
Message-Id: <20251001220534.3166401-5-wesley.cheng@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251001220534.3166401-1-wesley.cheng@oss.qualcomm.com>
References: <20251001220534.3166401-1-wesley.cheng@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI3MDA0MSBTYWx0ZWRfXzvIwAaOgy7iz
 a0RZghJEPSfwsQ2b7oi6JyBPrl66URbeIp3trDODS03EavQ8Zee7C4iMVfkD5UgsBo+4hx1O+/g
 3VoZyo9KtOKrsVSUQEfg0h7IO0PHkQ9GWtKo4NZgKSok6irC9Pw7RGJQ7wh1DBNV4Lb3jLBEfYI
 Howr7xNuOQacMvqPom5tigJ8UxSTw/sQaBpIf3cn0tWrT5efGgG3kd3r1YQd2aXgnvC9r6xQxmk
 hs0Z9v14PHWAsR7mPi8Jk4XBxed4Po5AQ25GUeLRghZ8rEM3ui7Ui5EG9QbDShJgGYjE7tSC4Rc
 w+56InqDMTYKl2wg1jSqokvydcLhVTMzrSQDBjbP+W02v/QXJ4FxeKX/DavrG5QyubF5FQUOTav
 vZuH5xzdB2IH8By8xnZUjcs8R5vc7Q==
X-Proofpoint-GUID: 7dQGM_OKqFphxK53Wz3h6T1GsLOYXhKj
X-Proofpoint-ORIG-GUID: 7dQGM_OKqFphxK53Wz3h6T1GsLOYXhKj
X-Authority-Analysis: v=2.4 cv=Rfydyltv c=1 sm=1 tr=0 ts=68dda5b8 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=x6icFKpwvdMA:10 a=EUspDBNiAAAA:8 a=JYTQWVwI1XGucIoeipMA:9
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-01_06,2025-09-29_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 bulkscore=0 adultscore=0 lowpriorityscore=0
 impostorscore=0 clxscore=1015 malwarescore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2509270041

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

