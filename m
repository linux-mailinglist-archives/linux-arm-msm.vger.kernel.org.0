Return-Path: <linux-arm-msm+bounces-20651-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id D63668D0F0F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 May 2024 23:10:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 76DD1B21C30
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 May 2024 21:10:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 19558169388;
	Mon, 27 May 2024 21:09:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="UCcT4bbe"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com [209.85.219.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA7901667FB
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 May 2024 21:08:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716844143; cv=none; b=VeJO//xQbD12YnMzmT1ND9/3Upw3s5Q3SAvv79WZXGzwB+WVExMSU0H50ZNBTpt/F9olXpYIGao7KnR2CTAvBcLcIBtWtNqh9Rqn/U+58AUWqlOV2s9tb9p2wIntRbpXZmW2bd67uedqhLo3l1p2l9mDfMmNwBBcA/gN2arxSFE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716844143; c=relaxed/simple;
	bh=VzyZzQu2iLKQpCL82ezkV3DfXk0qxb8vZ6CNoQ/jYj0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=klDwkzL+jaKhyd97NonPbOGNCpyTIyMWYoXoB79nHZ4DwJVyYXHhxn8Q2Jguxp71pFiUyrj8zxiq+EsA+m1LnJPY73IST6A23pm0EqghMs/rA1p1NsBE4jVnjG481UI4fVJJQGwSzQh8ASQhiEvkQBygv993K5jNZYDgTzjl5OY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=UCcT4bbe; arc=none smtp.client-ip=209.85.219.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qv1-f44.google.com with SMTP id 6a1803df08f44-6ad74a836d7so470306d6.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 May 2024 14:08:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1716844139; x=1717448939; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MFWoExP/wH3m7hjvZ2JqRkdunbepixaqBCDXaOKvVh4=;
        b=UCcT4bbebR9QE9ZfiHPdbXCh5Y764jzR2T4NqxWFZ9ntEP6XGOfu2n/thpmx6tM+cB
         gt42wxjh3Jg030R6fLmEi6Jq67kWH8KrnohzmJsT1L2xEjl4iY9kztrLx7Q/AylYmOXN
         R8qqh09RYKZle+cZNuM0KslAjKQUK478agkX0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716844139; x=1717448939;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MFWoExP/wH3m7hjvZ2JqRkdunbepixaqBCDXaOKvVh4=;
        b=oXUOMaDgihnuwycy5tPvnW7HUjpLwRbrKeDr4ya9oJAbdDtryyaUTMYL3yIISwiWZW
         cbJUXkpakid4LlcDj7FUMu35h/QzFT8JR3gtbESdIxS0QWaDOwdbaI6FGjUrbW3Mp1Ln
         of89bajJdrB+OK52VAaRW55fc6eTsvIkzmHwHewyA6M3jIX3RkieLA1t/B6/QJAUVTiX
         Dqj6TlwPCfJvFeCV7D6RDKGVCi88WS7YPc47Ym6hwEdnj1+3m8paUn//KFShk7Cie/5h
         kGVibXlhueq4Abg1uoMB6sp7uPwNEa0LzFf/knbPZqbb54eJGc6Sd4Fa9356ulwYC8kQ
         HTwA==
X-Forwarded-Encrypted: i=1; AJvYcCXRB6Q3naz7OWWsHTRNz4qhAPyo0r+XO6v2E8VwXfgK59gorBxr4fgFGw/LBbPX+oBTBSPDlfYcBAXpyMZF6w218NZy/hZkM/DNm+7/Jg==
X-Gm-Message-State: AOJu0YxCCUOrI9Mzsz1fphSPUEg3jLmS6QcdUZ40LVJDB0KO0VdD8Tze
	AbXH9wbL1hgVbJQ6zsUy1ycv/oLqvFsFleo6QNklQnX2LdFOFc04e+q8a6uJaQ==
X-Google-Smtp-Source: AGHT+IFivOXXvR8CUjqaAYwugV85CB4ajDPAOeknJmut8X/c8q8/lFGzrGSFxvIJPA/iWbuRhKRNlg==
X-Received: by 2002:a05:6214:3d87:b0:6ab:898b:42e7 with SMTP id 6a1803df08f44-6abcda62be8mr118486476d6.65.1716844138851;
        Mon, 27 May 2024 14:08:58 -0700 (PDT)
Received: from denia.c.googlers.com (125.135.86.34.bc.googleusercontent.com. [34.86.135.125])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6ad850a6dc7sm9511866d6.93.2024.05.27.14.08.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 May 2024 14:08:58 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 27 May 2024 21:08:54 +0000
Subject: [PATCH v3 04/18] media: dvb-frontend/mxl5xx: Use flex array for
 MBIN_SEGMENT_T
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240527-cocci-flexarray-v3-4-cda09c535816@chromium.org>
References: <20240527-cocci-flexarray-v3-0-cda09c535816@chromium.org>
In-Reply-To: <20240527-cocci-flexarray-v3-0-cda09c535816@chromium.org>
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

Replace the older style one-element array with a flexible array member.
There does not seem to be any allocation for this struct in the code, so
no more code changes are required.

The following cocci warning is fixed:
drivers/media/dvb-frontends/mxl5xx_defs.h:182:4-8: WARNING use flexible-array member instead (https://www.kernel.org/doc/html/latest/process/deprecated.html#zero-length-and-one-element-arrays)

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/dvb-frontends/mxl5xx_defs.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/dvb-frontends/mxl5xx_defs.h b/drivers/media/dvb-frontends/mxl5xx_defs.h
index 3c5d75ed8fea..512ec979f96f 100644
--- a/drivers/media/dvb-frontends/mxl5xx_defs.h
+++ b/drivers/media/dvb-frontends/mxl5xx_defs.h
@@ -179,7 +179,7 @@ struct MBIN_SEGMENT_HEADER_T {
 
 struct MBIN_SEGMENT_T {
 	struct MBIN_SEGMENT_HEADER_T header;
-	u8 data[1];
+	u8 data[];
 };
 
 enum MXL_CMD_TYPE_E { MXL_CMD_WRITE = 0, MXL_CMD_READ };

-- 
2.45.1.288.g0e0cd299f1-goog


