Return-Path: <linux-arm-msm+bounces-75722-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 33A98BB1EB8
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Oct 2025 00:06:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DCF0C17EAA7
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 Oct 2025 22:06:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 56B383128BF;
	Wed,  1 Oct 2025 22:05:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VwPLdRDZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AE4A312808
	for <linux-arm-msm@vger.kernel.org>; Wed,  1 Oct 2025 22:05:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759356346; cv=none; b=SYiNJR/RUHimgElLbMir52fyvFrJybp4opJK3h0tLzUTPNwJWCQUYyxhTv+sS3I2/+4xJp4F4d65d78+3cSxLqLzjP/WAdZXGd0dT7HTR+BaJ0QbFXzcvA8wIZ9Ah8wxH8VkmLLpk3BIhmuJCS1FWWa2Z8XiAHmhEyttBckW4Hk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759356346; c=relaxed/simple;
	bh=cfM3s21T8CQ3sOfi9Dc1sx2mJ27UuKxMJmEc0kjDpws=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=nIrzw74RKzGuAK78rDQ1GGVhnlTKG6XIBsjzj1fLiv8EyDE6BZNcgR4vvfoMfXTu/sLIDN0nZsiUFYQR1nANuq9Xl29pxiGIVnnR9fFruUAj4VVHm5MkQboq1SDu9HdQ8pTzCIMaYLbggqQhd1Sw4kpoFJTGEqIYCedzmfKYeOY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VwPLdRDZ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 591Ibwmu032179
	for <linux-arm-msm@vger.kernel.org>; Wed, 1 Oct 2025 22:05:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=YaQd3cF9DM3
	ZawONJKkUUZT5oOk1utb/PQbw+Tb9ZII=; b=VwPLdRDZx8FXXZy/LdNwLw7sWso
	nNXohyNnyerO+pbHcfUtgzYc47FUOfVpoQQwyGk+uECmqtttjLCxfaQnfcuiMKy3
	COPDcecXaKKtbiRMxxTaa/NKEJDeeUj7X9rodNSdC09vJFbV18sQWiHgGRmTu4RR
	Y5IeOAYXUy9XZO9qAkUwZzYEQMHnI/DQOTt1aRtQSLurRyeU5HC8OhqfJhybPEbg
	emV7DosVkILOfae0zWqIBZQE8tOfTQqI2Qa0xQ5uZGBLA4bVgYwZvYdoda5haBrW
	tzuMNTj30oAma1cX0li8t2rht8QpPYfu6sz0qZNLTT7Hb679cAqJekVCgmQ==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49e6x5x45q-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 01 Oct 2025 22:05:43 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-28a5b8b12bbso4900355ad.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 01 Oct 2025 15:05:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759356342; x=1759961142;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YaQd3cF9DM3ZawONJKkUUZT5oOk1utb/PQbw+Tb9ZII=;
        b=BS2mBYy8XpjvOfnv8U5lNKYYmrE9AqmFIAk7aiDRfuBRfMMfzK+8gpJJxas0eMAVbK
         gaWdyHKK0qo4FoL1HeioZS0M0nISjdei8SevFaqksQRdTxNLOVH5KSDdrmQRVLyFA2Fh
         6ZW4/ZIbSsXY6MPwFtxBm9MbXWaJmVeSUuxwpl9iVCcc9JJs96A1c94Li/p0p5/EcKV8
         cAzFPXvZsKlKWAYxCY+RzOws/9PckZ72gWITeWT4lzDtRLT5wIapmve/zjIzV8TV2wiJ
         SyVr7LOAuvX/GgI0tIczJwwiom2s/sEcSdcFj6GekYMGP2q829hDXF9o8Oh8Lih9tZAC
         ACeg==
X-Gm-Message-State: AOJu0YwjTW3LfwJjD1PGQAc7fl/timAf1SfBJyT5dyiZMbUxrEBGMNWr
	qYcO6lNATP1rZpb8ZxyucOcBjmDIaiVz28yjjOtZ1vNNFd+xcmyursuxM66QIXukLMI4YHlaJhV
	PxMDsTFZ4gdI3aVoR5UJgWvbgF9xT6IQYttxn9XMnEYrSiL8r5KErg+yiKR4YHSgbxKOs
X-Gm-Gg: ASbGncsBAa8U0LFZmxWaxXVip9DjH1iWX5I2nrni+OQYSjXeuIVN9b1Ez8j/zHmT9CX
	J11S2DQn5gQO0cfB2QLU95AgvIFmI3xtxjkcBs+LGUNxlhZ13liASE4kxLh2Wp3H/+T5UUDiUkF
	HA0/5GxN2YrJA69m149cAmLprYXiDzdB91dGaQNp6fPvlZLJ9V10k+2AqLhLZnbpQ8sfOosUTYc
	LQmRwRPRX1gTJs6hdSkaQckwr2751WHjYrTpl5RCug9GroxcxISV+O213BP5s5X1/2krQQXtg0N
	k/VGCjzSizVIsJdtjfiwkcV0W//2MwI1N6iBbjO4+8u0xJgLVh75avw1Rriov+YbqvoerwWIzC9
	puv7XC8l3ngyH+7OxDkBOgQ==
