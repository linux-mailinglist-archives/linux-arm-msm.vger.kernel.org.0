Return-Path: <linux-arm-msm+bounces-51348-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 580A0A608AB
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Mar 2025 07:00:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A40E33A752E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Mar 2025 05:59:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C524014900B;
	Fri, 14 Mar 2025 06:00:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DDO3kQpK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32E491411DE
	for <linux-arm-msm@vger.kernel.org>; Fri, 14 Mar 2025 05:59:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741932001; cv=none; b=Y5Iuiejeg7FGIb/+Qebl9vJBLdw93a45yCVkfyFV22qq1i31uuBgIYx00Z/i26qdWKR3YUorRPkbj14S8MgS4ASWYVo+IS4yrSWoTOt/IoXS6MzAIXyEVfAYxv1hEgV36ZKDRwTx/grWzE2LNmptewhHwGv8Qsc4dsdYgL13WcY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741932001; c=relaxed/simple;
	bh=66iKtCroS+wUxpRA2gMU25wN8Ri0QuCTAm5ya+VinMY=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=ezekU1C5wTW/0THBLROHUNoVaTW0AL2zaf/EQFLzfKN2nHP5x9UGiVtu63DlQYRtaakRePJywBnoroQqyxVCj9qrwEL6+zjKf9lTJbNrr2EwAPdgCrocT/wh4BcQ9GQV7UqSF4ONRRLowA4K89AEiGR7f7fQziYJYTEaSoPbFi0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DDO3kQpK; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52DNug0C031769
	for <linux-arm-msm@vger.kernel.org>; Fri, 14 Mar 2025 05:59:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=HHHT+h2di88Hnsl4xAfhOo
	ua3p6DucIksRCHqcJkWEM=; b=DDO3kQpKDYiJAOce4OFJy4XQYgd2leXm9SfxTx
	SpkvSegZlsO7e9xQ9Um9EH2hIyDdox1GbJnuHPVHYn9ZTkJsWkiHo12gNnYv+Ouf
	l5pgApdyrBI/JwH/WLZsdkOnjufrpSmjpMXRj5A/4ghz3ojhPRZfIo6mgkP1EXc7
	lz7OJCh1QPSQfhiMPoYipaI3Cd+0rVKgDuRFGCFnxwTbksEuYPnQ2O1sY++QZV94
	NKksn8PSb+e4Woxehgs7IsLwkCr21AEpFZlNawgInIFc0IKcyLSq21wWXASzYF6M
	AhOMj02jE8lIPxruyS1MeplmliUD90mgoisF+9/La84iRRLg==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45bx1jjm19-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 14 Mar 2025 05:59:59 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-6e2378169a4so35881756d6.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 13 Mar 2025 22:59:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741931998; x=1742536798;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HHHT+h2di88Hnsl4xAfhOoua3p6DucIksRCHqcJkWEM=;
        b=msmrmQU2G0IjA1MAhHzpBWmpAp8ovTON/LWfZGWQKzfPxjYV/WwuS+lLnboSmSUcWe
         hQjHUJqUREdUMDw2XxAyoWtwCdA/gAvgB+52kV9peIrgzBbq45hNlGVKI+6jXAXrS3FL
         rmd8wS23XTCYJk0jSXGo9HI4MWZg1hT+OPG3H4LFBDmh9rG20E8L2txWK1DwfjnCpgn/
         9+An0fPVmQo+MiwO2hElFW3yKnDCllqJNZb8lolK52fbtHFlQgDCHmFGiHSW0fdHJN/l
         mb0NZrbyBnpZPlxpBlf2LcM0noVG2pO7x9YMUiSIlNh3MzgPip4Ski1v/qm5WZ2689nX
         yjjQ==
X-Forwarded-Encrypted: i=1; AJvYcCX7rCEJaIkugqzSNY1VnZGD1tdyqkzZpTqqNkrJCl8lFqBEZiOeZLEPwX+O+fx4yXFg0rZJSttvjfk2MZww@vger.kernel.org
X-Gm-Message-State: AOJu0YzC/Ezy/Wbo1Gx1VPYL5yQfN5Tctp+k0bCBPn3jQnYLoW3oExbU
	At5zKsqs9drZMRuqIPc0iAkjoOV2UWzIcvDp62PJcqxLk+kJ/3gXARu0CymqZHrszP6ICxTQX8i
	P8ULaonlE0ckoxjCYoTK3mf3KGLqJ0tcZrLwgLY9tMM66randUwu/6beyfXBM0DQx
