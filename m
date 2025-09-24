Return-Path: <linux-arm-msm+bounces-74727-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id D3657B9C86D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Sep 2025 01:24:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 252047A2CE5
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Sep 2025 23:22:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 08DE827FB3A;
	Wed, 24 Sep 2025 23:24:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JpzONz8J"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81128126C1E
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Sep 2025 23:24:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758756245; cv=none; b=RQKoEsr4WJWBtoJdwX9W7OtWPwZeRbuF8AmbR6WNAZtXGC3kF0jPD6RFXweLyPqX0dCMAWNO7V46eIV8yFtKHSVK73yuUR33GlK6TL3gib561xhSTqtLWSfQ8PBDelkQb9WaweizGnWOV4HUb9vXRUZ5kSn7aX2J93Hgiw9l5hA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758756245; c=relaxed/simple;
	bh=J/wUZYvsar3Y2h2UCXq2yr3vgsHaJOw0fQtfmhXPwDM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=UOYaLeIhJVLJ8TtUVIDMVtlWaPajWWzM3hRciqzvb9OkgxLp4MsyKQGgdO3eeHdtUVg7QMktMErki4Lq+w7WsdZ/xCQP3E6HTlxRDuo60YmEdDUL6SEW4Q/YyAW8mB4i0aN0Fh+oKQDQwjRF34SjQNkB2sq/vjulJsQvTS+yLYo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JpzONz8J; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58ODCtKO002152
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Sep 2025 23:24:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=venGlUBJGXHVgO4PVr+luN
	+jDDTyagN3i/2SVPdTnIw=; b=JpzONz8JYWyMU8LMWOq3nQ0Eaila/kLMXac4cA
	hCjWEe18jj4nRz+BFNDjzobtID99Ubs1bcLbduPDI+Aml3BSC18zEXyAjdbNT/bg
	ojztvGGFOZ27lBEq051UX15i6eQfgS55VvAdTtIEWbx0OmBmHTjPNDLe8pNF3XYo
	Q2eQ8UwTApFFlKUc8bWLJOfQ4KURyRZeH8igCDXeAAXf5OiswYWdzh7qifkAvjUT
	itKGPL7tGwDP+g2Wief9vWQF5GqKbVlvngP9j6wgH0bvKy7030q3yI6QHD6bMX8C
	5tWLYiQb1SZIP1icU7i59nueZg3D3UTj5Fyd9q3nU3sjyEUw==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 499k98p1dm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Sep 2025 23:24:03 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-780f9cc532bso272609b3a.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Sep 2025 16:24:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758756242; x=1759361042;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=venGlUBJGXHVgO4PVr+luN+jDDTyagN3i/2SVPdTnIw=;
        b=kBjRcRRnbkOwzgnL0j9/a7gLYjKha2u77zvPyne7Rainl/KkMdr1rkstvLF2jedzFW
         Goq5rNXYEeAvewGRT3J6N4jFTxntYk0Eac3KOIsVwlcVm7z8pgZVk7cMxhSl2UF9YV9V
         D5k7R1iZ5rvDWn/1TJCIcss1xUqcIS2R36rLraCYoWz1QHdHDXoUmijA+2iMGz767dJv
         3baFqj31h0VxyDWWvVR9Yt+xrA5Agld8Lg2+N61OYNyYD6i0qUeB76Wpsr7hE+zfrtYi
         h7IDPb78wCVlIkzGZtumnSWEgEQVWQ6YPPukS2+VvQfmWoZT46g/194ayiNJ+8Gt+vSe
         ScmQ==
X-Gm-Message-State: AOJu0YwcadgQe35TSNGgUs+PpYKmL7pS2j7d7T4m8x1AxVvMF6DsxM7c
	EgLIQs/ZQtE9FszPLH8T1CXWIASUQiep+HOAjVbBTF+Y/h4R6rHAWnDsjoeSk7ZoqcXpMMHsug0
	F5u68bQOhB6bxo0Wa1E7hLlgLbVXRdPJAFZrQbsuu1yFiJBqyMXZlGEcXZRZz/Di1bl2i
X-Gm-Gg: ASbGncshVbPSRPUekqyRV60DawpvQW1KAVDjOnJR79uDioWqo4zqdH7t3z51Peg5jVc
	Xnx4pLYSGPyMhbtlER/JRhwxvGwHBtcrFaqnDo3lBvS7HNDz3jlNz0ccDv4wEcjYGEMqndcwL3R
	PFi8Q1HCq3snM8SvrJZGD+k+UZBMJGcV3SwjSdXkLuefqcxCqb1gSGSudZE8jnVMROHGp32gIH0
	kRy3IdUoPXxW6uZerr290LVYPno6TOEyo71jroFNHFgJa2oF3CO/RGa7uFxMn5M9EK5Nbjoydz4
	da58kXN6IBentOD2X2fvZxi3JGwxchIdWVC1Okd4S7Bu9YTja31FVcnSc1Qkp10flH4JPF5ojqc
	WJUPAP0AXluslp3Q=
