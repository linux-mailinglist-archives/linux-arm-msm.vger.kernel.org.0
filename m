Return-Path: <linux-arm-msm+bounces-72259-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FA20B45503
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Sep 2025 12:43:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 15F053A89C9
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Sep 2025 10:43:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EDA6130CD93;
	Fri,  5 Sep 2025 10:41:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="LA7iSbfz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11E8130CD99
	for <linux-arm-msm@vger.kernel.org>; Fri,  5 Sep 2025 10:41:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757068876; cv=none; b=PZK/Z8w7NOCeBPWzKGQFwmeQPRxXYF/7PVi/XyMBIr+RnLy6eIP/a6yf8aVXrN0aN87cVIxmAfuHHINww+yLzOiDt0Cy0iGanKhVhZ7QSRaxDLSSUiabsi+bTm6wqdOGMNM5Vzbycl1NFPO9dPrURC7KyD/wShD8E9evZQ5+kEI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757068876; c=relaxed/simple;
	bh=Vv9fLYuM7b+kP/yRcfQ9Aaf/yhYxH4QsjzEqIWP0bPo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WUlyv0ZvWzsnJ6Gsqnd3YxSYQHjrvnZMxpujBE7w0okL0NKD9/i7qD4hYYvZ72CSyiCnUtN1KWidIXafMOQKVwnCz2bRnlbjMrl6lrNQ9tuXZBG1IvNGt2eskE3aUZDGMqXTUgaB0dGyWFPOlumbUPxXOOvFxrfV7RUo4H9Gq2o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=LA7iSbfz; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-45b9853e630so18495385e9.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 05 Sep 2025 03:41:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1757068872; x=1757673672; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iUxSJ8NS/EKCWIWVdT7Xows3IlnWCRwYYijslmaC7tg=;
        b=LA7iSbfzvcyDSnKZ9m6v5oqFRyHpQTZ6jrqp0o2ppd6/WKeqF1tPDst7m3CLSJmsMy
         2sgzIKq83JngnZk9HAEs147LUgrztWn3Kwajxnu/IfbXhdffrZXjQH1KylQoopN9KW5x
         XrHD5jgzMglmqH0QPjPdiEFiQf1VdTB3HUEGg+Vh9o/PR9rf49Fs8IoUZaJkZBGH3RDm
         CtJ7cPPQf1klPHoIgeLa9yfSw7a9cWGi89pRK0I1S11P77MK5cAiUWVp71wJgumUWh0S
         7LcVFjOlmeEX7/g8HLqpzhfHjHoI6h23/fuR21cpEco4QC+Urb3l9XsxM9qkXss6P+MA
         FJSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757068872; x=1757673672;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iUxSJ8NS/EKCWIWVdT7Xows3IlnWCRwYYijslmaC7tg=;
        b=KkbAhGlsk8Dv+nV2kxZsJSER/9zE7rksSR0m/bMKeiFFAX1zWJ/wDtOHc0vA/yl3y6
         XIcjDF48sOYp5qHWESpInJPvg9FJPAMyQ0kQU58Z1QXDKsAtzJFW5n9zgecVzDXwUW8n
         S1edV3zU3y4m/hARsfzVBAPO7Lk6fTcoWUE1d26GqFwj1LIB1sdyJeKAuRl9kFlPA4uK
         oJ5nCXT0jWFRA8xGUQ2koDTlVC8ROTLFimRur6F+l7sLMSJJd0yB/1rAlU0EuqLedEmU
         wsxoM7pULpUUNMwMxKt9MgYPC7H95IReMaVBX5puSj3nTxpzUulpYVoHKMnv3aO4QGdd
         PVVQ==
X-Forwarded-Encrypted: i=1; AJvYcCWH7kHDw/hcGOv4fL2nrNMOuLf2NTSk5OXYa0UpITbECD1E8MHcxIslQ6pBqqGa0R2L41Bf2Y/mMVfL7Xgi@vger.kernel.org
X-Gm-Message-State: AOJu0YzB92zvU57o3fob8p7uc45XwmJGEhN07QoPiDq6aEjrlHJsVU31
	waXOI5L4XBGnU6AszzrZBE5P+K64zRxwTbh5TXskZDdx3q/4gofsggEgrntGgobbV08=
