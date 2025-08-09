Return-Path: <linux-arm-msm+bounces-68136-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 76B13B1F17A
	for <lists+linux-arm-msm@lfdr.de>; Sat,  9 Aug 2025 02:35:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2DC0FA048C0
	for <lists+linux-arm-msm@lfdr.de>; Sat,  9 Aug 2025 00:35:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CF78E23816A;
	Sat,  9 Aug 2025 00:35:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nU4a4UC9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 270382376F5
	for <linux-arm-msm@vger.kernel.org>; Sat,  9 Aug 2025 00:35:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754699739; cv=none; b=mwbEl9A1DzYRsRpt99EGl/hPQLlfx6qIIiG58Dimio1hnUg4iMigKiihE6Fla7ghYmn2bWj5dtSylZYZJjzVdP25zGvPBz0oQR2pMhYMDoLQXnfq5qTegOsy+iMRFKQpHJDRv9kUYy+KKsOMRsndGfePX+ZpoerAa6zqg0foj4Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754699739; c=relaxed/simple;
	bh=GcppbpLyBA9b1yf2lCD9BuTJMMUuGA+FkmOmn+rmg2s=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=liOUCJXHw+FD8jzLxkGjtuTnwk9YxQklnOYbl0QALMB0jBSMaAT5+xZfnyuyas67fL8mCux4sUyLknKgspSfJe+b4mTY54HHO6Me3qYPpEY+IiWgclBKIs+SyCYUZKF7Szk6reiEm9pHOe49/P6BCqkxvnrou9M26ytM6ohtKJs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nU4a4UC9; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 578EvAdD003579
	for <linux-arm-msm@vger.kernel.org>; Sat, 9 Aug 2025 00:35:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=ZbGX5bxjJoDa8OQ/Re32Qt
	hpJZzf8LuGqJ7nEgpoBBU=; b=nU4a4UC95r8zh3UAkKBuonofP0oxbbv8+V3dDP
	PndUx+IBRExGN8NXOBqhVI7ID2JemTF52Ob6pZDlIe4G1kWt9zrB2ir6P25AXoVy
	WPnzUZD36lEyNS4ggguh0zGywmljQAlOCyJL9qUsDiLP+v95qzukPN8LlziTkU8D
	vpVl5mF9wBYTnWARh7BjZKiO6bEA8Sz4eH43p5rl4kxhsnzR8kmC6C/kQ26ThHx4
	7A0Cw/jboAOjQRKQYxeraPD4JNBiMIWOkwM2Acl+4kyzcoucwVlbhgEDdY+s/YxI
	p6dNVoT+2gBozw1F6iEjkbtk4Pi/TvhGKGhj8jw8z3F1PCGA==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48bpyakhus-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 09 Aug 2025 00:35:37 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-b38fc4d8dbaso3680048a12.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 08 Aug 2025 17:35:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754699736; x=1755304536;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZbGX5bxjJoDa8OQ/Re32QthpJZzf8LuGqJ7nEgpoBBU=;
        b=B9iqWR6L/7E815xI0VgVW7UqX8x8eLLT5lnD8lLGpC/1wiejTZivpoVnOO7qNW1A1w
         oskJRTT5rMtoE6J/PBjPAhEbzVhOQ+cQbnv5+LQhAH0uqlWcCGJAYXLSAEG+yBB5vbF1
         Tbc2Lt3mJkUeCQdB2jzyt1v85fw4TT1Ji71pClixQfSZFsHfKeHA/HvrzwTtne52yYw5
         bPYJfiLB+6e6LmX8RDNedbC+egFdkdl9yNOrd3PhPjMutfj5pikheHUx02SSQcxn1vna
         cTV2e8jHBD7znlHsl20/peTycicmWB3ZEKuUHNP7cTRJEasPmR9MdbrFALBT1RmQgA/7
         I9lw==
X-Gm-Message-State: AOJu0YyPunprtSqjO/4ZWLeqiEACDAhHBfmTr4l+oeFRPE6hIGnwZNzJ
	dbXF+R0oPgdfrMQ0wijMx/O80DObgzptIoG9x0YSgCaRIpBXTys+Ykn/iwQZHkVCy3KcQPpYSex
	iNKX8ZWRV7BAX9O3eRZOPKDXvSgOdWpLGisBAKC/V37aYnKsUgJsDA2Y0KtSKwwerM0+NHeaZBJ
	mi
