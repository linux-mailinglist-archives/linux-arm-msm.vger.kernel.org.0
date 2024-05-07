Return-Path: <linux-arm-msm+bounces-19362-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5640A8BE8D5
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 May 2024 18:27:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B84A31F21B37
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 May 2024 16:27:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CF04A16C6A6;
	Tue,  7 May 2024 16:27:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="cWb0KdD7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4288516ABF8
	for <linux-arm-msm@vger.kernel.org>; Tue,  7 May 2024 16:27:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715099231; cv=none; b=pktMp8oUD+186jWIKLbMSBtqxCnUxufP9mQrO0fgpH1P09n+aitJXjq+kLR9HXjSO4UeLx5tFtXy/blAL/jj5pycILRccIfLwETcMhscjbsnI3RePyBRLDj/81Q+59Vx4onDMS2XU1xLZskk8MGp5pTKpHWYvaz9MSDPw7CkmgI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715099231; c=relaxed/simple;
	bh=VGC9CnUyFz8kv+JZWidTOhc2UDTBbVKz2PNoIhdJ06Y=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=tpWd+7GkOYDv1yI5VOzvOkWHnWH1G/HJ54UEI8c/xu43HVQZOa4BvXupulrsLg4KP1gKgLoJHyLkQzIQKtdp/cWiNSYiH+Ql2ERGrJUI8yGZwXwcskjld9qUC40aNNo0QVZ0eXzq+uSyHrPhj5HmQcm0wL03+Z6e4Gw9FkeEJiU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=cWb0KdD7; arc=none smtp.client-ip=209.85.160.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qt1-f172.google.com with SMTP id d75a77b69052e-43d3d47278dso6597451cf.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 May 2024 09:27:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1715099229; x=1715704029; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=UxHRNPAJkNGXFeTpFgZu5yemut+3Fc0PUQDHkrsHV9o=;
        b=cWb0KdD782Pf7q7tPoPGpqIC8SJZ2oQLXH2lu8gvX6Fh0Y+sbdGg2CrnxvbrFJJR8h
         uvDcfT/9wfAXkkVBwHIdsp2zJb1O7kOoAhIUaN4A9ezvuwhgkJjGhA38cIbm18c2kWWu
         WZx1oPbJfNXMnOw/o/OBTDtvMXVQVS3eYrsWQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715099229; x=1715704029;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UxHRNPAJkNGXFeTpFgZu5yemut+3Fc0PUQDHkrsHV9o=;
        b=Nnak3+SqhURDphTecs5wUVuAfwV7kpt8A5xRDW1fGsf1ZFpdCKRnuUaiUN84qXXqqE
         W7haLPkZ2w7DsTvOtUpBeMK5A1N4o0SqftSm0TAJMq30R14byTNOeFl4qkWg3SpP5Zn/
         6DSHjTSoQjX38zWTL7PUvas/2rnrhg76OFB3ERSz30z1wZzSkMAwXCp/QS4wQ4F/2iqv
         d00PX08yWVW+E4cxuStKcwmpQGI9Z3TaWVLlkBLIqQXeGO3csGQbfnVUNPTrWsJh/3FY
         zCkiKaSQlnsN6fwEDVWtpdC1HTrHrmxMWEdKUjapGClxNlR178PwwIBy6YEQ6djIX/A+
         p57A==
X-Forwarded-Encrypted: i=1; AJvYcCUE9FK7f99axyMqYmTs4vUmO5a1caT/XmL1kWlUlrMPHpVsrkJ+l5D5XICK8ZZUCxLxt+AASMI03IFR7nXVpMq5JhGZyxxkrgh6Rjw+Cw==
X-Gm-Message-State: AOJu0Yyyg4VBLlIifNIqzVh4iOCSWb+XFG51Ym12mJ9ICwqnlH0iDJgD
	UH4vHhrSoozWN4c3xYTYkkv2rFNNVHNY/9CtGJeJv5Q2tmvMVw7D8bmeO1X7zQ==
X-Google-Smtp-Source: AGHT+IEbCKVIytotFiw/S98pMAUHUpO5m1BQr4muXIsWjbovYNwc/sq5NLE4mvzdInjV597D8/ogJQ==
X-Received: by 2002:a05:622a:181d:b0:437:a10c:3794 with SMTP id d75a77b69052e-43dbed1595fmr2832521cf.18.1715099229229;
        Tue, 07 May 2024 09:27:09 -0700 (PDT)
