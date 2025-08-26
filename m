Return-Path: <linux-arm-msm+bounces-70926-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AA0B5B37045
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 Aug 2025 18:29:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6B1957C003D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 Aug 2025 16:29:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 216AB1EB36;
	Tue, 26 Aug 2025 16:29:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RBDkVS9/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C2A22C15B6
	for <linux-arm-msm@vger.kernel.org>; Tue, 26 Aug 2025 16:29:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756225775; cv=none; b=OH6+UWB5LIpixCDAwHg+ZP8JHhsbGVEQ8j75qtg7DFWg2dGSIQQXz8nlC97nk6rHiAyTpXN2phpeqrD6yVrVhy7/5VTzo8+moEU/rPpsMHL6PBe+G/z7+9WrVcNGDMxqdPT8eEMTauDTfNcN4RNmi7PjopeHHn0FivejWUmTTRg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756225775; c=relaxed/simple;
	bh=zIT8NrNqDT0uRXTS9ruMVROOY+MT5CzxCuXnBEYX0mY=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=LSG/SNorMYi8f8LoW+v3/h0cn4QnmzYxzQtlIBw93pj3B0roCPlTP98OXIwI36+I8rsWo+aQ8fxrqYWHrq8aGp6pD0BK4hDJFEEXPdd9Es8eTcbTMLPsl1N9FJRUN2pSaJ7fCcxiYzPyd/w1udhcQGdkJV+CmvH+ujVGeAGRH0U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RBDkVS9/; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57QBqV2x000801
	for <linux-arm-msm@vger.kernel.org>; Tue, 26 Aug 2025 16:29:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:reply-to:subject:to; s=qcppdkim1; bh=Tscxk8lnA09Aw
	TJLl9Pq/EJ+dx1JKgEznU64KBSUuEA=; b=RBDkVS9/IB7/uxFNLqncOQUDSexlD
	eT3nY+9FMXW8mWFEAg93FKfcwKN78om+tt13IRBQRCHYpwb/oYxpHw4KQn44GKTw
	Nl57Zqez5aq7/m6zm/xSKt98x7l5x1MD3iHRgrtwlf96hhJWLcWphWhG2EkalpxK
	6zw7C9id6mFgM2JyfHhBADLwYSwHvOuhOncC6CCD+oSQfRMwLvp/kvFr7yqYFV6K
	yduBazbP2KxdmvsM1/A1gt7VvKTRkjatza543omvsK37aLDCxJ7Pk2qNRt+jw2sd
	nk5S3mirq0jphbNL/hoSdU5RD4d7ecaxLkw0mzDYCPy2eIIVtaztpr6zw==
