Return-Path: <linux-arm-msm+bounces-63774-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 11659AF9A03
	for <lists+linux-arm-msm@lfdr.de>; Fri,  4 Jul 2025 19:46:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7CE961CA5400
	for <lists+linux-arm-msm@lfdr.de>; Fri,  4 Jul 2025 17:46:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 451E4307AFC;
	Fri,  4 Jul 2025 17:44:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SP2f9R3I"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D1BE2D8374
	for <linux-arm-msm@vger.kernel.org>; Fri,  4 Jul 2025 17:44:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751651083; cv=none; b=L2h4uQB1YqogdFLhZo5daLuNMm4oJHKJ3Gd3OHW36SeBWzA5jInItZrr7/7Dxloldwb+LOaHbAT65vdZLLY+FGW92PbPXkYVOwOys5MB6XqAJTX8g2FIQIGsCN2byjQ0GXYHN/LceF62dEiaRidd97eATTvEoD73Vu1sx72Sxz8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751651083; c=relaxed/simple;
	bh=DBt0DNfX83od0+B5jUw14M1HaALXNhk15W6Z6/5Vg8Y=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=jnxfMsqvjMFQgDf6tJAeNu1vK0V5Gv6tjQDDBX94iOByDvOwQIF3sOmm2hgjWCR2NgAd+Skt9S0owfrRXeO7vvgDbVj217zbR6qJNMS0erm3NSgE2XDGq3eOXOFU/KB6N03Qm3NtVVgqPj6sL8yrBZ9X6Q+YuJ5+9+vIuImsMks=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SP2f9R3I; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5648pbFX026279
	for <linux-arm-msm@vger.kernel.org>; Fri, 4 Jul 2025 17:44:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=Ln9K1aZ7occVpcksNgIQY1Xb6OInD1HFG8L
	+w5gb4lw=; b=SP2f9R3IZG/DoJI+RUU3QJ3PvGBOAV/A/nJIWA4cAVoqnofiY+u
	9nLvPSYvT9mXGDGLbSsmVNLcfRY+dmHhFo/Op33lTZvWiNocrDCtbuXOGyl1WZXu
	ePiyu1opSy8b9shUreWgzOWL4jfN0LsDnxP3GU+mAD/wp0HyWo7RmMPaY88xeUwz
	hftUSUYLo5kbNSyqX73Rl7PJkYStocg2dwg7JxsXtm3AjAyS3KMTXYfjKk2X0XfM
	0UnGE0o9LalVoL1WFqxq44xIP2GvWuqrNuVY16T9NV3qFZrdgPzbDHA0J4qInbAa
	OU9vXg67MbIFIzzyloLHFOF5uuZQx2BIS0Q==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47kd651nt4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 04 Jul 2025 17:44:40 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-315af08594fso1220609a91.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 04 Jul 2025 10:44:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751651079; x=1752255879;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ln9K1aZ7occVpcksNgIQY1Xb6OInD1HFG8L+w5gb4lw=;
        b=PYLm9hrcSQSLK1FLW34pluGrvEG4W+wC7nUTQmY6PqTfdoTMJdTnGTJvoyLGojNeo5
         RLJHHf5lfZNfkVPsMqNQX/MjvJyT3Fcpx/i8X7jYU5KsMajfA1adrOK4xdqTybY269km
         YHXsGK6jbl2LBRf9DmTleeu4M2gMGs2Ca98SUdwO4ysJzLnjw/NnSD/ePyMsrZXjBVdB
         nvLfbHceEarbitvayWgT//zPNS6YHXDLzVBE4zzHw7ymj2YdyWx6LIlINV4JMH8wuuoM
         M4ItG42g+cldqKyxG/y50X91rDbfmhQMQ+vQF59D02NH3pvvO9SX2hNlRPDWteIjj0Ii
         GpgQ==
