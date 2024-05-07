Return-Path: <linux-arm-msm+bounces-19317-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A07E8BE3B0
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 May 2024 15:22:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 165BB1F26AF2
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 May 2024 13:22:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5AEB416ABC5;
	Tue,  7 May 2024 13:18:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="ZRX3fQkb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com [209.85.219.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5071168B06
	for <linux-arm-msm@vger.kernel.org>; Tue,  7 May 2024 13:18:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715087912; cv=none; b=W5p3P6B2I6jXCY9bXWMPs8rr6o1CsYPDKIk0l6Sydlh+vIRPj3V33ny122xV8E6lCEneXzIbRp6wigJaW6XmPGMN9/7K0LTtQALzhtCXhwiMEXAxL82WrzVUgeO8sbI/bTizRXY0vrJhhiuzDAAdTHoSDIvE5iWi39A8LfL60g4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715087912; c=relaxed/simple;
	bh=bAi2ZdpBL5YU/Wxi/XteXVj/icGKTIMcJ8j0y8QoFIQ=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=FanVvclSg8Vz772G0pY3tr4PVExev4GvCZWeaE+HEtPrugP0GSHmXfr2Dtd4+wsayxhUTb8s4lpD1poWiyd7EVb7kM+F4mgKAFvlIs3OIbuv611KT7WVaQIOntSqcKfXUoPySOmwWWN8Bxubj3QGbfv0UAjgGTBCdXugB5CJZIo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=ZRX3fQkb; arc=none smtp.client-ip=209.85.219.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qv1-f49.google.com with SMTP id 6a1803df08f44-6a0d1032362so10593676d6.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 May 2024 06:18:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1715087909; x=1715692709; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=8f9hc3zYS1+xO9Qa+U18bGlg+mDWX5tgKVnZHr3X7Vw=;
        b=ZRX3fQkbILhVfArWs1t8tD5o2EDIYKsjfkp6aXyd4PRWnf+MYlIP4LvZgzIpNz9ppB
         BgkXuGqoyfeyH8V/pCj63430wJ6DfP/XSGvROpioq+osGTTRXtMcHEYTVmww5MHeG+p/
         PMDCMlI6AB4vDRweg5NzuG/llx6IuK9Pagz1s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715087909; x=1715692709;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8f9hc3zYS1+xO9Qa+U18bGlg+mDWX5tgKVnZHr3X7Vw=;
        b=n69mDt016s3FbBYRm8p33lX4dQYSFk7HbMuWI+3Nzq7+9+jNL2AQWFSpiI92pHknYh
         wS8SeCfb9eFAMbq2Olk+VJAi7TwbRb3ktjoZzP/uclPyKDpYHe4WrqsJWYafRYIlHQhE
         fuSJLtCoputHV4W63JiHJAgpco9ynKOEk3CH7usXX2wYQ2QmZ3e5lxvrIFDqJa8Dny+B
         pu2YLZfsXktRzFydo0aXOCUp9sPXy94pMjbWbufmZtJtXU9TXQSjRx60VUdpZ2Kh0Ojy
         8U1qEIZHBwIo5uCqCMFkIGPonNpxMP3SvKlCBMSyVq7fzePEs2JqHyTPGrkEpHPlSl2g
         VFrg==
X-Forwarded-Encrypted: i=1; AJvYcCVkAUIj016z1eOt2WPKkH30ogA/riNLZBzKFMs9kzuV6gV+43X4UjPfWSO3gjxpsss8wwcgqzYTi1OY1gf1LuDzkwxzZm5/m8eW6+iDKw==
X-Gm-Message-State: AOJu0YxuBxrsb92yCUcSgwbhsK4cr6p6fU7rdH0rBH9QYN4lfAtYImI2
	QHtjaR7yNR3qknr2TtS/wuW2NGsVUrhmVmlqhcisHm7ABWOeVPwzHJhdcahciw==
X-Google-Smtp-Source: AGHT+IEWyU2AaY4LDvGiS+okmI+kA1r/WIVU3XwN1sQPnZg87ruugUrDP1DKKW0TPSio4xfKwE/sTA==
X-Received: by 2002:ad4:5b8d:0:b0:6a0:c8ac:de5 with SMTP id 13-20020ad45b8d000000b006a0c8ac0de5mr16242277qvp.32.1715087909722;
        Tue, 07 May 2024 06:18:29 -0700 (PDT)
Received: from denia.c.googlers.com (114.152.245.35.bc.googleusercontent.com. [35.245.152.114])
        by smtp.gmail.com with ESMTPSA id t15-20020a05621405cf00b006a0d19c3139sm4655105qvz.118.2024.05.07.06.18.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 May 2024 06:18:29 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Subject: [PATCH 00/18] media: Fix the last set of coccinelle warnings
Date: Tue, 07 May 2024 13:18:26 +0000
Message-Id: <20240507-cocci-flexarray-v1-0-4a421c21fd06@chromium.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIACIqOmYC/x3MMQqAMAxA0atIZgupKFavIg6hphoQlRSkUry7x
 fEN/2eIrMIRxiqD8i1RzqPA1hX4jY6VjSzF0GDTYoe98af3YsLOiVTpMQM57MmxRcdQqks5SPq
 P0/y+H5EtvOVhAAAA
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
 16 files changed, 48 insertions(+), 132 deletions(-)
---
base-commit: e695668af8523b059127dfa8b261c76e7c9cde10
change-id: 20240507-cocci-flexarray-9a807a8e108e

Best regards,
-- 
Ricardo Ribalda <ribalda@chromium.org>


