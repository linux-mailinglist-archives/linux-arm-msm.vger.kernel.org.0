Return-Path: <linux-arm-msm+bounces-51726-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 65F01A674EA
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Mar 2025 14:23:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6726C1891ABE
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Mar 2025 13:23:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA42B20D503;
	Tue, 18 Mar 2025 13:22:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="E4eceMAW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4EA420E003
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Mar 2025 13:22:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742304130; cv=none; b=s7ixlVVELYOXBBakCB14Eij4TJCyYnUa2O5yOcj6j6eTv0dznd7QFWVtga8oM4Ur2GGTmX1nRM4C4cZVL9yVjGpsFAtagEXm3TYlAr7D7pejnylW1rvBIRj2LQt8awe5spfMz19tCAHVB7iobSGyo9Y7F4Vo6iGdRhXGEXIgDFc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742304130; c=relaxed/simple;
	bh=IdMb/Vr8R2JezLV37Ye2IGcmsaxJ+uBDzF5RZDuLf0g=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mOQAjN10Wd9WAzNXxjWg/t1j0ZhGifXYtda40FEc7R5gKXHcmkcwClCSGbarTwQiJIaFtFU45GSk8XK1oNdziVpD/W3qYworTsZ+JfL58cNkf8/vCr+E4PJvYKM4BxGXd13GiifU/MWTSaId3W9oAV23Ugn/TcKhJUOOL68Xm+Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=E4eceMAW; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52IC04qL003699
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Mar 2025 13:22:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SAtwsxfUy2gTpQLlYYW3ylpjqCJSP0QrrvqtqyhugxA=; b=E4eceMAWwjE3gn+4
	9k9PXcWyA1AgiR8rG/BDnM4GkpCN915uBzaOab/8/Yzw61Vr7b7LYsidOUj/N+zR
	wP9tiRXVhEaHE5ivJ/3ba5fxnNVt7BH+wTivDU7WNyPiosJwROModnqlIw9sVlWG
	TYA2Dni8QUtsGIQStl/qNsKm3leuTbDYrpGaoFOB92laJSDlU/+ADhyJ3KKehWtg
	Ay8jo1h+RUKoLbRzQxFh9Qiu5nLs5dAFHqKcSXl44Dbbz8VO8G6UJHkunZ/jF7HW
	laBSw6TthaeYhLy7KVDX4XVFhV+N7wVbNFF8MvPZw55sxZYhupIdSeqaTD0ag8F0
	tmnQ3w==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45f010htp4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Mar 2025 13:22:07 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4767e6b4596so107734761cf.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 18 Mar 2025 06:22:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742304126; x=1742908926;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SAtwsxfUy2gTpQLlYYW3ylpjqCJSP0QrrvqtqyhugxA=;
        b=Gpw+dAoPDQ26Zr0a8R1FS39bxwr7eUkW5DeYbNdCquIyaWzLPFxv4KAQ2Uxn3uN+JV
         oD4syt9wDGtCDeVvg1V6zaVsaETY4iK1IaKQ2WRFbbBqTIdzXidOvCq2qcjMxSGNT8eP
         l28UL9l1Y/2joZVlWiY2xRX+wMzLZ7J3MeW+Tc6BBswpk3OmBnf9vTfUk82F0PpyFUdu
         lBnJYQBGuk32Gr/O/0mP+/FxmhJWTLch+PdtHrZ75TXPJVeEiv5XIsOs6cf68QI4m70X
         ywcyAxk4TnGxDYz1UeAbhjEw/R9I2qHl6mRoG8nGi+6suK6EKPZb5gW4MWuHy2kahzg7
         d4wQ==
X-Gm-Message-State: AOJu0YyB0wPmwU6mZirmQTvHbLPDLTaulhKFdKps/yssuOW4uwAxsRJt
	AJevwjQ7Mp7jHhR9csEps0mIQRyb6da7rdi9CdVvKXC+N3PZc/4L1LMw2QGfDPFP0DVx4I2h/gE
	RrysOzrMysL1vm0n1ky0peDIuk04U3snh+j1iaHfclIMpENhYLcvjzaxh6xheP0Kz
X-Gm-Gg: ASbGnctUd+dtwhRxX9Vqo1M72/kqkWg5GxGnU3Q82aGU8qIlvpTKDz3NNPqIwUJmjWn
	ilQ67V8Ll2QveXP617hO4fe23MVXP2uBcDwVFFNgUJQTDodyB6DL896n2RxvbccKv2g9SjiTsnq
	8gFOK7njOt5KDgxazblEWbsQ2IPKdU2SIrIPP3D5F60eCoTuveXhyRgoYJ99fWHdJIKUnvzTXO/
	hz0Pn0Q/Ul6HsL2QVWIdnoMI/kJIGbzJUikovkpfwpq+L4aRXeW3ThrtSRttXERl2lwVhv2afL2
	d1846NlmBpoSpTszvhGIVgQonFQ8OhtwnJbYmaw9xvugeLFtY9C6sJ8n50ds4/ak1UUc71uvmFk
	+NTi69LPfM2u2bL70Bd0kCaZV7Rh+
