Return-Path: <linux-arm-msm+bounces-68183-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 101BCB1F3A1
	for <lists+linux-arm-msm@lfdr.de>; Sat,  9 Aug 2025 11:17:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AD2C93B864F
	for <lists+linux-arm-msm@lfdr.de>; Sat,  9 Aug 2025 09:17:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4B7AC281525;
	Sat,  9 Aug 2025 09:16:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="C0OjB3f7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0687280CD5
	for <linux-arm-msm@vger.kernel.org>; Sat,  9 Aug 2025 09:16:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754730996; cv=none; b=gai35ucb/HE9JfbTY+DT5s+TXF7IfBBQQZNa2wol6bAu8cS8tFzxBAdEI21VSUxbIHGb6TTbe6jR7TxnZgraW53fUPD+l/qRidvGdPYJubX3PNZYFmetg12nCby8xpZeRmoRKG/ElfsruqIktUjYeiBry3m8HXjR9235DKIJmbE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754730996; c=relaxed/simple;
	bh=1Y7zY65rJYgQ8sY2gOOTnCadfQm7t9KbDktMxzdbFjc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=AhKPENxkzpF5uvtPQYs4rHBEoc9tE/ocp8n9AW+rUt53X91zofql2rLw8QOay+vJNQBQj8rzu+kJp3VRI5xSrnkhNydcBXEDUB35DHDFN/Vz3VeSZm+Xgf1Ec7x+aWk2Im7LYox4OzFNTsqS9msbG0YiyuRCFwl70vOd8EDezJ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=C0OjB3f7; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5793Z1np012568
	for <linux-arm-msm@vger.kernel.org>; Sat, 9 Aug 2025 09:16:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wukwq66wPKvNOpEVoTlqCM/dX5GluHetZv+gB4FYahg=; b=C0OjB3f706CYlkxv
	cwXbx7kRj/bM0XIwbNTToqwZRPWZhWTPCp+3Mah37qeICbPpTy0U8ZmJSQ+ZCifg
	zNiy7YCbzrDIGBtjGhiqzUXZgKNgQebivI4RKE2jPqS3FHcgzOfyhgGSnaJFxybY
	0pBp0XXUwlVL7zqPwFXnZdf+m49P7ybBGLOevma9W8oN4V/DELGlwWuPuYioFcqV
	sbNyj1cWVOSrsCBF9dNzhoKByaKTBdd6PgfN3EsrqwW7yOe6BU8LC+YhVyzs3TdV
	4NkqrcW5RWsB7TazjODnvaACEtF2QcDiQRjhiYuMZZEVTJ2anoH2oPlWZ8ges7jn
	h/xZbA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48dxj40cr0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 09 Aug 2025 09:16:34 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7e69b0ec62cso561043185a.3
        for <linux-arm-msm@vger.kernel.org>; Sat, 09 Aug 2025 02:16:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754730990; x=1755335790;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wukwq66wPKvNOpEVoTlqCM/dX5GluHetZv+gB4FYahg=;
        b=XoJ6nhSiSbLfbNbOxL2p7VGzMOLJVVIjbPIWDKbD0pZY2oMSnh4lDzei9IwvLegRzb
         krSyj31YlAD/RY/T0KIwBKO5BEMUbnsAH0W6/baMaCNmMcxOSjfQoLXTf6lK87zVgOW0
         DX+N/K7V9x7nyJeCXpelJKfuyc7eCb3I89pdFEIzZYHgNRDzuEFDbMvyIYabUdu3Sd1R
         SsBs0xVNfqPb5P10MVj0PmxQHxoihKfU0AJ5GhUciRw+x9NTvdGVkjLeWpjZJN+Kv+nA
         Ae6FsWKp9VxuKzSM9oYn5bS3JnNpf+EmCrZsLE5tyOnRvD3Qs0Z/CC+6bp1c1qWQS41F
         Za0Q==
X-Gm-Message-State: AOJu0Yzf64fwXROhuzjxUfH+Rc1P1hqqOF/hOnG2FCyg/gJWMCCbDKhz
	Wyj7QsQZa+7hxFEe6/FL3IqInw2DIW+fDYdw8XJwCygiW7pfd773EUbulfqnD3TutPaIx2W+P5z
	xMDEwqukVAA6haTTf+j1Y2M63CmRWxkviV9vOT1pFjozXnnfU6yTmXbnskFQCY0LpC19p
X-Gm-Gg: ASbGnctP8RvtKfPDg/aRIGiux/oHu06/xBwO3l0jfvF4LsjITafKY0qoWpyu9vSS5Xl
	LlQ91vKwnHuzzNrhWQ2qK8SDVem918CJvz5yY+H1wAuqH41tAba8yKpvFrylBoqzxzGOIlczf5a
	j7+kdAwf2pmI2c9Q+xi44DwrKHbLH5Z3bFRYDGdtfPJQ5DmV6xt7+/UY+cVHUPhyxV99ILC9tVh
	y6T9eJPL7HbtShSygfvuWwOpBzAxdxN443olLtVF/TBDXyyXvQD+QUckuKbopfSAfQM4BCBRDNS
	ECQTOok2yCqPhGvNQa6wwDGMdZCiaFg3Guubg7Q5lliTDjJNY3htVEiDaxlsJpEKaac7p2shYRi
	1TF/gQoVGi04RXqvvGkzXS/R8TBR1sxZPYW2EYhS4DUVFg2K2nyP4
