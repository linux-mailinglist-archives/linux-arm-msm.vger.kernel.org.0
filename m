Return-Path: <linux-arm-msm+bounces-5552-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E0D9D819C02
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 Dec 2023 11:04:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 95E011F21B12
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 Dec 2023 10:04:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C85A3210FC;
	Wed, 20 Dec 2023 10:03:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="RqkyeQwP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8045B20B15
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 Dec 2023 10:03:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-a2330a92ae6so481416566b.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 20 Dec 2023 02:03:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1703066582; x=1703671382; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+M37Gk5jRNqMp47nD911+Z3j4AfQxogLsJ1XWILEGD8=;
        b=RqkyeQwPh27q2oqsixI2DAO6PZnZ2BGTf7tumPWo6O7ApJEi5uMq5NwefQj18CBejo
         mEPFx9wGupEHTM8XQi2OvRFYVZj8lntAXKoO00LKo6qiaWOkMx036LmVcTd7MeX8AuM5
         NRFiCb0ZkYlBfTLkzBTHCl2wUYnPwMbodOJ9y9oVlMujgMTsuCcJjs9CK98+ITYKOaQd
         D/CpfKuvZvcvVUIEPkxJA3FQveFlowYELAU4hhyyZyS1tp8XQWw65BzcZ8YKYteAjbbi
         vSFLu0azaPTYQXTjpxxxG+mCl2TpiAkkRJoS98EjIqv+mX7KnTzbGijVbZquALlV8RGs
         1K/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703066582; x=1703671382;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+M37Gk5jRNqMp47nD911+Z3j4AfQxogLsJ1XWILEGD8=;
        b=ZQLjq7VR1RnCQrq4GFt6PEDfZCJiRwidsmrT6YlXe2gmeIRCcDSCkw1KMXTUU7317g
         qGN7IjGBGg93qGHbCr9p4BHnUf6ogLXfIvwVfhDY/i06rQ4H8nitZdtjcuAx4+oTVsrs
         i6TQBeLA7BwK2zBk01W0E0G8jyRb4sen0uThEX5yqSKiV2HgVdmXKRhpKmuUMCTjetHM
         7sDPcvLOUNTqxH51z2hMfSXCxeokMexg6MMv/DQYAsPeDF86X/Wrr58bWxxIhWAunc54
         TwynY6ehoWouDP+8qbckDrzpdmEG2E3MORKfHQQytaBr2CLVNP0HPuVMpE8x7N0ouARO
         c2Hw==
X-Gm-Message-State: AOJu0YweKkIA8pFCx9iNdxYvA9+6h5H7KG0buLsnc15XTooZTQ7kTgL7
	JxVrDG49seiPF9G5x/MR+ZejbqjXnZHH3Bm3k/J5Tw==
X-Google-Smtp-Source: AGHT+IE6RnGzfSqJ5qNfXoeA16Ix+LCcCFVb+QjU1QmFDJEfWbrcT83a9lPwifkatWlBG94o9fFFzQ==
X-Received: by 2002:a17:906:225b:b0:a23:53a0:af21 with SMTP id 27-20020a170906225b00b00a2353a0af21mr2751760ejr.113.1703066581853;
        Wed, 20 Dec 2023 02:03:01 -0800 (PST)
Received: from otso.luca.vpn.lucaweiss.eu (2a02-8388-6584-6400-d322-7350-96d2-429d.cable.dynamic.v6.surfer.at. [2a02:8388:6584:6400:d322:7350:96d2:429d])
        by smtp.gmail.com with ESMTPSA id f18-20020a170906561200b00a2356a7eafasm3718681ejq.199.2023.12.20.02.03.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Dec 2023 02:03:01 -0800 (PST)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Wed, 20 Dec 2023 11:02:57 +0100
Subject: [PATCH 2/3] usb: typec: ucsi: Add qcm6490-pmic-glink as needing
 PDOS quirk
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231220-fp5-pmic-glink-v1-2-2a1f8e3c661c@fairphone.com>
References: <20231220-fp5-pmic-glink-v1-0-2a1f8e3c661c@fairphone.com>
In-Reply-To: <20231220-fp5-pmic-glink-v1-0-2a1f8e3c661c@fairphone.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 cros-qcom-dts-watchers@chromium.org
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, 
 Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.12.4

The QCM6490 Linux Android firmware needs this workaround as well. Add it
to the list.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 drivers/usb/typec/ucsi/ucsi_glink.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/usb/typec/ucsi/ucsi_glink.c b/drivers/usb/typec/ucsi/ucsi_glink.c
index 53a7ede8556d..0bd3f6dee678 100644
--- a/drivers/usb/typec/ucsi/ucsi_glink.c
+++ b/drivers/usb/typec/ucsi/ucsi_glink.c
@@ -298,6 +298,7 @@ static void pmic_glink_ucsi_destroy(void *data)
 }
 
 static const struct of_device_id pmic_glink_ucsi_of_quirks[] = {
+	{ .compatible = "qcom,qcm6490-pmic-glink", .data = (void *)UCSI_NO_PARTNER_PDOS, },
 	{ .compatible = "qcom,sc8180x-pmic-glink", .data = (void *)UCSI_NO_PARTNER_PDOS, },
 	{ .compatible = "qcom,sc8280xp-pmic-glink", .data = (void *)UCSI_NO_PARTNER_PDOS, },
 	{ .compatible = "qcom,sm8350-pmic-glink", .data = (void *)UCSI_NO_PARTNER_PDOS, },

-- 
2.43.0


