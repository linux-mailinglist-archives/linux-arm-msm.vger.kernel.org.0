Return-Path: <linux-arm-msm+bounces-60242-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id F1C45ACDF6C
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Jun 2025 15:40:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 127FB1675FA
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Jun 2025 13:40:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A92D9290080;
	Wed,  4 Jun 2025 13:40:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SXOvKTaz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3AFB1EFF8E
	for <linux-arm-msm@vger.kernel.org>; Wed,  4 Jun 2025 13:40:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749044435; cv=none; b=eRGZ4OQdD3oSjL7inl8nhAtovCaKD+QWhrK1wvgWHFtua2R0URfz4ad7tOeRlWkF/9S9GpD4qX1pgeRCV7tsjcpUeyZSVNpifydrBf+TxbLnnk+ODEOyqMMehmU1dj5J3q70jZ9fGOdkOJNCHLSLNKBN3PjHtwBoma2kTNmmRp4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749044435; c=relaxed/simple;
	bh=QYQoyP/GIqzyc5A2IeL6llc0Sso66L78LWHvbYzZxoI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=S4CjYqIDCYsXjLl7TNtCyfEI0+m+UnG8loLMFPcFrgzuCxec3LyCk+nOh6kjyRxBGGtCcrRKxVzY1FzXYgewN9celwMZ2IgxM/aTImPShNRpze1rKVlTwEY+d0POEJEFRED8Wlvs9NvqGpD1s6lEswKRsrRLGLAHI9L7iuiRJHQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SXOvKTaz; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55474cvJ028609
	for <linux-arm-msm@vger.kernel.org>; Wed, 4 Jun 2025 13:40:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	uXmKJiGByL9+ymVDz5ljTwOGyAtWHSmObA8IFGGphwY=; b=SXOvKTaz0v5cjPdQ
	LWvUnG6eN3B/1GqCHWln7hDPQz60lZZOtsnmeoYCbeB6xSrzX+JSp2MBOK72Fe+H
	NbhuTjO5IFtekMlDG+szCMbq0bDSusA+u3oIZgbFsTKx6Ig1nCEBUHymg4uo+6pe
	nOySCKnt30Ioc22FG2w9crXzRFMg+kPVp6K2UwsyXsd6j8+Poyv8gRx8a/kdyrdV
	/LtfFuJUOB7dqsjnm7i7GyNvzl8y26JFp1vzWOtjthCWRn6Zcg6Yx/sAwAUcEj9K
	4uhq5mtIA34/bNf7wOBBbMeaCM8IYoqk0nhClkXWKF8RZJDHt6gEhfSr1SxXvowM
	LAehXA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 471g8tx85d-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 04 Jun 2025 13:40:32 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7d0962035b7so1087689485a.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 04 Jun 2025 06:40:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749044432; x=1749649232;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uXmKJiGByL9+ymVDz5ljTwOGyAtWHSmObA8IFGGphwY=;
        b=g21lgxrr+Jv9ODutLYkgusd5bE+gyQjRxZiCAWJHqkkbTad1CuM0N/BjK0GHjqtffj
         C7V4VpfyPLk+2YWXJvLld8wdbv+sD2CTYaZW0JoizR/AlZoqe1LMNDXug/A5EXpDHup2
         pn7dWnYK/QWNEPKdvu9QcDV8NLLDxfXyDQ5MlKn9vkgOCLLVcfs/HKCp+SfXkDWlTUWT
         4pa9dcM+4PQrM0AGLyPdPylcjf6riY/vdV7UhsSNcy/OvYrYsnDj7K2W1NHhYIbGh2Z0
         SQO8Aa7CZlspSPoTiDAbeSSyHGLxVw2KX1OESgbwePo2Jbo/sTICw851cEyVhXkIo5q0
         +Euw==
X-Gm-Message-State: AOJu0Yza7giMuK3FYdBghRDfr/jaC7E/fz0LvFbPcT48F34jX/kGraxs
	Z63JuYdEi2J9VhySwlaMRLbz5jIBdyS5QTN5eZEgnhbCOKSjfQuaUE4lu2YW+t4N0+uQZHyewHF
	mhSx02YOTT3A+v8UJnOQhQJkNB9D9HTKECrFpZtWVUVf2t7K1PEFJ2IQLUrkxzE0jepVU
X-Gm-Gg: ASbGncvjcLzsUuPNtruoQl1r2j8H/ILY/++GXaVJIsK+gxwqCJAwDLyVbEr4IZFP8/2
	/zKU+K99AApBXK6hxTpPZCRF1OTSVWgfNU/Xld+6tZSaimTss9jzVMtHPTyf8JmrHKU7opnhmin
	Kfnn0ed5yMH+COwKz34rPZQ78tlHUb20lPqdAF4xqy/b98EP5NMfoXrFtOUSNFd/MmJhcPeMVpo
	b9b8zu4tNJF8q2/KRmCI1SRVwU0D038rG5aDrxJ1UdFibPUMc4djXSMl0GOZDhkabg0izb1TJLi
	quU1L51fi11BLuQezZ7YC06dgKMWnaSGmkPmMwWPPH9dMxEm+2kkl4Yqn+SE0nVDaT/sgeXPILW
	x+AknLIfNlJc/+CG29hqdt2vc37Vu9GlCUCU=
