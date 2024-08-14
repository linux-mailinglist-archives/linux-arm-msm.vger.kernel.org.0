Return-Path: <linux-arm-msm+bounces-28490-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 66CE5951A16
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 Aug 2024 13:40:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id EE176B20AFF
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 Aug 2024 11:40:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B79271B14E0;
	Wed, 14 Aug 2024 11:39:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="kgLa47Hc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com [209.85.128.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13D191B0135
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 Aug 2024 11:39:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723635573; cv=none; b=d+TFegzr84PbGcc90OrRdlgAfopTaSp2RFZDOVsbyQ98+OJ0j1MoXTvtZhEJgx/kep/yJ8TCSR50yDiw1k1iQogCjy+NnBvkECGHHXxGjsIn+a4fBl3Eli5AuculVn0jGtKg16NMmR0x7bjVB77MR7wUIOebnZK06KhXwsqDfn8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723635573; c=relaxed/simple;
	bh=Sv3wnLESn0x+4EjPwl9XXffhuwptYLQmakQ09d0MPlw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CTe2NJsdnko+SbsfFTOJUaVK3fT+ORJTSl1webZpSRVUxryasrCSH8BxLt5W8nMBb32cqxXPt8nfQQSylutCG3xC7oubGtXVW/QPHx5EtFuxCagvnvdJoei5p076mCQ3IHSSYJd4NnYvILelw9VXHLqD6xpjNvumh7fB+sga22U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=kgLa47Hc; arc=none smtp.client-ip=209.85.128.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-66acac24443so66030907b3.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 14 Aug 2024 04:39:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1723635571; x=1724240371; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NbZBMh9jJa4Sx0XDfCtUJJo6xYR8XeaNAE9cdhAst/g=;
        b=kgLa47Hc91zsevsh8GSdETSKT864Rccdl7DTPd8C3ry8ZTXANsv16F8HaBGoBfBRFr
         iu2Rp8QbabORqOYCYwk70uvqzi45fG6SQ/14Q/9UzG4AoEeNdQkzWondTfbGXhZRgtk9
         8tBT/dkFPls8JCmzd6/DSL7IUanKkdMS1+TIs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723635571; x=1724240371;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NbZBMh9jJa4Sx0XDfCtUJJo6xYR8XeaNAE9cdhAst/g=;
        b=C4xyKbfBcnr/m26J2UdZIFM6NpNRKYT8QizFk4vZ/ZmTcuwqvycuElu+lFz7CTMUoE
         7QYzYmVQpQHuPi2FHKEejaXVKcG7q6wrwCEGfOU/iiivrL1gxnJcPBqGvP1xD1yPRlT7
         wHcvpsimSCcHhRnalGdYB0sZlkePkBDax51HThHmIpdlgOU0nyrQVrwYvYbfSENnrDzZ
         BSXXfMbbLxU/NpZ5zbATb1hlyqoRqS8s4J0QWBTmOOcO0LixuQG9lmuArrzBlEKJD+lG
         kUR0NaPUI0nnl12K/QJB0YtIm9Zah1pFvoJ43MsS3qByxNLOCcaBYDUoGGg7ORoeIA5+
         Fm2g==
X-Forwarded-Encrypted: i=1; AJvYcCVeP33lRAqMmDOMJ6xdbkAdnnGVA08HgZf/9wrjrumOEc4qe46Iuu6rvlrO96AsgqJ1XhiVPNoEppe9Wt76yLkrAcKWGNqrvactiKeZjw==
X-Gm-Message-State: AOJu0Yz00tksvPjIbhzqdd957Ov2OyGVydMwvuxAXiKZ9W0DVt4o/dJ3
	0BmHd6VkSxAs83hSv9E9/jb9ze7hWTJc18nU95QzCdZqNavuPULTo2fFbomsKQ==
X-Google-Smtp-Source: AGHT+IHRsykAwCMx5tZRxY5hmqyA+Ey5x0wiBbORQkW1hfMduV6yGvJe4ltt2zFO97WRae+NRAydfA==
X-Received: by 2002:a05:690c:fd4:b0:62f:cb31:1be with SMTP id 00721157ae682-6ac95696a52mr30104587b3.8.1723635570906;
        Wed, 14 Aug 2024 04:39:30 -0700 (PDT)
Received: from denia.c.googlers.com (123.178.145.34.bc.googleusercontent.com. [34.145.178.123])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6bd82ca0daasm42167916d6.68.2024.08.14.04.39.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Aug 2024 04:39:30 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Wed, 14 Aug 2024 11:39:24 +0000
Subject: [PATCH v7 04/10] media: venus: Refactor struct
 hfi_uncompressed_format_supported
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240814-cocci-flexarray-v7-4-8a1cc09ae6c4@chromium.org>
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

plane_info is not a typical array, the data is not contiguous:
pinfo = (void *)pinfo + sizeof(*constr) * num_planes +
	2 * sizeof(u32);

Replace the single element array with a single element field.

This fixes the following cocci warning:
drivers/media/platform/qcom/venus/hfi_helper.h:1009:36-46: WARNING use flexible-array member instead (https://www.kernel.org/doc/html/latest/process/deprecated.html#zero-length-and-one-element-arrays)

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Acked-by: Vikash Garodia <quic_vgarodia@quicinc.com>
---
 drivers/media/platform/qcom/venus/hfi_helper.h | 2 +-
 drivers/media/platform/qcom/venus/hfi_parser.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/qcom/venus/hfi_helper.h b/drivers/media/platform/qcom/venus/hfi_helper.h
index 5e91f3f6984d..3edefa4edeb9 100644
--- a/drivers/media/platform/qcom/venus/hfi_helper.h
+++ b/drivers/media/platform/qcom/venus/hfi_helper.h
@@ -1011,7 +1011,7 @@ struct hfi_uncompressed_plane_info {
 struct hfi_uncompressed_format_supported {
 	u32 buffer_type;
 	u32 format_entries;
-	struct hfi_uncompressed_plane_info plane_info[1];
+	struct hfi_uncompressed_plane_info plane_info;
 };
 
 struct hfi_uncompressed_plane_actual {
diff --git a/drivers/media/platform/qcom/venus/hfi_parser.c b/drivers/media/platform/qcom/venus/hfi_parser.c
index c43839539d4d..3df241dc3a11 100644
--- a/drivers/media/platform/qcom/venus/hfi_parser.c
+++ b/drivers/media/platform/qcom/venus/hfi_parser.c
@@ -157,7 +157,7 @@ static void
 parse_raw_formats(struct venus_core *core, u32 codecs, u32 domain, void *data)
 {
 	struct hfi_uncompressed_format_supported *fmt = data;
-	struct hfi_uncompressed_plane_info *pinfo = fmt->plane_info;
+	struct hfi_uncompressed_plane_info *pinfo = &fmt->plane_info;
 	struct hfi_uncompressed_plane_constraints *constr;
 	struct raw_formats rawfmts[MAX_FMT_ENTRIES] = {};
 	u32 entries = fmt->format_entries;

-- 
2.46.0.76.ge559c4bf1a-goog


