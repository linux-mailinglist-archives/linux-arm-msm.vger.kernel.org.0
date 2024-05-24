Return-Path: <linux-arm-msm+bounces-20397-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BD868CE603
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 May 2024 15:21:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3E0F41F249B7
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 May 2024 13:21:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1E18E86244;
	Fri, 24 May 2024 13:19:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="yDwqcH6t"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87A5112AAC8
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 May 2024 13:19:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716556786; cv=none; b=GW8CsKRS9KmTtK/RFsT9MgcmFjgPjnBChJcH4fRjHJvDCt98eV1yFzqZ2md0B8TNYHBjRkPE6RAZvc8rmyDZG1LTdJU2+RenlJOuoSM2iF+bsPGCS/yVz4wSauILlM5OCS75wt/7EWtcME5DiLfo4MkBMb2mSbwBPfh22axeLYU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716556786; c=relaxed/simple;
	bh=+VbmLrr+MxBwHguG6QH57yAkTY866KqHsjxTiaWJiUo=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Dc1uMTlf7dQ6N1CxQ67QLCQGbKGdcLafq2Ub/kIxIG0EccRsxu5v9mn8G0huEhDKVPHyqvwmNBDtPAKTWLgM3IiGgHnlWkWsXPQOs533PdcLwjJslrbIRR4vts9gZvkS8Sx4Qv4JYOEhkkFbhoTIkXmTUggFCuBW/Zsy8rDXQr8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=yDwqcH6t; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-6f4603237e0so2246501b3a.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 24 May 2024 06:19:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1716556784; x=1717161584; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9LDfNWVg/nkGwfC2fZiQvw0fSrYSYmc/J/W6QstXb1o=;
        b=yDwqcH6tdqler7KfibWEF/Z0uAMi0N4Wt1Es+Sw0hhAL/Bq2I2wsy2NquFiolbmyBK
         1bxI7VXQNyBMk6a9Jwd8DulvEKz+LbMFcI8QtFzGA9c6m/Aklv6dKbpwDDZ3dyfnAH7T
         iiu+HHkwEbomY/XolJn55mfzyiTlbTWObl+8Uw485/9vdjjoekZBUg7og+cKlv1QP8Jw
         iq22nrthDVlQjTdwpgXVe/Zs3lyZONpNHkxm3GI7xDLeiaDyxjZ0S7SQAMytg9N+J6UP
         uuWQgrQg7sY4bR+t0anr5UlOF8Sb+cUJXjE71gywNUzKYE3wwPVeDOdFGmn4fVw+OtEa
         EFSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716556784; x=1717161584;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9LDfNWVg/nkGwfC2fZiQvw0fSrYSYmc/J/W6QstXb1o=;
        b=t7QcZ89MJUcMipBMTZdGk40iT/xX2/KE+9374bhkETIpMRO6uOaYd/0Xd1JqdQOylU
         FFddm+lVmeObGoZCj2wZZLSYHhQ8YkWcmGZfwQj3qH2/+oOpFRNiunT7VM2Iap6yH1VF
         LqG4w+/t/AJOW1su9zjDKmhPhmbH/L2WyrHhifx0pxxwRf/UfTl3pGTGqp9ajPU3rc/l
         IemPEGas8JtrurGX2WAMqE2q7U9Lw55Ac9OzyKQz7KySsN/URL7BBCZhtQKNoevOcG2h
         /Z+lF657c1ASF9lF/eNTUoEpUVdDVuDduse45IDQw7W16sQGMLyQffkzhqFaHofhRHbj
         5RKw==
X-Gm-Message-State: AOJu0YwRoxn3DaK9H5SCKbcs5xPExOcwjrCpbGRHuAYhQBawZPBkUVAL
	BlxTl/bSsFcJs6NMMdpcnsuwBrbIaMae7GSC/4Z4Cxwx5SPlOa1MTm8pTtcNnLs=
