Return-Path: <linux-arm-msm+bounces-19379-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 303278BE909
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 May 2024 18:32:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D9CFE1F229DF
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 May 2024 16:32:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D2FD2175571;
	Tue,  7 May 2024 16:27:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="W00zVTc9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ot1-f45.google.com (mail-ot1-f45.google.com [209.85.210.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 962B316F82E
	for <linux-arm-msm@vger.kernel.org>; Tue,  7 May 2024 16:27:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715099246; cv=none; b=lF6Ce5R/YrogMYjN0H5ck825rvlT0+ggei5OPE5QzddXJN1sCA2p5QvBKC+dd0CK+zIUK4zm+2bpa15IkYWg7y6dFJpRSXXga8JWZxMHa979pepSuUkc/QL1E9o5AMA8JANDcd4SxpdTbGxqfLw9YOOHLGJiRR9E2s4XzDHVZmE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715099246; c=relaxed/simple;
	bh=NAI8v6owc4vhrxHrnDBAOrLbBtSLWdHrs5V1XLgw6yE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=N7Snv5ljo2nKCEdxl3LrR7264Gd9XDxvyCBEd0ZBMFWoTMwPgfw0InW+MSTUiiLTAq1r5Z+BUsNDO64FLON7MpNzfaD0ZXZ4XCuLMMWDy3tBB3Wd+XcIGRByLUAMctT2f1495JUIYDZxhiSQAc9SWbWrJDaN2EAA/bgtOa/vF9c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=W00zVTc9; arc=none smtp.client-ip=209.85.210.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-ot1-f45.google.com with SMTP id 46e09a7af769-6f05c6e36c8so1294930a34.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 May 2024 09:27:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1715099243; x=1715704043; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ksOWhtvDjU4SOAc5LYb/tmHPugkENGAwplW75xl0q6I=;
        b=W00zVTc9aMERGDSydzmCMFZRwcnm7aUra8kagSRdRTv8THCXr/AiIc7K81+Ciy7IEv
         i21FIFrJDTB1jBhQOJf7uuV0ngZwZ14aTFeeB6Ey7VIaTr1TKvfBwPdJ/vyHIu8Plgko
         Hbv98E4ThhatFk1snKI4i2Dgw+vUS4ICR9ZTc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715099243; x=1715704043;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ksOWhtvDjU4SOAc5LYb/tmHPugkENGAwplW75xl0q6I=;
        b=NA84cVJBzIS5FSMjgBL+Jr5ocMU60ZMrljfZzQYBL48Iut6Vx/QtvCcI4vGPnWHCrw
         aWB5gZBcXzvj7JhB2BTYSvmo7/sqPkyNyGafm8wGUDYbh7Ttix90Lxdaq2TB1lnnP4Xj
         GnJUooV97vtg7+HPIVb+oJilJXSKlsv/J7l010+uTW7IP4fbR+AMqluShurD3qz+oOBm
         fqe/6BkoTWsYlfGSt+4bp9CpRtwPP4Xggbl/+4+WSPQJL0Qx/jiCj1rXWEyXilIfWpfh
         ZJsgSwft/6PRaCcmPWprewBXlhQMpXN/VibwmW4hRhby5kiMBLNDsEgBP+KO5WFcwO5j
         v5tw==
X-Forwarded-Encrypted: i=1; AJvYcCWjah1dwpGxGsZLPgsY+6O+Z6zVGkFKhJKwEcBVt3yHaypSVKRek64tosGPxzBTwaiQY0kGVvZuiXHSZNaubEQQdSp3/v+CkhEDNT+zKw==
X-Gm-Message-State: AOJu0YwRhD4nn9zgFYNysXgK4tv2NHHMOksYydPwN2I3hldt/iTD1won
	kDqKarAllEVjEAm2t20NdXZKbjGvnhISrekwH5khzsgWktoRwvDD762ggBtOjg==
X-Google-Smtp-Source: AGHT+IHvsozzVLWdoiBjQEoTd85TRkr6VfUZ3BRsJ3jAW62XAs6ZO3NhOM6uPqcyccfc0QM2jKHKrQ==
X-Received: by 2002:a05:6870:c392:b0:23f:eea9:ae74 with SMTP id 586e51a60fabf-2409915a7e1mr57362fac.46.1715099242010;
        Tue, 07 May 2024 09:27:22 -0700 (PDT)
Received: from denia.c.googlers.com (114.152.245.35.bc.googleusercontent.com. [35.245.152.114])
        by smtp.gmail.com with ESMTPSA id hf23-20020a05622a609700b0043d1fc9b7d9sm4160597qtb.48.2024.05.07.09.27.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 May 2024 09:27:21 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Tue, 07 May 2024 16:27:20 +0000
Subject: [PATCH v2 15/18] media: venus: Refactor
 hfi_session_empty_buffer_compressed_pkt
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240507-cocci-flexarray-v2-15-7aea262cf065@chromium.org>
References: <20240507-cocci-flexarray-v2-0-7aea262cf065@chromium.org>
In-Reply-To: <20240507-cocci-flexarray-v2-0-7aea262cf065@chromium.org>
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

The single element array data[1] is never used. Replace it with a
padding field of the same size.

This fixes the following cocci warning:
drivers/media/platform/qcom/venus/hfi_cmds.h:146:5-9: WARNING use flexible-array member instead (https://www.kernel.org/doc/html/latest/process/deprecated.html#zero-length-and-one-element-arrays)

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/platform/qcom/venus/hfi_cmds.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/venus/hfi_cmds.h b/drivers/media/platform/qcom/venus/hfi_cmds.h
index 15271b3f2b49..02e9a073d0c1 100644
--- a/drivers/media/platform/qcom/venus/hfi_cmds.h
+++ b/drivers/media/platform/qcom/venus/hfi_cmds.h
@@ -143,7 +143,7 @@ struct hfi_session_empty_buffer_compressed_pkt {
 	u32 input_tag;
 	u32 packet_buffer;
 	u32 extradata_buffer;
-	u32 data[1];
+	u32 padding;
 };
 
 struct hfi_session_empty_buffer_uncompressed_plane0_pkt {

-- 
2.45.0.rc1.225.g2a3ae87e7f-goog


