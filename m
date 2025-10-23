Return-Path: <linux-arm-msm+bounces-78493-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id E0F37BFFFDD
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Oct 2025 10:45:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 719814F9656
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Oct 2025 08:45:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 00D09303A07;
	Thu, 23 Oct 2025 08:44:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GNu+rqYa"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75B043019AF
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Oct 2025 08:44:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761209098; cv=none; b=HLyZDKZ4zsGaw6o2cLKo9PGWFPlcJxIqiHU2SgsxOdzSpvLUbV8WdL0FOmloKG/g1Fqz7NRHeAVSDZIc6DaE34TDaJB1taiYJT2/Ja/lEOhnE7ZdQ1XzpOm7uR4ab6cnpgdkfXWIo/vZG8C/zoS+VoxNaWLs/XRmrbuKoCsB+xY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761209098; c=relaxed/simple;
	bh=k+PmNoXDAXQJS7OetKj0dkK2qhIoz89vlGf8TIfy+1I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=R9Q66FmKdOudkfvCVQFwoFrf7wJVQB2pFKsTG78xNcbstKcKulKcmupZ0AMUvDa3JugQP8EUymvuZ6EqtLpBQRsftEv9I2Tr6w82P960+6x35TSJn9ABEhOV+nNEGOrwyCKs1Tc32FDun7EOg11Kef4YcmQ784TMbIs+SooER+g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GNu+rqYa; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59N6MCpd007454
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Oct 2025 08:44:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ifR645KuUyFxKA//L+5AC3NZ2Xa5Oh1zVhSgn6hJBRs=; b=GNu+rqYaSILiqoC3
	slUnNyXTp1RfFzljugTGF5gqyfoXbblqGXcjubZ3evWaKweK233cLi79zwOnbX9g
	uOBQqUljEBhW/dI0J0RmttlM93jMhxl1A0AtlJ3D/1t+Z6Mk0H6bLGsiEfx4qkYA
	F8YyezBSRqG/sNHsS+5KEnWEifnJK6mUZVRQVcXa1rmn+ohLTwcor0IkEWxnuqo2
	8u3gx7G6El8TaPJkAvPz/Tf689GJrRTQZTK22GS43oyfIvFPpjKrnmDKGxw/pJ6b
	2kwAvsWS6YvsFEkd4YTxcf78JTTW6G45d+inTUJIkzkDETUBDtnUmFdTXl5iyPfi
	lSd2ww==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49v3447rb2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Oct 2025 08:44:56 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-b6ce7f76617so968762a12.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Oct 2025 01:44:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761209096; x=1761813896;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ifR645KuUyFxKA//L+5AC3NZ2Xa5Oh1zVhSgn6hJBRs=;
        b=HtJtlRkMIIL7zg89GbG+MudVsbFJltFwvBA4ZRGRyFG8RzUccLLLLXeH2TFxuvGSYz
         8/ZxCGrQJyrwtt4T08t3ZCuAhR1400zIoOLBw+ediki6xGJArmlnxBpd3uustFmZTsBc
         MAGDeGtuIE64iqrCJQKMBQONLwK2MCe/Ey8ImqTmUE1eCQSH4UdJ6DCQLFR2D8/I5s0a
         mssTjCD4WhE63w0Nh7lE6GDBMvcAEcXXNmK7lAUtzLwHWhV6a6yoaqFkxdg3fEXnBSyN
         8PjDKaIgx+u4Qnag+7FSh+iqw5VUsMkPZQOzKLQy1VqOMekptFvRegmmp6rsGOBfMY9w
         xKSw==
X-Forwarded-Encrypted: i=1; AJvYcCWQV2X5IJ+SnOaDoG3LzVZ+qOMCUGJXda/pbrmXAQi2KxqM7mQ/90G7+T0tB1H6xje5T/OH8K0m8ZwXu9iy@vger.kernel.org
X-Gm-Message-State: AOJu0Ywmhiukd/yGdzKGNAy5LrHTXyCjlOq9XmBwGW0NRmXKzQE0tFQ2
	fcNpk0DxePJNvIYaT2f9KLmSxtpcym9Xrk+babqmRXrxuH9WSrUn8LakO1f1vMMfR1GqAkNGrgZ
	RG8V7+uv4K/1K8ds5OL7WKtnqLNczgumGYp/2Wut7kVjI8e9piU4egP7HvQU/nU971s5X
