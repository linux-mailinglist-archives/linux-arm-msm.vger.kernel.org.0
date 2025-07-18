Return-Path: <linux-arm-msm+bounces-65636-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 67385B0A0F9
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Jul 2025 12:47:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 22DB55A7561
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Jul 2025 10:47:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A6685216392;
	Fri, 18 Jul 2025 10:46:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fIangq+h"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE4681B21BD
	for <linux-arm-msm@vger.kernel.org>; Fri, 18 Jul 2025 10:46:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752835619; cv=none; b=Ahz5UH3JI7JVAo4kaximbsxDPnm9+W0Cd6WGY7A1TAy1mNH3pGRn8vRoKdinFa/LZo9ARMLAk/ptl2yAxOPqrtO8yhjh07ObzVLDzNmG+IH+OFZ9Swj4+xu0qH1NOmlwIC7L1sUh3vQVCbs3pCjlgYT2VHLCCgvBhgLnx+hvqT4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752835619; c=relaxed/simple;
	bh=5wy5crBqCcBbvGTsXxUbWrxKJE9+Mz5wRtahEqlnRzs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=LT4JjvG/irvoO403DTbEFwKfay5Ipjx2a/q9d8nS9jst+CgGxnBLvMzBYDQgzXkkAa/4qfnmmT8rRRRaUsId1obh2wQ3KEhRcwgbBVun7ruy2qu1AKQ4eleZuOEJpObXO1rEiKkZpr6BzMyu5NA6TpALB77lPiFiLQx0N3lTlzY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fIangq+h; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56I8HJHC008498
	for <linux-arm-msm@vger.kernel.org>; Fri, 18 Jul 2025 10:46:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=gif+LMxG0jg
	Jt8xMw6rl3aERVL6vO3MZf5qPtUSTZH0=; b=fIangq+hI+zckgCjxrXQN7L0H9K
	08dhqExUB5MuSucXCkH8Lf7LUSKvrPw0N+CDS+Ofll2kWuvGebjO6qnySXcPPYlU
	xV4NL4fBaaMvsa0ZXbSeVyCHgN0QIwkKuGuy7lIl2p/cPx5F/IvLUjd/rCEVPW/1
	Vu/dse7ab/pdXhn1taBDZrotpUqJv9GJiwkJ2+zOb4rhRLvLwacuEIv1iCEyc9wi
	2u3kRtjYtsjRzKhzW5m8VPrWO/4+koRROa8R9QjO6ptGxStlZgWYk3fOZzj7CWlb
	LoFTyZT6iWHMzqBGR4RCUuOQ2jcrNLAfFYlrfFYNjbFCDEHTBRqODupVrWQ==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47ufxbb6px-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 18 Jul 2025 10:46:56 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-75494e5417bso1944583b3a.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 18 Jul 2025 03:46:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752835615; x=1753440415;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gif+LMxG0jgJt8xMw6rl3aERVL6vO3MZf5qPtUSTZH0=;
        b=p8eqlndbWxOYfFH0auLPBqIwBVe3k5gGy+v544VlKTBJ3s8jlCLTeEBwlubM8mQ1Ys
         V5nfNXT88bmPiprT/I8H5bsWTB6YRPZM0jvJcNqWjEYuKdDX/LusRYn8sIw8/l0E6TuB
         uPawTvp+TWOyZJHogVCExoRgiwoRV3Av/XjlhDbb1npzCDa+jGMUDao4hTOn7tOuG9kR
         tv04oBzWQGvHcgQ9rAuW6dTiG2H1sZBvk+Q+WS4DyCQhvH784WVWnd/heNG/9Mze/YFl
         TCVLuoFPwas/0VC1poBZiqfkHNNA52zPHarRgsLPtPI2JR7xaZ10AHeYSnjIQwK+TBNb
         SqOg==
X-Gm-Message-State: AOJu0YzB+pUs3AkN1cZCZk5jXupOiyWG7qPid64qUqgK/f4OlgsEHMNh
	H6F0NRdRFKMtDfxCVG9dvQ7GVbHxKsrm2absGwAO/9wp9lnRBPBS496e3sAoNmM9rhGB2TMLv10
	fA6Pa9utOQp72x65bNiaqSUDdlMt/FUZpOhB8IZ7SPx6DHaaD9Lj6EBWDhGuwf4nYKNAR
X-Gm-Gg: ASbGnctuMtwoe71r1o/1LqVOyUFd3ZPs9ERbY9reWwLSt2BzSglxJ6dxmjyKLQjBXQj
	z0dqa2Dme5Jc61XpMAxtfJHZ+hwnE/KI4GO8FfqkbgyEDK3GeyNGSWvrPBZdkbpRcafUn9bo9Jf
	6f+ZlJ3Y5B1uLa7rxyReLjJ5hq7+lsoQpJtHG1VwJXKLQQ5oEL73U9GCe6Zko2qUCx/oKHLDBoA
	X7HcGDhlg0y00Rzw05Y9l9J/vEapQmL3z8PueFbklJSUuOTOrfEzElt29jsUAv3lVf8/BC0AOMx
	8hDMIUCMuxD1dxISeUOvTutlxfmgUSMiFgDeeN2l99ChAX/oIVvL9Y133i4X2eDV3Dxw5y6ZjH8
	U
