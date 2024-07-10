Return-Path: <linux-arm-msm+bounces-25852-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CC6FD92D370
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jul 2024 15:53:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 83159284E97
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jul 2024 13:53:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2B7FF194131;
	Wed, 10 Jul 2024 13:52:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="o/x69AqZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C6CF193472
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jul 2024 13:52:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720619569; cv=none; b=YxtcCwNZm059gAxjad5OU8RLSiwS5u1jkucbDv3GGpUVG+gIfc/FyBlmJbcQ13/dok9iED66ZXdocF0Sg9bUzdOvRxBoaq///udCslF+QEJoVtcqWcHtVCIbIITE4iuLFFNUgrKby0JI5D8RI0Wnotgh0ciynuvaYas6bJB7WPc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720619569; c=relaxed/simple;
	bh=jEk16JQFT0IAvURH2BypgqgsTIx/BJn3KXaiR2tgfp4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QRkVI4Ir7hi3bk3xtQAQZrEkMUih+UNEz7dkILq7ZnSCvznbYbxRSTRiibvgZUdPhMKMPnpFrepf7XUv7pbXAIanlGSj5M1qctFSy8LHU67KRE4KZxSy58K/Fv5NJO4jcDBVbrq9YG9BCrJpn+dhMfB7mnHfZ/iptlMz43zTzhY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=o/x69AqZ; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-57cf8880f95so8352064a12.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jul 2024 06:52:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1720619565; x=1721224365; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=slbrxxj5rb9E58CEYCsM+P7UiVj11eTUBnO9G+P7KZc=;
        b=o/x69AqZJF19Xv2lLRmgsxJS/bXSTIBWJh3ABqIXe0c+gBrUC27NGxvi038yPgCvXn
         O8jjWZrDdTIEeMl/VC3RMUi41V5buJxez2leZ9b1eS13qeWsd2TOH3CS+ARzeRX0HtPp
         gIfMVA2MqWbx+yGJJcLBBYdReyevjyLkuFB5E7c9Nn6Ye3x4e9R+uhwhVPYX39mZWfa7
         2zm8gn9smbOHtqfLFsQOkBH1YI2v7Oh/fz6uRu00XXaZaRypbE7Wrdrm1ND2LAIcmFw9
         PEzYk+LmgKzJxe/0S2KfLC+YhsCCDWF794hf/+H5oF1AfIvQjNkZKVp9ZSO5JttVYPxD
         StfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720619565; x=1721224365;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=slbrxxj5rb9E58CEYCsM+P7UiVj11eTUBnO9G+P7KZc=;
        b=fnIDTHzrr6eVCKhYYm9zJusMCF8p8dZuQL/meJTLZ5hKQ2LzQvCBpI0nkiM5U+hCUp
         bDeHrP/rOkrlLfuVpcfp2md1l59QRMBLlv7Sf4SGb7D6ZLuiqvsUeVpqQCzux0oCSatR
         vNKJHdRp9lP3hNWR9xU9mYRzPh7NmwHDgbQue3id3g9Kest6juEO1IQCYTTQ2Zlr9evD
         tFMFKrAeYxHdenhI0Sclcmeun+ty+j4aYQmwzqU0ichDXzcY19cZwca1d4B+4ke2HR+Z
         13443YCH7B8hYq9u2opZrWHg1AYdv8LvMCTjKFvKWJJczawkP+ZoYl7SujzRScSQ9GU/
         yaXA==
X-Forwarded-Encrypted: i=1; AJvYcCXY1FY5hRmXyenJI7xs9uOLKc7ZQhOHBstkoQ9nRCYavyAndeT+fGACMeHeVq0TXE8prRAbj+RO3p+AfEhbSbe3/mG2ANxTBJx8dGPA3w==
X-Gm-Message-State: AOJu0YyOE0kGTI0v/JCn/P2RKQNd8tLa+MK0tPcuKwQbWChRthAFjPjj
	mnpjjUK6J8B3R1pLF9pA+J80mNjLR54Rbl7exewt4OnoQvDcougK40AKQE9nNaSRscEvJIdQF7O
	M
X-Google-Smtp-Source: AGHT+IEKMN2BAmzuOkKYboabNS9K1iF67rmPiNfGv71WggM/iASILIt6zY8AU4pXkJL1/oEkdkd06A==
X-Received: by 2002:a17:906:f592:b0:a77:cf9d:f495 with SMTP id a640c23a62f3a-a780b7010a0mr599191166b.40.1720619565419;
        Wed, 10 Jul 2024 06:52:45 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.137])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a780a8551afsm160440366b.166.2024.07.10.06.52.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jul 2024 06:52:44 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Wed, 10 Jul 2024 15:52:32 +0200
Subject: [PATCH 3/4] ASoC: codecs: wsa883x: Simplify handling
 variant/version
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240710-asoc-wsa88xx-version-v1-3-f1c54966ccde@linaro.org>
References: <20240710-asoc-wsa88xx-version-v1-0-f1c54966ccde@linaro.org>
In-Reply-To: <20240710-asoc-wsa88xx-version-v1-0-f1c54966ccde@linaro.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, 
 Banajit Goswami <bgoswami@quicinc.com>, Liam Girdwood <lgirdwood@gmail.com>, 
 Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>
