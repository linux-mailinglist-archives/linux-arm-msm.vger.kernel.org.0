Return-Path: <linux-arm-msm+bounces-54339-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E85EAA8983C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Apr 2025 11:40:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BA214179796
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Apr 2025 09:39:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EEA3828A1DE;
	Tue, 15 Apr 2025 09:39:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kL1zVUfr"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B114288CAE
	for <linux-arm-msm@vger.kernel.org>; Tue, 15 Apr 2025 09:39:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744709983; cv=none; b=EB+hChD0ZH8sZEUzMkaY1dp3lZkUfMqSupQ4K7Gb/NHeHSpqKHu9kIqgGrDBqwiEbXruAeQJ41vZnTa0wL3o/cvQx9pyKMRj2RL0Mm+vF/ZHfibLS3Uxwe84rD5PXOfCjA3ze+ZIuVGsxA1UoQPQxIHlq8pmwlehNsQvfn8ZELg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744709983; c=relaxed/simple;
	bh=0Q7QbXFjOZLIKz45r8s6tdHPD3ihS77NgezOAW5kr0E=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=omqn2UeiuNwDkSG0r4y5fC4Tmzj536hS+XHTYfNluUVtgy8TPxpIThhqPfX2iJgiDZUu9DG/snPhwcMtLnMfVT49DO7GY7TctEEbEOfBp5Wrel3k0w1JAV4ZeQDa3bqR5R83W9P3Sfdvhh+WRQUFZ3Xb9KBxEsAh9/CgM21A8AU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kL1zVUfr; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53F8tJJl013165
	for <linux-arm-msm@vger.kernel.org>; Tue, 15 Apr 2025 09:39:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	EMnI8sXQc6fcICVFpeOcXllxBiGB1u5ryoWnljhdAJU=; b=kL1zVUfr36rU/fJ7
	gQxGIoxK1xzW6l9QfjImDxtZDsyxJ6w5NM/GwM6Icwwbw4LhjIFVSzg4tDEQxLzy
	ZInJzE86UNyLBVRJTnah6/HZuWd+ViBReweuRJZOabYyjkZFOO1xFNY+poe3vcpO
	NO2zWkoEyGSZTIIidN1E1frh9X4I4Xp2Tcspv1FpprnIH11Bx5WFIkTTHQAQ3vir
	lfNamnQhQp2WNBPiMKkVs0J8Sd1YB/hjs2Ar2sxYlyOfNnILoP1ns9ybhudgAcUE
	57Uug6jGStzbjOAxVIjuQdF4wQAt+S+SEpPy7hhwVr40zENL+3oTEYUU2VUz6uIt
	hzzNXw==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45ygd6fgvy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 15 Apr 2025 09:39:40 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-6e8feffbe08so128183246d6.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 15 Apr 2025 02:39:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744709979; x=1745314779;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EMnI8sXQc6fcICVFpeOcXllxBiGB1u5ryoWnljhdAJU=;
        b=FykzUczBHs7hZpBD2AjtT9K9hLrMNT67ctnhsmYU0lSdjrObwN/x1I54pjIRJ5VOmU
         XOSoXNL8aeRQfZfjCMi9hrt9YCsK2D/iNh04reCPKDCNrmBAE12UHmjw3OVy7jtsZxuh
         euTh7qm5gamUPN9DhtWqcJuK+ky18EF3xhQis/J7lbxRjIjnC7mhSlMd38YyCbpMa1lK
         y6m/Ix5a6oRG/HvJ90GtaJuoJNQC5tw2gI1MF2azdvIkd16jqbhdnPfhKuLke62cDlGm
         aunga3hpzMKwkthnTBIw0YwVGn9emZzimUF+Eia79ErwGwb/hGztHB9bSOls/YL+nCoo
         JelA==
X-Gm-Message-State: AOJu0Yx19mb2+JTkVv8Drp2h11Ih8Nr/LU4XwONPuTjuycC/Hn528Jak
	y6Fk5k1F1CYbUXFsoRP9V2dZmaBc3Npg7XsTgaM+JPb3NnqJ1R3pFTA4JZzzSQqD/1KEr+bIj7/
	kKnEDcNuZQ7u/cKyaP2oWn9u50EvxdrQ29GW7GQIIUqWn3KKsBEgTk6RH8gv2M1PU
