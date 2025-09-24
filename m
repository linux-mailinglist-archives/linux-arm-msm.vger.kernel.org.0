Return-Path: <linux-arm-msm+bounces-74790-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 972A2B9CBB8
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Sep 2025 01:57:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F3298380C19
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Sep 2025 23:57:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5281F2C08CE;
	Wed, 24 Sep 2025 23:57:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YT5/si8K"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA4AF2BE620
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Sep 2025 23:56:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758758221; cv=none; b=M0kYRQZVsINBY3T/HDk/8zZNfERTxxaHQgI5OeRI1Dp04H8HlwjHuYsIRU3zQpr7oW9Rz0HaVbx8JIMUrxzCnwsyJTAol12h+XTSuC5GcY7hSmrmVrpV0Q3Q37FB6I02JcxXYcPUtgyvw/uhfyIluDaA4QpaoGi+4a0dwAUXiqU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758758221; c=relaxed/simple;
	bh=KD1EikTTBqRd00DRUm6azbYoSdAWJCoveXe8AIbfrJU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lq7hUhyQv+3xU/0zmhQd5+oXkIuo6oUoTSLSSFnXttsv1JoBDJ0rJLGVO2nWsasPnuFv0gjOxIgrXzriPpYgK/VUbG73+nQkBBo6fP1XVb4/cgAGrfIFFdGYtr3LnKUwHFSUK2rdXzQnM2JblPYChmCJ83m3v6YPwCelw+ojxns=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YT5/si8K; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58ODFQYi024258
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Sep 2025 23:56:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	isKEQzfxss1sYjk64yoM6hVVlanKUUPiN0aW5OP9ozA=; b=YT5/si8KhXNMZX2T
	aHs1Jv20X4rPpSuqJFJQf1wRMpf7N5oYFWcKaga1VLr4NskpsTnN7trpywqJyUeQ
	bO1R5lWKu4yUaGpnMtQKRswLPX27qqvAOFW3iy48VNvpO0I6DCFGrp8EsW/bfDx5
	UeOgnTNtuaeMshMVREFEMq+tR7f5ug23iKFmvELINIwf5WWaNHsrJZ9/Is/qS3sm
	IfC1XSdYRRrtdRZWNUFqeS8NMkMpYgH1JbbFLZ+wTrhpWyla7tGtIGEOQ0oYfQVE
	fNeyaxSHVp9k1hi9irhTDhXoAnuSLBLUqpcOrZ0f69tl+K+5Sew38MFgAzsBKmN9
	z4E2Ow==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49bwp0d4es-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Sep 2025 23:56:58 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-244582bc5e4so3201385ad.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Sep 2025 16:56:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758758217; x=1759363017;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=isKEQzfxss1sYjk64yoM6hVVlanKUUPiN0aW5OP9ozA=;
        b=I5BKODRGWKCf9k54wPwWv8IJW9CvPTWdl1iryVerQBu58TKtWVFzXr9rxGU17xA8rS
         Ms2co0t7SB4Nob6iTgq2zIzdPUvnDNb4RVjV1jPbpl1kvvbhRxx3yasMGT6QyP2xPpZ3
         wG+tbNPoqvubumsWNFKe2Q3KtagzLdoOWjK7HQ1qrle7dXgg282ZVRRzhkr5uSTvOE60
         sY3ZyB/54KbgNpQoUWb/XiaNqFnBMjgw3HgEoqFBZdB4OAFLnqfYjrUiuDZlcteKZfqq
         z081kJfquK2fGzq89V9DyB2qYZ6b8+kdx5AwNDn8LR38nfo7+o+JIB69BiredP4f71hb
         k8IA==
X-Gm-Message-State: AOJu0YyuLFmIT1jK2h63QUj0eSrkSa8rF188+fnbfxhXt1ruwnw5dBWA
	hnwBQxmfvRbhS5jgLOzyMr2WCWaKDFu+upFMgM296XYrXFvvaHKw05rMl/LAQyN/Xrq7pH8XTe5
	IDwxXnJ7x/Rxq2bUCS0lFN5FtRsC9o+SzuVbBN7RYnp0DGbn66yFCBZDcBCHrG3HXpGV5
X-Gm-Gg: ASbGncunXnneSbJO9mgdvGhWJQrl0iLzqfE3JyqhNLLd3ZQ6hoNf6un1Ci65xWEMLYy
	K/foE6+czCfpjhx7MHuNmuIpgrceYFclKuHJXlgaCD8Kpi5QHwUpi2v9WHiqow/mAuGr2B1pZEa
	2fwIH1pMVF9oOGjDa/QrIxrRyAvw+BVGFVIKYtkPONALSYBU04m8r5xtOlTbluPkyMpXPu2/nSw
	eFpnd9MhVm3BE88xADfiuoZS/tBCoULX2DCnrTAR3fmqGQr/mEEMd/5sbqUvr/OrLPXFrtFLIUz
	B2IWu37JHgO/4aHqC/yq7V3qF3wT5YE78EF5x8QndtaGbTlkkRLpRnIxhJY+/z4PJ3VtrvlEZ/g
	cx0Ay5uvyZXB20B8=