X-Gm-Gg: ASbGnctao3wkOBWmvKnIx68gqHL4kS3r2/I5aNpk4getDCh9BAH5RGc+l2Wm9Zs0gMS
	kG9c+jWyQsN1F9ZmuMVbmXnhuIumJ1rklD4MPWiUNRbH93k1X+ZkXGuwpp6UGXRbtVhXM/YaH0W
	A3qccZc8hhP4GLaEwmEgSx+Jvp3azt4rSbHhWnQjaPfJzHQC++tuytaTBB+Ze+V1/gdMU892ErF
	XeeA+TPnJFpwsxZIyw7RDaJm6H7UpVic9vkFN+1Q77iIEjxXG2iQIjw5FDevTTog9Bj03Iul59V
	5Pabv/nKfgGgS72FcAHlXCQrtGFqWGYLZpPefAva/QiAN9GIGhyTKowJZFB0IJOGe+0ruaR2qBU
	fREH81FWdMW2ayNQ3y1o3GrmPsxjS
X-Received: by 2002:a05:622a:249:b0:476:9001:7898 with SMTP id d75a77b69052e-476c815152fmr17273371cf.25.1741931997857;
        Thu, 13 Mar 2025 22:59:57 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHD/joYKwNnyoTwU48hy7M4k6T14ZPi8ulj4wrn8d9hHlzANUFP3JMLHTHp/QiBAJfkO34IfA==
X-Received: by 2002:a05:622a:249:b0:476:9001:7898 with SMTP id d75a77b69052e-476c815152fmr17273061cf.25.1741931997519;
        Thu, 13 Mar 2025 22:59:57 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-549ba88332dsm416136e87.181.2025.03.13.22.59.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Mar 2025 22:59:55 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH RFC v4 0/6] drm/display: dp: add new DPCD access functions
Date: Fri, 14 Mar 2025 07:59:41 +0200
Message-Id: <20250314-drm-rework-dpcd-access-v4-0-e86ef6fc6d76@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAM3F02cC/3XOwYoCMQwG4FeRnq2kaZ1RTwsLPsBexUNNM1p2n
 UoqXUXm3S1zcReZ45+QL/9DZZbIWW1mDyVcYo6pr8HNZ4pOvj+yjqFmhYDOoDU6yFkL/yb51uF
 CQXsizlkfoCNk14bGWFWPL8JdvI3wTn1tP9W+Dk8xX5Pcx2fFjKvqLsGYdsotRoNuOwIEBhcO9
 PETey9pkeQ4mgVfjoXJfgWr48IaG8COWgpvjv3rTPex1VmDc976VbNi/ucMw/AEKA0RTlIBAAA
 =
X-Change-ID: 20241231-drm-rework-dpcd-access-b0fc2e47d613
To: Lyude Paul <lyude@redhat.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Jani Nikula <jani.nikula@linux.intel.com>,
        Alex Deucher <alexander.deucher@amd.com>,
        =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Xinliang Liu <xinliang.liu@linaro.org>,
        Tian Tao <tiantao6@hisilicon.com>,
        Xinwei Kong <kong.kongxinwei@hisilicon.com>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Yongqin Liu <yongqin.liu@linaro.org>, John Stultz <jstultz@google.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
        amd-gfx@lists.freedesktop.org,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Jani Nikula <jani.nikula@intel.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2996;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=66iKtCroS+wUxpRA2gMU25wN8Ri0QuCTAm5ya+VinMY=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBn08XYVO0V/YkMxV3viOt7WsQ1/uAO3FubeT9rT
 25+Usjws1WJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ9PF2AAKCRCLPIo+Aiko
 1QX9B/4wtWeCg/oTKStVqTVja2e5IG4wSPWhflap5NVulnj7g33BPZluzpa3pS60cHgsMfT8nFP
 KjjG9BSCYbTn8Sf0+H/AKWvm5DxqWCcOQX4Jcra9OnvX2ejrd+WqFzeYdEXkYrNdbrKB5zolt7P
 drafp15b8urG28Vsg/LsY8XPIktMvgr96DyMsM0qRZs04F/yl1E69JjnQt1W+/cjUwHwUHrWe2T
 XzYnidkAX9HjM0idwYWw6zS+Hal8QCvq/tMzK3m9BOt52T0P7D8UTaoEh165zjpkJFmHQezND9b
 5ZyUSzPUrKk1Yrt7HNF3+tJInPHHefFFCeyHyCqw3SRV1l1O
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=CNQqXQrD c=1 sm=1 tr=0 ts=67d3c5df cx=c_pps a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=BDmTPyut6bhdKis1t5QA:9 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: LPRUHs1hAjdmKvPZ9lXAlo-2fc2tNhmw
X-Proofpoint-GUID: LPRUHs1hAjdmKvPZ9lXAlo-2fc2tNhmw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-14_02,2025-03-13_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 mlxlogscore=999 impostorscore=0 mlxscore=0 priorityscore=1501
 suspectscore=0 phishscore=0 malwarescore=0 clxscore=1011 bulkscore=0
 adultscore=0 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503140045

