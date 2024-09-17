Return-Path: <linux-arm-msm+bounces-31931-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F7F197B4C3
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Sep 2024 22:39:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2F06C2832E7
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Sep 2024 20:39:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9FD8418A956;
	Tue, 17 Sep 2024 20:39:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="ZQ8NpK79"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D993E188A25;
	Tue, 17 Sep 2024 20:39:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726605568; cv=none; b=ftNClecosEp1Wj86hA3QT+XgbWKNK/2cbCGTLqJTAxavgF1Jrn553zwAUe9gqCMzAgd/Gwm+WSEadnWcYZnNe1GRBmvLab+sC0FWcUijmH+9R99VYioGW4nyoKtNSFYyMKYM2GC2qvdqGSg0KRXyS7BS6czplmdDlFBOzD6XxVA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726605568; c=relaxed/simple;
	bh=X3Klkl00DVZJKqB8dgiYqPRMiamn6rmCcwbo1LgCf1o=;
	h=From:Subject:Date:Message-ID:MIME-Version:Content-Type:To:CC; b=Lv9hcgkl6yumvnkPxeQknwWxnAKyJx98fpSX9euxdmcEPJXXe6tL9wWQOrO8UvSSZ3j+Ogn0HQCj4IYTznSe5+Ls036T7KXpahOMHQqbyFm6TSUJXfKfB8gowZX0K7zHYvHgOjAMl4YvhwSl55rWdxDVnQrDN+9NW+Oeixh5A5I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=ZQ8NpK79; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48HI3REV031256;
	Tue, 17 Sep 2024 20:39:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=FBYsgowN36zClN8wGKTrOi
	Hp8mB6WDnMn8s5Z21bSpg=; b=ZQ8NpK79NTEfn3f9pMAQxyZJG/UIUubIpkW44X
	DS+jdFDWMxpzRyORxBNWSamOR1K4/iZ6zyXKTCJ1rGVewge8geb2A4B2R34e27FI
	Q9B2RzOxRhFb0Q9cXBVB1L6veHn+GI7fumOvkmgyKtmdvPVfiI7344PFuMXn2C1w
	ICAMs6dQverHizfocA+JpTtJZscXw/AewwTAGDRWOsyj1JK9o4ro5DVhRSzKnSFa
	iInMGn03PZsciCAmOrOmYJZc+LqleJvQjrNe5sdmJ9B4uH9omDDSZU0YkeZrZ6ML
	/8vBz/o5rMW9F+W3htE5wt1dAfUhuXlmZYr6eVbsWSujdGAg==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41n4hffy21-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 17 Sep 2024 20:39:11 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 48HKdAAn032446
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 17 Sep 2024 20:39:10 GMT
Received: from [10.213.111.143] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 17 Sep
 2024 13:39:04 -0700
From: Akhil P Oommen <quic_akhilpo@quicinc.com>
Subject: [PATCH 0/3] DRM/MSM: Support for Adreno 663 GPU
Date: Wed, 18 Sep 2024 02:08:40 +0530
Message-ID: <20240918-a663-gpu-support-v1-0-25fea3f3d64d@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIANDo6WYC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIxMDS0Nz3UQzM2Pd9IJS3eLSgoL8ohLdJEMTc9NkCyMLMwMzJaC2gqLUtMw
 KsJHRsbW1AHYh7FpiAAAA
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        "Konrad
 Dybcio" <konrad.dybcio@linaro.org>,
        Abhinav Kumar
	<quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie
	<airlied@gmail.com>, "Daniel Vetter" <daniel@ffwll.ch>,
        Maarten Lankhorst
	<maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <freedreno@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
        <devicetree@vger.kernel.org>,
        Akhil P Oommen <quic_akhilpo@quicinc.com>,
        Puranam V G Tejaswi <quic_pvgtejas@quicinc.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1726605543; l=2241;
 i=quic_akhilpo@quicinc.com; s=20240726; h=from:subject:message-id;
 bh=X3Klkl00DVZJKqB8dgiYqPRMiamn6rmCcwbo1LgCf1o=;
 b=M2XfbCAhUtDRy3u6yuCDEWuHhCfWw1Ll7QXcdDWf4w/ghHSSW/SQMR3PazogiGi7ibD6M8Xqd
 gGRP5dKMs4mCKz2GkV6VA8V+gt1VsCIWb4vgrGVhuW+WF/Ke22gYJUM
X-Developer-Key: i=quic_akhilpo@quicinc.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: Y2DWKw2Tm6M-jHVOYTnRQOgAQKGdYmyT
X-Proofpoint-ORIG-GUID: Y2DWKw2Tm6M-jHVOYTnRQOgAQKGdYmyT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 clxscore=1011 phishscore=0 malwarescore=0 mlxlogscore=999 mlxscore=0
 impostorscore=0 adultscore=0 suspectscore=0 lowpriorityscore=0 spamscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2408220000 definitions=main-2409170147

This series adds support for Adreno 663 gpu found in SA8775P chipsets.
The closest gpu which is currently supported in drm-msm is A660.
Following are the major differences with that:
	1. gmu/zap firmwares
	2. Recommended to disable Level2 swizzling

Verified kmscube with the below Mesa change [1]. This series is rebased
on top of msm-next.

Patch (1) & (2) for Rob Clark and Patch (3) for Bjorn

[0] https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/31211

To: Rob Clark <robdclark@gmail.com>
To: Sean Paul <sean@poorly.run>
To: Konrad Dybcio <konrad.dybcio@linaro.org>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Marijn Suijten <marijn.suijten@somainline.org>
To: David Airlie <airlied@gmail.com>
To: Daniel Vetter <daniel@ffwll.ch>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
To: Maxime Ripard <mripard@kernel.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
To: Bjorn Andersson <andersson@kernel.org>
Cc: linux-arm-msm@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org
Cc: linux-kernel@vger.kernel.org
Cc: devicetree@vger.kernel.org

Signed-off-by: Akhil P Oommen <quic_akhilpo@quicinc.com>
---
Puranam V G Tejaswi (3):
      drm/msm/a6xx: Add support for A663
      dt-bindings: display/msm/gmu: Add Adreno 663 GMU
      arm64: dts: qcom: sa8775p: Add gpu and gmu nodes

 .../devicetree/bindings/display/msm/gmu.yaml       |  1 +
 arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi         |  8 +++
 arch/arm64/boot/dts/qcom/sa8775p.dtsi              | 75 ++++++++++++++++++++++
 drivers/gpu/drm/msm/adreno/a6xx_catalog.c          | 19 ++++++
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c              |  8 ++-
 drivers/gpu/drm/msm/adreno/a6xx_hfi.c              | 33 ++++++++++
 drivers/gpu/drm/msm/adreno/adreno_gpu.h            |  5 ++
 7 files changed, 148 insertions(+), 1 deletion(-)
---
base-commit: 15302579373ed2c8ada629e9e7bcf9569393a48d
change-id: 20240917-a663-gpu-support-b1475c828606

Best regards,
-- 
Akhil P Oommen <quic_akhilpo@quicinc.com>


