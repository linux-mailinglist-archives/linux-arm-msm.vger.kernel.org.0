Return-Path: <linux-arm-msm+bounces-43997-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AC23A026D0
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Jan 2025 14:40:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 886BA3A2F90
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Jan 2025 13:40:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7FE3D1DE3C3;
	Mon,  6 Jan 2025 13:40:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Akfrpqpq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C49501DE2B7
	for <linux-arm-msm@vger.kernel.org>; Mon,  6 Jan 2025 13:40:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736170812; cv=none; b=SMg1CyXD2iRR9zUeMF0oQ4fdp0iRw6FcX6d419wJHVftAsHTmmbLEaOBAIWQbjC7LYLtV0Z7iUqktivpdLAHgmegdQDzSOfi08CdwcRXwfrHUxhBLt6pTOT6phj8lsBO2gCNGyojWJ4r7dFN4jIsxzjJDb0ewFnw9vQRBL2rso8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736170812; c=relaxed/simple;
	bh=/HaOC0UQuUCRG7UtKoSrqnIxQLLgF8uNCr3tEiNAggM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=m36XGjRwQcnLW69cwHfWWgvo+lCRL0W0U4vZhS8RIvF82CV2be6YF/nwj1e10rf2rtQMNqwJyXKrDQdZNvjEgy+B74RdDS3sH6UZO2wCAbNelzt9ujthoQQpRmiOAPGbk8YFJBBQa9y7TOE8BeOgjFvubaPtruUlRK7bSIgwQyM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Akfrpqpq; arc=none smtp.client-ip=209.85.160.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qt1-f178.google.com with SMTP id d75a77b69052e-4679fc9b5f1so109082941cf.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jan 2025 05:40:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1736170810; x=1736775610; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TwdwuAkwGCHw83yVS+OBZ5UTbtgtyF3XHLP2TniQ+hw=;
        b=AkfrpqpqFkO9oYZ8EYkAjIdvYTBAZS8RS6VjxAJV5+HAulLkuQM0eWq4+GwaEll40a
         AphnfeHRT52gMbNs2fGLn2YH2c+zJpGEiz7HEXDlBhKpfNPgFFn6KE9/Neyvyjj2GHry
         L3lLFHXzz/486wxAb9TzEqzQzovowwV9tsgtg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736170810; x=1736775610;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TwdwuAkwGCHw83yVS+OBZ5UTbtgtyF3XHLP2TniQ+hw=;
        b=H3cTkmLJk4lQEBaQqXI/9ZJoYKqOuAlVsz2v5f6v7QWf3kII0xieutAEO1hzPBI0+m
         Pv9e0TgOnw/nOYvjOCZU1FU4gb/lp0HJvy/l7TW14SoZY90PMo4DgcfExURzvRJCntTG
         ek2Z9KGIGFzWUfEZrt6T5NneP6CCH7F6Z/iE0MXNwoh4cPLVi+QWKtBHMR80uu4EFPWI
         inj3VuNl5k1H3YZcUB6VEF+wVGj6JmksJYCkh9q/hG0M1Pw4wbv4drrLCvhXDNmdJFHV
         JJPLBw9QvIkJKqPwfkfFX8jmDicaAMRaZbvx53TAiTm23HB5LwjWx74Qqdy5SB4x290V
         cJ8A==
X-Forwarded-Encrypted: i=1; AJvYcCXBxDxfDlNAOk54b3pjgw6uv4isWwW8j5PXroc14ph8yIJs/wMMzbzMiCSPPshUFG28i7DuSjcdYQYA2AIX@vger.kernel.org
X-Gm-Message-State: AOJu0Yy11D1DOO/Ho1+SMx/7/Ef8zMFagoFpnSKs5BwbhmcPGsFZLK8t
	02VOxVzkY/nCcsk5IEv0y6nFJFZ5RjpUTKZAhTCt4dQljspWn6P6TFSVemLWKw==