Cc: alsa-devel@alsa-project.org, linux-arm-msm@vger.kernel.org, 
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2199;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=jEk16JQFT0IAvURH2BypgqgsTIx/BJn3KXaiR2tgfp4=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmjpIlOgCYWfv4QovLUr9t2eeUmCY7lvvKDS73A
 VovMzO7Si2JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZo6SJQAKCRDBN2bmhouD
 19O3EACDQ8/ZgiJhxAwvdrYT9Y2yfZkcfzRJ2uk1DlBttj+8mn4kHwjx/iLc7H/P5lTj30Wu8NT
 Kaey6f2Q0xWYAxn+yx/nDwJwtY2ZKb5xmdf4Hko7bSsXDDL3VJRpV5kg6whjscNB8jmd1uraTVA
 cbdnHVXfICieiv+Ixsykpx94arFN5WsaAAynMv6hNwv3HT7d19ZUFFrqPnndTX0TAa2f/sWzbaF
 Dp/dsk/oUufHNz/X+C1PkKIQNCNMDkNmBqL8mUrymEHcb5BrFaSvYIIAdyNFt0FBOIizc0L+xE0
 U7dLgJnJifAz+vhqPJCHBWM/DCmTQue7ezM/P78hHj92oGcNidqlM7RGMhc+pJQ69/6wS3JMk9K
 2tamTHAsZ/JGa4bWBfqJ3eWf0atekroeY5xmfkfIyCNCORkgFCPhbnhntCjVgAox8ZB1beblCzQ
 Z7cZC4o2WvAOzROymQz3GrgLpB4NuO4I9vwIKVgwjGxXSuS9N94fsWZtJRI3F1PP5VKjsyrDmWv
 apyqKSVAyseJP+HqRHWIlWFioigECh8ZvnR2jXmiYRzF9tI5Mac0UC70pW/lV+JTL88+QA+wtbg
 5FQf5ARkfSONAFlt/QW91s+MqPui5LEFFoqLiQRVwIXITx+7FhFgPQXqR27WJxmumNXZR2of/Uv
 7zTxJXk/P9DlhKQ==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Driver does not use detected variant/version variables past the init
function, so do not store them in the state container structure.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 sound/soc/codecs/wsa883x.c | 17 +++++++----------
 1 file changed, 7 insertions(+), 10 deletions(-)

diff --git a/sound/soc/codecs/wsa883x.c b/sound/soc/codecs/wsa883x.c
index 60b78560f4b7..0692bc39308f 100644
--- a/sound/soc/codecs/wsa883x.c
+++ b/sound/soc/codecs/wsa883x.c
@@ -438,8 +438,6 @@ struct wsa883x_priv {
 	struct gpio_desc *sd_n;
 	bool port_prepared[WSA883X_MAX_SWR_PORTS];
 	bool port_enable[WSA883X_MAX_SWR_PORTS];
-	int version;
-	int variant;
 	int active_ports;
 	int dev_mode;
 	int comp_offset;
@@ -1005,29 +1003,28 @@ static int wsa883x_init(struct wsa883x_priv *wsa883x)
 	ret = regmap_read(regmap, WSA883X_OTP_REG_0, &variant);
 	if (ret)
 		return ret;
-	wsa883x->variant = variant & WSA883X_ID_MASK;
+	variant = variant & WSA883X_ID_MASK;
 
 	ret = regmap_read(regmap, WSA883X_CHIP_ID0, &version);
 	if (ret)
 		return ret;
-	wsa883x->version = version;
 
-	switch (wsa883x->variant) {
+	switch (variant) {
 	case WSA8830:
 		dev_info(wsa883x->dev, "WSA883X Version 1_%d, Variant: WSA8830\n",
-			 wsa883x->version);
+			 version);
 		break;
 	case WSA8835:
 		dev_info(wsa883x->dev, "WSA883X Version 1_%d, Variant: WSA8835\n",
-			 wsa883x->version);
+			 version);
 		break;
 	case WSA8832:
 		dev_info(wsa883x->dev, "WSA883X Version 1_%d, Variant: WSA8832\n",
-			 wsa883x->version);
+			 version);
 		break;
 	case WSA8835_V2:
 		dev_info(wsa883x->dev, "WSA883X Version 1_%d, Variant: WSA8835_V2\n",
-			 wsa883x->version);
+			 version);
 		break;
 	default:
 		break;
@@ -1038,7 +1035,7 @@ static int wsa883x_init(struct wsa883x_priv *wsa883x)
 	/* Initial settings */
 	regmap_multi_reg_write(regmap, reg_init, ARRAY_SIZE(reg_init));
 
-	if (wsa883x->variant == WSA8830 || wsa883x->variant == WSA8832) {
+	if (variant == WSA8830 || variant == WSA8832) {
 		wsa883x->comp_offset = COMP_OFFSET3;
 		regmap_update_bits(regmap, WSA883X_DRE_CTL_0,
 				   WSA883X_DRE_OFFSET_MASK,

-- 
2.43.0


