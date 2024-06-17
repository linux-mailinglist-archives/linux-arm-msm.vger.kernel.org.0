Return-Path: <linux-arm-msm+bounces-22855-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 07A9A90AE96
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Jun 2024 15:04:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AF7091F28D75
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Jun 2024 13:04:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 17B5A198833;
	Mon, 17 Jun 2024 13:03:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="BKWu3JFM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DD4D197A6D
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Jun 2024 13:03:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718629419; cv=none; b=Eadsd/PJln31wFd9vnU1ZH9cdlz31TePLmfVXDPcNyIOTT/+Sj1abq5cDo3QyTSbfNvUr1P9GTVWhb8eFRL7Jp7OE4gkWGtRqkvmG7xGwNl6CJkBMax5C7u+5+KywutfP1C9ZaMpCRkYzLk9mL2Vl3P0dniohfdtiQP5h0sKO4I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718629419; c=relaxed/simple;
	bh=omsR+8Ap/pgl+yJ8epRiXzyiO4DMItCTdftfE6hvy4I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dDu6xBAt2JRrBIv6khZxQo18XUknGCRVJxf+wiI+Vm8hwPatdA3+KKZpmM1DbYBK8eHo7SXecRiEnPboBy15CpqESKh1QHEIcpzVPGzmpkGyQmjP4il7oAkx7KTaQSKcGScffwri7rUx7e7WpliDz9s+Gmd5iG7DGEBs/wr9IjQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=BKWu3JFM; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-57c75464e77so5196193a12.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 17 Jun 2024 06:03:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718629416; x=1719234216; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Lsy72X1hfcrIv1RUuI2dLQNfHKs4L1jXhq7QBcalSW0=;
        b=BKWu3JFMdM9c/HOoXbLZ1Rq90XMRZveQ3WAw4CNaPnT8EFm0pSEq3fxsr79ts26rGk
         lxSIVn3pWRCuvO/6B/Cbf5AFmnANPPPBxgYI5V6vpwl5qs3dLKJtBEsz2gVx6BmFNH6t
         12LCkP5V3gwUzTiZZc2v3C3x9bv1rrZwg1//Xo+RrdSaJXI03mvsm5B5HK2swc8PMMKs
         bBAZ845DMReeRLtrT1+CWZ0NFqZOjafSHVx/U5DgCS/ZLpl4UYTo+rccCXNiR1qmcA+N
         sUH6JISrr5vZKhJEqKtBnKx9zPaw7YC/PqBKGqbrQbLMA85zHYwldr8ywOq2ah2tOOj0
         H3Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718629416; x=1719234216;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Lsy72X1hfcrIv1RUuI2dLQNfHKs4L1jXhq7QBcalSW0=;
        b=JGK2zRwcOscc5zNks/HVqFNDgAL3joA6L76gO3vRf/HvbD0n2OtNvNuNYQwf4YBKHT
         FwbEoL4yp38COWFDeBeikwngVBwIrfm51ccaHevhMyxiBMOCJcTMmvZt0WMNuIO4Dfzh
         T5Jp3GwHA0UXbR4824Ql3Imk3Dp+Kc/ByKWGC5Yn86FPmytVU2oCz7Fa8otunkGeXVYa
         GGSKrucuLiq6vrpJ2vXLQoCuboeWG9BAhw0SCzxl7+nSH/GkR0OiTavAl6nAceW0yF+E
         llXW1Z12PEkPDYrSVslR449Seiv7w7/qUfIlMAkvQPBbBTa79VM6RKpoKr8zWmtP442p
         Avzw==
X-Forwarded-Encrypted: i=1; AJvYcCXfm2CGVtLQt68748lyJYgkEC2va96XHWq/E3mhy4FGF964ho6Kl7o/oH/7T9GnPP8zRhyJrMYXo6u9A0hpfOEM6Hh2qpdYQHlPW7CN1w==
X-Gm-Message-State: AOJu0YxU7UvSdXcAHPGUfsKo06yVuyL00oC/jqCkog1x9cw5ElrqL5le
	wvu87RMxN/N0hq0LI9jF1ojU5evR1rb5UpMkKXVksGocJGNTilYugJuRqap0QBk=
