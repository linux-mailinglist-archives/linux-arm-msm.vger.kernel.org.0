Return-Path: <linux-arm-msm+bounces-74742-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E4CC3B9C936
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Sep 2025 01:31:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A2B15325EED
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Sep 2025 23:31:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3C10629D289;
	Wed, 24 Sep 2025 23:30:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="INex7DrQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF62826B098
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Sep 2025 23:30:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758756659; cv=none; b=iJOAuUhlPxTcBTSCKOURVjdHZetdE/6DRVOr+4L+dEz46U8XTHBjwaf+osnXOuZAwBF7bq9ZC3t648h/Fh87aW8l2A27xjessfU75Unx7gMydsPtjK0bHH7dpy2qI0kKgkECarehna5o9iGC9E4Iyp44AWqfW52OeI0BAdA57Rc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758756659; c=relaxed/simple;
	bh=cU32TcSKW9YyIovlQL4SfLf5/O51JhAVf+zjp6IfwyQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CoRkRZlUNF3tYqKx8HMxQk+WWU2lQD7la2vjJkP/IZrFTgLPlR3SxyVkBbbl9oLMTGDAxOF+TEVfO92L3+nZY/5TZptvCN+r6PBI2iXJg5YUQW6qhH4tBfWbk/sVfSeb3Fea7RLmA+M7+3M2PV7tWK0CVSw0zgDVxoatbTD0Bdk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=INex7DrQ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58OD8Ts9021655
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Sep 2025 23:30:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OuQ5pE+7XMJfuNagezwC+U/OxjrKQySR9lYMvVRSWPo=; b=INex7DrQExjDpl4V
	VhjeemVWrCg16YdlyTig+zznkqrHfGV/fJwGsLOIQo9+5R9WZW9hl9op38biojeS
	Hs8/J5XPN7Pye7qc19cMs8RY96nsEtF995cWD2zYUhbEXY731lzLa/Gx3LSSdDsv
	RiW5ZHMkWaD0H21dUDWMTgn2qKocp9ZIXr5Rjxdhw4/FHaU4ER1iHSr7P6xoeBfM
	KrKvS+VZAwcWWbgTe1F0VA9/A9od+bI/RfHgbEfsJyRAGVbq649VF0r1yLdSNt8w
	eg1zEZPofK703ZK89J9Tdo4ye/Ti5A0WC5T8AJxvEe+wnrQ6XOai1vRL/NfC9a/R
	uymk9w==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49budadkd6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Sep 2025 23:30:56 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-b5576590fd1so194994a12.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Sep 2025 16:30:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758756655; x=1759361455;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OuQ5pE+7XMJfuNagezwC+U/OxjrKQySR9lYMvVRSWPo=;
        b=KTENjbhhGoomYnynPxuQRe2XB8ITOogsgAKWvEvSwBODJoaSQ1zQkpAzyvV0dUOKKN
         jlC9gDi6Y+aM0br2VjNVr7vdHEJJycyOub0NLdjSfaqtKXv4xDZFVt//H5LI2vLXxOhW
         +H4qm3bn4MUQ8Pwd2EaktH2w81PpGj3JtWONXluN8j4+qe7k0g8JC/9iViwQii6yRpWT
         fLavDhQIPSkCp3BJkpKXOwvXY347ezLeCN/xUBF8LFIBAQ+IQe61gIfVBiHwyT6Qn6RR
         kF0LJZAYKKogO9Tvc1SXBMNvx1u4cLJQWs4yo36qsAr//NGtqMuqmb+v/yjtdxhbdkVW
         igDw==
X-Forwarded-Encrypted: i=1; AJvYcCXdPHoQfiSqZPAgJ1li9lzk+IjSvIzrJVloyBHQMRl4I+mb2vmwdeohTTHDaOnpOhNLDRsCVEsVx8jkZuCi@vger.kernel.org
X-Gm-Message-State: AOJu0Yxn+UQoQeELuKWuPc8jv5+VnVO6njkCJ3JJylGE8DqNADrbJ9Cx
	wqL7Qna664waEuwgPNhOlsFU8gUONURmyAT4F6WvjXI0bzYTJW7kaJ5LJu8R9cvM9TWkA58hs/m
	kjDcYxQZLkYPoWVmZUi38gr2Q/ted4bYIevcsqDMfhV3RuBmFxdZlUObE3aSPKq5eTBrK
X-Gm-Gg: ASbGncsudVjpQ2oAyTU7EuzqtQyYNdd5jLj3daFRIaV9wJN5wvE40jbzaRd3uCIRORc
	6V4MznELRiB+NHztxQU6IP/OgCXB6rfU+Ze2TTKEKGaZcMSDQe0xnw6bt2aIX6T5Jw24c2dcwLL
	79rsyqoqD5O81iUusK/8pMGOCVDXzyoX01Bw1eCGk+Hmu3J1Fv1irvn7+lVSzK020VgEc27zQks
	gqltLHi0AzuVdmRY4bFuuyhoPnMBMXrvwgltZtGpRTO+ghpXlj/DGyZm5zI8FPR0SUJtuW734vh
	CcPIfREGrIIbVVEuuneVTQtWRvmIOjEnj/C6ySelgmWqODxX1lkCX8WpnOJfduvNYmExWqm3i/j
	00ugL1JZPLuA9y6A=
X-Received: by 2002:a17:902:dac5:b0:27a:6c30:49c with SMTP id d9443c01a7336-27ed4a56ba4mr11632785ad.27.1758756655290;
        Wed, 24 Sep 2025 16:30:55 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF73pL4DbtNMTKsqVz8SVnywVT6FrsluvQdyVQ66mzDaIsEoW6YqWcm24T127WMgkyqc7WaYw==
