Return-Path: <linux-arm-msm+bounces-22466-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A70A9905859
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Jun 2024 18:17:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 27FF91F21D37
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Jun 2024 16:17:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B1B441836C7;
	Wed, 12 Jun 2024 16:15:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Wt1pOzzM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 571CE1822F6
	for <linux-arm-msm@vger.kernel.org>; Wed, 12 Jun 2024 16:15:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718208957; cv=none; b=TChR2OqIiQ0U8tgOo+Esv5Vh/gz7rRpIllZanlPvxysl/EUdvuV9hmuCZKsGUNzvf1rQtF0O4SxPlK04efLW+CqgPlEbT7T/WR7JEqS57zboh5op5ogDATYaHgmSo0kvRVzTj7K3gRNur/l6I6Vg8UxSiOIN0csIKeb2ttUvjXI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718208957; c=relaxed/simple;
	bh=g2xHVarXvyCS+YBEFCdlIQ1R2j746Vst49InZdmOz3I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SpvQM2huM74LzUdS5ziONmEk8d/IV5VHrv3FfcgyL3bBRvHSdnl+lx3yvwRWCShjujgSEI3OyTrLAEd+6PNWVU8RVuQr259cK3w+kGTrco8QOHQVjM1zBahu2hV5Nl2WTkSyy773yGQkkk2Gdriv9SaR1F7XMDD8MdypC49yEx8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Wt1pOzzM; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-a68b41ef3f6so9003266b.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 12 Jun 2024 09:15:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718208953; x=1718813753; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=T8VimLKvT4ABsxFxevhxxNfg0qw4/IiIcQHT7uX7SMs=;
        b=Wt1pOzzM9gCxRC1biG7CNd9S/fjctZNnvTXHaqFZYpKwqLP/BbHNcbEFOdKT8OTYKG
         qpqm9Xx2kEf86NSjYKv8ThvakGvaHvySrOwZXATtPnybzgj+lgQhkOUnFtam6VEHkW0U
         9mc6CpPA+Xm3TH6v3VT9+PpDxQQO1EMf3D+35ZvZ7J6wfz5PLZMzTRtBdoIrstgVkodQ
         FM9UjTqPK2L9UOkZFwAH6TDZH9vlF7JS7ngHh5p4pEAo3oT6aoaWxIpOr8uDTjHAH1Kk
         Eainc76+AIRmaAHy0n/ls5nPNjps+LXDa/M5bSQM+vrJIuwrPP8F4XQmB0zogQfdMEiN
         bmZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718208953; x=1718813753;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=T8VimLKvT4ABsxFxevhxxNfg0qw4/IiIcQHT7uX7SMs=;
        b=b0DuIEc5uO4ij9SN6y63n7AIAoibggucmCTK+cTmiodLSr+39/fLxgi498Cg/rpfqZ
         8NoyON+/bnIsPh74q/prso5dagO8dSMrWPe2ljKbYkFHMUDkWAez4IOE6iJV7dn+Lz1L
         cRPz1767Y/OXbosRw+A4DViyjX9zMknqYE+1OgeYpBhv1GyNx4KBRsxPybdgd2+HXt/q
         QXyPccXCuHOJlVlnXpD7cRAc4kZ1T6y/US6ew1QNQ07Oo+CtM5btJydSO+eBCU6d8srx
         wHIVh/vcKi390Ggyfkgt+RKsxE6L4YegmfOBHemwGYQ1cCTkbz4d66PghIzVfzbMIlmG
         c3jg==
X-Forwarded-Encrypted: i=1; AJvYcCW+VLY92qWH7FJVc9YkSOKBluLhyxIsQJiJBhGJSQonAVK8i/CiDxoJPSwWhWGBTprzR+F+ib60wmTh8ZfezPFXqgbNRKNJB5bL/ZQ4RA==
X-Gm-Message-State: AOJu0Yx6e1coPiqUFCKbqh9a7E1wr1SvUJNTOsjNDME+2CpK105u1fAy
	Tta9vRyV8WHTmaRC3QFV74TITV/PcmRnROpH9UhegBlGigqO3fBB1kEffdWwQKg=
X-Google-Smtp-Source: AGHT+IGTfvvCQj+ZNaFMkZ6wx7TiN7Ii9ExBRfK9lmhqZIRybLOb+747kCSXpsZax+KK21ylmXhTPA==
X-Received: by 2002:a17:906:a20a:b0:a6f:16c4:a5c4 with SMTP id a640c23a62f3a-a6f47d52367mr134173866b.20.1718208952754;
        Wed, 12 Jun 2024 09:15:52 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.137])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a6efd6cfb74sm624815866b.20.2024.06.12.09.15.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Jun 2024 09:15:52 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Wed, 12 Jun 2024 18:15:21 +0200
