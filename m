Return-Path: <linux-arm-msm+bounces-36364-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D4E69B5C36
	for <lists+linux-arm-msm@lfdr.de>; Wed, 30 Oct 2024 08:03:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6FE931C20F67
	for <lists+linux-arm-msm@lfdr.de>; Wed, 30 Oct 2024 07:03:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E8C2D1DE4FF;
	Wed, 30 Oct 2024 07:03:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="eIDSyPEa"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B73D51D1309;
	Wed, 30 Oct 2024 07:02:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730271780; cv=none; b=Mvvq+aFrnAA75luommJTAUun/fSDWwS8tYpnVBp8TveGJueVh9kcggehQLKFtX6B+m2MyVgD5CAmbHg2CG2gdd07o3wtEm0QJ4MV1m8jlF6811xyE2kAAZJUBWycpZAD7njwN+VN9qCcvTcmLMv5rZjiHBmKXIwdmvUbpJqdZ7c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730271780; c=relaxed/simple;
	bh=HBHqqFJwlLZrnHKzABOXS58x4463lPh4o709iKwhKMo=;
	h=From:Subject:Date:Message-ID:MIME-Version:Content-Type:To:CC; b=InLGuLCeIoe5PBq08ZKhGpJRcqhaB7ZOssykdZ+tz6uU0+wD2blHpoXdl5YxStYnryiPgtSsEgDEfD6REvJLI1Oj/yT6RgyGiSvzWkTRIckqs1urgXWIHRNuPDSp6Q2Aly+Gjhp0kmnEDdtMa+d9zKJ6tUS2ywrw61bXgWOsQ14=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=eIDSyPEa; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49TM0ebj012773;
	Wed, 30 Oct 2024 07:02:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=/g/BCeSyts2ynUtbS5uAaJ
	lBY7+gxxbs+JXVEycwaMs=; b=eIDSyPEaZZcYyWl/6pKz1MPw3hgOTlBEOMjn9+
	WuBR5EBsgYVLmm5Ra4p9prNJmSqVmyOhuJj21FJ+UM4z1vdW0UOTbsTwOMlc3zRH
	JpopOd6rViqm/+twvwJQagD2fWhG1Ab+5dLJiSFluOUKD2pqospAwQYScKJnrLtV
	Azg34g6JZuHeI6hfRjg2GxQ4X/GDCx3027+zdST2Mth2oLhVUc6HXkRwA13rqkaH
	wn62GWFuHBAfOmu6dTHt3RxgdeCP593ap8KqUylcXhfnRKC5TJ6YkWyRt1QCfZlW
	AuTqmGEIWZGIJ7TDAw6aKewU4WUg6WuFLWxQUTxjKGzDOSfA==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42grguk1g5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 30 Oct 2024 07:02:42 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49U72bxQ019577
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 30 Oct 2024 07:02:41 GMT
Received: from [10.213.111.143] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 30 Oct
 2024 00:02:32 -0700
From: Akhil P Oommen <quic_akhilpo@quicinc.com>
Subject: [PATCH v3 0/2] DRM/MSM: Support for Adreno 663 GPU
Date: Wed, 30 Oct 2024 12:32:01 +0530
Message-ID: <20241030-a663-gpu-support-v3-0-bdf1d9ce6021@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAOnZIWcC/23OwW7DIAwG4FeJOI8JbEKgp73HtAMB0/rQJIMk2
 lT13UdbbdK0Hf/f8mdfRKXCVMWhu4hCO1eepxbwqRPxFKYjSU4tC1BglNeDDNaiPC6brNuyzGW
 VozZDHx04q6xoa0uhzB938vWt5RPXdS6f9wu7vrXfmPuL7VoqCX2mgBmTNenlfePIU3yO81ncu
 B1+CK0A/iGgEehSQAdorB9+E9fHi4VaW3l9/CnGUEm2+ZnXQ5ds0iEhJKUGbShmn7X3Vg8Ybfa
 ODMZ+bLcbdv0C3b6D00EBAAA=
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        "Konrad
 Dybcio" <konradybcio@kernel.org>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Marijn Suijten
	<marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, "Simona
 Vetter" <simona@ffwll.ch>,
        Maarten Lankhorst
	<maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Connor Abbott <cwabbott0@gmail.com>
