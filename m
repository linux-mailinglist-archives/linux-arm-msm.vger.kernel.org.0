Return-Path: <linux-arm-msm+bounces-19365-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D62B58BE900
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 May 2024 18:31:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 24204B2729F
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 May 2024 16:27:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D6D6916D30F;
	Tue,  7 May 2024 16:27:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="aOZS1PuR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ot1-f54.google.com (mail-ot1-f54.google.com [209.85.210.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C5C616C84B
	for <linux-arm-msm@vger.kernel.org>; Tue,  7 May 2024 16:27:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715099234; cv=none; b=frEzu93PY2YVMYa9ZkiEIFFAoVlM7wQZdxcRTa/w0IH/OCJ5S4CVITsrimPID5IDSZJj/Q4YvuGm8neA2gBdrb1XhTpr0jAkO4EuULcp9QrXSRp4gu2gMA9YwYRggdeBZCZ65kH4MFxTr3pkOd/2P9gme8pU93HzomLYCB3D1Hc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715099234; c=relaxed/simple;
	bh=8PUpSF0/4qPVDDDsamD0PWejHF9bSQacFjYzGSE/u/8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GrUghwBGRD8VQcFf8BTzolr3+WW0hXBzHSrS0d2F3v0/ou4tsYbAGdrST4GHCuyWbCITuPSRt+VPKfyV9ORQZppVFuQ1oA3dUaZsoDzs/bCC5SVXjlii5oXFm100Hsq5lMU3WGX7wJdNW6byz4coknNceYf57aDOOElsclKzKKo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=aOZS1PuR; arc=none smtp.client-ip=209.85.210.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-ot1-f54.google.com with SMTP id 46e09a7af769-6f05c253669so1191462a34.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 May 2024 09:27:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1715099232; x=1715704032; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2A/cdtQJ5ubVGGh9zBSnEjfvf8aW68DShS0IQqplaqg=;
        b=aOZS1PuRYowzcpnKFw93tyCjn1TMW/H+eUOMROQtGijkZWCUuVLHsSdHdOGAneU3Og
         H8nSJOW90VS7gDBO1PX54YohzD31tINvktPfYeCjwYaYx7b+DKwEAeJs9Rly3y+psNBK
         P4w1INioENzgvSHG4+EFsAdzH6Q3pttcEc+68=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715099232; x=1715704032;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2A/cdtQJ5ubVGGh9zBSnEjfvf8aW68DShS0IQqplaqg=;
        b=ljH0YCTWV8HP9nDmnBbYpk8Vc79c5IOmD1cayicay3z2fyoruek3z98UxhxEBJfrih
         b+Ujexl9fbFIQZ7PTxyrftKetZ3FHqD+gjCgk5Ed23NVrqP3iPz6p086toBWdjgit5VO
         RcKDicLO3ZQN2Ifjsni3UfWhHn+HSRyd34PyvKQfDYRFzI/gi8/lzT99gsmmmC508zad
         vJXNmoVE+5FGwZEIuLDZCJymnBjJiG/7oIyj7ZdFwsLVfYLzPl2cCwH43MTtrllJBlI8
         PQ3UW94nyMv/ShaumjFxD3MrR6CBzgV9JQc26oDVITZpCBnxHO01oOwEPhkyfRQhQ15n
         im+w==
X-Forwarded-Encrypted: i=1; AJvYcCXSc1RUnli8unPhzs2q2hlKWdKxZ/OENBxJNgcl9IvWg/hViZCpa1/uXX6Jpjhmudw/DFTbkELi9U+qKSMtjGoDdu53GCwyttybjZFSIA==
X-Gm-Message-State: AOJu0YxMdG0f7uHVLUuxwVDhuY6DT4CPa88ksWulDAn40Ggb9yRghZfA
	1gq51HWc6BHTT4AbGtaaC//KiQwDIKOGRNWu+fKrJi6Q2jewQGBvmACJWn9jFA==
X-Google-Smtp-Source: AGHT+IFNJz8W2TliqlWnVCfeJU7sKKv7snchkh8btiT9U1bG50pXZSjddsLAAbR+Un47VkXMoaVYdg==
X-Received: by 2002:a05:6870:e998:b0:23e:b42a:499 with SMTP id 586e51a60fabf-24097bdf8camr109598fac.2.1715099232296;
        Tue, 07 May 2024 09:27:12 -0700 (PDT)
Received: from denia.c.googlers.com (114.152.245.35.bc.googleusercontent.com. [35.245.152.114])
        by smtp.gmail.com with ESMTPSA id hf23-20020a05622a609700b0043d1fc9b7d9sm4160597qtb.48.2024.05.07.09.27.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 May 2024 09:27:11 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Tue, 07 May 2024 16:27:08 +0000
Subject: [PATCH v2 03/18] media: dvb-frontend/mxl5xx: Refactor struct
 MBIN_FILE_T
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240507-cocci-flexarray-v2-3-7aea262cf065@chromium.org>
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

Replace a single element array, with a single element field.

The following cocci warning is fixed:
drivers/media/dvb-frontends/mxl5xx_defs.h:171:4-8: WARNING use flexible-array member instead (https://www.kernel.org/doc/html/latest/process/deprecated.html#zero-length-and-one-element-arrays)

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/dvb-frontends/mxl5xx.c      | 2 +-
 drivers/media/dvb-frontends/mxl5xx_defs.h | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/dvb-frontends/mxl5xx.c b/drivers/media/dvb-frontends/mxl5xx.c
index 91e9c378397c..a15c0438b07a 100644
--- a/drivers/media/dvb-frontends/mxl5xx.c
+++ b/drivers/media/dvb-frontends/mxl5xx.c
@@ -893,7 +893,7 @@ static int do_firmware_download(struct mxl *state, u8 *mbin_buffer_ptr,
 	status = write_register(state, FW_DL_SIGN_ADDR, 0);
 	if (status)
 		return status;
-	segment_ptr = (struct MBIN_SEGMENT_T *) (&mbin_ptr->data[0]);
+	segment_ptr = (struct MBIN_SEGMENT_T *)(&mbin_ptr->data);
 	for (index = 0; index < mbin_ptr->header.num_segments; index++) {
 		if (segment_ptr->header.id != MBIN_SEGMENT_HEADER_ID) {
 			dev_err(state->i2cdev, "%s: Invalid segment header ID (%c)\n",
diff --git a/drivers/media/dvb-frontends/mxl5xx_defs.h b/drivers/media/dvb-frontends/mxl5xx_defs.h
index 097271f73740..3c5d75ed8fea 100644
--- a/drivers/media/dvb-frontends/mxl5xx_defs.h
+++ b/drivers/media/dvb-frontends/mxl5xx_defs.h
@@ -168,7 +168,7 @@ struct MBIN_FILE_HEADER_T {
 
 struct MBIN_FILE_T {
 	struct MBIN_FILE_HEADER_T header;
-	u8 data[1];
+	u8 data;
 };
 
 struct MBIN_SEGMENT_HEADER_T {

-- 
2.45.0.rc1.225.g2a3ae87e7f-goog


