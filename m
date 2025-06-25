Return-Path: <linux-arm-msm+bounces-62387-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 93065AE7D09
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Jun 2025 11:33:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 87E877A92D3
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Jun 2025 09:32:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BD1452E0B42;
	Wed, 25 Jun 2025 09:23:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="QVvl/9li"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CE7C2DECD5
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Jun 2025 09:23:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750843405; cv=none; b=kWAWuivMES2fOSQi7goBoL4tRBgp4OifxSiFIVqgJAbVUgS+nJxtfW72jqgPDDRjycNVjOjP7SYqa2i1DrMKCuJ8du3XcZDNXmUj5y9L1TdOyGYz6FmQBenpZLBncUSHBYimcm9gLDLPAATdc4fKjcjiOxA9QwQRN/moT1LxjVk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750843405; c=relaxed/simple;
	bh=QF6zOzPisaNRx6UkDEnfUjzHboUeRh3pRf3riJuZ07g=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UY/nkpEiWM7e1JOA8dpWK+OG68hFGRtjdhJhqFwk7onH+v5dPTPiM0H252VYvqY6uto8H2S05aZdrSVVs1A+3npI01FILhVt6gowrQLWZ5ehH/vIF+XQwCqG/8FR8V0h5HPDMspyepsfChifNR/AlchAlCM0o2XkREH1QuGoGB4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=QVvl/9li; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-ae0bde4d5c9so137871966b.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Jun 2025 02:23:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1750843396; x=1751448196; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TKX5DuiO7AzJ1dwZVvAVxWI3Xdt99v9P0wOhJICwjbk=;
        b=QVvl/9libTo5/a2GI0EJQbZpa2KCIvFYnDJqJU6G8gbDGzXg7f4Pdk+YkaMaHcXCAn
         Dj6l/mHZdMaMwic5f+ybWQS2qaOi0xLsKoZunJFNua7C6PREekpvnoFbLy4uoQ1x1yGm
         vbJB0WvFKXecgNYS8IsQCyPuT0CCWS3mkHs967Y30nfdiMFsV+w4gNkDCFSVZ7o9AddO
         mflARtdkg34SE8aNqu//ITfDRKJ7JZWibDXNFyvltw3yDDFDOljWHnauWLlPngd6v8QW
         BHPkErTQBFL4WrwnTjZ9D62AO3DvDR4pblHMwO1qiTzqL20mHx/yPrDKynfYErrzz5f0
         hvNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750843396; x=1751448196;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TKX5DuiO7AzJ1dwZVvAVxWI3Xdt99v9P0wOhJICwjbk=;
        b=qVihgDGVOszNLpOjI5jUs9dLBeeGvg999OYG3QBXtBGJjbfGttKciy+NDA0x9y610z
         g2zqyaOIueiIEyFnkvFUXTQSu/gICeBmXJTUkfIa4JVBA531IRhsktlBJtDUUlv7q4F/
         StGFM38ATfuUUVKO0p489hmBQE7lx5rG/pQzvAPYUX/CZUkmUzOhVDe4lyYG1Kf4NQYw
         TeIXDHtPBz4t3YZmhmSgiNjZw7TpiAeOpWlubQZ1SQVcZaKt/L0cT6APnvjgiJ4oMTtL
         4QpMSf15GFes9MS9aZQL8YZr7m2uLojTkrNItY2d7eDriwTg2wpV2Kh1yqFfFxV35YXT
         37qg==
X-Forwarded-Encrypted: i=1; AJvYcCWvk2heWUjR08Q5IN4ifsrvziFOSG6Bi0+Km7Ulom1jU37AGwC3iOAdKR/64uwMrpGkYbzGlS5AL1NCOq+M@vger.kernel.org
X-Gm-Message-State: AOJu0YyYC59DXB3W4Cv1R8DwuCK4IhMdiAZjnYQdsFIVnyj7GhmZ8kf1
	LuAsOilyyS4jnPWbWaXeXe7WlIZ9M1HNkYa3soSRB7sALtQaakO1PHFONLmdLtZsqEI=
