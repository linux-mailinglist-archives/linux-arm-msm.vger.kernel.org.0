Return-Path: <linux-arm-msm+bounces-19327-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CA2FC8BE3DA
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 May 2024 15:26:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 860C428B5C8
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 May 2024 13:26:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D018B16EBF1;
	Tue,  7 May 2024 13:18:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="JtFfH2cG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com [209.85.219.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1C7916DEC0
	for <linux-arm-msm@vger.kernel.org>; Tue,  7 May 2024 13:18:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715087922; cv=none; b=WuNPYjKEsr1uXqqxRm9DXQhUOZfAutLGJjXfnvK3p7M/ktHGLMPYGHdv3MhK9c26BFE4AviuTvYsw38Ab68UyjeUabO3SpqVWfuSeGpleoiYs4wHsOl9AcnYhOosgqBfp8bcKRSgWI1RGwKAVDReDF0rb50VCwxzeYc+0yxnkNg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715087922; c=relaxed/simple;
	bh=9NQhYiz/IbLF6F7xrUyCvcZeCyvNKJflJvFw3WrA/2Q=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dXWyfPlzPraVKhkb4WCfbta4lkJtqpWDbnAXKlRHfHbUhHooJO9E6RbDR7s5wbsSvRXZmbonp6+E4J21FZdmQTbND2i2MzGsZq4JJZjV1pOKOvyRV9EbsdjYnT6KNRobnkwDIAAqEQHOl6LJlkFNfZsNYjxINw557AvwEryNe1I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=JtFfH2cG; arc=none smtp.client-ip=209.85.219.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qv1-f46.google.com with SMTP id 6a1803df08f44-69b5a87505cso17667466d6.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 May 2024 06:18:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1715087920; x=1715692720; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WR87o59ttHnNvNigBqZHzwph/s3gT6BLw9Ga86sRtPA=;
        b=JtFfH2cGcjafuPkormhgFTXYN5icqyHToRCqOanoGWywBAv15WOhzX7Yr/hNCBbAh9
         UL/9mfYyfkvnseYqsoXooMmkPQFGWZUochXnI59uSMICypEzYxNfS028r6x3qvuXJTtf
         LXfoHLOggxXCMD50eYw4FhGeXCnpuLG2X7ndk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715087920; x=1715692720;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WR87o59ttHnNvNigBqZHzwph/s3gT6BLw9Ga86sRtPA=;
        b=BYjLtLndaPQ2EaNeiYHarFSyGM8LRDdNjKEtITbuteU0zAlcimYK1p9R+Qcu749r7L
         UpQtDbq8e1Str9Rj4SlvD3EeSGSUAfKSeqlLKBpi105EqHSF+ueahprICsyRD1Q0Crrr
         i9hvNmD0a6E4WEKtUEW82JFHLO6PwDApLjI32238sjQjuQYh8kJB63mNvEdzgcroJMab
         egevvGgqId6IRItnVwlSgsOXgPzvviQhDerFQVHiran9J0MoCfg0lRGMhjpNYBGgTI2D
         x9+rib8SRsCTQKUjjwqnyU8ZwhvclTiwBj0cMCvMsFNnHwu7RXMafuwlf39OzzhrWjPk
         K+KA==
X-Forwarded-Encrypted: i=1; AJvYcCU/f7TFl0ghCLYhc9yaL9noCMiQ4ha4vJ8kjtbEWmbrmYX1O3jSMmzBYmvKFPi9yqVcQF7mcXwJnCsPnwbpB5aPQFdbsPE1LrY2fG6x2Q==
X-Gm-Message-State: AOJu0YwKfS3/BXxtdDGraDzDdaupONvGWstlnduJ56ZdEJ30JvOQR11A
	7wv21IXDjkinOWnHjV40QsCvkEYU1mqiymRk95UWWH5FsxJRHX6dD+Ftt4nBOg==
X-Google-Smtp-Source: AGHT+IGatpIQRwE9h01tY7yyLZRrAcLmql6eJb+YKcxD2Wq6gpUB9pyNvjqWHkivGZUb+9PKsnvIcg==
X-Received: by 2002:a05:6214:c4b:b0:6a0:def6:6c8f with SMTP id r11-20020a0562140c4b00b006a0def66c8fmr15390917qvj.47.1715087919625;
        Tue, 07 May 2024 06:18:39 -0700 (PDT)
Received: from denia.c.googlers.com (114.152.245.35.bc.googleusercontent.com. [35.245.152.114])
        by smtp.gmail.com with ESMTPSA id t15-20020a05621405cf00b006a0d19c3139sm4655105qvz.118.2024.05.07.06.18.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 May 2024 06:18:38 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Tue, 07 May 2024 13:18:36 +0000
Subject: [PATCH 10/18] media: venus: Use flex array for
 hfi_session_release_buffer_pkt
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240507-cocci-flexarray-v1-10-4a421c21fd06@chromium.org>
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

Replace the old style single element array with a flex array. We do not
allocate this structure, so the size change should not be an issue.

This fixes the following cocci warning:
drivers/media/platform/qcom/venus/hfi_cmds.h:204:5-16: WARNING use flexible-array member instead (https://www.kernel.org/doc/html/latest/process/deprecated.html#zero-length-and-one-element-arrays)

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/platform/qcom/venus/hfi_cmds.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/venus/hfi_cmds.h b/drivers/media/platform/qcom/venus/hfi_cmds.h
index 41f765eac4d9..6dff949c4402 100644
--- a/drivers/media/platform/qcom/venus/hfi_cmds.h
+++ b/drivers/media/platform/qcom/venus/hfi_cmds.h
@@ -201,7 +201,7 @@ struct hfi_session_release_buffer_pkt {
 	u32 extradata_size;
 	u32 response_req;
 	u32 num_buffers;
-	u32 buffer_info[1];
+	u32 buffer_info[];
 };
 
 struct hfi_session_release_resources_pkt {

-- 
2.45.0.rc1.225.g2a3ae87e7f-goog