X-Received: by 2002:a17:903:144e:b0:27d:69de:edd3 with SMTP id d9443c01a7336-28e7f2a2aa3mr55519235ad.20.1759356341900;
        Wed, 01 Oct 2025 15:05:41 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHfcBhsPzH4uOaOTsLowdy78HnwI16bUIuuSFnXJDMrE5c2ZqQJDOV6y9FJ6jkCyNo9Jw2ddQ==
X-Received: by 2002:a17:903:144e:b0:27d:69de:edd3 with SMTP id d9443c01a7336-28e7f2a2aa3mr55519015ad.20.1759356341468;
        Wed, 01 Oct 2025 15:05:41 -0700 (PDT)
Received: from hu-wcheng-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-339b4ea3c3dsm702085a91.5.2025.10.01.15.05.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Oct 2025 15:05:40 -0700 (PDT)
From: Wesley Cheng <wesley.cheng@oss.qualcomm.com>
To: krzk+dt@kernel.org, conor+dt@kernel.org, konrad.dybcio@oss.qualcomm.com,
        dmitry.baryshkov@oss.qualcomm.com, kishon@kernel.org, vkoul@kernel.org,
        gregkh@linuxfoundation.org, robh@kernel.org
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Wesley Cheng <wesley.cheng@oss.qualcomm.com>
Subject: [PATCH v4 03/10] dt-bindings: phy: qcom-m31-eusb2: Add Glymur compatible
Date: Wed,  1 Oct 2025 15:05:27 -0700
Message-Id: <20251001220534.3166401-4-wesley.cheng@oss.qualcomm.com>
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
X-Proofpoint-GUID: cv1lNW3chB5FfnAivX-RluwV8GsnMxvA
X-Proofpoint-ORIG-GUID: cv1lNW3chB5FfnAivX-RluwV8GsnMxvA
X-Authority-Analysis: v=2.4 cv=ZtPg6t7G c=1 sm=1 tr=0 ts=68dda5b7 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=x6icFKpwvdMA:10 a=EUspDBNiAAAA:8 a=dJG6SERxbJy7wEyxA2sA:9
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI3MDAxOCBTYWx0ZWRfX5H9cHD9HQlmu
 JnmUiOzS5kyrtEhywjwAlH5ZOTaXBTUw5B+Og7riN3QFUDAJkMNubozuG84oh41/sHIzHxyn9Bk
 t/SVoUS1mLOWvASg+cv4xy1UHlpsNsZbfJEwEvoj1RedVE0q+wZVbRUv4l+4hjM/0hVCYYNMI+h
 OeMCV8Xs5NRc6qVEAlLc51kv0SF+70nspaCHdtWeNMkLjR/S4rYLRFukkJAZV2v61Evo4S3AaCq
 1IAI7zYYcw+sZefXX+yEtHRXdi5La8i5xIkMyPViTDzjwpxPk6XxN1N7/ErlrYLV74q3aB+g3to
 Q3R92ZLkiqX+trZETmdJwLO/zFRX7+mGmugbwiuMbh/tq6rGksN+3Gc7UMJYUfCGXFVQO5RqU17
 7ahuan7DgvaFOC0W3qFKvQWXWY4CCw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-01_06,2025-09-29_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 priorityscore=1501 malwarescore=0 bulkscore=0
 suspectscore=0 clxscore=1015 lowpriorityscore=0 adultscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2509270018

Add the Glymur compatible to the M31 eUSB2 PHY, and use the SM8750 as
the fallback.

Signed-off-by: Wesley Cheng <wesley.cheng@oss.qualcomm.com>
---
 .../bindings/phy/qcom,m31-eusb2-phy.yaml      | 21 ++++++++++++++-----
 1 file changed, 16 insertions(+), 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/phy/qcom,m31-eusb2-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,m31-eusb2-phy.yaml
index c84c62d0e8cb..0d5db71e0ad8 100644
--- a/Documentation/devicetree/bindings/phy/qcom,m31-eusb2-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,m31-eusb2-phy.yaml
@@ -15,9 +15,12 @@ description:
 
 properties:
   compatible:
-    items:
-      - enum:
-          - qcom,sm8750-m31-eusb2-phy
+    oneOf:
+      - items:
+          - enum:
+              - qcom,glymur-m31-eusb2-phy
+          - const: qcom,sm8750-m31-eusb2-phy
+      - const: qcom,sm8750-m31-eusb2-phy
 
   reg:
     maxItems: 1
@@ -53,12 +56,20 @@ required:
   - compatible
   - reg
   - "#phy-cells"
-  - clocks
-  - clock-names
   - resets
   - vdd-supply
   - vdda12-supply
 
+allOf:
+  - if:
+      properties:
+        compatible:
+          const: qcom,sm8750-m31-eusb2-phy
+    then:
+      required:
+        - clocks
+        - clock-names
+
 additionalProperties: false
 
 examples:

