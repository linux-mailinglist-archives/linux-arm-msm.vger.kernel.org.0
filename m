Return-Path: <linux-arm-msm+bounces-54341-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2147EA8983E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Apr 2025 11:40:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 28B5D3B3123
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Apr 2025 09:39:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 172F228BA95;
	Tue, 15 Apr 2025 09:39:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="k/IqUdzR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CE7828A1FF
	for <linux-arm-msm@vger.kernel.org>; Tue, 15 Apr 2025 09:39:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744709986; cv=none; b=FE4K37SDS4/o97vVPDmX9yhN4jEIFGUvG704a9IhCKTrr3k1UfEOi9sI5yZl8IUD6wBx7mb2q3BtgnuGntuk0UDcIybK9Rq/y8/33ug4kgS42AtpvM3/OX3E4FMbF8gxkFtWfY0xa8JB5WR4sJSrkILK75N4sHUkP2BhjhYGrWk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744709986; c=relaxed/simple;
	bh=RGg6LqJQHNLz/YdyIPSyHxFlnkDpez0kLY/KCeMZs7M=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LLcNV3YDgmz+44i8yzHPbmtJcX25fjc7TY/Lwb0DyPDcW0uCmsd1FklZAhfET08ORhKXWLpEhzQl9Eqm1OAClPYrLMOpAIcT4Lq255eXWogbTcNyaJeJvkZ04ja664+uc5L5lhcD15IE/wx63nTHljYZrOt4Yqh79ZH6twU1cyk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=k/IqUdzR; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53F8tCYv019549
	for <linux-arm-msm@vger.kernel.org>; Tue, 15 Apr 2025 09:39:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/QbvJSKxnfDapkwl00/Ate2tQHcvUoOl5cDQeaEM+xs=; b=k/IqUdzRBucNQj92
	R2oMofXUSvg68XqSvUpoLzeKhEkncj37fRhj7sxxT//9KzNeIettuvkUxeJbWAhp
	fdJjNj2HXxpls9vmuDQkZy2t6pBID1MAMU3GPI+sdTNiLGXnK3Bv01zlRd9uy6yR
	4YZWkhKD5Y/7HxcIA5Bs2wddIVY5vA8gCr2nLxUDQyYEv6WcpM19N/W1MAE2OzLE
	kP3LvobnWGmInRCNGAwZVuwvEXT0KDAN7KStXKnT3/irwgp00WQDh7d93J2knVTQ
	KXKNbhFJslrB1yBKTxM7Dd6sGnRj48GgY5phhPhURKtEstJDk3TXGjfIY1iIvTnP
	pygfig==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45yhfcydy0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 15 Apr 2025 09:39:43 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-6f0e2d30ab4so94713746d6.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 15 Apr 2025 02:39:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744709982; x=1745314782;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/QbvJSKxnfDapkwl00/Ate2tQHcvUoOl5cDQeaEM+xs=;
        b=A4VO7PAV5S3VwbzE+cfNbNrWWi9c2LQ8qdb6Ph8oDJ+TmraNLqCNRLpJYY28i1dGwl
         x965hqP7Ll7kLTb1cSzJMIBwiP2B4onaCF0LCnvcD9i9RVHk+IlhuLSaN9IF+u9LtP32
         3Nr0J03gnlOCdm2iWosOU5Uy1EMsq4FpQy54l5yoXV4iCAzxpqH0vqXujMW2p27+2HOm
         HL7Bd/s6mh+WoaAA7T1fisiPTlFQE0narxKEokeeTsDsLNe2IoxRlB2D8A/h9G93RBt+
         cLueKb9S6WEawfv+rQY1zoV/kcszYs8fAHENf3iyb9FpR3bJkLNnYp/L5eeW+bVAkZyE
         ljwQ==
X-Gm-Message-State: AOJu0YylD2FG6sXxPZHh6xtPDQUxvud84xGbm1c3nJkzpdvpRxLnskzN
	eRoLwe+dYWk1uiLeLVgd1viMXT/N1DLy+TLeRNUk1SUrR7Wyyn5OPNSG6QiTXWCKJkOCRRUhHnH
	FUHNQNV0bvaIg6Mt0nWSRerO5GlJm1BfNIRyynzMS5GGzzf9HYL6gBq7TuYY0dRBR