X-Gm-Gg: ASbGncszIC44fqss7gD6lfUA88ZKTXws6iRlyuxosKYJGMBsiG+RmJr9nd5HXA/l273
	OMAu5mYWxQJqbfs5CUHrj6Bv7QSeZltxTMyLgK1M1jxn4of/juXOwUzFyMntYXbqrlExk2fCRbH
	woLFNcsu2FW9sj6wy0Fo4AWuLFct4ad7c//1tf82+GvTeQk5nguwRZfaUYfIs6ByCUH96ndLYUP
	V36aTRalQo4gcZkSYIaok9Kl7mGLcCjqGfn1Gn8g5wc4gZum71FIM7XvPK8hwzXhc0xy1XxgzI9
	5VB/Qd8GjQoi8W1q8P2kK2oR2qgtkxiePc4vmQI/O3+VUD0zqKyq07UV5ykTus/0Op/JlmWMa04
	Q/4B6T5oWxpVg6qpxjqSSHZ0q1NNI7xj6og==
X-Received: by 2002:a05:6a21:3382:b0:319:1c54:1764 with SMTP id adf61e73a8af0-334a8650741mr33069453637.60.1761209091046;
        Thu, 23 Oct 2025 01:44:51 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEF7/01T06H3cxa6y7Y+3Sz9xWN4jXPTvHSIbK3VQSTfvu1y6FfQKeEEaZm5mzR/UjCiLhd6Q==
X-Received: by 2002:a05:6a21:3382:b0:319:1c54:1764 with SMTP id adf61e73a8af0-334a8650741mr33069410637.60.1761209090638;
        Thu, 23 Oct 2025 01:44:50 -0700 (PDT)
Received: from hu-jprakash-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b6cf4c056fbsm1391414a12.17.2025.10.23.01.44.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Oct 2025 01:44:50 -0700 (PDT)
From: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
Date: Thu, 23 Oct 2025 14:14:36 +0530
Subject: [PATCH v2 1/2] regulator: dt-bindings: qcom,rpmh: Add support for
 PMR735D
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251023-pmr735d_regulator-v2-1-452e1b28cd38@oss.qualcomm.com>
References: <20251023-pmr735d_regulator-v2-0-452e1b28cd38@oss.qualcomm.com>
In-Reply-To: <20251023-pmr735d_regulator-v2-0-452e1b28cd38@oss.qualcomm.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>,
        jingyi.wang@oss.qualcomm.com, trilok.soni@oss.qualcomm.com,
        kamal.wadhwa@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
        dmitry.baryshkov@oss.qualcomm.com, aiqun.yu@oss.qualcomm.com,
        yijie.yang@oss.qualcomm.com
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1761209080; l=1753;
 i=jishnu.prakash@oss.qualcomm.com; s=20251014; h=from:subject:message-id;
 bh=k+PmNoXDAXQJS7OetKj0dkK2qhIoz89vlGf8TIfy+1I=;
 b=nBl4+q7agGbU116/Y/hJMgAdhOCTqaxJ9umeS7PG+LDZT5GwQmZDDun+u9hc0eZK3tEv0lXf4
 tTdomc0YuolAprxvorr0kbUTx8SNsdwRlzE0gDo5927Sw1weP2FDyV1
X-Developer-Key: i=jishnu.prakash@oss.qualcomm.com; a=ed25519;
 pk=g89pXdLVwRjdTeQ+uX1QzvBO346E3hQAc1N7fcTXgmk=
X-Proofpoint-GUID: pNa7Dzf2imtdWle0RHzpnf27TOxh1VJ9
X-Proofpoint-ORIG-GUID: pNa7Dzf2imtdWle0RHzpnf27TOxh1VJ9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE4MDAyMyBTYWx0ZWRfX9d/ZseUtwyWB
 0qKL8m8PdfGZHj/7Jw5LepqNxWD4URIBTcOyhe3kr+6vCa4qaYuyMwQmVX+Ge8yH7l4K4NxWaev
 WYpg4UjiaBQZ+SbdFUzaecAUIiVXIQJm5qswcKX1pn6uqgQOiqrZVAmcxKn4oreMCN6PL9dl9A+
 XxV3XNikvyI+Rd4gj771oNRYXxQKiCvgx8e71lQaRCFVcSzUow+Y5txszdyttM1DdziPyf3yzR8
 NMw9cHQC61vqc5friGgSj4k5yKuKPsEUglmTo3eyDOPYN1o8gqFEST3YEb2YGtdHleZ9fD4vFeU
 sYb1V0Ehb6P6A9nPttMLGGtp03+RmSawecqALhJqNTb+I8P6hj4LUMT6tTqsOfH13w1VyOybcQR
 XC5Q/uc0jbG0atFpihsi+pLutI8rpw==
X-Authority-Analysis: v=2.4 cv=E/vAZKdl c=1 sm=1 tr=0 ts=68f9eb08 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=S1N0t0yXLE9zJeP-jjEA:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-22_08,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 priorityscore=1501 bulkscore=0 suspectscore=0
 lowpriorityscore=0 clxscore=1015 adultscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510180023

Add support for PMR735D PMIC used on Kaanapali boards.

Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Signed-off-by: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
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


