Return-Path: <linux-arm-msm+bounces-22462-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B94C905885
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Jun 2024 18:21:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id BCA55B2C82E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Jun 2024 16:16:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7C0D8181B87;
	Wed, 12 Jun 2024 16:15:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="gfmGHWun"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 920AD181CFE
	for <linux-arm-msm@vger.kernel.org>; Wed, 12 Jun 2024 16:15:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718208952; cv=none; b=A+ECWe5ZOMAWfdVykQCmkJb9OXucW7JsozDNpYADM8snrmsloqOrCsFQ72PLOdYU+VfKDqKyFfOIgDfCBSxB9sTmZxmfm1uQFY7IMBW/AyPMeHUpCT1baXY32vRI9pO4lRquv8oZuzt5RyEMESqSy0jTn7U/sVKeSNYgtbtEnSo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718208952; c=relaxed/simple;
	bh=44SvPncKGed5222crY2QmWyS1bBJY6ITGdo0S3bUKlg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XrC2lCe1v9AuSNwZ1vgPlG3Ho9yBmwHMDzbkth+uSwD27pze4+idUmGRp4vPyDTJMowKY1cwwIQxMd4rbgRVvvCdTy6u83k5aRwmE70AKvu44+e0OEqOMhHeqzclS+ymiZUteGYTJMj76w8cR8bK38KBu3txYYexCltuA6EQhc8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=gfmGHWun; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-a6f21ff4e6dso9042266b.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 12 Jun 2024 09:15:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718208949; x=1718813749; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VmEnUku8lwCm6C2oNC52aCB1kZkiPbgX5VQWbXgPBbA=;
        b=gfmGHWunpe6UFSBIe2OUEZ7oL+YkwkoYfGRaf8IjyswjVMvSGKexiWFdXYK/s4yeL6
         1oBijMRVFnNVEc6EtYYbALavhCWjOMARFYihZkO7EHJTianivuNYmmBIL4sFzpS2qJhr
         tsViwxCQdEWhjwVUrB0iMHedwAQd+u5i7X274GdbbF9ZbC52o5ddGchEamwt7SS5LfDF
         evVVhS1joSZZFPZ6wB6GvHlqtXDYtYJsCWGObcwLEvpsq4l7plyfvm8OR9QetCQZ6My8
         gy1rhvDXgUXB2P6VpCmilHP3kJ2hV478OinFv0vLZYvkMs+/s9e1Yscd+QAiVd42rKRM
         DmYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718208949; x=1718813749;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VmEnUku8lwCm6C2oNC52aCB1kZkiPbgX5VQWbXgPBbA=;
        b=iV+YMDwVf9gp1YD300cwziMSM268gxr10ZJCGR11evtsiHsvhY0liSLGsON9u61BTf
         RnZS/iRrzEbf/x6Iy1uvrKLwMOAMVBrlCCqjxLDnvaVYGekcZJFFA5xcai43txYqjZTi
         GCZ6ObZgkgZydRfiJPSmZhDbOkuyFPrVo95L5RFWBzHO99n5mpeFbi0Ha/N5k0coFFrw
         PbpPJpVtaUaBIDypX1y31PfUu189IJLrr6BSOYknAfSZIu9n4MsBQyrYj/iTQHP1KUOL
         JHkybYepF5orU7da4EzLhGOEiFBC+HJr1A04ATS1bk3D+EOYZnJZETApsILQjCdFRpLi
         80iA==
X-Forwarded-Encrypted: i=1; AJvYcCVkhEVcIu+Ghvs6Sn3q4es9mrRq7Lq8jXKP7vp4ZjMeGLCRLXozB6SceM1BCA/oSnvdNYFi2T6gDQGeE43TOzB4eWVKQerLku8iYs7RRQ==
X-Gm-Message-State: AOJu0YxOMNh75TvmNIRZ3FfGjx+uLjweoPdv3O/FQFjNxNaDpsuWG7sS
	LL3MQCuq6YWqGNqKBiBt7JPTT3z4qs4+vuGZ4MlQ3kG/ORpZS0XXng5oJddyYC0=
