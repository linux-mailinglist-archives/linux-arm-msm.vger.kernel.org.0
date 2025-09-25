Return-Path: <linux-arm-msm+bounces-74925-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B77EB9D966
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Sep 2025 08:29:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C19E82E0760
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Sep 2025 06:29:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6AE572E8E19;
	Thu, 25 Sep 2025 06:29:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UF8p0t0o"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2F772E8B98
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 06:29:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758781746; cv=none; b=DzcQR6BTK3gCN/RnOnth9Aoqsz4H8NNInpLTnkPd1yEHYVP4YC2HpqMxU1dKOxM34UthhCSRBKMRIDeC1Ui/0lQgmcsMmw4Imh67evP8AOttTgEG3cLT8ADTIT7F8yP8WJIgTygQb32Bxza9/p2M1hUnCnHLCMn5Q3vtz8sxC1o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758781746; c=relaxed/simple;
	bh=PmOpw/EYlFkARbCMNbiM/N6wPtAmStKVwZu0bN0uBRI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TKI5hrxNb9Lj34uVtw37JpNKerXVwXy7k6h1fmWxpcP4Lg/Z2nImS6rxdZ4mESbp+kThAVfCyNwCpviWvcTAgkQ+16wJry7GH47Gx/b/3TPOL41pMq1xIbYcTlEH2jUUeuaV0uhxxlH18ECl58wDCD3a/wWXnGa2h4cjxMogpGA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UF8p0t0o; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58P02A3c025120
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 06:29:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	syumanWrZUjcI1O0TLXpaU3G8S6LULiW8Zo6+Nj/zZI=; b=UF8p0t0ocvyoPbV9
	qWJSKLFyo/uCn2OzOdcxX6qpu4AQakYpYJGc9PDFgXR7ccMMfYZDl25eL6DKBOh1
	CYdbscH//jYbP9Z1vzg6C1xmC/89GglNgo7xT55HwLKLyET/886XNz2X0a1ytl9R
	33Lfm+um4rbXxhyTNOdLXEzp5PR0FsQA8sodPsIlhD9q7qVs23sn+a457pc8FzfM
	2Yr3Rk1mfJ7IpVih1ufTelCoc8U7cw5AnZNrvaTKGmFpuUulmegSOfsn134QxbkT
	N1jKwGwMbaZ0il0RCjSYHOdWVxrU7E+H+SVuY9TvhieMH2efO3oRKD60v8+rr76M
	ewo22Q==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 499kv171js-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 06:29:02 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-77f4912fe36so515607b3a.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Sep 2025 23:29:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758781741; x=1759386541;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=syumanWrZUjcI1O0TLXpaU3G8S6LULiW8Zo6+Nj/zZI=;
        b=kS6s7L2atla1j58lYTQlwRfh0zuUrIOr5N2uS3oDlINF/+Y0sse4h2xczgf9fcEbIP
         xbBYqOwgsiD+AbAUxRN+7r8FjuhvWBfkoQ0Rc2Ith+wPOb8EM9iIScZAwbhZGsYvS8rd
         gnmgPJeZNqH1oop0fqhdRBI4Sg2ISMw/erd5KZ0kU83dUCxTH63McFQ2OJ51KdbvBhEi
         OUN1QrZFW4MsH+cFnZJP8cs6RGqrn5t3oq2JInEQ4uf6niN+z4w4Kr6+E+mXZGnf6hvT
         4GpIdoPPFdfEcOFTgdSw5HV3ubEVjbl373sIwBAzM/b1G3ydIERsPatEOcDL5dHF6yQ8
         1yTA==
X-Gm-Message-State: AOJu0YzEPpRBC/AugRSJ91maATPe4m/R0bPzJcpD8jrpFBE/MTujXN0J
	maTaL+lCf+RoJZvSGdlLezTuEqkK2t3RHdoZDIoCT6mY+eZKaJa042RZ2BvZ7qFGurMYSTKs/yJ
	CgDbjldeMQIW4eQwMjejgTMzygXeHxurN3PvDwJkmpm2hM+xApj4jAKAL87cWwXOggVCgAmQLtv
	KL