CC: <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <freedreno@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
        <devicetree@vger.kernel.org>,
        Puranam V G Tejaswi
	<quic_pvgtejas@quicinc.com>,
        Akhil P Oommen <quic_akhilpo@quicinc.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1730271752; l=2737;
 i=quic_akhilpo@quicinc.com; s=20240726; h=from:subject:message-id;
 bh=HBHqqFJwlLZrnHKzABOXS58x4463lPh4o709iKwhKMo=;
 b=b+O+SWbc5uNySP8IKgSjq59mK1j53b1d4Qv2fmU0O7EZJ1aWkNpmv7wFP2se/3uwfBvU5harC
 B7jjQeoW9PIBM/eZ4bXvp8OrK2qoSvWuWsaaOq7GDVwHRhAEQz+BSJL
X-Developer-Key: i=quic_akhilpo@quicinc.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 3jArTnuVb_XlOuygw0eKXEAfGdlT_19q
X-Proofpoint-GUID: 3jArTnuVb_XlOuygw0eKXEAfGdlT_19q
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 clxscore=1015
 lowpriorityscore=0 adultscore=0 mlxscore=0 bulkscore=0 suspectscore=0
 phishscore=0 spamscore=0 malwarescore=0 mlxlogscore=999 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2409260000
 definitions=main-2410300054

This series adds support for Adreno 663 gpu found in SA8775P chipsets.
The closest gpu which is currently supported in drm-msm is A660.
Following are the major differences with that:
	1. gmu/zap firmwares
	2. Recommended to disable Level2 swizzling

Verified kmscube/weston/glmark2-es2 with the below Mesa change [1].
This series is rebased on top of msm-next.

Since they are already picked up, I have dropped the patches for msm-next
in this revision. Remaining 2 devicetree patches are for Bjorn.

Devicetree changes have a runtime dependency on the Display DT change [2].

[1] https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/31211
[2] https://patchwork.freedesktop.org/patch/620500/?series=140216

To: Rob Clark <robdclark@gmail.com>
To: Sean Paul <sean@poorly.run>
To: Konrad Dybcio <konradybcio@kernel.org>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Marijn Suijten <marijn.suijten@somainline.org>
To: David Airlie <airlied@gmail.com>
To: Simona Vetter <simona@ffwll.ch>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
To: Maxime Ripard <mripard@kernel.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
To: Bjorn Andersson <andersson@kernel.org>
To: Connor Abbott <cwabbott0@gmail.com>
Cc: linux-arm-msm@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org
Cc: linux-kernel@vger.kernel.org
Cc: devicetree@vger.kernel.org

-Akhil

---
Changes in v3:
- Rebased on the latest msm-next tip
- Added R-b tags from Dmitry
- Dropped patch #1 and #2 from v2 revision since they are already
picked up in msm-next
- Link to v2: https://lore.kernel.org/r/20241022-a663-gpu-support-v2-0-38da38234697@quicinc.com

Changes in v2:
- Fixed ubwc configuration (dimtry)
- Split out platform dt patch (dimtry)
- Fix formatting in the dt patch (dimtry)
- Updated Opp table to include all levels
- Updated bw IB votes to match downstream
- Rebased on top of msm-next tip
- Link to v1: https://lore.kernel.org/r/20240918-a663-gpu-support-v1-0-25fea3f3d64d@quicinc.com

---
Puranam V G Tejaswi (2):
      arm64: dts: qcom: sa8775p: Add gpu and gmu nodes
      arm64: dts: qcom: sa8775p-ride: Enable Adreno 663 GPU

 arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi |  8 +++
 arch/arm64/boot/dts/qcom/sa8775p.dtsi      | 94 ++++++++++++++++++++++++++++++
 2 files changed, 102 insertions(+)
---
base-commit: d6d1ad32d00714ecf9f1996173c6f98e43c5b022
change-id: 20240917-a663-gpu-support-b1475c828606

Best regards,
-- 
Akhil P Oommen <quic_akhilpo@quicinc.com>