X-Received: by 2002:a17:902:dac5:b0:27a:6c30:49c with SMTP id d9443c01a7336-27ed4a56ba4mr11632475ad.27.1758756654834;
        Wed, 24 Sep 2025 16:30:54 -0700 (PDT)
Received: from hu-jingyw-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-27ed6882284sm4122655ad.69.2025.09.24.16.30.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Sep 2025 16:30:54 -0700 (PDT)
From: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Date: Wed, 24 Sep 2025 16:30:47 -0700
Subject: [PATCH 1/2] regulator: dt-bindings: qcom,rpmh: Add support for
 PMR735D
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250924-knp-regulator-v1-1-d9cde9a98a44@oss.qualcomm.com>
References: <20250924-knp-regulator-v1-0-d9cde9a98a44@oss.qualcomm.com>
In-Reply-To: <20250924-knp-regulator-v1-0-d9cde9a98a44@oss.qualcomm.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        aiqun.yu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
        trilok.soni@oss.qualcomm.com, yijie.yang@oss.qualcomm.com,
        Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-99b12
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758756652; l=1753;
 i=jingyi.wang@oss.qualcomm.com; s=20250911; h=from:subject:message-id;
 bh=fuQcxckOwrAnD/uN3prPY//RQ8aoexpztNDHqR78jIM=;
 b=YzBky5mXzDDTZRiTWo3DYyhE/wf5CnJ3bRm1sA3Z2czyllZYUn3GwVAukjyY8Lr4xbrNqyBAb
 x0oYo82Jd3VDxYsSk2ldyS/9VpfDwzSRRb1X23ISbjZy8MDPA3al5uA
X-Developer-Key: i=jingyi.wang@oss.qualcomm.com; a=ed25519;
 pk=PSoHZ6KbUss3IW8FPRVMHMK0Jkkr/jV347mBYJO3iLo=
X-Proofpoint-GUID: SLE1c4p8mTExhQWrZIq_Qtx94d-NfGTa
X-Proofpoint-ORIG-GUID: SLE1c4p8mTExhQWrZIq_Qtx94d-NfGTa
X-Authority-Analysis: v=2.4 cv=Yaq95xRf c=1 sm=1 tr=0 ts=68d47f30 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=S1N0t0yXLE9zJeP-jjEA:9
 a=QEXdDO2ut3YA:10 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIzMDExMyBTYWx0ZWRfX7WaQu+Zy/L2I
 BLqfhmwBsGM1WX5GGDpQ1QSpSfcAcp1oalgsC3q7AXMewiO+4KUx0Tl/nZwYMGUMMzNidWMkB5i
 /1WM3xw7k6m8MRBdBA0/dpiuTTs3/kNm+HIaSb/yWJP7qMQ2+5PtwJAW8auq4h41W6mwgU+MfeC
 m0GeUtTO53RL7iOx1+XY2OgmbP0QVT72f87IJ9J9MG/lMbqBEruZCAHNljGT/l+c/ljSfY/17uu
 S+Xuh/KzMfpYzJnCn5NSwi8Z1mt173tg2fTEsCX9PXjY9EW3JiKe1NsBQU0xZoC3jn1Y6WsSBfg
 W12ImP2eqUNKSTAWEDcSUH9G4JSHCd5wWpss70ZGHLrzgBY2sJKx+ETjKASazyzWGccjydl/dnS
 KkT2/9XT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-24_07,2025-09-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 suspectscore=0 priorityscore=1501 phishscore=0
 adultscore=0 malwarescore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509230113

From: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>

Add support for PMR735D PMIC used on Kaanapali boards.

Signed-off-by: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
---
 .../devicetree/bindings/regulator/qcom,rpmh-regulator.yaml | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/Documentation/devicetree/bindings/regulator/qcom,rpmh-regulator.yaml b/Documentation/devicetree/bindings/regulator/qcom,rpmh-regulator.yaml
index 40ddc64577e7..4669095039c8 100644
--- a/Documentation/devicetree/bindings/regulator/qcom,rpmh-regulator.yaml
+++ b/Documentation/devicetree/bindings/regulator/qcom,rpmh-regulator.yaml
@@ -59,6 +59,7 @@ description: |
       For PMCX0102, smps1 - smps10, ldo1 - ldo4
       For PMR735A, smps1 - smps3, ldo1 - ldo7
       For PMR735B, ldo1 - ldo12
+      For PMR735D, ldo1 - ldo7
       For PMX55, smps1 - smps7, ldo1 - ldo16
       For PMX65, smps1 - smps8, ldo1 - ldo21
       For PMX75, smps1 - smps10, ldo1 - ldo21
@@ -99,6 +100,7 @@ properties:
       - qcom,pmm8654au-rpmh-regulators
       - qcom,pmr735a-rpmh-regulators
       - qcom,pmr735b-rpmh-regulators
+      - qcom,pmr735d-rpmh-regulators
       - qcom,pmx55-rpmh-regulators
       - qcom,pmx65-rpmh-regulators
       - qcom,pmx75-rpmh-regulators
@@ -496,6 +498,18 @@ allOf:
       patternProperties:
         "^vdd-l([3-6]|9|1[0-2])-supply$": true
 
+  - if:
+      properties:
+        compatible:
+          enum:
+            - qcom,pmr735d-rpmh-regulators
+    then:
+      properties:
+        vdd-l1-l2-l5-supply: true
+        vdd-l3-l4-supply: true
+      patternProperties:
+        "^vdd-l[6-7]-supply$": true
+
   - if:
       properties:
         compatible:

-- 
2.25.1