X-Gm-Gg: ASbGncs5goZpxJFGvY9ss9nCDhj8IkO7Tffzs4LcN04WkPwln8z8qibNZN5/w8WCNYx
	m6BCzbrdXBcKHwuySIKP3HfMsPiY1FnEECM+jQXJSgjI6zUc+VN1Qy3E2Nv0UMJbbAYq/OTE1nl
	O2D7rGLQIYtQFZWBI9g6DesbiKWN5+tBLGIAS94DVkTr/zNtW+dN7MUSBK4s5SYcBKwDQA5HYKz
	d/vbC8+X3MPydYxmvT9ZpkJy+VIc/jHZsjM/bkKzegY8RMVYbfzS7nzpF/RvDQdp+Bifu3CSj71
	ubhXXJukD8sxTMho5SGVKZb0+Q/J2cIoLJpiIjjLGV34Y437U7S8gi1JLyLlbG7sw9G2bGrDQlq
	weFVH+YhuEftdTU/OhhXikdKjy/u52V+Y9d+U/S09Eto=
X-Google-Smtp-Source: AGHT+IGiDFBoDucTPjUqqaMImeHSSI/9lZCbdCTgquH7Z0S3KEgQQwP7r3gJyT916kpPzaeBdGItbw==
X-Received: by 2002:a17:907:9808:b0:ae0:bf55:5c48 with SMTP id a640c23a62f3a-ae0bf55634bmr217592466b.7.1750843396185;
        Wed, 25 Jun 2025 02:23:16 -0700 (PDT)
Received: from otso.local (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae0aaa0a854sm270277766b.68.2025.06.25.02.23.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jun 2025 02:23:15 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Wed, 25 Jun 2025 11:23:03 +0200
Subject: [PATCH 08/14] dt-bindings: thermal: qcom-tsens: document the
 SM7635 Temperature Sensor
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250625-sm7635-fp6-initial-v1-8-d9cd322eac1b@fairphone.com>
References: <20250625-sm7635-fp6-initial-v1-0-d9cd322eac1b@fairphone.com>
In-Reply-To: <20250625-sm7635-fp6-initial-v1-0-d9cd322eac1b@fairphone.com>
To: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>, 
 Joerg Roedel <joro@8bytes.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
 Viresh Kumar <viresh.kumar@linaro.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, 
 Herbert Xu <herbert@gondor.apana.org.au>, 
 "David S. Miller" <davem@davemloft.net>, Vinod Koul <vkoul@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Robert Marko <robimarko@gmail.com>, 
 Das Srinagesh <quic_gurus@quicinc.com>, 
 Thomas Gleixner <tglx@linutronix.de>, Jassi Brar <jassisinghbrar@gmail.com>, 
 Amit Kucheria <amitk@kernel.org>, Thara Gopinath <thara.gopinath@gmail.com>, 
 Daniel Lezcano <daniel.lezcano@linaro.org>, Zhang Rui <rui.zhang@intel.com>, 
 Lukasz Luba <lukasz.luba@arm.com>, Ulf Hansson <ulf.hansson@linaro.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-pm@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-crypto@vger.kernel.org, dmaengine@vger.kernel.org, 
 linux-mmc@vger.kernel.org, Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1750843387; l=884;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=QF6zOzPisaNRx6UkDEnfUjzHboUeRh3pRf3riJuZ07g=;
 b=u4p3k6p/2j42YHb4XwcyOL+Rq/CqQjib4+cSu01z968A3xXWkhEPGtNDUd9b2G12MuzVho+Uv
 4c01+k5CLJPAHJpvg+Bz4qlPQ4Hme44CNKKgFxwQ8y5DARbiLPoZmDF
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

Document the Temperature Sensor (TSENS) on the SM7635 Platform.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 Documentation/devicetree/bindings/thermal/qcom-tsens.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/thermal/qcom-tsens.yaml b/Documentation/devicetree/bindings/thermal/qcom-tsens.yaml
index 0e653bbe9884953b58c4d8569b8d096db47fd54f..76b3d4ab5a793a9bd675e52a348ca2d62077cf58 100644
--- a/Documentation/devicetree/bindings/thermal/qcom-tsens.yaml
+++ b/Documentation/devicetree/bindings/thermal/qcom-tsens.yaml
@@ -65,6 +65,7 @@ properties:
               - qcom,sm6115-tsens
               - qcom,sm6350-tsens
               - qcom,sm6375-tsens
+              - qcom,sm7635-tsens
               - qcom,sm8150-tsens
               - qcom,sm8250-tsens
               - qcom,sm8350-tsens

-- 
2.50.0


