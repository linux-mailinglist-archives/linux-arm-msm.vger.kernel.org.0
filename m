Return-Path: <linux-arm-msm+bounces-20649-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id DFAA38D0F06
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 May 2024 23:09:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9BE34282D5A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 May 2024 21:09:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0A0B1167DAC;
	Mon, 27 May 2024 21:09:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="cg/+MpnY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com [209.85.219.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAFC916132E
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 May 2024 21:08:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716844140; cv=none; b=Nd+v+If8dbr71e3Lj6pRT5iy2sKJiHIUO8fPjadm7dDQ6BRkbbxJ850PNVgCmOh1sBKpQ74BbtYNgVknxXZJ1heP1uhsxHUoFNOpGthubQaJWcWv84/jTwoA7SxUJN1lUcqw0GqHdc+NjNYtRTGc2/JmM5U7i+uzB4D3fnEj+fg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716844140; c=relaxed/simple;
	bh=z13zyxqEexMyebGHgKu+yI97Ps1x4zxNfwmfII/1oPg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Nup5rPUAL3rTQtDZBxS6wtstNxks6v8sMtjl+tZTOJeWsvSfvnhU59T/SuNrSxICa8IndZG+VLdJBUOAi4o29A9Nzxf1hUKvVVveyVH6Od8UPf7KagzMzGuVHoH4MMBjKc2IgdK9IWT4l1y+SCuoWURDEJDKJjbenF8hdyrh6Yg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=cg/+MpnY; arc=none smtp.client-ip=209.85.219.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qv1-f52.google.com with SMTP id 6a1803df08f44-6ad8344825cso395606d6.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 May 2024 14:08:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1716844137; x=1717448937; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fNIsU+/qEYhURt556sfo4PlTlUVRyNCactQuGIIVr1E=;
        b=cg/+MpnYLjY26r7OLdNggcPKZCMQLc+lm5KVy0NLWBX/gDQAgUs/IdSfAAQFB24RCe
         L+kneearIqwg9Ch+OH/FTCCvbrit1HWDMj5bpE1kQPhieF48EXO4+i5MXhYgUNtZoXdS
         8dlFmLdSjiOLZ32a6IPmvOwWwm4WgM03rt0Xo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716844137; x=1717448937;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fNIsU+/qEYhURt556sfo4PlTlUVRyNCactQuGIIVr1E=;
        b=mgd/yX2OpJx/J2IYjehqtGk1yWAtlxd8rccvfWRiehuRkLdrTi8K29GvZ+KI22OasV
         mRiuGbRs6PQl7h8Wn0MS513BiZUXXvqzeGv/a3wCAJVyml71r5zTizQB2iXWLEuaVhvn
         HCKtYHnE5QQY+bQgVchQ98b841bFFXg/P7l2RUnneKCg5pvvGYx+TirAyNl323RidtCy
         uFavMm+wIT57kaImY9tyuA1cnHVOvmy17iXqS5snu4CEVSrTewXiGScLvSi1oHE/6QUG
         nQQYsa2MilHcFZBxJvq7xsExSLHJiPWaYFM0XRzq01GbjA4IQ9B3A6r+3GFXHRo6M8wY
         ks2w==
X-Forwarded-Encrypted: i=1; AJvYcCWA4dDiczNPAwXfxUpo3gf9yHzQcKNRqLhwXdKORjP4vZxjXKoiQ+a/rH2qifm8Dnns+Sba1CBKKzhhIHVOYkNLd3Y62S0PZraECz8b6w==
X-Gm-Message-State: AOJu0YwlBx4QvnAs/52wWaey1cFGSaJa/CTUtcipEGfoQRcG4gpnUCwe
	ehNiFm8qTuDBB32Ec98c5GJzUI5KsMRDqCzdRuKoupzWAMUF4hwIuL9pcsX6cw==
X-Google-Smtp-Source: AGHT+IG/WggJVCTkvsROl4Irbm8iKAUgklmicuyvY5nd4ATgkyrWLwVVrbvJHXRzSt3NN35976vKqA==
X-Received: by 2002:a05:6214:4a85:b0:6ab:9428:385f with SMTP id 6a1803df08f44-6abcd0dc953mr122329976d6.31.1716844136868;
        Mon, 27 May 2024 14:08:56 -0700 (PDT)
Received: from denia.c.googlers.com (125.135.86.34.bc.googleusercontent.com. [34.86.135.125])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6ad850a6dc7sm9511866d6.93.2024.05.27.14.08.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 May 2024 14:08:56 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 27 May 2024 21:08:53 +0000
Subject: [PATCH v3 03/18] media: dvb-frontend/mxl5xx: Refactor struct
 MBIN_FILE_T
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240527-cocci-flexarray-v3-3-cda09c535816@chromium.org>
References: <20240527-cocci-flexarray-v3-0-cda09c535816@chromium.org>
In-Reply-To: <20240527-cocci-flexarray-v3-0-cda09c535816@chromium.org>
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
2.45.1.288.g0e0cd299f1-goog