X-Gm-Message-State: AOJu0YxUfHZNatIQuO0ENl1BkVEoh0/ZsyBZ0qvEBIFuojS6ncy04zSW
	VyTpuSMz3yf4XyIqwl09XVKN4j/AfEi1jV48ISfRMUvnby11TrWsED9mHaoay8oYxC4Y9OhoQSM
	IEoT0FSB0JG5qqlKrYOPB4P2Ym4x/ES5GIhnjGuESpI1rWpBas5iTGnRcumLybz84qV78
X-Gm-Gg: ASbGncsSDoJQNO3zLshpzjD0vyR+tB3TfECq1KF2+wFtYtldUvR41HZf8iUWG+fdNBR
	MfD8mCC8lIBHZTj5X5FN3eUO4l36PhqGcnsPm22FKLfHFGGPS0rB3BYQPGsfUmWHZqzSLuxhWKb
	2b6PIsEkNf88k/3LTxgHkjrxUGFLBmL9Cw5hIh9rNQtwTZxOmAfHsZjbDAkKzsOjDU0frGVHwK7
	y5FcG38isdbDWR/vnI5fCFXLrSy3ekIptf6aufshQsw/12KuTvDnpIjJ2tGfxTVtajOtylsV0IN
	2MCYHTtj4s5smtk1WA7OeYkmsxcJKc67PQ==
X-Received: by 2002:a05:6300:2414:b0:220:82c7:309c with SMTP id adf61e73a8af0-22608fb3070mr3625364637.7.1751651078742;
        Fri, 04 Jul 2025 10:44:38 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH8Jl4EFpWHf5IwmZK4Vr8g/FAU4AIrSYjd7kWPFYX4w68L3NQh92fr5lAW9BcjJu7BoJ7+og==
X-Received: by 2002:a05:6300:2414:b0:220:82c7:309c with SMTP id adf61e73a8af0-22608fb3070mr3625338637.7.1751651078312;
        Fri, 04 Jul 2025 10:44:38 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:5b3e:de60:4fda:e7b1])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74ce4180dd8sm2731263b3a.100.2025.07.04.10.44.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Jul 2025 10:44:38 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Helen Koike <helen.fornazier@gmail.com>,
        Vignesh Raman <vignesh.raman@collabora.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] drm/ci: Uprev igt
Date: Fri,  4 Jul 2025 10:44:32 -0700
Message-ID: <20250704174433.693630-1-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.50.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=Z+PsHGRA c=1 sm=1 tr=0 ts=68681308 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=xqWC_Br6kY4A:10 a=Wb1JkmetP80A:10
 a=e5mUnYsNAAAA:8 a=EUspDBNiAAAA:8 a=8iDXaJqXtVj3SukbGHsA:9
 a=iS9zxrgQBfv6-_F4QbHw:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA0MDEzNCBTYWx0ZWRfX7qiFM+vPrwiM
 aiM/OD92VNu8AbrWOqwhNwYP3pssCpYmKQshuQa+TlsRN+oBcgRB4lRLZThL/pklqTOdCWkJrlu
 IJreu8+/Ip52uhJ6WFB6CdOl4bVrhxLuOVWDV8n2/yxbtxtTmJqYRF+mt/68cANFnCuOHhSEPiT
 XJwl2hBJn5Z4Q9CYwQBq8h1rYQaGo/FKJQEKxvcjtr04FefBKQvm9owPXCjUstQp9kZN07Gxfqw
 zDIvUHKSUjOfqrfIoMB8Tx1ebhG53rDShHKvzeZN8I2lCNNt9t0Ws/qF7UiP6lKVc8fwQ1R+Vwt
 ZxGfsX7B+c0R++AaXAXb+aZvCebNjhjfOeNG2ZODN4mNOY2wCHCWfD17wQAAvygZrBghMubwV9Q
 qDfChlSXbsr9EtJD+TwYRtZbDr+ykChNu5eGdemXq+nEUP86riobC/8DU8OEWMpB0LYhEipJ
