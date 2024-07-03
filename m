Return-Path: <linux-arm-msm+bounces-25032-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C73E92555F
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Jul 2024 10:31:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A418828405B
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Jul 2024 08:31:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F052D13A3E0;
	Wed,  3 Jul 2024 08:30:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="yak2zSTk"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 323312C879
	for <linux-arm-msm@vger.kernel.org>; Wed,  3 Jul 2024 08:30:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719995452; cv=none; b=V/M5gsxhKxPu/Hpt0v+QSBZyGF+Yv7rsVznl0R/YEKlTg+/IEniWwRdUZMZ9npsY25yteH/HG8T9R7ZUSBthnq/xJABZboLAfHQmwNvF23KBUBIERQmzWkd2Qu8k6ICgMC1nvG832zqA2itaqw4R3B8bd23BpuhAU8iaP/4wZSA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719995452; c=relaxed/simple;
	bh=YCkB2dsIQT9Mudg5Bi946hYIraOO22Qh7YEirjNCxZQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=LBx4HGJMgZxkA03csFq+9gQivEo2uBP9dcBjcOK+LzleXFd9OtmAmcxCZdoIO/PiZFpxf4dfnKI1CISJvtMjf8BIYEpwsH1K7g2Q1J9abzGE/Vpx9ye4/x+sw1aLlNcG/zB8U02GPMhdkIhtelcgHNyXLfVvoD0ZJlPGL+DnGOU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=yak2zSTk; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-425814992aeso21119505e9.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 03 Jul 2024 01:30:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719995449; x=1720600249; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1J3Shn5KUyZXIeL5OTQ6GxMPgh/rauLT5ymDaJi6mGg=;
        b=yak2zSTk8d3cgvenqLFke++LshGRiNTIZj+oXpx2dnBspjjKY8hrKVhCLRbyKcyBtE
         +2V6TwGmbQI3qRbZ9mgK+7k2Rwl6px8Ca7l0k+ANkISNDDKdT2kbGj1j4j247oq3Ta5B
         DhzcHunWIy/2sKtJvUpFjQvTmM4rkEV3zPDdJgwUfhE7TB3dJmlrVgNf8UqjIthre6o6
         BKt8ipE7kqMvrjoBxZm35zXdJSYj9YhA3q67y2iELwiKTrgH/VD8iv4dMFMYw05ws2vs
         9l+2zrOCnzBO0xnZSD4vAt0CSSggVVpWNMXXwRahOJgRO3RMMc0Nqb8lgz3cZGBGOkba
         NCRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719995449; x=1720600249;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1J3Shn5KUyZXIeL5OTQ6GxMPgh/rauLT5ymDaJi6mGg=;
        b=EJX9nu3l7L6nit8a6nAgpfatdvSICxMRnJZu5kxfTn/ikdW4qHvzxZdKV2bWbHNavU
         6tznFVSYmLULOzoLiDLrfxmOuqIWW69C4TtxzA27d8Z7lOqx9J6P3FIAfsHLtYzrBEW6
         0vxWSif/KeRtPd3dZrXfgdhKHMeEQo8XLXaly6lJHgraE4HNl6Doj7vcSknwCJJl341z
         e0vr/Lb7mWd9OSDvPBHt+SzoArKiiw2Q8c14Lhz/WGq6AT4i1RRid9M/C4ioglr3sXNO
         vv37y1TkNovMDSq52EMCH4JJxPEVN9LU4K+57g4N0/w8cCWX5ETDLyp7HqaTBokWroZd
         yB4g==
X-Forwarded-Encrypted: i=1; AJvYcCXNod362sdXITxCZ3qzP83sQk6IjobcYdKoEP5sji2iK1ZCTdLYxPclGv8mj5owwFKKiN5u/twOfDTtYCifw6T8bn9MDWgmeBEsWF4vIQ==
X-Gm-Message-State: AOJu0YyU7frlUkm7fSn+ybDUFCvW0l5IWQneUuj6eoQkABW5d+/c2VQ0
	nh0yxyHgOA5DR2Pn9Yx8KwitdS4urCvCzpKMuPul2RrFiiUH1cgeb/FmkNhdeBU=
X-Google-Smtp-Source: AGHT+IHer7ee56Fmd869NcOdtgPYFnjBCVgs6cGvJocrrFO7JUrE7QjB3F7bv8jEaMcSiAAloCBkXA==
X-Received: by 2002:a05:6000:1fa8:b0:366:e9b8:784f with SMTP id ffacd0b85a97d-367756c6fabmr7767670f8f.32.1719995449539;
        Wed, 03 Jul 2024 01:30:49 -0700 (PDT)
Received: from krzk-bin.. ([178.197.219.137])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-36794e6863dsm814652f8f.50.2024.07.03.01.30.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jul 2024 01:30:49 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH] firmware: qcom: tzmem: simplify returning pointer without cleanup
Date: Wed,  3 Jul 2024 10:30:46 +0200
Message-ID: <20240703083046.95811-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use 'return_ptr' helper for returning a pointer without cleanup for
shorter code.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/firmware/qcom/qcom_tzmem.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/firmware/qcom/qcom_tzmem.c b/drivers/firmware/qcom/qcom_tzmem.c
index 5d526753183d..ab156ab3a6b4 100644
--- a/drivers/firmware/qcom/qcom_tzmem.c
+++ b/drivers/firmware/qcom/qcom_tzmem.c
@@ -242,7 +242,7 @@ qcom_tzmem_pool_new(const struct qcom_tzmem_pool_config *config)
 		}
 	}
 
-	return no_free_ptr(pool);
+	return_ptr(pool);
 }
 EXPORT_SYMBOL_GPL(qcom_tzmem_pool_new);
 
-- 
2.43.0