X-Received: by 2002:a05:620a:2901:b0:7c5:5d83:2ea8 with SMTP id af79cd13be357-7d2198e0590mr457241085a.34.1749044431974;
        Wed, 04 Jun 2025 06:40:31 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGDuyyL4+BjepdFfkjsfwG/61Ndc2lP8nkESP6Honv24RSwh/eI1oIYSxqNNfv+mwA7d58ZCA==
X-Received: by 2002:a05:620a:2901:b0:7c5:5d83:2ea8 with SMTP id af79cd13be357-7d2198e0590mr457238585a.34.1749044431669;
        Wed, 04 Jun 2025 06:40:31 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5533787d376sm2311966e87.28.2025.06.04.06.40.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Jun 2025 06:40:30 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Wed, 04 Jun 2025 16:40:28 +0300
Subject: [PATCH 1/2] dt-bindings: arm: qcom: add qcom,sm6150 fallback
 compatible to QCS615
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250604-qcs615-sm6150-v1-1-2f01fd46c365@oss.qualcomm.com>
References: <20250604-qcs615-sm6150-v1-0-2f01fd46c365@oss.qualcomm.com>
In-Reply-To: <20250604-qcs615-sm6150-v1-0-2f01fd46c365@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=990;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=QYQoyP/GIqzyc5A2IeL6llc0Sso66L78LWHvbYzZxoI=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoQEzMFeLTQxhYDg4DSgk92Iv9ppADpsOoZ48fe
 U3X9NrCCNCJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaEBMzAAKCRCLPIo+Aiko
 1XYVB/sF/4CuY8yvhkecvGbvfYCcZX81/DpAcY31MeaUso8Ivh4uYY5akj9zHA+IDd3+i8c0vRf
 1+57cSCy7TB38GC2dQEiDpeHfctPiRL0mjQyGZkaUBG6kS5owGAfJL8HjVGtUdGNHrz2vDa7mTG
 55q5B0S+i86Mb8iop/76Wufh9gQTOP+golhCirSqkejLrnqTtZv8qnSD7V9WSfioXkjaIHKPzUz
 Nqye1Qp5+Y73vq7eaBawY9x1YjdNeo1ue9tOn48OJS9VnUc6BmYCOmKMKkvm/ysV7Zxt3fQu08p
 oQRCuSl2VeD1FdKVU5lRIypzq2uGUefcJDVrek05cNt69Ueb
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: XB0Qp5JsY5h7x-toDO6-b9Eprmb77-mF
X-Authority-Analysis: v=2.4 cv=Qspe3Uyd c=1 sm=1 tr=0 ts=68404cd0 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=NDTdqBo84DM6fKfIBT0A:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA0MDEwNCBTYWx0ZWRfXyO0h1ZHtJtQH
 zd6aE+OlCTw2B6Y/7eoZGQgfh3OFGTtQ9coC+yQD1spSwUZTEvnB40OUoOcRSlN9x/viACtBttU
 7ilNX94dEYSPJbdmUC3bz6dgqgbjh2iBBPv0khSooylu+L69mH4esLCgUWak7rSl+9S1yW+b8D4
 eWNzsuvs6hw2dL8Ga84JMgPAmWs9ehqXnRyM/+6SKyMx6HKDRs3pQaS8sTc3uZhuGvyc0lJfO9K
 02ExS+3w09ur5ppk2e4Au0oN+cmxAE/XDGCxSESS/hfoevLKTI/Ll+lbseNLTjyHU5tx04U0OND
 htzWnsJ6o7G6LUYko9giojRRnYEaq7JKutjQdNEbwrjiGLxvKC2YYtL70UoUctWaRQt+zFb+SHR
 WKhKVyjKA4McxstMt0E+IWf7ZkmhFb2LORrlloJg6wu9k2Sm3Xq79zuZXKhdd9turNDxcSOe
X-Proofpoint-ORIG-GUID: XB0Qp5JsY5h7x-toDO6-b9Eprmb77-mF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-04_03,2025-06-03_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 mlxscore=0 spamscore=0 priorityscore=1501 mlxlogscore=999
 lowpriorityscore=0 suspectscore=0 impostorscore=0 malwarescore=0
 clxscore=1015 adultscore=0 phishscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506040104

QCS615 SoC is based on the earlier mobile chip SM6150. Add corresponding
compatible string to follow established practice for IoT chips.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index 56f78f0f3803fedcb6422efd6adec3bbc81c2e03..a4725c7d877d8074985e257c5e35869ce610aec9 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -87,6 +87,7 @@ description: |
         sm6115
         sm6115p
         sm6125
+        sm6150
         sm6350
         sm6375
         sm7125
@@ -943,6 +944,7 @@ properties:
           - enum:
               - qcom,qcs615-ride
           - const: qcom,qcs615
+          - const: qcom,sm6150
 
       - items:
           - enum:

-- 
2.39.5