X-Received: by 2002:a05:622a:2d6:b0:4ab:7cc8:1552 with SMTP id d75a77b69052e-4b0aedd7d11mr84492371cf.39.1754730989955;
        Sat, 09 Aug 2025 02:16:29 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFPjyRAUyTPcM8WjrcEB+3Rkbk5GGRbERk2o3qm81l1UEMInYTDTY07fgMwvBEs7bG4cUrOlw==
X-Received: by 2002:a05:622a:2d6:b0:4ab:7cc8:1552 with SMTP id d75a77b69052e-4b0aedd7d11mr84492021cf.39.1754730989488;
        Sat, 09 Aug 2025 02:16:29 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55b8898beb4sm3361989e87.30.2025.08.09.02.16.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 09 Aug 2025 02:16:28 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sat, 09 Aug 2025 12:16:17 +0300
Subject: [PATCH v5 3/6] dt-bindings: display/msm: dp-controller: add
 X1E80100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250809-dp_mst_bindings-v5-3-b185fe574f38@oss.qualcomm.com>
References: <20250809-dp_mst_bindings-v5-0-b185fe574f38@oss.qualcomm.com>
In-Reply-To: <20250809-dp_mst_bindings-v5-0-b185fe574f38@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        Abel Vesa <abel.vesa@linaro.org>, Mahadevan <quic_mahap@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1280;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=1DHFOJ/5Vedl1A10IE8+ZyGBBk+aXq5TcrqsRnBV7aw=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBolxHiSpd85CuK/DvwuBUFFI5kVBcK7LTK068hP
 V/tFn2s5oiJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaJcR4gAKCRCLPIo+Aiko
 1cfBB/92IEVyNDnG5Q7zSljS6tiy2BKiQ6l6UmbPq1QGjtSFEUPS3PRb/NKZx4qSoMzUL0J9kVd
 aP4GObjTYqgE348Bv/hT0KOnue04WmqSQDXmBA+829EGsW3rVf07K0ByxGCYQb/mamYWPOrliUZ
 pDlNty8T8N7/RNEGT1QMs0X0+H8YNhg/HAejEx+bOmCL/g4jJEb+XR37jqM/lPgP5Md7xkFAbpF
 hnC1JpyGG6DW5t51jZ0D9+iUdaWaPrX1UzClqtNu6vo7MbZE1pHC3OMUZvOd84u8Lsc+t5AaE52
 Jx9Vnjbo/0u5yEo55L/1D4w9AW6CdjXwOgzgWiyWhmEp3Fg/
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA5MDAyNyBTYWx0ZWRfXxkJa0HGE8xQ2
 q83kVUrgQbM4a2LhUKrd52/x/P2mAv7Dcdp4v/QE/tzBWqQKlquKr7lFZy1mGt1+umCe7JIY8dT
 bcaoeSlU+zc1F6/sTlDif9vEPVACfRbWlo/CsGpLqMwzfBPJCvdP9gMNoIwyzgqclEW9iMdsSN/
 QZSUzLoE8TwqujzNGSZ2jbi/1tpYIlo5RqN2tPSIRxt2PBklLD0FJgtPbY0oY0BB/4QQnzfvhTy
 xbKKyTW08wMVvMFGxPDrduwWEmHyY3m8CSZiZvCI0+zoY9gPAWrPszwOYsVnpd1pxYvK5NBUgq+
 0cwOqyTa8STqtoODxCPcLMTWLFXh94W0KpARC3awImJip4NyBgiRYjIUrzvQ5VZSOZRxi2UHDUT
 vnG1phKU
X-Authority-Analysis: v=2.4 cv=fvDcZE4f c=1 sm=1 tr=0 ts=689711f2 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=2OwXVqhp2XgA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=LXTjkAqqvG_e-hvHT3MA:9
 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: DQgiZXhCYr33wq--pHCS925TiZMHIrVY
X-Proofpoint-GUID: DQgiZXhCYr33wq--pHCS925TiZMHIrVY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-09_03,2025-08-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 priorityscore=1501 spamscore=0 suspectscore=0
 clxscore=1015 phishscore=0 bulkscore=0 impostorscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508090027

From: Abhinav Kumar <quic_abhinavk@quicinc.com>

Add X1E80100 to the dp-controller bindings, it has DisplayPort
controller similar to other platforms, but it uses its own compatible
string.

Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/display/msm/dp-controller.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
index aed3bafa67e3c24d2a876acd29660378b367603a..55e37ec74591af0a1329598f6059475926fdd64e 100644
--- a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
@@ -29,6 +29,8 @@ properties:
           - qcom,sdm845-dp
           - qcom,sm8350-dp
           - qcom,sm8650-dp
+          - qcom,x1e80100-dp
+
       - items:
           - enum:
               - qcom,sar2130p-dp
@@ -180,6 +182,7 @@ allOf:
             contains:
               enum:
                 - qcom,sa8775p-dp
+                - qcom,x1e80100-dp
       then:
         oneOf:
           - required:

-- 
2.39.5


