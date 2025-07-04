Return-Path: <linux-arm-msm+bounces-63727-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E6108AF984E
	for <lists+linux-arm-msm@lfdr.de>; Fri,  4 Jul 2025 18:32:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D020E5808E0
	for <lists+linux-arm-msm@lfdr.de>; Fri,  4 Jul 2025 16:32:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7053D307481;
	Fri,  4 Jul 2025 16:32:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pzJZNgZo"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4CF22ECEBB
	for <linux-arm-msm@vger.kernel.org>; Fri,  4 Jul 2025 16:32:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751646722; cv=none; b=c52RY5XnVhaOPhNdwqJ2nPmJlUf2qiQp3m8QY1CX87pqPOb9A7/WVv7aRzzeSq5/4Kl2JkuK0CvWwMkJDIkKc4l2XeEwRcCz1gom4bWoTlr/CjRW5/vaDNAhPZhmm2s6IZeo6wPZ8fOHQB8CKIPZWN31Eu0yfbEF27HGiil1F7I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751646722; c=relaxed/simple;
	bh=Wcfz4bb2UH4k4iauZC9yeDtbL/XAGvi5MpIvhkWE+84=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LMFrtDClRlkYT9ySo8NUcOXAAFScjGZTAfm+aOEbc3NLRhGLw+nwwAB2qhmLGcr9s29OoZEKRm3rcEvRBABPN/t4udN+01Y05r3sRUwhLG83zHpGW/U6ygdQr5z86TkIbZjlQTwF4BZn2gUDwCsyZAiPouqYlVUNLWyGa3zDOVQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pzJZNgZo; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 564ABUve014509
	for <linux-arm-msm@vger.kernel.org>; Fri, 4 Jul 2025 16:31:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qjHlmwArjTOMKWmC6+bgZpFfSvKDIyWSaR3a4YOlmAs=; b=pzJZNgZoGz5A7zuo
	dinNmipmBGQqxA76MP4Jan0muafX0QVn2EfCIw1yEcZAkF38webrqcQBW2BHWbD5
	OutQGEAqFDeB/WLDbImmiTGnWkUjamw7Q0s558jikPc8JKmYcNgtDAmav74BwPpR
	4T0fRbSwrcPiP+YJnKprkbvVj13LAbSeIExG6ceaQgJVX/aiSHnUbbfuLYnE/YM+
	AX36LvmKAQB1Gxo1jSMICHIpWtinERqnhXs5geNeUAoGzIF7iMThjJS9XQOjRIsZ
	mEZ0UOBM2e43c6xEi2ClE60/zhl9GWBz/RQxCRQEDu+ec5+hC2kd2DclFnhWJui2
	4kSPLg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47j8fxvjnf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 04 Jul 2025 16:31:59 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7d22790afd2so145033185a.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 04 Jul 2025 09:31:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751646719; x=1752251519;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qjHlmwArjTOMKWmC6+bgZpFfSvKDIyWSaR3a4YOlmAs=;
        b=fwjQ2tLQ79kWleaBf88h7UXcTYR34lKO1dZJgLUkGaIfo0rFZvsEDyrecieqUYUoex
         Jy3zZOsf81F6RRc6fbmVgv8YQYVK/FcMLRgzzuhRWCjmCukjS0LO8rxEG+wGL+Cp3xAs
         hu7b7pGFeEbxlESx3rx53xxxPY+2TioxmTSGc+rAAdCUV5TgRgVGfgAQ4lOa3SJmn+l1
         CFM3MRWTRjq/FqJk/FxOAre3Vc0Q4XQ1wfEovZinF+KSODzudhGDMcJHycRoNTBN+/25
         qrFqbMfHMkqz6EMCvUpzbOYbz2v/uTBbyegZjyJexmIJPT1UBXnY92hxTtj+HuH/t3Xl
         63sg==
X-Gm-Message-State: AOJu0YyXX4KPpijYrhXYJMwaZkORiyGQfGtZuiiedvgyu8DJw6sqn/SN
	hPEoHZatzq9dia+sGFUeE81ki3xYod5WCFZhPlUXIdyVOTQldFOqcz8U8VEgetUMZQ4YCZ1RUVC
	pd4Is1XKAcWJ/KLwu2l+JKwy5Iu8h01uKCmD7yKAyIlSrlPZaynj7Ba/2O91WW5TX3fEw
X-Gm-Gg: ASbGnctHc79O/iiY7gp6xGalMWLRXdq2gjByG6s7vWmnxX5CSj2hOFSn+Zg4SifEL0h
	0IHS+43uJMx1ezo4uAaW9w2Hi2+O+EqsyJQZXN9hWD76UEx4tLPnrj/j80jHo/dclXd2cw2k5AO
	/Z2wfWXrgdFnlgm0ngS4i8h3RUDca6lR/FfPKLP95XI3ff3hjNhyYUjMI0pNCi4A3LqiLkTGA4Y
	d19SlLMHID3PLd/PnxJIfcQMbSPL5WcgVRj/JcTu66/gb0qchMp5h6vc1hKHw8aLmr1YfGXfCSI
	FM4Qo2slHvA+ENB4F8EUYnK9wDSfGARKBepLHZkbiuUrA+fj31O2Wgv7j8Rj8BLfDcyUftFmAVm
	cf1OF4+SyiJ02fyQvNf1HPIcb/4I9ez9Dl6Q=
