Return-Path: <linux-arm-msm+bounces-54340-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 85F82A89838
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Apr 2025 11:40:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4DBC2189601B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Apr 2025 09:40:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 762962820D0;
	Tue, 15 Apr 2025 09:39:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SB6nraEn"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3377288CAA
	for <linux-arm-msm@vger.kernel.org>; Tue, 15 Apr 2025 09:39:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744709984; cv=none; b=lZbVJF5vUYUFtgCirD09KkeEUSwyOqJFRcuRZpLq1aFbhXfuC+99Tx1A8Zz5mL4d5MpJUG9v70vKzm7Ytd8A4u0ep6KBMRpo4YU+uPE+3UF4zCGnztZT3tBNVeh1VZgzd+FXTssn0l2//9Osn6Jnox3SwlLMuvHzhuGlCdaCQf0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744709984; c=relaxed/simple;
	bh=f5nEiMxpCpJ8tG4rxgWOSIOxABVTgec4J5cSa+ld9WA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=t16pSUl/rQyJ1DQ/oESmnB/reOBEsHcZsxjb4JuVl7TnRjbX2ZuhUi5u2qxneA2NF5eNGQtCLGRWmbWDVxLzR0bC1RPDxXq+y0G0hKvUc9dvVZ+wAx0BLD99yYYDqd+sMQhqcNHZIE44ZJPS0jvZWtC38F8+NL6OsaZ09diwVK8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SB6nraEn; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53F8tM0R002421
	for <linux-arm-msm@vger.kernel.org>; Tue, 15 Apr 2025 09:39:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	EMjst29DNTaDM7RdBr29Vu4Zmfecm1OtVXRpr93QCUU=; b=SB6nraEnl5B3L6i3
	XkVG35p0i6+ofgk9E7yggVrXfq0r9Olv7vhSl6sjdYC0ZCA7B1xixp2/xcMDlUEs
	PwUnsLqpRKCNrAiqwhUtbathZVEwNg4xmRrW4XaeI5UeJZikPC+7g8UMutqOEqL+
	EnvQTtx64givPQ4YDie4CscAsv2pgVPRELlB8ZiTiBVR2Go1EKpSwMc97UJTXT+q
	SFiG0Agz+IIA9aEBoHebc3p1qK8k9GPDkWcwCkT6gEwX+5cUO71SnQ/RSoQHw695
	sEtieM/DUJmqBhQUGGpi3aTwxd68nE4l0OYbuk9VixsoQZhWp0q3X5Ym+WmsqlBp
	yLuR0A==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45ygxjyccd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 15 Apr 2025 09:39:41 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-6e90b13f5c3so107723386d6.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 15 Apr 2025 02:39:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744709980; x=1745314780;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EMjst29DNTaDM7RdBr29Vu4Zmfecm1OtVXRpr93QCUU=;
        b=BV4uGZeN24jbJYeUfMk5FC59IHUMweX7SAPZpwVlX11/McUlIBsL1yJuiclnAoweJr
         b/j3vJ5rUjb0wC/qDFN5mo4C2s3g8iGka7bsamaIyoxIdqA8SgClxBJD+HRNFHndVbVF
         LAnzZNJ58LcH60LhdbKDqjRChYAzH/cqhFbMkm0XvErylKCSPTWYlBtQWwILg/jQAsE+
         9EfQU47rPCVQuaE3hWQM7lEzWUGlDkxfsYYzEjBmKF/r9Nxh0va4NJhnNeVRvCZv1GJf
         PqeGPIMmFJ0Q4T621x9gy55dve+0T+IxAdxTikiFsD3NjoJcIDvBT2KMzYGnNpIoEY7V
         gtwA==
X-Gm-Message-State: AOJu0Yz5zTu5BLswQpOu1HLIGOhnzN+H5ukU5VwVNcTKALCvogefOAv5
	HrHQ10L7DL7PxyScBjVFQXgaQWjEneIkNXtTBgYV3y9oYtP0ClRB7wqJWyIG1FLL0o7/avIx4hp
	HzDDO8gYyPla8imMZ6vhd0dBdg1RPdyVeKWrvkRGNCVgygjefbaDq+/HmYOZ/Nswf