X-Received: by 2002:a05:622a:24f:b0:476:671e:debc with SMTP id d75a77b69052e-476c8130f35mr281110721cf.5.1742304126010;
        Tue, 18 Mar 2025 06:22:06 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHEU9lOj1qTTE5tT64YpKYWwG2VXGSpUsxU9+d1bPT5O25rH0OuaNfzj9yTte96HdsNCPMm3g==
X-Received: by 2002:a05:622a:24f:b0:476:671e:debc with SMTP id d75a77b69052e-476c8130f35mr281110291cf.5.1742304125686;
        Tue, 18 Mar 2025 06:22:05 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-549ba8a79c4sm1664831e87.226.2025.03.18.06.22.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Mar 2025 06:22:04 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Tue, 18 Mar 2025 15:21:56 +0200
Subject: [PATCH v2 03/10] dt-bindings: arm:
 arm,coresight-static-replicator: add optional clocks
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250318-fix-nexus-4-v2-3-bcedd1406790@oss.qualcomm.com>
References: <20250318-fix-nexus-4-v2-0-bcedd1406790@oss.qualcomm.com>
In-Reply-To: <20250318-fix-nexus-4-v2-0-bcedd1406790@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Georgi Djakov <djakov@kernel.org>,
        Lee Jones <lee@kernel.org>, Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Leo Yan <leo.yan@linux.dev>, David Heidelberg <david@ixit.cz>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, coresight@lists.linaro.org,
        linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1395;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=IdMb/Vr8R2JezLV37Ye2IGcmsaxJ+uBDzF5RZDuLf0g=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBn2XN17aKshhsSq364oUAKz7IWL16ZLciyW8lw6
 3PLr7UMEoGJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ9lzdQAKCRCLPIo+Aiko
 1WirB/48li3Xo85DmFuuSqUvYyudkl3nFOjZdyrXT8CTQUFjVXr33H0I+LrxKT/h6ahJPTmvclu
 8qLKBN6w7qlO1fD6FslYBto5adSHC98+rCFoJBqY4BDvD9zv0MKAqHV9A9m/jWPJXXI1+8gKw31
 J7XpGbRtEB7d3tZW6T7vEuGtI0vQmE4WVb3vQfzvCk1ppnb+3x0XNdt+5D4Pwf0t1ssQqkm5o90
 WgAxgLQG7IfToEYLCu9gSgNIj8xP0LSgADzSRaJpLnmvsJy0YM0hgsskNEQ2vxKNeE0ty8R1zeP
 4Aj1GNoLW928Kt5COlhNBPqJ2EKkqnW9dhhFjo6xfKi3PXaE
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: -1AvOJKyQAXJS2hS5NvVhNYEZizrxSLy
X-Proofpoint-GUID: -1AvOJKyQAXJS2hS5NvVhNYEZizrxSLy
X-Authority-Analysis: v=2.4 cv=G50cE8k5 c=1 sm=1 tr=0 ts=67d9737f cx=c_pps a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=EUspDBNiAAAA:8 a=kFHV7R2MqMk9-nUzAmsA:9 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-18_06,2025-03-17_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 suspectscore=0
 lowpriorityscore=0 mlxlogscore=999 phishscore=0 adultscore=0
 impostorscore=0 spamscore=0 clxscore=1015 malwarescore=0
 priorityscore=1501 bulkscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502280000 definitions=main-2503180099

As most other CoreSight devices the replicator can use either of the
optional clocks. Document those optional clocks in the schema.
Additionally document the one-off case of Zynq-7000 platforms which uses
apb_pclk and two additional debug clocks.

Fixes: 3c15fddf3121 ("dt-bindings: arm: Convert CoreSight bindings to DT schema")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 .../bindings/arm/arm,coresight-static-replicator.yaml       | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/arm,coresight-static-replicator.yaml b/Documentation/devicetree/bindings/arm/arm,coresight-static-replicator.yaml
index a6f793ea03b6c193fc0ff72a45e0249a63a2ba3c..0c1017affbad2f03892b250ad864d9a5dc8d02f1 100644
--- a/Documentation/devicetree/bindings/arm/arm,coresight-static-replicator.yaml
+++ b/Documentation/devicetree/bindings/arm/arm,coresight-static-replicator.yaml
@@ -30,6 +30,19 @@ properties:
   power-domains:
     maxItems: 1
 
+  clocks:
+    minItems: 1
+    maxItems: 3
+
+  clock-names:
+    oneOf:
+      - items:
+          - enum: [apb_pclk, atclk]
+      - items: # Zynq-700
+          - const: apb_pclk
+          - const: dbg_trc
+          - const: dbg_apb
+
   in-ports:
     $ref: /schemas/graph.yaml#/properties/ports
     additionalProperties: false

-- 
2.39.5