X-Received: by 2002:a05:620a:4114:b0:7d0:998a:2e64 with SMTP id af79cd13be357-7d5dcd40ec1mr456501985a.56.1751646718716;
        Fri, 04 Jul 2025 09:31:58 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHpMRUrk1CDVU+F2WTSjBGZWFGqazNAhn/w6PL2+6knrtMnP4ChdfOP+UWbEaeEkMn89T79Ag==
X-Received: by 2002:a05:620a:4114:b0:7d0:998a:2e64 with SMTP id af79cd13be357-7d5dcd40ec1mr456496585a.56.1751646718065;
        Fri, 04 Jul 2025 09:31:58 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-32e1af83102sm2813571fa.6.2025.07.04.09.31.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Jul 2025 09:31:57 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 04 Jul 2025 19:31:53 +0300
Subject: [PATCH 1/4] dt-bindings: display/msm: dsi-controller-main: add
 SC8180X
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250704-mdss-schema-v1-1-e978e4e73e14@oss.qualcomm.com>
References: <20250704-mdss-schema-v1-0-e978e4e73e14@oss.qualcomm.com>
In-Reply-To: <20250704-mdss-schema-v1-0-e978e4e73e14@oss.qualcomm.com>
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
        Krishna Manikandan <quic_mkrishn@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1468;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=Wcfz4bb2UH4k4iauZC9yeDtbL/XAGvi5MpIvhkWE+84=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoaAH6NdCA26k5w7rflaL/C0ZoQBv6Ah0F9ug1Z
 Y0jE0oTs9eJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaGgB+gAKCRCLPIo+Aiko
 1d3tB/49669MgQgqtdl5XpVt4x+mRqFwJOfQhto4TFrSToyu4TtQroVaUAA0a6PXNNJnQKjjNaI
 zFcWAAfwkbz2xbvtLvaz9CEuHTV7yq1UGmSJdfhIWDdx1UMkgcpTBkt03Z2JXQDiCdpYW9wHeQe
 VE6dOe0zm0s9ZZ0k8z/RoPPerz2ixTynYeSrH1FrVYczgX3FPjxmAHmPmWKgLoMDpe+GeyhhiaU
 kh2E7j7iwjoP5uijoLT9MNEVA+bqzIB6KAMqE5ohGphvVzjTpZqoH1bIxc7GsrlhMZwy9U5ujE1
 SwLVtNqyyAH5k88oPBL3fDVVygagjafuxZSgqDdaJgUc3fk8
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA0MDEyNSBTYWx0ZWRfX/759QQoYEezl
 WDBpJWr3RS5SxEYr45m5DozxotaO3H4AzK3lI22tMLsEafj5/+RZ+tvoAHKtbtnuV55XlBbAA7u
 8ITBBem5C4lmVXVoqTzHhPmOfgHT/z7P5kgpPuCy675zPryDZZ85V19Dz5gouLMvMsv+NnONtRz
 9t9T9WuwEh9oggIy6hwdMeyg1IJ0ZawiTgpIrYthDeA7mVBhHmuRTGXjb45/xdA6U7XTB7VKurR
 ngI9PPNEfnT8ajFVUbR2p5jA7Z+UoePzIWV0AVvdDCzcCx40t29qEV9Q0LjWyh+XeW8wF5xB3XV
 CskJ6YioNB0aamoHBoyMjcjjwy/0Pbc+YiHp1VqNKgW66iAU4FLSTKn0pvIqsUTnUlWLp3MRnn6
 o27VtjMhSaHZej4EJdlnF+eTH7Yj5bYObvDH/AD+V5Y6FXG2ev57+aTmr/EHi+tP3ZFtakKr
X-Proofpoint-GUID: KGbN6IusFNDt7VGiTeiKT-41TdNTKZtA
X-Proofpoint-ORIG-GUID: KGbN6IusFNDt7VGiTeiKT-41TdNTKZtA
X-Authority-Analysis: v=2.4 cv=TqPmhCXh c=1 sm=1 tr=0 ts=686801ff cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=93dKIss0COAcHyiF0SEA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-04_06,2025-07-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 mlxlogscore=958 suspectscore=0 adultscore=0
 phishscore=0 malwarescore=0 clxscore=1015 lowpriorityscore=0 mlxscore=0
 impostorscore=0 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507040125

Describe the SC8180X-specific compatible for the DSI controller persent
on the SoC. While the current DT for SC8180X doesn't use this
compatible, all other platforms were updated to have one. This change
makes SC8180X follow the lead.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
index d4bb65c660af8ce8a6bda129a8275c579a705871..4400d4cce07227c2f8938f126c77213b2e4bb9a5 100644
--- a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
@@ -27,6 +27,7 @@ properties:
               - qcom,sar2130p-dsi-ctrl
               - qcom,sc7180-dsi-ctrl
               - qcom,sc7280-dsi-ctrl
+              - qcom,sc8180x-dsi-ctrl
               - qcom,sdm660-dsi-ctrl
               - qcom,sdm670-dsi-ctrl
               - qcom,sdm845-dsi-ctrl
@@ -332,6 +333,7 @@ allOf:
               - qcom,sar2130p-dsi-ctrl
               - qcom,sc7180-dsi-ctrl
               - qcom,sc7280-dsi-ctrl
+              - qcom,sc8180x-dsi-ctrl
               - qcom,sdm845-dsi-ctrl
               - qcom,sm6115-dsi-ctrl
               - qcom,sm6125-dsi-ctrl

-- 
2.39.5


