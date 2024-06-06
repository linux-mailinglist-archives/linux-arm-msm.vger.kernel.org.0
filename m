Return-Path: <linux-arm-msm+bounces-21935-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 97E388FE780
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Jun 2024 15:19:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 23624B24DA0
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Jun 2024 13:19:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6EDC2195FCB;
	Thu,  6 Jun 2024 13:17:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Hz5QRfdb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com [209.85.219.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B20A2196DBD
	for <linux-arm-msm@vger.kernel.org>; Thu,  6 Jun 2024 13:17:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717679860; cv=none; b=jBMQQwfjHjnimSU+/9n0Nku7aQ7QAWn9fA0f27z8jFGtqokJKvUXEMNdDKViP/xAK1v4LAQAK6vpYix/2NJwG/5IZq2+/1X8qxqnGUSsGQWfTmjybvOLjYEd40z1DBB9bKs4IMkzUWiOsvqruOLmx3HwVXafzP5OT8nkS8qkrGQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717679860; c=relaxed/simple;
	bh=eSS6CFxpjOrEMCtb9xmg56c0gCLfaI7dITUwdjRcSbo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=EadpLDnHuA29yVhK34wCUrFZGDd5DemqyV3HAbEK/wrK6COCJFjFXzyO6vEp53EO9jztcMj/FM4pxzMeIqSEby1b9t+QRQoEjQ9Q9+CyuX6uE/GEXC1Fr1ci2r11cxw5cNQCMI/u/jh62Wozf1fL/kh/OPU7eXvkLvxmnbSAOoE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Hz5QRfdb; arc=none smtp.client-ip=209.85.219.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qv1-f46.google.com with SMTP id 6a1803df08f44-6ae0c4d23ddso5024646d6.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 06 Jun 2024 06:17:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1717679857; x=1718284657; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iAc0af9hq9pueFWwvpNqs+gjxvVge6a6O9DHrtQZV0s=;
        b=Hz5QRfdbzej5QLlbrWvb4i+VPuU2IgPOnLuFxX7frGcuhbkT9mZy3FbM35RiBVoJIv
         7zeEOd/K0SSh/F0Vaeb8eQOq77+5ef6L8xe2HOYFsGB7hcgUHaSRVw5T6ru9QvcDGFHz
         m8FvAIrqdJkP8dyR1Qo6oJuLOWyFLcxWsewKE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717679857; x=1718284657;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iAc0af9hq9pueFWwvpNqs+gjxvVge6a6O9DHrtQZV0s=;
        b=X/FA95u2ibww1BekIDAOYMhn5HjJkPWkYcmgPpbvxhEfkya+g1bbU1x/CDhPdeB++C
         5AA7oTXiMHfnBBJy+Ukp33XfGT0i7S2H8XfyTT3/k0RCi1Bl4r2XmiLk/6rKbWxQRrTn
         ylHo1ednlr+sCPO3XJjPEvbLw69HBX6Rd4tKdwuNPzOlMzMzqVIz6TjrGl8B9My/NJ0o
         bSz+gGydiCHswl0oBEftMw6P4PkCZW9bagMhLIvmsspulXGk1tDmUwpAHc8qJAr258Ff
         +QqxWRcsbh7Aq2RsrtAOXoW2jJWNfzIcoaeyVaAKDGuXDEBdOIOxQ0vcY5gLisA+7IM/
         Tx4A==
X-Forwarded-Encrypted: i=1; AJvYcCX6qnRr9ClFNDKcOruf8ATUlu0sKDr2Fsqh4bOo1CwNe8W63m7x34lTWEpxlpN+7GVEevq4n9GDQdhuaB2R2vCFukk4MODq8xJxPf+SLA==
X-Gm-Message-State: AOJu0Yx3RNHOBVBT82MNwUYZ4EY9FpdbK1MS1UfcTcaFDTkM18xB3Qdi
	qtHXbkzKgL6lMvd+p0lW9MuOUMf9PJeJEP6PuNnoq3YFGMd2s5TaWyLdHxArwg==
X-Google-Smtp-Source: AGHT+IEJIOJiyMJDDmMHLc74buNW9eEFQjpvgj2J4ah7/DbHCd2DHUJMyDhfPoLk1ARALTqqXFgIww==
X-Received: by 2002:a05:6214:451e:b0:6af:5af5:cf63 with SMTP id 6a1803df08f44-6b020320c3emr73595046d6.1.1717679856728;
        Thu, 06 Jun 2024 06:17:36 -0700 (PDT)
Received: from denia.c.googlers.com (123.178.145.34.bc.googleusercontent.com. [34.145.178.123])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6b04f6607f5sm6118036d6.31.2024.06.06.06.17.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Jun 2024 06:17:35 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Thu, 06 Jun 2024 13:16:40 +0000
Subject: [PATCH v4 06/11] media: venus: Refactor struct
 hfi_uncompressed_format_supported
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240606-cocci-flexarray-v4-6-3379ee5eed28@chromium.org>
References: <20240606-cocci-flexarray-v4-0-3379ee5eed28@chromium.org>
In-Reply-To: <20240606-cocci-flexarray-v4-0-3379ee5eed28@chromium.org>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Stanimir Varbanov <stanimir.k.varbanov@gmail.com>, 
 Vikash Garodia <quic_vgarodia@quicinc.com>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: Hans Verkuil <hverkuil-cisco@xs4all.nl>, linux-media@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.12.4

plane_info is not a typical array, the data is not contiguous:
pinfo = (void *)pinfo + sizeof(*constr) * num_planes +
	2 * sizeof(u32);

Replace the single element array with a single element field.

This fixes the following cocci warning:
drivers/media/platform/qcom/venus/hfi_helper.h:1009:36-46: WARNING use flexible-array member instead (https://www.kernel.org/doc/html/latest/process/deprecated.html#zero-length-and-one-element-arrays)

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/platform/qcom/venus/hfi_helper.h | 2 +-
 drivers/media/platform/qcom/venus/hfi_parser.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/qcom/venus/hfi_helper.h b/drivers/media/platform/qcom/venus/hfi_helper.h
index eb0a4c64b7ef..dee439ea4d2e 100644
--- a/drivers/media/platform/qcom/venus/hfi_helper.h
+++ b/drivers/media/platform/qcom/venus/hfi_helper.h
@@ -1006,7 +1006,7 @@ struct hfi_uncompressed_plane_info {
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
2.45.2.505.gda0bf45e8d-goog


