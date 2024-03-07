Return-Path: <linux-arm-msm+bounces-13614-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 98D33875391
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 Mar 2024 16:43:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 076611F2939C
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 Mar 2024 15:43:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 288B4129A77;
	Thu,  7 Mar 2024 15:43:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dTW/DAr7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59B721EEEA
	for <linux-arm-msm@vger.kernel.org>; Thu,  7 Mar 2024 15:43:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709826186; cv=none; b=upWH3aqz7n3w+2fpxotOHoEdwoayYBzuiL4XJ+kafCpE30xOT4hYcV5pqCloKBoVFZGTdO4InYFeG/K2543mMLdA+9V1tFtk7lDl5HyJQx8Bq8f+I9j6fWR3yULKT8rFi6dwfUew3trhwi/gTRiTFBW1x4wicwg1bCyARLTkIlE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709826186; c=relaxed/simple;
	bh=TUvO5JoFUlTVyKGRWFc7SdUbYHs4fXJEJenhMnh0sN8=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=GFkPaUsRPfIlqKYk/UZ++bb+/bdCw40I6aHJyu+7/+SeoEPQrRsItlBjDgKbY6sRmhOnv/z9oBs8woH7jjrpPBRMcezK6UAjjd9ffqCIl6jcN1NywCeWHk5ewcsjyGMoDSYFCdSwmLAUfDW/b9gvrN29a54h84LoDtqnZFZ9Hy0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dTW/DAr7; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-55a5e7fa471so1576410a12.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 07 Mar 2024 07:43:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709826182; x=1710430982; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=QbfY0jQ/d1E5iuzWIwYW6yuawL+XChB5sPZ7SPtuav0=;
        b=dTW/DAr71Qxt5AUnKPBUq39s7GhIfDMe1Pp4rsZ3MAucprLOAOleGBJzKQ8Do5WVqZ
         k3ZUY0FMrCngQhfjxU3uPA4Ius6OOYaGSNz//Ql7lmnN847i8xa3dK9eZXpq7F6VLSkP
         +jG88ZCr9mk3P/IxQdKK2Mry7qMZmCHiGoRcVm7qZOktlmaBVoazG2PFte3XkMc8W7kd
         h6jGoeZtqdDczsHR42MnDm6d/iQCiawQGh3xYFTS+/OGor+3tisJxLwr9+bjvAiraSkp
         DDpggMRUVb7WKvSGJFrghz8BCNyfm/MA4nf+tj+83Is1FRiYecoIqZQqvTbfs5AdQOHb
         bC/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709826182; x=1710430982;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QbfY0jQ/d1E5iuzWIwYW6yuawL+XChB5sPZ7SPtuav0=;
        b=rfNL0WhvoiVIH5UHIcPdDn1bXGrfNaPCmoXAlkxFHvWfF1Bw6NBXje4yFLJw+9iSJQ
         c51oVuRXmwNdmHH/+jbXgcIqvXhjyeSf7sL56lAHa/hypIEUkCICGWRZDh7+aopXhuxp
         5cPqR9coaZxwbmCdxHWqlUl5UecQQp53iv6W6AAroFrZXbRvAGj8wBd3YkBZCDeQSfYD
         uVflFsXe2wHYDP0KjkaIGsJGQHX9v+j5OabdVaKqk03stopmQf48ZFYu1BqwSJS45sOD
         YANXrRN7az4jGkxgHIlvK8nwidUf+xVJkIDgEnTv0Ch5g+b7ix4iZy1joH+T/NyLtM9I
         OgIQ==
X-Forwarded-Encrypted: i=1; AJvYcCVADMrT23h4b9i93El9Z3wVaw/vC3s5sGLYTBqP36a8ZoacVCK50y4Q8x962zC9Xdc4ycl1Q8WPP/SakAI6n8UHVT7U+nLptAzOQuKWLA==
X-Gm-Message-State: AOJu0YxvyKvxLgs9V6PO+WDVfhfKeAUraX/6lclVCGn6sje3HMnIyh+n
	f7JFukcwcK3pcSKrL/f57/wXypiUeMSe02woaVWCUo4zBApWkOwgIPe7wBTOIIfUSS5tUPEIjG2
	/wUzHFhV08aHq8imiEKGMsFA42pmgkGWg7yc=
X-Google-Smtp-Source: AGHT+IEr9qo/sl8eNI6sxdX5u4sxd7sET4jEQ3xcDqXBSae2OwHSkckftNM2xzoDZp6UHAKqUfZlQZkVq2caijUeJo4=
X-Received: by 2002:a50:cd5d:0:b0:565:e060:5567 with SMTP id
 d29-20020a50cd5d000000b00565e0605567mr102617edj.31.1709826182359; Thu, 07 Mar
 2024 07:43:02 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Rob Clark <robdclark@gmail.com>
