Return-Path: <linux-arm-msm+bounces-74194-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 02503B89DB4
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Sep 2025 16:16:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 55E6F3A3D4E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Sep 2025 14:15:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0405123371B;
	Fri, 19 Sep 2025 14:14:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="otQm3Lgj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F6C53101C5
	for <linux-arm-msm@vger.kernel.org>; Fri, 19 Sep 2025 14:14:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758291292; cv=none; b=SFx9w01DvQfSf7SAHs4fNY9TP9xwHgSKWzeN601qqHJb1ONUpOpEUha3Oihp6oHRgfozy0SJ4jaedW+GAl7Kyrdi4rIvvEWj11wyAX8lu0cvxwP1GX9xWin2BRb7AR8r3H9NM6IYKfHz2Vc0mUVUedsti61KuAnEJwTHZQkDOZg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758291292; c=relaxed/simple;
	bh=H18JYOxIyEwenlKHPH3Q4sdgZATPQK3L6NM+azc19AE=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=SbyaX9+nICa2tFV8gQPy5cDT72l6PFN99B2gDXCr1tDzBVOsGkaUQ7wMbd6Nd28ZazKoxeSE6eS9+fu7a/9GnA8hHA/EQvP4+IjUlHONR3dEqq5t3ADKYeyw0rgqNeOwdnEPbeWawxGSF2UdFu4OO4tQLnq5xmUWFc/n8ltClf8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=otQm3Lgj; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58J75geA010769
	for <linux-arm-msm@vger.kernel.org>; Fri, 19 Sep 2025 14:14:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=9EEP86bPrEuFPhyrGPMSKAxoE/r/N527VzL
	IseJvapk=; b=otQm3LgjLRebVNhPqwJ2r4P4UwvdHcYQW0UiPpHqaB7xzV6HyM9
	vKzvnzwXzb1wnT0cQiae+vzW+nGogSHtI8Y/yk9twjffddOQV9ORTjnzAgoOYnBY
	/LIQYPBNpULBHrlS45de4tmaymkz/V9OkN4byh4X/LKbO5/ZxP5CXzUDnJhD7T5r
	EMMwSNDvPTn0zfqt5u5BGnVIomx8pPNxVUgSwzVlNAy8lipcnaLmC98DrPxTW5iM
	vKA0+YsKPkjByEDVsFkuU2fv9VS5oanzav6ZORXWagmzJ9x9hHDFo+YawtMmRXyO
	HETV1gbCN82wR2OYXo0yoi5rOR/IVfupU0w==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 497fxy2mtk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 19 Sep 2025 14:14:50 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-329c76f70cbso1835227a91.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 19 Sep 2025 07:14:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758291290; x=1758896090;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9EEP86bPrEuFPhyrGPMSKAxoE/r/N527VzLIseJvapk=;
        b=sTBJP/W6+1+y9Vx8gOwewR1SfzPm6Lkjtkmb800vr/s8Hbqxi9UwZtKXrrcwnkfucj
         xLklFftqMcHkHK3fZZteT0Ru7Z0O6xyJCu7yRsRiics2x8FEnoDRqRGqwO19arwSQUyv
         K1wrXXXgF2zhbCd6jlMAZ4bMsKq2dNgRC28cHbEe+TgPEIeYNqTJM8IiERKxaTsACK+X
         wAAi2dinc56AJtH0kfP7MpDwoHLBf1j2XDKCMSUmGAgjnlaLhubjePb3DEvbvu2YVk/7
         8q5u2Je/glFKTkWhnpeJYkc6WTSEtTmZdOOdfA0HgdFnMIKRLRUN+huVYbGibS0k7hGx
         sR3g==
X-Gm-Message-State: AOJu0Yw22yUwkleQ4wytSt62cHXKJIGyhOhxinWHSyw/SCtMw8xzVby7
	pJtl3RKTb/zqz01dSU9gn7ps5NBs0+KS0+U1RIzAJmS4G7hdNXX/rpluBWhc/cEdl0fu3bKWiQw
	SmlQb+BVFZboKvIRi6bm6WMjrJyD56vmTlUkbIUeAkmwVcEogQehHFl4XQo3vXhdzQdfe
X-Gm-Gg: ASbGncvqxH373Ccr77vnmv8UFCl15FhkzgpT8vtZrI7yO8kcGQnnlLG8nugO7Ro+abL
	2sB3BXqYwAgzRJDaohWD3872+C43fZY6KbwUTq2DISMAQOz+pMK4UFMjF5PND50c8KYtxoXeIzV
	wpSJWyv/qs4vTwsQ5cJe75aNRiJiidUUOx3DKPoQ9CGedAGsBC9QSFP1OZbHtQB3fcnxxeg+oz9
	C/Rj0rROpKUe9Qunw7sDl1uSq44Q2YzYF36plxVeVA7HLBQBpLqf8UucR15eNKLVLKNVjse3aq/
	WiuhEY/gRRftu1+3ogB2pq3pqeDX1x2z1rcDnm00C3kUD+eSsxvJmG/MjbfrCL4rU8RwnNcpkm9
	JZAaAWWgHO3uoSWS0MZbIzrDFUFy+VpGOZuS1NbIomCYuZYVd1911Y/wmtv3Z
X-Received: by 2002:a17:903:2341:b0:24c:a269:b6d5 with SMTP id d9443c01a7336-269ba27020bmr50046085ad.0.1758291289597;
        Fri, 19 Sep 2025 07:14:49 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGZEoV1JBT8ltcQHOk66+9wxwccfdS5Zcfmesrj8v0ZFx8i90bAAeizJjd/qgTQvGzs2XP4SQ==
