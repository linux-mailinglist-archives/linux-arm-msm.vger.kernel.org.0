Return-Path: <linux-arm-msm+bounces-54564-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 656E9A90F61
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Apr 2025 01:17:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D064A3B7942
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Apr 2025 23:17:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 068C524CEFC;
	Wed, 16 Apr 2025 23:16:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CUFuv9n6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EF5824C099
	for <linux-arm-msm@vger.kernel.org>; Wed, 16 Apr 2025 23:16:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744845407; cv=none; b=rKKvspQmTzIJv7EKMH6UcABaeF6xmMlq366ZV5PRvR1G9cWofy7gYt46Ut85hOaQAu29cbNhHrvEoAYULFjNhgj/Ka4BNlsEbdmIAHMk/7nuLfiO95ahYTYDC/6RIYqyqefnnA0Nn6dMBNUrhWG4KKEb4Haq0W33UzhFbD3GU78=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744845407; c=relaxed/simple;
	bh=WwCvGbKN1UfpAvbEF24uDaZkMcpdSei4ppmMTFjiumY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=OjDsfXY8UU8rcgYp9V/EO0cEyAblJe+I86GeM9cd6TiWCdztLtqOFVlxXogGA0b/Nu1d7OjPzbwCc9zb9wz87LbbNhinULN/e9LQojEHN0pEvcPArNFJAMLiTNNZRqVMDmPOK/0+8NEF5K3C4x4HPncZJcRaOh9Sp3aASz3c3aw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CUFuv9n6; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53GLtwok000506
	for <linux-arm-msm@vger.kernel.org>; Wed, 16 Apr 2025 23:16:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	boXGEJ9vm7laFVs45kpF+i7DaEsEXFuWOHSJOklGi48=; b=CUFuv9n6cu9dJ6RA
	JIEgzi9FgUs3jeH+iS/ZP3QIRRa2bL6rZT1mBLBMivucrzsHDBMYkouke1qaaCwX
	C5LwYCgJc23IMmSCzERCLiCpKKBmhUeOaJ8fHaSKemslHpUVVK4FNr/xPuiLORfF
	fC2EvPotuPLM5xUSbuu5GIthziqknKMWjQXSnzwFgYmieJcj8i8lr6uL8OWvCC3I
	7iwnJso5A3m9rDJfZx6GA7XKM8ArZHfKh6B2UIuzIgibMOLxV+5L/0dLLjExe8GB
	SeMeJKopCs6XqTIsNJYUUBcCL1GGfsntO4jeYwIYQilYAQ/UWno5bgfKqUu0CQ9w
	LOJ8zg==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45yf4vn5kw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 16 Apr 2025 23:16:44 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-6e9083404b7so3950686d6.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Apr 2025 16:16:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744845403; x=1745450203;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=boXGEJ9vm7laFVs45kpF+i7DaEsEXFuWOHSJOklGi48=;
        b=dFjQ4WyYFpUMfRUoFNi56JlKtPgcxf4dCLZLklYHCTpndA9FjvnYcil22cDYmWegbP
         QxXts9XwzSJT0UwIX2AdUqXyuE5hRE1oS2s9Koj6Q+AkmL1TW4mz++LttPPgZeeJL6kp
         TI4C88fy0Ey2arlRJNLs3DezVJvRgJLA473gKy7UbZeCZw7wlxGa5hZJK/EMDTMSLz2r
         9eruvHrMdtbGIB/KnC4axHyBtqj62cSQ7dnIu6n/s6TT8Iddc9bjl3UOLZzIt7pqyYV/
         R370Z6I8LnFDlXhmA6BGUjJiYM0Rk92/eodLXvQ/g0FgrRXc0oJKeZe19Uhp+d+qYCEe
         witw==
X-Gm-Message-State: AOJu0Yy9Mxs3mT/BgDPca6KB/gkUHBqrbLSQ5+IW3/cRcTKnK8fW10LY
	k2Awmd8CcB14ldxVEus8ObRlQGiFH+Vt7CR3ly6N1VEX3l8ZPTqr4x/qkPJkEXJTiyDlShUaxo9
	Lmcve6L1GXGa8D6nvau5SxFWjWO70ZR1dc3XjVfpSGT8o2nRphj2oksfhd/3H1sB8
