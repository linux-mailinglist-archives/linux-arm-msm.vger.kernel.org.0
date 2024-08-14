Return-Path: <linux-arm-msm+bounces-28494-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A8496951A22
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 Aug 2024 13:41:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 353CA1F224D6
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 Aug 2024 11:41:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E5A741B29A3;
	Wed, 14 Aug 2024 11:39:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="jP7pKaH1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com [209.85.219.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 316B31B29BB
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 Aug 2024 11:39:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723635577; cv=none; b=r6VGXIo4B8tp0Z2/bS6e7YI6o5x3MPuKO/0+3ad+d8h7Ex1twiyMhIlVglFuFHxRD0jPjtfpZMktv4GWHzosFHAq+J0YaE8Eq8G06gwop1Hmg/mwBF7u/Y/xipet8Upuksp0lqdr8Lu9Adz5s8zf89t4lHWkUIl2a7ks/BQcc0c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723635577; c=relaxed/simple;
	bh=f6aJO5y6qctXAQENL6bRNRqn7Svp4lX0kLbyb1uIrfg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=EMZg4E5KgDguLSgzhmrwCaJuJf09i96dIg36FTYp9javtZFYMILZSKbNCZo9OVNDt2KCEj//BS6hWtbF9Y8ZplieNZCvGUrPH1nV6V726/0koMBSItb9LZGljSXyTBhUFBMPDQ0Kt2UdVF+M/5wrhRw1JjjIEKP4/IiInyfg7eM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=jP7pKaH1; arc=none smtp.client-ip=209.85.219.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qv1-f44.google.com with SMTP id 6a1803df08f44-6b7a3e468a9so44704196d6.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 14 Aug 2024 04:39:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1723635575; x=1724240375; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NbltI1PXy7zluZAqPhIhWps9lyd2iHaX1NmD3KiJbs4=;
        b=jP7pKaH1FS1FDHZMSvdJYmL0tIwRsFhvHp8rGnDsLCRMLU22HjK2Uzvp4vLh86XcRU
         cYSD2zNqlFWWFyCsAWDoi8fYEfNv6xmh4HkaGKcK0hihWUQ3j5AumE8+FNaCsUJWPfxH
         UdjNX5LIa38/ASmHG5J6bEPXH7HsZ15Yec9qU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723635575; x=1724240375;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NbltI1PXy7zluZAqPhIhWps9lyd2iHaX1NmD3KiJbs4=;
        b=kIcu7FtyP6ZL7v6J8nAzQdJfiOsCF3nG1rhKW0Y233812SI39/962ycYLb8+6G5vOT
         nmaVoZeyT2Nzzbmp1oY7McY+T0gX8Cb49wzpFfHuRod9DNvGJtvBUGYrOApflV3UE6sx
         uPjw+3b6nJ9YKaSGKZBKZ46+LMExP9V4XMkaUNseX9N9r/TMbK+DL7dYnSJN57r5UsHb
         hlIRNKL/pt9L37OJ7Zs2/sSl0CNVNEZltuWcxC0G/aHptj8Pc8UcBUuNdyXHitE5xAp3
         QuQ2K+eyyJ3cHmhH4VogwhqwUYpNZ32izMzP7IZ1S4nXH9VKUVvN58hDjp41oN5Qpu4N
         Tp0g==
X-Forwarded-Encrypted: i=1; AJvYcCXJAEHmF+GbMeTuciaNDGpHOpqiykDr/A0EgF5p4KWi1FaRGmqLrWWKyJd07/6yaWWf8i2Bh0YpF1X+kH8r@vger.kernel.org
X-Gm-Message-State: AOJu0YyM0HGutecpYhgT4T/kq4Ianq6inACaSSVSbBy2Pfvc/kxWkhH8
	+pe58qD2i+YQXwro/CcMDIKnzRsTtxxqZInUXOT3mJN9b5LCWsQnTT1wP1ldVg==
X-Google-Smtp-Source: AGHT+IHweFCYSrJ5VlRLFH54oNC9VVSNaAo0rog5MOspE2NEaZXjQiVr0KeUl63PY2kBjjhRdDlavA==
X-Received: by 2002:a05:6214:2b91:b0:6b5:a8b9:e8ab with SMTP id 6a1803df08f44-6bf5d273a40mr23415216d6.49.1723635575168;
        Wed, 14 Aug 2024 04:39:35 -0700 (PDT)
Received: from denia.c.googlers.com (123.178.145.34.bc.googleusercontent.com. [34.145.178.123])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6bd82ca0daasm42167916d6.68.2024.08.14.04.39.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Aug 2024 04:39:34 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Wed, 14 Aug 2024 11:39:28 +0000
Subject: [PATCH v7 08/10] media: venus: Refactor
 hfi_session_fill_buffer_pkt
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240814-cocci-flexarray-v7-8-8a1cc09ae6c4@chromium.org>
References: <20240814-cocci-flexarray-v7-0-8a1cc09ae6c4@chromium.org>
In-Reply-To: <20240814-cocci-flexarray-v7-0-8a1cc09ae6c4@chromium.org>
To: Stanimir Varbanov <stanimir.k.varbanov@gmail.com>, 
 Vikash Garodia <quic_vgarodia@quicinc.com>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Hans Verkuil <hverkuil-cisco@xs4all.nl>, linux-media@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.13.0

The single data array data[1] is only used to save the extradata_size.
Replace it with a single element field.

This fixes the following cocci warning:
drivers/media/platform/qcom/venus/hfi_cmds.h:175:5-9: WARNING use flexible-array member instead (https://www.kernel.org/doc/html/latest/process/deprecated.html#zero-length-and-one-element-arrays)

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Acked-by: Vikash Garodia <quic_vgarodia@quicinc.com>
---
 drivers/media/platform/qcom/venus/hfi_cmds.c | 2 +-
 drivers/media/platform/qcom/venus/hfi_cmds.h | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/qcom/venus/hfi_cmds.c b/drivers/media/platform/qcom/venus/hfi_cmds.c
index 0a4de8ca1df5..3ae063094e3e 100644
--- a/drivers/media/platform/qcom/venus/hfi_cmds.c
+++ b/drivers/media/platform/qcom/venus/hfi_cmds.c
@@ -331,7 +331,7 @@ int pkt_session_ftb(struct hfi_session_fill_buffer_pkt *pkt, void *cookie,
 	pkt->alloc_len = out_frame->alloc_len;
 	pkt->filled_len = out_frame->filled_len;
 	pkt->offset = out_frame->offset;
-	pkt->data[0] = out_frame->extradata_size;
+	pkt->data = out_frame->extradata_size;
 
 	return 0;
 }
diff --git a/drivers/media/platform/qcom/venus/hfi_cmds.h b/drivers/media/platform/qcom/venus/hfi_cmds.h
index 615ac8d156a5..63b93a34f609 100644
--- a/drivers/media/platform/qcom/venus/hfi_cmds.h
+++ b/drivers/media/platform/qcom/venus/hfi_cmds.h
@@ -198,7 +198,7 @@ struct hfi_session_fill_buffer_pkt {
 	u32 output_tag;
 	u32 packet_buffer;
 	u32 extradata_buffer;
-	u32 data[1];
+	u32 data;
 };
 
 struct hfi_session_flush_pkt {

-- 
2.46.0.76.ge559c4bf1a-goog