X-Gm-Gg: ASbGncsxML/ix+H0NXMt63GNvbRqz6oLSNYCLgVB5M0JKzLTXVrY9ecS2rQJrmJrhWA
	QgqTYX3b6b07cxZW5uzYC7ZFReATPbMhiD0nuMvdu7Y/oCcgbCfShjxMEUf717ihxPgKjXATgMW
	75uqGQDbNZfP6RLdr0aH0Kymr00xkuY6rftCx7K5DyzQTP0mJaCzVNdx4PKRr8GxjUi5I5aneKG
	lRRsSvKlLoGSe+G5UYdXosokNBy7XiDKU/IA2S05Pfi7Eqy/j94HqX4IB2wws5VxlFlqWDtXNvw
	iJqTLqZG3HSGarHjn1K9n3dn1Y2VI/Kh++DF
X-Google-Smtp-Source: AGHT+IEn5Ou8N6A5ZuxRVWPs80QvCQAMfXcoa0B7FLd71FuJaMTg55qppld2zbRIfvJF/yb+Z4SD8w==
X-Received: by 2002:a05:622a:54e:b0:467:6941:4ecc with SMTP id d75a77b69052e-46a4a977daemr1272210731cf.39.1736170809768;
        Mon, 06 Jan 2025 05:40:09 -0800 (PST)
Received: from denia.c.googlers.com (172.174.245.35.bc.googleusercontent.com. [35.245.174.172])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7b9ac478d35sm1501861085a.90.2025.01.06.05.40.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jan 2025 05:40:09 -0800 (PST)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 06 Jan 2025 13:40:07 +0000
Subject: [PATCH v4 1/6] media: dvb-frontends: tda10048: Make the range of z
 explicit.
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250106-fix-cocci-v4-1-3c8eb97995ba@chromium.org>
References: <20250106-fix-cocci-v4-0-3c8eb97995ba@chromium.org>
In-Reply-To: <20250106-fix-cocci-v4-0-3c8eb97995ba@chromium.org>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Stanimir Varbanov <stanimir.k.varbanov@gmail.com>, 
 Vikash Garodia <quic_vgarodia@quicinc.com>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Hans Verkuil <hans.verkuil@cisco.com>, Hans Verkuil <hverkuil@xs4all.nl>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Stanimir Varbanov <stanimir.varbanov@linaro.org>, 
 linux-arm-msm@vger.kernel.org, Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.13.0

We have not been able to find the relevant datahsheet, but it seems rare
that the device will have a sampling frequency over 613MHz.

Nonetheless, this patch does not introduce any change in behaviour, it
just adds a comment to make explicit the current limit: div by 32 bits.

Found by cocci:
drivers/media/dvb-frontends/tda10048.c:345:1-7: WARNING: do_div() does a 64-by-32 division, please consider using div64_u64 instead.

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/dvb-frontends/tda10048.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/media/dvb-frontends/tda10048.c b/drivers/media/dvb-frontends/tda10048.c
index 3e725cdcc66b..1886f733dbbf 100644
--- a/drivers/media/dvb-frontends/tda10048.c
+++ b/drivers/media/dvb-frontends/tda10048.c
@@ -328,7 +328,8 @@ static int tda10048_set_wref(struct dvb_frontend *fe, u32 sample_freq_hz,
 			     u32 bw)
 {
 	struct tda10048_state *state = fe->demodulator_priv;
-	u64 t, z;
+	u32 z;
+	u64 t;
 
 	dprintk(1, "%s()\n", __func__);
 
@@ -341,6 +342,7 @@ static int tda10048_set_wref(struct dvb_frontend *fe, u32 sample_freq_hz,
 	/* t *= 2147483648 on 32bit platforms */
 	t *= (2048 * 1024);
 	t *= 1024;
+	/* Sample frequency is under 613MHz */
 	z = 7 * sample_freq_hz;
 	do_div(t, z);
 	t += 5;

-- 
2.47.1.613.gc27f4b7a9f-goog


