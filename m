Return-Path: <linux-arm-msm+bounces-19325-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 794F78BE3D1
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 May 2024 15:26:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 177591F21B75
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 May 2024 13:26:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 05B2C16DECE;
	Tue,  7 May 2024 13:18:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="JFt4TNkp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com [209.85.219.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60BEC16D4CB
	for <linux-arm-msm@vger.kernel.org>; Tue,  7 May 2024 13:18:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715087920; cv=none; b=MRx0S2PuvrVz/03i4UYTHjlvf7md2EZtV31WIikS+0d+joB9uGn8xLKFz4BQsZCZMB2gFicCriIa57p0fwP15hCaU5Bzj38+33wXtmE0eTu5QbTfqZ+7xFyTE1wp4oFT2H1GXGO9++nMAKOtTjfTkkcEntWn1IcqhJpzeeORN5A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715087920; c=relaxed/simple;
	bh=3FQmdzC7rLah5bHXqxL1pjRWMb/l2vnOq/dIwPsVxiM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=EduBW3xnVHHa6c6LYAdUmB2CFwDs2CStwSMqfmlow8vReT2n26FkJKw3I9CFG73g9Hzxg1BZRHSqG/HHqjiscTmD2l4Sx6bL5dboZfpij7VcjWd74rCMWISkIykgNdRZi/CqLHS3AicurfJmPrJYoJU/yY5nlpznjGs9JjpIPDg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=JFt4TNkp; arc=none smtp.client-ip=209.85.219.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qv1-f43.google.com with SMTP id 6a1803df08f44-6a0c8fb3540so20414336d6.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 May 2024 06:18:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1715087917; x=1715692717; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JKfhOSoHE1VqyRhgB0xYInvnK6a8zz5LZUqmCULZe+M=;
        b=JFt4TNkpMT5jL5IFAYGuw28lBWwu84Ak+EoHQOC6AlPJzZQOXDDwp2LfLftQDkcI48
         kePHAN4Bhd5TFp56PnCYmL0IjqhZvKlhNTePDpTlPyuZOgFXVPm3H+gBFvSW2TKQP2V5
         t4vOxqEd9Db93cAxWnLWBikZe5wQjTQDdToXE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715087917; x=1715692717;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JKfhOSoHE1VqyRhgB0xYInvnK6a8zz5LZUqmCULZe+M=;
        b=vvj2cHeOiWR+NIQ1odVZG283McT+te8yJ8iA6ap3UrUpFOaUQV0f6zraX1bZXmCMWG
         ss3m2DSZ+Ltdk1wn0zEwKG08erCEiEKowfeuv6CGzRLK2jncZI+f2X7GZL6KuzhlkTUW
         NfxAxrFZtzMrjHx/ClQrr2vhS9Z+g/v+ls4rm5wS0hgJgJXc9an1BbnBc+dhfrWt33o5
         t+sFoAuMr0f+y3mPegtiPmn+HHfWnszcnTXxIhl823HwwKAfwOD7J1joVSannMTODH9A
         jjVO0CMgbyfzepPalQXKN5nM1RNakOP0cIymNE1IeEm1nnrdSkoFE4rft4V5Sv1XIqYA
         Tp4g==
X-Forwarded-Encrypted: i=1; AJvYcCVx09Iw+WvEXUII6+9D3JPb/1kk3u7e0XEr/MM73IrCMUZ9r99MajnpqYTQS+/PNmuLDWkrY45G/DB5YrZfqMt1HS3qFUOTgXGZeS5MiQ==
X-Gm-Message-State: AOJu0YzSBQooDam+bn1YnOrr8s8DhzI40/eYkRBJpM3vsUPjakKMtkO2
	r1qXxI26bOBac1ONhfOfzVeeQlCZwlu+L+pyI8wO1OV2iryg/mLShsNheURSlQ==
X-Google-Smtp-Source: AGHT+IFKliypIzu0YjFcg14a69MBEAau+ZXpSAYRUE5dq1ueGc4ePsCBbZXpGGTph+KzlVWTljAkDg==
X-Received: by 2002:a0c:e082:0:b0:6a0:f637:667 with SMTP id 6a1803df08f44-6a14600e407mr45875746d6.12.1715087917380;
        Tue, 07 May 2024 06:18:37 -0700 (PDT)
Received: from denia.c.googlers.com (114.152.245.35.bc.googleusercontent.com. [35.245.152.114])
        by smtp.gmail.com with ESMTPSA id t15-20020a05621405cf00b006a0d19c3139sm4655105qvz.118.2024.05.07.06.18.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 May 2024 06:18:36 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Tue, 07 May 2024 13:18:34 +0000
Subject: [PATCH 08/18] media: siano: Use flex arrays for sms_firmware
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240507-cocci-flexarray-v1-8-4a421c21fd06@chromium.org>
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

Replace old style single array member, with flex array.

The struct is allocated, but it seems like there was an over allocation
error:

fw_buf = kmalloc(ALIGN(fw->size + sizeof(struct sms_firmware),
		SMS_ALLOC_ALIGNMENT), GFP_KERNEL | coredev->gfp_buf_flags);

This change fixes this cocci warning:
drivers/media/common/siano/smscoreapi.h:669:6-13: WARNING use flexible-array member instead (https://www.kernel.org/doc/html/latest/process/deprecated.html#zero-length-and-one-element-arrays)

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/common/siano/smscoreapi.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/common/siano/smscoreapi.h b/drivers/media/common/siano/smscoreapi.h
index bc61bc8b9ea9..82d9f8a64d99 100644
--- a/drivers/media/common/siano/smscoreapi.h
+++ b/drivers/media/common/siano/smscoreapi.h
@@ -666,7 +666,7 @@ struct sms_firmware {
 	u32			check_sum;
 	u32			length;
 	u32			start_address;
-	u8			payload[1];
+	u8			payload[];
 };
 
 /* statistics information returned as response for

-- 
2.45.0.rc1.225.g2a3ae87e7f-goog


