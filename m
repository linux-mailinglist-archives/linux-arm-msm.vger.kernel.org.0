Return-Path: <linux-arm-msm+bounces-39117-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 41BD59D8A6D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 Nov 2024 17:33:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 02700285F8A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 Nov 2024 16:33:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DC8001B4F0A;
	Mon, 25 Nov 2024 16:33:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="mBKi96uU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 219E61ADFFE;
	Mon, 25 Nov 2024 16:33:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732552422; cv=none; b=knKqNMhEdkDF4+LWHQ5YJ3XivT0rCE/9+Jlxhmcyk5K2IeYDYINxAoK44ieYgFCJwDkHTnv8B6O5tZbIxi4/SsvYESgvAb+3by5xKIwoUvRwLMuMQ3i05oM6Vx7c8bf9mjECeV6zqK6AGpREPpyXRTqW8ZWPxXE3tg2lJY8LaTQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732552422; c=relaxed/simple;
	bh=yafn+AyZe5YLNXnSSxWeZ5fEOk7gllMrldSy3aktjx8=;
	h=From:Subject:Date:Message-ID:MIME-Version:Content-Type:To:CC; b=F5vXCzkWOoynrRUsuxTh/FsAJQGBmxD6J7F07s+qNT0fM/mQy0rEMSNoz8sUldTVvrbED+hOQgBOpd+chPYK8B6ssK5Pcv2ysLmzG3FrwQ/N9attL51dAqNs9uEvRalwBXtpqB47Pmueg/6Vb9p1Wl1dTkn7fHJ5D8JY87Wbths=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=mBKi96uU; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4APAiYId021756;
	Mon, 25 Nov 2024 16:33:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=DNV8aShfwdMG0hhjEk7lLQ
	0CVQ8Nl+SDaaMKfGPMOlA=; b=mBKi96uUxvAkBn07aAURx+FAHdioBwviBHDj+j
	Gh2QrTPpZ7G0JM+TkF8v/SBe0N+TT5nZ/b37hdtjqQJxWXCvOejNBCtMi/QdidBB
	BJPGYnZ6Gb/jNC47NtGSzVsB1U5fuAa07A0uYzZ0Gex2IhOYIulbmOwBDtcs/zIS
	CHz50MYYw+FQAfxQouXnNkEnLEPQ28hsxFXHM+nju/T+EoEQSdpCiZx+nJ7k4vYn
	t5/fA6TvxsIytOvYJGHFGKtyMe7wrmfLcXpPLF+tK36eF627QCmdfpQEd3VxHSqQ
	c4eczdf273S865adNr1xVSDx9gOrF8ahBlATdt7yledKb9KA==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4334rd5ptw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 25 Nov 2024 16:33:30 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4APGXTVN025775
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 25 Nov 2024 16:33:29 GMT
Received: from [10.213.111.143] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 25 Nov
 2024 08:33:25 -0800
From: Akhil P Oommen <quic_akhilpo@quicinc.com>
Subject: [PATCH v2 0/2] Support for Adreno 612 GPU
Date: Mon, 25 Nov 2024 22:02:59 +0530
Message-ID: <20241125-a612-gpu-support-v2-0-b7cc38e60191@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIALumRGcC/22OOw6DMBBEr4K2zkZeQM6nyj0iCsBrcGEgtkFEi
 LvHmDbljPTmzQaenWEPz2wDx4vxZhxiyC8ZtH09dIxGxQy5yEsSBWEtKcdumtHP0zS6gEoWhdB
 0U4I0RGxyrM2aJt/VmR1/5rgczhKa2jO2o7UmPDPlLFpvceA14GFBIhQlHGhvfBjdN51bKLHpB
 4k/PxZCwkZpvmupHoWQryhtzdBeowqqfd9/hUlykO0AAAA=
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        "Konrad
 Dybcio" <konradybcio@kernel.org>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Marijn Suijten
	<marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, "Simona
 Vetter" <simona@ffwll.ch>
CC: <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <freedreno@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
        "Akhil P
 Oommen" <quic_akhilpo@quicinc.com>,
        Jie Zhang <quic_jiezh@quicinc.com>,
        "Konrad Dybcio" <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1732552405; l=1280;
 i=quic_akhilpo@quicinc.com; s=20240726; h=from:subject:message-id;
 bh=yafn+AyZe5YLNXnSSxWeZ5fEOk7gllMrldSy3aktjx8=;
 b=qnm1VswaLeegwwJS1f37Bps4/tf1LpEnpifXetMjiAwdlF4VHm80+mIydQTlyA+oZmw1S07sW
 d/+kBACUXO3DLNxS3apJHAESqtXtnGYHACovId91/iA//9wg5vuZlWi
X-Developer-Key: i=quic_akhilpo@quicinc.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: md_ugEhDxX_3N6ht_tWc3PgGj4mxIK0-
X-Proofpoint-GUID: md_ugEhDxX_3N6ht_tWc3PgGj4mxIK0-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 lowpriorityscore=0
 bulkscore=0 clxscore=1015 suspectscore=0 priorityscore=1501 malwarescore=0
 spamscore=0 adultscore=0 impostorscore=0 phishscore=0 mlxlogscore=724
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2409260000
 definitions=main-2411250138

Mesa support is already available for A612. Verified Glmark2 with
weston.

Some dependencies for the devicetree change are not yet available
in the mailing lists. I will send it out as a separate patch later.

In v2 of this series, there is a new patch to check the LLC support
by using a new QUIRK flag. This is required now because A612 is the
first gpu which has gmu_wrapper along with LLC support.

---
Changes in v2:
- Added a new quirk to check LLC support (new patch). This helps to
correct LLC handling in A612's patch.
- Rebased on msm-next tip
- Captured R-b from Konrad
- Link to v1: https://lore.kernel.org/r/20241101-a612-gpu-support-v1-1-bdfe8f6d9306@quicinc.com

---
Akhil P Oommen (1):
      drm/msm/adreno: Introduce ADRENO_QUIRK_NO_SYSCACHE

Jie Zhang (1):
      drm/msm/a6xx: Add support for Adreno 612

 drivers/gpu/drm/msm/adreno/a6xx_catalog.c | 18 ++++++++++++-
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c     | 42 ++++++++++++++++++++-----------
 drivers/gpu/drm/msm/adreno/adreno_gpu.h   | 12 ++++++---
 3 files changed, 54 insertions(+), 18 deletions(-)
---
base-commit: f4a867a46862c1743501bbe8c813238456ec8699
change-id: 20241031-a612-gpu-support-d6330f17d01f

Best regards,
-- 
Akhil P Oommen <quic_akhilpo@quicinc.com>