X-Google-Smtp-Source: AGHT+IFoKaDJDYfIyho5GczSHSkqKxu7KN6zUTd+u7cNPd4fAXx5KP0876Uwls0hd/gjuxcHkQ/dtg==
X-Received: by 2002:a17:906:355b:b0:a6f:4e02:ce50 with SMTP id a640c23a62f3a-a6f4e0323c0mr68616866b.58.1718208948949;
        Wed, 12 Jun 2024 09:15:48 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.137])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a6efd6cfb74sm624815866b.20.2024.06.12.09.15.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Jun 2024 09:15:48 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Wed, 12 Jun 2024 18:15:18 +0200
Subject: [PATCH 05/23] ASoC: codecs: wcd9335: Drop unneeded error message
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240612-asoc-wcd9xxx-wide-cleanups-v1-5-0d15885b2a06@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=936;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=44SvPncKGed5222crY2QmWyS1bBJY6ITGdo0S3bUKlg=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmacmbvr1fmPfm/PMxuNcXIa5+ruSQV6ftFq3SU
 UD9sww97xuJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZmnJmwAKCRDBN2bmhouD
 14i2D/9ENklcp84Bwc6wDhkbkAIOZoKpswTywzAoWiMdry4iky0WUt0gd6WLJT/qv5r7Co4+EhR
 S7yKqdbaTpPQEDfHVshh/lcsePxUi0cfYWgPYOfybJkEslsGWveTrmpl/YGUIGtb+gh+TMu88EC
 r8rXn0ZwL3jAEywWS5sqQ61SK4jXB3fYA7Cuv97vBqqaY+r9Sp7i7N0ivMV+CM2jsZYrptOM0G6
 YcpxzGgBjLaDYRfQx/Bzts2ll7eDKNzMGPivjfX1sDZKly0HxVspivE2lyReNwyuSC5LIDEtDca
 swIpoFbqUa0LIBjwqix+fx+Qm7nmz5BfO7WnohsR41EgR6+G7UzAGqAMLaY2Wo1UwEcN3aRGFcU
 lhwtwDCj1Ft9NxY/D375Eam6tH+uylUnKq9azvGq31IpL3iM3+I7lz9AAdrVxUVKkEZIEbv4azv
 XvJE11BzRVWF7aEWJo7OB/d+3wMQ8KJKEVsWShZrwYA5BNFm/T64dgTH9Ivtz8TD0BoBlEJq1ax
 tVONbpPPUAu8eaRNmyXvSmroCSMi37CDSc/Eh+XVi6oFrLXwk16FrP9kXeCCEtFWVJbpY2IgOCo
 XVjQLRJMmWo97dJTc7RALr6tH6t3DQAWupxZDsUT5GH7oZX9ajL3ULkXGxFW1nRa8r83/mcsIBn
 FGM0S/aIAx0610w==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Error-level should not be used as debugging.  The code (function
wcd9335_get_dmic_clk_val()) will always be called with same parameters,
so this is not really useful debug anyway, so drop it.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 sound/soc/codecs/wcd9335.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/sound/soc/codecs/wcd9335.c b/sound/soc/codecs/wcd9335.c
index 334c5241617f..6a1376b3b98c 100644
--- a/sound/soc/codecs/wcd9335.c
+++ b/sound/soc/codecs/wcd9335.c
@@ -2849,10 +2849,6 @@ static u8 wcd9335_get_dmic_clk_val(struct snd_soc_component *component,
 	u32 div_factor;
 	u8 dmic_ctl_val;
 
-	dev_err(component->dev,
-		"%s: mclk_rate = %d, dmic_sample_rate = %d\n",
-		__func__, mclk_rate, dmic_clk_rate);
-
 	/* Default value to return in case of error */
 	if (mclk_rate == WCD9335_MCLK_CLK_9P6MHZ)
 		dmic_ctl_val = WCD9335_DMIC_CLK_DIV_2;

-- 
2.43.0


