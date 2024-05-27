Return-Path: <linux-arm-msm+bounces-20653-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 97D3D8D0F12
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 May 2024 23:10:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4DD801F21B75
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 May 2024 21:10:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 56BD6169AD2;
	Mon, 27 May 2024 21:09:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="PXkP8kUF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com [209.85.219.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DBEA161305
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 May 2024 21:09:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716844144; cv=none; b=is/SgsaqtBD7oZImCDOIPkxkwWWu1ZBpZf25Hms/i5dW9K/R9SCxqnn9wARpJs2SPSsT4IgdlSLt3GJi9PIWTRvk9m5msoe0Ckklj13zrwChmdj1BO3rkja4Fl2b/EtDYuGVf3yqN3NOnyrqlaXMukT9cJJs4xtFyt/xxSz+P3E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716844144; c=relaxed/simple;
	bh=00nzIkoHTNIKc3OYcYRUmI3ETcNlAeSphWbClDXv8F4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Z3CZzSnWN1cnP2TCOI3C0lKE6gagrV9sCuOl2JIcfXW4sOPrqL3jtK6h/1dbLyPN3hppQ/1/e5+tEkFgtxegN+/mIqsLyMQ3rCqidtsoHJyqrm8nObiMbV3vNUJXCnrtgry6YFWH7YZEWUnix/0AyGD5Im3L1qePfuZXjrYNiRA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=PXkP8kUF; arc=none smtp.client-ip=209.85.219.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qv1-f47.google.com with SMTP id 6a1803df08f44-6ab9d9c34faso663736d6.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 May 2024 14:09:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1716844141; x=1717448941; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xuxfMIsewXqkBzK5BeYTD0bqNkQisbi89qotRNy4YBs=;
        b=PXkP8kUFahC6n2hMVqlULQwdbOBEJ2EvztX7xBhCCAgYqQQSb3cNNZ1Jx9ggfzaH15
         aFE1B7RwrBQUTQ+QhS+DsRomXrSS6IUiAEGc8lYj0VvQ8HUTngoTf39VDlzxjh7nEOu7
         G5A+M9O/BodlpValA7HUKiuM/ooDLW1bX76qE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716844141; x=1717448941;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xuxfMIsewXqkBzK5BeYTD0bqNkQisbi89qotRNy4YBs=;
        b=XlykFep57fWBGhx84d3p0xKzN0qj+g788Uhbmrnl/cccDawSrNzpnnpDqQ8UHfvHvn
         li83BlGImn65RTHdrkq5UDjkTX0ZrA141Te30tyG/kQnTo2dweX16saBsmZpfVVh8FQ/
         lMojLW65PflFskSwf3lWZAkb71qANjZrJsGNHWTli5BBf37PnKG1I+4+JYQVZ+QPBrho
         4jA7CONMUGWgJnGwRj50FJBzUa9AYbVE+ONoZHVogW4aRi8dLPn+ceBTRDYF2eK3Mwi8
         PadzexBGma9A897WO3gA5cTkMr4NX4IPBImOlWOHT9e9W8mxZeH/EQHt6W+jZyuibJ5M
         pk0A==
X-Forwarded-Encrypted: i=1; AJvYcCUlS+R+PnHoZjKvSJxwRpLURGmDEL1qyC8GpFclCnXX4SZnfH+MUYJlayJIBjia489y3nzSP4zXtVE6Pi59QnxUyVbWeMmxocZllY7mjg==
X-Gm-Message-State: AOJu0Yw4Gb9t0+9Nsz956Zzc6wpvWPvLKllcVNG/MbCTeXez3Mm9BAVt
	CX0cZS2EqQvtTu6e7tOx963qBRI6D7U0M1TKSHyW0jD6ARttwGJTMumUvclkag==
X-Google-Smtp-Source: AGHT+IGqdInSLU92W7+DtYzv0+k6nwEHlNXV5KrK57NXQ1324WfJB7q1ATelwAen4Mc0bFmHLxIsJw==
X-Received: by 2002:a05:6214:3bc5:b0:6ad:73c0:eb22 with SMTP id 6a1803df08f44-6ad73c0ec3emr79133716d6.12.1716844141308;
        Mon, 27 May 2024 14:09:01 -0700 (PDT)
Received: from denia.c.googlers.com (125.135.86.34.bc.googleusercontent.com. [34.86.135.125])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6ad850a6dc7sm9511866d6.93.2024.05.27.14.09.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 May 2024 14:09:01 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 27 May 2024 21:08:57 +0000
Subject: [PATCH v3 07/18] media: siano: Remove unused structures
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240527-cocci-flexarray-v3-7-cda09c535816@chromium.org>
References: <20240527-cocci-flexarray-v3-0-cda09c535816@chromium.org>
In-Reply-To: <20240527-cocci-flexarray-v3-0-cda09c535816@chromium.org>
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

These structs are not used in the code, remove them.

This fixes the following cocci warning:

drivers/media/common/siano/smscoreapi.h:1049:4-8: WARNING use flexible-array member instead (https://www.kernel.org/doc/html/latest/process/deprecated.html#zero-length-and-one-element-arrays)
drivers/media/common/siano/smscoreapi.h:1055:4-8: WARNING use flexible-array member instead (https://www.kernel.org/doc/html/latest/process/deprecated.html#zero-length-and-one-element-arrays)

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/common/siano/smscoreapi.h | 14 --------------
 1 file changed, 14 deletions(-)

diff --git a/drivers/media/common/siano/smscoreapi.h b/drivers/media/common/siano/smscoreapi.h
index 46dc74ac9318..bc61bc8b9ea9 100644
--- a/drivers/media/common/siano/smscoreapi.h
+++ b/drivers/media/common/siano/smscoreapi.h
@@ -1042,20 +1042,6 @@ struct sms_srvm_signal_status {
 	u32 request_id;
 };
 
-struct sms_i2c_req {
-	u32	device_address; /* I2c device address */
-	u32	write_count; /* number of bytes to write */
-	u32	read_count; /* number of bytes to read */
-	u8	Data[1];
-};
-
-struct sms_i2c_res {
-	u32	status; /* non-zero value in case of failure */
-	u32	read_count; /* number of bytes read */
-	u8	Data[1];
-};
-
-
 struct smscore_config_gpio {
 #define SMS_GPIO_DIRECTION_INPUT  0
 #define SMS_GPIO_DIRECTION_OUTPUT 1

-- 
2.45.1.288.g0e0cd299f1-goog


