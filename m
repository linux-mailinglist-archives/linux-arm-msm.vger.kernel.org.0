Return-Path: <linux-arm-msm+bounces-54716-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C594A933E4
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Apr 2025 09:52:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A7C231893AC8
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Apr 2025 07:52:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 371C9274666;
	Fri, 18 Apr 2025 07:50:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ExwlSEzL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C8472741A9
	for <linux-arm-msm@vger.kernel.org>; Fri, 18 Apr 2025 07:50:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744962622; cv=none; b=ZVUDrgP+Hcup1bsvqO5IES2ubvLtYrLWvOrygJy0VHIXl1bFcB8xR/8iIup1Aib63SIw4n2fjq++S+LFfaQWYeW0yBb/xuvBDuAA/b+HIoZfD7sR4vGIYpi1k+yKY4ZQACvo/06h8SpTb8XOJdhrchamlhbb200j93YH0qDYOxU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744962622; c=relaxed/simple;
	bh=TjhfmUBWPuRKp2VKhI5As5MNL09FnEzFDA2kKOvChig=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=EjnCkYcrqF+NL/f/cvq5soEGPz4zaMddeU4Da7GLaVasA4/h3oGNgXlVeHNQdQipq4j8mpHqO26jyN07PzMd1XBCW3DraVDa4Q1YolDQDm3exL2YsZYQvXYME58zXQv+/KDAeUK3bWFT6aUCa0gN2dmU1PZOkO/gZ44bp08VUng=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ExwlSEzL; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53I2lbeB001246
	for <linux-arm-msm@vger.kernel.org>; Fri, 18 Apr 2025 07:50:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jBom37zGwjUcEJUexe/y24yFDLJmL/J5QBTdnrbnixM=; b=ExwlSEzLMJ02Ea3c
	KzM4wJeen7RNWJlaYuzipiNakxiuPvtJKB0sZUFuzH6Dz/4zoZSi/VOhLFstCxBh
	86+5VET8KIurHInZDfqnA2XspLFkdtHVuh5YCRYXWcFGgCTPssAoFRSuqoEVRRT2
	zAWGF592zB/jie+i7plLruWYOvC1Ps0WflUVTHN9ftdlshDfkV7j4QoKpIpteFGD
	12/0qd/ZUfaeRQZJriMRT7qKxuo+NlNrdZJmfUF3okthqzUC4dXDuGGcS19SGy2r
	ivPpxhuN0XiobZsuSrK3BKI/YzvmHLp9PGZ2k/u69NgUSO4X9YkCu0UgGVG3DfB4
	NdJWMw==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45ydvjhmf0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 18 Apr 2025 07:50:19 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-6e91b1ddb51so29454446d6.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 18 Apr 2025 00:50:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744962618; x=1745567418;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jBom37zGwjUcEJUexe/y24yFDLJmL/J5QBTdnrbnixM=;
        b=AaHknQuZZIuhlLgdoKIswNOhCjFMu+AMQAXUyXMlUHpqdG9Z20poIRjGqvJzXR+KS3
         0Z5juC2FbnDuLntKXHNVPnF955kkzHYW1NCNMsFGsuFNBSwqx/BGXTtU5XEjiyQL4Khw
         rqIGEKOB5hfjFTq8eB5lDx3P6d5STA1CS9SMOFXciRTNzkP3wEXA7S/BVqQ+r2gfUwpp
         4VSZykz/CyOH1u3+lzMnYn8ECbT1JKjfXxWpE/iPvvFPTdLwrrF5Zmv9LUcpShz16HLl
         jI/5JShGBJoCPgOumG7lp3Rr33wiHQxqn+Ka43Yjw3XpqV3zUf3gj08z9U8kN7serTCO
         WrNA==
X-Gm-Message-State: AOJu0Yx5xsyenXR7JqWQunfc5UV7jf4a+5w+SKw6CBL5R4VUQj9QH3Of
	GfXfp8XlFmDFBkNJajeEEp+rkd+bkntElVHTqEhmKa7DIHj+W6v5FtDcLyW6lGm0nlAiaw0TWJC
	o/VkYP7FPtu/Ubgv1mq4t5CpgO5FXWoH8hNY/8djwCylF2TF5aPR/A/EEgh28JgK3
