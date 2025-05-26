Return-Path: <linux-arm-msm+bounces-59417-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 69F06AC3D41
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 May 2025 11:47:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B236E166DED
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 May 2025 09:47:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3A1381F4C92;
	Mon, 26 May 2025 09:47:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="WsMSj1PU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F46B1F3B89
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 May 2025 09:47:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748252837; cv=none; b=j9ZDlgaEr7HVaq2f7l9rogK1Dpu+APG48v1TekaP2iTNBWIU9xhmXlnFI3gFugMjXO6vvVbUTbdfHM6a/jQPiJkgihd//teSqtmi/7t10hjob9uK1i+0n0rA54+0DlchRwqLexV6roS4+ocAt4h6zaM6w6EWi4S1hwiWKJdIz0w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748252837; c=relaxed/simple;
	bh=mT/EMNtSwpdKAfwY6okQuII7UuVyMAXDJYDo9/I1RAw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VHh5H2ssJdmXcfCiw3fQGPxRJLD6yfMAUTLRGf6YHmB/RwFJeeD8fgCrzz9nqmv7ENBbBi9nxM9eNmxm6OQAVrZbKymjJ1qfhKJjMIZ3RE/upMFwj9SS3UxV9/B9ih5nn57w1Zh3E22pWbMqaprX4KR7VCzODfsZLs+Y2jM+F2s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=WsMSj1PU; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-60472d90787so207429a12.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 26 May 2025 02:47:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748252833; x=1748857633; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mf98aVEPRnEWwXE+rikHvFZrdzzyYrcXz6WwCds+ve0=;
        b=WsMSj1PUuH74yBrzXjSFpGhwG2yF0SY8AJ126a7w1me0zeLOL5xaQDK2yUFOg30H5j
         mM17ryX/TlFiC7BiyKtMs7Xmt0XNGaysSN6ToXyi4p0s8XGwE1bNcpt+qxLqyhx9+zZE
         R3I1WUznQTE6mlkHShw0HkUjCiqj0KG5rkQkYZOmmvVOhd6A7bsYAKjQtmA1XfsqR1ek
         5ovKaj9U5nWV70EOr4+1Hb/2ajNNwcQ9S6GbbkaCqUtpRPxi8ku3kRNPbvn4H8Rxcog2
         OCpC/hJ8hOlaptz66nbwEPANwLYnab8Ribaj5BO7Qrln2LmagrfQkgSxV/O8B/g/30aF
         5lPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748252833; x=1748857633;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mf98aVEPRnEWwXE+rikHvFZrdzzyYrcXz6WwCds+ve0=;
        b=Qjp8RzKjUk3XLdBNF6wi+AZN83b0VABxPxJo4oMl/Va7CEYgum5cqd4tpQqaAr78fz
         oC9HbxQUD1qm9jRK98tmNorklWIOQt8y3KCMlfuAH5OMbQcoU2TeeMQr6ngGDzqxgfnI
         mYqoXHAGjx/x0ixoaKb8vd63uNh4CuP7+xWjkPHuewBFivYGkPvjV0aZP7kVJwsDQLyE
         zYZz60QF8Jfbl+zJubv0jZ24DjFZsBENYRVmm9DBFFt63sduB03XdhtMAFE4KRGnB4tK
         1JlXKd9hYSH8zPaLh8itOsbnJA1dd2uGKm5mGc076ZMa/5WIxA5Uy15uaEHkIgKYZd/f
         WEKQ==
X-Forwarded-Encrypted: i=1; AJvYcCUTQXcza7dq6b682TWLZ1M6Vh+XYDlO4myWQsvidmlyfAvmVzQQuy4CkH8yvFMaSeQDIaHIX558Y0h5Zhol@vger.kernel.org
X-Gm-Message-State: AOJu0YzW2ENTH1cCHXndsnPz/y5vaLBb/gHGOHutTXQ/30f16A5jt77g
	qYHuVjmhggnvAXM62ohiMPScV+1zEzJl9pNDqy9TwWWC4Y01Pt437GL0UgaWV0DfrTo=
X-Gm-Gg: ASbGncvvK7kWi0050rL0kNN3ukgCVxujPOkGGR1HDI5Z3HrXJez6Dref5kWMUfuZ5UX
	oV2T4pL552CBOjRaD2sXzst1geCzJPOOiF1IamWSEtRx5TTB3H4XK3CFqj2b/XmVui1UCnNekWI
	T4UoDX4EhZOM2+NRSqa3LhM4SQJ7VUFhdCKRihCV2ExkPhRfdmtrDLFNIrbPhWwgnvfUCGQfANW
	YVZA3+GUBSOT4tiZHiPt3CP1Tlewyx0ZLU+5We55b4Hf74ivu912jvqe2gtOc1mJnAk+siUO6vd
	NNeYwyFy9UYFY4Ohsmev81XbG+CCM62CQ2mZ0k29JhyskwF+XwZiPEA0iBr3dvuM2DWbyc0=
