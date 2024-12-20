Return-Path: <linux-arm-msm+bounces-42936-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id F08559F8E14
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Dec 2024 09:40:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9039B18895C8
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Dec 2024 08:40:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 28EFE1A7AD0;
	Fri, 20 Dec 2024 08:40:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="XAZh3p8v"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BA301AA1F1
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Dec 2024 08:40:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734684006; cv=none; b=Ccj+7jeCB4Lf2q/qk5Shh2W7QsM3KQ674LK6bd5k09Du5gqraBUOwNUyFX9kCEqCXh3iB6+SBXfVM+nKgzuMi6TIULk+lqCbJX0uYDkWYVgYvWMrDADz30QRZAAgbSGS0++qfO+yhVpdunsFF0YRd9TzyUkuRMTc1qPcXWvIc9k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734684006; c=relaxed/simple;
	bh=z2MmtHXffncpgQV5SGtuXpmxrIzxSUW5JKjS/Vk7hbw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=NhntfbnRNGbA/hWAiLHFkQ46Xs6YMEyYv+eOfY1sQVZU/SF13LwpFrycimgO2+11AnQUDvUz/IxswQYnWT/rJus6mR8zkGuFHoNWmRwjm2JqDP8cGGdoYvZ50eHwQfjP/GnFbdW1WemD/KGIyZU0m2np4HwijYcdLh9ecC8yxwE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=XAZh3p8v; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-aa68b513abcso322686966b.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 20 Dec 2024 00:40:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1734684002; x=1735288802; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=DU8qnxu3omGz0KQc/BKrW4isuAYnH4fQJBdHmtp6/ZM=;
        b=XAZh3p8vEbeNR7/s0XXEEN5Q0tF9EEyUOEc36l1+VLqp4coWaxCvIOov6/Z+14oRUs
         jrrwGr8Pr7bWQC+FAvXDH8AhSTt/qF4+H1OuHhMHuk/5IuwqZbYE56XtIE/gRkYu126O
         59SVrom8tTGHU8i9bbmnEtXehWXYzDI3TAYNXe9A4WI6MXo5e7jhuBeQVCnbJxYP3jlz
         AadagYtRWXbDK0kLojQWM96rSZHLwg+WbbF+prK4gw3ORdKgoYzEX63L83UGh0ZgaLjq
         gHs8y+zigq8ZS2BbvtuUiR/S/lo52/dyk7WJrqa/vvsO0CtoV3bswDtifIhT3sB9E47w
         k2Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734684002; x=1735288802;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DU8qnxu3omGz0KQc/BKrW4isuAYnH4fQJBdHmtp6/ZM=;
        b=nXJYpSof/eV45acHzf2zlwOU2HgwSoGP1AzH32OxsVeKafFkXzCdNMwZPKpCLWc500
         mAsohZlGrX5Qp2cuytbaKm+td8GNFp1W46o/vzI0IRePAKHsKGk/9rgaIfft+6vAHJK6
         n3M3HoBu1lXD8iEwZ+dgbPIQc0mBypFDbwtj4sL68MEIqPOMUlb/niSGKjTdv+AgBSmp
         1ztrN/QJgDDXR8874Dbff1l4UppUYoCxfMKqwQ7shEf1b4dII0u/p2eyNdzBKOrMTO+a
         93xVX4uggv6VO1myaO5N+zI9eWX+ErEelwrjs663jc1cGwn/Rpg6mbgZmKUV2/oYNTIX
         pH4Q==
X-Forwarded-Encrypted: i=1; AJvYcCVguDO6Z7wX/cLHLKoiDqkQupFL78zD5jbXP63xmKmh/LuAtlLsob+RytnWAcNOJftjvai+fYQXFHOBJQE8@vger.kernel.org
X-Gm-Message-State: AOJu0Yz9o9KzlpCwwfSyOVVYiA9E+2OMd/I2YJX+yu0YAB259F1b+F4a
	z4rKbD6hGAeaW4KBIlIn4P52rpaZ5j9m1RIs3fmIGWdq9GItE3ZK2SEuwe1W+Oo=
