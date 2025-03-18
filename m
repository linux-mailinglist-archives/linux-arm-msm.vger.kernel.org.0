Return-Path: <linux-arm-msm+bounces-51724-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 48B29A674E1
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Mar 2025 14:22:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C9C487A8E8C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Mar 2025 13:21:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 930B820D506;
	Tue, 18 Mar 2025 13:22:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ceSP6CvK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFBA520D4E2
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Mar 2025 13:22:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742304125; cv=none; b=dSskd5WtwIlJxjA+3nNCtY9kvdbKB7Gi2N/aTxJJ2GjdythPxmNeAgp2hVt38F+gumoERYDDv/XpEiCDYNBwvmW9dE3iFpYKTHNvNJ8uaRIrHBW706ruSsUOslv2qmuSu0Tr6VW2qw7mfFA3oo9GMgGsgUILWyQUCZZ88CnhV4I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742304125; c=relaxed/simple;
	bh=WRG9dHTLQ2jwnkCiRxmgtVZUE3m+6omsipYnyHhT2vg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lmRzSZrdurAMF+NlqQ+yUEf81vs1ImfZuWtIto1syZ/nAXiKMAVrScHheN6uSQowG2V/HS5gMoQv0eFzok0OdtgFVOkvhtNGuYv4VA8XpvqDOdAW5nLNWXS3vJt0g8ruq/CAkjMpXr8mZUToLdWBAlRZW/3YIOZ2r8o7eCwViCQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ceSP6CvK; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52ICeDpk029975
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Mar 2025 13:22:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	X5Zt92XUDy5ouQWe6YZM2smr3YjZQjLfBRQBMqLOYPk=; b=ceSP6CvKjtr4DnXn
	lLv+pgcEdqXW0ymxnBZkOsD46u6qzGTH7kayqPtmBC1tI1qXtLJXY8ugSjSEXddO
	womshixQfmptd9rDO3NXuWaP00TDbnw2RqCbuuICwaNf/c77F+Q2/M5C9Zweuz/T
	iGkkIRwjGOzJ3va/g69in4rVzNKHzLfbjrJkrgZC8F2Gp2DJX8HqS+5/qMwEOLxv
	crJgf700gt4P+t/GXSVtOpOs7cZ/v742UIG/m51iM4q8BUZzY9jZVD2L2mxBSHZk
	/3FQgFChGkZUVkvX/KneGT6BE0rIjyThwIiC+p3tyCV+ms+92lv28iSaB+0CQ+fN
	fJdcLA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45f91t04bd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Mar 2025 13:22:03 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4769a1db721so155021241cf.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 18 Mar 2025 06:22:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742304122; x=1742908922;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=X5Zt92XUDy5ouQWe6YZM2smr3YjZQjLfBRQBMqLOYPk=;
        b=t3qnDseC8kePbu12yv0Ki5s0b7dJJbWQldbej195b5yedYgDVxwaJ5arGGxwtNsaxC
         wnD9ScVCSpxh/yzOiY1L/LoJT/pXqyi3WQwZt1gofjcs1A3RYd8Tx9WrNyFp+MACbqCd
         oHjBO8KsHc/9uCzScNViYQ2YFdWJskspHOdB0cXhg9wwh9qKW82k+yycI1rtVX1pNo2p
         5CNG9eUC1hlh1s2RIpB7HRNxyF613N3uH/gyAdi10g4Na/zV2kvXsqCk31SzeAqJX8eq
         8olpTELDhFwCktRFTNskPSoSn5+ZJf5+vqlxV1IuAUmpF7NhkXvzcN/cRMHNuvjmBgai
         iUJw==
X-Gm-Message-State: AOJu0YwvxP/zQsdD2/kkcTW56KdjBanu3BW/LNEefcmqCTyEH+ux8s+c
	vlp3bQh9f9vS3isWwlatIpvl/tbK+H68+cq6kn48YTm2955nv/pU4dLhKUBAOE0iw+wXeJpif/s
	AzugAhpUeZaAA+Lz/REM1nkIIb5i7St/Y5imjJsb2c2NmD3a3siJdN5Gj75ott67s
X-Gm-Gg: ASbGnctZGJh7jWNV/+RTMrCJG1Uwn7NVIHqO9i3cdRigZVWU8JclMZxaFIIm8TSjpFc
	opYIZDXh3d0s7//S2c2DeiDvDykeywttWpCFuHjcFxcSdjRGsfEQF/NihQLvB8J0uX3dHBMBFRV
	QVlaiV4e25MZRoPcpkg3QVd2Ebcqe7PIsMB65RnzYDAhx5o4QEuTNGwFxL+EXE7zj/3OWiFrRNj
	ejYVyZ4BuFjY9kRz7W0jz15f21fxgFgumDbuzqR0MaTkTHNFWNGc46ZWxjs36Vr3We3CMjDKecl
	xFjnGQlAJlz7vjzBPP0mNPne/MBSxrC1CjryJQciHB9dAY5YT46fP2GC2dTfJ5tGMex4U43WH6L
	V+jWHmjCmXhKOSCFkrdr4CBa9zPpa
