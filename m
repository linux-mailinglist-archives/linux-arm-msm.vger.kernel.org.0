Return-Path: <linux-arm-msm+bounces-29359-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A6C5295CCFA
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 Aug 2024 14:54:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5EA0E28939A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 Aug 2024 12:54:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2A2B0189500;
	Fri, 23 Aug 2024 12:51:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="rLjV/g9d"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BD78188A06
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Aug 2024 12:51:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724417506; cv=none; b=PIePTI/WycHV4svuoBhYqJ3cICwjNGXL13QxHeFXKq4LVx6FSr32DnD04ERRwxOIkNmqiOG5YiA0FaEdAs2V5tfnl6DPCj8neJirZ6uZ2lPrvZqBpi/ejocW+vm71GLeCLs48EFWUpvcZ80cafWuUm/7d4vQL4bVUHDsbvgeJOc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724417506; c=relaxed/simple;
	bh=dEBqeOHv8ua+SDX2xXix8P9X1j2XB3X9nrWuqhTFOoY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Cv9i2I2/q99BcBGYOs4JtvMfBB8GE+IlcWXH0VqZUGIBWJRqzotVTTeiTM8VB3OySYWT9YgNu4kKm3e/E0/EC9EdDHHVDC78awHZq6S5GqxTHGiYbYp1od2NTo+har1/K6H4XM4c/vQ1I2eMRSbLKDXL7w3afcuanFIo7K1PK94=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=rLjV/g9d; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-53347a8a28eso332373e87.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 23 Aug 2024 05:51:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1724417501; x=1725022301; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LWSvBRmFgwiSd3F2eMmjx+EmKWHuqV0doCXLi3Lc+dM=;
        b=rLjV/g9dkqxx0ReaRF1YIwZ0GK2dC/2fXQ8QASCyXpd4TNSye0MG8SNR26u60z1vF3
         Ao2h0wKP+SJpTlpGEOHWOSWZqLq681LWqLxc0DtCOFBu0meklghn4TfjmB8y6AkmG4ND
         iRkwj1AQFmZif7+xJLUJQq3KtqU68fYH8RYNRo4Kc0yGawzSpSqZ3UolyFRQxzhmM58B
         UA3fWx3QnhdTjyrBp1HYOGJ/BpwcyEHK6qN4I6LqSRgrSuqMIkRPmKMEgtFM/ma/9+As
         QrDuibI2JX9kM5l9/3zQw90qGwL61OFKixi6dJCcP88/rPnf1AE03cYN73rpEk7gBuA0
         ph9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724417501; x=1725022301;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LWSvBRmFgwiSd3F2eMmjx+EmKWHuqV0doCXLi3Lc+dM=;
        b=sWxzbgikAVV2v+MdeJakPNzgTTGHsOTdbJ9LlHXW02rz11WuP8YQC+KSsAOX5hcxzM
         Zh1FrMvxCdrQbmcC7A9EhhN5ORvI75rOLgMRGDNEZisWoentmZ4y8PqnvAgDfxpcaVXR
         c4XC3VgcQBMXcGiYHI7GhmrYTTJJFRIi+Nt0f0JXYzVmT2zyCs0BBtDgsPPKyqalnfjN
         nvVXtPKj5SJx8FI5zcIDCuUV1GV50g8tJsCBFA4jQa3W/A03CTJWA9nYtuU75zZggbUo
         xdHZ0hKMSoM/4zFKsJIJ+4r64y54HoKrRcASTnqdYlpECZND4NMKc6AQ83bGkVZSUr6P
         t9PQ==
X-Forwarded-Encrypted: i=1; AJvYcCV2UicEt2/2AiKYSEL8y1FQJ1qLUNLIDnneYE4hrrz8MVniPeu1ckOBsluxsvNLXApKiFJp/Y48L5ECnTI4@vger.kernel.org
X-Gm-Message-State: AOJu0YxoYBa1vF5fpulPPS6r84stLl0jaDSfcNPucRouK8O6YxVGZZtM
	6lW+li88JtAMr+DwLcuebzsUB/BsQLflVvUVqoIZ1GYvd4rDMQz9KxUBhJWC67U=
X-Google-Smtp-Source: AGHT+IGLzwRApWGomk3qx7J1YXzN02rn4ed9Sav7TouTOUXRpc+oqNnzZE3qUGBBhBfveVxwQKMi4Q==
X-Received: by 2002:a05:6512:1592:b0:52f:c142:6530 with SMTP id 2adb3069b0e04-534387c4976mr838734e87.6.1724417501464;
        Fri, 23 Aug 2024 05:51:41 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.222.82])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a868f4f384bsm255931666b.192.2024.08.23.05.51.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Aug 2024 05:51:40 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Fri, 23 Aug 2024 14:51:12 +0200
