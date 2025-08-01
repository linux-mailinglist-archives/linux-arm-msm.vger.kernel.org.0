Return-Path: <linux-arm-msm+bounces-67358-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 41280B182D9
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Aug 2025 15:52:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id ABDD61C21DEB
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Aug 2025 13:52:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 62CF426C3A7;
	Fri,  1 Aug 2025 13:51:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HBASkNa/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50DFA2690D9
	for <linux-arm-msm@vger.kernel.org>; Fri,  1 Aug 2025 13:51:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754056284; cv=none; b=FJJcrgLlfrERdzkI+8V9TaKw5URgYPk/NCFZycxYCUtUjznkmgL1Ql1RNO7LmgwgU5ed0QH8sdW1WNtV0o3EKHwc8KOtpoQ9QENeHLFAVdycGOQJwZkn8Z0Ih2uonljf1LYpAshVMdEHNimwXX/3sFWa/9xOE0qIW2SwKABIe64=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754056284; c=relaxed/simple;
	bh=R+5orXaZWYFqlHQCgWzWcWIKZBQ4MU2KJjCzPihl1hE=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=PWj6u8h95FQx7uPfvqVnVEp5ttfzTsF+JmOJtn0ETqvH6PhEK5nuAq3U4uY5izrZ/P2lUWNKHb7+HphvY1oYu+LnVgu/qVM0C8GiIBFNZ9zidGMBUZ47mmXyJ9lYLrNClTTcoFy2EsycK4IScEUKJuRBDb7l5bZb5crwIxfoaFQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HBASkNa/; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 571934HW006838
	for <linux-arm-msm@vger.kernel.org>; Fri, 1 Aug 2025 13:51:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=R5/BhHZWXHfoz2PoAt8iPP
	dFYjTG2bedIk3AU8wQfSM=; b=HBASkNa/Hs0jzEUfn96lq/l0dTsR7WwCRZ9RvA
	qB9MjzTzt1vriGZRyYaQRSKNBcJgKm9wvwqONDJYP7GuRxfNATw1LsVhdEFVFbYD
	7wjrslaRLBoAkTJ3d5iZvYr06nWoUswLyIortj2vIabtDE1ebc3o6deiCd+FmOvr
	GZGjRkmVCxJr9M0d+3GCiJZgbsp2epP/OmnI8FmK0sbnz2X8sashd2IDdyAZEAoK
	e8yQE6Lr6WorHOPbMZqWkd5AJii2P8o1CBZYEFA2k5jSqMatJLyH51+Dv/S/f6bp
	ZLVkr94qUy7F3dpg5oxw9MtqphMTwrKwZHO63y0nyslNS37A==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 484pm2uvgf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 01 Aug 2025 13:51:19 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4ab801d931cso41442881cf.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 01 Aug 2025 06:51:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754056279; x=1754661079;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=R5/BhHZWXHfoz2PoAt8iPPdFYjTG2bedIk3AU8wQfSM=;
        b=xF7bDePCDmAIhdToClSqH/2Z3imlZio2ivw5w7IRcZBTFmIzWiV4MaJDHGsSYNVq5m
         Qk/ez2asXiUitMEe1IWhg/FfSEMnrEXRbaaoEec+pYpgD5Bzr0HJs96i8GMf/wxykGcC
         cKfecPO2TcfVgqM+BLHiH5t+NFmvUIdfjBSsViCZL7tXNFK8onB0VwoS5RK2/VAoV3hI
         AC9oyf3Z/lMNaRQEBRsVplSNoQXk5dsO47z6miHo31kSjLv3pa0eNHlcwkLjqWzOCJrK
         fJH41NCdI4Plwr7f5rDOST7NLiE+LECbacaFy230Zd+xToEyHwRKbW1G2FvUTHkYEZ2v
         pFPQ==
