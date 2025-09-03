Return-Path: <linux-arm-msm+bounces-71842-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EEE2B41E04
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Sep 2025 13:59:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 086951BA5A17
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Sep 2025 11:59:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 008752FE582;
	Wed,  3 Sep 2025 11:58:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ntQiwgTd"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71AAC2F3C3F
	for <linux-arm-msm@vger.kernel.org>; Wed,  3 Sep 2025 11:58:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756900715; cv=none; b=sUHkpD/kZgAmALwjMQohmwL9pomLJxI9bU2jffrrkf6HmJBBpBNpKZ1ujri8Q8cKMd31e8tJaISfK2bMoHjDUBm6W5QtKaTARrkRweftAN8Io3frEoWPm/9ChInsVniSZBTklx4zEp+KFkoF7clRHOEVOrjAyYfRuCj28D59Izs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756900715; c=relaxed/simple;
	bh=xYiJqMlXkF/RmUEDi8Jx/sYOhGWXsP+4BXARGjRG51Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LPQQ7rMJ7mT50E1Vw4rbHS+bNn5mfsPq0iJhKA9uY42z25d8ZstrQMQLZdrRDe927R3Koogn8jaIzR/AcakARNdc+xRd9RtQYg3Hs6gpRMyfjDPwo0U5+TcT7TgChkqrEfNThg36aQxt62Ksom2j9ThC910h7pzG4yfVziF//Xc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ntQiwgTd; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 583BEtCI013485
	for <linux-arm-msm@vger.kernel.org>; Wed, 3 Sep 2025 11:58:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DvS+pfSkiXK4ob+ewthYnY+XCoXOveBrZR1sStGKsLY=; b=ntQiwgTdufLpb0Zl
	mWz+4Kvk/qRELcJZblqrIFNw9oARFmbdNAN1dOvp4iHFwcNHaJJ2z9f8F+WCDXw3
	DXnn2aImGRVi9gHSqOJ+NjnxSMqaxVgIuh0yKseq0MmE6Ty5Dg4yYGE1H0S+/jCM
	CfMtnxrN34psB9slJReltftm7v9gVyYqpmFF3CToIP1ozTCxo3ALyfd5GuuIE/V9
	/gChH3SPNa45oH8BeLGvUsHBMcWZFuep9b9iL0gvZUKY7uJ58VAw5wtFBDK721lT
	fS40SjLjESLNk1AHpGvL1DT3+kqyaRj+3V4SxpetyTObR/N+Ui8Uc9/uMIlXiU6N
	oYnB5A==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48uscv3ntr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 03 Sep 2025 11:58:33 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-72023d1be83so54836076d6.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 03 Sep 2025 04:58:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756900712; x=1757505512;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DvS+pfSkiXK4ob+ewthYnY+XCoXOveBrZR1sStGKsLY=;
        b=fLVFL+rxoaQjf2pDWX6AMm4KFNojIgbSw0mabjw/woFRVd8zzrurshu5yb/Nc4pKOG
         5hNPr2LZBCBfXgaTdFFYZXVEOUn/oH0e4On8d65rnSfYi0BZDESqFqAGqRyAsqq36W3U
         +cK+b0SgG/riKiNwp9Cr2aFY5p0ymKGDYEOeoPkYg/LCRJny28t34CAaj7R0e2LRRvf3
         0qY9vdmzfnuHi2njiD8fCIwIpAlhEv2baNLFLP6505GuBoADHnE/vn1ob79PfoV1Y3p7
         8fmwTtawE651K3ZKdptQe9ziakWu+8IC9gWUyW1WD37lsa8bJKyoJkEwetQYlB2ZLBst
         8LLg==
X-Gm-Message-State: AOJu0Yz4rk39Xl4kEI4EogQvoglHfgoUNbwnz+vpci1DWkqQM8bQeeq3
	82kDVXvKz1P5NQhg6zYzdY6d8zBFoJ3Lt5iO8VvO25pQ1oaqwgRX2qGMv7GMHPxiAoZpGQSKnvE
	ixXCFbUYV7KnYDMdUGtOfktuP1pRrXEkrUtRe3YQjTd8CtJZjoARy9j8FomCHY9SDx1Yn
X-Gm-Gg: ASbGncuRiMeS7JCSRmbWNhVhCwjfmagjbEatL4jRr/yzqqqYjRHHXunHzRIXiCkny19
	TYHXuu9HWRfCYq5N0HvmVqJhIYYdRkSKUVvrCRLV0S+yXFeXCF3g6SpLO+HiAufhA2DBCUDBIrB
	hJHirNzcwgas8KCF23A5A3DD8WdynykyG+JeCXJo+QY6BkGgJjtSMoDeDMH1JjX7DCNAbN4u37/
	O+idevOj2E2HzFozcYfpmoPFEAxkKSb1dIt9Zq3AnWcAa7Jb9M2ZNcQcBxIJ4BZ+bWrSJ/ANzgb
	UBmUSpQoypL/cG5FiGEVFeFwnSROoWuKRNhojI3tPrqMfX6ecITHj7Co1njj6CxCTlTBLA7lYnU
	gM8LqDrm5gZJVcHjJ9JX7RlZjXHE79dGcrc54gvli3Fdh10AkAJyM
