Return-Path: <linux-arm-msm+bounces-62359-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BA4EAE7C73
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Jun 2025 11:22:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6102F4A50C1
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Jun 2025 09:22:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 820032E11C4;
	Wed, 25 Jun 2025 09:15:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="4l3WZCcJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C616F29E116
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Jun 2025 09:15:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750842911; cv=none; b=ZDu3WrlQE/cUMhxltC/PrYUAEO3PMxPDKoyVYNp+l3/8ehMWcFy2S4B9USc6LLfr+yjZMEN6cyHfMw4B2U81woiAbvRqoBUwjVAqU3xvelUYXJU5ZF/XNYwxqa2xedzGSAKZSgrXWuagFmP5dEvjkq7GuQY0d+CnYhG1KzV1u/c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750842911; c=relaxed/simple;
	bh=ga1S1Xr1XwnMLdKu7zfWrQr/T730QEOJZ68b87o6lys=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QxuBQSfSIuDTGQis5L7gkjr/BXMXe2q66Df7Z1yX/L1RThsQKNlcnfpbU1WUjNvI++OAFoyCgcx63pm5jzl9bD6xqHqXXLYt1hLZuQ5AyNgUt8ibpIpgJVK1iCV776EAdlW/I7wqt2cX3KTkKRvcdKwjeKzlC8QsODEcVd6xKnM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=4l3WZCcJ; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-60c5b8ee2d9so278293a12.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Jun 2025 02:15:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1750842907; x=1751447707; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZUNu7081NdSEDseAX1Y3e1QHYtmHZCwU3VvPUFRPHLM=;
        b=4l3WZCcJUQZsb7YoW3qY4HX4BeJmjQ2e9BmvSP7DvoSr2YiXZ7Ccln60wxVihpNoeA
         KZbxjrJtFbUXcGRAaDqRqzuw9Zx1mRp6d15FZptaychRuwqtGE7QkhPoP7Of27SUuAs/
         pHWe9eNGxWrD3Sz+bTpB9uDNU2PMgflqeBZcPgWWzlgGIjBvmFJbqIdGCko49Zej+Imz
         f1TihDLU7tDZZIzbnkyh7W4t9HFkE4x64zIzg7jWAWOgWtEpQ0fSabryNmhxsh1ZIlre
         XUhs2jr0c5W5POEyfBn8vfxBHIxYhT0/k47V2v1YrZ9uZnml8oM8kiNanCoGSfTLnlS/
         FUvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750842907; x=1751447707;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZUNu7081NdSEDseAX1Y3e1QHYtmHZCwU3VvPUFRPHLM=;
        b=uN98U5OVGZqqcjME83qbxQ3of35L0/GMWOISzgZgkw7LDpPgDYfAVilT6KUcqxX73h
         aBxmESnyL7fedQumb0Vbj582vdNQo8kSuKH799pbxrFyIn8p61RDWOVlsf5iRSxXf6FQ
         HvwVC1tYySZvzXJPwE0/J9PqZ/UaVSdf2mGH9rkDw99OWb3sPjteXD35oZsb5KWxLL+L
         ge3143Fw/+8oHMCuhfMJuDngMwWErW86oIprEl+h9pI9P80okpC0O/DA1oWz/rpabr3z
         YgxWqy9uOh0/b3p4bbxWL5up0n7yv19nlPLDjKMumYScjT3qs6hekEmzdpbKYKlS8pVp
         4NXw==
X-Forwarded-Encrypted: i=1; AJvYcCVSXK8+Hqk02jNKySgO/aXk2YSOQ4yUGcMlfeBKpBQlmhmMex+55JWzTZ6H4St54QXSShzoBqBgad9JrQNB@vger.kernel.org
X-Gm-Message-State: AOJu0YwO2vCKs+xzD+tBXkaB7yKAuzbqv7gvr+rI3EqVp/N+EMOwhXZg
	SEsgzRRJD+qamJHTiONWhKwgvfsEtwMoj7ae3B99ne1slOFqoQv77OdFt/kx/jBqHI8=