X-Forwarded-Encrypted: i=1; AJvYcCWWUKZ7bL67LK0iEi7HurpMT1h7Gnnl3LmeM3idruiBpJIhOuQx49XNuWa5QhZs1ck5Umk1rAn56GnG797U@vger.kernel.org
X-Gm-Message-State: AOJu0Yw6l5MeqlZgWU9WJY1evigePpSA1aI2PuhhN2HmS0GUp/NdbTq/
	FR+CvALCfgutk5bRGC057LXthrukYgE0StqOJ/nDH8PFyfhL1ExkO/FI+086xMCarnuuAkSbFFR
	xRhgtYd+MR+R1g6Wuv59FY/4S5Nd8PRPMHbvGEUE91J+eNiVuQZ6v3TGKJ3w7el+hPSmH
X-Gm-Gg: ASbGncvleJXBjB9t6oPGVxmqPzCkydZ3Uh98HiqZnKzPnAJT1S/YQfi6cE5RDxHPkxY
	3LcM84PX0ZvShAStYlhd/hlLUMRt6HMunhTQ8NevnoTUOR2n5lzojBC+AJ9FQElUu6NKEeYrpar
	sswDln6ow4hmtZwtxYnqJmJYP7akjz36UFIZHHDovmI5DbIJh1WShKUeg5HcPBD+besA70XFg/n
	kNJixaBVyx4L56YefLJpAjKIXHADSdilbDjGxSQoUciv2b6OIZi3OFg4yW2OWDpeUJ69AGEjNT3
	+0Opwol5s4VJYRthVm8UfjsAKL3gv/tgEqaxqvjsX3/MMxciJoBDS/Ys0D32CwmTw7tGnmfSbdo
	C6nXbjD+6DIXgdpgvbZAKANzpQd6XG51yPMBY6+WRDLKCpF8DV3rv
X-Received: by 2002:ac8:5784:0:b0:4ab:95a7:71d1 with SMTP id d75a77b69052e-4aedbe7beb9mr161744231cf.55.1754056278871;
        Fri, 01 Aug 2025 06:51:18 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFtbade6pZ9wkxnorEF6axWOtrohHvqQculMvY2mHe46exVpYNBH602aw6FU7DeF5T4f4fIgQ==
X-Received: by 2002:ac8:5784:0:b0:4ab:95a7:71d1 with SMTP id d75a77b69052e-4aedbe7beb9mr161743521cf.55.1754056278246;
        Fri, 01 Aug 2025 06:51:18 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-33238273006sm5917801fa.9.2025.08.01.06.51.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Aug 2025 06:51:17 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH 0/8] drm: writeback: clean up writeback connector
 initialization
Date: Fri, 01 Aug 2025 16:51:08 +0300
Message-Id: <20250801-wb-drop-encoder-v1-0-824646042f7d@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAEzGjGgC/x3MMQqAMAxA0atIZgNVKFWvIg7aRM3SlhRUKN7d4
 viG/wtkVuEMU1NA+ZIsMVR0bQP+XMPBKFQNvemtGUyH94akMSEHH4kVR7ca7+xGlhzUKinv8vz
 HeXnfD6NH1jNhAAAA
