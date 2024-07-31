Return-Path: <linux-arm-msm+bounces-27550-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F713943333
	for <lists+linux-arm-msm@lfdr.de>; Wed, 31 Jul 2024 17:26:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1939C286EC6
	for <lists+linux-arm-msm@lfdr.de>; Wed, 31 Jul 2024 15:26:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 780141BC080;
	Wed, 31 Jul 2024 15:26:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fBRTP5Df"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C11861BC065;
	Wed, 31 Jul 2024 15:26:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722439569; cv=none; b=YawJGUNFt3ZQZcK8WkIXCAc5ZRwRwhFxNMv+ANdhbyeHarvyDMivFTcdzLeE0fApLQBrEVttYHDcsd/Knccma0N8pIy+q6qxAhmZrCuLt2IQUsnm+6a51npsSQhmwUj1Wk6myLSw1EAs1msRJN7jyVr4MrWZ9iV6AlsvSmI4JiQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722439569; c=relaxed/simple;
	bh=EVyv4o1kWKU9C0RpwE8ZBKEBCpkeLQtTeetB5bkp+NI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=U4iPdVJGf9a++qJxAJPaaW+AM0/iwcz3NuQUU610pS6uGnjbV4H42bpNPSzX0x6zpcF56aGpY2VkkoUWLHbbnJcVWJHlsNe+ZUx3kqCiZox97F5v1tCBswdynLOdshRn94x0IpeknG6Pu0g7dNZhWSkFn2GmRWu/NwGVgWVlyl0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fBRTP5Df; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-428178fc07eso35450665e9.3;
        Wed, 31 Jul 2024 08:26:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722439566; x=1723044366; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=X/h0VtcfMml9IUjMbcpLtg90CxFRBSo+axnBjZNg8dc=;
        b=fBRTP5Df36oUd3k/V6ANAQISkBPqbRPTF93XaDD2Kzm3N7l3T0bRXAovlgA1DzIGRb
         7p5AE1B9DmLw+9ZGAP5SkXN1ZVMHnV37MUd+eei9OLsuxz2d7KA9a2k/INPTWCVKkvmZ
         XtgEISflJL0X29xymO1hb9NptIwULS7CVh0S0WA5CqwKmHLaBeQEb6TMX9F9x81b2STF
         i47kslhrFq5+6H8HhWlIlTNcv9ZWGCIKbrFa3Ey2gI9/EPLNy/PchEwSfUYUGGiHneu2
         pXqYfhridPADriso/ZwJo/P0WZ74I9IRPUuWkx5Ka713qqabwnKSupk2wFmgnt7/94NR
         18XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722439566; x=1723044366;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=X/h0VtcfMml9IUjMbcpLtg90CxFRBSo+axnBjZNg8dc=;
        b=frqsnoKHYbNeHNB5LuwCMXB3vyppbKZ9iZF12SWeVS17RkX6ZHdt7V5jET9bbiNp81
         tuY/LWhHeNd3IsHSsG5Ij3ZqTvmqwlA4P0iQZySggiBVyPPnPfQToIYAcR9VbAtFApjF
         tyn3OfzW90uvB8J3VrFTcyg9Aq0G7p6w33+yq8fiZNLvNUpXTfRuXmmL6peoMULYrfuc
         r9tQrlpot41cH0uojOOlhdXRcQXpur2qessQI7awVRO2WuE4Af/i/N7wsmSeuxMv8Nj3
         loz1qEPwY6XeIEERJ6DWR372pCbGAHjbfEk1jAOD6cBCHwI3ONVOJpsUOMDbiBa3zx4V
         4IQg==
X-Forwarded-Encrypted: i=1; AJvYcCV/qyoUp8stpoLZAslIrpLAvZtIBTiZasrQbkpvvs3rA8hG6P0dAoeOlcNhf5eLkaeVoo+wEA8Bjyi6iEsaGCS6cW2SKauoB7hg3xMUZIDhhY/XcKtIvH7DGaEpqWsE1/sp8QLgbZXKagh9abEJPYqBVF3bZ/+epZvkW7l9sb/MgcuqxsjeT7JkLaPM6jyhzET4cSjtAda+lCfO8C4jP1YR9zDiAw==
X-Gm-Message-State: AOJu0Yy+kPjX+UeGB4xYibO27YYDXOEZVOiLrvpy7sQgBzPMHDbBZ+s1
	/drTGkCv0UK7xGCLDPgyYRrp+twaGg+o0AAyeXxQOJVJmXv+3esu
X-Google-Smtp-Source: AGHT+IFaIxFIYcq+H0ksfzt6nQVNfYnsBfjPxrNT5e1tHpK2RZqBXDqp7VIHxXKG3HBqlL+UiNXlFQ==
X-Received: by 2002:a05:600c:996:b0:426:59ad:bbb3 with SMTP id 5b1f17b1804b1-42811dfc5f7mr123868005e9.32.1722439565757;
        Wed, 31 Jul 2024 08:26:05 -0700 (PDT)
Received: from [127.0.1.1] (byv161.neoplus.adsl.tpnet.pl. [83.30.41.161])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4282bb64755sm25430985e9.36.2024.07.31.08.26.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 Jul 2024 08:26:05 -0700 (PDT)
From: Adam Skladowski <a39.skl@gmail.com>
Date: Wed, 31 Jul 2024 17:25:26 +0200
Subject: [PATCH v3 2/8] ASoC: dt-bindings: pm8916-wcd-analog-codec:
 Document pm8950/pm8953
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240731-msm8953-msm8976-asoc-v3-2-163f23c3a28d@gmail.com>
References: <20240731-msm8953-msm8976-asoc-v3-0-163f23c3a28d@gmail.com>
In-Reply-To: <20240731-msm8953-msm8976-asoc-v3-0-163f23c3a28d@gmail.com>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, 
 Banajit Goswami <bgoswami@quicinc.com>, Liam Girdwood <lgirdwood@gmail.com>, 
 Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
 Stephan Gerhold <stephan@gerhold.net>
Cc: alsa-devel@alsa-project.org, linux-arm-msm@vger.kernel.org, 
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Adam Skladowski <a39.skl@gmail.com>
X-Mailer: b4 0.14.0

Document pm8950 and pm8953 analog audio codecs.

Signed-off-by: Adam Skladowski <a39.skl@gmail.com>
---
 .../devicetree/bindings/sound/qcom,pm8916-wcd-analog-codec.yaml     | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/sound/qcom,pm8916-wcd-analog-codec.yaml b/Documentation/devicetree/bindings/sound/qcom,pm8916-wcd-analog-codec.yaml
index 94e7a1860977..8af8bb747abe 100644
--- a/Documentation/devicetree/bindings/sound/qcom,pm8916-wcd-analog-codec.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,pm8916-wcd-analog-codec.yaml
@@ -14,8 +14,10 @@ description:
 
 properties:
   compatible:
-    const: qcom,pm8916-wcd-analog-codec
-
+    enum:
+      - qcom,pm8916-wcd-analog-codec
+      - qcom,pm8950-wcd-analog-codec
+      - qcom,pm8953-wcd-analog-codec
   reg:
     maxItems: 1
 

-- 
2.45.2


