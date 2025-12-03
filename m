Return-Path: <linux-arm-msm+bounces-84169-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BD60C9E507
	for <lists+linux-arm-msm@lfdr.de>; Wed, 03 Dec 2025 09:55:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 06116348CB9
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Dec 2025 08:55:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2CDF02BDC1B;
	Wed,  3 Dec 2025 08:55:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="nL/66nl6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A4252BF015
	for <linux-arm-msm@vger.kernel.org>; Wed,  3 Dec 2025 08:55:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764752142; cv=none; b=tJBWpzGWPmRqB0bE8877PsIEZupQdmxfFyVhSCFxOtOIlsyDf93rA3XddEJEuGXQVqce9nQilVPH2l/e85O03MNJdZ6LOJCTSmjEE1DpqSyMiTRSzUSXaGktbI2cMw2lsN7ci4wqEsR7UPq92JjcquM5SRmYAr3EzOnOsPQ4seY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764752142; c=relaxed/simple;
	bh=KRjf6rI6QeytErOhTZc6Hqc8yif5VI8/8ZIpds2a6M4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RBHMUo2DiO9sFYephoPIhm0VH8FODB2MIX4gh1PCwL0d6sRwlYchLQqsvovSrMFKjkjXYuFZ5+rByVaqbsT7cWrZFaidKHi4STd+NCyuFARPBxgALrTSm5xnb79wyAnbZd54BZpZGNzud3oqLlplaaPZ2FJf06IFKlcDsdbDdBo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=nL/66nl6; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-596ba07504dso5519203e87.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 03 Dec 2025 00:55:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1764752138; x=1765356938; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=woHXwxvxfwFTv0q/SqwVCTAjIUDR9jdYwm8dKIe3Yl4=;
        b=nL/66nl6Eo1iAwyzy1bN5vCPXgxbn5AKL0d+N0TobH598vXYk/lCGHpXemuKlCiRVE
         Oym1V5T1VktChhfnfNAgk/IXDJel76XomfDUGu9xGbe2sb/XomFsKBKackAnwiZDvTw4
         Pjp2mbX+I3wsoBlwVUAliWFfO/rFKKfttW6Do=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764752138; x=1765356938;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=woHXwxvxfwFTv0q/SqwVCTAjIUDR9jdYwm8dKIe3Yl4=;
        b=nLf++C10ZDif9Be4VXHjdQflKNuyF7/mt6PBqLq1399/JQrsdfunSXx3G6k7oedGho
         cAzRVI4sP6IeZisNaUTWPgFN+CihfdKVEmO6FW5AaDGosyhs0BZTJGiwNIUAb8r54WaC
         QDvfwgqkmTu7ro0DfORdwQrIA2OZbMm1HIdT11vPH8HOXNuyYfcVyZdo8P/P6Hl8U6Xk
         WNT/sdhG2Qap3jDuAWSjtGl20u10EXK06XmAgcrJyPybpquYumC646A7hSXnxei3EUqI
         W+/36surQDYkYCJTKpK8oCA0CxhnCqwpoasMZM7RGimaEIzkBQU7zq5q+VECM8jzw2xc
         I1iw==
X-Forwarded-Encrypted: i=1; AJvYcCVINmChik7oTsVByAyIb8uQ4+s/oQd7q+D4kOa7cqQxpriDz7q6TWGV6yQTSltClDzFbXRejdD2Q/EagZQK@vger.kernel.org
X-Gm-Message-State: AOJu0YzBvrlx+dBzOlOgRJSubFty1xgtAnEszrwU3k6BDjYxEkFWBo0P
	3KQg5yOAbhwvjcATlZnJtqfkZFn7GWZC8N+7R5wiEOzkl9qzz7Mkozj8/Yu4A6CJRg==