X-Google-Smtp-Source: AGHT+IEJZdkZUd+uet0RvE9yt804KFshNazfc5SYnkX24jgpFp43TZQkuae564In0mna7++YZ7uyGA==
X-Received: by 2002:a05:6a21:6d9e:b0:1af:cbe1:8a4e with SMTP id adf61e73a8af0-1b212dd09famr3256099637.23.1716556783894;
        Fri, 24 May 2024 06:19:43 -0700 (PDT)
Received: from [127.0.1.1] ([112.64.61.67])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-6f8fd2d492csm1117852b3a.179.2024.05.24.06.19.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 May 2024 06:19:43 -0700 (PDT)
From: Jun Nie <jun.nie@linaro.org>
Subject: [PATCH v4 0/5] Add DSC support to DSI video panel
Date: Fri, 24 May 2024 21:18:20 +0800
Message-Id: <20240524-msm-drm-dsc-dsi-video-upstream-4-v4-0-e61c05b403df@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJyTUGYC/x2NQQqDUAwFryJZNyDhK61XkS7U/2yz+CpJK4J49
 4YuZjGbmZMcpnDqqpMMu7quS0i6VTS9h+UF1hxOUkuqG0lcvHC2wKdAedeMlb+bfwxD4cQiEGn
 becT9QZHZDLMe/0X/vK4f6nuR7nIAAAA=
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, Vinod Koul <vkoul@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Jun Nie <jun.nie@linaro.org>, Jonathan Marek <jonathan@marek.ca>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1716556778; l=1621;
 i=jun.nie@linaro.org; s=20240403; h=from:subject:message-id;
 bh=+VbmLrr+MxBwHguG6QH57yAkTY866KqHsjxTiaWJiUo=;
 b=+UYOOp4JE49VtIHFxZq+eHqAnMnpfrs4LQ7WhRjxDKutKQ5aM4fp53lUrH9EFfbdLYftxfqze
 /jUY0i3IGpGDo0Nu3UIcs2ZnP7pr1vlm4nrmeuDyyy+X39rt+JHQvds
X-Developer-Key: i=jun.nie@linaro.org; a=ed25519;
 pk=MNiBt/faLPvo+iJoP1hodyY2x6ozVXL8QMptmsKg3cc=

This is follow up update to Jonathan's patch set.

Changes vs V3:
- Rebase to latest msm-next-lumag branch.
- Drop the slice_per_pkt change as it does impact basic DSC feature.
- Remove change in generated dsi header
- update DSC compressed width calculation with bpp and bpc
- split wide bus impact on width into another patch
- rename patch tile of VIDEO_COMPRESSION_MODE_CTRL_WC change
- Polish warning usage
- Add tags from reviewers

Changes vs V2:
- Drop the INTF_CFG2_DATA_HCTL_EN change as it is handled in
latest mainline code.
- Drop the bonded DSI patch as I do not have device to test it.
- Address comments from version 2.

Signed-off-by: Jun Nie <jun.nie@linaro.org>
---
Jonathan Marek (4):
      drm/msm/dpu: fix video mode DSC for DSI
      drm/msm/dsi: set video mode widebus enable bit when widebus is enabled
      drm/msm/dsi: set VIDEO_COMPRESSION_MODE_CTRL_WC
      drm/msm/dsi: add a comment to explain pkt_per_line encoding

Jun Nie (1):
      drm: adjust data width for widen bus case

 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c          |  2 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h     |  8 ++++++++
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c | 13 +++++++++++++
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c          | 12 ++++++++++++
 drivers/gpu/drm/msm/dsi/dsi_host.c                   | 10 +++++++++-
 5 files changed, 43 insertions(+), 2 deletions(-)
---
base-commit: e6428bcb611f6c164856a41fc5a1ae8471a9b5a9
change-id: 20240524-msm-drm-dsc-dsi-video-upstream-4-22e2266fbe89

Best regards,
-- 
Jun Nie <jun.nie@linaro.org>


