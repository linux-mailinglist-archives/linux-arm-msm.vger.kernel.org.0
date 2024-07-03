Return-Path: <linux-arm-msm+bounces-25060-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D907892571E
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Jul 2024 11:43:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8FBD728575E
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Jul 2024 09:43:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 33AE3142E77;
	Wed,  3 Jul 2024 09:43:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="yFz7ZOMX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 614391422CC
	for <linux-arm-msm@vger.kernel.org>; Wed,  3 Jul 2024 09:43:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719999784; cv=none; b=mRAoju5m87DY76vosr5exfJ3T7DSF0ye17g700fjUOi1DtthUPT9cCMkTQOZHyXV5j4qHw4dwixADDLa4c8llYsWiN9tg/jwBPt4IErBdxv3Th24B0IJq2Ppj0jyGsaNH5WRg5HZ/S8dKTO+CJ3t6VMspfoauIx8r6J/yQsNknU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719999784; c=relaxed/simple;
	bh=Jq0jlG89u9hud4QvxGvDm+WMAUvi4Tm+sc+lYy6IEW4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Eq/uJEuQKUQYpgl48smVHoTa1XQzzhH9FNNEnPLEwvrYnHkovRGJyoQVNtFtzS/PkZsXm2aq6/m14AHRB1zJCFoeWxN/t/jElnr8P5LkDKOb0s+lqty+iMoboHZ3oefXe11vVMhCHqu/qHiMTDF8dsP3ld2yuxxqk6LXwx2vffQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=yFz7ZOMX; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-3636c572257so3711496f8f.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 03 Jul 2024 02:43:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719999781; x=1720604581; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4pYRZX+NSiwidYn0MWwg3SiL2WiSTwldzzZjg+SAT9I=;
        b=yFz7ZOMX+28Sv80KaOvXPSjX/A9C+Cb3SvljNm7vXODFgLinx6p9f6o/lFSZJa614z
         TizqmposHfHIBHZb1cgBoNA93iy3/3FVco7iqA7Qb9BJtk7vg6mdkSL84uFFUJx/EvqS
         i1WtcDzHMrSI6Iz0LR3wsoH9aKywMQ2XfO32Gsz8YUgXeEZ+JYQkqsVGPL3/af5Z5VE0
         C/BYNhDhWb53w8MTdcKnZuHHBeFYpwehjIUZKhk9RKIlbfYamXbw8qlr2dX4JjVCoz23
         L+YtwLg5CNGMoLhb0qnFjUstLbXLBJUwa7xveaEKLwwBG1+O3zxMvA3weDO2rp2YI8mc
         veZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719999781; x=1720604581;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4pYRZX+NSiwidYn0MWwg3SiL2WiSTwldzzZjg+SAT9I=;
        b=aOWNvBqrFzuJ06ku94EUmVUNA60kTbA+B7Syc52/o573SmBVDAaQpeduqB77XRwQgP
         QNTaOLSskAOtDH3UU/1PD7jiQJKwk5Fs1imOrqO1r8BLvBQ65M6fcEmvCnXoZwsJg6i/
         vVe2DGYTi0EvQkV3UzWWp8Y6B0ffjvsvX5xjPTaXz5cMmom9Vfg1jhnxEvUbl79tOnvf
         ipgZft4ZuoYExBHsR/R8B5jAR8QmD+pPZpMbxW4MHhbNisUyNOfWcdVjf3IzAumd2xFj
         Dp5R1Q/nDdQxbwgm+32vrxHY4aEkWctCI6gQrHe7wgSBgv30r3zWH6vIAQZx8TDUMkXX
         p9Rw==
X-Gm-Message-State: AOJu0YxB2u/ggB3HS5iN8Dy51t18p1kZUYtrVZlP/OHbeJjH/qCn+1N/
	nS3N5hcW0LgfASQm2Mv98x9NQY2Tl3uNvOkTeK1D2iCZCy/3q45ViT2GQcBcS0I=
X-Google-Smtp-Source: AGHT+IFWB4DW3FsA6wGH0ff7ZiA+oTRSHRSUHHe3nL56wU5YlOkiMjj2tYWvcvQcU/QIqFwdzi6Sig==
X-Received: by 2002:a5d:6852:0:b0:367:8f98:c501 with SMTP id ffacd0b85a97d-3678f98c65cmr1690529f8f.38.1719999780870;
        Wed, 03 Jul 2024 02:43:00 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.137])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3675a1030dfsm15341394f8f.100.2024.07.03.02.43.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jul 2024 02:43:00 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Wed, 03 Jul 2024 11:42:40 +0200