Received: from denia.c.googlers.com (114.152.245.35.bc.googleusercontent.com. [35.245.152.114])
        by smtp.gmail.com with ESMTPSA id hf23-20020a05622a609700b0043d1fc9b7d9sm4160597qtb.48.2024.05.07.09.27.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 May 2024 09:27:08 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Subject: [PATCH v2 00/18] media: Fix the last set of coccinelle warnings
Date: Tue, 07 May 2024 16:27:05 +0000
Message-Id: <20240507-cocci-flexarray-v2-0-7aea262cf065@chromium.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFlWOmYC/3WNQQ6CMBBFr0Jmbc20qYKuuIdh0ZQpTCLUTJVAS
 O9uZe/yveS/v0MiYUpwr3YQWjhxnAuYUwV+dPNAivvCYNBYvGCtfPSeVXjS6kTcpm6uwdo1pLE
 hKKuXUOD1KD66wiOnd5TtOFj0z/5vLVqhss4a7Y0OPV5bP0qc+DOdowzQ5Zy/W0KKRLEAAAA=
To: Michael Tretter <m.tretter@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Michal Simek <michal.simek@amd.com>, Andy Walls <awalls@md.metrocast.net>, 
 Stanimir Varbanov <stanimir.k.varbanov@gmail.com>, 
 Vikash Garodia <quic_vgarodia@quicinc.com>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org, 
 Hans Verkuil <hverkuil-cisco@xs4all.nl>, 
 Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.12.4

With this set we are done with all the cocci warning/errors.

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
Changes in v2:
- Fix build error in ppc for siano
- Link to v1: https://lore.kernel.org/r/20240507-cocci-flexarray-v1-0-4a421c21fd06@chromium.org

---
Ricardo Ribalda (18):
      media: allegro: nal-hevc: Refactor nal_hevc_sub_layer_hrd_parameters
      media: xilinx: Refactor struct xvip_dma
      media: dvb-frontend/mxl5xx: Refactor struct MBIN_FILE_T
      media: dvb-frontend/mxl5xx: Use flex array for MBIN_SEGMENT_T
      media: pci: cx18: Use flex arrays for struct cx18_scb
      media: siano: Refactor struct sms_msg_data
      media: siano: Remove unused structures
      media: siano: Use flex arrays for sms_firmware
      media: venus: Remove unused structs
      media: venus: Use flex array for hfi_session_release_buffer_pkt
      media: venus: Refactor struct hfi_uncompressed_plane_info
      media: venus: Refactor struct hfi_session_get_property_pkt
      media: venus: Refactor struct hfi_uncompressed_format_supported
      media: venus: Refactor hfi_session_empty_buffer_uncompressed_plane0_pkt
      media: venus: Refactor hfi_session_empty_buffer_compressed_pkt
      media: venus: Refactor hfi_sys_get_property_pkt
      media: venus: Refactor hfi_session_fill_buffer_pkt
      media: venus: Refactor hfi_buffer_alloc_mode_supported

 drivers/media/common/siano/smscoreapi.c           | 10 ++---
 drivers/media/common/siano/smscoreapi.h           | 18 +--------
 drivers/media/common/siano/smsdvb-main.c          |  4 +-
 drivers/media/common/siano/smsendian.c            |  8 ++--
 drivers/media/dvb-frontends/mxl5xx.c              |  2 +-
 drivers/media/dvb-frontends/mxl5xx_defs.h         |  4 +-
 drivers/media/pci/cx18/cx18-scb.h                 |  2 +-
 drivers/media/platform/allegro-dvt/allegro-core.c |  6 +--
 drivers/media/platform/allegro-dvt/nal-hevc.c     | 11 ++----
 drivers/media/platform/allegro-dvt/nal-hevc.h     |  6 +--
 drivers/media/platform/qcom/venus/hfi_cmds.c      | 16 ++++----
 drivers/media/platform/qcom/venus/hfi_cmds.h      | 46 +++++------------------
 drivers/media/platform/qcom/venus/hfi_helper.h    | 45 ++--------------------
 drivers/media/platform/qcom/venus/hfi_parser.c    |  2 +-
 drivers/media/platform/qcom/venus/hfi_venus.c     |  2 +-
 drivers/media/platform/xilinx/xilinx-dma.c        |  4 +-
 drivers/media/platform/xilinx/xilinx-dma.h        |  2 +-
 17 files changed, 53 insertions(+), 135 deletions(-)
---
base-commit: e695668af8523b059127dfa8b261c76e7c9cde10
change-id: 20240507-cocci-flexarray-9a807a8e108e

Best regards,
-- 
Ricardo Ribalda <ribalda@chromium.org>