Subject: [PATCH 08/23] ASoC: codecs: wcd934x: Constify static data
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240612-asoc-wcd9xxx-wide-cleanups-v1-8-0d15885b2a06@linaro.org>
References: <20240612-asoc-wcd9xxx-wide-cleanups-v1-0-0d15885b2a06@linaro.org>
In-Reply-To: <20240612-asoc-wcd9xxx-wide-cleanups-v1-0-0d15885b2a06@linaro.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, 
 Banajit Goswami <bgoswami@quicinc.com>, Liam Girdwood <lgirdwood@gmail.com>, 
 Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>
Cc: alsa-devel@alsa-project.org, linux-arm-msm@vger.kernel.org, 
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1584;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=g2xHVarXvyCS+YBEFCdlIQ1R2j746Vst49InZdmOz3I=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmacmeSFE+f/zsNCHQgFuBYKnXqNHmd/j2SQ58e
 6jiG2sco7GJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZmnJngAKCRDBN2bmhouD
 1yzcD/4yxf5LOsAQ3mrol2YYLGKoGQIRXfK3WfZuxOS/lBU0ucumfmz1z+oqUzYIqmccjQeKaXq
 NlGKJmaMY04RD+gyEGukOUDwSNI0d77Pf6bkVyzNe5924vuhazpCb58XhPOaAclJM0M6L2qwXXh
 7aLnQeNr4LC1yEyXxV4hVfxFyJHgRi8utspCKZKvtfhnwfm0xfURtYHoIg934GdiVpmbA/efN01
 zlWiGLeJcUr8tuFrykdDTP26XZVJaugMn9TjdcW2u2fHOnjX8SE2HlkckuvGFaTLFzw/N3/m9cw
 P3ClaU3RhJX58wtvJBETIVAYFeQgN++2cs9JQzQkTZovfsIeDNXWWWu6o3jDJj3IC6wxWpqE8nO
 yzuKEO65UNfyzwaV54XBGJu5lE37s4OsHPTbpwgYg7p0pRAAKhEdMnzTvB6Jr+qrF4Me8JQ903f
 wPrmt5RRRd04oMegWBw11QtzQVD0fmkQ3+9bntUc8pSnD/r6pKf5NJ1/TtJlNF7Nuh3VtUWyjXV
 o71thRJ5S/EcXAFiXbBCN58Q/re7UFQ5l/XRnQsvOIPO+bXA4bscNaiFerHEeBVYO7Q226iBweK
 soCp0AordfiLwFZ/Uh27/z7SZ3hFY5Z/EAMbunvdFmPkp9gciDgVreTzA6ihJR96wDL+i7JGQYD
 xzK1fG79wxsrJow==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Driver does not modify few static data (arrays with sample rates, MBHC
reg fields, regmap config), so make them const for code safety.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 sound/soc/codecs/wcd934x.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/sound/soc/codecs/wcd934x.c b/sound/soc/codecs/wcd934x.c
index cdb68f34e55a..7885aa423886 100644
--- a/sound/soc/codecs/wcd934x.c
+++ b/sound/soc/codecs/wcd934x.c
@@ -480,7 +480,7 @@ struct interp_sample_rate {
 	int rate_val;
 };
 
-static struct interp_sample_rate sr_val_tbl[] = {
+static const struct interp_sample_rate sr_val_tbl[] = {
 	{8000, 0x0},
 	{16000, 0x1},
 	{32000, 0x3},
@@ -522,7 +522,7 @@ static const struct regmap_range_cfg wcd934x_ifc_ranges[] = {
 	},
 };
 
-static struct regmap_config wcd934x_ifc_regmap_config = {
+static const struct regmap_config wcd934x_ifc_regmap_config = {
 	.reg_bits = 16,
 	.val_bits = 8,
 	.max_register = 0xffff,
@@ -1212,7 +1212,7 @@ static const struct soc_enum cdc_if_tx13_mux_enum =
 	SOC_ENUM_SINGLE(WCD934X_DATA_HUB_SB_TX13_INP_CFG, 0,
 			ARRAY_SIZE(cdc_if_tx13_mux_text), cdc_if_tx13_mux_text);
 
-static struct wcd_mbhc_field wcd_mbhc_fields[WCD_MBHC_REG_FUNC_MAX] = {
+static const struct wcd_mbhc_field wcd_mbhc_fields[WCD_MBHC_REG_FUNC_MAX] = {
 	WCD_MBHC_FIELD(WCD_MBHC_L_DET_EN, WCD934X_ANA_MBHC_MECH, 0x80),
 	WCD_MBHC_FIELD(WCD_MBHC_GND_DET_EN, WCD934X_ANA_MBHC_MECH, 0x40),
 	WCD_MBHC_FIELD(WCD_MBHC_MECH_DETECTION_TYPE, WCD934X_ANA_MBHC_MECH, 0x20),

-- 
2.43.0