X-Gm-Gg: ASbGncvShxJX+YhwzH9ydL63qD3pp5iTR40d8+/9lIWhRSZxmsJTXh0q+wMD9E1AW5p
	hzzmzGbI71NSgR5qxTz8u9EsmPCjUSnY3RKvlaOh/efZqABUo0tQ7oW2k+C/LNImn1NusH0Gvqa
	QA6Iu4dVPFFn0tfJ7p5m5QdAmyuKvCcJOtXr4yo+HTa5ntUWMt1eUKiA7dXVzzgf+j8y/VF7ScU
	SAu/4n1XMKGbyQBtQCvp1K9Xzn5gKR5/CH07XWuHxmactUzzqAXIsjCxZXQ3XGWmQsBP7x57jtr
	2tt5R1jGSSMuuTBU/Gliu9e+AjMI9kJXqE5ZV6jjH4ZemdPmcWD4zQuTrPuHuvhEi5rzsXYubKQ
	lebgdzgRiOYR+Ehx9auvrhITakM6FxL/eU8Ukma3mdD3O6fp2NyfrU8cKSpkcYqvvAk5cr1vKYy
	jUip3Rroj5lT5KPBlCrls4DLnIC73Fzbqaw5N//cRuOVAUISfKDAX9iwd9Xwf36LlgehFm96Abb
	nRpjBnh4DFRb0Q5UK4=
X-Google-Smtp-Source: AGHT+IFTKSoVv7lOSXtd9iPwhZeRSNLFxYSPOIOsHgyo/230WEcBofLQ8T4STXRlBe4/0ZQCEDG4nw==
X-Received: by 2002:a05:6512:b8c:b0:577:2d9:59f1 with SMTP id 2adb3069b0e04-597d3f37650mr683682e87.19.1764752138351;
        Wed, 03 Dec 2025 00:55:38 -0800 (PST)
Received: from ribalda.c.googlers.com (165.173.228.35.bc.googleusercontent.com. [35.228.173.165])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-596bfa43f3esm5315377e87.47.2025.12.03.00.55.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Dec 2025 00:55:37 -0800 (PST)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Wed, 03 Dec 2025 08:55:34 +0000
Subject: [PATCH 1/3] media: uapi: c3-isp: Fix documentation warning
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251203-warnings-6-19-v1-1-25308e136bca@chromium.org>
References: <20251203-warnings-6-19-v1-0-25308e136bca@chromium.org>
In-Reply-To: <20251203-warnings-6-19-v1-0-25308e136bca@chromium.org>
To: Keke Li <keke.li@amlogic.com>, 
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
 Daniel Scally <dan.scally@ideasonboard.com>, 
 Hans Verkuil <hverkuil+cisco@kernel.org>, 
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
 Vikash Garodia <vikash.garodia@oss.qualcomm.com>, 
 Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, Bryan O'Donoghue <bod@kernel.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>, 
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, Ricardo Ribalda <ribalda@chromium.org>, 
 Stephen Rothwell <sfr@canb.auug.org.au>, stable@vger.kernel.org
X-Mailer: b4 0.14.2

From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>

Building htmldocs generates a warning:

WARNING: include/uapi/linux/media/amlogic/c3-isp-config.h:199
error: Cannot parse struct or union!

Which correctly highlights that the c3_isp_params_block_header symbol
is wrongly documented as a struct while it's a plain #define instead.

Fix this by removing the 'struct' identifier from the documentation of
the c3_isp_params_block_header symbol.

[ribalda: Add Closes:]

Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
Closes: https://lore.kernel.org/all/20251127131425.4b5b6644@canb.auug.org.au/
Fixes: 45662082855c ("media: uapi: Convert Amlogic C3 to V4L2 extensible params")
Cc: stable@vger.kernel.org
Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 include/uapi/linux/media/amlogic/c3-isp-config.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/uapi/linux/media/amlogic/c3-isp-config.h b/include/uapi/linux/media/amlogic/c3-isp-config.h
index 0a3c1cc55ccbbad12f18037d65f32ec9ca1a4ec0..92db5dcdda181cb31665e230cc56b443fa37a0be 100644
--- a/include/uapi/linux/media/amlogic/c3-isp-config.h
+++ b/include/uapi/linux/media/amlogic/c3-isp-config.h
@@ -186,7 +186,7 @@ enum c3_isp_params_block_type {
 #define C3_ISP_PARAMS_BLOCK_FL_ENABLE	V4L2_ISP_PARAMS_FL_BLOCK_ENABLE
 
 /**
- * struct c3_isp_params_block_header - C3 ISP parameter block header
+ * c3_isp_params_block_header - C3 ISP parameter block header
  *
  * This structure represents the common part of all the ISP configuration
  * blocks and is identical to :c:type:`v4l2_isp_params_block_header`.

-- 
2.52.0.158.g65b55ccf14-goog


