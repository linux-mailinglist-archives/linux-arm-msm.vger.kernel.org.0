Return-Path: <linux-arm-msm+bounces-64271-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B38CAFECC9
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Jul 2025 16:56:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 82E197B67F2
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Jul 2025 14:55:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5784F2E7BB6;
	Wed,  9 Jul 2025 14:55:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="G2/wTAhW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 550122E62C6
	for <linux-arm-msm@vger.kernel.org>; Wed,  9 Jul 2025 14:55:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752072929; cv=none; b=BUI00/aDWFJtuYo+8TX7yqkRRL4B+7ndJsfdplTIkQqVD5wYxZLNBfcsbsrc9RUDEwTPgqKh7GO1ybdpP5lLFdSr0zZetwvJ1YWvN6xmt1tFvLrNFtreGJNmD7Kyo2nEkalvfxNDn+EA21HiyN8ZNrH0h4WjxkUX5ACpzcFKxY8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752072929; c=relaxed/simple;
	bh=JjK37/7ou8Ub4yuQzbdrYu/+a8HXwLFQlJ7GCGIoSKo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=uf/7mP0Lmqj4YK1mcht5MEpCt9LIrItREpU/gxpNGI0QtBx/5nIkM6OKJfAQ2jwVLY0a/WgY/8nvREwvOg9PazRX61nRDRccOfuoyL4jWMOKaboIl9Lr9eFWJdS7bVcV6bU2G/BTA4IbGOJ+Ut/KOoUHR309Pe2VfALFD//z144=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=G2/wTAhW; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-ae0de0c03e9so965886666b.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 09 Jul 2025 07:55:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1752072925; x=1752677725; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FqUnckrV2DHR0JIRkRD40uIY/f6Qb0J4rvTjJoaYqS8=;
        b=G2/wTAhWzSamOvQZZmw1tZalAIExmzLA92jJ4s96G2FxsX9D6IDLry+yOxzIPIiFkL
         cpbEwPnisAa89f0FULNEFxVtHK04GId/bjyb5Ith3GQFCmxLbYDXc95xl+RCwGM88146
         teocst8VOAlfrJPyLY1nI4IRSLz4MnYIHUJ3sU3/WN3qrXAgb/WVEkY0ppQsjAcoQnx/
         wMoVGaAhUVOV8Mc8+CeO0SKGSZrtll7RWwZrjUniH5mlioCtIKj0AukzKMcY9hIZOqvZ
         ZC8ub/Epl9gA5wnH1dp9L3ggx0a8lM0VzhxyxW80sSRC4269Wrp+YXAe8PbmeQJg2mic
         Gb7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752072925; x=1752677725;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FqUnckrV2DHR0JIRkRD40uIY/f6Qb0J4rvTjJoaYqS8=;
        b=aAi0TxY+6ziYaeZOiwim+IiA4UgrAkb0Zo8s+A6Agcdv78JOIEc3mRLvxaBF7GQzpm
         2zR52SQl0azSoO1ciAg1RJNr2d5tdeVjkcR5lPwXPOswe0HADR6RNMPl6c6QLOYKYKQ9
         5qpx9QKzb4uYnNURzXxrnlrO+A13gtR+lOgeduW0VnKm7US0kStbA+SUl3+zMjQ3eJPc
         bj0CT7h1Q5rOtqSFW8oCW312mJghTnG08j+OEjlElw5eFiPO2YwdEaukYUpkbuUQ3xH7
         bb+O6l9E7W6UbK980LXDF/f3+agIAll41C6X8aXVbvH1cPQ7+8ybmmB6dxZI/XfQ5JsD
         fhfA==
X-Forwarded-Encrypted: i=1; AJvYcCXRlviGGFDFX9w4moAArK8MRImVWrVxksdgpkX7iLrMwT6b8Iru3Lmw5oJrRomxA7qBkocTM9JiX8P56oiF@vger.kernel.org
X-Gm-Message-State: AOJu0YwMNIGd2aTHnrsrLy7etXXeDA4X+MHWQNLi5qS+Y9SFQcnqewE7
	VFdm54VEWMk/NvUCu41rPRhOaZiwEqX/ONBPdFkSf5bBAdzz7wqMxPWlXceIdZUC7K4=
X-Gm-Gg: ASbGnct/N2vwlYbj1ZASu/71S7fnY7UqoGdlbQEqOUYVV+gDG7YxyN9DwvbpF4pvNYZ
	vMTQXegCbqxDrmIJpwgSfx0iQWvYh3vOfvtB/2kd0JPlohKWi2nGYfPMLBL3J9ELTYUGv2+pn4C
	Vzl8QHQiqpuB/ULFhLOrStD7dgYpxkV02XyGjV78BhPFNiDWxjwD1DQKWqZOkd21gmVd90kd5rA
	VfTkACI1eXZXqgH8JcG30f77qQPPY7WoN5X/ds8azw6Aau5+i5VOlbehweHogSVxOwMR+5lXKxb
	SoQESnCK3cIbMirt0j9T72D93BOQpwfKGZwNHv2TJBSg3XT5nB1W6bCa92Czc2lucJYmqWWlrZk
	YlHo+feH+ZepJRSS7YPZUNDsZvigDGF/e8zxG8UywZUk=
X-Google-Smtp-Source: AGHT+IHYj4k/qDDYaJjD9Pvlt5hW+aGvDzyWD8yDesgLcfq/4kuKmOi8Z6ujnsY58oHIu98v8zVcqQ==
X-Received: by 2002:a17:907:ea6:b0:ae0:c976:cc84 with SMTP id a640c23a62f3a-ae6cf6128f6mr309110666b.24.1752072925389;
        Wed, 09 Jul 2025 07:55:25 -0700 (PDT)
Received: from otso.local (144-178-202-139.static.ef-service.nl. [144.178.202.139])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae3f6b600ddsm1116795766b.158.2025.07.09.07.55.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Jul 2025 07:55:24 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Wed, 09 Jul 2025 16:55:15 +0200
Subject: [PATCH v2 2/4] phy: qualcomm: phy-qcom-eusb2-repeater: Support
 tune-res-fsdif prop
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250709-sm7635-eusb-repeater-v2-2-b6eff075c097@fairphone.com>
References: <20250709-sm7635-eusb-repeater-v2-0-b6eff075c097@fairphone.com>
In-Reply-To: <20250709-sm7635-eusb-repeater-v2-0-b6eff075c097@fairphone.com>
To: Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Abel Vesa <abel.vesa@linaro.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Luca Weiss <luca.weiss@fairphone.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752072923; l=1187;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=JjK37/7ou8Ub4yuQzbdrYu/+a8HXwLFQlJ7GCGIoSKo=;
 b=a4O39biLPv1ckqefPreNqneOFtzOmXRAtTy90P3R2Po9bjTLgvaXw8O0srrHGpicIbkBCZwtq
 GMA3OKt/wNkAXcOlHdD0WJfhA5Q0vh5eGp6Mfjp75rWf3jKut3x0cbF
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

Support reading the FS Differential TX Output Resistance Tuning from
devicetree and writing the register, as required on some boards.

Reviewed-by: Abel Vesa <abel.vesa@linaro.org>
Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
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