X-Received: by 2002:a05:6a00:23c6:b0:746:195b:bf1c with SMTP id d2e1a72fcca58-7596a1877a0mr4234464b3a.10.1752835614986;
        Fri, 18 Jul 2025 03:46:54 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEmit4JF/V6hPtbEMuCGG/dXgfpFvmuDdWI16KeBuC6kTA9Y2B7VQ7qoTDe0q039H8l4VRUOw==
X-Received: by 2002:a05:6a00:23c6:b0:746:195b:bf1c with SMTP id d2e1a72fcca58-7596a1877a0mr4234419b3a.10.1752835614441;
        Fri, 18 Jul 2025 03:46:54 -0700 (PDT)
Received: from hu-mohs-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-759cb678cdbsm1028989b3a.108.2025.07.18.03.46.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Jul 2025 03:46:54 -0700 (PDT)
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>, Philipp Zabel <p.zabel@pengutronix.de>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org, quic_pkumpatl@quicinc.com,
        kernel@oss.qualcomm.com
Subject: [PATCH v2 1/2] ASoC: dt-bindings: qcom,wsa8830: Add reset-gpios for shared line
Date: Fri, 18 Jul 2025 16:16:27 +0530
Message-Id: <20250718104628.3732645-2-mohammad.rafi.shaik@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250718104628.3732645-1-mohammad.rafi.shaik@oss.qualcomm.com>
References: <20250718104628.3732645-1-mohammad.rafi.shaik@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: ZVMU2_ssHZzipuZOFqeSfUApcnU9FGDV
X-Proofpoint-ORIG-GUID: ZVMU2_ssHZzipuZOFqeSfUApcnU9FGDV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE4MDA4NCBTYWx0ZWRfX7lbV2kxajkpr
 3lmMoP3OvxZGRoByjN1ioLXDEY91O8Xab8W8RIMafapAzpyrSf8te/CZifQplBQWFOO97ybQGXr
 cwEtpeTCXQJUnuuaA/xl1hbR+fvhuUxWHfXST+37Ev/AUSZ/HTmsOM5dv3EvZ+jxy6pqaLrZ4Re
 T4Y/zQUKdGgW4INc4dT9rxRPRnklq7xPtVgooFCX+5yvZ4LD4vA6NJo9YFS86HV1aVtV4CLIcM7
 3xJ/7+mEeU/48bIOKTxKOjB57Zw57Vp4XYddz6YxAMCaiLox4FPFecU32Kj6wPgKrgd7Gt7ldWv
 avIn8q4CIV1nHB+onEesZU0ZozICNNjO1rc8eN9pBe51+gGARk5YwO+j9SVIM6+zK4NL2UbvuNF
 uVIUOCy8/S02ta64kIqds9GccLq2Of0fMB7KAKJ8aGvYuE15WjmOjQulfgdixtsqmmSznIEg
X-Authority-Analysis: v=2.4 cv=Xc2JzJ55 c=1 sm=1 tr=0 ts=687a2620 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=Jjn-4_SfM33dySwp1_gA:9
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-18_02,2025-07-17_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 mlxscore=0 priorityscore=1501 adultscore=0 mlxlogscore=999
 phishscore=0 suspectscore=0 spamscore=0 lowpriorityscore=0 impostorscore=0
 clxscore=1015 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507180084

On Qualcomm platforms such as QCS6490-RB3Gen2, the WSA883x speaker
amplifiers share the SD_N GPIO line between two speakers, thus
requires coordinated control when asserting the GPIO. Linux supports
shared GPIO handling via the "reset-gpios" property, which can be
used to specify either the powerdown or reset GPIOs.

Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
---
 .../devicetree/bindings/sound/qcom,wsa883x.yaml       | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/sound/qcom,wsa883x.yaml b/Documentation/devicetree/bindings/sound/qcom,wsa883x.yaml
index 14d312f9c345..098f1df62c8c 100644
--- a/Documentation/devicetree/bindings/sound/qcom,wsa883x.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,wsa883x.yaml
@@ -29,6 +29,10 @@ properties:
     description: GPIO spec for Powerdown/Shutdown line to use (pin SD_N)
     maxItems: 1
 
+  reset-gpios:
+    description: Powerdown/Shutdown line to use (pin SD_N)
+    maxItems: 1
+
   vdd-supply:
     description: VDD Supply for the Codec
 
@@ -50,10 +54,15 @@ required:
   - compatible
   - reg
   - vdd-supply
-  - powerdown-gpios
   - "#thermal-sensor-cells"
   - "#sound-dai-cells"
 
+oneOf:
+  - required:
+      - powerdown-gpios
+  - required:
+      - reset-gpios
+
 unevaluatedProperties: false
 
 examples:
-- 
2.34.1


