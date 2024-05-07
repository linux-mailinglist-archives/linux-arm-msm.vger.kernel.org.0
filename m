Return-Path: <linux-arm-msm+bounces-19373-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 749AD8BE8F5
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 May 2024 18:30:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 14AE41F21DAE
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 May 2024 16:30:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A3ACB16F0E1;
	Tue,  7 May 2024 16:27:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="eWRLL4sY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F200D16E897
	for <linux-arm-msm@vger.kernel.org>; Tue,  7 May 2024 16:27:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715099241; cv=none; b=RbAOa31zeb0+wLOtUjr5pJ+c0H8uZqX/zqv0s1A1ewApClBlVVItLpEJaOQwCOhlnSpNR7wtkePXDSTNhV1p2rGJhYD6/30Etnw53XyqjnBe9Vw7QGjdgKY4B0/CEh84es1KIPPeGIrHMeWW+ZMHyPcz9CkYEfyt9g6LaKoWFuc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715099241; c=relaxed/simple;
	bh=ty0RG2AjLK5Y8dTp7JoVE8oXrIivf7wrKgPB1ia8aog=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mNkQwSgnX7GAD3aw5C1tSSfUECIBhOCrfH4GcOv8NchW4cndu46qsrxm6wFCXt5JWBQCD4rlrv9uonC2WRuaJe8aDZoOxtN18IzTC+AzrVsSyE1pN42PighKOvfN9YmwlYUuYYMqP73KoJWCE9+w7L7n6NAgcVZ1l6l9ch4gMGQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=eWRLL4sY; arc=none smtp.client-ip=209.85.160.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qt1-f175.google.com with SMTP id d75a77b69052e-439656c1b50so18592201cf.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 May 2024 09:27:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1715099239; x=1715704039; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sqFGKWXdCy9k153fMpH4CQDZP31MGLQ/EHV/2T77xUQ=;
        b=eWRLL4sY5006yFpYtGO03NVIrSE+P/SXeJiMtBBShfMEu19+18l3U18AE23B4LO8ba
         tU8nSqMyERKIxFsGEDjeDMJDh6l2gpLS2CBUSUQvssQt4z0tFXfM1cOb2262uh+gsxaD
         o4R/SQZpOEAaUsrCYC6En4VCqbo1+06KlRdq8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715099239; x=1715704039;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sqFGKWXdCy9k153fMpH4CQDZP31MGLQ/EHV/2T77xUQ=;
        b=ZkBW6eCmoYgOrfVfSvPhdElS1TxSFVZisyaVZZgb4iYrRyTWtDlUxkAR0gUZBVA6rP
         ZoyT+78LZckwUwqnUQFidt2EJpvBxCQGMzozFDLWz33PZNEug4jZ9c14ePHn19MNHMnf
         0xvA+xtVeictgl3Mv3vnt/K/WXHXvJhD4Y8c+nkeSTTDQ0yn79sRSj2vHE3a7nClVKNn
         4zZFY/0Vzs4zG0nIDBbOXh8lqx6/Zn2VLk6Ro8UrZWv0ngbJQkL6WhYbKPHtpARLhqsN
         vdbtzudmYkQVvJjaBovYKdR8T+vSkWGAH5Pn8SgDP/8wrm6WytUkMtc+kgJGY3oX4eqn
         qH3g==
X-Forwarded-Encrypted: i=1; AJvYcCVRTVsxIg0PDObCe/MGtDOqP50PzFeWHLyj5cCDWgq2/BjdX8sFnH5fhR4Ow10ipJsYxHDZ29EOCNv8vV6rRR1OV1QVJSkL+cEiNchs8Q==
X-Gm-Message-State: AOJu0YzsSrPDzZB2em4vM1e3NmzxfyH78AhkmKI363keOx6ONa8Vmlp5
	SJQIEu2OA4tkemOThZH18K3xXJ/CQRG3vNX+JY+aQkOcECN2prwe7021CyZc6g==
X-Google-Smtp-Source: AGHT+IGXgstEE7t4iz9TrxJ0NJkr1ggK5ABmNVeWRW76pFKi5ar58B4xxCSQc/Pi6zqHMhxLCg5DXw==
X-Received: by 2002:a05:622a:301:b0:43a:c878:d7c6 with SMTP id d75a77b69052e-43dbf0bb523mr2235441cf.66.1715099239035;
        Tue, 07 May 2024 09:27:19 -0700 (PDT)
Received: from denia.c.googlers.com (114.152.245.35.bc.googleusercontent.com. [35.245.152.114])
        by smtp.gmail.com with ESMTPSA id hf23-20020a05622a609700b0043d1fc9b7d9sm4160597qtb.48.2024.05.07.09.27.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 May 2024 09:27:18 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Tue, 07 May 2024 16:27:16 +0000
Subject: [PATCH v2 11/18] media: venus: Refactor struct
 hfi_uncompressed_plane_info
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240507-cocci-flexarray-v2-11-7aea262cf065@chromium.org>
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


