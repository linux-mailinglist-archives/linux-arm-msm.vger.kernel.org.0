Return-Path: <linux-arm-msm+bounces-71193-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 94C07B3ADCB
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 Aug 2025 00:49:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4277A7B16B1
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 Aug 2025 22:47:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6269D2D839F;
	Thu, 28 Aug 2025 22:48:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KOwXSvHF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B28C42C374B
	for <linux-arm-msm@vger.kernel.org>; Thu, 28 Aug 2025 22:48:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756421310; cv=none; b=E85qsemPKHCMrbRjHq6vUYFb3pXl6HUbnsLqlHWxPfensD+sF9ifl1Np0aagsYUqm0RjvV1IJ8JfriHxgLJjWXt62eJq9f1lh8XqtSlFSkoP3/FVNAv960w/QPU4kd5YgWTUGB5IMBmVLM+mZP8tADAblxHSHG2sGwOGmyu7+Xo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756421310; c=relaxed/simple;
	bh=a8ke4j4Y6LPEDYk1jRjeU6q11tENi0EWXo++z7UB0Dk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Vfix3IzgtvkKKMWBigzl1Wh+cr9X0jYc6oa/D62J9uYI9ZLbJqsw5mZNeKLDRTKmq3tb/VIkqzumYte5b+EGvUVoUMML12OTGi4JLQnXOy1iylePkXM2HI4LwVMYV328ulfcx2tjxL6nOIg6lb/WpD+DPet8jyJrgTfa6SsTwNk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KOwXSvHF; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57SLWjZE014789
	for <linux-arm-msm@vger.kernel.org>; Thu, 28 Aug 2025 22:48:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9CzfHCqMGwSglqPBGTXjDnFh1Uf1qA700EaDFGkGlqQ=; b=KOwXSvHFq3Q+Sk3H
	wqB+Kx1iY6eREtTX+dCys026Z+kuLoItLwF20J+IUUAS+sgKyZuaMlRnv5ChnnsV
	rhhtsM1RYXNDX4PYtVZ9UzD0+fWa/TzwTjszfmmkirPJ1uK/5Bs9o8IZoN+uYQpu
	piCBnyHWj3wzdJa3I3aEg2ftc7b5dfS8Xqz0qvk2Who+gGPpKVMqAKNqoolLjJ9R
	3JVxKLQpHWFBcV5Y1hiSuRFkOutEFWxg7VN8BE3ch8OoUmMTVnhf1eF8B9Nmo5Q7
	xrzEkmwqOy7QALHn41Rn6xYpJj+a32J+uFSlMHsLOVS4hXtsGGcARM07N2CLGwPH
	IzLeXw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48rtpf49pw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 28 Aug 2025 22:48:27 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4b2955f64b1so40502601cf.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 28 Aug 2025 15:48:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756421307; x=1757026107;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9CzfHCqMGwSglqPBGTXjDnFh1Uf1qA700EaDFGkGlqQ=;
        b=hkcmANzVMenICaA8ZALGdaLv4b9GL7Ks7RHLKW+F9WqNxsr5P2Hqj8zT+ejszmITI/
         ZacxUlA16j02uJHQDyt1nrzNvToX1uoWWzoygIS2osiBD4Pt2k7px3MBT1BENKRWLCKh
         c2MnDmLuk5jk/zFbFnVMf1PaY67dhwC0Jkb3NVx5p35rHe1RjohNHZX2vymgHIj2MRmK
         xfqk7oHYfPOSDI5aVTZ6Nubh39dE3pzvnZ7IyuBk/fzC9LRyvPtE8xOB2u1LhhBezqvt
         E9DBX9xhETSQmxS8zytS/yVLQKHX/R7xK+ixDDswc4VyxF2FSNRPVkCN915jFh2cTou7
         Fm9Q==
X-Gm-Message-State: AOJu0Yys8f1yaY+GqhdGhF+nGN1yHNzMq6ORQCrqgmU9Q4Hedh3tddv1
	UjCoWyWHRxqz0pI+yxzWP4nQZpoeOiPBUSvxmnhWSKHrPq/yOuZ44ZmltowF5XRLwmWR94hDwND
	NkMJ605BPWnlVr9LQLGD9/DHHPybv0ZenciEQ2IXujsGsR1TDOi9JcifNSYSAGy9iRb/u
X-Gm-Gg: ASbGnctwKjKx1Zz2jDNY3CsFHvGAi+vrhhXX4oT0bwMO1kIWwbp18hGm0/04wxKZJ1B
	fAJnhEQ1BnteBND84wN3XRGK5FhUGZ5tRHztka/paI0zGZJIXq+s6GgLjaU2k3rwBXTNG8B4NrX
	9WTVsyetctseE+jJc03Bh0MU9kfMdSq1kOLd0KG5jDpBjSrcBsW5upSUSgIFqKYfcw8K2YJCufX
	iIAJ4AjdMSo8vkfntSjSJ/wIH8E74H+8LGe1ODx/zUHikrFPF1fm9wMRAQzYjMnX3tCs+zp3aLb
	3WwWGPIo33l7BaPmFhetQ9AOG5nec/8MN+RHTJit15vcqnqleO/CvnoIUGrOGgASdxICVnhmTMW
	p8/xuZJ/UVrGYFz7U2Y2b4yLc5uRYD9hhNmejWEXvYFdlt2XYXMwx
