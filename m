Return-Path: <linux-arm-msm+bounces-70539-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 32A1BB334AE
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 Aug 2025 05:36:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 866097AFA8D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 Aug 2025 03:35:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 36C4625D917;
	Mon, 25 Aug 2025 03:35:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oWMhVuWh"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93EED2580F2
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 Aug 2025 03:35:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756092945; cv=none; b=Cjt/+FpOV+W1ASl2a3LHfrZ4byYqnec6aiWAXxghFwshdry9ECEJso+h3jk4pGRi/Hiy3GC5mdwFPyr6sNGYPaL0lLI5vc3lcKsT1Zu03VSyIFDlq0VFPOq5IwHbeb+fCP4qXBQ1sLO2JXeHfeX2alUxrOs8ckKTyR/qwV8jeA8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756092945; c=relaxed/simple;
	bh=Vcbndb0BitXQXBCCDy5phydPWg7MwP6Brhlf2YVSZNE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Dx6zkjddYVHCai5I8omXmH8/T1l7fuIHvqGtz2Jt/ofweAidSdRdpLNbNqkByMIZzcuFgJyzLreUWJ1paeFGW2uSgvNhyW9ez6O1BqmJVRUNA1kz+2HoPthzYxIYqH6mH13bo/HrnCVjMK3Wyrco4B13OeYNAhq0rFh5lzo5C04=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oWMhVuWh; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57OKL8Vp011679
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 Aug 2025 03:35:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0Yg/2s8cwpHYy/pmAzzHeffOyyjabiwQv6sxOo7TaLA=; b=oWMhVuWhjhnFFmWa
	IytyVZT/fw80q/BUz73knjb9dRlJg5o2SMT4JQ8pSna+mR0iD3NluzvDM2FZev4K
	/nhwHfy+9u1LtCdHWGXMJRp5YdZchJ6t0Q5vuhleK+0nQqFtbFjUBm3JwGIH+WPR
	tV0XNzWTcgSqymWYelNUcPGGRG8sjDLX3oF3MlBNna11BRDAbwsqs44ZISZDlu9+
	0oARbe10VKwp3odp92ymxbwCBDUxLrc+7q3ofeb7n2SaLeO5+zpnD1AB5iM5FruU
	D3V55hZED4YmEc4kI/vbAbtEyFYjnc1AbI3MlGqd+qR/fJIXDS0EUbDuDxoHH3u2
	Dzq0DQ==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48q5um3ke0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 Aug 2025 03:35:42 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-24680b1905fso13666875ad.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 24 Aug 2025 20:35:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756092942; x=1756697742;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0Yg/2s8cwpHYy/pmAzzHeffOyyjabiwQv6sxOo7TaLA=;
        b=dNu8lm/8Xl4YbnwDIrDJmu2o7STjfjb1rbi+mSyK6QKkIjSA3jsrSjNUeZhbgWW2tX
         TXkd1SlZfladYw5Wjpka/ZVgOs/j2ldViDXlhYE9jYCl+vL3z6yaopqidirdVWLW8awd
         sZHbSd769Hj6rS9n3dbIGuZJ/ZnJY4W/pH/XczIleCihg0FVbrPriZFc6sUTg0HLzypO
         zF/JZtlL+rBjbhKROjbhikXHn9kEAzTkWNQWdhSDY2b+jraYvKvBbe4sK4gNKBdcLbah
         yitfUfG+W/97Da/M28ogdZq7EQ3o+sd0oyoYWZgksGLfd54TPUdksLFetmlEjAyczhbr
         uvng==
X-Gm-Message-State: AOJu0Yyg5U+YpXQHZqv2OU7nbJhfa9r3kRt8jyEpyzK9r2DqrwkkEMEV
	XrY/cCboGeAfO+JHwmPzgFHAehaKbkF1l17cgWZuQZt/24GlzDsCKTr0i5IC175wSDT9fCPwSyR
	jAGTLFOX9ZabyKHN76wEjXlXwTSRakUcKGr+4TfrqhxasankJzC48/hQcJ17kJ4+1gFXr
X-Gm-Gg: ASbGnct5+G0/KJE72/toKdeSCuotRcTorr7Bur4kYr6o3ZXLyoE+/kL1PxxscovadNY
	WDBLqufiicDZserP3Cl6r6vPtsH2/99ZOD8T2ssLgYkGOyTcB0nMokgM0VylYtg2PFeGLxMMCzd
	blTbJ+zxR8gImPP2ROW6fCEMfw/tq/g887IDI5U/yIBpSDgEXwZQYScrG2+S5bDzdFLfQj9e+j9
	ZYcqzAszggsQG+pzH76D2wnV4tEYCgSk2+rU8e+guaQ5mEs5Py5XRMZgommNNTadeh+kEFZxhEw
	9E/s2cHgxVDpASINhQobfW/R0194mQGa3apKAf7NZL/tUSQtXoxkQudxOVk7rOHe4NUIobM=
