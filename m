Return-Path: <linux-arm-msm+bounces-51356-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 12D3DA608D0
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Mar 2025 07:09:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 074D719C32F8
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Mar 2025 06:09:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 694F0156C71;
	Fri, 14 Mar 2025 06:09:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NT7ioOSE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F384D153800
	for <linux-arm-msm@vger.kernel.org>; Fri, 14 Mar 2025 06:09:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741932563; cv=none; b=OytY3Ab7uo9SMwxgqytgvOE45tEggFNMqdEF7AWXdbHenWiXGIbT7SMu6jMDYFB+LSYUwyPBzFQQ2VP+5mIoUHu7oehzwilu4n9tCtWEwd0dlRGuak9exPpZMNRvLCGU9yTPsuTdsrwtpD8fuDVYUAQrw17u+IyJAHyCb91mC7U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741932563; c=relaxed/simple;
	bh=BXoa02LSLqszw1KFDNTyhiysJ9vnQES6ubpi95G3uTk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BskdEX9NsRYY7/fxrHXB3slJcc81jFoy1Emym1P30NqWqFe1C+orIfNUyR7wQzXkTqkXJPCoum6BNgkXCgsmN69vVaeyNASt7QdRQ7rFWkf2herUiZA/WYLWXON42cVmm34HlwqBCBMcoi656oHitFqdezjLAtmg5+dCz9aKwSM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NT7ioOSE; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52E05nSN003727
	for <linux-arm-msm@vger.kernel.org>; Fri, 14 Mar 2025 06:09:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	e+7zJBm63Lgp886dxKyB6dmrzG0t1u6zSCJPTB4/5Dw=; b=NT7ioOSENl9x1pN7
	GhD++rPfqHwgsbxWFRK6na/hnKSFrZoR7zIMzrdiZZaoSp1TPomAWQUUdUuKuFjp
	XRs7Awzg+4uSaGrvGSDGEw9L/Q5da4NanONrk5mY2GzYpkRn7scwKl8AtIJz54oW
	gMn6i3mOfi7LINJKrX13PlGwilXpi55xL/FU4j5+m7sIXePcvDsM2PT6J+ZgPuGB
	gVIXZE7U+Z3fTl5+nPMXZDqXUnfgoyQz15rHAKHV41Mvf6HVaN4mCga+bHlb/b7l
	rKKxU8Kt5xUHwxuhat9cCXYMkJONx3efdX6WPyMdzqacw4zh0IhcNHRtnrSJUpE0
	220jfg==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45b96ye4k7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 14 Mar 2025 06:09:20 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-6e8f184b916so52238636d6.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 13 Mar 2025 23:09:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741932559; x=1742537359;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=e+7zJBm63Lgp886dxKyB6dmrzG0t1u6zSCJPTB4/5Dw=;
        b=dRH/osgRBJRguqGiosx+iLH5eU7JT8wMVkuq7cxOVEWfs6Qc41PB55IQzvj8h32A3H
         th4DaV5id8L1I9U/HSSCuD3SKoFS6Qpv6TkAxWH32JmSkAOoktO24nrcXokPwZ67QU+W
         P7DqenQJW6sVwYgZrwa/ERihEbiRa7+EcVFXs/BtB6e7vvrfLhnABJ9Az26irH4ECNiA
         odxkQgggGfQx6I5nTWe09JHJgFrvbJrdjmugxwgDaCpG4rzmyX7TuQ5bGx9weNFPavaz
         b3teqsjGqf4r+rQ1DMt+3LS8BV1l4ZvHLPHdeJWZAWA5hdCEd7dnrYxOggAfyYmKiJaC
         br7w==
X-Gm-Message-State: AOJu0Yz6C/vSRxGmMbHnYWZxfSP+7BAk6wJJ5bgTHGNNp+4dPbRQ7cMm
	w8RpuYiAwc7SgPR2gj79Jh1eHfHs8uGNwwstRsC0lvQQjy5Ewo2roSlD6W8YKJindUE1pDqJprX
	Sr060PS5b8c9gbnGfgIQ1n904iflMgYmWtIONQBHy+8AFQKWSaruZFCpzrGpZ8nlJ
