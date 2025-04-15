Return-Path: <linux-arm-msm+bounces-54386-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 70EEAA89A3D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Apr 2025 12:32:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 18A7F188DA66
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Apr 2025 10:31:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 48697297A77;
	Tue, 15 Apr 2025 10:27:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VnWBtmbu"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5FF6297A65
	for <linux-arm-msm@vger.kernel.org>; Tue, 15 Apr 2025 10:27:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744712842; cv=none; b=cv2olaEJfNXPQvvbPGAE3qA70VcEJs9VkT1gT1IETwCBzEsU8krrr0+C/oyOzep+wwuYC506mn9ENWSp+hfZViFKl9Of7Li6Tmf14YJ5b1eqiTA8QedvqO+elqtWKLsea+6cQXW5OWHwbtx9/i2Bn7r6t0QxBa6ubjrij+M+LRs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744712842; c=relaxed/simple;
	bh=VoZQVew6viPEuYlrCtdvICVKrz2T3uY7Pq6nDR4GIEM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=d6IZcep5VE2lh+8aWzW+b4hTzFw7544kVjAP3aEvRIXt7B5osdHMMxuDYqjLjSyvm3eLp+V++YDmQVgzyY8YQSToUhARhksmonWZvfw34b6zJ5QxmwBpzEtLp/7lGqmbGrqLrH8oRX3egY5tUxpwYnl1HCgLwqA7pNw5J3X6iN8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VnWBtmbu; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53F8tRV6023423
	for <linux-arm-msm@vger.kernel.org>; Tue, 15 Apr 2025 10:27:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	j4u/3kbOTeLwXzQRuQidArWlAAKpTV0l7G0DJvbKQuk=; b=VnWBtmbuPHfY5x4d
	8QYzNXBBO1heSq6LHyUVMNETtFC6VhbXfiLs1vqBsSXBgzhOdCWpvqnIk/1osHUj
	dybysWNJXFDcvKDfvdYo251Tr37F6ww6zanyqBeSmToaeSc+YA53GocGU89pBmT+
	DMDZynJJga8/KzBdTFfMTPfWXN7TTlyxdJfmjcVyyXsr1LdcYGDuiiJ/wi0BB72M
	eqTp21LxclX60qNxvHFswKSGz8vKL8xMQ0mDWQlXUev4ji+EOIfpzTGRT1sXLrbF
	m1EwNvJXdYGteVSvGOXlBVxkjceqVmgOudPc9JWQpoew3cVI5UIEAxFo2datXaUT
	j0yV/A==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45ygj97ndu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 15 Apr 2025 10:27:19 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7c579d37eeeso824292885a.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 15 Apr 2025 03:27:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744712838; x=1745317638;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=j4u/3kbOTeLwXzQRuQidArWlAAKpTV0l7G0DJvbKQuk=;
        b=Nn9JX1sKlqbjB2yf/fRvDwvLNFVkx1XPW0dHwHD8t5r1NH/z95RRWBUdyUu1eMfcas
         V9xc/UNTIEWfyhGjUWYF0FESEbj2uLK+W2wzamEMMkYySQ6E07BV968cFlmGBAbtXfB5
         ISCzraKoEvrFdVABts9VZornJ92/bizZqRfOHAXj0JIFexebsAXFwV5Dznnr7yqmwwIL
         LyuB8mSmTTJt45T1nl5GQR1epF3gUzm0O+D8EbMn4yYA6qbtNM1gk53zL12s2U5IgMkI
         Y1ZAvvBi0K69pzy9Z5mOupMMotobDaPIIGvZQTLO+96vL4RBHUF/LnsAf7MG5Su6NyeX
         V7OQ==
X-Gm-Message-State: AOJu0YwLp2ZZdqiZ1PS3/oj5yTQTtimLu7zDgjJ+PjUHidSrry2WwBIR
	wOfAr1CvH59e+8p5StcH5ugHqSD1QHzHJTzY4tfCb3TVKXUfuWQ721D3xHlSm1SP7CtFT+tPqwh
	D2/XKTN0ZiaqHopc00UOg8AgZ/4Uct814R3h2PrZf8a9mzjjioYyK20AX3RVKSz67tRsflPVWAk
	8Q6A==
