Return-Path: <linux-arm-msm+bounces-51393-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D17DA60D6E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Mar 2025 10:37:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B29F417D0DA
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Mar 2025 09:37:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D14B21EE7C0;
	Fri, 14 Mar 2025 09:36:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SQB8hF/o"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73CB2157A5C
	for <linux-arm-msm@vger.kernel.org>; Fri, 14 Mar 2025 09:36:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741945018; cv=none; b=H3EfOIhxmEHAx5SmM/tDNLWQLOIfPOkWNHj1MzaiSAquIcqZ22S8nVgYW3XctH3ofYfgnSoOfD4cYuN+UiOmsU5m+uf+M9FyjyERG9Q4xuPpvg+E6moEWWFZ9gVwDEee5eM+G4Npkzq7l2pXEHGVBvGuyp1SGxs8ntOMI5QJN54=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741945018; c=relaxed/simple;
	bh=0lnm1GJCGsxhP/KdiWVnCi8fZKi2B/6ZzRNe13K9nc4=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=kJpP7eCEqMFT9XtqV2JrJKoh20J90i/q558QE5LbjksMNKStc7zvvNRUK8UZOFLxk2vPLqODNm7kXRnt5DDivRfUAtmxsEVoozAB0PXUlcbpdgWQTz18L+gmguTQwTaNE+Hfbf86GZJomS0wCqqIDCd3YkdN8t6AIU3JGr/oaFg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SQB8hF/o; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52DNpK80005339
	for <linux-arm-msm@vger.kernel.org>; Fri, 14 Mar 2025 09:36:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=xEFJu6kED4yenXLknUXHYh
	9PFvJ6uNpQTx9XfMT9RyA=; b=SQB8hF/oVbaJ95UUwHyqnukvaV+ieahASDf8GP
	J8gSZBKBpGL57vlcmmXUD+a8Sx+jbjslLCofHFrAal6tSBTt2XiWxEesv/wTPGvn
	rPYP7Vr3AISEZWuer17Ze3eiino+ag/O41+fLWNGSQfG5OA/f/7Bi1k3N5DQP4Bl
	llWRp18+xPywoWsPEgA8WwifYbwAr1sS1RfiDLNlTvWc/2QMAlCXZn+fZW4VU/kr
	Cp1FaqOxGGmdGgzCzdQEMJCP7RNEa8izByGxafLa8HWmKljD6eAipACjbcLzR7gF
	M4m5iVUbflrcv8Ti6SLSw/Av72E/+haVAmos5AZtuSP+wYPg==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45b96yepv7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 14 Mar 2025 09:36:55 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-6e9083404b7so41147766d6.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 14 Mar 2025 02:36:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741945014; x=1742549814;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xEFJu6kED4yenXLknUXHYh9PFvJ6uNpQTx9XfMT9RyA=;
        b=RgbZgmqgPYuoCljDI7qEPjjqdKUbjXgme8wGOhfMKlFHn//HWjGlFCXC4MbhxesCAU
         IFtqYobrHApdMMVXPZg1pcf79Tm0g0QKLgChVnHG9GLgo93r95v6zItjliGAAXT0o3Wl
         KT+2qQ30AYSuKYvLZh/9KFASYXh15aZN8lELQekfUXeCPYV9/xs02tly/dg3UwZ8gw+x
         jYxjAGEYu/OHk5tNw/p0B+mCoN9mmwobxGAPNxpQBK0XMH5lZw5l8pKsH6wQtcA5K5n7
         duWGuLo+C1wFGiVMBBb2GDvkdSn+KkhkMxhp7yH+ybprAWSShSVagfwcu8dzNeKF5oOP
         he3w==
X-Forwarded-Encrypted: i=1; AJvYcCVzBeIUJq4mGxM7Gd73CU/VKfmWFLvKjJHT280jRDENgdEkRQVt+zRyVKMj1UCqMmF/264NkhKjVgagSx/s@vger.kernel.org
X-Gm-Message-State: AOJu0Yy+AmsEwUPpVraXJ2cb+hyQxNVv8L9P8JhoeBVdbjme9bDd+Ff/
	X/KzhKRLz94zIYuTIjreOP3w9jjZTHe4hOTBU8m+D3bf07jYVty8vQqW5BV3hGlNmTrcoEw97mm
	6/o/fLlKhMKMAyBuq5ubutfMS13zM4WWRzvMo2vajeLbHI94PMbLoKEXph/4zzL9u
