Return-Path: <linux-arm-msm+bounces-53316-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D768A7D030
	for <lists+linux-arm-msm@lfdr.de>; Sun,  6 Apr 2025 22:17:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7ADE23AFA2E
	for <lists+linux-arm-msm@lfdr.de>; Sun,  6 Apr 2025 20:17:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D908218EB8;
	Sun,  6 Apr 2025 20:17:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="mz6G8dP1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5BB41C4A20
	for <linux-arm-msm@vger.kernel.org>; Sun,  6 Apr 2025 20:16:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743970620; cv=none; b=RaL4gN5KC0Wo+dT/3iYkqhUjAPCqa6Ypu1cw9CBxroBMOxTgkZOP2hgvEqgh72qJp4+Yy0qXUkg85DLh1sgIVvS25Uxs1K3w7lqw87nekZ3lrl/mXAzZMQHngFdGRQog0A2kkUTJVmIgCcaMTbwVcfYTrw463cVDhZgVE64nRIA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743970620; c=relaxed/simple;
	bh=Kaj9yPMcEEiMDLRcwdbnZDC+/5p/KQ6EFeBalyk7a+o=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QNHdtS4ESlm1wmKADnJ1Qto0cPa1QTbq10yObZDxlw7XFj/SpRLIKm/8Lgml74XTZVSDapLLWe3eeXVb+1t4FP2v3S7XIFLXFQKH3Or0TzvR5KgwAMTe04wcjXDPRGB3IHK3QCZ+2wPfeQljVGXB8bzoEZqrYvs6XnDbgfzvOR4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=mz6G8dP1; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-39c2688e2bbso471232f8f.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 06 Apr 2025 13:16:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743970616; x=1744575416; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=A5+V4XWX6ik8XXfemjH2aaHsT36827BDWO1+WiESIVs=;
        b=mz6G8dP1NLkSP9Lrq8k0yQDAHvAtX2hZZAIdcw9iwDPlaJgs2PU2qwfJk5CGc4OsGT
         JQFI20lZYHQ0pq3ShJzEo0cN8yJCoM19Tne4XkEflI4VZjCy3frWbPJ/zePiXfAQtC4/
         cwfH5mVYbHvlnhf/VOSMzaSARVLiK5ykccyXztkhMGyg1NnMisAxWdPz8fKqEu2kUfRI
         i19Bx2PxF9JOheK70ocX6wujomypFwzgbnYskt/BUiv7Y0USTfYC1PYCTFQQ7HYKwY7m
         NZwrKXAxZG7B/eB4cgZgIsIwNr/r4PJywTfEJ3tz+1G8sb9+MLACM57Oqpe9Xx78iTqt
         3LWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743970616; x=1744575416;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=A5+V4XWX6ik8XXfemjH2aaHsT36827BDWO1+WiESIVs=;
        b=swMhjW58GKsqRRCoYdjC/pSdM7tCDp5xr8w4K74dzAya3CmWkQz6V67nZDDXcUT8wK
         rodpBWUIT5xqyiGWQRTtPQvPALcuD/f8lDot9BusJBBculqhaBKfZb5Cr416Uk5kgdPX
         ZsgL1epANhqNIp4+JpbtyoK6DFurxHYhvfCH7FrmmtP00p8WWz5KYnfHW7ugCtmRolCr
         /CccLKP894SnM/dAON2OxHquvh08+4u9E7C7v+B+aBBL+jdoOk5v2MDWB503NpX44TnS
         8vnM/6T+VCuRsKK++a9JU0GKWr1C8y4bFymKbNgd5xaQtg3cGjjWZKJEZOmQYKV/+hOH
         JQIg==
X-Forwarded-Encrypted: i=1; AJvYcCWLpvkZDVL14PUuiv9hpHMyKhl7u8p+AiirdcVnQfggu7/JsJUheSL/ziOAJcaedTBA4V1RcYmPcw/xp6vP@vger.kernel.org
X-Gm-Message-State: AOJu0YzRTg35MLQ8IRpnohNKXtL65gQW511okNZQDQitfSpUjuaHXeu6
	1/t4UjnceYEVSzKBnR4R/7PrjKxOxqFh31YgfoWtLiNOkBenpNEg1cPDoEfBwJ4=
X-Gm-Gg: ASbGncu0hQI+gacsGmhTxV9Mjm3c+YjMtZT+eUNNS+XQkcQmNsH2sdn4SuEKmtY2C/b
	l7+PhIBQ7nHSu/odcF5NaFxipoypcfAUsbLimqi5Js5wAVsvmMMTFIJfJX94KB7I9CYm1wOFSCm
	sizzipDHtQ7z6wHjeKWdoIDIORnSviT2g04CSzYmdsZdruqSbSjb00LYJJ/aGToc4w1fqhEKENl
	u3BTmzyBI0i/yDQJl7+qWuzM+snR7wNFoaORVe9CSpftraV8Y4V53Hx+lXgFMVdeHA0hy6hAhjv
	UFe6T8FvC4xqcPmJo/ENg0b/RyhdKKQpFfY+5f49N4KWJZDnx/K74Xgm0gvKapWC0I5Z86slAQ=
	=
