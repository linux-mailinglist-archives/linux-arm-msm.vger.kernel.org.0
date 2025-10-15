Return-Path: <linux-arm-msm+bounces-77408-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id D6B3FBDECBF
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Oct 2025 15:43:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id BAF554EB6B1
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Oct 2025 13:43:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C49622F386;
	Wed, 15 Oct 2025 13:42:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BQZEOMkg"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72FA5233155
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Oct 2025 13:42:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760535763; cv=none; b=QImWZGZOhMcaavfdhySeTpW0h4l9RgE95y5aFQIfOhtR+lJ94BuDGpYq21+GQqSO4eE/7JOqCa75nLuFFTL3x+YbvSe1vKCpIc83p9yd/meELtfViUZ2w6rP3Q7zdKHTCtckL2XgZNc4LzCLHZdPVGpkDkfj+QnYFmNDsPwLGbw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760535763; c=relaxed/simple;
	bh=PBQh2etxK1f1LTUrNCY2I1fGG2Es6sPC/p64HJuEj4s=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=pcwEORAfUkIKx80t5+0P90ULIpXMJ6rOqUWFbB8JpWlqD0SxMQGmX+ggo8wBhyecMYIbIf+G78XZjB7M7VaO6t5rnlsICm2GoBf1pZFFg2f50qn/Hoq57lmfW+ugK6ZVDcFSgM7E7eE9Dute/kFHnmLFXYoOW4YIF3wyx0sGoqM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BQZEOMkg; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59FAsAAe004012
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Oct 2025 13:42:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=H+F/Zx1E+4LDjkQuE7qBfj
	1kxTU3KKLrksPW74kFLG8=; b=BQZEOMkgZWQgu1cKzQd97L1i8RxVHw5mVGK5+5
	9bQFG6NPfJbbad6+yMnw4qSbspov8zubc2EzVR9dTuluEotrb7LX75vqwCGIxxwZ
	B9LMr752wE/uJP4PKEDQ8BFrnG2LOk4KnABNYJnVh2qDfyVuhKipx5VSglUBXuB5
	dQ1tjJNgfCto2Q0dKpgkMwIgUHQHqAr7RikNcrD993GrYyxDSZAaoXbBbcc1dg8P
	K0aHkW3A2sFJTT035ohRX3Zs+/DU49SU5JGT2nSfjHPMX0cnJNNVHOOuCqEnwHJa
	YqsHIcWA5Hxd4Kqic8YjV/hdJZKIV8Evqo5cI/+dk+pqat9Q==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49qgdg4eej-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Oct 2025 13:42:40 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-b55283ff3fcso8404458a12.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Oct 2025 06:42:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760535760; x=1761140560;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=H+F/Zx1E+4LDjkQuE7qBfj1kxTU3KKLrksPW74kFLG8=;
        b=fTKx/NLCuC7lQeFG7TgB9peZ+XV4FDhffkBysR0aBwmG5Yt1hg2iS549FgnFdi7KZ9
         2xqV08QdH6IdC36zhZ2etAgD4sKQr0MPkioMJbeGK5c7Q1GbdjnZV4xgRK9ZZYjNtJja
         PrQuB2+Gf3za6oGqtEJ3ZRmz+KR1uQWl5VWE3TTTTrtySn003/qQ0tgyvhy4vNFoznXO
         xZnspHuZIKGUJZAfKPM1fJErUkZPpluI0pI4/95+ek9yovV+be/nYbQab9yAcHOULp6E
         on/5oIZlhhaLYfAeaKSMu2hbmffgaT8TjWJymR3HFUfy3+gRfhWifpWewRmXS9ikw1uE
         ZhdQ==
X-Gm-Message-State: AOJu0Yz1uSufGTXVTkv7T2Hm5nPH/ulX3gdrSVLolcQBZOLQysfQspEk
	NNkzfXLBJCA2JnA5sPNI8ruGIbEUSd2arHbtPel+2JqzKHz7INvlKjB04DEbjezz1h3x2Zk7UUX
	7Y02FfiKOD1H4wcWhgh7hcP5UTfdI+Srob62fxfLLYlgW2/iSsMBGzxcpXf1yiTUzM6c=
X-Gm-Gg: ASbGncuUgz8seeja5T8Hjzpm8CxYjkSqyqUMS5t/+P0oSBKPCKLHZDB/74jajJQyF6Y
	l7yBVN1inBaGArnQIlrnD+CUEUaSnmLFTk5jHL4ykSJ9Uab8n7WOHJr0/dwv91vfaF1npVjE9hg
	YvTh49T0pyL8lCHUBn5mswRBMxwbDhL258igNUseMVSHdD4vTiOYJVXY7b6hmZoV/3iEKLgoDBI
	uwSPKgBHimOy1ooBYjDZI9jWBjAI/TzxqYvCcewXcasnkAQA6GafOisoPUlM84z0Zgc0XIOV3rg
	E5brU4nKek9KtZfUdHEl40odymyQnekv24GbxNK9uhEZPUsMsyIpt3MdyGX4V2dvlK+RKw==