X-Proofpoint-GUID: SDo6yvQ5rW9B1KnYTEH8XRDCPeuUKKuZ
X-Proofpoint-ORIG-GUID: SDo6yvQ5rW9B1KnYTEH8XRDCPeuUKKuZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-04_06,2025-07-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 clxscore=1015 malwarescore=0 mlxlogscore=999
 spamscore=0 adultscore=0 mlxscore=0 priorityscore=1501 bulkscore=0
 impostorscore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507040134

Pull in igt updates that are a dependency for VM_BIND, and will reduce
msm_mapping flakes.

Skip msm_mapping@memptrs on sc7180 (the test should be checking for
preemption support, and skipping if it is not supported).

Closes: https://gitlab.freedesktop.org/drm/msm/-/issues/77
Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
 drivers/gpu/drm/ci/gitlab-ci.yml                             | 2 +-
 .../drm/ci/xfails/msm-sc7180-trogdor-kingoftown-skips.txt    | 5 +++++
 .../ci/xfails/msm-sc7180-trogdor-lazor-limozeen-skips.txt    | 5 +++++
 3 files changed, 11 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/ci/gitlab-ci.yml b/drivers/gpu/drm/ci/gitlab-ci.yml
index 6f9b7beddcb3..d502d146b177 100644
--- a/drivers/gpu/drm/ci/gitlab-ci.yml
+++ b/drivers/gpu/drm/ci/gitlab-ci.yml
@@ -5,7 +5,7 @@ variables:
   UPSTREAM_REPO: https://gitlab.freedesktop.org/drm/kernel.git
   TARGET_BRANCH: drm-next
 
-  IGT_VERSION: 04bedb9238586b81d4d4ca62b02e584f6cfc77af
+  IGT_VERSION: 129d5b10baaadea1d6cd6377341c4cb42e7ee6fd
 
   DEQP_RUNNER_GIT_URL: https://gitlab.freedesktop.org/mesa/deqp-runner.git
   DEQP_RUNNER_GIT_TAG: v0.20.0
diff --git a/drivers/gpu/drm/ci/xfails/msm-sc7180-trogdor-kingoftown-skips.txt b/drivers/gpu/drm/ci/xfails/msm-sc7180-trogdor-kingoftown-skips.txt
index d4b8ba3a54a9..154b047787b2 100644
--- a/drivers/gpu/drm/ci/xfails/msm-sc7180-trogdor-kingoftown-skips.txt
+++ b/drivers/gpu/drm/ci/xfails/msm-sc7180-trogdor-kingoftown-skips.txt
@@ -32,3 +32,8 @@ kms_display_modes@mst-extended-mode-negative
 
 # It causes other tests to fail, so skip it.
 kms_invalid_mode@overflow-vrefresh
+
+# sc7180 does not have APRIV, so memptrs is not protected.
+# (Preemption is not supported on devices that do not have
+# APRIV, so this is ok)
+msm/msm_mapping@memptrs
diff --git a/drivers/gpu/drm/ci/xfails/msm-sc7180-trogdor-lazor-limozeen-skips.txt b/drivers/gpu/drm/ci/xfails/msm-sc7180-trogdor-lazor-limozeen-skips.txt
index 022db559cc7d..a9bb3e1ad75c 100644
--- a/drivers/gpu/drm/ci/xfails/msm-sc7180-trogdor-lazor-limozeen-skips.txt
+++ b/drivers/gpu/drm/ci/xfails/msm-sc7180-trogdor-lazor-limozeen-skips.txt
@@ -23,3 +23,8 @@ core_hotunplug.*
 # https://gitlab.freedesktop.org/drm/igt-gpu-tools/-/issues/162
 kms_display_modes@extended-mode-basic
 kms_display_modes@mst-extended-mode-negative
+
+# sc7180 does not have APRIV, so memptrs is not protected.
+# (Preemption is not supported on devices that do not have
+# APRIV, so this is ok)
+msm/msm_mapping@memptrs
-- 
2.50.0