X-Gm-Gg: ASbGncvX4zzDD7bpU1Z9weaJzDGn1Rc5/FF1sQAxdPiyftPDfIuU7Cd31SmtLR2ASQN
	EimlFbe17GD1uiNoJTYrog0JKvuDCKjsf0j/3GgtzzAVazuPB/gBgyVLhsxDQyHt11nQABM2jqi
	qJkvIiQx/eXfalj61pcfnPEP2nztOEa8BLeLWu8tW0zlYGX0FYwNGt0rs4ijmpoioiMRMdDMeP/
	PxUh2ZXwpwl6nim5JcyiAa5Jxj5keV8BiF4S9w59Kycq50H71JlYB8YI7GABuvneoI3zM/xUFdh
	eNa1tnDkMFrmP6xNV3KoDt6mH1oFVL7TgDno4j7URwJN1qvU2QBJQy8dCubuOUd0Yd/SzGdJRlJ
	UHpm6Yp/Nai+vnCZczDh0pioiRktw
X-Received: by 2002:a05:6214:29c7:b0:6d8:99cf:d2e3 with SMTP id 6a1803df08f44-6eaeaa50d3bmr16274706d6.22.1741932559674;
        Thu, 13 Mar 2025 23:09:19 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEBY0ZI+zd7SGof84c58nMntLqEKYAgej+c8q8loIMsah08MFhtIYr9H5cZxY3U/P0nrdLK9Q==
X-Received: by 2002:a05:6214:29c7:b0:6d8:99cf:d2e3 with SMTP id 6a1803df08f44-6eaeaa50d3bmr16274296d6.22.1741932559242;
        Thu, 13 Mar 2025 23:09:19 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-549ba864fc9sm416071e87.140.2025.03.13.23.09.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Mar 2025 23:09:17 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 14 Mar 2025 08:09:05 +0200
Subject: [PATCH v2 01/10] dt-bindings: display/msm: dp-controller: describe
 SAR2130P
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250314-sar2130p-display-v2-1-31fa4502a850@oss.qualcomm.com>
References: <20250314-sar2130p-display-v2-0-31fa4502a850@oss.qualcomm.com>
In-Reply-To: <20250314-sar2130p-display-v2-0-31fa4502a850@oss.qualcomm.com>
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
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=950;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=t96ussCqWyIQAdmFD81iVPY1jwLXVD8SP3JFMa/Qjfw=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBn08gGCBp0k6HqW50FaN34vQJ5Qz5yfxDlRMZfR
 Hy6mQkyFMaJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ9PIBgAKCRCLPIo+Aiko
 1ZuHB/9lbdoj5IXC26SOHHWE9rWM1DIEMbSoqxW7R/DA8cOCdd5rlC09Hhibvr+hOS1dKri5lbx
 PqMES4aCbDW38we3ofVviw8goSeq+j3Mw4e49cTDXnwYoJ4paRIATkH54k9jHFTVOzygZcXOV5Y
 8lGeTwgzz3fulM6aVtWAqS3pC1bMN6YTdZXJkd6LdmbW4CF3wO7dAXoBqBLQh0s24ktldAagAX/
 UV0ZWCH1KRIere7TRAUwqkaBA3ytZ7HNj+wiWV3X86TQttRABsBtlPZOxWk6TS9V2vzToHnKIMt
 vu2C0OEpMNedMhMjX6mUv33Ar8bGbJ+Ttp9PI74ToAN9F+XZ
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: kHh52SCIWBbMt-vSwvsAJzzba2pHxV2G
X-Authority-Analysis: v=2.4 cv=I+llRMgg c=1 sm=1 tr=0 ts=67d3c811 cx=c_pps a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=KKAkSRfTAAAA:8 a=qy0Ph95xh7xgto4wCWoA:9 a=QEXdDO2ut3YA:10 a=eRSyEd_ZPWdY3HzJaUvg:22
 a=1HOtulTD9v-eNWfpl4qZ:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: kHh52SCIWBbMt-vSwvsAJzzba2pHxV2G
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-14_02,2025-03-13_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=920
 lowpriorityscore=0 adultscore=0 clxscore=1015 impostorscore=0
 priorityscore=1501 spamscore=0 malwarescore=0 mlxscore=0 suspectscore=0
 phishscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503140047

From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

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