X-Google-Smtp-Source: AGHT+IFQ/yOEW6qFlSR6tl4VswK3VUmEUrQUe/Qse8CIDzE90hh/Y0WqsQgHDIHFf+lTQEEGJWMcWw==
X-Received: by 2002:a05:6402:26c3:b0:601:abc4:1b44 with SMTP id 4fb4d7f45d1cf-602d9df6cedmr2589786a12.4.1748252832752;
        Mon, 26 May 2025 02:47:12 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.223.125])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6049d482cc7sm1486427a12.19.2025.05.26.02.47.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 May 2025 02:47:12 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Mon, 26 May 2025 11:47:02 +0200
Subject: [PATCH 2/3] ASoC: codecs: wcd937x: Drop unused buck_supply
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250526-b4-b4-asoc-wcd9395-vdd-px-fixes-v1-2-0b8a2993b7d3@linaro.org>
References: <20250526-b4-b4-asoc-wcd9395-vdd-px-fixes-v1-0-0b8a2993b7d3@linaro.org>
In-Reply-To: <20250526-b4-b4-asoc-wcd9395-vdd-px-fixes-v1-0-0b8a2993b7d3@linaro.org>
To: Srinivas Kandagatla <srini@kernel.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Vinod Koul <vkoul@kernel.org>, Mohammad Rafi Shaik <quic_mohs@quicinc.com>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, stable@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=996;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=mT/EMNtSwpdKAfwY6okQuII7UuVyMAXDJYDo9/I1RAw=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBoNDiahh7YsUBAm8Iu89FMVlZwn3xet93APz5h0
 3uJi60zcxKJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaDQ4mgAKCRDBN2bmhouD
 1+fUD/981M4YfExEo4SwrDuA7PVrVCLEGQOILs/9VATrukI3ZP0GscQGTIPCQY9Zcx5WlwnfTDb
 tnejUOcxqApFXlwuzbuepvNtVlRyRqF6jvdO3D5DtAZHuW59VB4atNkVhLAPn9JLh+O9DTQJZpl
 BI6AnEYCTqwuQkVk+e6JqWC24GNeN9TSmSW4izZfzoQYU475omw9dQ5CuWU2BpMDsqAo7+73lc5
 2S759DiwR764pmXfakow15a6gLPjPtllS6DXQe17NKHD5NTuR//X0Xjj3JDBQM6/FKmr2fHFL26
 YXvWHOMcm+nCJZrjniXILk7Wp2zjFJ0RVufnPlKM0nlMg2w7R+mSX7eNyHMvjGp1F4XPVEjjFo0
 rGZFNef/g+6uUEcwgwPj6johBCnCLEf0DgcIEXmNMDSllQtr1KtWVhHX4TzgBZB/5qC1UnXcvv3
 XfO1iq2mA9Gd95SaL3edLoPl/sZyjgZFr0h9aMJIfB084y/8H9zZGnupVP0iWD21wrxmY1XJIvT
 lNinP/AEW/bwPtqAFuKc07u8lbqfpVkqseimONoPZBFpBHJXah5Z7C/DzjZzI2f39jD3I30/3WO
 62WMeue++WBVUvLJAwH8VUeVDJQmqtk+HMSiwECH6a56t0tVpNgzTZqe4/AL73BdzWyL5R0r//h
 TUjsAnDn0MQgA0A==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Last user of wcd937x_priv->buck_supply was removed in
commit 216d04139a6d ("ASoC: codecs: wcd937x: Remove separate handling
for vdd-buck supply").

Fixes: 216d04139a6d ("ASoC: codecs: wcd937x: Remove separate handling for vdd-buck supply")
Cc: <stable@vger.kernel.org>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 sound/soc/codecs/wcd937x.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/sound/soc/codecs/wcd937x.c b/sound/soc/codecs/wcd937x.c
index 3b1a1518e7647366b4de0e90828b8d97b82c5bd5..a3a4b1f53e88e7ade13455387a65de736b1f0bec 100644
--- a/sound/soc/codecs/wcd937x.c
+++ b/sound/soc/codecs/wcd937x.c
@@ -91,7 +91,6 @@ struct wcd937x_priv {
 	struct regmap_irq_chip *wcd_regmap_irq_chip;
 	struct regmap_irq_chip_data *irq_chip;
 	struct regulator_bulk_data supplies[WCD937X_MAX_BULK_SUPPLY];
-	struct regulator *buck_supply;
 	struct snd_soc_jack *jack;
 	unsigned long status_mask;
 	s32 micb_ref[WCD937X_MAX_MICBIAS];

-- 
2.45.2


