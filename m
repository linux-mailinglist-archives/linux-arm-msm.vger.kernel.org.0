Return-Path: <linux-arm-msm+bounces-60138-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 66D8DACC5F7
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Jun 2025 13:57:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A91707A1A58
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Jun 2025 11:56:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8C67C22F14D;
	Tue,  3 Jun 2025 11:57:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="c2GjH7dQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB2E122DA17
	for <linux-arm-msm@vger.kernel.org>; Tue,  3 Jun 2025 11:57:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748951851; cv=none; b=TSbt4XOcwgHbMFdZchMrK3LLIT3oV3IIf0BiuANc3YjKQvRjWLE3yNcSS7dmrTGr/CeJ0WC70bGrELzkDDyJl7O6KNlAIL2pslzfL7z6AkjXVdsvUmWr0s7HatfZKRbv5w+9T/FRM/Txjijlpddx1xM5UoZGWqXkd+JayA6324o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748951851; c=relaxed/simple;
	bh=ar5+pdd2TFr1JcFtgPO5JaiU/Jpg3+NCQIURcO8Mub4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Gp3vtIgSH7osXCus5GDxaTNWzpGGU+FErjq3qf8Eab/b2zhJGSt1exNqsj9No2VqRGDWV+Ipk02DhzX13Ox30jYwstzzd8Km2NgtYaWZqtTCawPeI96rctY0lAo+pH9Dfq4AIs5g51UzVOJcnsjCDdTo8bMti+hvMNavtZrbUvM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=c2GjH7dQ; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-451d41e19d0so2664595e9.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 03 Jun 2025 04:57:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748951847; x=1749556647; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ekpXsFXiBQlOEYcI0oMkBbtivVJ9v85D39Ocv5s98/g=;
        b=c2GjH7dQZlQZ9JBt9JiEOwTeA2MdUGu4BS1ykDaKXp5i6LjRStbkM+KxI82qcL4qX8
         WXoVJU8+N1bFHEfEtt4KQn/hkHKt7bOUdwiaOX+nkNEup3N6T4SEDasMzA/v8veKWd0O
         gDPW5YtWBM814WD6eKrd3ot3o/hmCTBH5snUVSG4jJgYvpYC8WqbVl9pdOi9tX80q8SR
         SFWl9qJSwBdF+Egav7kA4giqBf+8nOQrHKz1EOklBjgR5O79ME4S4y+klwQnacIqAOpe
         t8qbXMzlzzdq4FtvjSbL6GYxm+wk0B/sy5rKdb5i0VFaXGokapvFa7kKWYn9KDMW8i6E
         qe1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748951847; x=1749556647;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ekpXsFXiBQlOEYcI0oMkBbtivVJ9v85D39Ocv5s98/g=;
        b=OV2q5b3mlQTwoM4ZFlEK+r/cAeDwfboauJRyf9Cs9LydXNpPD/1NaiWxHZ5vniK/ll
         lLysi2ThSkgGLSlWKy7CCuLkU6sw6hE4ln8SeYkgn0SsDxLhP4PJPUbzctQ6sQh4V0Yy
         c4wAFWmsbzPMOrZ3V0k/gJiznVWb05abPR1Zu6tE8kT2bB4uZv4J6FQUga82udTRov4I
         erEp9kRvWhPJ2OSEwJ9tYFvm8fDCrkdCEWuhFIU+5yaDrLefSXjm0C3cWt7+Gg/MfwE/
         aTMwFKFTiHD+JUetKhebWy9VVCHQpKnHitwO3Xr8YefUmsF1Fb/KQkK5qDT779bre+B8
         8sRw==
X-Forwarded-Encrypted: i=1; AJvYcCVDHQS8gyxMdRg4jvCUkeaUqc1EdNB3dzmUT3+CfxEDWgWbQlT4IFWTIwe81eaA418ENubBu1qYH7OqN4wr@vger.kernel.org
X-Gm-Message-State: AOJu0YygxsN6NpDjA0IotWc0V6BgruTkc+j7j2g1LSRpsquQOv++BeEj
	S2S/5Pv4KPi07P2h/19alv8HTc2/sAeBVg91AjN8Kh0FFRZDYoiPrOe7Z4Og9AJSRXQ=
X-Gm-Gg: ASbGncu0UyRwA1PSH6qa5zBnPUq9ymk4x8DX671Dt6Gh12j1wHVaPmNhV4ftUFYo1Jj
	pXXIx5MRWr3oj71W04DCzRZ90jTYBb5mgxhxWedb8D7Uy6xyvmKp/gJLBgTUeohzUQTsT6GChyS
	yQSWamVOsvzBpmZN1swxCsx6tDHdRI6n+W4rQJBVK1wI4yRytmI6YR8CUw6zH6TXnF4BeT6BnGU
	exZV8FavRlRj1PRnOyzJ99qgpgNmiVIpFfUx/7W2P4wi8gX5pD56MW6g94H8E0BoDOfKiIswCUL
	8H9R7CzQMvSEDXVLXaRmv7d6osJZTBYTqOZMBkVarKmMB2ccb2lKGNaKwPqliW6azyWHisivIuO
	myuJIprrrlSWkoxtBmgqyIw==
