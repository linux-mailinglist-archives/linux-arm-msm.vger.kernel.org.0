Return-Path: <linux-arm-msm+bounces-28380-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 948889504FB
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Aug 2024 14:32:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4AB051F22B30
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Aug 2024 12:32:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3D8DA19B59C;
	Tue, 13 Aug 2024 12:31:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="QMn15TvD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com [209.85.222.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8802019AD70
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Aug 2024 12:31:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723552292; cv=none; b=a5Q1Yn1ouHHyQ7xzDR1j0K5b3KZ/NRs7kEoLid3fd72aOnP9tUsCRA+Qo6YtgczBI6uQxEIreKSCwHuG6QdfeapGcsQx2WmxGE6vcrjMcZ6aELg1EprMMwAmsK3Ku+ZkIdJHhHGKMgycNN6QuETX+OGhRvKJ9c/DkBMHsMGLhm0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723552292; c=relaxed/simple;
	bh=ZL1NQsUr+liQywEoPKyXYweeFBwJ9jb0tSJpH+9ycBc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=AykOaqATbp2ZbRMF25rP5Ebk+TGwf1r/q9vXsg+aSsxf0kuyfuzrvEVT1Ft+EN7oM9yGVfTjBtKmAMemulRc8yKHuBbZ8k80QDFwoFEQ8VboyZfwXN/edAOqJObX2FFHMTxt9p5hqyh4cqCO7GQ9u0ri6UZjt+S4UCCliSogJ38=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=QMn15TvD; arc=none smtp.client-ip=209.85.222.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qk1-f177.google.com with SMTP id af79cd13be357-7a337501630so354291585a.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 13 Aug 2024 05:31:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1723552289; x=1724157089; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SPUEi7uFjzY/rlu/HW/qtzhNgJ8EHrsVhU1gvPc5vvQ=;
        b=QMn15TvDv7mlw3QTOAGW/Y5rko3pr7VharwKEr86efGIgyVGIOIi++LbfDZTDGW2IX
         hYsKDB/xGqqZ48QJRuxU3dhXT3iBbSM6zNyYL/P/LGlxHkYh6elIGHo8EIEH+zPDnCZR
         6KKC5Z24qfC5SuEqTDuPkcjKlljfWQidAdaxw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723552289; x=1724157089;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SPUEi7uFjzY/rlu/HW/qtzhNgJ8EHrsVhU1gvPc5vvQ=;
        b=FbFPC9HvFqwfIG2jPz5GSy/I12IP0TCblIlg2DB3/BNNExKQe5DUDR8IiEAc5mpkXm
         3PvbxcNMrmVXq4u6twF4nVOtCI1nMbsjb1eH1INrioRVXAQJHbtVkA9W6xhq0qZVpqXX
         FEiPENUABip/cLVYTqc8RfB+W80RE9DhnAGICRxKZjwAKrNL/tuuNclsaC1GY+VNX5Np
         VIsvnxcYLjQhkZLy36QJziq+NKypcfRs7AgPCerfay9EZWHGJUv3Hor47PLGMIg28H+V
         V1MZ4VY4Tn49iCp5AW02Ta6Q8w6YZV3JGTNGfEu4ZKvDzvnlFZuXPgrDAb/zDGha8ZCm
         SAyg==
X-Forwarded-Encrypted: i=1; AJvYcCUhcBGl3LnjRV4Z852ydL110XwYaL4fp9EJ8/gEfLmdauBq/tJNhufRnii7/RG989WqWc6a1ksvP+eBt//K9myKw2Bg7aNtUhHy2YGeoA==
X-Gm-Message-State: AOJu0Yzia7Ukjq+5B4/cRTzKLPgIZ9ZMfa3sgHGgfaJgHhYswcJt0335
	8ykgU9rynKPoDOmgeAks+Y/HFK6vfEi1L4KrQhDfhEWWc0GUU4NoSPyS0aJynQ==
X-Google-Smtp-Source: AGHT+IHWcYMugnNAohBPlXl4Q5k2szXJLte2T2nQmFxv7LgGGp8+7SOgzgt3nTX3WjhN51/yObzS/g==
X-Received: by 2002:a05:620a:3193:b0:7a1:d022:a3ae with SMTP id af79cd13be357-7a4e15b9c43mr381001685a.56.1723552289433;
        Tue, 13 Aug 2024 05:31:29 -0700 (PDT)
Received: from denia.c.googlers.com (123.178.145.34.bc.googleusercontent.com. [34.145.178.123])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7a4c7d66093sm337126685a.12.2024.08.13.05.31.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Aug 2024 05:31:28 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Tue, 13 Aug 2024 12:31:23 +0000
Subject: [PATCH v6 03/10] media: venus: Refactor struct
 hfi_session_get_property_pkt
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240813-cocci-flexarray-v6-3-de903fd8d988@chromium.org>
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

The struct hfi_session_get_property_pkt is always used to fetch a
single property. Make that explicit in the code and avoid a single
element array at the end of the struct.

This change fixes the following cocci warning:
drivers/media/platform/qcom/venus/hfi_cmds.h:194:5-9: WARNING use flexible-array member instead (https://www.kernel.org/doc/html/latest/process/deprecated.html#zero-length-and-one-element-arrays)

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Acked-by: Vikash Garodia <quic_vgarodia@quicinc.com>
Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/platform/qcom/venus/hfi_cmds.c | 4 ++--
 drivers/media/platform/qcom/venus/hfi_cmds.h | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/qcom/venus/hfi_cmds.c b/drivers/media/platform/qcom/venus/hfi_cmds.c
index 3418d2dd9371..75f4a3d3e748 100644
--- a/drivers/media/platform/qcom/venus/hfi_cmds.c
+++ b/drivers/media/platform/qcom/venus/hfi_cmds.c
@@ -402,7 +402,7 @@ static int pkt_session_get_property_1x(struct hfi_session_get_property_pkt *pkt,
 	pkt->shdr.hdr.pkt_type = HFI_CMD_SESSION_GET_PROPERTY;
 	pkt->shdr.session_id = hash32_ptr(cookie);
 	pkt->num_properties = 1;
-	pkt->data[0] = ptype;
+	pkt->data = ptype;
 
 	return 0;
 }
@@ -1110,7 +1110,7 @@ pkt_session_get_property_3xx(struct hfi_session_get_property_pkt *pkt,
 
 	switch (ptype) {
 	case HFI_PROPERTY_CONFIG_VDEC_ENTROPY:
-		pkt->data[0] = HFI_PROPERTY_CONFIG_VDEC_ENTROPY;
+		pkt->data = HFI_PROPERTY_CONFIG_VDEC_ENTROPY;
 		break;
 	default:
 		ret = pkt_session_get_property_1x(pkt, cookie, ptype);
diff --git a/drivers/media/platform/qcom/venus/hfi_cmds.h b/drivers/media/platform/qcom/venus/hfi_cmds.h
index 42825f07939d..b158fcd00dd6 100644
--- a/drivers/media/platform/qcom/venus/hfi_cmds.h
+++ b/drivers/media/platform/qcom/venus/hfi_cmds.h
@@ -217,7 +217,7 @@ struct hfi_session_resume_pkt {
 struct hfi_session_get_property_pkt {
 	struct hfi_session_hdr_pkt shdr;
 	u32 num_properties;
-	u32 data[1];
+	u32 data;
 };
 
 struct hfi_session_release_buffer_pkt {

-- 
2.46.0.76.ge559c4bf1a-goog


