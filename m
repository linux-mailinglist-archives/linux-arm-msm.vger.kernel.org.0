Return-Path: <linux-arm-msm+bounces-19335-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E54B78BE3F7
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 May 2024 15:29:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 222B61C23350
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 May 2024 13:29:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BE58617554D;
	Tue,  7 May 2024 13:18:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="garPljce"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com [209.85.219.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E0DA16F0DB
	for <linux-arm-msm@vger.kernel.org>; Tue,  7 May 2024 13:18:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715087929; cv=none; b=CFKxwMZ9NyRVmg4A2bM+70caibAinpkonGA3FNbvrUf6xuCCb8PyybAXri83KAlKFcF4e27wOPLu3p2beUCwxqYSScSawVIZHoL8vK2zwG4wz2Usv1wfIJf4CUOLi+UQix3uIOQWhLHzph6HH+zMjOFM/eVV3bypo6L0gj60sYI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715087929; c=relaxed/simple;
	bh=xx+wxFNs3ZuqK7Hxds/mLdbM5HIFghI8UQG5DaBamLQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DAqMtgQYVK3RuQsml70ZmOQbHYT/HK0ox8OJfWF5kLFVmVrEZ978QxoDAXXxc3ozwBX46wd2H+CW9i5dbwWotiiDJPEqyLU1ftzaK1S/HROMIOvl5vNyqPOln6ozQfLa9QLDsLT8VTT3xWwdT9gKAj2+9vX0STacxtZjVSPIuWA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=garPljce; arc=none smtp.client-ip=209.85.219.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qv1-f50.google.com with SMTP id 6a1803df08f44-6969388c36fso15048926d6.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 May 2024 06:18:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1715087926; x=1715692726; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=24yjDTHuOCF+C8SbX9O7bVVIA87jnk99ezK2b/3Gma4=;
        b=garPljcecjdkN6g8mvA+SMMfsdgqxokHgqjgJwXYDnh+7+6pxUpSAk0DUlD95uevNs
         TCt/3xTog5KdLlcGfUR/zheJUzVyYhjYmnE6SQaQP9+qsMZI+sQILhIXBVQG+OLCt7+I
         RnDymbMwEyyBe148rcabRZCSHfxiCz58EKJPk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715087926; x=1715692726;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=24yjDTHuOCF+C8SbX9O7bVVIA87jnk99ezK2b/3Gma4=;
        b=LmA0VkYqdJ3yO8g9OSu2SKOBjFGMPXgL4m+GW5VdsbcUFWfTvJD7hb4esbtaH7XD2p
         MdEooP2nkXBngLSyAMVlVVjTqzOXMrFUk0OpAjsyMaEXcnByOZ1SWAKWADFnYIC8tULS
         pVZ9gvJ0GGFv3uisUYvPAdXO+M8zxlI79Lht69dZP3mnpay+BKgySPcJrU/0jNaaQkGZ
         DDAUYeLO5ncs2Ma2IaWVPjeAv1quIvVOXDimidpg5Z364kjm90j1aMI3YKHLFLMKK/wU
         xOeaITkQ8OQ60Ojv53xWXE4HLCkhR+uSg454Clcq5eCepz7lVYJ5kdEZUDMZbmnisajj
         3mrA==
X-Forwarded-Encrypted: i=1; AJvYcCWV1eQx1zw1GZX5RAjbVny2+UcjKd3Rzn+9GvGKw7fGZa2amf4JwbR9bgghooftScVnnY5GKQ7OUjODPwAHix47x8s3ap/6iAR7GT7WZQ==
X-Gm-Message-State: AOJu0YyPcrN3AIYZIf4t1zTFg6qOo1BIGPGTnbHtMllz8bkRujRQcvD/
	IqexS72ke/6DfqaHLNtAxza1h+g4VXlSdS1gNGzSY7Uo9RxhSKUzY9VterBDjA==
X-Google-Smtp-Source: AGHT+IE6WEUHWsRpAsJ5BK3gENbuRTlCVd8egHvgiFgdym5FLM6gUWkr0leru0COMDpv6wPoQvFI8w==
X-Received: by 2002:a05:6214:d6a:b0:6a0:c903:7243 with SMTP id 10-20020a0562140d6a00b006a0c9037243mr17142784qvs.55.1715087926638;
        Tue, 07 May 2024 06:18:46 -0700 (PDT)
Received: from denia.c.googlers.com (114.152.245.35.bc.googleusercontent.com. [35.245.152.114])
        by smtp.gmail.com with ESMTPSA id t15-20020a05621405cf00b006a0d19c3139sm4655105qvz.118.2024.05.07.06.18.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 May 2024 06:18:46 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Tue, 07 May 2024 13:18:44 +0000
Subject: [PATCH 18/18] media: venus: Refactor
 hfi_buffer_alloc_mode_supported
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240507-cocci-flexarray-v1-18-4a421c21fd06@chromium.org>
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

Replace the old style single element array at the end of the struct with
a flex array.

The code does not allocate this structure, so the size change should not
be a problem.

This fixes the following cocci warning:
drivers/media/platform/qcom/venus/hfi_helper.h:1233:5-9: WARNING use flexible-array member instead (https://www.kernel.org/doc/html/latest/process/deprecated.html#zero-length-and-one-element-arrays)

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/platform/qcom/venus/hfi_helper.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/venus/hfi_helper.h b/drivers/media/platform/qcom/venus/hfi_helper.h
index dee439ea4d2e..9545c964a428 100644
--- a/drivers/media/platform/qcom/venus/hfi_helper.h
+++ b/drivers/media/platform/qcom/venus/hfi_helper.h
@@ -1230,7 +1230,7 @@ struct hfi_interlace_format_supported {
 struct hfi_buffer_alloc_mode_supported {
 	u32 buffer_type;
 	u32 num_entries;
-	u32 data[1];
+	u32 data[];
 };
 
 struct hfi_metadata_pass_through {

-- 
2.45.0.rc1.225.g2a3ae87e7f-goog


