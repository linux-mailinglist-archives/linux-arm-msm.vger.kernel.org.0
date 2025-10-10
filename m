Return-Path: <linux-arm-msm+bounces-76781-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id DBF6FBCCC16
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Oct 2025 13:24:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id CC12D4FD84F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Oct 2025 11:24:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C946A2F2601;
	Fri, 10 Oct 2025 11:23:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="ptSE5Hjz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8F2F284B4C
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Oct 2025 11:23:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760095438; cv=none; b=lmt3EzPNfc3zK12bmJeclTFoH14m5QZUhr9q28/liEBdUqCXnkwDRaleaw7hHb3NCWMFZHXdORFIyxIUQqJ1r+MciQUPsJn7XqX6CsDnNqxk+jSzrPJszQDV9ToDEEDvHatvA7WKBqTY+XG25p1zfmto0Yr8BVuXeGVEZ7zMaKg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760095438; c=relaxed/simple;
	bh=aq/4LlBtdDV9fwTGsuaPOpu5GJBcvTjlliJW466UN/o=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Pn7tpZrnbIeBxj6v6P1XSZMJfW6i6TOy8Nd+bdw3GXdDsUtqPNYxI1SdbJyidr3U9o127r1s1oePD2aeKYQH/GO5DXIuBNccizHs+5qtYTzIzWYLhrpuiPGhrDXy/8xHjGoXPBT+YHZJ1QyrxRWZ5BfBAbBONyUyR8zpJEP1oc4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=ptSE5Hjz; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-639e34ffa69so2959012a12.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 Oct 2025 04:23:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1760095434; x=1760700234; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xbHU47lVJvPoAqNYQLf5z1X0/coxYDZLmDD+Zs19Aq0=;
        b=ptSE5Hjzhl7uTbavQpg6W3FOgMvpAYNLiJOawlMh51IedLTJ2OAYYf6N4oWs6DPoTi
         lsJa5N94AhYwvvu/JqjENZ4Vu5os6cqtcHuH+pqNos9GrNXkriYpK8+m+4ZVHxSBLwiM
         9LI3l8X08GfNwSQbd1MRPnS0heorG1q9wK45OxzahggJMig7etSJA2iAOuVjTSOyyK9g
         AyLBYZZKYo9FdesyyLeskUR0v2060gXg0meG2adAJNZ39i8ghI2Cdzbq/p3gtnjJ2nNJ
         wbqaGyM98qlLbtv6xvnGjSp7mzP2ExrG7wTfLzlCxL2hKtcTwkd8rtHb2q6WVeRhQZE3
         Af4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760095434; x=1760700234;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xbHU47lVJvPoAqNYQLf5z1X0/coxYDZLmDD+Zs19Aq0=;
        b=Ap7v5OsAckd/nH/8AV1v8gkywqaDxQJXuDKo0Arnx2UbzkEOQo+Ev4Iy2t+GyHzya1
         q0kiCX5waipgO437y1acvZiARYiOyhNwI0hiFhrPBrBZpvVsbD/3dw6ATlgrqijf0x8K
         P8S/njYV2nvc2dd3S1uzwDOqugMcq4LXTjWD9B1XAGJp0LIRklNHDywrUp+5dO+gzVcb
         eaT2r7Lr4fQcvvyfnkwn3VCNc93jKlcu7vjypIh1IAg1frNKn/5y6YDqYaOrjeMcSzxA
         9Q8XtayseTc8E4SvNdfzl0NEv1obkGTqdvEh45FQhlxSnrEbxbqkbesLwMKcIYbV+8eH
         wgdA==
X-Forwarded-Encrypted: i=1; AJvYcCV3msrBuI+O/j2iHrsM5QLnADE5aqriz0xMsTJSVbAaYuy/Mwwio0RhtR1JKU6MZmCvUHnjvXcYUkXU014G@vger.kernel.org
X-Gm-Message-State: AOJu0YwGTW6UGbyHfFlEjcsbpW4OeqrVuGqtcc3Uh+IL51l68Gr41uxw
	BHlEWzL+6lNgH2bPPW8oDoK5pYsDA83pUQxINEouqHtzdYZBz1JIlTW5SrpZk6aj+kM=
