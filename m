Return-Path: <linux-arm-msm+bounces-51725-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A474A674F4
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Mar 2025 14:24:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 694453AFE95
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Mar 2025 13:22:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8AE5620DD57;
	Tue, 18 Mar 2025 13:22:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="l8DnY8Qj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75A4720D504
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Mar 2025 13:22:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742304127; cv=none; b=uR3J2+yrJeKl+PIWYQrE2tA+zHK1boo/CuJdVeVs1EaOReQYMuwInGiozDVsjbzHrs9P6WTpYUXg3NT77/dNit33iUbnd3OvfyCx7T1H3FqVb9AWkzhnZWd6NeEwNWZbC3sR7l/m+mW1L1o4W8gLxBLF+hCFvQKHZBFEYe06aoI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742304127; c=relaxed/simple;
	bh=vnLn5IBvIwlEl10it5qDKQb93nGa5jYtIoo2fd9uI58=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=OtXySOvTe3CPHw6K2BidlrRHo0HEXdQhzErQOAEWLalVVuJ4jboBB/fRP2qZBm+wAk3KzC9oXnlpNsKOOALPuaVuSl2SonpYcjVFEVn5l/2zsTfMFJFnunu6fmmtha95Z5u0dQEFZLvaRdCkLTdudHTHqfIMSR/9IJSILi1oyCA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=l8DnY8Qj; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52IA4wjP028412
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Mar 2025 13:22:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hJYkUWNjRf2lHN3v+SqJGHc1Rc5rAnNwgun/cf+0UPw=; b=l8DnY8QjMamH/A7a
	ZR4YCcEwXfOu8vgCL6lyqv8+oV/adaiRcmNYiDhoWZWekqywKmoCMisbmaDtjtlM
	B8wodh+sCKx+jn9LwrX3DpFb1k6NeUdJdaHkFerFIxTH1RNCXmpTNy9WNJnj5Cpl
	ofr4tVanHkGLv5+RKy2a4QP69Ztlzzmk8njk3uOLeqAPWah0NPXmoiNtftBKhsH3
	IQTpk0vh3iEM1oe8BDUhFTwXa+RBN40NK5pdM0F4gEU1divoKzknvm1z1IgJShfy
	0iuPEhk7hOm10+fkhe81MRVscpkseAUJ2GSqZoNNHB8HypevmvD/0foDQKJn6oHC
	hBMH3Q==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45d1tx8avp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Mar 2025 13:22:04 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7c579d37eeeso772974385a.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 18 Mar 2025 06:22:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742304123; x=1742908923;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hJYkUWNjRf2lHN3v+SqJGHc1Rc5rAnNwgun/cf+0UPw=;
        b=RacHpEq0k2emX2kxj5OCe9jnxsbVpRrARiJuQCnKO0vRAd6OCB5H4sHu0Sp7Aqhn+8
         jzqnSyhnFf3ezwL4jPo0imAhLaUw6uN/e6AoK5qnEXuQnAPaX3QfISh+feGnCzlwJPY0
         VjmMm6SuJ6vBc/7MpaTWEbvIBeljGrXpHPdcBJpWPq6zt2lId2MRtz96F/aM/G100nMz
         +cvViO08QHrnFM0Ht5gDvj336T47zT1iHfUxdyBOopFppRpt6n3tVKHobWQEMgbwupsC
         zfMRXB1vT64zZ5Iek1/fQu+L25EkObjbAqiWj1OnjrLUzoJqzRhliDh/N4ADziXUcxVf
         znnw==
X-Gm-Message-State: AOJu0YxgbZcKKGynxhCOaAANO4n56OCOpBiLiICX0kmGosXlLK+GPQPN
	vGtlrwIeO4Bf3E702nJaxtXfIu43hizrS6gmQTynlLDRAxhtklY9YbegG0LyaINzA6wVXULpLBC
	KsqROwo0u4J48YmTPqDFirAXAbmZS+TxwJCVDyirNDiT0QIQVtDl/JDVdwpEv9o+c