X-Received: by 2002:a05:6214:519e:b0:71b:af61:1348 with SMTP id 6a1803df08f44-71baf6114e9mr91601396d6.33.1756900712332;
        Wed, 03 Sep 2025 04:58:32 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHEi+tlLK0SmA7ZkkpLzHXvsKU3NqR3R6ubhnPBQsbOGPlcQRBLwWi+D2yJKn/0+PaaiwTqSA==
X-Received: by 2002:a05:6214:519e:b0:71b:af61:1348 with SMTP id 6a1803df08f44-71baf6114e9mr91601056d6.33.1756900711843;
        Wed, 03 Sep 2025 04:58:31 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-337f50d30b0sm9891421fa.67.2025.09.03.04.58.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Sep 2025 04:58:29 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Wed, 03 Sep 2025 14:58:16 +0300
Subject: [PATCH v8 5/9] dt-bindings: display/msm: dp-controller: add
 X1E80100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250903-dp_mst_bindings-v8-5-7526f0311eaa@oss.qualcomm.com>
References: <20250903-dp_mst_bindings-v8-0-7526f0311eaa@oss.qualcomm.com>
In-Reply-To: <20250903-dp_mst_bindings-v8-0-7526f0311eaa@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1325;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=UnKbj8oV/I2z2dmxNHPVYZHaNtQSEhlpqnpLKeNGplU=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBouC1Y9YD1JgINpCccE59Jg3NJTVxUNq7VK3C9P
 zTiqZYhZvCJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaLgtWAAKCRCLPIo+Aiko
 1elkB/0S26d6iuoLR5zz4fqpDYtQbGuszfgEB0ByWRteyw2h+acALJqub1jjv5QbeCJNQ+kn3qa
 iyAQB4n7rXkeh68FuZCRJVh3NfDY0uf942HEkaWzhRqly+FiZdyS4g9JsnYLpPxiYgVhGXxUn59
 VWg6zT0Cey8UA0c2nLFTooGXgbbcvQMIWTJmCk8hilPlIZazmr+SFwREXXeGStgYLHo/wA1cp8k
 pIqt/QhC/zfyiIXxV2arNZ3BxHTkmYXpFl2+ywk4FF2cpRckJ1tilrSR0RZ1/bPob47o64is3gN
 LOGKezrr0bYlXp8b9yi+Zo6LVGTiqwHP4U67Yklt/McRGxF2
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAzMSBTYWx0ZWRfX3ysHHHpJVoxK
 SxznBVaBxm7mnu83u5WQC2uaC3KWiieGkCkRoaN9gNycrEhxHFb1WZSr1mH41XTgqUgO2nJUiYg
 m4wXZ/MNwGlGFoR/l+h1yW3SMxpw30NFKYydhirtE26V4dAH0V7u3juFDHlMqkHiOoJnEoGn7Ip
 SWFK1AorLpOjz4nqk9yH32/TAkSFaKXIKxS0xqYhssvzSFY1clbUtEjtd4ak+GvhtKVxOb1jdtg
 7qhBPauV5SX4X+5vafdq/iwQOda8DjMtKD2YdtqkRtGmMBaQ7/zv+XYH8g0J4/9IVVhtEWa2Nqi
 uHHvO9kKmAS4sSSoCFyK57nzRLIH4kxDq1g2OQrcxoxjPGjsdiF9lbMSglb92hopUCSbkebX2IE
 OoelEso+
X-Authority-Analysis: v=2.4 cv=A8xsP7WG c=1 sm=1 tr=0 ts=68b82d69 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=yJojWOMRYYMA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8
 a=LXTjkAqqvG_e-hvHT3MA:9 a=QEXdDO2ut3YA:10 a=iYH6xdkBrDN1Jqds4HTS:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: cxZEiM76Np1k4Gyp9MXT-k-agZbNt0id
X-Proofpoint-GUID: cxZEiM76Np1k4Gyp9MXT-k-agZbNt0id
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-03_06,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 impostorscore=0 bulkscore=0 clxscore=1015
 suspectscore=0 malwarescore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508300031

From: Abhinav Kumar <quic_abhinavk@quicinc.com>

Add X1E80100 to the dp-controller bindings, it has DisplayPort
controller similar to other platforms, but it uses its own compatible
string.

Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/display/msm/dp-controller.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
index a18183f7ec21ac0d09fecb86e8e77e3e4fffec12..6316c929fd66588b83d3abaf01d83a6b49b35e80 100644
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
               - qcom,sm6350-dp
@@ -193,6 +195,7 @@ allOf:
             contains:
               enum:
                 - qcom,sa8775p-dp
+                - qcom,x1e80100-dp
       then:
         oneOf:
           - required:

-- 
2.47.2