X-Gm-Gg: ASbGncv8z1SnDKguM37B7Vf+Nr16arKiPEc3zn1+iDK3W4Cm63sDK0nnpm5GM212qbA
	iptnEpomsdRYL8iX8RCvUtrvjuZHZG2UHCYoMmInRmQAC87VbbmFcecSeDCrwxif8THgr/UwqD1
	AdHaV3mBrhiNxxhx/8W4VzsKZqLSO3Wo1js4FqP7L+EuK/HmM4MtFNdO3HD4k+c6X8YlV2362AN
	nLPtoyn41fL5f2OeE9Pstt2SWCtu372viZ/fXT/fLfmZLk9ABpbReR/OffhCbkGOJ/Dy+UqURsl
	2ziV2c0WTflaiMXY0sZIeshE9zZL0ed3fZagh1r96Izphdf9OuNJKiWZ+cIGORHOIENv+d8+36a
	N1t+FpTyEL4pO6DletyNJYDTn
X-Received: by 2002:a05:6214:19c5:b0:6ee:b77c:7dbe with SMTP id 6a1803df08f44-6f230d27c21mr193434156d6.12.1744709980639;
        Tue, 15 Apr 2025 02:39:40 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGQp2HjVEeO0ktbov4KZJe4bJnmpotAkHqTPZqWnlxP97B4y0MeVgdf+Bpf8V/w9ZAnpH3sOw==
X-Received: by 2002:a05:6214:19c5:b0:6ee:b77c:7dbe with SMTP id 6a1803df08f44-6f230d27c21mr193433886d6.12.1744709980357;
        Tue, 15 Apr 2025 02:39:40 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30f464cbc60sm20141901fa.24.2025.04.15.02.39.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Apr 2025 02:39:39 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Tue, 15 Apr 2025 12:39:30 +0300
Subject: [PATCH v3 02/10] dt-bindings: display/msm: dsi-controller-main:
 describe SAR2130P
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250415-sar2130p-display-v3-2-62314b1c9023@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1325;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=PNM3/R9939920NNRFa+kSPKtbONWgfGTtTNO9ijO+vE=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBn/ilVrA3uEJ69v1dp520K7RYb5A0BSH4RNdJGh
 6YpzIXJKguJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ/4pVQAKCRCLPIo+Aiko
 1QQNB/46R21cEA9UsOBhj4cdENgoT+GeVGYBZ6fBavXGRXxth9LvnU1MtN5c7S5xOWGd35PypCf
 Ley8En0qAy9vAmGlD67vkSlMr+Om2vHCk5Kxt70R7aWAf6Y+cgc0jId/kpzTz6NP6h+8YQgQnej
 rff3dPK369Ff76/b7EpPBxWhAamZUdKBsrp0KHxaryppLO6veyz0/plFD7zT8NVlPGrdIBkxImv
 557qYxNphcbJOfHkJnUmFlpa84lu40XmCGNAeq3zRzA/5OZf9JvwC0EGyr2TwpiuLYPPHeVBEk1
 G9/qmCs2DRVsxt7TRcvid3UlGoRcF/WHOzqCcyARtgc8WmE8
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=WecMa1hX c=1 sm=1 tr=0 ts=67fe295d cx=c_pps a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=93dKIss0COAcHyiF0SEA:9 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: --dwXsfnjjq5yzBWP86Q5wElRX-5_hCh
X-Proofpoint-ORIG-GUID: --dwXsfnjjq5yzBWP86Q5wElRX-5_hCh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-15_04,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 suspectscore=0
 adultscore=0 clxscore=1015 lowpriorityscore=0 phishscore=0 mlxscore=0
 impostorscore=0 mlxlogscore=862 spamscore=0 malwarescore=0
 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504150067

From: Dmitry Baryshkov <lumag@kernel.org>

Describe MIPI DSI controller present on Qualcomm SAR2130P platform.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
index 2aab33cd0017cd4a0c915b7297bb3952e62561fa..a3e05e34bf14dd5802fc538ca8b69846384f8742 100644
--- a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
@@ -23,6 +23,7 @@ properties:
               - qcom,msm8996-dsi-ctrl
               - qcom,msm8998-dsi-ctrl
               - qcom,qcm2290-dsi-ctrl
+              - qcom,sar2130p-dsi-ctrl
               - qcom,sc7180-dsi-ctrl
               - qcom,sc7280-dsi-ctrl
               - qcom,sdm660-dsi-ctrl
@@ -314,6 +315,7 @@ allOf:
           contains:
             enum:
               - qcom,msm8998-dsi-ctrl
+              - qcom,sar2130p-dsi-ctrl
               - qcom,sc7180-dsi-ctrl
               - qcom,sc7280-dsi-ctrl
               - qcom,sdm845-dsi-ctrl

-- 
2.39.5


