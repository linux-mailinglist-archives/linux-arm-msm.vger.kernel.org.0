Return-Path: <linux-arm-msm+bounces-21932-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 25C888FE774
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Jun 2024 15:18:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B44DAB22B8E
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Jun 2024 13:18:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3A660196C63;
	Thu,  6 Jun 2024 13:17:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="NvYMBhPb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-oo1-f46.google.com (mail-oo1-f46.google.com [209.85.161.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FFF5195F10
	for <linux-arm-msm@vger.kernel.org>; Thu,  6 Jun 2024 13:17:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717679855; cv=none; b=cGa4IGQ5YFSS3KvsKzj8F0+JF5JejeqCrRJ8eQ/I+MIP8hHe0B4c8gi0jVraHzbiuq209qg+lYMta8LCU5RO4zH/oOgwhQ3aG2VGtUd5BKeVQt4YNhep3lpUUj0MHSoNQBhYpY5qNTgzQQVXnepwX/UCDLvLSXgq8FLMe6i+1IE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717679855; c=relaxed/simple;
	bh=9Ex/psXstRZqGMxxPJ0VpkCq64t7rGKg+zLLyU8qbQM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=d/ubcXedFIkXevZERYnMYA8q/zBEG7+vk7tmZnyvPFtOlxWdkN2k0CduYDKXY94WcnDQejRi7iua1/xG4uoe2RcpqhYHL3UmznBgWSmPj2/LU4lf26kByMPmAppR9hLtwi1jF6V6+8yKLoEZ3lzSJ+U6gRzZFcXPzT6uMfP0OUw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=NvYMBhPb; arc=none smtp.client-ip=209.85.161.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-oo1-f46.google.com with SMTP id 006d021491bc7-5b97a071c92so431590eaf.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 06 Jun 2024 06:17:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1717679850; x=1718284650; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AAL4006xAnRJyzvWwdXcDdqMP35ODneV2/4JxIJoTYE=;
        b=NvYMBhPbL4ddCR1Xdo0TVjY2+0mkBDXcQoJmDaBfuAgBEBD5KBI+0Vy9Ew7LZ3U64g
         gqGYDYnPcUh6vAl+FOBCQdz9IbPMcv32KFFTjVy5vxB7Y0wv7ovxcZgmcRTNmJFVjL00
         7szNGD1s7aojdVbkjcCPwbxa2KzrH/8JTxr2I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717679850; x=1718284650;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AAL4006xAnRJyzvWwdXcDdqMP35ODneV2/4JxIJoTYE=;
        b=MEsrHbLPgklgj+ZY46UZrsPpjGjjeMlBX9igVvNbUkQ3/j3qiopFfv6e/miXeB0qES
         xarxIj3dHO4h8S+rUSP1TWvlOGwsn80gLPQC73jNr+rjwRe//yl9DcUQpnhJpC0j2z26
         t6YaXUwtxaeN3yGS5qtYMrv13juZfvbEvHmBEZu96zSFeRlyLo5gwW7ZGgP2KtVJ6tgE
         QUuLMLR+h0Yb/6ZoCwnORZXqoORMUVOxU8Vjlrye/Ex0xXeSjcdvDrY/CcOJJ9GRNUbs
         lwouVa+WlLoKspLVcuy0y4LnSeQsOmLB3RjoUuHhFO58sAKFEaW/1O7Ttw2RQZW/nfnF
         TBGw==
X-Forwarded-Encrypted: i=1; AJvYcCV1eg53NLtT6gHtsteu/wvK4Gm5f/hzCD/N0AzNhFCnHPiL4exowmaB0yvbkV1qAoS/agAzC9WHHny7pjucEHcUfcQfRStSHJHEsNLgww==
X-Gm-Message-State: AOJu0YymmB7Vv6LRVocEIFN45FvpIDaHJnTzh95p3GS7qRvqVXVn0QSL
	rzfXDSvHzkuSZZ5W7i7g7NoCHzM5o34lWKRa+OUhlw0V4WtvsaByQ8WL0jJOcQ==
X-Google-Smtp-Source: AGHT+IFMfHqWudPNwZ7gEE3WDMg2/DCijf/SGmLWSwqmxlW9rIKDz6JeqdjExEkt/BTcjfNpWLogIg==
X-Received: by 2002:a05:6358:2609:b0:199:2b63:9f42 with SMTP id e5c5f4694b2df-19c6c68a2femr652957255d.10.1717679850292;
        Thu, 06 Jun 2024 06:17:30 -0700 (PDT)
Received: from denia.c.googlers.com (123.178.145.34.bc.googleusercontent.com. [34.145.178.123])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6b04f6607f5sm6118036d6.31.2024.06.06.06.17.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Jun 2024 06:17:29 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Thu, 06 Jun 2024 13:16:35 +0000
Subject: [PATCH v4 01/11] media: dvb-frontend/mxl5xx: Refactor struct
 MBIN_FILE_T and MBIN_SEGMENT_T
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240606-cocci-flexarray-v4-1-3379ee5eed28@chromium.org>
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

Replace the older style one-element array with a flexible array member.
There does not seem to be any allocation for these structs in the code, so
no more code changes are required.

The following cocci warnings are fixed:
drivers/media/dvb-frontends/mxl5xx_defs.h:182:4-8: WARNING use flexible-array member instead (https://www.kernel.org/doc/html/latest/process/deprecated.html#zero-length-and-one-element-arrays)
drivers/media/dvb-frontends/mxl5xx_defs.h:171:4-8: WARNING use flexible-array member instead (https://www.kernel.org/doc/html/latest/process/deprecated.html#zero-length-and-one-element-arrays)

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/dvb-frontends/mxl5xx_defs.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/dvb-frontends/mxl5xx_defs.h b/drivers/media/dvb-frontends/mxl5xx_defs.h
index 097271f73740..bf08d82ba2cc 100644
--- a/drivers/media/dvb-frontends/mxl5xx_defs.h
+++ b/drivers/media/dvb-frontends/mxl5xx_defs.h
@@ -168,7 +168,7 @@ struct MBIN_FILE_HEADER_T {
 
 struct MBIN_FILE_T {
 	struct MBIN_FILE_HEADER_T header;
-	u8 data[1];
+	u8 data[];
 };
 
 struct MBIN_SEGMENT_HEADER_T {
@@ -179,7 +179,7 @@ struct MBIN_SEGMENT_HEADER_T {
 
 struct MBIN_SEGMENT_T {
 	struct MBIN_SEGMENT_HEADER_T header;
-	u8 data[1];
+	u8 data[];
 };
 
 enum MXL_CMD_TYPE_E { MXL_CMD_WRITE = 0, MXL_CMD_READ };

-- 
2.45.2.505.gda0bf45e8d-goog