X-Google-Smtp-Source: AGHT+IEI2XIgoT75h7Br+R9UPixD8KUgoWs/OqjcRXJjfTldGZCA0rliZmucMT0rRgFW1nfE8SfbEA==
X-Received: by 2002:a50:8752:0:b0:57a:2309:c1e1 with SMTP id 4fb4d7f45d1cf-57cbd68ef64mr6670421a12.23.1718629416521;
        Mon, 17 Jun 2024 06:03:36 -0700 (PDT)
Received: from [127.0.1.1] ([78.10.207.147])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-57cb72daa67sm6404349a12.38.2024.06.17.06.03.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Jun 2024 06:03:35 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Mon, 17 Jun 2024 15:03:20 +0200
Subject: [PATCH 2/6] ASoC: Constify of_phandle_args in
 snd_soc_dai_link_component
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240617-n-asoc-const-auto-selectable-formats-v1-2-8004f346ee38@linaro.org>
References: <20240617-n-asoc-const-auto-selectable-formats-v1-0-8004f346ee38@linaro.org>
In-Reply-To: <20240617-n-asoc-const-auto-selectable-formats-v1-0-8004f346ee38@linaro.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, 
 Banajit Goswami <bgoswami@quicinc.com>, 
 Cezary Rojewski <cezary.rojewski@intel.com>, 
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>, 
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>, 
 Bard Liao <yung-chuan.liao@linux.intel.com>, 
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>, 
 Kai Vehmanen <kai.vehmanen@linux.intel.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 alsa-devel@alsa-project.org, linux-arm-msm@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=847;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=omsR+8Ap/pgl+yJ8epRiXzyiO4DMItCTdftfE6hvy4I=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmcDQgtgcSzA+EJVFaCjgKa6XsvslogGH3FKDhC
 x0BhuH7NruJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZnA0IAAKCRDBN2bmhouD
 1yXWD/4q/WLTFuKY8TnmWYhhWz7Agk+LgxO8M5bKRbWEfAq/vHP3RXcfUJqf/1pGw2mzaI0ma3A
 2SeA460FgsXpYCe8mtzVXyK7qom2vGauqQf6cr647nVRyswwjvmBvFJvbLG7gYIVqd7MR2LcaiD
 fT9Ij/FWEkgg/wx+dbkdfe3RBnUDBUovKVdmm0bCkaVVEcJ2xKEKHfgahiJsl5QfUKEZba8Py4m
 yq5h6sUqp0B9nHEeI3nqiXqrxfpEVwtLa36sLIaTiKxJr8fZD6IbJzdj0RLpfc5KjCUHUS10Gps
 W1DFDdVBgs4+cjPSFOFuWpdsjEqJPVUvdqUtfFVMN/BCKhAQh9tlzyfA1LEqUwMuoWbG2LtIb27
 nHBiek2zflKpj6HmIE/IUMiL+PU2mV84nXhC/na2XHsKBdgf4mw4H4jCIa6BgXhQRlF0S4Y7Itf
 A5G4krXG5u5oRiclhtF82cAVhHTfHWC/HIzxq/dSsEvTCxInYYJVNGbN/JUdCmZhP1M7k80k8j1
 d2+YBSxO6/Y91bX32KnysxmN+w3oWFByAMrZZt+SxY/e8yHeTNVouW9alwbGN/xXNQ+LS8bte9i
 23lUwC64C1+NkpIvn1+gzUGYGt5BWR9OoJZTiO1jqXU6r5B7c9qtxsLXCKgqL1Fok2Yg82EyV36
 ljUJn0yU1qclZiQ==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

ASoC core code does not modify contents of 'of_phandle_args' in 'struct
snd_soc_dai_link_component', so the pointer can be made as a pointer to
const.  This makes code safer, serves as clear annotation of core's
intentions and allows putting pointed structures in rodata (if ever
applicable).

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 include/sound/soc.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/sound/soc.h b/include/sound/soc.h
index 33671437ee89..f02a51694ab4 100644
--- a/include/sound/soc.h
+++ b/include/sound/soc.h
@@ -675,7 +675,7 @@ struct snd_soc_dai_link_component {
 	const char *name;
 	struct device_node *of_node;
 	const char *dai_name;
-	struct of_phandle_args *dai_args;
+	const struct of_phandle_args *dai_args;
 };
 
 /*

-- 
2.43.0


