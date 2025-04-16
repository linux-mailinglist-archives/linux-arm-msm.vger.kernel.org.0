Return-Path: <linux-arm-msm+bounces-54563-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E0E2A90F5D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Apr 2025 01:17:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D34A0189DA3F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Apr 2025 23:17:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6616024C080;
	Wed, 16 Apr 2025 23:16:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ypmt7D8H"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC6A324BBFC
	for <linux-arm-msm@vger.kernel.org>; Wed, 16 Apr 2025 23:16:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744845405; cv=none; b=lj1fnCIP5BJBlftUWCIUmxDwAtor2nfU/n/T8Zb4ndrhnFtdGfsqt2MD1IW07I4xLZwdjuOIhWHXUXWNXojnIlEkI4vS6P9KZyK6Gbc+0vcn6rqniojPFs19Zy8FIw7RYmaZxM0iufZF/zzVmGaOtnj5warrTKrulq1o0fWUS/c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744845405; c=relaxed/simple;
	bh=RGg6LqJQHNLz/YdyIPSyHxFlnkDpez0kLY/KCeMZs7M=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=uWkVsIpmB6XyFmWN/a5V7OC5acNb9FaLxSdOoZ2NkY0bb3mk/3lFuO30TDMCZSqVPvDvoMBIlRmDxl4QM0XHPEIoJWHk8qCtdNCsLpKRU5jNXV528Puj7ditUQjqHAc3iGNeEUArlRHWqeVxZ9qi70yr0ffrW9U4w/ap8Yx0FdA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ypmt7D8H; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53GMBEj9020661
	for <linux-arm-msm@vger.kernel.org>; Wed, 16 Apr 2025 23:16:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/QbvJSKxnfDapkwl00/Ate2tQHcvUoOl5cDQeaEM+xs=; b=Ypmt7D8HkfGahof3
	uLHNUAbjnYGzyfK9/AP5egc4Ntryyv4nlUMLwZtyigudYw1x6Zdd2kxp/l37TNUS
	cwmKftw5nfrpm4qTs3LK+JTz6DgfZVwRQlkDLNOG6H1mz/AGBs0arbLvfTTebJrp
	SsGI6LlKzUmZOTrW4dlxUfMfD+oMobw5UEKhmkgcXZ+3EDHwTLCBXiBujVfmKhbu
	K+lGBO7Ir5bjF025AydkFLtm1d192V5fHdHsOgpT3jQAeYT2UxGaM4GE4f5GxRwy
	no7sXaeNErQxjSBycevi0oNqEjpSDttSK4YPsxe8l95pURHF8ek8uzsbUysjDQ8J
	iJDtkQ==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45yhbpvunw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 16 Apr 2025 23:16:42 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-6e917965e3eso3150616d6.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Apr 2025 16:16:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744845401; x=1745450201;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/QbvJSKxnfDapkwl00/Ate2tQHcvUoOl5cDQeaEM+xs=;
        b=cAnFYfTKuETqzbzeEB+G9vEIjhV0hlyX9xY11ygKlW4Tz/Mz3DNTQWvwPf7nkwxFpE
         te1UtzD6//kg+gEUIrp0mmi6GScs6quvPvQBmcDmIwFf2HnKRGnrMX5Ve7Mj8Tu4FOVu
         Rde7Glcv1mO692+kddSOADAgoPaAPK6EkqOuMuBfAUO/P6gUYBPEwo9+Awg0MkIOBXUY
         3AB6KYcnxfcvuhRgU6qtq2mquoiSYgWkLsCREE9zfCzvT7AEu8eq2WmzO0TEljasCkGs
         q+f/nB0m14CQZ6muUHU8LT8HufvBN4pd419dn1jKrTcDDKJFjur66DkkbWAGdxjYb/xx
         iFYA==
X-Gm-Message-State: AOJu0Yx3ImRGOEFpE1ztQH4DPcrOLTvWIyXnS4KQDSnChfruS9ANAeAZ
	LYRRLtHGXR6zYNK3p2JwxmkA99+9UVWJnNuNmFkWjopLbO0VLia6jIEu5cjPSuZQJJqmkovASgI
	6Ti9R2hJ0iBixfiKHqa64OwHe9yfC8ie0eAivrhIbpaIArsRvWiUNnC2ZRB8v0kSG
