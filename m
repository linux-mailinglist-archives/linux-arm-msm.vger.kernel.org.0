Return-Path: <linux-arm-msm+bounces-21938-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id BFC598FE788
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Jun 2024 15:20:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BEBC81C2232C
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Jun 2024 13:20:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0181C198837;
	Thu,  6 Jun 2024 13:17:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="DjjfF8dT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ot1-f52.google.com (mail-ot1-f52.google.com [209.85.210.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24EB5197A62
	for <linux-arm-msm@vger.kernel.org>; Thu,  6 Jun 2024 13:17:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717679863; cv=none; b=Q7lyAR5fpz/Yn/gNYpzAw5hgMpRorcBg0kuNvbrPl9RAF0ev7cy69HsRssu96WINy7TQ9cSEWRjwMl61N4nYZ7FMHh5V9r253IqhJLIZAJCk73HXJ+U17zn5IHsAry20RO7C08QF2KubnbnKSXzzFm8sIDsvuLcsx2+costQ1DI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717679863; c=relaxed/simple;
	bh=uRrwC8FD53XE8snF88MCg3YmB4JlgvZCoOrRUf+Aarg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Oqh7CKB3zXQeT48yU7og1kuFYvQEdohkqBTRpF27dyZeUlPM8H9srxJ6Q0dHP3YEMEa+9uoY3hXYRfkoD4gHnzPzruJS06SXsEtQg3VdH9oe0VMmR3ZnyrgGh24zmmO0pnU7v6MekiHoRoAz9LIwZvPUzvWdXtycES/KnTj8kmk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=DjjfF8dT; arc=none smtp.client-ip=209.85.210.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-ot1-f52.google.com with SMTP id 46e09a7af769-6f72b8db7deso530401a34.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 06 Jun 2024 06:17:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1717679860; x=1718284660; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6VGhOi0hNkAMdTQTUdauz7KIyv6SLUrF14jCtpe3Zco=;
        b=DjjfF8dTX6CwRsYinTcX+b0YEDptOW/hHDl897jSdewsymydisNcuYARPQ9UEVMvjC
         ix1XdM/e8qrCtSzoO2SHQ8uBWpwyLQUt+oBc0lzeuW9YDrJvjiEs7px100wjZ+XMn7YF
         lUlVn1HBIpgMoTTJ8Vi1nCz20SIIAEOE9bIZI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717679860; x=1718284660;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6VGhOi0hNkAMdTQTUdauz7KIyv6SLUrF14jCtpe3Zco=;
        b=eekov/VMX5+rRN+NUlqM8ss0se2wdDCC7+sVZapbfrBt15wrbyxWqXXf5MXWm1lq4z
         c7suWaR6fiUrEXW8WK5pFXRSyOn3FQb6GpUNwn3m/OlcM2+X4krQCCky0U3hM1xKbAUo
         dOT281EGvbrI2If7wsFECgsKgmR0bodKBmdU1VtfXWn4dMChiyQ9L3wjQnrSdxHscH3P
         5tXUzf0LPZrLLTEiYu7kBfjTrCtFNvD00lZZAajiYujQN/jfgDoRadlcTebP492aQDFg
         8qylN6OrBOucE555gZ53zmQic4mgzbsN0s41NfiI7ZaxysQRIiEZlsuPxJA1sT/VKYMJ
         s53g==
X-Forwarded-Encrypted: i=1; AJvYcCWgoxJ6wTcNIVtogIzVntccc2BQq8sHzqvqj4vFQRlXoO+EGayjh32E38pDBwiIPbbkJy65jGGZfqB70kdv0yXVSIUB7RXGAuvhySoJCw==
X-Gm-Message-State: AOJu0YxtHzOEZCZpWnVOI0/fo6s9aVCpPpAp4cyEkg6kA76Pgo7x/YEd
	hJEhLwiCok7bNf5UZMMV93Ug8x2lSxSUAF+oJv0fkaMf0XO2NgBt1mcg5c6vVWCF7jQaDXvvv8J
	a3tNv
X-Google-Smtp-Source: AGHT+IFX9KGFgZD+xuwao+c++qZJRxYqYJVh/LsTI7EaXew+xbdJzstfPx2aof9T7S7zaI4fW+k32A==
X-Received: by 2002:a05:6358:2908:b0:19c:45cc:e2c9 with SMTP id e5c5f4694b2df-19c69b89b75mr683604755d.7.1717679860105;
        Thu, 06 Jun 2024 06:17:40 -0700 (PDT)
Received: from denia.c.googlers.com (123.178.145.34.bc.googleusercontent.com. [34.145.178.123])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6b04f6607f5sm6118036d6.31.2024.06.06.06.17.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Jun 2024 06:17:39 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Thu, 06 Jun 2024 13:16:42 +0000
Subject: [PATCH v4 08/11] media: venus: Refactor
 hfi_session_empty_buffer_compressed_pkt
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240606-cocci-flexarray-v4-8-3379ee5eed28@chromium.org>
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

The single element array data[1] is never used. Replace it with a
padding field of the same size.

This fixes the following cocci warning:
drivers/media/platform/qcom/venus/hfi_cmds.h:146:5-9: WARNING use flexible-array member instead (https://www.kernel.org/doc/html/latest/process/deprecated.html#zero-length-and-one-element-arrays)

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 drivers/media/platform/qcom/venus/hfi_cmds.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/venus/hfi_cmds.h b/drivers/media/platform/qcom/venus/hfi_cmds.h
index 8768ee052adc..2c56ae303989 100644
--- a/drivers/media/platform/qcom/venus/hfi_cmds.h
+++ b/drivers/media/platform/qcom/venus/hfi_cmds.h
@@ -143,7 +143,7 @@ struct hfi_session_empty_buffer_compressed_pkt {
 	u32 input_tag;
 	u32 packet_buffer;
 	u32 extradata_buffer;
-	u32 data[1];
+	u32 data;
 };
 
 struct hfi_session_empty_buffer_uncompressed_plane0_pkt {

-- 
2.45.2.505.gda0bf45e8d-goog


