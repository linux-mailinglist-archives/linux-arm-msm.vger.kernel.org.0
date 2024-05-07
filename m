Return-Path: <linux-arm-msm+bounces-19378-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F73F8BE907
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 May 2024 18:31:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1518F1F22304
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 May 2024 16:31:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 526AB16F0DB;
	Tue,  7 May 2024 16:27:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="OIn0MpFw"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8759B16F857
	for <linux-arm-msm@vger.kernel.org>; Tue,  7 May 2024 16:27:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715099246; cv=none; b=A48j1WSbkNVJHK9YCxiUJ92MWJlQet9HEgKgMy9BucwXHO1tIuoGFjIx+Azxiw2iXk6KUCFXXclXMtSx3pgTrLBUlRKnfw20SIpalvC4KkgbEt+wpCjk0pJsmFxuCPndHLM5vwVVDfQz+9DjBvQ3PN/h0p1a+2u+ZWnDHy2mCoY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715099246; c=relaxed/simple;
	bh=elaKiW1ZWISf7j4z+HRijCG6vyiv0mxL1YyGQ0pIffU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gBMh3hwkpjl9U+6V+qxpwQQo9MsGs/4Od1tcp8DNjfIQ1nFPa08RmfJYDOwo38IuPVUKl6xUjy1XrzX5fTh2pWe04Oat8cFZknt+e0w+DbrqzmKWMBAW+DuxpywFO3G9qRIByqS2vhOJvI4tM4Da/HikcrWZU2ONzERVys6Z6wQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=OIn0MpFw; arc=none smtp.client-ip=209.85.160.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qt1-f170.google.com with SMTP id d75a77b69052e-43ca9047bd2so41205901cf.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 May 2024 09:27:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1715099243; x=1715704043; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LytlgeivFEVadVFPCSFVFsEkz0aZMS5bY0SwfM06VYA=;
        b=OIn0MpFwO8ZmXWx3zHne+FmrQbDu37RfE0cweOIbZpHViKFYa1ErcHamcD6ocJ6rof
         P6XbcxOcAYohx+usDyueTN4qKGfayVPrRRKkgxpn0ajMB//pf+t2DnxY4iXiKhSuCgdL
         huLY2HEiR/gFPmHz4aLeeDr0FscjTf0ho5kEQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715099243; x=1715704043;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LytlgeivFEVadVFPCSFVFsEkz0aZMS5bY0SwfM06VYA=;
        b=YwMFLG9V/vwLhdSJvslfD8LjoXQ9p1BvjjVvqQ30TO6wACjaKkzIZEM8Deo+p/C2FE
         cXa2A2czRVzoKKyFGVmMCdSJVTHQaSnNGQxtelEHXZjhnRz1bsROUEMC1PemRAEplMrx
         0y5ebKwTSAbdo44pQ6P6dOxP0M0VHDfBRvEeu2TWXDPfNLcOR7zFdaoV8up2bo+ymlSX
         Px4lIIaaC6GJ+4p0171tZuDQLLWzMVk5FgOPOn0SNzfDRevcTQ1acNvajVcx+WgYJM/o
         QEIXF/9S0H67PCkgC1VzM1s0EPmCIcC8hl3WdIw15m9uqMg9jkHZbA8ghRYCKbUUhbey
         UO1w==
X-Forwarded-Encrypted: i=1; AJvYcCUW6tif1c7grMiHRbJyieZZVO5H4EjF7S2ImJC0+2y6itVXv2DT2QhPr65/J8I6BnJGq6XAX1ypk8s3uzYtdPn7N8t/6J/zy0GtuzHcLA==
X-Gm-Message-State: AOJu0YwXW9Gm0VIcgM4rhaoDJA0vbaJVaCVv6IQm2nwB3k3JPioqBqlh
	OliFi4oTIhLMX6YImIrpoCCzftEajUyRnBHC+gVoN1ikuk0XjHx79w24AquZPA==
X-Google-Smtp-Source: AGHT+IH3mMeaAQ3dPkDbtiyOlqK0t/M43w6OxFHdMVW2XCWSC0GBNoCeALnYs1IDQynVDH2ifLt8lg==
X-Received: by 2002:ac8:7d0a:0:b0:43b:173e:ce1b with SMTP id d75a77b69052e-43d8f7cec66mr50519711cf.32.1715099243729;
        Tue, 07 May 2024 09:27:23 -0700 (PDT)
Received: from denia.c.googlers.com (114.152.245.35.bc.googleusercontent.com. [35.245.152.114])
        by smtp.gmail.com with ESMTPSA id hf23-20020a05622a609700b0043d1fc9b7d9sm4160597qtb.48.2024.05.07.09.27.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 May 2024 09:27:23 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Tue, 07 May 2024 16:27:22 +0000
Subject: [PATCH v2 17/18] media: venus: Refactor
 hfi_session_fill_buffer_pkt
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240507-cocci-flexarray-v2-17-7aea262cf065@chromium.org>
References: <20240507-cocci-flexarray-v2-0-7aea262cf065@chromium.org>
In-Reply-To: <20240507-cocci-flexarray-v2-0-7aea262cf065@chromium.org>
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

The single data array data[1] is only used to save the extradata_size.
Replace it with a single element field.

This fixes the following cocci warning:
drivers/media/platform/qcom/venus/hfi_cmds.h:175:5-9: WARNING use flexible-array member instead (https://www.kernel.org/doc/html/latest/process/deprecated.html#zero-length-and-one-element-arrays)

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/platform/qcom/venus/hfi_cmds.c | 2 +-
 drivers/media/platform/qcom/venus/hfi_cmds.h | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/qcom/venus/hfi_cmds.c b/drivers/media/platform/qcom/venus/hfi_cmds.c
index c5123f2e76fe..35423e211ddd 100644
--- a/drivers/media/platform/qcom/venus/hfi_cmds.c
+++ b/drivers/media/platform/qcom/venus/hfi_cmds.c
@@ -331,7 +331,7 @@ int pkt_session_ftb(struct hfi_session_fill_buffer_pkt *pkt, void *cookie,
 	pkt->alloc_len = out_frame->alloc_len;
 	pkt->filled_len = out_frame->filled_len;
 	pkt->offset = out_frame->offset;
-	pkt->data[0] = out_frame->extradata_size;
+	pkt->extradata_size = out_frame->extradata_size;
 
 	return 0;
 }
diff --git a/drivers/media/platform/qcom/venus/hfi_cmds.h b/drivers/media/platform/qcom/venus/hfi_cmds.h
index cd7902743f62..0ccc4102ac3d 100644
--- a/drivers/media/platform/qcom/venus/hfi_cmds.h
+++ b/drivers/media/platform/qcom/venus/hfi_cmds.h
@@ -172,7 +172,7 @@ struct hfi_session_fill_buffer_pkt {
 	u32 output_tag;
 	u32 packet_buffer;
 	u32 extradata_buffer;
-	u32 data[1];
+	u32 extradata_size;
 };
 
 struct hfi_session_flush_pkt {

-- 
2.45.0.rc1.225.g2a3ae87e7f-goog


