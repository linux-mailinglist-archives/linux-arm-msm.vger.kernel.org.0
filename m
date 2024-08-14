Return-Path: <linux-arm-msm+bounces-28487-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C805951A0D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 Aug 2024 13:39:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 09EC81F21E90
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 Aug 2024 11:39:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B19F21B0107;
	Wed, 14 Aug 2024 11:39:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="exnUTxQo"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yb1-f179.google.com (mail-yb1-f179.google.com [209.85.219.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FB071AED47
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 Aug 2024 11:39:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723635570; cv=none; b=OWG81+K4KhT5eLa+cNmTX9/rIf921Os4boWiZbxePN+WcJYW80fwko5sTzUf6vD3NxhCmmdsMMcU6AysF6sD5hKZPoR4c6w9CetoszPSSUW2z4KT/VycGhmaFSJbT9zJKjrSRHb/8xEipDs22iZowaTDRipKkr7WU1iQp7vBDkI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723635570; c=relaxed/simple;
	bh=R1PA8oQuTM3Rzjg5+SIhm6Kcapuh62793jx02QTgMY0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hUp/yVwaIrNFg4bqoTsZQB3nXGVZ9EoCwSnPpGUboA/78FCCuaFspLtEG/Bxb9OAFTRSoFUa6WV81kU3zjmDI31v5Sut8+ajTIy1AUfHuHfnHzgP5pzVn22eyBSTveSbxSUryqPIGafwZPuMlrAVL/ATe26vYz2MRy7JaYYrywo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=exnUTxQo; arc=none smtp.client-ip=209.85.219.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-yb1-f179.google.com with SMTP id 3f1490d57ef6-e115eb44752so460057276.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 14 Aug 2024 04:39:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1723635568; x=1724240368; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+E5Cp8MkPIwpZAw+YrCVKJ1cqUbJ91RXqLOqVZdLQHE=;
        b=exnUTxQoSCW61Q+un2gAVat7J+3yjd/s1cV8lrIYEA6fhQPZBHWqjSrT3c5ZZKp5fE
         D+e5oTd7k6R9ZHkJ6qhZRGJqcySA240XNT+EjT3t9iuoXY8EokVpe8zjIV8MBxhldHYh
         nKbrQD84NYJ/rMl9JpzL4O5p27uHpzm1HwQ18=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723635568; x=1724240368;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+E5Cp8MkPIwpZAw+YrCVKJ1cqUbJ91RXqLOqVZdLQHE=;
        b=F1xQNCTWzsmkrBXFjhIgvM1JSHkiyqHaEq4F3AU9f54ou63D9U9UNNILExuIf1BTUt
         XgXPrXqJBsElcC4MlxyEqF79SS/yxLZpTG20swS4NrUXhAU7XjbNpdMuW2dgrfclO9QK
         /wJR7thwtUtE0VdoGy3q6gD8aKdQ/T+6HuWe/gMuEFfJC510tPgo7bLDFqhXs8VeP28E
         Po6nL4vBmDxUAGRGWjJ0XikAuUHzGfASLrVrUKMAu0LHURfQ7X3ZWSpyK64YRsiSr7GB
         p1UCUOT5UcqivAsSeHZfbvn1dNeS2QNV/oicHbvWaqj+Ocjs1MW2XyKjSZ+S85ekQEmg
         6NWg==
X-Forwarded-Encrypted: i=1; AJvYcCWOVMYCgI9gjdR4co4HDDI+lgqk6lHD3+w9cnhXFdJkCH6a75wsVq14mM1dTsQbCf9rdJq5pXlhVdu3rRxuxBGEZlRLIqlfhZYi0rJHYA==
X-Gm-Message-State: AOJu0Ywn2fTI+69fKaTYIQVJooigi93cGofBGmzaAmsbLv9ee+iWn3Ek
	sx1zkOBJJC2mmOPoh8fo1ggs4PABFlO0RTMcp8O1Bh73p0W4toAXq/8ViOov6w==
X-Google-Smtp-Source: AGHT+IH4HRHiY7J0a3dkMQnnmztUnfpAtb+vJO43WbTYlwvIuzF4AM3KwSduHBvZYPZPpJXTBCsLgw==
X-Received: by 2002:a05:6902:2387:b0:e0b:56a7:9a6a with SMTP id 3f1490d57ef6-e1155aad833mr2512251276.23.1723635568084;
        Wed, 14 Aug 2024 04:39:28 -0700 (PDT)
Received: from denia.c.googlers.com (123.178.145.34.bc.googleusercontent.com. [34.145.178.123])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6bd82ca0daasm42167916d6.68.2024.08.14.04.39.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Aug 2024 04:39:27 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Wed, 14 Aug 2024 11:39:21 +0000
Subject: [PATCH v7 01/10] media: venus: Use flex array for
 hfi_session_release_buffer_pkt
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240814-cocci-flexarray-v7-1-8a1cc09ae6c4@chromium.org>
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

Replace the old style single element array with a flex array. We do not
allocate this structure, so the size change should not be an issue.

This fixes the following cocci warning:
drivers/media/platform/qcom/venus/hfi_cmds.h:204:5-16: WARNING use flexible-array member instead (https://www.kernel.org/doc/html/latest/process/deprecated.html#zero-length-and-one-element-arrays)

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Acked-by: Vikash Garodia <quic_vgarodia@quicinc.com>
---
 drivers/media/platform/qcom/venus/hfi_cmds.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/venus/hfi_cmds.h b/drivers/media/platform/qcom/venus/hfi_cmds.h
index 20acd412ee7b..42825f07939d 100644
--- a/drivers/media/platform/qcom/venus/hfi_cmds.h
+++ b/drivers/media/platform/qcom/venus/hfi_cmds.h
@@ -227,7 +227,7 @@ struct hfi_session_release_buffer_pkt {
 	u32 extradata_size;
 	u32 response_req;
 	u32 num_buffers;
-	u32 buffer_info[1];
+	u32 buffer_info[];
 };
 
 struct hfi_session_release_resources_pkt {

-- 
2.46.0.76.ge559c4bf1a-goog