X-Received: by 2002:a17:903:1a43:b0:269:8072:5be7 with SMTP id d9443c01a7336-27ed4ab368fmr13745505ad.56.1758758217268;
        Wed, 24 Sep 2025 16:56:57 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFehxrPaJqcD0zoFcP93jMpuoqnmCDC66PekYT5ca6v2kR3j20bFF+ZvrXw83kR+NSWs2aNaA==
X-Received: by 2002:a17:903:1a43:b0:269:8072:5be7 with SMTP id d9443c01a7336-27ed4ab368fmr13745185ad.56.1758758216782;
        Wed, 24 Sep 2025 16:56:56 -0700 (PDT)
Received: from hu-jingyw-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-27ed6881fd6sm4557185ad.87.2025.09.24.16.56.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Sep 2025 16:56:56 -0700 (PDT)
From: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Date: Wed, 24 Sep 2025 16:56:43 -0700
Subject: [PATCH 2/9] dt-bindings: clock: sm8450-camcc: Remove sc8280xp
 camcc to from sm8450 camcc
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250924-knp-mmclk-v1-2-d7ea96b4784a@oss.qualcomm.com>
References: <20250924-knp-mmclk-v1-0-d7ea96b4784a@oss.qualcomm.com>
In-Reply-To: <20250924-knp-mmclk-v1-0-d7ea96b4784a@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Jagadeesh Kona <quic_jkona@quicinc.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>, aiqun.yu@oss.qualcomm.com,
        tingwei.zhang@oss.qualcomm.com, trilok.soni@oss.qualcomm.com,
        yijie.yang@oss.qualcomm.com
X-Mailer: b4 0.15-dev-99b12
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758758212; l=1045;
 i=jingyi.wang@oss.qualcomm.com; s=20250911; h=from:subject:message-id;
 bh=7G7QgavjnI2PuDqM9mUeILw47Kp6A2VPBmjnh3LL6As=;
 b=Omu47EnR+bgkxUUTbhFMWZbUJ6KHgo0C4uuRJDAgZ109au6Ey0JVTAUiJWM1osKJ5naM/Fl1e
 xl9N1vYgizlCbxAb3FevdwA+lT6Pr52Ad+E6Yhe12SYq+lpZg9pSYPq
X-Developer-Key: i=jingyi.wang@oss.qualcomm.com; a=ed25519;
 pk=PSoHZ6KbUss3IW8FPRVMHMK0Jkkr/jV347mBYJO3iLo=
X-Authority-Analysis: v=2.4 cv=KNxaDEFo c=1 sm=1 tr=0 ts=68d4854a cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=2bVdrMdO9wEKqzfnleYA:9
 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-GUID: 1j7UK-UVGiG0-ttY-PPgWfiyIq9IVsXY
X-Proofpoint-ORIG-GUID: 1j7UK-UVGiG0-ttY-PPgWfiyIq9IVsXY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIzMDEzOCBTYWx0ZWRfX95mZbHYKLSo0
 M0S1MMh6x1nyjB/597hgCH5qJlqvgIbaDzBe5e7+KiWZxaCrPi6m+0XZBHY0LVbLJC4rTPyVgvl
 pZRPJM50soxkJteKU8XRm1FrOIMziFLE9B4c9TiUzBtHrUEwF1PEaPYC9apYrfgrMjjbU/XMCXQ
 9SUHYF29veqi1TDVuqwRlji+C0Chl1SJmyt2a+d6kC23GaNiIluP11TUYWG8oAp/eEVzy8bSKQ1
 AwExJY4d2UyDVPBpKuuInj8KLP+LZthfdAJgkz0rPY/4jeqnq7dlafIT64DJ2PginJIqX1/eSxD
 k8nQmlA9mzIorOAzdeHmNaG7MnhZmmTpN6lFzwhKCLNjOEJ9sTfevnDql8X5TWdJf4KVwP/Myu6
 KAxlNvM0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-24_07,2025-09-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 clxscore=1015 phishscore=0 suspectscore=0
 adultscore=0 bulkscore=0 spamscore=0 malwarescore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509230138

From: Taniya Das <taniya.das@oss.qualcomm.com>

SC8280XP camcc only requires the MMCX power domain, unlike SM8450 camcc
which now supports both MMCX and MXC power domains. Hence move SC8280XP
camcc from SM8450.

Fixes: 842fa7482915 ("dt-bindings: clock: qcom,sm8450-camcc: Move sc8280xp camcc to sa8775p camcc")
Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/clock/qcom,sm8450-camcc.yaml | 1 -
 1 file changed, 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/clock/qcom,sm8450-camcc.yaml b/Documentation/devicetree/bindings/clock/qcom,sm8450-camcc.yaml
index c1e06f39431e..dbfcc399f10b 100644
--- a/Documentation/devicetree/bindings/clock/qcom,sm8450-camcc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,sm8450-camcc.yaml
@@ -63,7 +63,6 @@ allOf:
         compatible:
           contains:
             enum:
-              - qcom,sc8280xp-camcc
               - qcom,sm8450-camcc
               - qcom,sm8550-camcc
     then:

-- 
2.25.1


