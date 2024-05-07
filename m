Return-Path: <linux-arm-msm+bounces-19322-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C09D48BE3C4
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 May 2024 15:24:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7C3C3288CBC
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 May 2024 13:24:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B704916D317;
	Tue,  7 May 2024 13:18:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="C97A5fds"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com [209.85.219.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB44A16C6B9
	for <linux-arm-msm@vger.kernel.org>; Tue,  7 May 2024 13:18:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715087917; cv=none; b=MUXL/Xv6ygETxc9kyJECb4KnZnLXrKnF6GkkV8pPIUdMOwiWM0OFWUhKxLc1qByIlEqbNafooIv0X63WkmptJqZQB02tmgx73sKDEcbifo0CSt0/YyjywnVwI+kj1dwRCd9p2L9rCUR/y0qYk5faxZmtncpGludMU9gPsKpFFGU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715087917; c=relaxed/simple;
	bh=Ybzvge6Uw1Eh9FNqgRzW6qmy53LUrGIUlQOKIfHH8ug=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LxuYjogc6jblOcIv4wOa8YI9Kl4WQVfikZdI1KM3EREHgZnzDHFa3Yi1qWRI6utcbqbsCxr+T7zZ/kxlvJr/jLEwUCVKoPaDu0ZxGOmOV722dvpKjf+0ITQaNWWZ/h59dMeKsJExyTW21EFxbzrxlsfEvXV6tOSEZKd3oeP2OIM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=C97A5fds; arc=none smtp.client-ip=209.85.219.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qv1-f54.google.com with SMTP id 6a1803df08f44-6a0f889877cso11715106d6.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 May 2024 06:18:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1715087915; x=1715692715; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yEp5ZozBkj0x9D1ws5SUxXE7DcMsbsSxhL1FOw8KqVY=;
        b=C97A5fdsOzRnQKPK00h0Illilfv/nREdZlJuUq8WKtUN7u6XhQiiXxSFudESkXztcZ
         MkzZbHHscl73Sn3QFmR5Xmt/f+drafqj8Jl+bZX7X20pVjc8NdrqK5EsaYpnEBb5YwKK
         +YReYJQsTHFj38bWpF5yoHvLtmkhKdeWS0Uj8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715087915; x=1715692715;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yEp5ZozBkj0x9D1ws5SUxXE7DcMsbsSxhL1FOw8KqVY=;
        b=klOH8BZAjCAKIzdwPYd8fieaDin21e4rvgqpjcC3eVX2o+w3Ms4sHzt4FivYR1vHyx
         4BpsiEGyq7aZd8WVxox1d5bZjPStOIhps7Ka9tBDT4EIpIXaoVkLuw1lyEhYrmEpYH8y
         sUg/3W+TguXuIpcnKiaoWZ1UofY4+4xijs0omHPmpBUJCTNxlImJ1GYK4v5cgPy8M55H
         tmKCRhwihS7yWPY0QIL7QE5uraEiSK/HCQhos9h9ZDtu85AmsVJ9b5IUkgwV/8hQh63c
         NvVL9cSsrBnw/JZaEK4LOqd94Q5IGtK+eMiAB6BIP2enQR74Z5vZc7oq5E6PIPYdcOzR
         oyDQ==
X-Forwarded-Encrypted: i=1; AJvYcCU2Ux9elxF8nNG2Aze7mWHW/IcNlhQMK7SkauvKJuUH6+2chFKXAwcjsIfzfZbd0OD/YdRLIGViyhY6M6a7IGXdsxKwYruBCGmtI2iUGA==
X-Gm-Message-State: AOJu0YwoIoO1bTiCfok9iUcLXjo2XzT6QdiXnJPTo8xfLxG1rDRwuC4Q
	4OUCizo6ZKy3yFnI98PpAWDPMiQN0c7/rPh2CBTqpLhfji1WkYnWpdVbyPZZcw==
X-Google-Smtp-Source: AGHT+IH9XIpdU6+Gw+h8MPHG1GU0bBRHihk9hGC3h7gFftMNuTBDqQiQrQXelAgXIOFhdENJileoHA==
X-Received: by 2002:ad4:4c48:0:b0:6a1:1f45:84b3 with SMTP id cs8-20020ad44c48000000b006a11f4584b3mr9905483qvb.5.1715087914592;
        Tue, 07 May 2024 06:18:34 -0700 (PDT)
Received: from denia.c.googlers.com (114.152.245.35.bc.googleusercontent.com. [35.245.152.114])
        by smtp.gmail.com with ESMTPSA id t15-20020a05621405cf00b006a0d19c3139sm4655105qvz.118.2024.05.07.06.18.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 May 2024 06:18:34 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Tue, 07 May 2024 13:18:31 +0000
Subject: [PATCH 05/18] media: pci: cx18: Use flex arrays for struct
 cx18_scb
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240507-cocci-flexarray-v1-5-4a421c21fd06@chromium.org>
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

Replace the old-style single element array with a flexible array.
This structure does not seem to be allocated in the code, so there is no
need to change anything else.

The following cocci warning is fixed:
drivers/media/pci/cx18/cx18-scb.h:261:22-29: WARNING use flexible-array member instead (https://www.kernel.org/doc/html/latest/process/deprecated.html#zero-length-and-one-element-arrays)

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/pci/cx18/cx18-scb.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/pci/cx18/cx18-scb.h b/drivers/media/pci/cx18/cx18-scb.h
index f7105421dd25..841edc0712ab 100644
--- a/drivers/media/pci/cx18/cx18-scb.h
+++ b/drivers/media/pci/cx18/cx18-scb.h
@@ -258,7 +258,7 @@ struct cx18_scb {
 	struct cx18_mailbox  ppu2epu_mb;
 
 	struct cx18_mdl_ack  cpu_mdl_ack[CX18_MAX_STREAMS][CX18_MAX_MDL_ACKS];
-	struct cx18_mdl_ent  cpu_mdl[1];
+	struct cx18_mdl_ent  cpu_mdl[];
 };
 
 void cx18_init_scb(struct cx18 *cx);

-- 
2.45.0.rc1.225.g2a3ae87e7f-goog


