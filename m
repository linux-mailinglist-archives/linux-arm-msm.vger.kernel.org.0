Return-Path: <linux-arm-msm+bounces-89200-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id C1BD7D23DC1
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Jan 2026 11:13:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 60AF2300349F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Jan 2026 10:13:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1DB6F35EDAB;
	Thu, 15 Jan 2026 10:13:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kWznsNE6";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="P72r2V5K"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4372935A958
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Jan 2026 10:13:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768471988; cv=none; b=TC1XEWZ6FvRnk7ljLl194vGozLA0goJTShSVgmNLOzsfQI158a10doE8IhOEJQGI3wPAbHuvGv5uTqXzhRTr7mbtANa3Uwe14ghvQ1Fq3I/wNjLMNEXDEvwD4xONknHBw8KmX/phhLmSRDA87K/s5FizvbJlYNwgMbYDxwIyYRE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768471988; c=relaxed/simple;
	bh=dRFzhQfshHTf84BzdT/POTnud6IjyDSFvgLl3VTPyVM=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=MWjNm98MiCqSvNQXfmIkNSX5dIDPMwqtlM0zTnXbv5MYRu5TPa+o/VOoT5R7GC3Qo/FuEo7m1bVPckm5VH8ZZgKzz7JOFcCbgwL3Zida8Ruiog+WP5IZ2R6myNGV/zaFCkYdNsjx1aVlK82liFmiaLcFkQD2lbbpTGrozcaqWGc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kWznsNE6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=P72r2V5K; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60F6fjrI1581930
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Jan 2026 10:13:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=FUcVjOfiAfC2Npy7DMm5my
	Y00iOuyg0GYv2Ui5BqhaI=; b=kWznsNE6xeiOtlyS9YtRtnnHXgHEm/ZjWDWrO8
	rJxSlBwGYBIISk/Hk1HfUpi6lJt1PJbGKoc27wS3DWUL52CWppw+Nb88ODeE8rQm
	Zn9pTnXgBc2Hvj+d80Y7bW8Bcyj905B+Y8c1XAoZaZvheqBGrA8CndrraqJMclnt
	CZPiJOBPfzRGcv8NqE/Aa+GqOMU+0wQYZyxoDdomySIoRvXWZyy6dEwjPf+Bc894
	pg3yp8OzYP2/yb5XtIF8xXCsygoov0n7OcS7Hf8DSfNEbQBr2QTl+pG1lVZeZfOA
	DmICjecrSgZUksJUakMubUk/uVVJWoK4YTmIlm/29ZYoHkGg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bpj1pt466-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Jan 2026 10:13:05 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8c6a291e7faso68370185a.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 15 Jan 2026 02:13:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768471984; x=1769076784; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=FUcVjOfiAfC2Npy7DMm5myY00iOuyg0GYv2Ui5BqhaI=;
        b=P72r2V5KRb7faQ0m8ugIf/YVtthI+paT5Pj6FD0DAIr1CAfCd1t57TiDd5kGNxlyH9
         dcBUcBhLzL4qeHnapbLADJ5tdTBFxw40I3hWV14Tbi+OE0gLG+pGtyewTQKWx6X2Cnud
         G2wqoTTySaosPPsa4EmlqhzewAFU0YtEmxUjyYNbxztNssNVcbVWwZ2+N88OjE0LuC7e
         35zyaHYGQjHiydfVV7jQ0NgSZAGAMW46rQ0wsbV5YrOUlzAIsIk439340c832NueY6b1
         L1/orP3/EOkEZGlyMS+tI7S5AtRQpHOUjcxgH0Jybx3tATVM2KZdK7iFtueUzWeSi83T
         tcmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768471984; x=1769076784;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FUcVjOfiAfC2Npy7DMm5myY00iOuyg0GYv2Ui5BqhaI=;
        b=vFYVFw+8AEehoIZtIhCA92AH2+ycSUaxttJF8m59KxCR1LyhvckrTpv5bYCcF8fqo3
         ydN0e38/K72/oKuyn8GPG1i1BWzNEhNge2hiBrICtObRHMBFclo2z3sZFw2EGmhyKE6x
         8++7pWxKF83kkWkxBXuVfifaEsgbepDgEn6zmv1u7NAW+9cDBwU3UOnXz/2EeVObLb1S
         if/ULDIPX7byQoT3uhMmBKLOIvSlAwoZzFfaWE3RVkumcAIAzXMy8qXgzP8/17rTAnnj
         1KdFiIMzPH8wX2rfwliFUF8smCm25bZb/ft9J5vY59dLq/gf3sUsOVidlPczcGwKZGnc
         Ev8Q==