X-Gm-Gg: ASbGnctPdTov6pLF9uHZ7yUk5FtKVVPNTNXTq72g1QMpe5CrPf16e4LU9WZ26wxND/K
	ZB2mrHrILCQZqr1a9UPYOX1ayVfbblFu9t7JWBxrPz8iDS+/rs9+mEQVchQF1NEvp4cuhetQiG7
	uRodsoYgCkUWbV9M9V8OW+aYDi9MQEWdhLfl603isDVUBwWKb/9WzuluFBBmHnbR0cF9FebwwG0
	vy0vpmJ9FWENwV6hvPUhZuHJW7z/4ZW0BJiiKiJaEKP/uj8Xip+n74gZzbbuRdvkdQyewaS7J3I
	KT6d4BUehMwHaeCpshwgoys40Oh4fZr/aiwO+yE9woT8ld5/cJP6giOZ4nZ76j9Q6ogAqHe/FtV
	Fk/+WwyX1RTjPdKql8OsXOn7P
X-Received: by 2002:a05:6214:d0c:b0:6e8:fee2:aae7 with SMTP id 6a1803df08f44-6f2c46846dfmr28955886d6.39.1744962618020;
        Fri, 18 Apr 2025 00:50:18 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEp41yz7pGz3rEyrIWBHkmGxcC/v51+s0suhZapt8oZMdW/ahoCp10mwhc7lFNRji3DDBckxg==
X-Received: by 2002:a05:6214:d0c:b0:6e8:fee2:aae7 with SMTP id 6a1803df08f44-6f2c46846dfmr28955596d6.39.1744962617702;
        Fri, 18 Apr 2025 00:50:17 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-31090863bd0sm1649061fa.113.2025.04.18.00.50.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Apr 2025 00:50:16 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 18 Apr 2025 10:50:04 +0300
Subject: [PATCH v5 09/10] iommu/arm-smmu-qcom: Add SAR2130P MDSS compatible
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250418-sar2130p-display-v5-9-442c905cb3a4@oss.qualcomm.com>
References: <20250418-sar2130p-display-v5-0-442c905cb3a4@oss.qualcomm.com>
In-Reply-To: <20250418-sar2130p-display-v5-0-442c905cb3a4@oss.qualcomm.com>
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
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1005;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=NsF5aI5nusL+eHX5Edd+WVqyrIto2M0m5QQZuN1UEGY=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoAgQqkZgl/bdTTEtxJp0GnWwdE3JkQfrfSLAQo
 xuILrb9K7yJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaAIEKgAKCRCLPIo+Aiko
 1ctKCACX1msikRt57+al3V2ScY3uZ8f0c89G55FBgYosm8h42OrGpKJK6eMCDaD8bjypFkY/pA8
 pSCJKCbzPr0wK/vmGOpz5lT6oFBO6WRXjl8ed8ktiu/TOjgmCSrSh5VqWthOd6ctL53I+oaukuL
 dJEojXXHPYuYYn05pYHi8+0hLO03FKzot3dv9jmWWK3Itd6zvgEyfm/5e2GDchZuHDFHphwlrdP
 5SMQf9ygiz64TwGNz2xu5tWX8KZ9cL7QxHhtX40n/NAF1ZlMKs5MevkP1/XvLB4bELzY5L2Mzvt
 itQx7oLuu1YULW3cPAt/zJhQwEve3LrnLUOjUGz4JLXp15/C
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=ZIrXmW7b c=1 sm=1 tr=0 ts=6802043b cx=c_pps a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=GY4BWdjpb_dk1TMi0HgA:9 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: CtLn7OvRWs9a7qJ1o51Nd5JDtfW_WkOf
X-Proofpoint-ORIG-GUID: CtLn7OvRWs9a7qJ1o51Nd5JDtfW_WkOf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-18_02,2025-04-17_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 suspectscore=0
 clxscore=1015 priorityscore=1501 bulkscore=0 phishscore=0 mlxlogscore=999
 spamscore=0 impostorscore=0 malwarescore=0 mlxscore=0 lowpriorityscore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504180056

From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Add the SAR2130P compatible to clients compatible list, the device
require identity domain.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
index 59d02687280e8d37b5e944619fcfe4ebd1bd6926..ecc4a1bc9477b766f317a58ef8b5dbcfe448afa9 100644
--- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
+++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
@@ -356,6 +356,7 @@ static const struct of_device_id qcom_smmu_client_of_match[] __maybe_unused = {
 	{ .compatible = "qcom,mdp4" },
 	{ .compatible = "qcom,mdss" },
 	{ .compatible = "qcom,qcm2290-mdss" },
+	{ .compatible = "qcom,sar2130p-mdss" },
 	{ .compatible = "qcom,sc7180-mdss" },
 	{ .compatible = "qcom,sc7180-mss-pil" },
 	{ .compatible = "qcom,sc7280-mdss" },

-- 
2.39.5