X-Gm-Gg: ASbGncul7rDm5riru112Rl9aN0tkpX7qL2ASlz8ivO0KsL7Q/TcNEPx1ypm5PUxbNtU
	9tJI72yMKPdJqPjRUT+Ws6Hoc9Q/9HXwg2w5d+64QWsT1lk/78Bb2hnm+Cyghpl87m0jnIqxJKQ
	izAfpM06/3OPF9zE+YdwgfYh4ihAce0ZDAbCnAMJOztOmk+id3NRBtBjPYm5dnd2JQ9DQfh8ADq
	0CB6gnLJ/ll60u4smXgM12yrEgcnJrfnjC/Oh7YMmIh7s/nq8LI9T4I6rVKPo+q9wX3itH9Baxg
	PG0qG6FmHgsxWXoVpW2+j42UOoF9IGJS183AQjTY1a4Wfwe3SlwUyf4O+/I6/NKAyFSX9dLyYlL
	gr7u64qBYOj0YxTl90R9a5TuRe720
X-Received: by 2002:ad4:5def:0:b0:6e6:68e3:8d84 with SMTP id 6a1803df08f44-6eaeaa1d193mr24468566d6.18.1741945014122;
        Fri, 14 Mar 2025 02:36:54 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEUVgEL9hrI7NXwzP4xolE1ykXkDDf2o48ywvePWgyi+DCZbRXuwlcVbFzwbvCLgMEnJ0WABA==
X-Received: by 2002:ad4:5def:0:b0:6e6:68e3:8d84 with SMTP id 6a1803df08f44-6eaeaa1d193mr24468326d6.18.1741945013749;
        Fri, 14 Mar 2025 02:36:53 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-549ba7a8368sm478585e87.32.2025.03.14.02.36.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Mar 2025 02:36:51 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH v6 0/4] drm/bridge: reuse DRM HDMI Audio helpers for
 DisplayPort bridges
Date: Fri, 14 Mar 2025 11:36:47 +0200
Message-Id: <20250314-dp-hdmi-audio-v6-0-dbd228fa73d7@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAK/402cC/3XQwWrEIBDG8VdZPNcyjprEnvoeSw+a0c1AGxfTh
 i1L3r1mL00TevyE35/Bu5hi4TiJl9NdlDjzxHmso3k6iX7w4yVKproFAlpAaCRd5UAfLP0XcZb
 KkksUYgguiWquJSa+PXrnt7oHnj5z+X7kZ7W+/lealQTZea+M73ogQ6/vPPqSn3O5iDU145a7P
 cfKVUOhiSEhpnTgesPVgevKDTqABNoEAwdufrkGtedmPR5b7cgn7Pr+wO2Wt3tuK086RFS2/mb
 b/eHLsvwAM/REOKcBAAA=
X-Change-ID: 20250206-dp-hdmi-audio-15d9fdbebb9f
To: Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Hermes Wu <Hermes.wu@ite.com.tw>, Dmitry Baryshkov <lumag@kernel.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Dmitry Baryshkov <lumag@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3459;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=0lnm1GJCGsxhP/KdiWVnCi8fZKi2B/6ZzRNe13K9nc4=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBn0/ixPim1tzMzoF7srtpwz4JAoHWG5zEfl7jzO
 Q6vMwzKgKqJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ9P4sQAKCRCLPIo+Aiko
 1dizB/wPfSsLP1qY1awkJB4RwcyNg7yxgR1l+UDKB8XlLClJ2y4VPTUEPztCeacm5TuN1jKyZ9P
 fc1pF7vi6OxLabv+YADsUUMemzeMHeBvsuNE0Q9BBPr/C2M5nUE3Vfb3pMBoVNc9LjfKyjREgmI
 gEHchFcEWccXE8DyLnFWqqyG25wbynBYrSg3H2YdUiv1n9oXsfb8KUa/AP+aKfKczcdxZUw1l2n
 xO8t+OQQwkpdayFyH3KoxIUH4dBdbsFAaApfHABPcurILp/SIUCvjOgRk+RI6zZStDC9zvZQIZ6
 NUy3GHtnZKjqiSGFk7rCLizKvT1Cq9CEzDEY4A0sB6vZJKuW
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: qNF-L-I0UZlciBpErZPFrVhDkHkJCs7Q
X-Authority-Analysis: v=2.4 cv=I+llRMgg c=1 sm=1 tr=0 ts=67d3f8b7 cx=c_pps a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=mOMMeWxa1wVVc0mUho4A:9 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: qNF-L-I0UZlciBpErZPFrVhDkHkJCs7Q
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-14_04,2025-03-13_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=974
 lowpriorityscore=0 adultscore=0 clxscore=1015 impostorscore=0
 priorityscore=1501 spamscore=0 malwarescore=0 mlxscore=0 suspectscore=0
 phishscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503140075

