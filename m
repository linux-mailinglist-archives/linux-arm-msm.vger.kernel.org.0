Return-Path: <linux-arm-msm+bounces-21931-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 46C088FE772
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Jun 2024 15:18:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 790D7B22789
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Jun 2024 13:18:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BDE5D195B3B;
	Thu,  6 Jun 2024 13:17:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Q8dS9Jfh"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-oo1-f53.google.com (mail-oo1-f53.google.com [209.85.161.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E295195FDB
	for <linux-arm-msm@vger.kernel.org>; Thu,  6 Jun 2024 13:17:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717679854; cv=none; b=o0oMEfpcz06N7BgyvJLyyw+w0iYnLU+/5Tnod3eftQOdeQvdPCCUm+sFoPOzNTpifACM4KC905qxXiwczn4y1xW/FwwKNQbSkhwBinFpA3To3c0+bmX6jfOIYGoeSNMuTR7MzxSSHvTamyU0GVjGMbqZMpsf9B4ml/kWBdUwB08=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717679854; c=relaxed/simple;
	bh=LKep9+SsMgXIw7N/wwAo5L/YSHeXN3o1qd6elsENQvg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RzoMAd7afZ8G3kajg839NovOXyQw0XD421wH+vjrAp7YfSJ+qT8J5/h+4pLedpOSc2cSgOvKs7pbkiB2nERzuD4B5fbVPl/PLN8am/DvbE+Vj3yJVivXnGj3/3Jvt2E6Bx+tjr3qPcIDcnyt7u+Mfup2PRaMdynRS1TR5QYNnl0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Q8dS9Jfh; arc=none smtp.client-ip=209.85.161.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-oo1-f53.google.com with SMTP id 006d021491bc7-5ba74c25fb3so469123eaf.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 06 Jun 2024 06:17:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1717679852; x=1718284652; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bZZh27lvax1pQKtebKo1tSyfI2/RfGD2+tRBLkwHpFg=;
        b=Q8dS9JfhUN0JBhPQ2Pc+v0JQqNI9KiQVlEXPQ4YhjjMFO4vefxSidC2dXIJ2fMT41b
         6rUYMQCj/lQSwE5Tmx6gtNRVdD4pkx7Hg5Ex9J8uuMl76DnLrYLyKPulvDvDWrkcFSQ9
         WxbuomJvMde3Xv92dEN+InNMT0gFjt8sqnSd0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717679852; x=1718284652;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bZZh27lvax1pQKtebKo1tSyfI2/RfGD2+tRBLkwHpFg=;
        b=jM9/+uMYTA3ycyY0nAx8M/ejH0FqoSVwlUqpsjn9bCxPDeox9qmCUqqvBYpaDFnXeo
         hkqdGlUYWGUXJtH3qamUCETqpyerHnY8fDpW8BDuc8rYuN+RLOEX4mZJJ7Qwv3MDvfaI
         jUEaJszJAH8Y746mAxxqL/WuONNptpgKo8RuolkH8uGP9T5HQbzanH08o82hAcCuIFsx
         R3IauIFJeKZpWRiXt8dxFGUrTfc9GtLdcKqyZweF/VbWmpDKPcz0GqPcnU9ttcNhRtTW
         SDH7N4ESsO0Mn3roh/F4P7ra2NYKJyKroqx/28AVQbDb/1hhMJhF4nRDZ9PHi8jltM16
         ofcQ==
X-Forwarded-Encrypted: i=1; AJvYcCXqDEY+j+ida9uE14VJnLLe0cg8lQbKZmyaKlrvAaiTc65znPyPNdowfSAtpMNoQJGFsE1rYWdkwbHR+W4NLr2fgj+v38/aA3N6djGhEg==
X-Gm-Message-State: AOJu0YwCOH3j4y1GE+KisJTfuVMJC87ZJokIYbdreX1riZBD7AJ6wQ5U
	O+JMVENRMO8y2a9Ny0zrJNqrJ8UYxYEk9Odi7ZqTx2HGArEj5EbE4h7ceiHxDQ==
X-Google-Smtp-Source: AGHT+IGNI9HGZGYM1bs7kXBQ+Gzd7oXjy4+AygNfoD1Lq7a40uZ9nWHXC95xkS7mtZToVDJBYIlggA==
X-Received: by 2002:a05:6358:9985:b0:19e:e402:4d17 with SMTP id e5c5f4694b2df-19ee4025007mr233623255d.7.1717679852165;
        Thu, 06 Jun 2024 06:17:32 -0700 (PDT)
Received: from denia.c.googlers.com (123.178.145.34.bc.googleusercontent.com. [34.145.178.123])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6b04f6607f5sm6118036d6.31.2024.06.06.06.17.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Jun 2024 06:17:31 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Thu, 06 Jun 2024 13:16:37 +0000
Subject: [PATCH v4 03/11] media: venus: Use flex array for
 hfi_session_release_buffer_pkt
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240606-cocci-flexarray-v4-3-3379ee5eed28@chromium.org>
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

Replace the old style single element array with a flex array. We do not
allocate this structure, so the size change should not be an issue.

This fixes the following cocci warning:
drivers/media/platform/qcom/venus/hfi_cmds.h:204:5-16: WARNING use flexible-array member instead (https://www.kernel.org/doc/html/latest/process/deprecated.html#zero-length-and-one-element-arrays)

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/platform/qcom/venus/hfi_cmds.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/venus/hfi_cmds.h b/drivers/media/platform/qcom/venus/hfi_cmds.h
index 41f765eac4d9..6dff949c4402 100644
--- a/drivers/media/platform/qcom/venus/hfi_cmds.h
+++ b/drivers/media/platform/qcom/venus/hfi_cmds.h
@@ -201,7 +201,7 @@ struct hfi_session_release_buffer_pkt {
 	u32 extradata_size;
 	u32 response_req;
 	u32 num_buffers;
-	u32 buffer_info[1];
+	u32 buffer_info[];
 };
 
 struct hfi_session_release_resources_pkt {

-- 
2.45.2.505.gda0bf45e8d-goog