X-Change-ID: 20250801-wb-drop-encoder-97a0c75bd5d7
To: Jani Nikula <jani.nikula@linux.intel.com>,
        "Kandpal, Suraj" <suraj.kandpal@intel.com>,
        Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
        Rodrigo Siqueira <siqueira@igalia.com>,
        Alex Deucher <alexander.deucher@amd.com>,
        =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Liviu Dudau <liviu.dudau@arm.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>,
        Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2072;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=R+5orXaZWYFqlHQCgWzWcWIKZBQ4MU2KJjCzPihl1hE=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBojMZSfeMebHGzi1ad5D9OJIiWxXkAsbLdE3xg4
 nZazyGjsZCJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaIzGUgAKCRCLPIo+Aiko
 1SdmCACyivvAMPFOURSFjenFZ8ROTLDqjmHCkE57/8pbDDtOmnvDfJ7Fi6i01/G4wEPnTGHed44
 N+uX0xC10aDYDljZbg9Ye2oCBvC8b8VJfxf1JuBphl5iqinO8bjED8LaJHe/Z1IQHal1TB2a/oo
 PG6bYJEhwq7tv9+s0dTyKqvksmESoD0WDb1DipCPoHx0hVqHvZ1tmNdtf7u/JgHibuAZQ45snAg
 0cRP4v//GNyZU6xiXtGe3Y7K95lbOvjZiSFO2fwFx9NrdrFXD+QX3+JaMCInjnjVO/qKNVipJ10
 sML3WPF2VNylJRkIVccwbCu8kIidTpUocxHhmfn3G52M6APm
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: _tFsxsOWTYg-NsV8Ddcbv0ou_R2QHxor
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODAxMDEwNSBTYWx0ZWRfX861CLzbVelta
 1JiI5o+Nic9B6FZo6bv3KXfwlV8nQvHMZlXfmpiuwZxPwDKT+xb97tmmzRVxZJGH0An+byafsVF
 dkIWqtUJeF4T5g+562GtYl632FGiDV1PWXK4GwzDpbNuR+jONYZ+PztdV2unwK//MlS/ArVoLjO
 +gCUNRieG3J4OxTQ8X+pvCzDx7uWFPgjVRg2CcIjdoTORH8suzb2VkFBVlsiM4voom4QVBDUPiU
 XlNgATRUF9WGtf08SRE56jvUoPHjjHMhJ/R+M1wn1SoP0g2u7HKxZOKijnRVV8OrsXs0/ZGHFw+
 pZwviMGlbrdHC8/do8cSYmQJqzMiBxvFSnwl999sdwwAceEHchc7//9aR4RmzfcPnRjJnZh2FyT
 i4acLosPtjCqH/QaWUIoyLO2Eth7IZmn6i3l1wkR5UIXYWlGu5sw8wcdIYDQoCVl+IIPYeZP
X-Authority-Analysis: v=2.4 cv=HfYUTjE8 c=1 sm=1 tr=0 ts=688cc658 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=cFjmsF-WLDi_aLc5EnEA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: _tFsxsOWTYg-NsV8Ddcbv0ou_R2QHxor
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-01_04,2025-08-01_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 clxscore=1015 bulkscore=0 suspectscore=0 impostorscore=0
 spamscore=0 lowpriorityscore=0 adultscore=0 mlxlogscore=890 phishscore=0
 priorityscore=1501 malwarescore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2508010105

Drivers using drm_writeback_connector_init() / _with_encoder() don't
perform cleanup in a manner similar to drmm_writeback_connector_init()
(see drm_writeback_connector_cleanup()). Migrate all existing drivers
to use drmm_writeback_connector_init(), drop
drm_writeback_connector_init() and drm_writeback_connector::encoder
(it's unused afterwards).

This series leaves former drm_writeback_connector_init_with_encoder()
(renamed to drm_writeback_connector_init as a non-managed counterpart
for drmm_writeback_connector_init()). It is supposed to be used by
drivers which can not use drmm functions (like Intel). However I think
it would be better to drop it completely.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
Dmitry Baryshkov (8):
      drm/amd/display: use drmm_writeback_connector_init()
      drm/komeda: use drmm_writeback_connector_init()
      drm/mali: use drmm_writeback_connector_init()
      drm/msm/dpu: use drmm_writeback_connector_init()
      drm/msm/dpu: use drmm_writeback_connector_init()
      drm/vc4: use drmm_writeback_connector_init()
      drm: writeback: drop excess connector initialization functions
      drm: writeback: rename drm_writeback_connector_init_with_encoder()

 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c  |  2 +-
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_wb.c   | 18 ++++--
 .../drm/arm/display/komeda/komeda_wb_connector.c   | 30 ++++++----
 drivers/gpu/drm/arm/malidp_mw.c                    | 25 ++++----
 drivers/gpu/drm/drm_writeback.c                    | 69 +++-------------------
 drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.c      | 10 +---
 .../gpu/drm/renesas/rcar-du/rcar_du_writeback.c    | 23 +++++---
 drivers/gpu/drm/vc4/vc4_txp.c                      |  9 ++-
 include/drm/drm_writeback.h                        | 22 +------
 9 files changed, 77 insertions(+), 131 deletions(-)
---
base-commit: 94f208ff622b09309358abaf26d7acca0c318fae
change-id: 20250801-wb-drop-encoder-97a0c75bd5d7

Best regards,
-- 
With best wishes
Dmitry


