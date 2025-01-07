Return-Path: <linux-arm-msm+bounces-44112-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 20868A03CFD
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Jan 2025 11:54:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 11A431651EC
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Jan 2025 10:54:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 410761E47BD;
	Tue,  7 Jan 2025 10:54:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="cVJPobvo"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AEF71DFE15
	for <linux-arm-msm@vger.kernel.org>; Tue,  7 Jan 2025 10:54:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736247274; cv=none; b=PkR3n/p1UuPgwTCjG3CA9UYMrDq781zgpAwy/2v+nCElTCJ7lEim7E+ZtXv7G+YfJhLKlGElCSH5pwJkR2NT4y6sB7uEfNtkLWB3nvAR+hAueCBaFJ55JRoj5ICcQB6DGpxlNjlUUchKsRgx+eAKbP3PNLlXPDrhNAXr3i7dzQ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736247274; c=relaxed/simple;
	bh=/HaOC0UQuUCRG7UtKoSrqnIxQLLgF8uNCr3tEiNAggM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LuQcxTgP4BPdADdrxKV/0B92K5ahT24by96WSywA/cZbD5Cje2Li1u/sKEkXrES6leKz9qd/2yw9oALKhXZpuRdkVqhB1/bKtp0paWCbSWvUihZKcSGsJyWgmCdPNGxx6Hx/kdjSmDP7X02VSNEKmIrMHZUVXT8xRawx6VFO44A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=cVJPobvo; arc=none smtp.client-ip=209.85.222.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qk1-f180.google.com with SMTP id af79cd13be357-7b6edb82f85so1988184685a.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Jan 2025 02:54:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1736247271; x=1736852071; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TwdwuAkwGCHw83yVS+OBZ5UTbtgtyF3XHLP2TniQ+hw=;
        b=cVJPobvoPkV8P8HWiWovB6paXXBwUIH1OXR/aah3q7AIQn94XZ03Kc2uwvfjsVvOqa
         4O2jX2uv9n3KWr8T1MqycoW2edSCeJ085yplu3cTUvr3/Ynwjr/MVkYCIOh+x49w89nA
         6V3Uejb5jeblgoOD3YC57vvpGlghni5vquHZg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736247271; x=1736852071;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TwdwuAkwGCHw83yVS+OBZ5UTbtgtyF3XHLP2TniQ+hw=;
        b=DiK01leLNu5qqG/ynUW7BXgkig3QAMvmfw8NwhvKwZecZbam6oN9Xi9IeQPu2zTdTM
         CGoQ7YNGYhdSMIQczVtoP2WCMRuMp4aNu80IjXEgcNEXKe0DqZ52qCxUS75irPwi2Hzr
         Bq+WVECSWiZ2lBGlnTMsVz9Q14q9Q8khPRQF8nfTOR78UFeLIVDHd4dVIqK6WBlxS6Pq
         c657mr5jRb83A52XMFgejof+EO6qFOeU8WkT4nGJqUc8n6AUgs4yYli3YTma2gb5dikr
         5ZtbWRPdxOPGmQfhR+8yWC+25uQ0WdHCG1/1RegYzz0LucIuJHikn3njxWwcMo5IMFzM
         /YFA==
X-Forwarded-Encrypted: i=1; AJvYcCX0gaqQi7J7NbH+LmKkM1TtenvW05hUetwvrlFWUTbpikc1F1sV6hEFQ1O2gwaKAvxOGX1IdN1OQfC01E3I@vger.kernel.org
X-Gm-Message-State: AOJu0YzjFpkmmz9qJWvuJXkRoPRAm8msIFTqvoK28X9ahTEEVjrRdQ1L
	iIRqmVxR3rSTtqg0oIsH4Ry0I25OtBztiZMfH6H9aqxgqzfv8FgEJuwhtYZlgw==
X-Gm-Gg: ASbGncthLIPG8yMzXTMgcwFsdJqs1gnUNmLYaunz0dmEnUpy356zBkXJEc+BDJw9VzR
	XpwQhg6CCVaD5uxNijdN7ycsWAKFoyqcnmw3u0T8Xwv6KPO7XAXYOxyS4Vt/KmiBx1VRGIHN3Dw
	47fRK6RqEiVrHw05cg6NLc/64SJsBI5bgoqO+/L7PJ0N+Jg49dz5MmstRg9LSkgtHT4Qg3sasdY
	FAC8ti8eeMVpyi8RV4KGvhpLrfYMtw9jrgKM124k3Asvm428hUyMhgEhK8accJIB9HN25pvh2dy
	FxY7KVrAdobueWqZ0KAlm558v27GWlbKffC+
X-Google-Smtp-Source: AGHT+IFUED888CZMdpqwUZpQU35gMcTaIVUuxirN6mnBatoGC47VT9cuT03Is5gpmuF9mhyyMM8HCw==
X-Received: by 2002:a05:620a:459f:b0:7b6:d4df:2890 with SMTP id af79cd13be357-7b9ba6efb22mr8450427785a.4.1736247271590;
        Tue, 07 Jan 2025 02:54:31 -0800 (PST)
Received: from denia.c.googlers.com (172.174.245.35.bc.googleusercontent.com. [35.245.174.172])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-46a3eb30b97sm185094401cf.86.2025.01.07.02.54.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jan 2025 02:54:30 -0800 (PST)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Tue, 07 Jan 2025 10:54:26 +0000
Subject: [PATCH v5 1/6] media: dvb-frontends: tda10048: Make the range of z
 explicit.
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250107-fix-cocci-v5-1-b26da641f730@chromium.org>
References: <20250107-fix-cocci-v5-0-b26da641f730@chromium.org>
In-Reply-To: <20250107-fix-cocci-v5-0-b26da641f730@chromium.org>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Stanimir Varbanov <stanimir.k.varbanov@gmail.com>, 
 Vikash Garodia <quic_vgarodia@quicinc.com>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Hans Verkuil <hverkuil@xs4all.nl>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
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