X-Received: by 2002:a05:622a:1aa4:b0:476:60a1:313c with SMTP id d75a77b69052e-476c81be73fmr272683881cf.32.1742304121718;
        Tue, 18 Mar 2025 06:22:01 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHMDX9YCPE1SejzEThnKhge4s5KldlhhfyHRYQcza/O5nZzlD1qSBcGR65zSvjafi6B4G69YQ==
X-Received: by 2002:a05:622a:1aa4:b0:476:60a1:313c with SMTP id d75a77b69052e-476c81be73fmr272683291cf.32.1742304121211;
        Tue, 18 Mar 2025 06:22:01 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-549ba8a79c4sm1664831e87.226.2025.03.18.06.21.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Mar 2025 06:21:59 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Tue, 18 Mar 2025 15:21:54 +0200
Subject: [PATCH v2 01/10] dt-bindings: soc: qcom,rpm: add missing
 clock-controller node
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250318-fix-nexus-4-v2-1-bcedd1406790@oss.qualcomm.com>
References: <20250318-fix-nexus-4-v2-0-bcedd1406790@oss.qualcomm.com>
In-Reply-To: <20250318-fix-nexus-4-v2-0-bcedd1406790@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Georgi Djakov <djakov@kernel.org>,
        Lee Jones <lee@kernel.org>, Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Leo Yan <leo.yan@linux.dev>, David Heidelberg <david@ixit.cz>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, coresight@lists.linaro.org,
        linux-arm-kernel@lists.infradead.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1206;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=WRG9dHTLQ2jwnkCiRxmgtVZUE3m+6omsipYnyHhT2vg=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBn2XN08jOJNuTwSkced9eMV/MJFXViOwpWGg+uF
 Sug1KvNIAuJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ9lzdAAKCRCLPIo+Aiko
 1SdnB/9UibMVLZAffmcCMLl2vNveRklOZJhQww/w7wzU49Z/XM+FndkKsxB2dbQjyoCtVIk3vXi
 CnfABPrfYXfDbO8VK1/uySV7lLKSorOrPfBtjmbIjjiRL7Qa5J4Io/RQr4KJ3lXZnAq1NFyr1fg
 So7Imex5ClHXoBBjihMKpx+RO0GRjvHpfPsKQ6Iwhk7K2MYINbx1TupiqopZT2KF7T7mPZWz/hS
 8XjB12n/Vda7Lbuj5Z6I8toKbGuOzwjfvTUtCNFjUZv3qg0Ojcu+sukhqgRURN/DTYEhKqpZDlb
 /UVPGfxHD9DzcV8XFQ2PviA7tfEJdbToJ+CGmaQ3dijIcUIG
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: YAQfv547_zQT4sRDoTTrXET4rJG_Y6xZ
X-Authority-Analysis: v=2.4 cv=Xrz6OUF9 c=1 sm=1 tr=0 ts=67d9737b cx=c_pps a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=-Z_mRg2wFor0aBS9cE8A:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: YAQfv547_zQT4sRDoTTrXET4rJG_Y6xZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-18_06,2025-03-17_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 bulkscore=0 impostorscore=0 mlxlogscore=999 clxscore=1015 mlxscore=0
 priorityscore=1501 phishscore=0 suspectscore=0 adultscore=0 spamscore=0
 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503180099

On Qualcomm platforms in addition to regulators the RPM also provides
clocks via the child clock-controller node. Describe it properly in the
schema.

Fixes: 872f91b5ea72 ("clk: qcom: Add support for RPM Clocks")
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/soc/qcom/qcom,rpm.yaml | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/Documentation/devicetree/bindings/soc/qcom/qcom,rpm.yaml b/Documentation/devicetree/bindings/soc/qcom/qcom,rpm.yaml
index b00be9e01206d1c61802dee9f9ec777c4b946b7b..10956240df0856a4241d6032d3aff7d447af9ce6 100644
--- a/Documentation/devicetree/bindings/soc/qcom/qcom,rpm.yaml
+++ b/Documentation/devicetree/bindings/soc/qcom/qcom,rpm.yaml
@@ -46,6 +46,14 @@ properties:
     description:
       Three entries specifying the outgoing ipc bit used for signaling the RPM.
 
+  clock-controller:
+    type: object
+    additionalProperties: true
+    properties:
+      compatible:
+        contains:
+          const: qcom,rpmcc
+
 patternProperties:
   "^regulators(-[01])?$":
     type: object

-- 
2.39.5