Subject: [PATCH 08/10] pmdomain: qcom: rpmpd: Simplify locking with guard()
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240823-cleanup-h-guard-pm-domain-v1-8-8320722eaf39@linaro.org>
References: <20240823-cleanup-h-guard-pm-domain-v1-0-8320722eaf39@linaro.org>
In-Reply-To: <20240823-cleanup-h-guard-pm-domain-v1-0-8320722eaf39@linaro.org>
To: Ulf Hansson <ulf.hansson@linaro.org>, Heiko Stuebner <heiko@sntech.de>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Magnus Damm <magnus.damm@gmail.com>
Cc: linux-pm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-msm@vger.kernel.org, 
 linux-renesas-soc@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1922;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=dEBqeOHv8ua+SDX2xXix8P9X1j2XB3X9nrWuqhTFOoY=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmyIXLBp4hGT8aL0uXmCvXIwXYIZJjssZSgqVDO
 1PWGdPkEI6JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZsiFywAKCRDBN2bmhouD
 17+LEACYB2RFCyuya6wvvIC2WOhsGUn/MwYWW26D+fCbIN3o0SrRL0t2RUDZEA6ix5++ngYOHHz
 QzLYgCb0NHUJyStgjAPq4rdjorCAfCMNPzPRzcKMz7Ni4uLeVgMM7Y5K79/3fJ95/Xm5iKCPxoe
 3HSnllESICwowfturIQwU2ysa7Ge0sRD+cmfbl09MpqsieJTpUb4bDR5UZWGQe7c3za/UBg3lmu
 3gyghMwahQlUz6gDqQP6MUtcpRBn1lXXZhzrvp/V6Qt7fAcC27W0AhVj0rJm33YiJJfSFc3Ofjc
 ztvOWf2PN9LIjEEXuGVN99lJ3FNoiBGv+9k5vEkWRCbg3jaQdZGUfLeM+vQ+u8XH6NPzGj4ysae
 FVHwHV+i/7fjb3Juob8j4ggZGkBGZfvikKcr77+YRYu6Lx7cflUhRU2MFQHi27YUL0kV9FLZq+V
 tHs4IhWcQk6eLe1IWsqjBAOhDSKeXHuTWXJfNOEz0Jy+8aFrGwqfg1lhAS9OC/v4X1en+mmoDty
 IcGGsSXywdd7ALcchH6LZL4snqzzWY89VlAyuiq70LeUbCKPU3KzBFIuahkawgYnuUu73eqKSEP
 IWvOoXAm/T0Jo2MFaLy499xsUXDMPZKRmx4DA9rOM8hTxlZJ+Exu9F5QoZJVQXHK1tsmeYlGacT
 8GcUEqo80oZTQ0g==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Simplify error handling (less gotos) over locks with guard().

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/pmdomain/qcom/rpmpd.c | 20 ++++++--------------
 1 file changed, 6 insertions(+), 14 deletions(-)

diff --git a/drivers/pmdomain/qcom/rpmpd.c b/drivers/pmdomain/qcom/rpmpd.c
index 5e6280b4cf70..0be6b3026e3a 100644
--- a/drivers/pmdomain/qcom/rpmpd.c
+++ b/drivers/pmdomain/qcom/rpmpd.c
@@ -1,6 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0
 /* Copyright (c) 2017-2018, The Linux Foundation. All rights reserved. */
 
+#include <linux/cleanup.h>
 #include <linux/err.h>
 #include <linux/init.h>
 #include <linux/kernel.h>
@@ -1024,20 +1025,17 @@ static int rpmpd_power_on(struct generic_pm_domain *domain)
 	int ret;
 	struct rpmpd *pd = domain_to_rpmpd(domain);
 
-	mutex_lock(&rpmpd_lock);
+	guard(mutex)(&rpmpd_lock);
 
 	ret = rpmpd_send_enable(pd, true);
 	if (ret)
-		goto out;
+		return ret;
 
 	pd->enabled = true;
 
 	if (pd->corner)
 		ret = rpmpd_aggregate_corner(pd);
 
-out:
-	mutex_unlock(&rpmpd_lock);
-
 	return ret;
 }
 
@@ -1060,27 +1058,21 @@ static int rpmpd_power_off(struct generic_pm_domain *domain)
 static int rpmpd_set_performance(struct generic_pm_domain *domain,
 				 unsigned int state)
 {
-	int ret = 0;
 	struct rpmpd *pd = domain_to_rpmpd(domain);
 
 	if (state > pd->max_state)
 		state = pd->max_state;
 
-	mutex_lock(&rpmpd_lock);
+	guard(mutex)(&rpmpd_lock);
 
 	pd->corner = state;
 
 	/* Always send updates for vfc and vfl */
 	if (!pd->enabled && pd->key != cpu_to_le32(KEY_FLOOR_CORNER) &&
 	    pd->key != cpu_to_le32(KEY_FLOOR_LEVEL))
-		goto out;
+		return 0;
 
-	ret = rpmpd_aggregate_corner(pd);
-
-out:
-	mutex_unlock(&rpmpd_lock);
-
-	return ret;
+	return rpmpd_aggregate_corner(pd);
 }
 
 static int rpmpd_probe(struct platform_device *pdev)

-- 
2.43.0