X-Google-Smtp-Source: AGHT+IG3SkOB5mChKZuFqVQaiw1v/CrzGtpVH+xjt2NBrQMfv21qD2ytHbccZQ37eVeGOpP1nkljCw==
X-Received: by 2002:a5d:588b:0:b0:39c:12ce:1046 with SMTP id ffacd0b85a97d-39cb35a2333mr3406474f8f.6.1743970615907;
        Sun, 06 Apr 2025 13:16:55 -0700 (PDT)
Received: from [192.168.1.26] ([178.197.198.86])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c3020d68esm10295521f8f.67.2025.04.06.13.16.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Apr 2025 13:16:55 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Sun, 06 Apr 2025 22:16:41 +0200
Subject: [PATCH 3/4] extcon: fsa9480: Fix wakeup source leaks on device
 unbind
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250406-device-wakeup-leak-extcon-v1-3-8873eca57465@linaro.org>
References: <20250406-device-wakeup-leak-extcon-v1-0-8873eca57465@linaro.org>
In-Reply-To: <20250406-device-wakeup-leak-extcon-v1-0-8873eca57465@linaro.org>
To: MyungJoo Ham <myungjoo.ham@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, Hans de Goede <hdegoede@redhat.com>, 
 Chen-Yu Tsai <wens@csie.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=741;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=Kaj9yPMcEEiMDLRcwdbnZDC+/5p/KQ6EFeBalyk7a+o=;
 b=kA0DAAoBwTdm5oaLg9cByyZiAGfy4S7IMNz2a70TDXFdUMTmD6CqBec6xXO7TJbYaLKg5+ec6
 okCMwQAAQoAHRYhBN3SYig9ERsjO264qME3ZuaGi4PXBQJn8uEuAAoJEME3ZuaGi4PXk4gQAJaC
 zS86EVrLWr114yL1IUjuj6d0KWG4ibRfEpWO4DG2xmikymthVVvYTl4BDhjLSw93DqSaWx/udWz
 RR6cr9eVIh9dPEb4dx7Zw+flUt5Z9XHnhjvIUnKgKoCOXvnPQuZBpM9DvDjAb66PCA2iU6+7M5X
 5VUEX6FQ8CnB5JP2F43n+VaBnpbGod1uTLdjjSb2RrIzHtZDsdhrYmxg450HJifQXnmcBtLeXYS
 2Tv/adlP0FuHMhhaF9C6vAD7yrGgoUtkiPhc+xrGA8gdhVbmRuFSkhj2S4ymnaofWd0XNIDVOwv
 bSaexrvTexY0giHjbBQkjw5O5nVv4m1y7Cjyd2PEwHiKTToCOKWmtYwO5dbm6zzTQ2n+20bQ3ly
 rwxqvN8LENXWyptGnD/79S9gv3YbduSJWe0uAR4cg6+1SQSjp8h42fHLTMupkJbDpqK0XQRZ1qo
 16mLRLqhvJgssrgXmTW3852KIayqu6U7GRnFNEl97vDCT1uS/ARz99v38DojvZQhV2484G22ijK
 VN6S6HouP3vfzwphLJkRiOxmu+UuRdnVQluHfMRD7ynyBvvTLgVt8h38pKDofOsfkak4/fkFugh
 q5+3bQpizsAFBu40aXQlwrfb1CsHhsaoj2S4WgkwUe7e+gkxjvhVK+ra0iimozHArOvL9dcuppG
 BNZ3r
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Device can be unbound, so driver must also release memory for the wakeup
source.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/extcon/extcon-fsa9480.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/extcon/extcon-fsa9480.c b/drivers/extcon/extcon-fsa9480.c
index b11b43171063d6dc14a5a4a7efb63e610397312c..a031eb0914a0b68aacb0f5f1f522597ea286fa2b 100644
--- a/drivers/extcon/extcon-fsa9480.c
+++ b/drivers/extcon/extcon-fsa9480.c
@@ -317,7 +317,7 @@ static int fsa9480_probe(struct i2c_client *client)
 		return ret;
 	}
 
-	device_init_wakeup(info->dev, true);
+	devm_device_init_wakeup(info->dev);
 	fsa9480_detect_dev(info);
 
 	return 0;

-- 
2.45.2


