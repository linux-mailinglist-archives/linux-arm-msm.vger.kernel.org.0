Return-Path: <linux-arm-msm+bounces-28384-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CC4B950509
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Aug 2024 14:33:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 96F39B2767E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Aug 2024 12:33:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 27F1619D891;
	Tue, 13 Aug 2024 12:31:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Jq50SsSY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ot1-f43.google.com (mail-ot1-f43.google.com [209.85.210.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C7AD19D06A
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Aug 2024 12:31:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723552296; cv=none; b=nHmdmnmP6Z0DOe9ZZSaZhsahXJCWTbZSlB7TsjwWg2VGOgUzsorlz+NAoUxQmqvTQNc0h1NZTB2M6vz81Ll2eEhNVdfbmw4xO4MI5IW1CzDhV9fqA0zbzUa+hpVjtCxJVeWfwCKNYKuYEs0Q6Gqh1ih3UjmavCS0TBVvn+sAn+0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723552296; c=relaxed/simple;
	bh=XHYQDkjDMyOGGgCU6Mjf54/QzhOW3tNUgMmebpG++2I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=E6vjlRlTlJ161gBZmC8l80Amok5B1AhSV6zzzh5L8Sr9+HSLb+2rrKwY1iLM3MXdAmQtAO+wn5ZW1cvX6n1W74oTw8dFS8Qpi6NnTKYOdd/DtvE+gttPSIfzoz7H4m4OpmbUGUVlfRSfG2INvbRQT2UQirO0yRtmbbLoo6zUA6E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Jq50SsSY; arc=none smtp.client-ip=209.85.210.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-ot1-f43.google.com with SMTP id 46e09a7af769-70944dc8dc6so2776293a34.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 13 Aug 2024 05:31:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1723552293; x=1724157093; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SmP2dlTbOpENrA/D3hKhfvN/jpkEsPn3dnXsTIK3Biw=;
        b=Jq50SsSY8fa1/W9DkR/dV5z1KQFHvz+1g65BkRr2PJYs82rMVI+RsCoDghiKBXDfiq
         Chb6QzfUTi6Jgi3AkLGRISnXeA4Ho4tyNKNdGrj8YYfFjrWqEfYEKEkCo0J2uOG0a24f
         AMtOqX7ZG1eYU60hBuOiz63JsiO0OlS3wWr9k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723552293; x=1724157093;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SmP2dlTbOpENrA/D3hKhfvN/jpkEsPn3dnXsTIK3Biw=;
        b=iY17+EKVyh9hNOnxMyOybe4Oa0/3r2HOIlvcsGd4xh3TvLOQpiuogJ0ywGmsbrPVhB
         Z48BrBYah6JoXPtnMOMJ8luXC57Sr1odKqTS6rqVdGzoEnkR18bALCQcZp0KZjpJ2lgX
         Y9zngxGGVgm4j+KVHdOXrkdlUXtLedHnV4Dhdlg7wOInhzabysi5ZFx4wsUSRDgHTEO+
         U8WEKD2uPhrGdOWGtGYK2g5cLxXzld5FRpipiglq6/IhN9mouwsNY/kCpUJR9PPoh0NG
         DF6L6R1Iqd7qdgoZATTcGNiYKDpLAWY82D5eQS38JDUdMoIR1d5oTxUSB4k4Ss60/KzR
         uPIQ==
X-Forwarded-Encrypted: i=1; AJvYcCV4nPlQtY1IqsPnQNSdGs0QMj2GR+5YXzC93y+xWrRKpjHfOg6uvmkAqKuxrQ+XfS6eg4mgHIN4co6XXF7YZRFxV6XCI5c1p4RpTBcLbQ==
X-Gm-Message-State: AOJu0YxaAt1affLY+2CKhquu6iNLJJpgEWYJkegH7BoS7eiSViJajG7C
	0c93EB4l/IybFs5uH3hFy15mtM9vQW+WlfQMjVQ+/X/iim1ed8PrN7riXz0aOw==
X-Google-Smtp-Source: AGHT+IFUP1qwWY0UlEZOY+1Y9HfO9zE5pmTE6knRdTsVmzNpByhzpAcfuYpMMEA+syDSvg8RTIVLSQ==
X-Received: by 2002:a05:6359:5a8d:b0:1aa:d5c8:ec94 with SMTP id e5c5f4694b2df-1b19d2f4aecmr435584955d.26.1723552293448;
        Tue, 13 Aug 2024 05:31:33 -0700 (PDT)
Received: from denia.c.googlers.com (123.178.145.34.bc.googleusercontent.com. [34.145.178.123])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7a4c7d66093sm337126685a.12.2024.08.13.05.31.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Aug 2024 05:31:32 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Tue, 13 Aug 2024 12:31:27 +0000
Subject: [PATCH v6 07/10] media: venus: Refactor hfi_sys_get_property_pkt
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240813-cocci-flexarray-v6-7-de903fd8d988@chromium.org>
References: <20240813-cocci-flexarray-v6-0-de903fd8d988@chromium.org>
In-Reply-To: <20240813-cocci-flexarray-v6-0-de903fd8d988@chromium.org>
To: Stanimir Varbanov <stanimir.k.varbanov@gmail.com>, 
 Vikash Garodia <quic_vgarodia@quicinc.com>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Hans Verkuil <hverkuil-cisco@xs4all.nl>, linux-media@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.13.0

Replace a single length element array with an element.

This fixes the following cocci warning:
drivers/media/platform/qcom/venus/hfi_cmds.h:77:5-9: WARNING use flexible-array member instead (https://www.kernel.org/doc/html/latest/process/deprecated.html#zero-length-and-one-element-arrays)

Acked-by: Vikash Garodia <quic_vgarodia@quicinc.com>
Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/platform/qcom/venus/hfi_cmds.c | 2 +-
 drivers/media/platform/qcom/venus/hfi_cmds.h | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/qcom/venus/hfi_cmds.c b/drivers/media/platform/qcom/venus/hfi_cmds.c
index 75f4a3d3e748..0a4de8ca1df5 100644
--- a/drivers/media/platform/qcom/venus/hfi_cmds.c
+++ b/drivers/media/platform/qcom/venus/hfi_cmds.c
@@ -156,7 +156,7 @@ void pkt_sys_image_version(struct hfi_sys_get_property_pkt *pkt)
 	pkt->hdr.size = sizeof(*pkt);
 	pkt->hdr.pkt_type = HFI_CMD_SYS_GET_PROPERTY;
 	pkt->num_properties = 1;
-	pkt->data[0] = HFI_PROPERTY_SYS_IMAGE_VERSION;
+	pkt->data = HFI_PROPERTY_SYS_IMAGE_VERSION;
 }
 
 int pkt_session_init(struct hfi_session_init_pkt *pkt, void *cookie,
diff --git a/drivers/media/platform/qcom/venus/hfi_cmds.h b/drivers/media/platform/qcom/venus/hfi_cmds.h
index de0bf2399505..615ac8d156a5 100644
--- a/drivers/media/platform/qcom/venus/hfi_cmds.h
+++ b/drivers/media/platform/qcom/venus/hfi_cmds.h
@@ -74,7 +74,7 @@ struct hfi_sys_set_property_pkt {
 struct hfi_sys_get_property_pkt {
 	struct hfi_pkt_hdr hdr;
 	u32 num_properties;
-	u32 data[1];
+	u32 data;
 };
 
 struct hfi_sys_set_buffers_pkt {

-- 
2.46.0.76.ge559c4bf1a-goog