X-Forwarded-Encrypted: i=1; AJvYcCWtRvAT3xmJcR3KHiq5wAugaSuCEapkAYxuC1kSGBSjXusu5bfXO2AZg2coNzbG4vRiv3SXc7xcMT5tpUWr@vger.kernel.org
X-Gm-Message-State: AOJu0YxUwM0jO9lcaSuERMyU5XSKaW6YqjiT1ePxbqfXcrb23jSe5wZL
	okV5scbhJIW4iUjAn7RsGMYMn4YwnRPZcE93AjLCdSNgV+Px2EImOKxuTelZqgGpmFmxY1Otw9c
	QY4Yzgyw3zJAXuy9rngz7JbHlqy8MaTu00oM2FQLEQy1d12ZumR0Mg9zGh3tGhSILt6pm
X-Gm-Gg: AY/fxX7UNREB6+yakvMCy/ZgU7uNGmSuOgPWDQbZx4sOruFbWdQbnvX5EIhmiAwnNPC
	RK7iGhXvxPrYa3xzuFehjbI2w2yd6w6ZCBJpnYeZNENfo4ABRmLqiv2ZmoKlZYuGGsecJ/IJRxo
	g8w0cEfpIWLL5HVFIH7jZDn3ecBD6+cgxmbLlZgAU+qvNgRniACZd4idq3NcNJrP+oZCV+2CDjY
	cKkQQ782tuKWW6RmfEV1Qq1o9bk7YSSQqx6H08OhyahTIPBcYeV0uM/abHP6CcqwW/YA++neoU3
	XLSBhTJK9Yk6V8k81g4/7hvUBXgrjBY8xzwzn2LuoApxqvTP+ZGpEgZE/fV0apx2DeG2pwi0C/1
	gCmv6pjErEkVM7mKdjG4GIJWUpsLHPmVJ5zv8DfLaNhYYsT/m/Q5NuwzUVJjp5LHwNf5mhhDHGu
	yV
X-Received: by 2002:a05:620a:7087:b0:8b2:e15c:be60 with SMTP id af79cd13be357-8c52fbde32cmr822076485a.88.1768471984423;
        Thu, 15 Jan 2026 02:13:04 -0800 (PST)
X-Received: by 2002:a05:620a:7087:b0:8b2:e15c:be60 with SMTP id af79cd13be357-8c52fbde32cmr822071885a.88.1768471983961;
        Thu, 15 Jan 2026 02:13:03 -0800 (PST)
Received: from WENMLIU-LAB01.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-890772340b9sm199959576d6.26.2026.01.15.02.12.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Jan 2026 02:13:03 -0800 (PST)
From: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
Subject: [PATCH v3 0/5] Add CCI and imx577 sensor support for Talos evk
Date: Thu, 15 Jan 2026 18:12:36 +0800
Message-Id: <20260115-sm6150_evk-v3-0-81526dd15543@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJS9aGkC/03MQQ6CMBCF4auQWVvSDoLgynsYYmgZpNFS7WijI
 dzdwsrNJP8k75uBKVhiOGYzBIqWrZ9SFLsMzNhNVxK2Tw0osVSIKNhVqpQXijdRk6a+oWYotIE
 0eAQa7GfDzm3q0fLLh+9mR1y/K1NJJat/JqKQQmul0Oi66A/7k2fOn+/ubrxzeTrQLsvyAy2jZ
 5urAAAA
X-Change-ID: 20251222-sm6150_evk-8ebed9e9f3bc
To: Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Robert Foss <rfoss@kernel.org>,
        Todor Tomov <todor.too@gmail.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>
Cc: linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, imx@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org,
        Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1768471975; l=2776;
 i=wenmeng.liu@oss.qualcomm.com; s=20250925; h=from:subject:message-id;
 bh=dRFzhQfshHTf84BzdT/POTnud6IjyDSFvgLl3VTPyVM=;
 b=s1Z1RtirMGwlxfUdjWrldiB/bQvjXr4ImPeJMLJHSozmB5ORPdo9YjJKPNFRviUIuQcJ+qDrX
 B3gRGMBGT/7DyCutB4CHtnkgFg6NO8W9sKclihqrL7gpdAAYQwFEj/O
X-Developer-Key: i=wenmeng.liu@oss.qualcomm.com; a=ed25519;
 pk=fQJjf9C3jGDjE1zj2kO3NQLTbQEaZObVcXAzx5WLPX0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE1MDA3MyBTYWx0ZWRfX7l8s4jv4fdS1
 dbPZxBIPJUD/JS8Zj/ZhYHsUSDvKaB2FekRVTPKyeEuodSYQIUFqkymAVWGhvRgw/LPGRYUXboL
 0NmnmAVRgm6Z6O2jFrg3dZ/2La2nONtKck8VsMy+Q9feUmTGki4SlwgoXXtHcKZ4Ckts2sgn0FJ
 m9OIwvXYSZOBaLxZg43CiVkqqpJ0BmeCGqznc1O3PuVPJVyzXyntPp3hKpaFCUTo531n4zxpZmw
 /3+UyhQR0XAPahJ50DV+aUwry9T6Pcq2+aKPiPQTh6+8l3CPlv1ypTOifMHdU70xrFpGxsnR4jR
 sxpyoGJAbT2oRixA7lMURipCVh01rXGVPNkTda7YZgxOTLZrRy1VSyp1vAD0oilZZjqLWv+kAZ3
 D53fH3fCNpogF7sVxx04suTMcqtnf6YxelAw1s6A5byyIFNMR9RKXJQP0thVOkKe/y78THzi0+L
 gYHzVZa7xMhtDDPkdKA==
