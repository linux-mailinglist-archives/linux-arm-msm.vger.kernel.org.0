Return-Path: <linux-arm-msm+bounces-19321-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 272478BE3C2
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 May 2024 15:24:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BA9451F213D5
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 May 2024 13:24:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2859B16C873;
	Tue,  7 May 2024 13:18:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="bv7ZuYR1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com [209.85.219.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D657516C693
	for <linux-arm-msm@vger.kernel.org>; Tue,  7 May 2024 13:18:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715087917; cv=none; b=R5v6PNSKwv1kdT2jK2tSPDC8HzMBHxmVjpIdXKG5086XBeCrhUL7U3caBNUXiWQCpGDWSiFaqgjRlin7eTwLAT0YpJvpRMhGsA42n4XoIKzgShzpWRAtmzUVoT0oDXeg8DSVbZfxtLCG5FRqdSwplH42JgEu4WLNqBV3lz5MZGU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715087917; c=relaxed/simple;
	bh=OkrWWOrUN5GNEWioxP3gYdPUo0/0BfsqCVC0RCoziIM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=EXPRKvYbkp6WIlDrA0gF9wPNe0vuAdSfNbpqS8sCSo2AKE60Uz96x7yyv47l4YvMIl3CsFxLJNcyOgjWaqvSznxI1ighwl4wNOlmzx0trIZAW0Me7RhhoGaf4ng8eyTtxjmEqdkvfYAFNoN6AOAchJKD0pAj86nLw2BA7ROesUw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=bv7ZuYR1; arc=none smtp.client-ip=209.85.219.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qv1-f50.google.com with SMTP id 6a1803df08f44-6a0f889877cso11715046d6.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 May 2024 06:18:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1715087914; x=1715692714; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1/P1ujR64RjpeY3CCEbW1xPPMvUuqlT7weCmbLOLgyg=;
        b=bv7ZuYR1JSua4HN2zGrac6dR80LTnt3qfwi0LYYW10A4oCkGiy/9dj0lr5csx0dB6D
         pvlzvvBoE+0oi9e+NvhdD9hOkpm6ee2zH/O2Z6mYkRvD0/IXdVRgYf/BMt2TPxpheY4M
         pTXKYP+wd8A6lTiRyokt7qJNrZpmL3F7X+B1A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715087914; x=1715692714;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1/P1ujR64RjpeY3CCEbW1xPPMvUuqlT7weCmbLOLgyg=;
        b=s9jEeSmYn5oZLucef4VQ9n3wq4JcPkzbQcHcULLriQt9IIBPH+MjUTx0B8UyJf6yaZ
         +7hoN0E6CYy317tAZvRHbMea7tg7IPGbitr55JwWaoDuDOF/IzpM04vgDHErTJC9fWnZ
         w93QCCgMlOXeRZJyi2GZovyRuRy9CAN/qbnGOz2zjiyAPiCU+e02d3Zj9V2GtuR+7UCl
         hKa+6mOwmg4Ov3santTdK/Ann6swPmkJRq4q+zk7HynhoHuNG7NLML/z4G/P8gPyi0uF
         HD1Ui73uU3cgaaFlhSVciI8U/ZYzWTAN7IeZJpYyrQKr2TtNlAZn7OCWsBL11Eu05c2Y
         RB5g==
X-Forwarded-Encrypted: i=1; AJvYcCXM3hpZk3qUTtQxFZ9GymwYbUWMBrgvkhthyUUncxgN/Az2ld7Nryu81GmIfzAjDDkBGZD+Y6IJHc4Jiy7jHqjNqPftV5ab9Qo0kEOTEA==
X-Gm-Message-State: AOJu0YzG48V6ykFUMKiZ+NVTOlH5/iXR9pwvDoXdBsCffVsj2TYa8HmB
	SR90TQ/uKNSj1sJo8jEbtTV2yGc4gDokENqRZW/wJ24FI/YqHgxSUJtu4lzdaA==
X-Google-Smtp-Source: AGHT+IEHmgR44JJkt0kGIzW7NOaECWfdPMcTxHBijYkMDjUQ//6R0gtSxgRSvy3DiBlPMd5HBstr/Q==
X-Received: by 2002:ad4:576b:0:b0:6a0:6545:2306 with SMTP id r11-20020ad4576b000000b006a065452306mr15355570qvx.28.1715087913906;
        Tue, 07 May 2024 06:18:33 -0700 (PDT)
Received: from denia.c.googlers.com (114.152.245.35.bc.googleusercontent.com. [35.245.152.114])
        by smtp.gmail.com with ESMTPSA id t15-20020a05621405cf00b006a0d19c3139sm4655105qvz.118.2024.05.07.06.18.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 May 2024 06:18:33 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Tue, 07 May 2024 13:18:30 +0000
Subject: [PATCH 04/18] media: dvb-frontend/mxl5xx: Use flex array for
 MBIN_SEGMENT_T
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240507-cocci-flexarray-v1-4-4a421c21fd06@chromium.org>
References: <20240507-cocci-flexarray-v1-0-4a421c21fd06@chromium.org>
In-Reply-To: <20240507-cocci-flexarray-v1-0-4a421c21fd06@chromium.org>
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

Replace the older style one-element array with a flexible array member.
There does not seem to be any allocation for this struct in the code, so
no more code changes are required.

The following cocci warning is fixed:
drivers/media/dvb-frontends/mxl5xx_defs.h:182:4-8: WARNING use flexible-array member instead (https://www.kernel.org/doc/html/latest/process/deprecated.html#zero-length-and-one-element-arrays)

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/dvb-frontends/mxl5xx_defs.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/dvb-frontends/mxl5xx_defs.h b/drivers/media/dvb-frontends/mxl5xx_defs.h
index 3c5d75ed8fea..512ec979f96f 100644
--- a/drivers/media/dvb-frontends/mxl5xx_defs.h
+++ b/drivers/media/dvb-frontends/mxl5xx_defs.h
@@ -179,7 +179,7 @@ struct MBIN_SEGMENT_HEADER_T {
 
 struct MBIN_SEGMENT_T {
 	struct MBIN_SEGMENT_HEADER_T header;
-	u8 data[1];
+	u8 data[];
 };
 
 enum MXL_CMD_TYPE_E { MXL_CMD_WRITE = 0, MXL_CMD_READ };

-- 
2.45.0.rc1.225.g2a3ae87e7f-goog