X-Received: by 2002:a17:903:1b4c:b0:240:11cd:8502 with SMTP id d9443c01a7336-2462ee1a94emr104486245ad.13.1756092941962;
        Sun, 24 Aug 2025 20:35:41 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHIayiCQhykERtgqE3/QyLN5qc4N5nnERNIq6sat/ZgQrYqvJ5iGLOZQo1u9v0cQun56yecKw==
X-Received: by 2002:a17:903:1b4c:b0:240:11cd:8502 with SMTP id d9443c01a7336-2462ee1a94emr104486015ad.13.1756092941456;
        Sun, 24 Aug 2025 20:35:41 -0700 (PDT)
Received: from cse-cd01-lnx.ap.qualcomm.com ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2466877c707sm54859565ad.22.2025.08.24.20.35.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 Aug 2025 20:35:41 -0700 (PDT)
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Date: Mon, 25 Aug 2025 11:34:20 +0800
Subject: [PATCH v9 1/6] dt-bindings: display/msm: Document the DPU for
 QCS8300
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250825-qcs8300_mdss-v9-1-ebda1de80ca0@oss.qualcomm.com>
References: <20250825-qcs8300_mdss-v9-0-ebda1de80ca0@oss.qualcomm.com>
In-Reply-To: <20250825-qcs8300_mdss-v9-0-ebda1de80ca0@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Yongxing Mou <yongxing.mou@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1756092925; l=1231;
 i=yongxing.mou@oss.qualcomm.com; s=20241121; h=from:subject:message-id;
 bh=Vcbndb0BitXQXBCCDy5phydPWg7MwP6Brhlf2YVSZNE=;
 b=VmGPf/kXtbdgJwEU9kmGm6raoxahnIcjLJYE7n6dbhH3xq8vaqonHtFHsWtTtSk0hFei8lH5P
 7PoCFRw4vYDCsAG0a+3nKVXf687bS17my0UjT/NianR1QTFbn9va466
X-Developer-Key: i=yongxing.mou@oss.qualcomm.com; a=ed25519;
 pk=zeCnFRUqtOQMeFvdwex2M5o0Yf67UHYfwCyBRQ3kFbU=
X-Authority-Analysis: v=2.4 cv=VtIjA/2n c=1 sm=1 tr=0 ts=68abda0e cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=5ixSZjX4nqodb9qzXsEA:9
 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIzMDAzMiBTYWx0ZWRfXxAV7QA6z6gZS
 o5ocXQ/TylF1/Rz37sZ3SN6kjGQwhHpY+zZJU/8HpHBulD4T/3/2ea3ysXWkshWCbtDrjYq3tKR
 iWJ9BbcG0BVWwd5DhWMI10OUxBGcgMLhVB4tvpCQQrMBKKabgu50VciW9h+xmamcPxY6NsKnD4G
 LTiqxSD2gLaJp4JmgRekMx48V14YKxu7ZuyTv/wwEWzQQEhuLDyNPpc0MmWCTjLdGwvg2ILrGn2
 gDw7TKNJv2qKRv33m/caxbP89yMJgY8EnlPGF+p8ArYJTiYCqVwZvVRjQqMbdd7vJZChJxWkBxS
 b66bhr7eb/IAivEuajFlqQMs5/FapFJVinLhhQ4L/uEkpNrVBlBtoA70O1KVe5GGsas1uBNNulp
 1i8udEQc
X-Proofpoint-GUID: btYxfMTlwKS2VdEUkq2AOra7eDh75fum
X-Proofpoint-ORIG-GUID: btYxfMTlwKS2VdEUkq2AOra7eDh75fum
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-25_01,2025-08-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 priorityscore=1501 impostorscore=0 bulkscore=0
 suspectscore=0 malwarescore=0 adultscore=0 spamscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508230032

Document the DPU for Qualcomm QCS8300 platform. It use the same DPU
hardware with SA8775P and reuse it's driver.

Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
---
 .../devicetree/bindings/display/msm/qcom,sm8650-dpu.yaml  | 15 ++++++++++-----
 1 file changed, 10 insertions(+), 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sm8650-dpu.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sm8650-dpu.yaml
index 0a46120dd8680371ed031f7773859716f49c3aa1..d9b980a897229860dae76f25bd947405e3910925 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,sm8650-dpu.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,sm8650-dpu.yaml
@@ -13,11 +13,16 @@ $ref: /schemas/display/msm/dpu-common.yaml#
 
 properties:
   compatible:
-    enum:
-      - qcom,sa8775p-dpu
-      - qcom,sm8650-dpu
-      - qcom,sm8750-dpu
-      - qcom,x1e80100-dpu
+    oneOf:
+      - enum:
+          - qcom,sa8775p-dpu
+          - qcom,sm8650-dpu
+          - qcom,sm8750-dpu
+          - qcom,x1e80100-dpu
+      - items:
+          - enum:
+              - qcom,qcs8300-dpu
+          - const: qcom,sa8775p-dpu
 
   reg:
     items:

-- 
2.34.1