X-Gm-Gg: ASbGnct/3FNPzi9RgupE+mlTK8wADL+wSUCRuvqIK+DQ9jkw6IEkNWaslPpyo99PenX
	6h4De1LhUbXEmSSuawsj24+1aM3WxD0QpcgEec6QtY0wSNKBcBOAnOdgDgwPsfLBj37lXkxwBRY
	sMK+Y4lOdq+5vB/IVwJF2WcL6EltvqzEdNpPPaGv5CilYsczWhh8ILg2hRVKIM/A/lHuAAlDNVu
	Oxppqlkc4OqUWJfc/m3aoHUdvKD+5qsj8UtWgLxCdL+OD8F+grWxPb37TxgLmJjrwvDqaAHrZ17
	A8fpDYG4na0F1vUVj5mFRwPDQNP44w==
X-Google-Smtp-Source: AGHT+IGB7HjxSdBTc/JxWWcal5m/SrHGgIfiH6YzvfBAk3Tw2A74/nQX/OQ2p0tJ66arvtQwzZGeOg==
X-Received: by 2002:a17:906:c115:b0:aa6:6d2b:cbeb with SMTP id a640c23a62f3a-aac2d446f89mr151128766b.28.1734684001634;
        Fri, 20 Dec 2024 00:40:01 -0800 (PST)
Received: from [100.64.0.4] (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aac0e82ede9sm151802466b.2.2024.12.20.00.40.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Dec 2024 00:40:01 -0800 (PST)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Fri, 20 Dec 2024 09:39:44 +0100
Subject: [PATCH] soc: qcom: pd_mapper: Add SM7225 compatible
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241220-pd-mapper-sm7225-v1-1-68f85a87288d@fairphone.com>
X-B4-Tracking: v=1; b=H4sIAE8tZWcC/x3MPQqAMAxA4atIZgMx/uJVxKG2UTOopQURpHe3O
 H7Dey9ECSoRxuKFILdGvc6MqizA7ubcBNVlAxM3FTOhd3gY7yVgPHrmFofF1bSazi7UQ858kFW
 ffznNKX3FT9OeYgAAAA==
X-Change-ID: 20241220-pd-mapper-sm7225-8bd30fa6cb07
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.14.2

The Qualcomm SM7225 is practically identical to SM6350, so add an entry
using that data.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
I double checked and the Android builds for this platform also have a
.jsn file for the equivalent of &mpss_root_pd_gps but this is not part
of sm6350_domains upstream.

But I actually can't find any evidence of this actually being used in
the AMSS sources. Just some Android proprietary user space seems to try
and find 'gps/gps_service' but nothing relevant for 'msm/modem/root_pd'

Should we still correct this? Everything appears to work as expected and
"#define DEBUG" in the driver also doesn't show anything being wrong.
---
 drivers/soc/qcom/qcom_pd_mapper.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/soc/qcom/qcom_pd_mapper.c b/drivers/soc/qcom/qcom_pd_mapper.c
index 6e30f08761aa43da131a00885b2cc5e95960bc7c..d98738fd7c6456eb6c4ae265437363d2b8fb952a 100644
--- a/drivers/soc/qcom/qcom_pd_mapper.c
+++ b/drivers/soc/qcom/qcom_pd_mapper.c
@@ -553,6 +553,7 @@ static const struct of_device_id qcom_pdm_domains[] __maybe_unused = {
 	{ .compatible = "qcom,sm4250", .data = sm6115_domains, },
 	{ .compatible = "qcom,sm6115", .data = sm6115_domains, },
 	{ .compatible = "qcom,sm6350", .data = sm6350_domains, },
+	{ .compatible = "qcom,sm7225", .data = sm6350_domains, },
 	{ .compatible = "qcom,sm7325", .data = sc7280_domains, },
 	{ .compatible = "qcom,sm8150", .data = sm8150_domains, },
 	{ .compatible = "qcom,sm8250", .data = sm8250_domains, },

---
base-commit: 8155b4ef3466f0e289e8fcc9e6e62f3f4dceeac2
change-id: 20241220-pd-mapper-sm7225-8bd30fa6cb07

Best regards,
-- 
Luca Weiss <luca.weiss@fairphone.com>