X-Gm-Gg: ASbGncvF7/yxM4tauXC+/oJM4MoKvu7xsBr+1Iv55aF9L3JFyD8TNYrnEOVAGj3imwS
	VbzIMgPJYLh+fECJsUoA0BpHnEWv1bT163o9+k24Ym/XjjRkqRRrxWp2OR6fBH92zuMUXJslj9a
	erHtMH0QzsJjlUZvSnxhPKNWBweY3NcGBy/htlgJusvAMqtofGMcnv8meZfIL8sUDUW7aBTLx8j
	+jnp8dJnsx+RuNcvxdGPIV8pJw6hV1It8+N9zVY7gqM9wdMSoPPqSxiRXOIbqSt8MRxu5dfv82i
	L6qsYtgGCStjAikPadsh4Q8cu5yE+uBDpjaWmnJbIxJammeKhly60P39SoQiYhFYu52hXgRGhh0
	sHEDhgeGY2cCOY8K/3dxnN4TEiRyVfKfFDTpNd8r0g+0XOHLWDk6PvGvYs3Udasffr4vEfQVFMO
	QGohN/Yn8lOCxE8KXlvL0N8VRvZvqsl4k4moR90Hrl
X-Google-Smtp-Source: AGHT+IEVXQE/CskVMSpfS1GtOIvpVNOfUMU+P9xIanoXIT05tmzKechNro4i6hwVm9EJLTjofdfxZw==
X-Received: by 2002:a05:600c:4454:b0:459:dfde:3324 with SMTP id 5b1f17b1804b1-45b855b34f8mr174028005e9.29.1757068872257;
        Fri, 05 Sep 2025 03:41:12 -0700 (PDT)
Received: from [172.18.170.139] (ip-185-104-138-158.ptr.icomera.net. [185.104.138.158])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3d6cf485eb7sm20990738f8f.3.2025.09.05.03.41.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Sep 2025 03:41:12 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Fri, 05 Sep 2025 12:40:35 +0200
Subject: [PATCH v3 4/7] dt-bindings: arm: qcom: Add Milos and The Fairphone
 (Gen. 6)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250905-sm7635-fp6-initial-v3-4-0117c2eff1b7@fairphone.com>
References: <20250905-sm7635-fp6-initial-v3-0-0117c2eff1b7@fairphone.com>
In-Reply-To: <20250905-sm7635-fp6-initial-v3-0-0117c2eff1b7@fairphone.com>
To: "Rafael J. Wysocki" <rafael@kernel.org>, 
 Viresh Kumar <viresh.kumar@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Manivannan Sadhasivam <mani@kernel.org>, 
 Herbert Xu <herbert@gondor.apana.org.au>, 
 "David S. Miller" <davem@davemloft.net>, Vinod Koul <vkoul@kernel.org>, 
 Thomas Gleixner <tglx@linutronix.de>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-pm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-crypto@vger.kernel.org, Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1757068857; l=880;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=Vv9fLYuM7b+kP/yRcfQ9Aaf/yhYxH4QsjzEqIWP0bPo=;
 b=XzDY84jHgnwOW/UMZlFy7LOSxACVXWrRrAIQsHGoMcTUKa4XPYE4kxJ3MRwgYaFc99JjXPhS5
 IBoEJqN22GXBcGyGqN/515GfauIIGyEksVCUeNPCws6B2PhKU4SaaO2
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

Document the Milos-based The Fairphone (Gen. 6) smartphone.

Acked-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index 0110be27c4f6602b25aa4feb742bfe62e4a40d51..b4ea462062bfe1ccfb34d22deb1d2407443430d5 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -61,6 +61,11 @@ properties:
               - qcom,apq8084-sbc
           - const: qcom,apq8084
 
+      - items:
+          - enum:
+              - fairphone,fp6
+          - const: qcom,milos
+
       - items:
           - enum:
               - microsoft,dempsey

-- 
2.51.0


