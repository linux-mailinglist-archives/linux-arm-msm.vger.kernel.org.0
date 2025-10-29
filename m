Return-Path: <linux-arm-msm+bounces-79541-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 20F36C1D99F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Oct 2025 23:39:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 0BC684E04D3
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Oct 2025 22:39:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CCC712C11FB;
	Wed, 29 Oct 2025 22:39:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="o5PE654r";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dOTMthBE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21D5729E0E7
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Oct 2025 22:39:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761777560; cv=none; b=NbsiWcooE4Qbm8VCg8AUYQvJqD9p9eBuTMZ88S3sSWOd76xgp/s4kI3IYYZ0DDQyapdD1kXXw+hMx11dtclhzxRyb/hIR/GA+WWCA9y4DspQapZNG47eJVTETazTqFcJ29/zQS4UXwdRM4BaDvUg55nOugFbIITsiiANVPMR6WQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761777560; c=relaxed/simple;
	bh=NvnPcDhWRaN3O98JoJLOM0OzHgF6MEVYDkhUe8616hI=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=cZBdzyC7OKn9p2RkioaGVuQWYsJF0vK/1QDV6awSnVH9wq4Twsx1smuwrr8kW4DwIAqO6gU37bGX/aQCqgAnwk8nuwV7A2PVZUayh5ARDF7w9LbBkvoJ4c4MuViHmbpXW83srlVVio+4d8xYmzCv0GULc7y9DwvKfBKzwbMIAJc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=o5PE654r; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dOTMthBE; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59TLT9Sg568891
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Oct 2025 22:39:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:message-id:mime-version:reply-to
	:subject:to; s=qcppdkim1; bh=GfdCtPw6bPLdCz2NJuxw867HbnVEAsAQfof
	rlLygFHs=; b=o5PE654r6jeWAa6TqxIJIVAdka9eSdSsWJ1niEo8c4aK+oSovCu
	ByF+2PeXEN5rJVUcQ71nP4xmJDoWebM/BfMKTztuiE9aGHWFiv9uXUqv3YbpTEhF
	rEJ4lwNliTZpmt9xXPbHEsNM1vyrDo7XKFPt9Rn2hXQ62lRvwz1zPA+WGBhwnb5K
	X3mUfNG8mOmpciFwcvOBlLllMyQN9TNAKw/eD+JRG9Y9ge12PYylc9ar71E/A3o7
	DBoLEMRe6HQU/6SpFllSLOoIyCtoBwextaZUhYLCQ7K9+aEc/eEZhtJRBZu1TkPa
	G/FvgRcdZ9t5p2lnkcVoOQ/+c74fUZp6yrg==
Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com [209.85.167.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a3m0bhn6d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Oct 2025 22:39:17 +0000 (GMT)
Received: by mail-oi1-f198.google.com with SMTP id 5614622812f47-44daae8c225so135442b6e.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 Oct 2025 15:39:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1761777557; x=1762382357; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:reply-to:mime-version:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GfdCtPw6bPLdCz2NJuxw867HbnVEAsAQfofrlLygFHs=;
        b=dOTMthBExl4pqhm6RPYyDYtWKzoRhV9xPjQUormz/npJEa0whwg5M9OKp90CX8S76x
         DGSNS6tj11icD1w5vXpPt4qg7l6I0eumSeU/fAkGl1zRBoa9EDQnJuHcqXGnZ5eEdR8q
         /pirbewBgBO+ac5Rp/tkXmMERplnPuJ8bHmj6yqO055YoIZgq59cU7YxKq2a5j2cEhAS
         HTQiM0O8uXOmFMANQnEb/tVysnr6G3HJgg9xFoYqCnBfLKybB9jAYHPOJ5oaQvJtfUfW
         povilS7X8zKl6CWe0W3IVucNBAea9seT6eTXITNwbBg6LwzWp4WryOoy3QA1uKVz56iH
         Xziw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761777557; x=1762382357;
        h=cc:to:subject:message-id:date:from:reply-to:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GfdCtPw6bPLdCz2NJuxw867HbnVEAsAQfofrlLygFHs=;
        b=Wgti6wLA8ddc9wkeTsyN5X3dacbrsBz377S0oGmIK2V1urfPJzeO5SkERJLDUhL6Gb
         N1KuxzejoaI15eMk2ANdz3bzm+Ll3zlcEHmfR5ex+jXRwrvqrKRAfQuhcbI2RuSSgeyb
         UM7fUDUCM/QOeI3mfW8RQyBqJJ92bNLV5hSs5255YOCndvpgm3AY5xGvHAA1jnJUp0uW
         GF7APrPdWWp4FN2R+qdeYUvmSXr9Xa24zmyS9zLXD04qdXgpjOg5EhplktcVAjMAmjVd
         HgeWKzTDjbDOCooMYl0I8wmydQAihwowU390TzoYyyaua9FoI/C7wiKEQDEnCh1ayIfQ
         N8Hw==
X-Forwarded-Encrypted: i=1; AJvYcCW/o1dGoLFBjurqxMxgDvVHnSgi0JIvTi/kvOzxei5n10J8FGXla6w1qMN6Pzy5jKAYrBBTy5Id9jb17ri/@vger.kernel.org
X-Gm-Message-State: AOJu0Yy5XTpZD/lxrfQAjk9bJ9XqHqvd1E0kyMUU97Ye/RaDcLBUfYOD
	PrhUGkJos4hMS4DlEJJ3SsFKVP8hjkiJUKpkj6L24CK12Y21giZDXGJKdht73pisGtIMhhx7ZCR
	DVdO3jPATKu+2axYx1TRnDeTAZXQJJQCEefkCOj+y3UrYfGnXqbTkwADgQjfxAbePhDUR1Q3F1/
	ItzcV7+TqGN2lK3njuiHmVTF+Ian0LveTuH/RbFmhFplE=
X-Gm-Gg: ASbGncvM11X7CZB0HqwOfXR4TdXoVW9s/eRyZI3N3Gl7f7dC5J3or7iplGzbc+u++8X
	sS9WjtML6MqBquEXX+O8RtNwpMRVEJ95PDE2OhVqSHTwoX3f0l8rD9JuRgmlHcKjinzWgixiTmw
	0R2IZWjhQ0w2DftbBWnvbOJxgrYgzJpWnOFlINv4xPSR7QBv3cD6YplLT4I6mDrE6KuxEltqEJi
	y+ql7E9tsU7av0=
X-Received: by 2002:a05:6808:23cd:b0:44f:6d6e:4cbe with SMTP id 5614622812f47-44f7a8e3956mr2136734b6e.67.1761777557277;
        Wed, 29 Oct 2025 15:39:17 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH3HlkupTvqJYVRFTeGTmjSeesA7cTPEVXZN+CwCSgAzsEOafg+rPeCALbQcVcumNLTVJLdN28h7dYrU0JDb18=
X-Received: by 2002:a05:6808:23cd:b0:44f:6d6e:4cbe with SMTP id
 5614622812f47-44f7a8e3956mr2136725b6e.67.1761777556887; Wed, 29 Oct 2025
 15:39:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Reply-To: rob.clark@oss.qualcomm.com
From: Rob Clark <rob.clark@oss.qualcomm.com>
Date: Wed, 29 Oct 2025 15:39:06 -0700
X-Gm-Features: AWmQ_bnkiKNoJ6RaDb3we3GgsgfEjFtJn4lSVSRUYFiGDnEd9Np8oOhF_7syvL4
Message-ID: <CACSVV03kUm1ms7FBg0m9U4ZcyickSWbnayAWqYqs0XH4UjWf+A@mail.gmail.com>
Subject: [pull] drm/msm: drm-msm-fixes-2025-10-29 for v6.18-rc4
To: David Airlie <airlied@gmail.com>
Cc: "open list:DRM DRIVER for Qualcomm Adreno GPUs" <dri-devel@lists.freedesktop.org>,
        "open list:DRM DRIVER for Qualcomm Adreno GPUs" <linux-arm-msm@vger.kernel.org>,
        "open list:DRM DRIVER for Qualcomm Adreno GPUs" <freedreno@lists.freedesktop.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Vignesh Raman <vignesh.raman@collabora.com>
Content-Type: text/plain; charset="UTF-8"
X-Proofpoint-ORIG-GUID: 3ITkhi6MCu8PXGEU-aMxh3vT3XmWbMBo
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDI5MDE4MiBTYWx0ZWRfXwlLivOfq14MX
 eNrjnvLy6Dft/ng+Un30HgVdWxD6j0yTyCSc32iPTYfaa0+lHeEGIOFB6xof/Lk/feUaSI2XYmn
 9GrhMj76KaUhhh13a+yZP3vgFnQhzabuLnAOo9NotNCuVfRi0F/atPc1kMwlOQ/zA5QmLEaTYeK
 CTDR94y4CNBcuVR/l7SBp1kaCmOd/DbWWPzkVPybsaMGf/fJ9FEMUh5ev9qukeDj10HsdWijHrO
 xM8nY3beDVuIZdxTxYkSMmHC5dh5IUYsCYipZ1XL27mRGOPavUnRDpf39NtLn6XpewVkFDJ+aME
 nXizuEtyoB8I8WrZhw0+wGi0jPB/nSDIiDNeFFkHzzVOzP7Gs+TgJSfqrdUv0I7ZeXzmc/JUKk+
 T/WTnSBmBfKb3H8CjzxExpcRCBbddA==
X-Proofpoint-GUID: 3ITkhi6MCu8PXGEU-aMxh3vT3XmWbMBo
X-Authority-Analysis: v=2.4 cv=YLySCBGx c=1 sm=1 tr=0 ts=69029795 cx=c_pps
 a=4ztaESFFfuz8Af0l9swBwA==:117 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=8ni5ubgBzJBEx_E3fT0A:9
 a=QEXdDO2ut3YA:10 a=TPnrazJqx2CeVZ-ItzZ-:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-10-29_08,2025-10-29_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 bulkscore=0 spamscore=0 malwarescore=0
 adultscore=0 lowpriorityscore=0 clxscore=1015 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2510290182

Hi Dave,

Fixes for v6.18-rc4

The following changes since commit b5bad77e1e3c7249e4c0c88f98477e1ee7669b63:

  drm/msm/registers: Sync GPU registers from mesa (2025-09-10 14:48:12 -0700)

are available in the Git repository at:

  drm-msm-fixes-2025-10-29

for you to fetch changes up to f5d079564c44baaeedf5e25f4b943aa042ea0eb1:

  drm/msm/dpu: Fix adjusted mode clock check for 3d merge (2025-10-29
00:20:47 +0200)

----------------------------------------------------------------
Akhil P Oommen (1):
      drm/msm/a6xx: Fix GMU firmware parser

Anna Maniscalco (1):
      drm/msm: make sure last_fence is always updated

Jessica Zhang (1):
      drm/msm/dpu: Fix adjusted mode clock check for 3d merge

Neil Armstrong (1):
      drm/msm: dsi: fix PLL init in bonded mode

Rob Clark (4):
      drm/msm: Fix GEM free for imported dma-bufs
      drm/msm: Fix pgtable prealloc error path
      drm/msm: Reject MAP_NULL op if no PRR
      drm/msm: Ensure vm is created in VM_BIND ioctl

Vignesh Raman (1):
      drm/ci: disable broken MR check in sanity job

Vladimir Lypak (6):
      drm/msm/dpu: Fix allocation of RGB SSPPs without scaling
      drm/msm/dpu: Propagate error from dpu_assign_plane_resources
      drm/msm/dpu: Disable scaling for unsupported scaler types
      drm/msm/dpu: Fix pixel extension sub-sampling
      drm/msm/dpu: Require linear modifier for writeback framebuffers
      drm/msm/dpu: Disable broken YUV on QSEED2 hardware

 drivers/gpu/drm/ci/gitlab-ci.yml               |  2 +-
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c          |  5 ++++-
 drivers/gpu/drm/msm/adreno/adreno_gpu.c        |  7 -------
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c       |  3 +++
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c |  4 ++--
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c      | 14 ++++++++------
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c         |  2 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.c  |  3 +++
 drivers/gpu/drm/msm/dsi/phy/dsi_phy.h          |  1 -
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c      | 18 ++----------------
 drivers/gpu/drm/msm/msm_gem.c                  | 10 +++++++---
 drivers/gpu/drm/msm/msm_gem_submit.c           |  9 +++++----
 drivers/gpu/drm/msm/msm_gem_vma.c              |  8 +++++++-
 drivers/gpu/drm/msm/msm_gpu.h                  | 11 +++++++++++
 drivers/gpu/drm/msm/msm_iommu.c                |  5 +++++
 15 files changed, 59 insertions(+), 43 deletions(-)