X-Gm-Gg: ASbGncti59fnrDPLZzTryvjfbbujiz7tKR/+/PZLIIdG4s3UK6dfSLjHzYJgyIySXSY
	5gBEtnjWQiQRXZke/fNUCdgQLPLYgs4cyHR9x07QVORhJ9GtO6vhv6bAPtwkOqCqwbxQN+fqk29
	N3Iw+2vk39YT+dVBwlW0nVBIwxvjLpLkKAjgw1XlueDnxlJfxKjIGHvoILDhLqUlmySmkkeTIzq
	0KCPax59Wn3LopnyutCFBExzi4w7r8WXG/SYc1DogjXX1Ft8LAtg2KuYR3CrhR1b0jsohQeQuCl
	FCFr3SITz1kekgl3jRvUGbrrN4pk74pil9KN+9vBTW+ghEIMzZXM1qMlraUMWukF/hzVsoQ85u/
	RDS74xaopNjMTjo50OEwtW7gp
X-Received: by 2002:a05:6214:1bc7:b0:6e8:ad15:e0b9 with SMTP id 6a1803df08f44-6f2b2f93f11mr62673686d6.20.1744845403282;
        Wed, 16 Apr 2025 16:16:43 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHrCA/KParNAT/BTiVkOPGzVpXZDtDs1mXEDaoU5nQ2DaTF35AM6o6LLomN2aXrq0eD1fuNmA==
X-Received: by 2002:a05:6214:1bc7:b0:6e8:ad15:e0b9 with SMTP id 6a1803df08f44-6f2b2f93f11mr62673186d6.20.1744845402926;
        Wed, 16 Apr 2025 16:16:42 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30f4649d79esm26062181fa.15.2025.04.16.16.16.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Apr 2025 16:16:41 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 17 Apr 2025 02:16:34 +0300
Subject: [PATCH v4 04/10] dt-bindings: display/msm: qcom,sc7280-dpu:
 describe SAR2130P
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250417-sar2130p-display-v4-4-b91dd8a21b1a@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=934;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=IJ0quqH+dI7r+sJavUIADWzzAqD1L2X/CIVzw9kCDtE=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoADpREQ+V7HPJ8Torzzts6HtQRTIhAKzsZTV1i
 6mzzSWqJhSJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaAA6UQAKCRCLPIo+Aiko
 1TGhB/90c4LcuO7eAM0tlDSCT0Wt9jESwJSN8QH2OFqAKMujsiEdY37WSv8L/DM+BixUIfPBTj2
 31qmCQGMszanECSZ4FTb1zxAEhZOiY4qAoRR+GnrhdBEhRoPY7FkfX4KLOgnZLSG6kpF1YOrjuy
 NbcW7bv4lHopOvGtTXtjf8/DOv8m7UyKkst5z5s74ugy9sAu5yGgPIOeOlYJV1gGwJkaqFSxSQ7
 qYbd5PaLxQ7zdj+Weyf3x6JPiLsqOZlb4AW1WwqrYVxvv6Djqhk43/YxnlWVg1S7ROHu7fhXI1H
 zQy3Zdtn+yHPOtf8wBpnd5uGKVdFL2WD/SnOJz7C7Ttz973T
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: KgiZ4w7wO51sWsCIOn7-zKwRQMiCwqDu
X-Authority-Analysis: v=2.4 cv=IZ6HWXqa c=1 sm=1 tr=0 ts=68003a5c cx=c_pps a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=P0d4iQPpJQof_2lRNe4A:9 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: KgiZ4w7wO51sWsCIOn7-zKwRQMiCwqDu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-16_09,2025-04-15_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 priorityscore=1501 clxscore=1015 malwarescore=0 spamscore=0 adultscore=0
 mlxlogscore=911 mlxscore=0 bulkscore=0 impostorscore=0 suspectscore=0
 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504160186

From: Dmitry Baryshkov <lumag@kernel.org>

Describe DPU controller present on Qualcomm SAR2130P platform.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/display/msm/qcom,sc7280-dpu.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sc7280-dpu.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sc7280-dpu.yaml
index 6902795b4e2c249c2b543c1c5350f739a30553f2..df9ec15ad6c3ca1f77bebaab19ffa3adb985733d 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,sc7280-dpu.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,sc7280-dpu.yaml
@@ -17,6 +17,7 @@ $ref: /schemas/display/msm/dpu-common.yaml#
 properties:
   compatible:
     enum:
+      - qcom,sar2130p-dpu
       - qcom,sc7280-dpu
       - qcom,sc8280xp-dpu
       - qcom,sm8350-dpu

-- 
2.39.5