X-Gm-Gg: ASbGncsw2SEurtfgyRiliU2gLe6kt0s11Ozr+3X/WW3Gphz9uK6MGL6knasxPGeFVxF
	mr58r8mXXnQZB7B/XbXWJsTNCZcSAgUUfGT5OA/NYR4IJf90qNlYLM/R/s0SUZu9cO9+48JH6wp
	YakKsJKYqPwwyxR7xXtzJmtvCGooKNYmf0LR9ks3ciH+wQl/DdfVAmpfnn9FS2gGIPAZYu+ZbOZ
	M+6aEUpO6i9Tb1dvo0OkP04BfICFQ4tmZvVaiD4dXpy7CfFxTbwhR3S7R7Etw52dZ9NHlqSjK4b
	qM6JX6CpY2G6dNBKs1PkeCToUVkIGXcMOVvCsr2EKh2O1IIX1lIeldNi3Tj0WoKzh7+MCF1YBOU
	WtY1mHQaTsdgCxC17HxE6R4+w
X-Received: by 2002:a17:902:cf04:b0:240:7308:aecb with SMTP id d9443c01a7336-242c21ff8f9mr89428245ad.32.1754699736246;
        Fri, 08 Aug 2025 17:35:36 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGi+7fe4uPTv690KlXyI03z9asGDkSfIXdbnLoKLJoKkTTJSV1FDnOhicgZI/Utxq39clnAPQ==
X-Received: by 2002:a17:902:cf04:b0:240:7308:aecb with SMTP id d9443c01a7336-242c21ff8f9mr89427815ad.32.1754699735782;
        Fri, 08 Aug 2025 17:35:35 -0700 (PDT)