X-Gm-Gg: ASbGncvtO33aPqYO9QnhfxyNHZIUoTkUI5E/NHj/vsuJqhDdlWO58MOzUO0384SGc/E
	Ek08KjTYPtJNuG5212eZ65T54fXZC5d1ccHfGDz+RutTxvOkQXZc7etwRZgTD1PicFfn01WBVg1
	/N3UGJ5UJljHPwD/EKAVf4SQaSNPDp+XdwyqXt5iXxDoaedQEd4Aq9c4sl3XDPDhtKv9tZipQOK
	W9B07/3XN7DhFtew8/OkrUwZtptqFcQa77jmgOKEmoJ9rIINyvJkQoImYZL53NQ5ifgg3bweRU9
	H8g89xH57b8x2PspmRWouNk9sVtlVgCZed6oKaUymJ5YW/u6GtrFG6BTp3DA8mCH+5Dxky/D6i+
	mvgaJZvekUSRGn5LSBpJIThDpVFBkL7GHDS+MxboTLi53walA1jDPbMkntfKXhWf5dtnJJE6iv+
	J/BtWURZHwCGuXD8qzVDM=
X-Google-Smtp-Source: AGHT+IEGGOcXMfbfok1PgzreNouwnXwnOxKHke/yHbjyLVTMxF0ZeD3AzIE5Lo/WXZ+3jpLEgrXUlQ==
X-Received: by 2002:a17:907:7f0e:b0:b48:44bc:44f2 with SMTP id a640c23a62f3a-b50ac8e52b0mr1079525366b.43.1760095433928;
        Fri, 10 Oct 2025 04:23:53 -0700 (PDT)
Received: from [172.16.240.99] (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b55d900bf8csm209905766b.59.2025.10.10.04.23.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Oct 2025 04:23:53 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Fri, 10 Oct 2025 13:22:02 +0200
Subject: [PATCH RFC 4/6] thermal/drivers/generic-adc: Allow probe without
 TZ registration
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251010-bat-temp-adc-v1-4-d51ec895dac6@fairphone.com>
References: <20251010-bat-temp-adc-v1-0-d51ec895dac6@fairphone.com>
In-Reply-To: <20251010-bat-temp-adc-v1-0-d51ec895dac6@fairphone.com>
To: Jonathan Cameron <jic23@kernel.org>, 
 David Lechner <dlechner@baylibre.com>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Andy Shevchenko <andy@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
 Daniel Lezcano <daniel.lezcano@linaro.org>, Zhang Rui <rui.zhang@intel.com>, 
 Lukasz Luba <lukasz.luba@arm.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Laxman Dewangan <ldewangan@nvidia.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Hans de Goede <hansg@kernel.org>, 
 Jens Reidel <adrian@mainlining.org>, 
 Casey Connolly <casey.connolly@linaro.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-iio@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, 
 devicetree@vger.kernel.org, Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1760095429; l=1291;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=aq/4LlBtdDV9fwTGsuaPOpu5GJBcvTjlliJW466UN/o=;
 b=g8H90MmiVQbUf34k7FO9FschEuUpZ8+riafTdgCUcqiIfMwO8Gl+ddsWuyUlJKZ5GMtv0OT0Y
 CC07fjXLbWRAMXyYnitoWqrLXpblN5+yM5fIh5ZBkqstAtSmldwJ1G7
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

If the devicetree node is not referenced in a zone under /thermal-zones,
devm_thermal_of_zone_register will fail with -ENODEV.

Since the driver is now also registering as an IIO device, allow the
probe to continue without the thermal zone.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 drivers/thermal/thermal-generic-adc.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/thermal/thermal-generic-adc.c b/drivers/thermal/thermal-generic-adc.c
index 14aef682e0fb..d31533927be6 100644
--- a/drivers/thermal/thermal-generic-adc.c
+++ b/drivers/thermal/thermal-generic-adc.c
@@ -183,14 +183,14 @@ static int gadc_thermal_probe(struct platform_device *pdev)
 						    &gadc_thermal_ops);
 	if (IS_ERR(gti->tz_dev)) {
 		ret = PTR_ERR(gti->tz_dev);
-		if (ret != -EPROBE_DEFER)
-			dev_err(dev,
-				"Thermal zone sensor register failed: %d\n",
-				ret);
-		return ret;
-	}
+		if (ret == -EPROBE_DEFER)
+			return ret;
 
-	devm_thermal_add_hwmon_sysfs(dev, gti->tz_dev);
+		dev_info(dev, "Thermal zone sensor register failed: %d\n",
+			 ret);
+	} else {
+		devm_thermal_add_hwmon_sysfs(dev, gti->tz_dev);
+	}
 
 	indio_dev = devm_iio_device_alloc(dev, sizeof(*data));
 	if (!indio_dev)

-- 
2.51.0