X-Received: by 2002:a05:6a00:1a04:b0:77f:3826:3472 with SMTP id d2e1a72fcca58-78100f78564mr551417b3a.6.1758756242236;
        Wed, 24 Sep 2025 16:24:02 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGrMYAL4mcDsgg3Sh/tiUOQ7NRb3zZGfekd1omIF5BXOfVOq71sZSvHV3cWFQc0HY18frAdXw==
X-Received: by 2002:a05:6a00:1a04:b0:77f:3826:3472 with SMTP id d2e1a72fcca58-78100f78564mr551395b3a.6.1758756241804;
        Wed, 24 Sep 2025 16:24:01 -0700 (PDT)
Received: from hu-jingyw-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-78102c279f8sm156571b3a.98.2025.09.24.16.24.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Sep 2025 16:24:01 -0700 (PDT)
From: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Date: Wed, 24 Sep 2025 16:23:56 -0700
Subject: [PATCH] dt-bindings: mfd: qcom,tcsr: Add compatible for Kaanapali
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250924-knp-mfd-v1-1-6c8a98760e95@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAIt91GgC/x3MywqDQAyF4VeRrBtwrNXaV5Eu5hI1iFNJRITBd
 3fs8oP/nARKwqTwKRII7az8ixnmUYCfbBwJOWRDVVavsjMtznHFZQhYh/D0b0ON6xzkehUa+Pg
 /9d9sZ5XQiY1+uveL1Y0EzvMC28XrRHIAAAA=
To: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, aiqun.yu@oss.qualcomm.com,
        tingwei.zhang@oss.qualcomm.com, trilok.soni@oss.qualcomm.com,
        yijie.yang@oss.qualcomm.com,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-99b12
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758756240; l=997;
 i=jingyi.wang@oss.qualcomm.com; s=20250911; h=from:subject:message-id;
 bh=J/wUZYvsar3Y2h2UCXq2yr3vgsHaJOw0fQtfmhXPwDM=;
 b=7mUwTYmWH2cOVn3SIvSc8XbSr6ganRZpjywQnoLF1FSziThRn8e6rF5DGYgh1G8Cfp9sywakk
 Qp/whHZyOdYBS0C4W7H2RsK1SsZjGqcqASh6r/Fr/Mot9GL6yHawfUr
X-Developer-Key: i=jingyi.wang@oss.qualcomm.com; a=ed25519;
 pk=PSoHZ6KbUss3IW8FPRVMHMK0Jkkr/jV347mBYJO3iLo=
X-Proofpoint-GUID: xnZrbwfzxe9hBbm6RSVgwvXRRrZuyZjP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIwMDAxOCBTYWx0ZWRfX/cepEUbHYkwS
 0oVCiayyI00dRKgYwYN18H4lqpTMZCDyXUzF05IJrKkv0QpYhVTolJg8LFa5pt7msipEL1UuRjW
 5uczjbkP9RiBeSeBlpkGveGNmTy3qL9CE3Mzh/YEb7mefM4q4R/bCkG47DypO/xShOQvRl87d7w
 OiRfL4pM6+YlLTEiK6yqjKZOHn0GzuskJBMVP1u03eRa2LXeM6DYYC4BMBWoEqM0VOOr/9SXTpR
 MRUAiKflm2HflsMfkGFQm782YGozY4H9O8wglo9L5Tqj9J2lf3nVj52vSkppSgONyUOwDgFHFTf
 2aCgSvZzD3NOZY2yK11UaPLmslHOeouEZu2fcaQxIaKQb3VYgIIR+RFG/5H6cK2rAFOLx+C/ICD
 v6/EyKFf
X-Proofpoint-ORIG-GUID: xnZrbwfzxe9hBbm6RSVgwvXRRrZuyZjP
X-Authority-Analysis: v=2.4 cv=Dp1W+H/+ c=1 sm=1 tr=0 ts=68d47d93 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=P9gvD56xMKEh8kHMZp4A:9
 a=QEXdDO2ut3YA:10 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-24_07,2025-09-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 adultscore=0 bulkscore=0 impostorscore=0
 phishscore=0 spamscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509200018

Document the qcom,tcsr-kaanapali compatible, tcsr will provide various
control and status functions for their peripherals.

Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/mfd/qcom,tcsr.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/mfd/qcom,tcsr.yaml b/Documentation/devicetree/bindings/mfd/qcom,tcsr.yaml
index 14ae3f00ef7e..ae55b0a70766 100644
--- a/Documentation/devicetree/bindings/mfd/qcom,tcsr.yaml
+++ b/Documentation/devicetree/bindings/mfd/qcom,tcsr.yaml
@@ -48,6 +48,7 @@ properties:
           - qcom,tcsr-ipq8064
           - qcom,tcsr-ipq8074
           - qcom,tcsr-ipq9574
+          - qcom,tcsr-kaanapali
           - qcom,tcsr-mdm9615
           - qcom,tcsr-msm8226
           - qcom,tcsr-msm8660

---
base-commit: ae2d20002576d2893ecaff25db3d7ef9190ac0b6
change-id: 20250917-knp-mfd-4dd3c81e6b9b

Best regards,
-- 
Jingyi Wang <jingyi.wang@oss.qualcomm.com>