X-Authority-Analysis: v=2.4 cv=J+KnLQnS c=1 sm=1 tr=0 ts=6968bdb1 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8
 a=VACOPh1vIOxWScL5tJEA:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: uuLiqgq75M1gYVgiubuz05Xn3zC421N6
X-Proofpoint-ORIG-GUID: uuLiqgq75M1gYVgiubuz05Xn3zC421N6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-15_03,2026-01-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 priorityscore=1501 bulkscore=0 phishscore=0
 clxscore=1015 suspectscore=0 malwarescore=0 lowpriorityscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601150073

Talos EVK is  based on the Qualcomm SM6150 SoC.
It lacks a camera sensor in its default configuration.
This series adds CCI support and enables the IMX577 sensor via CSIPHY1
through device tree overlay.

We have tested IMX577 Sensor on CCI1 with following commands:
- media-ctl -d /dev/media0 --reset
- media-ctl -d /dev/media0 -V '"imx577 1-001a":0[fmt:SRGGB10/4056x3040 field:none]'
- media-ctl -d /dev/media0 -V '"msm_csiphy1":0[fmt:SRGGB10/4056x3040]'
- media-ctl -d /dev/media0 -V '"msm_csid0":0[fmt:SRGGB10/4056x3040]'
- media-ctl -d /dev/media0 -V '"msm_vfe0_rdi0":0[fmt:SRGGB10/4056x3040]'
- media-ctl -d /dev/media0 -l '"msm_csiphy1":1->"msm_csid0":0[1]'
- media-ctl -d /dev/media0 -l '"msm_csid0":1->"msm_vfe0_rdi0":0[1]'
- yavta -B capture-mplane -n 5 -f SRGGB10P -s 4056x3040 -F /dev/video0 --capture=5

Driver and dt-binding are waiting to be merged:
https://lore.kernel.org/lkml/20260112-sm6150-camss-v4-0-0cd576d627f7@oss.qualcomm.com/
I moved the DTS patch from above series into this patch because it needs to be adapted
for the following changes:
https://lore.kernel.org/lkml/20260108092542.1371-2-yuanjie.yang@oss.qualcomm.com/

This patch series depends on patch series:
https://lore.kernel.org/lkml/20260114100043.1310164-1-tessolveupstream@gmail.com/

Changes in v3:
- Add generic names for the CCI clock. -- Loic, Krzysztof
- Split cci node, removed double space. -- Dmitry
- Rename camera dtso name, add detailed description. -- Dmitry,
  Vladimir, Bryan
- Add dtbo-y for dtso. -- Rob
- Interrupts cell change adaptation.
- Delete cci sleep pinctrl state.
- Link to v2: https://lore.kernel.org/r/20260106-sm6150_evk-v2-0-bb112cb83d74@oss.qualcomm.com

Changes in v2:
- Modify the CCI dts style and commit msg. - Konrad
- Split mclk change as a separate patch. - Vladimir
- Remove clock-lanes. - Vladimir
- Add mclk3(GPIO31). - Vladimir
- Link to v1:
  https://lore.kernel.org/all/20251222-sm6150_evk-v1-0-4d260a31c00d@oss.qualcomm.com/

---
Wenmeng Liu (5):
      arm64: dts: qcom: talos: Add camss node
      dt-bindings: i2c: qcom-cci: Document sm6150 compatible
      arm64: dts: qcom: talos: Add CCI definitions
      arm64: dts: qcom: talos: Add camera MCLK pinctrl
      arm64: dts: qcom: talos-evk-camera: Add DT overlay

 .../devicetree/bindings/i2c/qcom,i2c-cci.yaml      |  18 ++
 arch/arm64/boot/dts/qcom/Makefile                  |   3 +
 .../boot/dts/qcom/talos-evk-camera-imx577.dtso     |  63 +++++
 arch/arm64/boot/dts/qcom/talos.dtsi                | 279 +++++++++++++++++++++
 4 files changed, 363 insertions(+)
---
base-commit: cd8d9e120cd9c8f1772df99a92a5ddb29c068a9b
change-id: 20251222-sm6150_evk-8ebed9e9f3bc

Best regards,
-- 
Wenmeng <wenmeng.liu@oss.qualcomm.com>