Date: Thu, 7 Mar 2024 07:42:50 -0800
Message-ID: <CAF6AEGvedk6OCOZ-NNtGf_pNiGuK9uvWj1MCDZLX9Jo2nHS=Zg@mail.gmail.com>
Subject: [pull] drm/msm: drm-msm-next-2024-03-07 for v6.9
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: dri-devel <dri-devel@lists.freedesktop.org>, 
	linux-arm-msm <linux-arm-msm@vger.kernel.org>, freedreno <freedreno@lists.freedesktop.org>, 
	Abhinav Kumar <quic_abhinavk@quicinc.com>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset="UTF-8"

Hi Dave,

This is the last bit for v6.9, which was waiting on
drm-misc-next-2024-02-29.  Description below.

The following changes since commit 177bce60cd10a4ffdc9881bf6f2dff7880408c1d:

  Merge tag 'drm-misc-next-2024-02-29' into msm-next (2024-03-03 18:32:11 -0800)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/msm.git tags/drm-msm-next-2024-03-07

for you to fetch changes up to 4be445f5b6b6810baf397b2d159bd07c3573fd75:

  drm/msm/dpu: capture snapshot on the first commit_done timeout
(2024-03-04 11:44:03 +0200)

----------------------------------------------------------------
Late updates for v6.9, the main part is CDM (YUV over DP) which was
waiting for drm-misc-next-2024-02-29.

DPU:
- Add support for YUV420 over DP
- Patchset to ease debugging of vblank timeouts
- Small cleanup

----------------------------------------------------------------
Dmitry Baryshkov (3):
      drm/msm/dpu: make "vblank timeout" more useful
      drm/msm/dpu: split dpu_encoder_wait_for_event into two functions
      drm/msm/dpu: capture snapshot on the first commit_done timeout

Kuogee Hsieh (1):
      drm/msm/dpu: add support of new peripheral flush mechanism

Paloma Arellano (18):
      drm/msm/dpu: allow certain formats for CDM for DP
      drm/msm/dpu: add division of drm_display_mode's hskew parameter
      drm/msm/dpu: pass mode dimensions instead of fb size in CDM setup
      drm/msm/dpu: allow dpu_encoder_helper_phys_setup_cdm to work for DP
      drm/msm/dpu: move dpu_encoder_helper_phys_setup_cdm to dpu_encoder
      drm/msm/dp: rename wide_bus_en to wide_bus_supported
      drm/msm/dp: store mode YUV420 information to be used by rest of DP
      drm/msm/dp: check if VSC SDP is supported in DP programming
      drm/msm/dpu: move widebus logic to its own API
      drm/msm/dp: program config ctrl for YUV420 over DP
      drm/msm/dp: change clock related programming for YUV420 over DP
      drm/msm/dp: move parity calculation to dp_utils
      drm/msm/dp: add VSC SDP support for YUV420 over DP
      drm/msm/dp: enable SDP and SDE periph flush update
      drm/msm/dpu: modify encoder programming for CDM over DP
      drm/msm/dpu: modify timing engine programming for YUV420 over DP
      drm/msm/dpu: reserve CDM blocks for DP if mode is YUV420
      drm/msm/dp: allow YUV420 mode for DP connector when CDM available

 drivers/gpu/drm/msm/Makefile                       |   3 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c        | 244 +++++++++++++++++----
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h        |  26 +--
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h   |  26 ++-
 .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c   |  32 ++-
 .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c    | 100 +--------
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_cdm.c         |   2 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c         |  17 ++
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h         |  10 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c            |   6 +-
 drivers/gpu/drm/msm/dp/dp_audio.c                  | 101 ++-------
 drivers/gpu/drm/msm/dp/dp_catalog.c                | 115 +++++++++-
 drivers/gpu/drm/msm/dp/dp_catalog.h                |   9 +-
 drivers/gpu/drm/msm/dp/dp_ctrl.c                   |  17 +-
 drivers/gpu/drm/msm/dp/dp_display.c                |  82 +++++--
 drivers/gpu/drm/msm/dp/dp_drm.c                    |   6 +-
 drivers/gpu/drm/msm/dp/dp_drm.h                    |   3 +-
 drivers/gpu/drm/msm/dp/dp_panel.c                  |  53 +++++
 drivers/gpu/drm/msm/dp/dp_panel.h                  |   2 +
 drivers/gpu/drm/msm/dp/dp_reg.h                    |   9 +
 drivers/gpu/drm/msm/dp/dp_utils.c                  |  96 ++++++++
 drivers/gpu/drm/msm/dp/dp_utils.h                  |  36 +++
 drivers/gpu/drm/msm/msm_drv.h                      |  32 +--
 23 files changed, 736 insertions(+), 291 deletions(-)
 create mode 100644 drivers/gpu/drm/msm/dp/dp_utils.c
 create mode 100644 drivers/gpu/drm/msm/dp/dp_utils.h