X-Gm-Gg: ASbGncv9S7iETz8y621Dyq4CzPDNix/EvQeY07voXNNdPIg6IuzwsODN93p8nAaF8d5
	LC9vQ6FUV6/SS7Y35Hg1odiheuWFU19i+/B80iUpAuGbw6fTR1G/DocGi6YMcpeazk7+DrMlZng
	GCxhmm1lbyHwydGJZEe1s9ah5Y2ynwdFJHK4Z8xlI5+FCzadMNi8biyIN8GHnbX4fbsxoza1PDN
	ZNrdLSPiR0o6Tf2X2Jt28wSe5LDwC736Rqym7nwPPe02GwOyY0ofuItquzAHLkHEEq6oZS0Jjjd
	dulFXddM/DYUFsSZGB+xYlCFCig54iI1/W0K4sKmXQAETe+TznZfVEy8cEp3w1SsrLs6xLk9wZ1
	qnIlOJlIu5a6R5NVICIjCc1n/4TxZdV08
X-Google-Smtp-Source: AGHT+IEuwwPgZRVwpV0E5VzCi3XFCUhbcyDfrIuNNO6Kwzrn10Xq2xPkywwIm3YPQY5laniWK8XBgw==
X-Received: by 2002:a17:907:970b:b0:adb:4523:90b1 with SMTP id a640c23a62f3a-ae0bf01a47emr226738466b.23.1750842907077;
        Wed, 25 Jun 2025 02:15:07 -0700 (PDT)
Received: from otso.local (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae053ee4c2bsm1008972266b.71.2025.06.25.02.15.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jun 2025 02:15:06 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Wed, 25 Jun 2025 11:14:57 +0200
Subject: [PATCH 2/4] phy: qualcomm: phy-qcom-eusb2-repeater: Support
 tune-res-fsdif prop
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250625-sm7635-eusb-repeater-v1-2-19d85541eb4c@fairphone.com>
References: <20250625-sm7635-eusb-repeater-v1-0-19d85541eb4c@fairphone.com>
In-Reply-To: <20250625-sm7635-eusb-repeater-v1-0-19d85541eb4c@fairphone.com>
To: Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Abel Vesa <abel.vesa@linaro.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1750842904; l=1083;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=ga1S1Xr1XwnMLdKu7zfWrQr/T730QEOJZ68b87o6lys=;
 b=8ytXcaweUPvgAlxdOOzwHq/Lo4rL98hebjV+yYGy27o+H8VskHWgSQLto1TFmtiLWV64CnvTb
 hsS6OQkxPVLDMP9wTarvkEDCDNQLNLFZx76E2jESFwtOG5cmMcEznGt
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

Support reading the FS Differential TX Output Resistance Tuning from
devicetree and writing the register, as required on some boards.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 drivers/phy/qualcomm/phy-qcom-eusb2-repeater.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/phy/qualcomm/phy-qcom-eusb2-repeater.c b/drivers/phy/qualcomm/phy-qcom-eusb2-repeater.c
index d7493c2294ef23e37e484019a49ddf7b3d6a6a46..61594739e5b12706775622e1f76af6ad5d2d29bf 100644
--- a/drivers/phy/qualcomm/phy-qcom-eusb2-repeater.c
+++ b/drivers/phy/qualcomm/phy-qcom-eusb2-repeater.c
@@ -136,6 +136,9 @@ static int eusb2_repeater_init(struct phy *phy)
 	if (!of_property_read_u8(np, "qcom,tune-usb2-preem", &val))
 		regmap_write(regmap, base + EUSB2_TUNE_IUSB2, val);
 
+	if (!of_property_read_u8(np, "qcom,tune-res-fsdif", &val))
+		regmap_write(regmap, base + EUSB2_TUNE_RES_FSDIF, val);
+
 	/* Wait for status OK */
 	ret = regmap_read_poll_timeout(regmap, base + EUSB2_RPTR_STATUS, poll_val,
 				       poll_val & RPTR_OK, 10, 5);

-- 
2.50.0