Received: from mail-ot1-f69.google.com (mail-ot1-f69.google.com [209.85.210.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48q5xpss9c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 26 Aug 2025 16:29:32 +0000 (GMT)
Received: by mail-ot1-f69.google.com with SMTP id 46e09a7af769-74505aaf1bcso3066844a34.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 26 Aug 2025 09:29:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756225771; x=1756830571;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:mime-version:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Tscxk8lnA09AwTJLl9Pq/EJ+dx1JKgEznU64KBSUuEA=;
        b=Up9QUbWeEEfPc3UE+XUTlfM3dqFiqGMX36/VQJwWH1aO4uqfVmOmQuNFuKs75PAqW6
         26lBM193etJWW0FKa5cwTUMtjP+wra9qGnurQ+f7pQMya1iMYuoxXJ8Ws9X0GEKH5wOO
         qgNGpEhVMHE0Hjghh6q7KeJOxH/HeFHceeFKaQq5bL6hB1g+zL4nsOGlckzGWNyBnTw6
         nvT8tgqwGfogGkWMX1F+RVHnRgLyj9MA0v8skMXpf585nNP3W6gZYEv2lhih0caDXWW8
         pVVO7JPBlHMd2CV6/WQCobJFmPtxtDlFFCG1CaKtHsvFO9NTbWKTVaulliBvNRVpRtx6
         1mow==
X-Forwarded-Encrypted: i=1; AJvYcCVcZiRN1UpilOQ3MGNIBH1oHVuPoYeofEgAFQyZCru41UmqfLpdil/jsy6AwjQhPezbu8JYxuN7VFSgmmcp@vger.kernel.org
X-Gm-Message-State: AOJu0Yz4v41skk7jzee4nfk84LwiQrXu9wKjcBe73H94xXSQ4mfKgfRd
	Ix5dBy9y2bo3kfCK3rOdPsKwJeOB98QbhmJ0dThuoxEXrnKRY4VWiJMHB2LzfyKHqAzt/koW2xL
	3AokIB7GjWG464RaZ2KAqo6DzDguZ+IBs38QswBkpgqQ99h/1OfpwDDaqks1ykYFGQxyMJjBedf
	H8UqhXDQo+L3f4/QoK2CMJpapB9t3bKknXwlFhIGFVtQg=
X-Gm-Gg: ASbGncvIcU+oZwIu+eKxS5/QMxKayUhgPNhccoHVI8toybYS/0FdKe/DYIYqx3XrO/Y
	evzuEVZH81hClV2ORcr59Bu6xOxOuggMYMstlL9jQNw5VKeFdLR7VeumwpFmodPaNLsQfrB8++P
	mmdBRpBFke7jfuTs8VqCajBtc7Z4O/V48WrvWftLmkGhs8N20yFIIa
X-Received: by 2002:a05:6808:23d2:b0:437:761b:961d with SMTP id 5614622812f47-4378537407amr8347892b6e.44.1756225771390;
        Tue, 26 Aug 2025 09:29:31 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFDSLcrGe9xj0YCnQ9UzxwRoOzPFqv44GvrHidL3Q3zNYyfxHnl+RlB9NftBJjb1WMFmYiTyMfoqSggWXktKCA=
X-Received: by 2002:a05:6808:23d2:b0:437:761b:961d with SMTP id
 5614622812f47-4378537407amr8347868b6e.44.1756225770863; Tue, 26 Aug 2025
 09:29:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Reply-To: rob.clark@oss.qualcomm.com
From: Rob Clark <rob.clark@oss.qualcomm.com>
Date: Tue, 26 Aug 2025 09:29:18 -0700
X-Gm-Features: Ac12FXwFhQA5Ic16p1I53DRT2lsUPtvc6jq5BH8o7osm_vNSb7-qXftHxP2nqCQ
Message-ID: <CACSVV02+u1VW1dzuz6JWwVEfpgTj6Y-JXMH+vX43KsKTVsW+Yg@mail.gmail.com>
Subject: [pull] drm/msm: drm-msm-fixes-2025-08-26 for v6.17-rc4
To: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: "open list:DRM DRIVER for Qualcomm Adreno GPUs" <dri-devel@lists.freedesktop.org>,
        "open list:DRM DRIVER for Qualcomm Adreno GPUs" <linux-arm-msm@vger.kernel.org>,
        "open list:DRM DRIVER for Qualcomm Adreno GPUs" <freedreno@lists.freedesktop.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Connor Abbott <cwabbott0@gmail.com>, bjorn.andersson@oss.qualcomm.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=KOlaDEFo c=1 sm=1 tr=0 ts=68ade0ec cx=c_pps
 a=z9lCQkyTxNhZyzAvolXo/A==:117 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10
 a=e5mUnYsNAAAA:8 a=g1uuwZcmdHHBDmomJxkA:9 a=QEXdDO2ut3YA:10
 a=EyFUmsFV_t8cxB2kMr4A:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-GUID: 7BDwiEQ24QE887MHsDE-LbSHxFQFRuf8
X-Proofpoint-ORIG-GUID: 7BDwiEQ24QE887MHsDE-LbSHxFQFRuf8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIzMDAzMyBTYWx0ZWRfX0l2JKLixEo93
 sOWbXJOIn+HugXvLD1bWGwUOmI1tp9NgVM7O2HzzZGja8ZFxhlZID8MrJFa3wMjThEP/WRm1XVb
 GVbg/u+fz7169gjswgZ/6JfStrLl/Jz+kOBfMmAwkMHKuJDe9a3ywanrOIuVOl5YuT5+HkeqEDW
 UJRFdEfAMjuvK1Y5cjVlXMcZymZJSBeIdvDQ9udgsjZklFpQKRN6c4o4O5SQf/xYQmaY9Azxn0t
 EwEKV+zMtMq9boOnwwaiohZvtoCJxvZ7JApiRftjenlgHsNGwJKvQEpT8pfglWMULp9StU50MP8
 7RPPXzN26JW/3Sw2r2U3dxKeEuG1Cfz36NhzAJhl8ib0JsYg/2gGBvrMY6UQzIJmYhpfDq89hph
 a+RiY6m7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-26_02,2025-08-26_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 bulkscore=0 adultscore=0 phishscore=0
 impostorscore=0 spamscore=0 suspectscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508230033

Hi Dave, Simona,

Fixes for v6.17-rc4.  A bit later than intended, due to gitlab ci
breakage.  (Not completely solved, but I eventually realized I could
workaround it by creating the MR in the main drm/msm tree rather than
my fork.)

Has some soc/qcom/ubwc fixes ack'd by Bjorn to address fallout of
migration to centralized UBWC config provider.

The following changes since commit 8290d37ad2b087bbcfe65fa5bcaf260e184b250a=
:

  drm/msm: Small function param doc fix (2025-07-05 09:59:12 -0700)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/msm.git tags/drm-msm-fixes-2025-08-26

for you to fetch changes up to 3cf6147f2b51a569761e1ef010efbd891e3a3a15:

  soc: qcom: use no-UBWC config for MSM8956/76 (2025-08-25 14:01:26 -0700)

----------------------------------------------------------------
Fixes for v6.17-rc4

Core/GPU:
- fix comment doc warning in gpuvm
- fix build with KMS disabled
- fix pgtable setup/teardown race
- global fault counter fix
- various error path fixes
- GPU devcoredump snapshot fixes
- handle in-place VM_BIND remaps to solve turnip vm update race
- skip re-emitting IBs for unusable VMs
- Don't use %pK through printk
- moved display snapshot init earlier, fixing a crash

DPU:
- Fixed crash in virtual plane checking code
- Fixed mode comparison in virtual plane checking code

DSI:
- Adjusted width of resulution-related registers
- Fixed locking issue on 14nm PLLs

UBWC (per Bjorn's ack)
- Added UBWC configuration for several missing platforms (fixing
  regression)

----------------------------------------------------------------
Antonino Maniscalco (1):
      drm/msm: skip re-emitting IBs for unusable VMs

Ayushi Makhija (1):
      drm/msm: update the high bitfield of certain DSI registers

Bagas Sanjaya (1):
      drm/gpuvm: Wrap drm_gpuvm_sm_map_exec_lock() expected usage in
literal code block

Chenyuan Yang (1):
      drm/msm/dpu: Add a null ptr check for dpu_encoder_needs_modeset

Colin Ian King (1):
      drm/msm: Fix dereference of pointer minor before null check

Dmitry Baryshkov (8):
      drm/msm/kms: move snapshot init earlier in KMS init
      drm/msm/dpu: correct dpu_plane_virtual_atomic_check()
      soc: qcom: ubwc: provide no-UBWC configuration
      dt-bindings: display/msm: qcom,mdp5: drop lut clock
      soc: qcom: ubwc: use no-uwbc config for MSM8917
      soc: qcom: ubwc: add more missing platforms
      soc: qcom: add configuration for MSM8929
      soc: qcom: use no-UBWC config for MSM8956/76

Loic Poulain (1):
      drm/msm/dsi: Fix 14nm DSI PHY PLL Lock issue

Luca Weiss (1):
      soc: qcom: ubwc: Add missing UBWC config for SM7225

Ma=C3=ADra Canal (1):
      drm/msm: Update global fault counter when faulty process has already =
ended

Nathan Chancellor (1):
      drm/msm/dpu: Initialize crtc_state to NULL in
dpu_plane_virtual_atomic_check()

Rob Clark (15):
      drm/msm: Fix build with KMS disabled
      drm/msm: Fix pagetables setup/teardown serialization
      drm/msm: Fix refcnt underflow in error path
      drm/msm: Fix submit error path cleanup
      drm/msm: Defer fd_install in SUBMIT ioctl
      drm/msm: Defer fd_install in VM_BIND ioctl
      drm/msm: Add missing "location"s to devcoredump
      drm/msm: Fix section names and sizes
      drm/msm: Fix order of selector programming in cluster snapshot
      drm/msm: Constify snapshot tables
      drm/msm: Fix a7xx debugbus read
      drm/msm: Fix debugbus snapshot
      drm/msm: Fix a7xx TPL1 cluster snapshot
      drm/msm: Fix a few comments
      drm/msm: Handle in-place remaps

Sasha Levin (1):
      drm/msm: Fix objtool warning in submit_lock_objects()

Thomas Wei=C3=9Fschuh (1):
      drm/msm: Don't use %pK through printk

 .../devicetree/bindings/display/msm/qcom,mdp5.yaml |  1 -
 drivers/gpu/drm/drm_gpuvm.c                        |  2 +-
 drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c        | 47 +++++++++-----
 drivers/gpu/drm/msm/adreno/a6xx_gpu_state.h        | 38 ++++++------
 .../gpu/drm/msm/adreno/adreno_gen7_0_0_snapshot.h  | 19 ++++--
 .../gpu/drm/msm/adreno/adreno_gen7_2_0_snapshot.h  | 10 +--
 .../gpu/drm/msm/adreno/adreno_gen7_9_0_snapshot.h  | 34 +++++-----
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c           |  2 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c        |  2 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dspp.c        |  4 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c            |  4 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c          |  4 +-
 drivers/gpu/drm/msm/dsi/phy/dsi_phy.c              | 59 ++++++------------
 drivers/gpu/drm/msm/dsi/phy/dsi_phy.h              |  1 -
 drivers/gpu/drm/msm/msm_debugfs.c                  | 11 ++--
 drivers/gpu/drm/msm/msm_gem.c                      | 13 +++-
 drivers/gpu/drm/msm/msm_gem.h                      |  2 +-
 drivers/gpu/drm/msm/msm_gem_submit.c               | 72 ++++++++++++------=
----
 drivers/gpu/drm/msm/msm_gem_vma.c                  | 60 +++++++++++++-----
 drivers/gpu/drm/msm/msm_gpu.c                      | 20 ++++--
 drivers/gpu/drm/msm/msm_iommu.c                    | 16 +++--
 drivers/gpu/drm/msm/msm_kms.c                      | 10 +--
 drivers/gpu/drm/msm/msm_mdss.c                     |  2 +-
 drivers/gpu/drm/msm/registers/adreno/a6xx.xml      | 14 ++++-
 drivers/gpu/drm/msm/registers/display/dsi.xml      | 28 ++++-----
 drivers/soc/qcom/ubwc_config.c                     | 23 ++++++-
 26 files changed, 301 insertions(+), 197 deletions(-)

