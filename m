Return-Path: <linux-arm-msm+bounces-81732-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DE64C5AA0E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Nov 2025 00:36:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 353E63545A7
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Nov 2025 23:34:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3384432E6A1;
	Thu, 13 Nov 2025 23:32:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fufrg+A/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Fd9DHKFT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FF2A32ABFD
	for <linux-arm-msm@vger.kernel.org>; Thu, 13 Nov 2025 23:32:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763076725; cv=none; b=pQifScggEdv4hF7fRPwRXjnrg35RjMHmv9odp7COUUmMOz5cDxVvLRh7QWBy7yQMgETSEZI/s6Ky3xnjYRkqz4CclD+/ZgmzK0q67DMC3BKns/06/QA6sUtNuPfErJ1ZQbjn+Ii+iavDB8yFbbB+0clM1pTXtkLaVwpzIJRLXcc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763076725; c=relaxed/simple;
	bh=+yhNHPe0JhwA+eOy4wzvzgK3jwdDA7lGVXF9GN6vVCw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TvKy9kT4tzbG1dpA8wwb7kWegZJxgO6UKTxYnIfLCI4E+ZaE+LfUTvk6RukDRpDrO9dmA4JGqYIcQAkWsjteCliZBMOOLcXwVOaYxsJ2Rked736gz2DcSEhnU/i8NUtr2opv/1kT3Qv6CFL+K1dXe+uU4gPLMh/yzgbgI7eGusw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fufrg+A/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Fd9DHKFT; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5ADMapJo1581530
	for <linux-arm-msm@vger.kernel.org>; Thu, 13 Nov 2025 23:32:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Sx+7duOt8Mg6zZHNtc4wd93FWjeo32qOP0acS5OMuFQ=; b=fufrg+A/xvLPXJTR
	4goiQlZWmQiZLlyKIyzu7A0PvvDEGbY5TrNXy5RWDaW7zCoGqbpArXEUNNDCn3U6
	QIuxR/9S3N83lS0SF4YCS0rFr7xVW4TNZjYVh0Ex9CyD5c+gPEuQvrYwOoGb3PMV
	BoSm46RZq6QHmWCBlwhUJpG4XgjBlfwXf/8RKMIhrzQ3mPEd41Lko8PUMpQTbgvH
	Yrhsdng5FjRaP0AY25++McgRwtTm0n+avl5/HMgqJ/pjZgSGFnYBrSHLos779594
	OQcPnKid5h4OHFznwLit4FekPz4EwG3ow9sRY9HrgWbVqGKeeqtvyW1MCXJ0q+MX
	nN+6UA==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4adr9fr4d5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 13 Nov 2025 23:32:02 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-b609c0f6522so3030356a12.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 13 Nov 2025 15:32:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763076721; x=1763681521; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Sx+7duOt8Mg6zZHNtc4wd93FWjeo32qOP0acS5OMuFQ=;
        b=Fd9DHKFTTkuEAv0TmpJ0McQh5Y+5Ww5Kvd8oKuH8nckvdB+9qZhWgA6oGsdS0TT4n2
         UP9YNbWdU2BhFqlQx8KDror5Y23iJETcEOTY8VWCU9MhteFqkypT/GLi72LVTlcz8dhT
         IuSlGyj3wvfz7BwN7yZGZxEVR2K2865SUMc6Aprn8v5TEDsdcYgefdIjtnf3ujMXT79/
         EFquuOrV+WUZiDUeCBKzZpZ4hOyOG7fEd2nu5icEnmJ8J+z6FFoZIwwUcrS89gjyfI42
         iHPjcIHLlxP9nSIT71h34tH/vM92rvizJ2FMkEc4ukgTwrIg48C9wFJ3jBKxzTx2L1lM
         +WuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763076721; x=1763681521;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Sx+7duOt8Mg6zZHNtc4wd93FWjeo32qOP0acS5OMuFQ=;
        b=kkx0x34/65c3TwqvzVp+LOGEKgoropWqIShyfEVwy7iyTvsywdefj1zAbnFH9uo5+B
         H21nw9KDpsSz+K0pecvCQYFYX9eScY8y/jMCm/KmN65ZtuIrRVHIzEMCKkYOhdTovSiS
         oQz6PXxXdHA4wVBBRyMKvw6yJJMPW1riZMqJn6TqDDQ9Kd6mLTnKGvJsDPHyYkQh/h79
         0fFAjEvyBN0OlJ4PffVlCwGJlxKz6eywLL9gs3YEmbqmHIs8u8DVwNlRP36WUpXv5Nom
         53Fqf5OyoETo730V46mcbAVbVmpnmYKWI43wMX/rbVDuU6cR0FcrC/LLzdYpdO3hCLRM
         KZeg==
X-Gm-Message-State: AOJu0YxX73PAz80Zbkp2eXfLM2HSDM4PtT5qOkpGEoiWWpjclhXW1co3
	1Rhn4pZgoMnV3NHeJqkO+Y/xKx/T9nOXSkYDPKHYCEsYjVkfRg0uYVTBbaBZlndxw2zPSBo73I9
	rSE200PoW0HeMA7JNv/OzBAgcvJ5qzEtojUFRCdEg2xBfK2uN31YOwxYUURvSQbvGooNh