X-Gm-Gg: ASbGncuopge0iFls0SFn+BUQtduZzmgXc6U8J2wY0Hvxv2Fuvy4KYWY0lQnyHUkKccu
	uqnuUBpPb5ooDGg5ZIIuVEF3pe9aWdhTLHmTTGemZxlhVwjCuptjxFI/H4KGq0x2oV9I35krgWn
	bKqEd5JQg4ddmwYL9vmiNw0lDaCLzW3I3cArkc+yShmFH1t1uv64BJXxupyvsvP63jxmse7QntA
	cS9X/E17NUneQQYRx5P9oW2KF3YOwfFMOYa6OieUnfacsQKkY1l9Ta6okzT0QqUdJDs+6aQvHsH
	3em0eazaYAsLbxGj8hALCOD4bzOb3qP6dghFYzoe4LZp4A0oSYXoA6hmmCu0+IhYT8Bg9g/pkmV
	q5qQSC+RgRzj08YPEkrB/JV4B
X-Received: by 2002:a0c:aa05:0:b0:6f2:a457:197 with SMTP id 6a1803df08f44-6f2a4570302mr17557876d6.32.1744709979233;
        Tue, 15 Apr 2025 02:39:39 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH8HQSOjLdhDHbjx7MvKXFQUeBcuAVyf9AOBVsTgsUZ5CPpSKyGS2MuHBbgjiijyBhmUGHLfg==
X-Received: by 2002:a0c:aa05:0:b0:6f2:a457:197 with SMTP id 6a1803df08f44-6f2a4570302mr17557576d6.32.1744709978884;
        Tue, 15 Apr 2025 02:39:38 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30f464cbc60sm20141901fa.24.2025.04.15.02.39.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Apr 2025 02:39:37 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Tue, 15 Apr 2025 12:39:29 +0300
Subject: [PATCH v3 01/10] dt-bindings: display/msm: dp-controller: describe
 SAR2130P
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250415-sar2130p-display-v3-1-62314b1c9023@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=950;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=t96ussCqWyIQAdmFD81iVPY1jwLXVD8SP3JFMa/Qjfw=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBn/ilVM5htI38HvCqRt9nmZdp5w/Rq/WsUjy1Jg
 k4ECt/1uxWJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ/4pVQAKCRCLPIo+Aiko
 1S1RCACWIt1/w4yRBzi/5jbjFt1pJ+46EIYDCwGfet0spVeQ215ieyx4/27ucKQt9TBgzz+voDd
 TWRehj8HgLrW/C+JaCj96Seq6llg726XbHB+/sMhFDhstlhVb6yhJVnnlYsJGJREMxur9gvLHS9
 dIOdBe0Ilk9x2Lbd1icTCOcOPaDGNSMSTJBi3hc+p85r7bNyeSqrrrt7cx8VH0IB6KaRxPVcEu7
 HXtJE7m1KFrefpz7YjYN0I6A7zhWcfgQzFu7znRrImeQP9HjVUogsN7B1pUkd9ezpVB5j6bA51c
 KCXl7IM4ZOJN6IiHOIJHGfckVOJledcW2qqRlPyPd4SRN/zh
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: rDpf_8Dl6EIJnFgIiNEMAUFrrwGB85_I
X-Proofpoint-GUID: rDpf_8Dl6EIJnFgIiNEMAUFrrwGB85_I
X-Authority-Analysis: v=2.4 cv=ANaQCy7k c=1 sm=1 tr=0 ts=67fe295c cx=c_pps a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=qy0Ph95xh7xgto4wCWoA:9 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-15_04,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 adultscore=0
 mlxlogscore=923 suspectscore=0 clxscore=1015 lowpriorityscore=0
 phishscore=0 impostorscore=0 spamscore=0 priorityscore=1501 malwarescore=0
 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504150067

From: Dmitry Baryshkov <lumag@kernel.org>

Describe DisplayPort controller present on Qualcomm SAR2130P platform.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/display/msm/dp-controller.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
index e00b88332f2fed2fc33f6d72c5cc3d827cd7594e..246bbb509bea18bed32e3a442d0926a24498c960 100644
--- a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
@@ -31,6 +31,7 @@ properties:
           - qcom,sm8650-dp
       - items:
           - enum:
+              - qcom,sar2130p-dp
               - qcom,sm6350-dp
               - qcom,sm8150-dp
               - qcom,sm8250-dp

-- 
2.39.5


