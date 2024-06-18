Return-Path: <linux-arm-msm+bounces-23052-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A993690D4BE
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Jun 2024 16:25:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E0A49B24092
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Jun 2024 14:01:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 40D2F16D4C1;
	Tue, 18 Jun 2024 13:37:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="SFXobsN7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com [209.85.222.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AF0616B3B8
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Jun 2024 13:37:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718717879; cv=none; b=GQB4gE/GUC+XH/wHC36CpUrgLbaLfQjA9ReOolmIA0Ia9OTlaOcOMJUSNUsKQ3YISfOV7u1AtaKfS95Ap7tZ99g/B7lpHND5cqhBXm7MNpmuIbAh8vRpDub1b+4Jm63fmRZj7E1ele8Qa3kLB/Fi5vUzegqceu0aV+Wgq1f9lY4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718717879; c=relaxed/simple;
	bh=iELnSY5gu3MPwTWIlT31gap3UcK/8g4Z6s90Q+ubKso=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=inzA2JKK/MEcILW4JhTzzLOYIEwA8Ocx0ofauaDlKOmsimXwVq/RgcUGzuxMY9VsJyT8B/RcBU4AX/M4gusCDdgqusP9guXTND/XrdGCpDhehJwFSUL3MAqFmjCDeigemxEsg1s0AcULVT3Pq2VUZ0OvSri6TTvXUcKh/ynnkvU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=SFXobsN7; arc=none smtp.client-ip=209.85.222.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qk1-f181.google.com with SMTP id af79cd13be357-797fb0b4832so269354785a.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 18 Jun 2024 06:37:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1718717876; x=1719322676; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MW9bvh2bp76Of1yyIbqQelf17GV+Jkv7epwXCqKgstg=;
        b=SFXobsN7Y6qcPfXteidGdyqryJ6i8m4cGzKjTwpBzq723v/hKxWvLJVMJXsvJ/NfY/
         Rks9t35kGa4vZhavMRJK7XsX2Unhz6aiZigj1eoiowFBgs4t44czVOlB+IFfZslA1CtK
         7VHHA+tKaSB68PEB5xEUwFVN8nNkYmd9PlAUI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718717876; x=1719322676;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MW9bvh2bp76Of1yyIbqQelf17GV+Jkv7epwXCqKgstg=;
        b=TnFsxnT+ZJHWdVVWDOTj7MewNmTPof23kzXVfUOh2vBmyF0a9Ygt4IBPsq3F0GERL6
         rlCjJ4iIbZOSBoaMnF4r0KU+WrmRh0mw7Tfi+0xjBQASgYUxjwqHU6UnheY8gZSODyFa
         bG0uyqBmBx7YiNcUIGwBoMKfZx/8VoQbU33Z2wHHMzkKwYkv/rcUhjKRGHP1Pk4CcG5h
         Wi406qFW3tJY535dBzW+k4P3jX67+u1TLGZXkvHV+UnOevaUsuf9atoe8Gq2t+e5LtCG
         0HCutM/VlIGyKmBeJrEpaS64IWslTstG0MwK68BbyJG90mjLok+t/cxvYy4Hc+Zhw4A9
         dS9A==
X-Forwarded-Encrypted: i=1; AJvYcCUlhTsa2P4aD2BZ/jWX29WQyGRT2up6K4RehL7D8zI660uecD0qc/gQy6hSKtffNldd8Cb7Ewob5gJodzBtAlBFG1iZqxMfO3WfyijXew==
X-Gm-Message-State: AOJu0Yznp3Ll25t1c4Znm57GhJkmaPQ4SnEskUMv4+R7Qr1J6t/CyjOI
	rNwZIRTm1u5vhdsw1fcChvzsW+ceaLmsTejVV6ZEvFOi/h/CoLNZ5RC+socIhg==
X-Google-Smtp-Source: AGHT+IHUPkEjN1Rk4xvtyWc0bLx9LlZNTQuD6SlnDrxbm7CEFP8MpAyoWDysNL5JPs/xrPrkaHldpg==
X-Received: by 2002:a05:620a:2586:b0:797:5765:b844 with SMTP id af79cd13be357-798d242f63bmr1493021685a.37.1718717876400;
        Tue, 18 Jun 2024 06:37:56 -0700 (PDT)
Received: from denia.c.googlers.com (123.178.145.34.bc.googleusercontent.com. [34.145.178.123])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-798abc06e93sm521666385a.82.2024.06.18.06.37.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Jun 2024 06:37:55 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Tue, 18 Jun 2024 13:37:49 +0000
Subject: [PATCH v5 06/10] media: venus: Refactor
 hfi_session_empty_buffer_uncompressed_plane0_pkt
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240618-cocci-flexarray-v5-6-6a8294942f48@chromium.org>
References: <20240618-cocci-flexarray-v5-0-6a8294942f48@chromium.org>
In-Reply-To: <20240618-cocci-flexarray-v5-0-6a8294942f48@chromium.org>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Stanimir Varbanov <stanimir.k.varbanov@gmail.com>, 
 Vikash Garodia <quic_vgarodia@quicinc.com>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: Hans Verkuil <hverkuil-cisco@xs4all.nl>, linux-media@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.13.0

The single element array data[1] is never used. Replace it with a
padding field of the same size.

This fixes the following cocci error:
drivers/media/platform/qcom/venus/hfi_cmds.h:163:5-9: WARNING use flexible-array member instead (https://www.kernel.org/doc/html/latest/process/deprecated.html#zero-length-and-one-element-arrays)

Acked-by: Vikash Garodia <quic_vgarodia@quicinc.com>
Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/platform/qcom/venus/hfi_cmds.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/venus/hfi_cmds.h b/drivers/media/platform/qcom/venus/hfi_cmds.h
index f5708fdfb197..8768ee052adc 100644
--- a/drivers/media/platform/qcom/venus/hfi_cmds.h
+++ b/drivers/media/platform/qcom/venus/hfi_cmds.h
@@ -160,7 +160,7 @@ struct hfi_session_empty_buffer_uncompressed_plane0_pkt {
 	u32 input_tag;
 	u32 packet_buffer;
 	u32 extradata_buffer;
-	u32 data[1];
+	u32 data;
 };
 
 struct hfi_session_fill_buffer_pkt {

-- 
2.45.2.627.g7a2c4fd464-goog