Existing DPCD access functions return an error code or the number of
bytes being read / write in case of partial access. However a lot of
drivers either (incorrectly) ignore partial access or mishandle error
codes. In other cases this results in a boilerplate code which compares
returned value with the size.

As suggested by Jani implement new set of DPCD access helpers, which
ignore partial access, always return 0 or an error code. Implement
new helpers using existing functions to ensure backwards compatibility
and to assess necessity to handle incomplete reads on a global scale.
Currently only one possible place has been identified, dp-aux-dev, which
needs to handle possible holes in DPCD.

This series targets only the DRM helpers code. If the approach is found
to be acceptable, each of the drivers should be converted on its own.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
Changes in v4:
- Actually dropped the dp-aux-dev patch (Lyude).
- Added two missing full stops in linuxdoc (Lyude).
- Link to v3: https://lore.kernel.org/r/20250307-drm-rework-dpcd-access-v3-0-9044a3a868ee@linaro.org

Changes in v3:
- Fixed cover letter (Jani)
- Added intel-gfx and intel-xe to get the series CI-tested (Jani)
- Link to v2: https://lore.kernel.org/r/20250301-drm-rework-dpcd-access-v2-0-4d92602fc7cd@linaro.org

Changes in v2:
- Reimplemented new helpers using old ones (Lyude)
- Reworked the drm_dp_dpcd_read_link_status() patch (Lyude)
- Dropped the dp-aux-dev patch (Jani)
- Link to v1: https://lore.kernel.org/r/20250117-drm-rework-dpcd-access-v1-0-7fc020e04dbc@linaro.org

---
Dmitry Baryshkov (6):
      drm/display: dp: implement new access helpers
      drm/display: dp: change drm_dp_dpcd_read_link_status() return value
      drm/display: dp: use new DCPD access helpers
      drm/display: dp-cec: use new DCPD access helpers
      drm/display: dp-mst-topology: use new DCPD access helpers
      drm/display: dp-tunnel: use new DCPD access helpers

 drivers/gpu/drm/amd/amdgpu/atombios_dp.c           |   8 +-
 .../gpu/drm/bridge/cadence/cdns-mhdp8546-core.c    |   2 +-
 drivers/gpu/drm/display/drm_dp_cec.c               |  37 ++-
 drivers/gpu/drm/display/drm_dp_helper.c            | 307 +++++++++------------
 drivers/gpu/drm/display/drm_dp_mst_topology.c      | 105 ++++---
 drivers/gpu/drm/display/drm_dp_tunnel.c            |  20 +-
 drivers/gpu/drm/hisilicon/hibmc/dp/dp_link.c       |   4 +-
 drivers/gpu/drm/msm/dp/dp_ctrl.c                   |  24 +-
 drivers/gpu/drm/msm/dp/dp_link.c                   |  18 +-
 drivers/gpu/drm/radeon/atombios_dp.c               |   8 +-
 include/drm/display/drm_dp_helper.h                |  92 +++++-
 11 files changed, 317 insertions(+), 308 deletions(-)
---
base-commit: b0894e40afe2bd05d1fda68cc364665ac2b00e09
change-id: 20241231-drm-rework-dpcd-access-b0fc2e47d613

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


