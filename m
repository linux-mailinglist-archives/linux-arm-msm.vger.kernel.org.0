Return-Path: <linux-arm-msm+bounces-75540-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A009BAB867
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Sep 2025 07:50:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7EBEA3A6E32
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Sep 2025 05:50:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F1CDB27A108;
	Tue, 30 Sep 2025 05:50:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ii2dq5xc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67B01279DA2
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Sep 2025 05:50:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759211406; cv=none; b=E/O6WmxhwxGCnYeujE9pIbrxf2swQ4pQoDEk8fZPjzFxa5GJsa+hz5yl2Tlb+X4EziMDKCweQ/39CNqiJkoBpFuM/0JYcTNfE1rE3bYe7Q3P9SYl6TIew2+nB2mu2mCH+RmgSnG1c6/reQqs7vZYMcdwRAlw/5wZRViHme4UWGE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759211406; c=relaxed/simple;
	bh=JAlufx4bcWYhOFT96HAmSFs8ixvBu4zisfH0Ny260iw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bcabBXb1uZMejp9yjDIAJv+8xfHD2rbYmXWrTB9kWDecoRenD7b/YhIwA3ynzVk8AQlm/QD32NAoi+N43YD62HQOmsJUgaxe0O8iC6jdNpXdHS0P5jewgvwRYdhNcZZvlzRfcfcKBFr8nUnbcvkO9UpFYL5a0BQYclZO8yYH6Yc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ii2dq5xc; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58U4HQFs023802
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Sep 2025 05:50:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	H+Y5nCYPwx7u+eftr16tQ9QPU1KFxFK+YtBkCK2a/5c=; b=ii2dq5xcszBZzzX0
	Wi7biX5+UML7GS+Tb/ZhgIoxVbQ+1qwEi/cDIlAlwf/fMA+qWG2mMqDq0E5F/7or
	CrNK46VHO1RKASZLO+qYahBGFq9ZBDEKVRtMXpcZhjOv8/Cv2DfBe0oiO/Ty0rYi
	3oKTq53euWSqlqF/2G/TEoD7vGRm3FFtUleXnsc7tixui7wh+DJjFBhZtE7gJNdd
	Yu9Zd74aPJByCatfs3g22JX1hxj7zf0s22sPpklclSv90dzTNvRcZJR+z/5orn2V
	uqTSTu09oFreAtcz+gHSTmKM4E+H+Qc34tSDcm7/H/F9d8Irz2PTIhzUpYeog369
	uSWR0A==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49e59n04wm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Sep 2025 05:50:03 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-269939bfccbso65281465ad.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 29 Sep 2025 22:50:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759211403; x=1759816203;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=H+Y5nCYPwx7u+eftr16tQ9QPU1KFxFK+YtBkCK2a/5c=;
        b=nb0FOBW7n9udR7gUcWugK8m8umGb/Xa7aU7uB/hC70Bd/aBk7BV8Ge68kBqQ7JCtOv
         crsjL5lc5AUhggjt5E1+jo+F8ac2poV6ULu5OgudvE92y0LIHGoHVWt97NoaPz8KTRbj
         4IMllFFeoz9Yt9QBe1JimyWSw56ZCp8BvP8MWJi2Bm8u6lMUQsKMeHzYS82HMbRrfSXk
         7baEG6wfKiPh0kS5d+jXHljVdUm99XFRqRaxRncdbJeivOf0M972Tdh3vyh3jDK/jXxy
         pcj51E3J3jgVpJFxWASFqksgl8qFLa/xUh16ixE1Gm/2BMCmToN5wQfwlqpzDhWqtHws
         9ltA==
X-Gm-Message-State: AOJu0Yx0Aigz016qceULH4bsHZb6Mov/w4aywD+zbeCAXuUwYURi+yjq
	OoyhtKXidu2VmlBhYb03qf5AEN4iutn0iFaoIM8AgCvjkdnkMsLu8WHaj0w93kEWVkuaNkrlZu1
	HXVrrbQKmuk78S8NSChjGP2RYgXI68tDgMp+Hc0Zu/qoDC802GOn2wHh6k9zHjw6MAwNA
X-Gm-Gg: ASbGncs17UkVBQ4YvcXDI9RAM8iabo1y99lyaOoof5hNEJhRO8C4nI4ohyqNLtO7DaU
	9IFVN5qmnAiq1c47iRKoE0rbHrz3NwX6vmxvloHaDk0Bft9ZplN5lwXtMn15oKidrk975A12IiB
	iOHtNnaIoEMfRKbtDmFxiTgxNImXG557iR9HCuU4OHsa6kmWMHY/iq5FEcuCexOqUQigfRVAWML
	ltXGLAXSFAYx6qhZMdSyAif0L5jLP9j3Dx4rzYZ3YU/QjcsGoEHdb+k3MWP7FI5lXseiS4Y05P0
	C8TjpfZ9WzQMpqxkDQWRVKkjoO5ukaLHQ9YZMl8f2eyHKAOz0FxLN890+soebAmAC/Zx+w==
