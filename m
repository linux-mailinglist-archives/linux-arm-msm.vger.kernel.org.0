Return-Path: <linux-arm-msm+bounces-28495-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 78F78951A26
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 Aug 2024 13:41:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 34F90284912
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 Aug 2024 11:41:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B9E951B3727;
	Wed, 14 Aug 2024 11:39:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="WtSgc2N6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ot1-f45.google.com (mail-ot1-f45.google.com [209.85.210.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0463A1B29D8
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 Aug 2024 11:39:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723635578; cv=none; b=kaGUONCsBxTyKcTp8Fo193NGJ5BxpPhHPGCh2rMo41Co/arrDhVj75BhSPkxx2zLOEJp/ropDmiOHsSy64rQ7vMuSriStfLq5hY9yznnFBReij3oRaHWInLGWusaH9BBUXhB+53oUUA0cP/TcgBHjdwr4zQk5PgL0c5Czf34/Wc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723635578; c=relaxed/simple;
	bh=RUkSvotJiUicAjr125zoqk67Yg0Rr4Z0u5b8fZH4uhY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qe9ry39bo4emvAQO72QjC+4S+7wa+51f4uCc7ncU0CH1lFIBR1yDMv3jrakz/mLYBm2tqyB9kj9+CpWhXUKOkXxF9XR2OZgsLJd3zIHOCE6gbgDtmljhNdTm4KCs7FVm4l1rsQqM/koY/xJkgFcpb4Mkwd2EW0tLOxXOO6ihxH0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=WtSgc2N6; arc=none smtp.client-ip=209.85.210.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-ot1-f45.google.com with SMTP id 46e09a7af769-70942ebcc29so4470130a34.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 14 Aug 2024 04:39:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1723635576; x=1724240376; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RN7Dnd0r7pjMqaCAE+J4vLBmG7zkz8JhaZ76ns/e/WE=;
        b=WtSgc2N6Lp5Fl+Grd8i857ttdZESlfUR3gycn4LSWe9mgJO5RleWN/SDlvDQFFaKTS
         66ca51LN954cVM1yzs2dQaL0kta7EzRXYt3ZdzafFGHckK1YJkZmaNB49P5Tw6aAjIED
         ph0J44PeYGW93g3Krf3LrNhL31cveht7AlS8o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723635576; x=1724240376;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RN7Dnd0r7pjMqaCAE+J4vLBmG7zkz8JhaZ76ns/e/WE=;
        b=YXxK8SaKB9TVr1EiuKdYZ7jkl2cUBGng7okWtSm87ngHj5N39rv0MJHuanbOPh3WRy
         EpUU4XussnJ/GrfGURrE9XB44zU7BFqVdJ8eCSQchvyRBSwVdB9hpXmhJI2zYPVwNLaH
         r/Tgq74hZcr32kLjYgP0R9jmolp2t5mu7AnjRwCqkrOvhP387VH6YA4Dpr9pwrB6EeNs
         rFiZAm2pWpnQy0/iolMmWp0m9sXDhoDMS4ldzppRWVn5YxnBXy8IjRzDOXeUcdur4FFs
         y01JCBMdlXVk9QPGzzZVZj2sDfFBqZQoyKKcrZRKRQD2Cn1Z8TkPnLwgSgZ/SSvzIygZ
         W7xQ==
X-Forwarded-Encrypted: i=1; AJvYcCWoWdTC+WVCfeZPxUoFCNbrSMYxlljPV4/ola8EeoXdeqdpA4IZ51SMqDlUJtD/0BRbROjVhwXWeZqgPTvs0GP8953bWB/oa/7oDbxDXg==
X-Gm-Message-State: AOJu0Ywp7teZ2UL6oMy3VeW3pC5Cqp73J+nmM6NCylfbxu3dqgkSg1me
	lAN2cQCVccMFwuBbEXVuZPLlwjCByALV+fcWEmKYEs5D/aSG4pN8krff41ngYg==
X-Google-Smtp-Source: AGHT+IGw4C+RCNiH4eerEXg4HBAuopT+VKBys5fIpTb7JFfXnmm4MV/gGIeWJWYBjoI+aevyYEu96w==
X-Received: by 2002:a05:6359:410d:b0:19f:2c7e:a226 with SMTP id e5c5f4694b2df-1b1aab1a74cmr270917155d.5.1723635576040;
        Wed, 14 Aug 2024 04:39:36 -0700 (PDT)
Received: from denia.c.googlers.com (123.178.145.34.bc.googleusercontent.com. [34.145.178.123])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6bd82ca0daasm42167916d6.68.2024.08.14.04.39.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Aug 2024 04:39:35 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Wed, 14 Aug 2024 11:39:29 +0000
Subject: [PATCH v7 09/10] media: venus: Refactor
 hfi_buffer_alloc_mode_supported
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240814-cocci-flexarray-v7-9-8a1cc09ae6c4@chromium.org>
References: <20240814-cocci-flexarray-v7-0-8a1cc09ae6c4@chromium.org>
In-Reply-To: <20240814-cocci-flexarray-v7-0-8a1cc09ae6c4@chromium.org>
To: Stanimir Varbanov <stanimir.k.varbanov@gmail.com>, 
 Vikash Garodia <quic_vgarodia@quicinc.com>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Hans Verkuil <hverkuil-cisco@xs4all.nl>, linux-media@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.13.0

Replace the old style single element array at the end of the struct with
a flex array.

The code does not allocate this structure, so the size change should not
be a problem.

This fixes the following cocci warning:
drivers/media/platform/qcom/venus/hfi_helper.h:1233:5-9: WARNING use flexible-array member instead (https://www.kernel.org/doc/html/latest/process/deprecated.html#zero-length-and-one-element-arrays)

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
Acked-by: Vikash Garodia <quic_vgarodia@quicinc.com>
---
 drivers/media/platform/qcom/venus/hfi_helper.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/venus/hfi_helper.h b/drivers/media/platform/qcom/venus/hfi_helper.h
index 3edefa4edeb9..755aabcd8048 100644
--- a/drivers/media/platform/qcom/venus/hfi_helper.h
+++ b/drivers/media/platform/qcom/venus/hfi_helper.h
@@ -1264,7 +1264,7 @@ struct hfi_interlace_format_supported {
 struct hfi_buffer_alloc_mode_supported {
 	u32 buffer_type;
 	u32 num_entries;
-	u32 data[1];
+	u32 data[];
 };
 
 struct hfi_mb_error_map {

-- 
2.46.0.76.ge559c4bf1a-goog