Received: from jesszhan-linux.qualcomm.com (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-241d1ef678dsm219865355ad.39.2025.08.08.17.35.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Aug 2025 17:35:35 -0700 (PDT)
From: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
Subject: [PATCH v2 00/12] drm/msm/dp: Drop the HPD state machine
Date: Fri, 08 Aug 2025 17:35:12 -0700
Message-Id: <20250808-hpd-refactor-v2-0-7f4e1e741aa3@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAMCXlmgC/1WMQQ7CIBBFr9LMWhoYijWuvIfpglIqJLa0oETTc
 HfHunIzyZv//9sg2ehtgnO1QbTZJx9mAjxUYJyeb5b5gRiQo+IKJXPLwKIdtXmEyNrGouqVOiL
 XQJOFEv/addeO2PlEtfduz+L7/YlaIf5FWTDOpDS9NieUo2wuIaV6feq7CdNU04GulPIBJLDWG
 K8AAAA=
X-Change-ID: 20250523-hpd-refactor-74e25b55620a
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Yongxing Mou <quic_yongmou@quicinc.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
X-Mailer: b4 0.15-dev-a9b2a
X-Developer-Signature: v=1; a=ed25519-sha256; t=1754699734; l=2514;
 i=jessica.zhang@oss.qualcomm.com; s=20230329; h=from:subject:message-id;
 bh=GcppbpLyBA9b1yf2lCD9BuTJMMUuGA+FkmOmn+rmg2s=;
 b=4JF/mkzCvIDHNqLd9NKmhnVuxsW0hiYQreE5SpMBbfbel+6PDV1d5C+Cb38ZRK1JqxcUnFZ4s
 mmHrn7CAiP5AMbC+8MtborBGBd2E4rpRpdWZ1V5/XNJtMoaJgUAEPlk
X-Developer-Key: i=jessica.zhang@oss.qualcomm.com; a=ed25519;
 pk=gAUCgHZ6wTJOzQa3U0GfeCDH7iZLlqIEPo4rrjfDpWE=
X-Proofpoint-ORIG-GUID: v_FQm4q4pIrVMcXLuaPCPzGUuWvm219Z
X-Authority-Analysis: v=2.4 cv=MrlS63ae c=1 sm=1 tr=0 ts=689697d9 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=e5mUnYsNAAAA:8 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=ykQkPS02loRjcs06OSIA:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA2MDAwOSBTYWx0ZWRfX9jNwFnAbdd2w
 K9O7IK6xdlNkXLtVfRJbhbpvnlTpUYwoRJFYdNNmokrsTg6ewB+S1uoURLiEfKzYPEm/ZpiTi1b
 KIA0YuYk7VDm7imq1VO/7CuzQhbpeFTKp65pdEErCWwVcKCJZ4TcUh4T+Z8B/SO8SxVvJflcAWn
 /z1YElswXzuh0FGprzIJIkFvemJlxCPU4Jg6RhGnoaAnejs+iY9qXt0baFtZPDSiOmszt1Dr09p
 mY+zdboJlFACs85Z05izQRMtKlDKT37hADj2o0yocyHqo6F1/jILsSnrfk1lr9Q5kFjbpoikfiL
 PZ1DuiYBzJWxwYakFVZatL8BMeQ3sHI+JLlm1CEj9CAR/HtRgf2rdbgX2yJGo6gZ0FWtJtAEhH/
 VrvomXgX
X-Proofpoint-GUID: v_FQm4q4pIrVMcXLuaPCPzGUuWvm219Z
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-08_08,2025-08-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 adultscore=0 priorityscore=1501 phishscore=0
 spamscore=0 bulkscore=0 clxscore=1015 malwarescore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508060009

Currently, all HPD interrupt handling must go through the HPD state
machine.

This has caused many issues where the DRM framework assumes that DP is
in one state while the state machine is stuck in another state.

As discussed here [1], this series:

- Removes the state machine
- Moves link training to atomic_enable()
- Changes the detect() behavior to return true if a display is physically
  plugged in (as opposed to if the DP link is ready).
- Remove event queue and move internal HPD handling to hpd_notify()

This has been validated on x1e80100-crd and sa8775p-ride. Any help
testing on other platforms/use-cases would be appreciated!

[1] https://patchwork.freedesktop.org/patch/656312/?series=142010&rev=2#comment_1201738

---
Changes in v2:
- Dropped event queue (Dmitry)
- Moved internal HPD handling to use hpd_notify() (Dmitry)
- Reworked bridge detect() to read DPCP and sink count (Dmitry)
- Moved setting of link_trained to plug/unplugged handling
- Dropped msm_dp::connected (Dmitry)
- Squashed all hpd state related patches (Dmitry)
- Link to v1: https://lore.kernel.org/r/20250711-hpd-refactor-v1-0-33cbac823f34@oss.qualcomm.com

---
Abhinav Kumar (1):
      drm/msm/dp: remove redundant checks related to ST_DISPLAY_OFF in plug handler

Jessica Zhang (11):
      drm/msm/dp: fix HPD state status bit shift value
      drm/msm/dp: Fix the ISR_* enum values
      drm/msm/dp: Read DPCD and sink count in bridge detect()
      drm/msm/dp: Move link training to atomic_enable()
      drm/msm/dp: Drop EV_USER_NOTIFICATION
      drm/msm/dp: Use drm_bridge_hpd_notify()
      drm/msm/dp: Handle internal HPD IRQ in hpd_notify()
      drm/msm/dp: Drop event waitqueue
      drm/msm/dp: Return early from atomic_enable() if cable is not connected
      drm/msm/dp: drop the entire HPD state machine
      drm/msm/dp: Add sink_count and link_ready to debug logs

 drivers/gpu/drm/msm/dp/dp_ctrl.c    |  22 --
 drivers/gpu/drm/msm/dp/dp_ctrl.h    |   1 -
 drivers/gpu/drm/msm/dp/dp_display.c | 580 +++++++++++-------------------------
 drivers/gpu/drm/msm/dp/dp_display.h |   1 +
 drivers/gpu/drm/msm/dp/dp_drm.c     |  20 +-
 drivers/gpu/drm/msm/dp/dp_drm.h     |   1 +
 drivers/gpu/drm/msm/dp/dp_reg.h     |   2 +-
 7 files changed, 187 insertions(+), 440 deletions(-)
---
base-commit: 8290d37ad2b087bbcfe65fa5bcaf260e184b250a
change-id: 20250523-hpd-refactor-74e25b55620a

Best regards,
--  
Jessica Zhang <jessica.zhang@oss.qualcomm.com>


