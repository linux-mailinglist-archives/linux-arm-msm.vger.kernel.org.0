Return-Path: <linux-arm-msm+bounces-19324-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AC308BE3CC
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 May 2024 15:25:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D977C289E8A
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 May 2024 13:25:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 874AD16D9B7;
	Tue,  7 May 2024 13:18:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="KBC519u0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-oi1-f180.google.com (mail-oi1-f180.google.com [209.85.167.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 922F016D30D
	for <linux-arm-msm@vger.kernel.org>; Tue,  7 May 2024 13:18:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715087919; cv=none; b=kZbtLPOWtVfq1IL4nZvN/tXa1CWyNQGRK4klQ2AcM8gGezYeo4dXAh25ez2jXeg5N5axuPuWOOTGIdPLLM4aOS7uCS5pSUzBs+OjNjKAoc0FSJY4OMxOqc4ed4Suvlv1jhBi3qcCEcSEpqaU3wwB8A+7GMrjE9kC0Z72Szg4z3Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715087919; c=relaxed/simple;
	bh=ENYjVBtJ4EPS9w/ftPm8y0fja8ouSlg/VUcwtfy4KyM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bFc+Pk//34pY0Tb5ThoIsX+Y/y1kJyf5t7svlNCtOhdfkIk5uDMo8gMx2w+dtKyt1hAeR4AfdcafLWiiSWmIIfznjNe8sdXNmzSmWk9lSUR6eNwTBfcqcg0MZpjOF6+BxbOTNpPiVE8Cu2q6xbEk8lCTYWVLZ00jkkiCpeiMIys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=KBC519u0; arc=none smtp.client-ip=209.85.167.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-oi1-f180.google.com with SMTP id 5614622812f47-3c96c096a32so1232117b6e.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 May 2024 06:18:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1715087916; x=1715692716; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bajBIKBKiGkzVrECr+DrCDdr2oyOzpQYYR0WAIoyaos=;
        b=KBC519u0YUZRmCX814fdQKpA9DlYSwz1bySNckmrtHfZxffY9CGzwwo3nEWshOn0lS
         8v9an28RN3ZuLUZoNoPCjNSUaymk5IwXUr1AI4Qmfzc6ZauF9dmvpstHrufZVgY5PRuy
         ZmGawl0KywrAVsBanr0/J+DjkUIek1bN8rc0o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715087916; x=1715692716;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bajBIKBKiGkzVrECr+DrCDdr2oyOzpQYYR0WAIoyaos=;
        b=bsnDlm91FUJiFvJtLT7rPiMxnRftw3z6QQ1aJ9C1G+leJf1KSCH7lDdtnCAxAMDrUi
         nv0n0HExki60WHwMhFFXcIeQghLUCaSjfpAPvWfv1Can1ciBIgQZ80uOITtExjhr8u0r
         DpxdD9Ra/uXV3ekbNBCET2TdNu+nev1U/fMQUK2gSA7QqXYz6xJ7mPja2IHjH2hlOeoA
         E5B8XdPZz+5dNid6ryqNdQT7ijvTTmXQ2v5TJNgsUrb3k9pH7cqaceB7jRFC3L9hUpy7
         bWXXgD5SRQm0fcHGXyfGDJienBo89RuSnRvTUFN8RUZJEavolS2sz7KJJU8kLcsT8udP
         TPDg==
X-Forwarded-Encrypted: i=1; AJvYcCV79yxPZ1E+h+QbNMJ7rY952Jszs6mVq/73p0DfGFg9ADjPhuPry9kvViv7dbGWMBsNkHY5QJsgSoWVg+hTYrvFg+a+c/tONr9P/K8qFw==
X-Gm-Message-State: AOJu0YxyYxbRjghbPPw5X8KnC2aqJ4pmf2YJ1yGlVi+h9jaHiVU8Wxfv
	+/xXZPx9C4MHZUQbT/wMau/Y4i/Xv7eualb3Wu9SAcQBoyRlwvHG4BxL2ncR4g==
X-Google-Smtp-Source: AGHT+IEfgZc+3NqAZNZgDbuMWn1SodDQc1fgSaycXBKpVQJhCw/vqcobpSG60CD78oLq4SUhp6OVxQ==
X-Received: by 2002:a54:4195:0:b0:3c9:6e70:cf99 with SMTP id 21-20020a544195000000b003c96e70cf99mr5053014oiy.57.1715087916576;
        Tue, 07 May 2024 06:18:36 -0700 (PDT)
Received: from denia.c.googlers.com (114.152.245.35.bc.googleusercontent.com. [35.245.152.114])
        by smtp.gmail.com with ESMTPSA id t15-20020a05621405cf00b006a0d19c3139sm4655105qvz.118.2024.05.07.06.18.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 May 2024 06:18:35 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Tue, 07 May 2024 13:18:33 +0000
Subject: [PATCH 07/18] media: siano: Remove unused structures
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240507-cocci-flexarray-v1-7-4a421c21fd06@chromium.org>
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
2.45.0.rc1.225.g2a3ae87e7f-goog