Subject: [PATCH 5/5] soc: qcom: wcnss: simplify with cleanup.h
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240703-thermal-const-v1-5-6e59e139c65d@linaro.org>
References: <20240703-thermal-const-v1-0-6e59e139c65d@linaro.org>
In-Reply-To: <20240703-thermal-const-v1-0-6e59e139c65d@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1904;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=Jq0jlG89u9hud4QvxGvDm+WMAUvi4Tm+sc+lYy6IEW4=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmhR0bcBnmEh+GBsRCoRqmtTRL5Fmpc/yV0AnNM
 1D/dJe8iQaJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZoUdGwAKCRDBN2bmhouD
 11EFD/wPkjo6yn0annMs8pDfoUHjIpLBQ+3NuImJ1F6ieXBKkgf9n3tvlYMqXYGHs3Cl7aWSbw2
 pbgPRDYjrnBaXoRovrylyXGnmCpnt/SRSpWgXL8naTDADYS38EMBrEoV9GiMUEEc77WxEkgv82X
 wJz6kQs+/gsfbURh7nb1+iU/owcjoMld+dh/biNLs9v+zdqNlJSfR9YX2XmeQ7baXXHoSSEmrtF
 ivOqej5DvFkMJMpsKHPtiX7tw669rxVJrHsPRYmwkDQqsnj2yf9m4RiX8nhsvQh7ZuSccIpbMPP
 5a9unMamwFS5WqTpaEbPpUiMI13kmcCkZt4M3UP4VDlUspbl2bF+87Mftx8GJuC23hAdGsuzg+X
 bMp9eNEOUqQtRU8Vs5o0tkvTlSrgLja1T1jCENEDj45D75tVHZnHMacQZKZHtPfQHgOoZJ+ljod
 9u3mnDVQEeJBu+NwKHq3tuoOg8YVuq2hYiggpO9P8t9lDSGz663NcyEMp3AAHAKv1+0vzNJlo3+
 0XR7FsE40AgZ3wJ9K6+IlaqTjQ4nnoiOALx3cb6nlVuxDQ01UpjmtzUKHqsq7EvjMtT+Q6Ozh/p
 rGBT4z5SsQeiwq6yNSYkTBZNMt6a06A0XkQvIgl0ZR+1LMKEZEkcEXHNkxGhi2O9FJlgTHbONJm
 lEVXlpn4UvZYg7A==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Allocate the memory with scoped/cleanup.h to reduce error handling (less
error paths) and make the code a bit simpler.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/soc/qcom/wcnss_ctrl.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/drivers/soc/qcom/wcnss_ctrl.c b/drivers/soc/qcom/wcnss_ctrl.c
index 148bcbac332d..62b424e90d90 100644
--- a/drivers/soc/qcom/wcnss_ctrl.c
+++ b/drivers/soc/qcom/wcnss_ctrl.c
@@ -3,6 +3,7 @@
  * Copyright (c) 2016, Linaro Ltd.
  * Copyright (c) 2015, Sony Mobile Communications Inc.
  */
+#include <linux/cleanup.h>
 #include <linux/firmware.h>
 #include <linux/module.h>
 #include <linux/slab.h>
@@ -198,7 +199,6 @@ static int wcnss_request_version(struct wcnss_ctrl *wcnss)
  */
 static int wcnss_download_nv(struct wcnss_ctrl *wcnss, bool *expect_cbc)
 {
-	struct wcnss_download_nv_req *req;
 	const struct firmware *fw;
 	struct device *dev = wcnss->dev;
 	const char *nvbin = NVBIN_FILE;
@@ -206,18 +206,19 @@ static int wcnss_download_nv(struct wcnss_ctrl *wcnss, bool *expect_cbc)
 	ssize_t left;
 	int ret;
 
-	req = kzalloc(sizeof(*req) + NV_FRAGMENT_SIZE, GFP_KERNEL);
+	struct wcnss_download_nv_req *req __free(kfree) = kzalloc(sizeof(*req) + NV_FRAGMENT_SIZE,
+								  GFP_KERNEL);
 	if (!req)
 		return -ENOMEM;
 
 	ret = of_property_read_string(dev->of_node, "firmware-name", &nvbin);
 	if (ret < 0 && ret != -EINVAL)
-		goto free_req;
+		return ret;
 
 	ret = request_firmware(&fw, nvbin, dev);
 	if (ret < 0) {
 		dev_err(dev, "Failed to load nv file %s: %d\n", nvbin, ret);
-		goto free_req;
+		return ret;
 	}
 
 	data = fw->data;
@@ -263,8 +264,6 @@ static int wcnss_download_nv(struct wcnss_ctrl *wcnss, bool *expect_cbc)
 
 release_fw:
 	release_firmware(fw);
-free_req:
-	kfree(req);
 
 	return ret;
 }

-- 
2.43.0


