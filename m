Return-Path: <linux-arm-msm+bounces-43859-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 81CD7A0084E
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Jan 2025 12:12:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id ECA071611E3
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Jan 2025 11:12:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DC29A1F9AAC;
	Fri,  3 Jan 2025 11:12:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="4f1qIQud"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1976B1F8EF3
	for <linux-arm-msm@vger.kernel.org>; Fri,  3 Jan 2025 11:12:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735902728; cv=none; b=h0i2Ng2oAduHa3FLpnE09+lur8BKbY7s2mHc1zbKkHYroBQvtKDp5brmPzWkpz0OvWzWeeCHWkvq/azojvVumBXEhLaJ3secIzwXOwoszn1OQXqGfcnjQS2v8ApewPeoDDctsufYt3I6lwJuF4yL98awBpdZTOgdmAiI+Wc4gd0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735902728; c=relaxed/simple;
	bh=V7LLzS772JzWekboxc7ic58WU1/YMCue2Pnz74JgmzI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QoQxRrl/9Ty35HwSp5yF9cDxE9PUVntEkQ6B8Zx8+fiT9fc7TEC0icVishgRxxo52I8C7TrC6GfPHoPns2+Btm5gHty0yn6FkSNS0DCwQz8KMc3iRuy7xish9H/gMOF+rcIRyX8PaAWf+q7MBDzhLDgsJhj0+FwzAjv2co/QIDE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=4f1qIQud; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-aaf0f1adef8so1030873066b.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 03 Jan 2025 03:12:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1735902722; x=1736507522; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WZ0KxM+G6NVYDY4yC/WE/MAo3QAuIiwCharn2GxEX8E=;
        b=4f1qIQudf5SpQOkHhLxSF5i7ihOqy9Ood4AOE8BeeCrDcqUTOQ2J3pt1x/3xrNNvKK
         nIrMShFvtyZVoQ+K+XozR5tKu2cHsF6JGBgGtCcHmMRafp3tQte2PB17SY8BxfszUz64
         9EbC2AIluJN6YyPSSe1UyuEN3ORvouDn7n2bk9dnBESJKfmmlADzurnrNOXqwCJ0qKIB
         okRQ1Upmga0l/skQBErm/BBzcBcM406+wCeCi8dUg4/GrIjCcPMzt9C0d4gVTwWP+ONk
         Jufmsnjv/I7xvOwQgfKZ9nlwb8qTb76fmcSB7FehV4N9XVM+mbr5R68v304FjxCp1YGa
         fN1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735902722; x=1736507522;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WZ0KxM+G6NVYDY4yC/WE/MAo3QAuIiwCharn2GxEX8E=;
        b=T7trD31M8RXX1crkIxyi9Sf3A6/gTRRGCDnfa/5IQOriLZe6M4xKZNV2LMqaW/V8Tg
         bKeoXq3MmSgea0o86Diw3JfVIvq3NUxjBMo61I6cAcBox0jYM5hshxaUJean9t4TTNOV
         CoJjgrz2OrfIrxMoBKfNN330mTCH51AdsIZQi9XsTaz3GuwS58VlLyCSbr/s1RaQl8Se
         DW+xqSZ4yywWWdwJsZNbGl6kYFdzRDcduYNB3RjORQbgy/lv/wAyoSamMdyoBWP1lvwz
         xInmO67U3kWJIrcQuDrBoW8aYg9W9g2+bS01bZIdAp5hnVHl5V1TE9jiY8BMYxX7pt0m
         mMKA==
X-Forwarded-Encrypted: i=1; AJvYcCVpZmyA4Jkc8TH3IoIoVgwaWprvnr/4cO4LKUJkN8JSg/U/8AwOlW2OEl43sUOXWDGlKEii8DRQ8jAGxTWU@vger.kernel.org
X-Gm-Message-State: AOJu0YwfX61Kac4qlajNCxQz9Q88w7+Q4S7BgexMIuLYbKYC8vVSvk5n
	fs7Gu7bPaY05lYe95HOjgjc1UQtAWk6QQf/k7dXROPT6zZ7EH84gz+cTlB55/J8=
X-Gm-Gg: ASbGncsA5IWPED/IEGAsVgCRohdnjzDQH5rSouq0M5feilmX3kl8pEbCtVqSuCpLqYT
	9AjAl5MAnHxRqFpBMlFPTfLtEvz/slJiq+eNHp+uyP6q3+B+nwBQhWF/anm+pzFWENhnFydt2eC
	vfD/vlVdk24memWNWeD0ClM2MnTz+pf7oNc7Ei64UN6tnHB+WO5dUJrRvlBgzX9QHHjOLaIRBr/
	a9RPraMVewa50TGXk8KpytIzPfYWfi/aVPpTAI88rjsVFtNre1Kb5Gz1bSUrmtrYMCV+P+AN9kI
	TMG9jxfDEasoftjXB3gnbqLmAA==
X-Google-Smtp-Source: AGHT+IF94pkNvH7h3XHPLp4HlTKDGRzARv5cgxdc0QFDVdciNsmjQcTgfzogxJGqFhNBU1VxR2h4OA==
X-Received: by 2002:a17:907:6e89:b0:aa6:538e:a311 with SMTP id a640c23a62f3a-aac2b28eee7mr5003930466b.18.1735902722233;
        Fri, 03 Jan 2025 03:12:02 -0800 (PST)
Received: from [192.168.178.188] (31-151-138-250.dynamic.upc.nl. [31.151.138.250])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aac0f066130sm1894101366b.183.2025.01.03.03.12.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jan 2025 03:12:01 -0800 (PST)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Fri, 03 Jan 2025 12:11:58 +0100
Subject: [PATCH 2/5] dt-bindings: vendor-prefixes: Add Puya Semiconductor
 (Shanghai) Co., Ltd.
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250103-fp5-cam-eeprom-v1-2-88dee1b36f8e@fairphone.com>
References: <20250103-fp5-cam-eeprom-v1-0-88dee1b36f8e@fairphone.com>
In-Reply-To: <20250103-fp5-cam-eeprom-v1-0-88dee1b36f8e@fairphone.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-i2c@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.14.2

Add the vendor prefix for a manufacturer of EEPROM chips among others.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index da01616802c76830a520594a69bd6a2e0231df0d..7e743a9f638dc9623f73a31cdc4b6cc899cb3320 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -1204,6 +1204,8 @@ patternProperties:
     description: PulsedLight, Inc
   "^purism,.*":
     description: Purism, SPC
+  "^puya,.*":
+    description: Puya Semiconductor (Shanghai) Co., Ltd.
   "^qca,.*":
     description: Qualcomm Atheros, Inc.
   "^qcom,.*":

-- 
2.47.1