X-Gm-Gg: ASbGncv4osxRS6m99bq/WtjKUGrDWTIQT5dZb4jWuNjGkw3PrJ0ArLindVctFEUHgtt
	Qbcnti/o0urNqWb8heigVhYOxgCmfYjQWU5yMPyYr1zPtruQmOqYaWJ+GScNail9EiKsadntmGU
	QQSYoMPBUVcd7kZUnzpHmjGNM6IRGCguX6NBOlmxsEomHosmse8OqODa5Ht6M1wRornHr1VHmZQ
	qMN5VCe7T6RyT9QpgrIZxOb+OR7Aa/gEWvYQoFpKuQ1SVDy4yRTn1dRbrsOy2lUBF988h3EqtF+
	Rp4nyz7KA/Q0t3Q1U/NbM94ixsXqea+eXOWM8xIWQaHBfp5o8mVUO9Dqp3gISBulVO1+WOhegaI
	4i7KKvcSjjpojTr0clUP1vLKo
X-Received: by 2002:ad4:5ca4:0:b0:6f0:e2d4:51fe with SMTP id 6a1803df08f44-6f230d950dfmr209919766d6.26.1744709982020;
        Tue, 15 Apr 2025 02:39:42 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFD83JrRkLeYEAhElysIxFYiO/qrqAOuHzc5Obfv6TO5nQKTCzkIT8H0zCFaFZ205TMR64XhQ==
X-Received: by 2002:ad4:5ca4:0:b0:6f0:e2d4:51fe with SMTP id 6a1803df08f44-6f230d950dfmr209919446d6.26.1744709981708;
        Tue, 15 Apr 2025 02:39:41 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30f464cbc60sm20141901fa.24.2025.04.15.02.39.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Apr 2025 02:39:40 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Tue, 15 Apr 2025 12:39:31 +0300
Subject: [PATCH v3 03/10] dt-bindings: display/msm: dsi-phy-7nm: describe
 SAR2130P
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250415-sar2130p-display-v3-3-62314b1c9023@oss.qualcomm.com>
References: <20250415-sar2130p-display-v3-0-62314b1c9023@oss.qualcomm.com>
In-Reply-To: <20250415-sar2130p-display-v3-0-62314b1c9023@oss.qualcomm.com>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        Krishna Manikandan <quic_mkrishn@quicinc.com>,
        Jonathan Marek <jonathan@marek.ca>,
        Bjorn Andersson <andersson@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>, Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, iommu@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Dmitry Baryshkov <lumag@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=939;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=azlck2n2u+qrgsVJ0BAEOEuqH2At8nKdcftYTsEljlc=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQ/o/zTCVhoZqo+Bz7P3TL5bcP8LWqHb9WPmSzRN/6Mx8t
 JRtt11JJ6MxCwMjF4OsmCKLT0HL1JhNyWEfdkythxnEygQyhYGLUwAmEq3B/t+n82fyAwOWZ0dv
 PQi/YfRnoaUis4BRVXovq1edzsmEqUVHTrdOvs16+XxRjd2kRFfpKnYrr3s/Sg5n8zE+vRt19kr
 emb2N7Hczpm7uPHs5a8Ozdt+nsWZnpopssj7n9ztevHnXqT+KM7bJHD9U4ZDceeCz3UZJxqhcY2
 bfKZJHtx0J+unkeXSPm4/mvxRFo6DpBWrLlG7E39CzPrSUUffJtip2YckvRx9dFTl68ax/rjRj/
 rITUXJcKVqJTgevc69s124x8WP8UtfY35m3NJmb+5v1HSOB9Wulv7/psJ691q+2W5pRoniGdIzb
 oQd2T3rNquoO2tobl3n9+WZ2iC+twMVggef195KsnoXcAA==
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=CfUI5Krl c=1 sm=1 tr=0 ts=67fe295f cx=c_pps a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=5g6dqdCWcepBQtZB-T0A:9 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: LxsGtI1HRW8Ff1uzwPF0BGtZy4UfAzWq
X-Proofpoint-ORIG-GUID: LxsGtI1HRW8Ff1uzwPF0BGtZy4UfAzWq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-15_04,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 bulkscore=0 malwarescore=0 impostorscore=0 spamscore=0 phishscore=0
 lowpriorityscore=0 suspectscore=0 mlxlogscore=924 mlxscore=0 clxscore=1015
 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504150067

From: Dmitry Baryshkov <lumag@kernel.org>

Describe MIPI DSI PHY present on Qualcomm SAR2130P platform.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml b/Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml
index 321470435e654f1d569fc54f6a810e3f70fb168c..f79be422b8892484216b407f7385789764c2de1b 100644
--- a/Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml
@@ -17,6 +17,7 @@ properties:
     enum:
       - qcom,dsi-phy-7nm
       - qcom,dsi-phy-7nm-8150
+      - qcom,sar2130p-dsi-phy-5nm
       - qcom,sc7280-dsi-phy-7nm
       - qcom,sm6375-dsi-phy-7nm
       - qcom,sm8350-dsi-phy-5nm

-- 
2.39.5


