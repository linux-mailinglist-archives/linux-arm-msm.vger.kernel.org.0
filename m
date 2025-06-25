Return-Path: <linux-arm-msm+bounces-62366-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D9A08AE7C9F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Jun 2025 11:26:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 35F2518882B4
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Jun 2025 09:25:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 37DAA285C8A;
	Wed, 25 Jun 2025 09:18:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="uNaTUOOR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48AC4272E5E
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Jun 2025 09:18:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750843100; cv=none; b=SfJ+8Y+dc2vzTAtTnJRUXy4VaYWtfHUU4uGYLEAkY6MhS22EbYI0A/0nRCzR3TJjZrVe+lGoaZ62mZm3YU3HFJ/Yosg/p8G+9EBEcO/iw5olRYw/wGkD3N/BTl6T8So/cYR++5x9KJJeJQ3f2JNbTAFU455KC3PVvz4Plch8BzE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750843100; c=relaxed/simple;
	bh=FFyi2TTwWD+QPai6pEi4JyevuUJcOl9Vi7QGCJ3xztw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LPzKz0LwYLYemAEW3yv6ix0TjO37x7UGsfqtGnklP6vRi+Q+GMKtKi1L92/1r6HrIKanpNg/47jhjxemFdkQ/5HIvYHgi/5yT+6lXXwAFXGSbusKOCgH7dYImgK/n7cA75o796ve071mt2gdH9w3cHJmnzdYEfKHLZLRq2v18Y8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=uNaTUOOR; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-ae0b2ead33cso136118366b.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Jun 2025 02:18:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1750843097; x=1751447897; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=f2RSqLPZu23r28/yDYeK3iwSZkpIKmCaKnn2t8cvfxc=;
        b=uNaTUOORyt699w1SXS1CH76sfqNrxw8t2G721zWMKUg64cNvebxu8wBiaK9pjYZ6CX
         7lVBTaouM/NXE8f/sQlh5Xw85+kNIXy7GYIT9Zchphrn0nLsMCEPzXM165nAs6xQ66UF
         r1ZNDkNksoQmdfe1osabRWzW99/lY2gMcJPHcTptlVl3GUZzuaHslSTiWLIDvYYx/fM9
         0jeo95qSbmyKGmHY9jSCZxvPn8BAbvfMKLuW5R7cLZF8ZeNjUUhZ0g8pCNujn60xrX4r
         YJqLKA8qJ0U9+VHa4fgyIqtb0O25gne9FKzEMg1hi/+ZhgyhfZVgxi7WObg7ojCHwb+f
         aZ2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750843097; x=1751447897;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=f2RSqLPZu23r28/yDYeK3iwSZkpIKmCaKnn2t8cvfxc=;
        b=tUed3LYyy0UI4QhSnfBIXqdkAGT0caGbSw8YOMPN4r/O00BHFfI2z3I51yvHKs+2U5
         LAwkzkK4e/E9sh1eR+DKuMI30zIKjTI4peBXZy5+557iCi0T6VqIF/vPAa6N3DVg3Hw5
         jHNBNT3LaxYC7DKflQ09RQTFJ1sGuOjz921qTiEjgLd0DvFLrfN1gI8sA4j8cGxP5M13
         1u6qTD2K4OlsV4hUHdz/D71tAdW8Bv2MoewRlg7CbtoAfD2IwdCOIWKrgymSsxcMfMkG
         bQubZ0utnUHNpvHwSmncTn1HDQ1f/RAaHx9ghPqtNOpbih/TAeAYkjXcB9WYs9ktUT5T
         Q/eg==
X-Forwarded-Encrypted: i=1; AJvYcCVZJAsj9eCX+tewGhGEnlj9aluPwqKBDTBECeisqY1YCvYeYVU4VS3LF2QDWDgknMyT39yo2JyvG3ANgh7x@vger.kernel.org
X-Gm-Message-State: AOJu0YzF1eGmM3yz2SAzUQHaJMBLA4bUyXxloo915glx9u9RP1Mafy0s
	E4gjRmscMDRp2AVVsQjp7o01oNDRR3SixLfMNexrIiG3pZcXI4Fn4xrPATS/8qSJ5V8=
X-Gm-Gg: ASbGncs9cs1HunjYg4OvCIVQfL3pSRl418YTC8+b6rGFiAQPn7XdlFV8e9pNkphhh6N
	njjJU+vPoOfz8ySAc9Mgz5wI1PpTbQZcphl8R3mrgx0EeT9hE361nDiFd8qBknpVWxG11wImvT3
	hDmdUKWBQQe63ZuX4RI9zPt0wCyQH81m8E/sJd2GGs9vqqdeqhFWHFVtwR1cD8Go7svvSNUYPm3
	9Y9s3ODXmWV0Il2eMqoRtNfGsWHSgmkdyP76SDPxngdZ05rPRaF+FlkU4LCWZBLl01WWE6vXxOw
	NAZQKbXFlewAS3jGT65bPpFTHStD8K3k1v+4Li/hovOZYOkxIHest73VPWDHp1oGswij4oJDwe3
	TpryiSdnbZkbXwZ4w5q5CUrk+1b27p3oa
X-Google-Smtp-Source: AGHT+IGYD0rC/aYIVmAXapkPflNDUng9xnrOy/PP1ovsYL3Pr4WT+utJBYAgP6x9+IrqYJvL1om8Hg==
X-Received: by 2002:a17:907:d860:b0:ae0:c4e3:e2e8 with SMTP id a640c23a62f3a-ae0c4e3ed50mr133302166b.28.1750843096666;
        Wed, 25 Jun 2025 02:18:16 -0700 (PDT)
Received: from otso.local (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae054209c85sm1009952366b.160.2025.06.25.02.18.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jun 2025 02:18:16 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Wed, 25 Jun 2025 11:18:02 +0200
Subject: [PATCH 1/4] dt-bindings: mfd: qcom,spmi-pmic: Document PMIV0104
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250625-sm7635-pmiv0104-v1-1-68d287c4b630@fairphone.com>
References: <20250625-sm7635-pmiv0104-v1-0-68d287c4b630@fairphone.com>
In-Reply-To: <20250625-sm7635-pmiv0104-v1-0-68d287c4b630@fairphone.com>
To: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
 Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1750843094; l=829;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=FFyi2TTwWD+QPai6pEi4JyevuUJcOl9Vi7QGCJ3xztw=;
 b=cfWhIW16u8AU3opUGXPjIMEz+f97knPAZaejc4RLCxX25LbhEo2hfOqSlizWFGlJWr1mlUCuK
 Lvms8zLfWujAlr9MWTSzk/YxpC+JHEZuQYOZF2Sbd/FZsDPal1KKBdI
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

Add the PMIV0104 PMIC which is found on e.g. boards with SM7635 SoCs.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml b/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml
index 078a6886f8b1e9ceb2187e988ce7c9514ff6dc2c..c416f25c90d6d9f8404947d1fadef91cf664e666 100644
--- a/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml
+++ b/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml
@@ -84,6 +84,7 @@ properties:
           - qcom,pmi8994
           - qcom,pmi8998
           - qcom,pmih0108
+          - qcom,pmiv0104
           - qcom,pmk8002
           - qcom,pmk8350
           - qcom,pmk8550

-- 
2.50.0