X-Google-Smtp-Source: AGHT+IHBMSZmFHh0iBBqbg6iYgmvQuQtkRQ7ni42guJxRJHi8RXPAyYfJYKwxYJrmX9gnms5o+3FMw==
X-Received: by 2002:a05:6000:230c:b0:3a4:dc42:a0c2 with SMTP id ffacd0b85a97d-3a512c032ccmr984242f8f.1.1748951847021;
        Tue, 03 Jun 2025 04:57:27 -0700 (PDT)
Received: from [172.16.23.13] (adsl-84-227-104-5.adslplus.ch. [84.227.104.5])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a4efe6c7adsm17671666f8f.26.2025.06.03.04.57.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Jun 2025 04:57:26 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Tue, 03 Jun 2025 13:57:08 +0200
Subject: [PATCH 1/5] dt-bindings: mailbox: amlogic,meson-gxbb-mhu: Add
 missing interrupts maxItems
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250603-dt-bindings-mailbox-cleanup-v1-1-724407563997@linaro.org>
References: <20250603-dt-bindings-mailbox-cleanup-v1-0-724407563997@linaro.org>
In-Reply-To: <20250603-dt-bindings-mailbox-cleanup-v1-0-724407563997@linaro.org>
To: Jassi Brar <jassisinghbrar@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Nishanth Menon <nm@ti.com>, Chen-Yu Tsai <wens@csie.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Sven Peter <sven@svenpeter.dev>, 
 Janne Grunau <j@jannau.net>, Alyssa Rosenzweig <alyssa@rosenzweig.io>, 
 Neal Gompa <neal@gompa.dev>, Hector Martin <marcan@marcan.st>, 
 Thierry Reding <thierry.reding@gmail.com>, 
 Jonathan Hunter <jonathanh@nvidia.com>, Suman Anna <s-anna@ti.com>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, asahi@lists.linux.dev, 
 linux-tegra@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1020;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=ar5+pdd2TFr1JcFtgPO5JaiU/Jpg3+NCQIURcO8Mub4=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBoPuMafbts+SQHLrCKWoSXydLXFpBuxk4+UMd/K
 nu5qIc0ykGJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaD7jGgAKCRDBN2bmhouD
 1ybCD/9RNGsVwuWaYUnIhMCF6XOqANSxF4pvD+oiEd/nFdvuoXKyHPDhNDJkzr5JI+eCG+Ub/MQ
 IFPA1Eq4zim5rKSJGghjZ4QRpCKGP/BiC0e3S+lzj0PcZ47Upq2cpIw5uEGa84l7HVOKXzobLHS
 4dtbpNI66GnxgZ1/hAQyG7cQ+b/JVVCKbo1XzHQdPkwO/sBtnEFmUp36ZDI/u9u2hJTCNd9xwDh
 z8DyRDvM8YT02OvK2sUVR4UoJIaFA43uNXyC0U+o2mZ/XAHLxkOL6t9aY9JhZ1KZ+heKhYVtVDq
 jq6Zz6go76ikVf85UUQkieagE/lk1hxHLb8tPkYIOVn2IR9e9sjHN/DFFOa4m725Ke7rxh2Q4FT
 3xEYfP/AU+h/cHPAK8he55zMq5tzMMHeNybBTtDKzJP6gXsE3UrINKmF/MYJBWgtu9wx5yWcFY1
 VYfpQ7cJNEoGpu/gPhFNVgrNwEs9yeRon6WMn3H12OTKdniyzdgIpnJ7JIqajxRgkZkKb7n/zxM
 zAzeos1xnYnl4qwTwwQHYBwmfVZYlkcYcXUthGxU188ahk3mMCNE5DE2eEzBmKlVUVfoGpETAFD
 xe8BwA6xrgnmksHotq8VKWpDAzKd0sqUmepz4DJDrs9GYrxZuqqnQzCCE7b34Hj7GArCuhFFaYq
 RxgIODOMV9Ib71w==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Lists should have fixed constraint, so add missing maxItems to the
"interrupts" property.  Since minItems=maxItems, the minItems is implied
by dtschema so can be dropped.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/mailbox/amlogic,meson-gxbb-mhu.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/mailbox/amlogic,meson-gxbb-mhu.yaml b/Documentation/devicetree/bindings/mailbox/amlogic,meson-gxbb-mhu.yaml
index 385809ed1569206a7304b777ea42743321c899ad..0849799ee0c5caaeb27fe1e3e3714a630a7c2b09 100644
--- a/Documentation/devicetree/bindings/mailbox/amlogic,meson-gxbb-mhu.yaml
+++ b/Documentation/devicetree/bindings/mailbox/amlogic,meson-gxbb-mhu.yaml
@@ -27,7 +27,7 @@ properties:
     maxItems: 1
 
   interrupts:
-    minItems: 3
+    maxItems: 3
     description:
       Contains the interrupt information corresponding to each of the 3 links
       of MHU.

-- 
2.45.2