X-Gm-Gg: ASbGnctoUc+pMMd0DxsEnMz0i7FqvCbF7aC3d/W7PpZOERcdYONUKfUtemlXnVpP0sd
	X2LECPhB1rrluEK0bcsXZVrj+T7JNvkr57vyDwCdncSyC/hIyIjxucwRfvmX4t+RQMysLM2dXaW
	+S6XUrB2bZH6eWH+PogB2AOFPN29P3bkvgJLqY7NJWY3guM8TQL8nOlemIiFiAmYQWKsdULxfzt
	xa9Bl7qYlow1xSPRkWks64ITX3U99k9uKayxWDPzhg36SOGEFC+Y9pYPD/Th/E9DpRjGtfMV4u3
	xpehfNt7dsaB/V+KpnURfw6aNQUer5X/IeP/6HrgMFXEatDZp4Hq2TQrx+fTU39mjXSIh+td+B2
	ksjuo95bIq1wz88vnRjqMlfYOXlJ/
X-Received: by 2002:a05:622a:47cb:b0:474:fc9b:d2a7 with SMTP id d75a77b69052e-476c8133b81mr220273751cf.6.1742304123368;
        Tue, 18 Mar 2025 06:22:03 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFuJjxkEkxA8YscofES5fAkHCi2UaKSLt9P/+qAvQZP4SC+n2yCqtqbSZ7p5iFpKiAenmtJkA==
X-Received: by 2002:a05:622a:47cb:b0:474:fc9b:d2a7 with SMTP id d75a77b69052e-476c8133b81mr220273401cf.6.1742304123036;
        Tue, 18 Mar 2025 06:22:03 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-549ba8a79c4sm1664831e87.226.2025.03.18.06.22.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Mar 2025 06:22:01 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Tue, 18 Mar 2025 15:21:55 +0200
Subject: [PATCH v2 02/10] dt-bindings: soc: qcom: qcom,rpm: add missing
 clock/-names properties
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250318-fix-nexus-4-v2-2-bcedd1406790@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=995;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=vnLn5IBvIwlEl10it5qDKQb93nGa5jYtIoo2fd9uI58=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBn2XN0wq2uVR8NFiSnsCPte+zdnqNwfwNEJwiFt
 TzD1vCua5KJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ9lzdAAKCRCLPIo+Aiko
 1VZCCACRel74Ze8Ri0AQEaQbxA+kwaLhzmoIWbaj8eSRfGEhssdcI8Q97HHQ1FpY7hszLgiPent
 YsHwEykVKF3suWlC2rf1yoq++iyVHPmru0gdq3kaSvzIN4cv4Qaf1jIVD4NBJPAonrCo7hJPZ5C
 5R+Eb+zxt5wuzsozs7hhvGsLYr9BA8fKSLEigE/AKUFsuEmhFLp42QGcm6K9RuLB+KrmpG70zor
 3Ic5SdGQ9I9ZrlkHlo6HWrokR7ZJWB0cqXDhHOm+1BGsS8hZLJY6iLVqnxsHY5WMHBfzJHwPtGD
 RDyqyzTb7eWl+0wbG2bq8e1HLxnD1C+Uw4Zjyz9EljAkbxVu
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=W/I4VQWk c=1 sm=1 tr=0 ts=67d9737c cx=c_pps a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=EUspDBNiAAAA:8 a=TCbcYKr47qonvmNniLkA:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: cqxINdQTDnQH7iVZWI0lahWJMadPT69K
X-Proofpoint-ORIG-GUID: cqxINdQTDnQH7iVZWI0lahWJMadPT69K
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-18_06,2025-03-17_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 phishscore=0
 impostorscore=0 adultscore=0 spamscore=0 mlxlogscore=967 mlxscore=0
 priorityscore=1501 suspectscore=0 malwarescore=0 lowpriorityscore=0
 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503180099

Qualcomm MSM8660 and IPQ0864 platforms use additional clock for the RPM
device. Document it in the schema.

Fixes: aa0c4b815045 ("mfd: devicetree: bindings: Add Qualcomm RPM DT binding")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/soc/qcom/qcom,rpm.yaml | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/soc/qcom/qcom,rpm.yaml b/Documentation/devicetree/bindings/soc/qcom/qcom,rpm.yaml
index 10956240df0856a4241d6032d3aff7d447af9ce6..3e8d99cb4dc368ab6b31e3e60eb5f7e082cd312d 100644
--- a/Documentation/devicetree/bindings/soc/qcom/qcom,rpm.yaml
+++ b/Documentation/devicetree/bindings/soc/qcom/qcom,rpm.yaml
@@ -36,6 +36,13 @@ properties:
       - const: err
       - const: wakeup
 
+  clocks:
+    maxItems: 1
+
+  clock-names:
+    items:
+      - const: ram
+
   qcom,ipc:
     $ref: /schemas/types.yaml#/definitions/phandle-array
     items:

-- 
2.39.5