X-Received: by 2002:a17:903:2343:b0:265:604c:17e7 with SMTP id d9443c01a7336-27ed4a89825mr178638115ad.60.1759211402707;
        Mon, 29 Sep 2025 22:50:02 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHfxMz8cAOPh+Vs43kdCM5oU0zEFqqAy+EADwvCBEeDKHCk/6ncSzf9Kw1lSxzqRRosJ9WkNg==
X-Received: by 2002:a17:903:2343:b0:265:604c:17e7 with SMTP id d9443c01a7336-27ed4a89825mr178637855ad.60.1759211402274;
        Mon, 29 Sep 2025 22:50:02 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3341be23412sm19029779a91.20.2025.09.29.22.49.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Sep 2025 22:50:01 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Tue, 30 Sep 2025 11:18:07 +0530
Subject: [PATCH 02/17] drm/msm/a6xx: Fix the gemnoc workaround
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250930-kaana-gpu-support-v1-2-73530b0700ed@oss.qualcomm.com>
References: <20250930-kaana-gpu-support-v1-0-73530b0700ed@oss.qualcomm.com>
In-Reply-To: <20250930-kaana-gpu-support-v1-0-73530b0700ed@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Sean Paul <sean@poorly.run>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
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
        Thomas Zimmermann <tzimmermann@suse.de>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
        devicetree@vger.kernel.org, Akhil P Oommen <akhilpo@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1759211380; l=1521;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=JAlufx4bcWYhOFT96HAmSFs8ixvBu4zisfH0Ny260iw=;
 b=0SDd5GWlf6Z1edx32Bey18kAogkeePh7FfDo6CnNR1gZeWIj1Lj2prEncun2xLJyodvNcrtLE
 Us5ChPyi+I2AV+S7wi4gT4RlcjAd4tPRBxegTfXxDxVU9VnlSZRyDoS
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-GUID: yn-XRGorMmixfiowiIEzMZyocCcZ2l4O
X-Authority-Analysis: v=2.4 cv=O4g0fR9W c=1 sm=1 tr=0 ts=68db6f8c cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=gggc3m2WwWe7Cuz57AEA:9
 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-ORIG-GUID: yn-XRGorMmixfiowiIEzMZyocCcZ2l4O
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI3MDAwMSBTYWx0ZWRfXw03J2XQL4Yf9
 S+qnMhvqbd6WwMPsGwcQOTgocfvmNlAMLB0mpZ9iqylPwW6EgsXRQThM3bg/mwD/ZfnQhycgXYY
 xtSGK0QYm0q3VIHaF7PBwFCM/5pmC48PU23KNhdjR2/a3YD52UTmZswAgAAkRlpWJtcEpZF7uwe
 bMo89cR4SK/5lJXjT0eIvWlI6epBdgk47CY8KItanufrAl9krpyB7rG1vjjEXe4Dk9Uh156GPWW
 ODG8aFn+nvi6WF2fL+loWc/NtvwQx4sHuAvxJdmEmpMPrYZ9tUbDVyhvoA787V+lL8Jp/QNYFn0
 78R9q1XbFBfnR81MnvJQSu7aWhDFZOQ8lV8jvir4YfVBsWkQI6bvvxGlWM5p27jHbPIanhjNs9U
 +g20lE4SW7H3yhJlOtlR1qE8/dNZpQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-30_01,2025-09-29_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 clxscore=1015 priorityscore=1501 lowpriorityscore=0
 spamscore=0 impostorscore=0 bulkscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2509270001

Correct the register offset and enable this workaround for all A7x
and newer GPUs to match downstream. Also, downstream does this w/a after
moving the fence to allow mode. So do the same.

Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
index fc62fef2fed87f065cb8fa4e997abefe4ff11cd5..e22106cafc394ef85f060e4f70596e55c3ec39a4 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
@@ -485,8 +485,9 @@ static void a6xx_gemnoc_workaround(struct a6xx_gmu *gmu)
 	 * in the power down sequence not being fully executed. That in turn can
 	 * prevent CX_GDSC from collapsing. Assert Qactive to avoid this.
 	 */
-	if (adreno_is_a621(adreno_gpu) || adreno_is_7c3(adreno_gpu))
-		gmu_write(gmu, REG_A6XX_GMU_AO_AHB_FENCE_CTRL, BIT(0));
+	if (adreno_is_a7xx(adreno_gpu) || (adreno_is_a621(adreno_gpu) ||
+				adreno_is_7c3(adreno_gpu)))
+		gmu_write(gmu, REG_A6XX_GPU_GMU_CX_GMU_CX_FALNEXT_INTF, BIT(0));
 }
 
 /* Let the GMU know that we are about to go into slumber */
@@ -522,10 +523,9 @@ static int a6xx_gmu_notify_slumber(struct a6xx_gmu *gmu)
 	}
 
 out:
-	a6xx_gemnoc_workaround(gmu);
-
 	/* Put fence into allow mode */
 	gmu_write(gmu, REG_A6XX_GMU_AO_AHB_FENCE_CTRL, 0);
+	a6xx_gemnoc_workaround(gmu);
 	return ret;
 }
 

-- 
2.51.0


