Return-Path: <linux-arm-msm+bounces-19328-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id BDED68BE3DF
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 May 2024 15:27:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 736E31F22DB6
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 May 2024 13:27:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 79BED16F0CA;
	Tue,  7 May 2024 13:18:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="obSyJrvw"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com [209.85.219.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41FB116E896
	for <linux-arm-msm@vger.kernel.org>; Tue,  7 May 2024 13:18:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715087924; cv=none; b=rYGj2RlmS7pTWYB19t0YzX/XXtX3R08QpqIyWSJhPdTTIb60u2ATMc/BOL+QSHwJR4Ve09J4UFg34SdHW0HeiNIVXLA0ilz+PIrPwVXptZsKY/FkA8kqvooxNTx3qWlnu0UK03zuMhvxheqb+7A9B79YbzDkF1vtRxZiIx6hbN8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715087924; c=relaxed/simple;
	bh=ty0RG2AjLK5Y8dTp7JoVE8oXrIivf7wrKgPB1ia8aog=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=N+5N8zNm4RX2hjZnDNGSuyqasUExFBkLM/cLj7U72rUKw8BsMpCtVSOcbKGAfmxcewLLR2Rj0DKs7ETlF+XSzwgnl7R4CZDrY9e1uz9fHMY8BlRBVc5J7fqQmsevQVI5bvSADxb/y4p4HQaebQpx0mTZlzX+C02XUEfkfjcueeA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=obSyJrvw; arc=none smtp.client-ip=209.85.219.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qv1-f46.google.com with SMTP id 6a1803df08f44-6a0a7cf89deso10403906d6.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 May 2024 06:18:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1715087921; x=1715692721; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sqFGKWXdCy9k153fMpH4CQDZP31MGLQ/EHV/2T77xUQ=;
        b=obSyJrvw1dCDY3GDBwzEKkjnlj6UPysGGaSPXZ6xUOMQdUsEe8bA8J2OqNB0Xb2Esk
         A1sbLdCj+pLI2tJICTch1W9z28IuONUQbSSi4ZPcy6xAQk7SUY9a85KXHuuj+/7zaagK
         7AjXfLsmpxpduU+CC1WRMNS1COCFJMiotwhL8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715087921; x=1715692721;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sqFGKWXdCy9k153fMpH4CQDZP31MGLQ/EHV/2T77xUQ=;
        b=WNGccbKb0+WBXusIAPjDYki/+ZdRoZzb/gWfHg4sLUdr9QpLyyCfMSCqNEnGxcXFk0
         +Swuq8dpfFad8JPtULHikiIpekSpSm0ePwqVmPzOKAFFuzHkQCh89zkCfiPk/zR6QnXk
         twWhpPJtJkUVclub0M/zUSf19E9j/i5I1jyCdN0xu93eBflFd09yfuGIhOcwyP7uZKcd
         gNxprpKHS6w9314aXqs3bAnimn95nx37JDnTEcmqQ79tr3yH5lAStftkrosetOisV/4M
         zBZsfsUqPJV5NG0rkMtwWzEHZaIXBstlSLl1o7rtzvWPFQlglkFcF0dFWvRuTX1Hpab1
         tgqA==
X-Forwarded-Encrypted: i=1; AJvYcCVYcbI/07DNQp0Nkg+VX06tSRMWe2nONvbWXSSjjdNmlkBW9UyZIK8s4/ondobjcbZJX7Gjor6dyiFshyUa/Da8cHU/3uGiv4UuLbUAMw==
X-Gm-Message-State: AOJu0YzznWhXYqQ5iZ3f5M4As60xsc28GZ8a0U2Au9v5jYHtH4YIIVSW
	IOu0VigouDdI68d8KOOgPgMuztBEVgxU19nsYLMDTioCe5lg7qildT0Sf9qbIg==
X-Google-Smtp-Source: AGHT+IE/nAbjO9kVczxA1gk0GPTE0dAFY7dS/lNzVrz9t9IGNz9TsBD03sWLikOngI39+ClQ/E7Uhg==
X-Received: by 2002:ad4:5e8a:0:b0:6a0:b705:27db with SMTP id jl10-20020ad45e8a000000b006a0b70527dbmr17551263qvb.13.1715087920745;
        Tue, 07 May 2024 06:18:40 -0700 (PDT)
Received: from denia.c.googlers.com (114.152.245.35.bc.googleusercontent.com. [35.245.152.114])
        by smtp.gmail.com with ESMTPSA id t15-20020a05621405cf00b006a0d19c3139sm4655105qvz.118.2024.05.07.06.18.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 May 2024 06:18:39 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Tue, 07 May 2024 13:18:37 +0000
Subject: [PATCH 11/18] media: venus: Refactor struct
 hfi_uncompressed_plane_info
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240507-cocci-flexarray-v1-11-4a421c21fd06@chromium.org>
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

This field is never used, but if we remove it we would change the size
of the struct and can lead to behavior change. Stay on the safe side by
replacing the single element array with a single element field.

This fixes the following cocci warning:
drivers/media/platform/qcom/venus/hfi_helper.h:1003:43-60: WARNING use flexible-array member instead (https://www.kernel.org/doc/html/latest/process/deprecated.html#zero-length-and-one-element-arrays)

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/platform/qcom/venus/hfi_helper.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/venus/hfi_helper.h b/drivers/media/platform/qcom/venus/hfi_helper.h
index 7c0edef263ae..eb0a4c64b7ef 100644
--- a/drivers/media/platform/qcom/venus/hfi_helper.h
+++ b/drivers/media/platform/qcom/venus/hfi_helper.h
@@ -1000,7 +1000,7 @@ struct hfi_uncompressed_plane_constraints {
 struct hfi_uncompressed_plane_info {
 	u32 format;
 	u32 num_planes;
-	struct hfi_uncompressed_plane_constraints plane_constraints[1];
+	struct hfi_uncompressed_plane_constraints plane_constraints;
 };
 
 struct hfi_uncompressed_format_supported {

-- 
2.45.0.rc1.225.g2a3ae87e7f-goog