X-Gm-Gg: ASbGncsdFTyFrWPLLnT7ICAOOLZ3DSAEk+vCwK6yoPnW5DuW/rgxTYn1wqBvZl37OBd
	s+vx4Z2FMnPPlL9c9uy4ndI94ThJ6PM6qdEXJWKj0Iwips+uU2ogRWk62apLzgdfYgSIS7ufVYY
	zhfG/wAqjScUMqZcl5nnfu06jjYYsS2svQItn6st61NSnuHxoSg+/M0hL//7hL1an5Mx6zmsx2R
	CsHqDIg1f8+q25HJ3QCj/wbVjOsFq2iIydYkXN/UBg54qP9+FI32a9K2yoLx7J2M3GV1DMgW8ur
	tT/s5xl7B2K7L+VAIXjBOiXML1uzSgb/wSplSQ+TQsQ3/jbxf1gimkCouB7JL9EOixdF+UvcH6Q
	mV2lVctg5YYo07O/exyeBLuhG
X-Received: by 2002:a05:6214:21eb:b0:6e8:fe16:4d44 with SMTP id 6a1803df08f44-6f2b304b384mr65723716d6.31.1744845401533;
        Wed, 16 Apr 2025 16:16:41 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFodq3zesjzB5AD8ZHwYudSr6HtnwZ1FwskPTmT7ERKcUtRooBLKijOcL1qw2PrbhGDKECqzw==
X-Received: by 2002:a05:6214:21eb:b0:6e8:fe16:4d44 with SMTP id 6a1803df08f44-6f2b304b384mr65723356d6.31.1744845401109;
        Wed, 16 Apr 2025 16:16:41 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30f4649d79esm26062181fa.15.2025.04.16.16.16.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Apr 2025 16:16:39 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 17 Apr 2025 02:16:33 +0300
Subject: [PATCH v4 03/10] dt-bindings: display/msm: dsi-phy-7nm: describe
 SAR2130P
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250417-sar2130p-display-v4-3-b91dd8a21b1a@oss.qualcomm.com>
References: <20250417-sar2130p-display-v4-0-b91dd8a21b1a@oss.qualcomm.com>
In-Reply-To: <20250417-sar2130p-display-v4-0-b91dd8a21b1a@oss.qualcomm.com>
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
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoADpRqFeCbsoSliYom6fgv+FNrJxUdOL9SE2pO
 L35U8RUUXeJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaAA6UQAKCRCLPIo+Aiko
 1aCzB/90xZfYQtLjQ4Gcp/7a+/k3O6aBnT1+SEVNnkCFB7B2SpWZzM4FKoNNzTmPAdlxNAQ6pV7
 uwyyP6e5IW24Rz0J0GVCzdPCyhdxL3OHl9yko0VdElC4+W2RkCUXDKL94GyolrRmU0GG8WtTNGX
 Zp0jcL+mKLfRDmJk7u3kTpsVYiaWr0iSYhZLOQa0e/yoTMlXZ24HgA4NpbP9k5si6mJeXpxQV5B
 gwkNc8wbu8flZkg93wMvWjvX0kYwPbTZfY/Q2jXkJGFWsk5e9E013W65zVfCRoa2McSCsXmVSL5
 /W1ToGzJRdarfdz17vfvONGPGWfUMZZ92wPwjQkStZYyWLU9
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: ZL2X-0QscgJJ6XB5sqKU4TN4_9VTpiJ3
X-Proofpoint-GUID: ZL2X-0QscgJJ6XB5sqKU4TN4_9VTpiJ3
X-Authority-Analysis: v=2.4 cv=I+plRMgg c=1 sm=1 tr=0 ts=68003a5a cx=c_pps a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=5g6dqdCWcepBQtZB-T0A:9 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-16_09,2025-04-15_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 spamscore=0
 phishscore=0 adultscore=0 priorityscore=1501 mlxscore=0 lowpriorityscore=0
 bulkscore=0 mlxlogscore=924 clxscore=1015 impostorscore=0 malwarescore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504160186

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


