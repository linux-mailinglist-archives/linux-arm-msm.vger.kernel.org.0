Return-Path: <linux-arm-msm+bounces-51913-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E7CAA687C2
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Mar 2025 10:20:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 97CE7882A85
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Mar 2025 09:18:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DC4D3253B74;
	Wed, 19 Mar 2025 09:17:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="v0GRtoYq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D1B325334F
	for <linux-arm-msm@vger.kernel.org>; Wed, 19 Mar 2025 09:17:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742375876; cv=none; b=e9M+OlrdB44fBMvf3DGUg+n4ThgnakcjGsrDMDWxk5NbJ2/MHz/VKUWeuHUR2eujH1zWx2s01cX41KavrDrQ87a8/j5UHoD7v2ijcFz//cZUkfBVol/NfOfmBtoP8Q4/t+OVgcND+BlCxC5Lb0/mROaFZ50lSr7mvoFo1oGWQbg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742375876; c=relaxed/simple;
	bh=ULRWIRzW3ClVMbPCwKcuXk3yCqOKBA/uzUXVWNbco5U=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=iKLqlshMdsnZhg8ISYFVoipe4Rfm80Nm9uyKWNb2gtulrqMDZ2CDjBwLTNNjI7WeotWpYtRKgAzoL2SGJp7DaY5Z49mDnkpxs9pYiT2UA49t4yoTco0lhhyC2w82k0fUMlwvBhE4odOQs16pr6jdQScdR6WVONl11ANVUqeETHc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=v0GRtoYq; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-43cfba466b2so42973795e9.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 19 Mar 2025 02:17:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742375872; x=1742980672; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+ySdR3tj80pBDLvsU4QQMajiIPqzNIK+BJx1XMf8UJs=;
        b=v0GRtoYqQoO0WTUTIXqtbK/IeO4I9Wco8GvnRvjcB4nxyblIwdeAbaguhXo/Z+Lcv+
         p4dnXhZM8Ai5AZtPmOEzVMDSCEaK5uVvQMhtr+bWd5AqFgyf3PbhrxB73ufXBk1qiLKL
         roeEsLl7hlgtKM7ltpWdophjkSshDavruRqDif7dGE4ITQAKNBmSM7MkGvKOnwOY+amj
         qqmNgNIK6b0Ub82dz+8GghTxHeItl+xfLmpAwRVVTD66dkBjnJTvq+DaWAkWwX9XRdDg
         4DjeueOtZmW3RmAt/HjOBU+kYNmJPUnTLr9x2cYzErnXBwRDDIGiow2XIHsUPhbpjWGp
         lRoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742375872; x=1742980672;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+ySdR3tj80pBDLvsU4QQMajiIPqzNIK+BJx1XMf8UJs=;
        b=b0lliAJNYgxqVKtZT61YZ+RUm7GJR9RkWu1pnSxCecHLo6koKBse71Ql+GHLNlNAkd
         ravdJxSJ8BesBVgowTEpHZf43qkBE2AYx93Cr1uRkZB9qa4qC4U0VjaWOIx9NogYsLwv
         3aL60G0u65RNNIgXXzn/TanWvM1YLTIZtI1qCNyj0ONiusiGhJfKmVNZaNAmq/yDMCTb
         lp4dXbnDz4iSnEMKyhLWI/T3aLxkPFuH7puTyKhZQF7oqXpK0P/qlKRo4EDVtNw7jj+h
         e27O8TY7saUsxDBbX40nRl2ON3HWqECho3aN549TONPxCLVfwOlqyfw2M1q95WLR/aKv
         rPxA==