X-Received: by 2002:a05:6a20:a11f:b0:32b:725a:d684 with SMTP id adf61e73a8af0-32da84616efmr38547266637.43.1760535759735;
        Wed, 15 Oct 2025 06:42:39 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEjUPUFdYaIufIIt8S8dui225qseRVZF4bOTg8Kqh3cjfmBmHA0/by9WGvbGn7zbMYYmRePQA==
X-Received: by 2002:a05:6a20:a11f:b0:32b:725a:d684 with SMTP id adf61e73a8af0-32da84616efmr38547211637.43.1760535759170;
        Wed, 15 Oct 2025 06:42:39 -0700 (PDT)
Received: from hu-kotarake-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7992bc18c96sm18849417b3a.37.2025.10.15.06.42.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Oct 2025 06:42:38 -0700 (PDT)
From: Rakesh Kota <rakesh.kota@oss.qualcomm.com>
Date: Wed, 15 Oct 2025 19:12:34 +0530
Subject: [PATCH] arm64: dts: qcom: lemans-evk: Add RTC node for PMM8654AU
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251015-add_rtc_node-v1-1-601c9663422b@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAMmk72gC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1NDA0NT3cSUlPiikuT4vPyUVF1DYxNLgyRzAyMTCzMloJaCotS0zAqwcdG
 xtbUA7V4Sm14AAAA=
X-Change-ID: 20251015-add_rtc_node-13490b702486
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Rakesh Kota <rakesh.kota@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1760535756; l=1110;
 i=rakesh.kota@oss.qualcomm.com; s=20250919; h=from:subject:message-id;
 bh=PBQh2etxK1f1LTUrNCY2I1fGG2Es6sPC/p64HJuEj4s=;
 b=RlP8WWM4kyq3AY2tzV2Uxdz6tWHlt09Teuf+elIYO08JDrdBX49xY9wb741nXhp54kvu4IJ2Q
 YksN7jOqQPwBbS9q1X9qFYQx49wpMtWzNXnmHdex2x9Klzvea2l2wwN
X-Developer-Key: i=rakesh.kota@oss.qualcomm.com; a=ed25519;
 pk=dFhv9yPC8egZglsSLDMls08cOvZKZkG6QQn1a/ofwNU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDExMDAyNSBTYWx0ZWRfXw1oZ+UU7vQGP
 6yY84EYSY7Chnp5orAmH7vFWrPM++w7UEZixOZLetdzy3msDyXQa6KdqHWPQ+IaEqJFpUgiCZA0
 rZpLiuAEXLMJH6iafiCWrTCpGaMGw46VaP612AZjPjCm1KAf6soyftgntUZR3zz9pto41e8fpI3
 I9gQUH0cZFS18WDwcnjEilIfv/JoVp139Ubfb+I/u5eIGRGz/7vQaxCnTm+4MlTWB8SUmcRmywn
 VxxCweA6ujkEodaNHuioWIFDUNTFmpyGhxFc06gdgJrB33t9Ptbf2gqCqEF4ds5bjtXvReXlkRV
 qkg2qDdckVUSSELpEfaEq29iC8M+y1UmAeRcMQcHpP8q3oxCIOabjhFGoO5FVwKvfEbG4/lQvsz
 0OxpCRD8j0Ixhsd0ghqE8HCc3VBaYw==
X-Proofpoint-GUID: mgOUl3T0XlnU6twZMGzAq4Jm8bbX0Rig
X-Proofpoint-ORIG-GUID: mgOUl3T0XlnU6twZMGzAq4Jm8bbX0Rig
X-Authority-Analysis: v=2.4 cv=J4ynLQnS c=1 sm=1 tr=0 ts=68efa4d0 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=-rC6o90vqo3ez8JSJP0A:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-15_05,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 priorityscore=1501 adultscore=0
 bulkscore=0 suspectscore=0 clxscore=1015 phishscore=0 spamscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2510020000
 definitions=main-2510110025

Add the RTC peripheral node for the PMM8654AU PMIC,
which is controlled via the SPMI bus.

Signed-off-by: Rakesh Kota <rakesh.kota@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/lemans-pmics.dtsi | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/lemans-pmics.dtsi b/arch/arm64/boot/dts/qcom/lemans-pmics.dtsi
index 1369c3d43f866de9d8cd5cd4985241b99c0a0454..4eda7043b851f363d0bf053587fb1f5edae0c4cd 100644
--- a/arch/arm64/boot/dts/qcom/lemans-pmics.dtsi
+++ b/arch/arm64/boot/dts/qcom/lemans-pmics.dtsi
@@ -142,6 +142,13 @@ pmm8654au_0_gpios: gpio@8800 {
 			#interrupt-cells = <2>;
 		};
 
+		pmm8654au_0_rtc: rtc@6100 {
+			compatible = "qcom,pmk8350-rtc";
+			reg = <0x6100>, <0x6200>;
+			reg-names = "rtc", "alarm";
+			interrupts = <0x0 0x62 0x1 IRQ_TYPE_EDGE_RISING>;
+		};
+
 		pmm8654au_0_sdam_0: nvram@7100 {
 			compatible = "qcom,spmi-sdam";
 			reg = <0x7100>;

---
base-commit: 13863a59e410cab46d26751941980dc8f088b9b3
change-id: 20251015-add_rtc_node-13490b702486

Best regards,
-- 
Rakesh Kota <rakesh.kota@oss.qualcomm.com>