X-Gm-Gg: ASbGncsdwopWvogk44T0A02IDKHFoBr18CBM/WYMC3+sTb4LoPS9uDwmrqEv6kr/XSU
	1wrQNnQnkR6DYssGMd/DN854K8QoDdDNH4CIFpRMHnu6KZqsEp/phgU/VH3ugmsE+FLsVW9XRyk
	AlisBkNvsv4Y9WKYeDuBNbjykgyOqTRIPq7K0/Z6kL4PPf/JnVLTn5cUr5BwW/IG2JOa4umzZ6u
	sHbxV468y3BJm/pgPwq+wRnDhdo3QMInkJBa35JtzSClh2k3cFBmAiwEMSmI9/hu50R6IzTHpGM
	EEaL169iv9Q9IZ+/Qxr8RCtG4tht8Kh7jBFXoyoonJaEoKSH57+QR9F/Q6RswSW7v5Sbtkr3OB7
	VkXhKH0eM2e3L8TbN5QcHBnQ=
X-Received: by 2002:a05:6a21:6da1:b0:34e:a1b2:a35f with SMTP id adf61e73a8af0-35ba2692da8mr1640193637.53.1763076720949;
        Thu, 13 Nov 2025 15:32:00 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEX/aqiHfq+KfDFbcwSzPve/zFmwha2Yv2xlolDdxZkmw42sGuTr2PqLnQdgxCC3lptWEZ10w==
X-Received: by 2002:a05:6a21:6da1:b0:34e:a1b2:a35f with SMTP id adf61e73a8af0-35ba2692da8mr1640150637.53.1763076720415;
        Thu, 13 Nov 2025 15:32:00 -0800 (PST)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-bc36ed72cd1sm3049486a12.11.2025.11.13.15.31.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Nov 2025 15:32:00 -0800 (PST)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Fri, 14 Nov 2025 04:59:15 +0530
Subject: [PATCH v3 18/20] dt-bindings: arm-smmu: Add Kaanapali and Glymur
 GPU SMMU
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251114-kaana-gpu-support-v3-18-92300c7ec8ff@oss.qualcomm.com>
References: <20251114-kaana-gpu-support-v3-0-92300c7ec8ff@oss.qualcomm.com>
In-Reply-To: <20251114-kaana-gpu-support-v3-0-92300c7ec8ff@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Sean Paul <sean@poorly.run>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Jonathan Marek <jonathan@marek.ca>,
        Jordan Crouse <jordan@cosmicpenguin.net>,
        Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Connor Abbott <cwabbott0@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
        devicetree@vger.kernel.org, Akhil P Oommen <akhilpo@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1763076574; l=920;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=+yhNHPe0JhwA+eOy4wzvzgK3jwdDA7lGVXF9GN6vVCw=;
 b=EVrIxsWJTSe1QIoktPi4f9hvpt+misNrn2q21fLyuIb1hcisO++zvNfpv7RIWnOz7RLMMksXA
 uKfR/4rWGFlBNoAJWn6V4gbbQ5DHcW/ZW+YYGwoh/JaM3aQxtDxxox5
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Authority-Analysis: v=2.4 cv=SdD6t/Ru c=1 sm=1 tr=0 ts=69166a72 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=nx9Ee08JJy_q_36Bb04A:9
 a=QEXdDO2ut3YA:10 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-GUID: Jt7TLMry2C0pEUEzOM0MW1wKp7ath6OE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTEzMDE4NSBTYWx0ZWRfXwvIG79IYSipX
 EjTpKPhjew/+qd0Fk2/peAWTr80ipKeWR6QoLtFHdyt1SWPm6bl9oJsc0tXYN21mlnt+RpEfPxO
 dH6f/2cvozwu+pRA9Ix6MPN/AUlPGKLOWj4NW5KKslUQDojP5sieWXPor+rED5I8XCatvCtibcD
 T0bYBSiSayPrWn7QSBS7EkcqaPNRBz9b5jUTrLr+PyAkfA6Ktsp5gBZvqp/KxLrlqyodEMr9xiu
 kwdKkTSHDxYsq7aeEK5hU9UZaJk/2Wm64KmIzVW1sQ8YmdV6OMBIty0yzJfrAPylRvmWRH7QxJA
 E5PKlLYOB4oAriCxLRzM4teYJ8ytwNjpb6/r/dkY7KZ7N6eJbaM9y4IeurmsD0Mi2nrDg0aLB02
 EiSMr/bOx/iEHsURcfoKx3kbU7vMwQ==
X-Proofpoint-ORIG-GUID: Jt7TLMry2C0pEUEzOM0MW1wKp7ath6OE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-13_06,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 priorityscore=1501 spamscore=0 bulkscore=0
 impostorscore=0 phishscore=0 adultscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511130185

Update the devicetree bindings to document the GPU SMMUs present in
Kaanapali and Glymur chipsets.

Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/iommu/arm,smmu.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
index 59bbd20992c9..cdbd23b5c08c 100644
--- a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
+++ b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
@@ -91,6 +91,8 @@ properties:
       - description: Qcom Adreno GPUs implementing "qcom,smmu-500" and "arm,mmu-500"
         items:
           - enum:
+              - qcom,glymur-smmu-500
+              - qcom,kaanapali-smmu-500
               - qcom,milos-smmu-500
               - qcom,qcm2290-smmu-500
               - qcom,qcs615-smmu-500

-- 
2.51.0