X-Gm-Gg: ASbGncsJ2DMHFwLGGtUPJespUTof+HsmzG2WXsgZkKqrMVor7LjDBmNtKPDwCqzollJ
	mq4w27Y4wj1SvJeIX5w5urYsgJp2B5gknL7ucUOzQ69ck7rz6yV+7JJErgHFG3bFvBjRVRN4im9
	v0TL7NnV0t5ldCBZh6qMiBx0ociiAG5UbWQ5mxcKef6YS2X/oHCw6XfaYrMpngKYekUrIvRL5PW
	IwWwFOp9FC04fUtdJH/IeVdU/Tx+CmfBc7DJUNnvECzJPCAWfCY9MnPJRLSo0p1YUld9yyGZHAA
	ny/yONsORWXAuF5xrXbd+MB0q476e+NYJUnyw/wkbBou8sYU7TIEh2YkPU9YLHH3m1Jj2pt2QMo
	OJ3Z/D+C14TZ9UWKamPDVFoEO
X-Received: by 2002:a05:620a:4608:b0:7c5:50dd:5071 with SMTP id af79cd13be357-7c7af12f0bfmr2349765685a.22.1744712838456;
        Tue, 15 Apr 2025 03:27:18 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE36npubXenGcySKHpgNA4Ak2bCAF2Ne8Wn4iQLaNDcOj30+7S8NyuUx9YbfPhGEegUys1QFA==
X-Received: by 2002:a05:620a:4608:b0:7c5:50dd:5071 with SMTP id af79cd13be357-7c7af12f0bfmr2349764385a.22.1744712838170;
        Tue, 15 Apr 2025 03:27:18 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54d3d5035f5sm1384005e87.117.2025.04.15.03.27.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Apr 2025 03:27:17 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Tue, 15 Apr 2025 13:26:18 +0300
Subject: [PATCH 20/20] arm64: dts: qcom: sm8650: use correct size for VBIF
 regions
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250415-drm-msm-dts-fixes-v1-20-90cd91bdd138@oss.qualcomm.com>
References: <20250415-drm-msm-dts-fixes-v1-0-90cd91bdd138@oss.qualcomm.com>
In-Reply-To: <20250415-drm-msm-dts-fixes-v1-0-90cd91bdd138@oss.qualcomm.com>
To: cros-qcom-dts-watchers@chromium.org,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=956;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=VoZQVew6viPEuYlrCtdvICVKrz2T3uY7Pq6nDR4GIEM=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBn/jRgRXI5hZl9vVYSozhbJrIuEbR98JIXcZ1p3
 E0kUF7rjd2JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ/40YAAKCRCLPIo+Aiko
 1SchB/90UgLSNCrjULGbX1BXRXbsNC1XmXUupD29nGEy24600Q9Wup7MoUT3LqAmv8s12WAe6Eq
 tfZa/sMMZsp+vrN45r4j55Yq+Tr2Dpx3SV+7eKewjslAAyPySxEIlwsBMrOODyoq14+idhkGzpL
 YytUFsiFUaoRI3jc1OSikRDPoeyfgDo3eH63IMiIOWKHb7i+XvUT9VT0FUAZJS4wKKljdEIB0KJ
 GmZK0RVBsrJcrijUFVDAEXHY31brDYL/dx7Nlrl1HwVhMw3GlKbSArrnY7Pfq4U7xSp1pqHKEzB
 5O9syoDkmeRRmmonovsrm0HX/1VyPCJRPQvYGciQbkdrvLQs
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: LdFUVk13d9l-bX9NUfCfJG_KLaRjEP9D
X-Authority-Analysis: v=2.4 cv=PruTbxM3 c=1 sm=1 tr=0 ts=67fe3487 cx=c_pps a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=EUspDBNiAAAA:8 a=QTc1DAzlHLIpBZH1LxwA:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: LdFUVk13d9l-bX9NUfCfJG_KLaRjEP9D
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-15_04,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 bulkscore=0
 priorityscore=1501 malwarescore=0 adultscore=0 lowpriorityscore=0
 impostorscore=0 clxscore=1015 spamscore=0 mlxscore=0 mlxlogscore=685
 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504150072

Use allocated region size for VBIF regions as defined by the docs
(0x3000) instead of just using the last register address.

Suggested-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8650.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8650.dtsi b/arch/arm64/boot/dts/qcom/sm8650.dtsi
index 437daccca1bbe72bf8179e5d4b2f7c097a330360..c2937f7217943c4ca91a91eadc8259b2d6a01372 100644
--- a/arch/arm64/boot/dts/qcom/sm8650.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8650.dtsi
@@ -5114,7 +5114,7 @@ &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
 			mdss_mdp: display-controller@ae01000 {
 				compatible = "qcom,sm8650-dpu";
 				reg = <0 0x0ae01000 0 0x8f000>,
-				      <0 0x0aeb0000 0 0x2008>;
+				      <0 0x0aeb0000 0 0x3000>;
 				reg-names = "mdp",
 					    "vbif";
 

-- 
2.39.5