X-Received: by 2002:a17:903:2341:b0:24c:a269:b6d5 with SMTP id d9443c01a7336-269ba27020bmr50045735ad.0.1758291289091;
        Fri, 19 Sep 2025 07:14:49 -0700 (PDT)
Received: from hu-pankpati-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2698016d9d5sm56456845ad.53.2025.09.19.07.14.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Sep 2025 07:14:48 -0700 (PDT)
From: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
To: andersson@kernel.org, linus.walleij@linaro.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] dt-bindings: pinctrl: qcom,pmic-gpio: Add GPIO bindings for Glymur PMICs
Date: Fri, 19 Sep 2025 19:44:40 +0530
Message-Id: <20250919141440.1068770-1-pankaj.patil@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTE2MDIwMiBTYWx0ZWRfXxYxleH1e4B5c
 JDVvTg9m4BtogrKfdzI1ONXBdvPhBVczAXlXlUt3A3wHFj1iQcaGm9XOpWoxaqrSEc68qGTmdiE
 s/cb6VS3sIxXQu76NPXeG4iNZM4DLs2MNrSZq/XSJhBHiZVVVIpgVeBaO3zqcJLPcCUxJ1bds1r
 AGDF+n0NIPOAz32jVcjIJaQKkscdpAoU1CSCp+PczTVXDZy5KeDe2hLb6XrcjRIPb2csv6zHSMC
 z/TAeeGaGj0iY7PGaSYaL8WKQb5vHsnKaOUq/6HApmfBJc3nVLopc4q8vR1JPT7/iorPxVslq7h
 vNz3ObkdRk+mOWntg+JHrGVi/W60jGmEnkRoPqEFoYGPXRksLE6POo7X6a2SYziqmD0NkorG8Z2
 CyTPyiJw
X-Proofpoint-ORIG-GUID: 0cDkROjWFwAIcOVPYKDuIttbPo5NzcwU
X-Authority-Analysis: v=2.4 cv=KJZaDEFo c=1 sm=1 tr=0 ts=68cd655a cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=gVt0xI4JxzluFwnjjo4A:9
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-GUID: 0cDkROjWFwAIcOVPYKDuIttbPo5NzcwU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-19_01,2025-09-19_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 bulkscore=0 adultscore=0 impostorscore=0
 suspectscore=0 malwarescore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509160202

From: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>

Update the Qualcomm Technologies, Inc. PMIC GPIO binding documentation
to include compatible strings for PMK8850, PMH0101, PMH0104, PMH0110
and PMCX0102 PMICs.

Signed-off-by: Anjelique Melendez <anjelique.melendez@oss.qualcomm.com>
Signed-off-by: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
Signed-off-by: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
---
 .../bindings/pinctrl/qcom,pmic-gpio.yaml          | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.yaml
index 5e6dfcc3fe9b..8ae4489637f3 100644
--- a/Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.yaml
@@ -59,7 +59,11 @@ properties:
           - qcom,pmc8180-gpio
           - qcom,pmc8180c-gpio
           - qcom,pmc8380-gpio
+          - qcom,pmcx0102-gpio
           - qcom,pmd8028-gpio
+          - qcom,pmh0101-gpio
+          - qcom,pmh0104-gpio
+          - qcom,pmh0110-gpio
           - qcom,pmi632-gpio
           - qcom,pmi8950-gpio
           - qcom,pmi8994-gpio
@@ -68,6 +72,7 @@ properties:
           - qcom,pmiv0104-gpio
           - qcom,pmk8350-gpio
           - qcom,pmk8550-gpio
+          - qcom,pmk8850-gpio
           - qcom,pmm8155au-gpio
           - qcom,pmm8654au-gpio
           - qcom,pmp8074-gpio
@@ -191,6 +196,8 @@ allOf:
               - qcom,pm8950-gpio
               - qcom,pm8953-gpio
               - qcom,pmi632-gpio
+              - qcom,pmh0104-gpio
+              - qcom,pmk8850-gpio
     then:
       properties:
         gpio-line-names:
@@ -303,6 +310,8 @@ allOf:
         compatible:
           contains:
             enum:
+              - qcom,pmcx0102-gpio
+              - qcom,pmh0110-gpio
               - qcom,pmi8998-gpio
     then:
       properties:
@@ -318,6 +327,7 @@ allOf:
         compatible:
           contains:
             enum:
+              - qcom,pmh0101-gpio
               - qcom,pmih0108-gpio
     then:
       properties:
@@ -481,13 +491,18 @@ $defs:
                  - gpio1-gpio22 for pm8994
                  - gpio1-gpio26 for pm8998
                  - gpio1-gpio22 for pma8084
+                 - gpio1-gpio14 for pmcx0102
                  - gpio1-gpio4 for pmd8028
+                 - gpio1-gpio18 for pmh0101
+                 - gpio1-gpio8 for pmh0104
+                 - gpio1-gpio14 for pmh0110
                  - gpio1-gpio8 for pmi632
                  - gpio1-gpio2 for pmi8950
                  - gpio1-gpio10 for pmi8994
                  - gpio1-gpio18 for pmih0108
                  - gpio1-gpio4 for pmk8350
                  - gpio1-gpio6 for pmk8550
+                 - gpio1-gpio8 for pmk8850
                  - gpio1-gpio10 for pmm8155au
                  - gpio1-gpio12 for pmm8654au
                  - gpio1-gpio12 for pmp8074 (holes on gpio1 and gpio12)
-- 
2.34.1