X-Gm-Gg: ASbGncspW/lSCMajOUEk/uwKvj5BNp0eslVcOng7aIKPC01/l2URnvkO5u84kaSeyot
	a5jkPKOpVlY5fz+Ksb++vLB9QEt1suAuzoofOC6T4IuYn64Hei2yBSuU3meDzdrEg5NYR5O4yg2
	6Yxvw01AOLGLMFRn8fBo8SEsMWb6Zv4QXwbdSV9WOMSb1q9JaP+ZSJRkFQVoE/epmVSXYq9NvYF
	hXsfIyhcAVsRzU1xkVUXUlOri4YJiwmrn7V4fqrjLdQKP//851ko0BiX6kgaLajsrQcqZKZebp5
	z+Pdp+pWcQGBM/XJ4h8/piLqDsagzskfu9wkEznxEqBy/qkyEv7gTRC+cnevFGULE/A+SjK6ORg
	RKIgao4rUtk9icKU0RtX2nHkxmvQUJqastyVTLRn1NDf5o8LovPpAsWbrdgXc
X-Received: by 2002:a05:6a00:4654:b0:772:823b:78a4 with SMTP id d2e1a72fcca58-780fce2cc33mr2678460b3a.13.1758781741230;
        Wed, 24 Sep 2025 23:29:01 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHf5M3AmpXjWH3ZY4yFT1pbvy9PyWNjSVRiqBempmGBotHIOY10SAhH6iTuflkNvEtRrydS6g==
X-Received: by 2002:a05:6a00:4654:b0:772:823b:78a4 with SMTP id d2e1a72fcca58-780fce2cc33mr2678434b3a.13.1758781740750;
        Wed, 24 Sep 2025 23:29:00 -0700 (PDT)
Received: from hu-pankpati-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7810239136dsm952962b3a.5.2025.09.24.23.28.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Sep 2025 23:29:00 -0700 (PDT)
From: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
Date: Thu, 25 Sep 2025 11:58:07 +0530
Subject: [PATCH v2 01/24] dt-bindings: arm: qcom: Document Glymur SoC and
 board
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250925-v3_glymur_introduction-v2-1-8e1533a58d2d@oss.qualcomm.com>
References: <20250925-v3_glymur_introduction-v2-0-8e1533a58d2d@oss.qualcomm.com>
In-Reply-To: <20250925-v3_glymur_introduction-v2-0-8e1533a58d2d@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-GUID: aEo9uCepoveJWvM5Xkb1DBvgan1Uv4sf
X-Authority-Analysis: v=2.4 cv=RO2zH5i+ c=1 sm=1 tr=0 ts=68d4e12e cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=KVNckf8Hb-gWPUCTgC0A:9
 a=QEXdDO2ut3YA:10 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIwMDAyNSBTYWx0ZWRfX6vuIvcLlPXf7
 E7cU24/foFFz3fTWPKcSM6mgia04E+JzRNikTNMFieP+ISLbW8j8FFEw8/+eRR4tlLkFUMzXplt
 L8j/A1VKQ/W65Eo7bdrMxuY8ePmddO17pafbDVsLrfy9kONd2uvHf9R5tzAiqXA6PZt39QM1GH7
 9g4Tzaa2MtOVAC85Vbsh6U0Zjyl+yIOEd/Nm7YICYowmmuerHON/qOUugO0H6EUV3Hlj5kRkGYx
 FUFBSbyC2SMgSrshraRkw2IrOLhfg/vfkmo+hVyGaGNMli1slNWuv5dSL3cOmvmTUoqPzsNZecp
 4V+E8YpYkjWoM0JEiGEEOjl7uU9wwjEVmNUu8MefkiaP47rS47dRGt85POYl/SGbLbneGRY2CNL
 ba1TyWFu
X-Proofpoint-ORIG-GUID: aEo9uCepoveJWvM5Xkb1DBvgan1Uv4sf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-24_07,2025-09-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 suspectscore=0 priorityscore=1501
 impostorscore=0 spamscore=0 adultscore=0 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509200025

Document Glymur SoC bindings and Compute Reference Device
(CRD) board id

Signed-off-by: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index 18b5ed044f9fcc4d12f4e3baa001099b6e154af7..b529a8e097a35c10e0008124467d8f6038071308 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -61,6 +61,11 @@ properties:
               - qcom,apq8084-sbc
           - const: qcom,apq8084
 
+      - items:
+          - enum:
+              - qcom,glymur-crd
+          - const: qcom,glymur
+
       - items:
           - enum:
               - microsoft,dempsey

-- 
2.34.1