X-Received: by 2002:a05:622a:1448:b0:4b2:d2e6:65c2 with SMTP id d75a77b69052e-4b2d2e668b9mr191806281cf.80.1756421306601;
        Thu, 28 Aug 2025 15:48:26 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGCdAdhID476E4FJAsgJd9Dlj9RXcXjRQlt01OfE2NZY0X5oYh9UoxCNApwcv9zL+zVkYW02A==
X-Received: by 2002:a05:622a:1448:b0:4b2:d2e6:65c2 with SMTP id d75a77b69052e-4b2d2e668b9mr191806001cf.80.1756421306131;
        Thu, 28 Aug 2025 15:48:26 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55f678452e1sm143807e87.85.2025.08.28.15.48.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Aug 2025 15:48:24 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 29 Aug 2025 01:48:17 +0300
Subject: [PATCH v7 4/9] dt-bindings: display/msm: qcom,x1e80100-mdss:
 correct DP addresses
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250829-dp_mst_bindings-v7-4-2b268a43917b@oss.qualcomm.com>
References: <20250829-dp_mst_bindings-v7-0-2b268a43917b@oss.qualcomm.com>
In-Reply-To: <20250829-dp_mst_bindings-v7-0-2b268a43917b@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1755;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=jGBROFXef1Ek+8wHh+Y3Ci+prYLBgIDZTxGb8ga6KTM=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBosNyw/ResXLlslDfwBRdxj/Br6oQIkGV9nwqWN
 G2EP6JxFBmJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaLDcsAAKCRCLPIo+Aiko
 1Z2YB/4pMQvDDG5j4PigCLCfVpG/aqvA10fBcLpnjQZin+TrGjbiVbyaanCFF0bOzmLTy9U/XFP
 w0eocswluxidVH3/VuavvWJZPsTJLgvSlLm828Dwuy4iXwi49S/yYtrVv4nzQtIBPWZyO/mjdQC
 cXy9ekuZHQ3gUXTbOZYdV2ceKluEniDwCSwsghhKvmAb7NvwrMwWIu+20OiSKhPc1Erjk5xooNe
 KlHIG7x+yKff2WlskCbxjIbztAiLvGHYRIS2HcVAZOBeXvzaB3UKiFVJZf4ZyVwnEKXT8nLqdVK
 eeKd8mXeg81XaOPvubEnlUKfO2etkVGN+SEXRcuScEUxhT9i
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: dL12UEr5aJ0A92tOzw6RP52QqY5X7N9P
X-Proofpoint-ORIG-GUID: dL12UEr5aJ0A92tOzw6RP52QqY5X7N9P
X-Authority-Analysis: v=2.4 cv=Hd8UTjE8 c=1 sm=1 tr=0 ts=68b0dcbb cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=2OwXVqhp2XgA:10 a=COk6AnOGAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=fvGZ3mk3BhhUN7shqj8A:9 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODI1MDE0MiBTYWx0ZWRfX62uR8IHHPGe2
 ic0NJnMm8JSIgMVbzajv4e+ajavVW/a/jznVs5x5SsDXtxvvnUerkBQenFg5g0SYgPZIREd3Lj9
 DQuQcK476qNieqaBMp7fU9nJiz7kvpdry0d1YiSqHhXpGK8b7C+Het0IUSwR2/SNI97/3LfMbGn
 9Wi607iApFlE99PKuI1YVR0d7KJwlUnzy3aBL5TMD167rtvjcO2E8jISYJV0U4/tS02FQVPcIxT
 QZavsld3yv6xI2I3R6n0sY/d2ObYY1kAHsDPh39gXGkqE6rwZKTyGuuYNcqUP2Y5lTekRaaUkVi
 PniUYXMOnou/9G9XQ+Y2LayQfH3+kAVr49RXTPyfi/uN6EfE7K7snyST4VAG544ti+amMvgl1cC
 x2SRCuTr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-28_04,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0
 adultscore=0 clxscore=1015 impostorscore=0 spamscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508250142

From: Abhinav Kumar <quic_abhinavk@quicinc.com>

Fix c&p error and correct example to use 32-bit addressing (as the rest
of the example DT does) instead of 64-bit (as the platform does).  It
got unnoticed before since DP controller node wasn't validated against
DT schema because of the missing compatible.

Fixes: 81de267367d4 ("dt-bindings: display/msm: Document MDSS on X1E80100")
Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 .../devicetree/bindings/display/msm/qcom,x1e80100-mdss.yaml    | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/msm/qcom,x1e80100-mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,x1e80100-mdss.yaml
index 3b01a0e473332c331be36f7983fb8012652a8412..e35230a864379c195600ff67820d6a39b6f73ef4 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,x1e80100-mdss.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,x1e80100-mdss.yaml
@@ -170,11 +170,11 @@ examples:
 
         displayport-controller@ae90000 {
             compatible = "qcom,x1e80100-dp";
-            reg = <0 0xae90000 0 0x200>,
-                  <0 0xae90200 0 0x200>,
-                  <0 0xae90400 0 0x600>,
-                  <0 0xae91000 0 0x400>,
-                  <0 0xae91400 0 0x400>;
+            reg = <0xae90000 0x200>,
+                  <0xae90200 0x200>,
+                  <0xae90400 0x600>,
+                  <0xae91000 0x400>,
+                  <0xae91400 0x400>;
 
             interrupt-parent = <&mdss>;
             interrupts = <12>;

-- 
2.47.2