A lot of DisplayPort bridges use HDMI Codec in order to provide audio
support. Present DRM HDMI Audio support has been written with the HDMI
and in particular DRM HDMI Connector framework support, however those
audio helpers can be easily reused for DisplayPort drivers too.

Patches by Hermes Wu that targeted implementing HDMI Audio support in
the iTE IT6506 driver pointed out the necessity of allowing one to use
generic audio helpers for DisplayPort drivers, as otherwise each driver
has to manually (and correctly) implement the get_eld() and plugged_cb
support.

Implement necessary integration in drm_bridge_connector and provide an
example implementation in the msm/dp driver.

The plan is to land core parts via the drm-misc-next tree and MSM DP
patch via the msm-next tree.

NOTE: The first patch now depends on the drm-misc-next _and_ msm-next
trees, as MSM HDMI driver was switched to DRM_BRIDGE_OP_HDMI. The
easiest option is to wait for msm-next to be merged to drm-misc-next
(through drm-next).

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
Changes in v6:
- Added DRM_BRIDGE_OP_DP_AUDIO and separate set of DisplayPort audio
  callbacks to the drm_bridge interface (Maxime)
- Link to v5: https://lore.kernel.org/r/20250307-dp-hdmi-audio-v5-0-f3be215fdb78@linaro.org

Changes in v5:
- Rebased on top of linux-next, also handling HDMI audio piece of the
  MSM HDMI driver.
- Link to v4: https://lore.kernel.org/r/20250301-dp-hdmi-audio-v4-0-82739daf28cc@linaro.org

Changes in v4:
- Rebased on linux-next, adding DRM_BRIDGE_OP_HDMI_AUDIO to Synopsys QP
  HDMI driver.
- Drop outdated comment regarding subconnector from the commit message.
- Link to v3: https://lore.kernel.org/r/20250219-dp-hdmi-audio-v3-0-42900f034b40@linaro.org

Changes in v3:
- Dropped DRM_BRIDGE_OP_DisplayPort, added DRM_BRIDGE_OP_HDMI_AUDIO
  (Laurent, Maxime)
- Dropped the subconnector patch (again)
- Link to v2: https://lore.kernel.org/r/20250209-dp-hdmi-audio-v2-0-16db6ebf22ff@linaro.org

Changes in v2:
- Added drm_connector_attach_dp_subconnector_property() patches
- Link to v1: https://lore.kernel.org/r/20250206-dp-hdmi-audio-v1-0-8aa14a8c0d4d@linaro.org

---
Dmitry Baryshkov (4):
      drm/bridge: split HDMI Audio from DRM_BRIDGE_OP_HDMI
      drm/bridge: add function interface for DisplayPort audio implementation
      drm/bridge-connector: hook DisplayPort audio support
      drm/msm/dp: reuse generic HDMI codec implementation

 drivers/gpu/drm/bridge/lontium-lt9611.c        |   2 +-
 drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c   |   1 +
 drivers/gpu/drm/display/drm_bridge_connector.c | 160 +++++++++++++++++++------
 drivers/gpu/drm/msm/Kconfig                    |   1 +
 drivers/gpu/drm/msm/dp/dp_audio.c              | 131 ++------------------
 drivers/gpu/drm/msm/dp/dp_audio.h              |  27 +----
 drivers/gpu/drm/msm/dp/dp_display.c            |  28 +----
 drivers/gpu/drm/msm/dp/dp_display.h            |   6 -
 drivers/gpu/drm/msm/dp/dp_drm.c                |   8 ++
 drivers/gpu/drm/msm/hdmi/hdmi_bridge.c         |   1 +
 include/drm/drm_bridge.h                       | 122 +++++++++++++++++--
 11 files changed, 268 insertions(+), 219 deletions(-)
---
base-commit: 613af589b566093ce7388bf3202fca70d742c166
change-id: 20250206-dp-hdmi-audio-15d9fdbebb9f

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