X-Forwarded-Encrypted: i=1; AJvYcCXWu008i1cTwhdjVPlcLWwoOQnPI0TbTfkJXv21Gn8tfXeAKsDpCJ2YbemeuAXIIPfpdb6lt/7XMHaxyg5Y@vger.kernel.org
X-Gm-Message-State: AOJu0Yyj8z2Io1noFaMDoGt7V739LEkcjAj19CVAhgMOOkjuMrqMMFyV
	qcQkIrwk5VLe/ZTk0ekmTNzDDyjYUoVsm394xxf3JDswZz5mUZn5vbtaJPh19WI=
X-Gm-Gg: ASbGnctrmCnJAaaRKOZ5IIUhUgFCpE5ooV+xATbASjEWd4RVC1kgzbuu1oE7NsyGixF
	dYZPcLGbwcYCIXnbhNdZd+xzZdVp27LutN6rGQDsIIhgpGMNxy1gspn1YLIOXTbhngHwHjzum44
	0HzmqS5TkAFwMmbC09SV8BTmCEtSOYHvKFQdPvc5lw2HcpImmh3xET7bBqJ7l/dn+oWGEuza5BK
	fB8mYuxs4pSwrc8gYyhsSs3WhAsRwizTkMF/awiP24KJDtqhE0KlwIXVFrs2S58XRCq6DLJPhYp
	5+ERElNW1IfS6hmONwheyy5X+66PA9yQdXPC9/imsC7OwX8KfczzZhr5k6AXhvcX1xJhMoZrNTu
	zhfon
X-Google-Smtp-Source: AGHT+IFGBgrP9XrQ3f2uafyicjPKMzKkkhYZU6En9bbVWfY5B2AqCcmoR4UU0JrQIUMOQW0ppC9i4g==
X-Received: by 2002:a5d:5f91:0:b0:390:ee34:228b with SMTP id ffacd0b85a97d-399739cbbd6mr1493601f8f.24.1742375872457;
        Wed, 19 Mar 2025 02:17:52 -0700 (PDT)
Received: from localhost.localdomain ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-395c82c255bsm20023810f8f.23.2025.03.19.02.17.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Mar 2025 02:17:51 -0700 (PDT)
From: srinivas.kandagatla@linaro.org
To: broonie@kernel.org,
	andersson@kernel.org
Cc: lgirdwood@gmail.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	konradybcio@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	dmitry.baryshkov@linaro.org,
	linux-sound@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	johan+linaro@kernel.org,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: [PATCH 2/3] ASoC: codecs: wcd938x: add support power on hp audio switch
Date: Wed, 19 Mar 2025 09:16:36 +0000
Message-Id: <20250319091637.4505-3-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250319091637.4505-1-srinivas.kandagatla@linaro.org>
References: <20250319091637.4505-1-srinivas.kandagatla@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>

On some platforms to minimise pop and click during switching between
CTIA and OMTP headset an additional HiFi Switch is used. Most common
case is that this switch is switched on by default, but on some
platforms this needs a regulator enable. Enable this regulator if
platform is setup with regulator.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 sound/soc/codecs/wcd938x.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/sound/soc/codecs/wcd938x.c b/sound/soc/codecs/wcd938x.c
index f2a4f3262bdb..a00845089e13 100644
--- a/sound/soc/codecs/wcd938x.c
+++ b/sound/soc/codecs/wcd938x.c
@@ -3267,6 +3267,13 @@ static int wcd938x_populate_dt_data(struct wcd938x_priv *wcd938x, struct device
 		return dev_err_probe(dev, PTR_ERR(wcd938x->us_euro_gpio),
 				     "us-euro swap Control GPIO not found\n");
 
+	ret = devm_regulator_get_enable_optional(dev, "vdd-hp-switch");
+	if (ret && ret != -ENODEV) {
+		if (ret != -EPROBE_DEFER)
+			dev_err(dev, "Couldn't retrieve/enable audio switch supply\n");
+		return ret;
+	}
+
 	cfg->swap_gnd_mic = wcd938x_swap_gnd_mic;
 
 	wcd938x->supplies[0].supply = "vdd-rxtx";
-- 
2.39.5


