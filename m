Return-Path: <linux-arm-msm+bounces-75808-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BBEFBB396B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Oct 2025 12:16:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0491D3C52AF
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Oct 2025 10:16:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D2CB830BBB8;
	Thu,  2 Oct 2025 10:15:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="fSGo9GlA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0D47308F36
	for <linux-arm-msm@vger.kernel.org>; Thu,  2 Oct 2025 10:15:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759400151; cv=none; b=OQsRAncfMudubD0KUWwI8Bx4vudS1yZ1bhU5JY18BZsNLmCn8cM+Vu6LIoqROwZcevoCQD3IJez1HwXh6wohBPKUQUBSsPD7V7KQz7mAFZPFQWLNW5jMYezDGWKrLh2WkQ/P58hYCYuE57W/ZWrA8F4QiATcUaW2W1FLRFnFqWI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759400151; c=relaxed/simple;
	bh=4S0fonwtNaMiRsMJskKUXGgiupKPbZ1yq9y5vaUwWQ4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mO1TEKCjR1QRMOB09jeEQ+/23C6oR0Jjr5Xx0Av1IrBMYex5V/a8AisarW7IlkJqaS5esPVWYj97BW48J+aBT27YNOlStGpV05Z1RvnbNz9tnpV61t1ABnX2IWSpfsmyKLLFEMjA5B1AlUz8S/rU0JePzU6GWnB4s9s8tGdURZY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=fSGo9GlA; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-634b774f135so1541001a12.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 02 Oct 2025 03:15:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1759400146; x=1760004946; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=k1OIQtBRu/WprhbP6faVFfcIfdDA6GpU6KASBlBkiMI=;
        b=fSGo9GlAkLMEQwx9ff1nnqJ/1E8cWgQP/BchZ2aGCoo4UACTCFMzdEzwKI+JCk4Pye
         AltjS1fNQaKI/8/S7ZQuP0OO5H9aoIP/eO8HnQXnUYXnknQbB6HI3IcAwdDeUhymzwXl
         z3hWTEvVvS51I1BQ/mDdA7Yq0bCr/qqrNQYIBahF0TU4ohyycDlf+ZwrKoZm0wmb3RED
         WQx7Kh2L2LRWNAna5ExGbF7fW60uxzG6ZEHE4kaWOKEDurkom5vx/V8lDb+zw3ZRnnwL
         VYCFNZ6alYO5hOCNK78Pmm+AnEBd1q07k+JSMbHYwVsgyCa3J00/6uXQumFJW5sycN3C
         5XlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759400146; x=1760004946;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=k1OIQtBRu/WprhbP6faVFfcIfdDA6GpU6KASBlBkiMI=;
        b=ujy6uDpM1T+qBPe1rKM8/bhqqRFRfPP8etfQcFKk9L15mdec0qH2oywdiouy4lYJZm
         oduS4loleV3KHfQ8g+lBBjpcwhzifaiJlqZj4DWRx9IjhFg+kC0yBmUjsWGdwee9du1z
         QHtFcf3Xs9ZskMbSsMl8qrOIWnf27ge4K5RnYxvpkUPgQIamZjb4YvcVTvoPQ+saEJ9n
         YvhzT2rTfER0MyedqIzoN64RhZcsQ0FEQyfkBEIDEcH58TbRxz4biCxF6Iai7SpzgCr5
         Yo8FbIoSKrMieLmcQOK8sjoB2gWzVVrJX0X3TEYf7LCaBcJEiZjvDrRCQsFFzhacVhsf
         bGNQ==
X-Forwarded-Encrypted: i=1; AJvYcCXksN8+Glqd3DoBevqb7oYuUwaDw8eG+7Q9fbEeGdM2tBQ8Tp5+A4zhQVUQIjAuoRuu0tHyKF3BBOKpqX66@vger.kernel.org
X-Gm-Message-State: AOJu0Yxy7INP6Qnb1ZmoYFhSQpFkBJiTcOQSFiiXwe9jfjK0xsz2WcjW
	g/5h3pMg2euLEg6wo0+uVI04JSsFGta9R9q6tMwXxPzsy9rZzVhp+ehBEeDEeYbkpFY=
X-Gm-Gg: ASbGncsjiHhTxvYPtUQGPuIpCxb/8nno5N+yMZPx/xpb4dCIL3YdNwPYkFPytoYTnta
	PpFkdWyu8sS3LBAUCugyDBTlYETNb4XPlEbLp27rej3fmwperf6cak6SCVucGBImsnw/yuf1KGP
	EsWCvjQQDruNq9xxmPqJAFdXLYaqWx0LO7xJeMvJIjpjhVYM3U5miBU1GiWJ6BVu2m7kaDWYqrO
	dHTbxGSm9+/enHntana9YL/qDVG+6Dd05x6ddK94RBUJ03W4qkv560XUblWxKGHOF+7sZyhxvSL
	vaydLSEMxngj6XmP8HAOeix8XaxlQA6PTV3Rr6MhTSomnRi+28d+aLNB9Scqpf+LZUd8bDPP4/D
	sGh3LoXs33zIZDl+j2NVuNpeO0d863uk3WbSoDfTJcdhOgoqkEhD223JNuuS6prJwc0Mp9uV1Hi
	UmnkbPxGnYVwWW9WjS2l56ytOhRykn
X-Google-Smtp-Source: AGHT+IF7ZbtnLWsvPJhQN1RSKQw+RDAp4xELO1JKJ0B5XI3fYprHLA3ovfGjHaxD/7jWkw7clR39uw==
X-Received: by 2002:a17:906:c103:b0:b42:f7df:a2f4 with SMTP id a640c23a62f3a-b46e94644f8mr865762466b.52.1759400146005;
        Thu, 02 Oct 2025 03:15:46 -0700 (PDT)
Received: from [172.16.220.227] (144-178-202-139.static.ef-service.nl. [144.178.202.139])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b4865e77427sm174862366b.36.2025.10.02.03.15.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Oct 2025 03:15:45 -0700 (PDT)
From: Griffin Kroah-Hartman <griffin.kroah@fairphone.com>
Date: Thu, 02 Oct 2025 12:15:34 +0200
Subject: [PATCH 2/4] media: i2c: dw9719: Add DW9800K support
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251002-dw9800-driver-v1-2-c305328e44f0@fairphone.com>
References: <20251002-dw9800-driver-v1-0-c305328e44f0@fairphone.com>
In-Reply-To: <20251002-dw9800-driver-v1-0-c305328e44f0@fairphone.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, 
 Daniel Scally <djrscally@gmail.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 =?utf-8?q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, 
 Griffin Kroah-Hartman <griffin.kroah@fairphone.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1759400143; l=2384;
 i=griffin.kroah@fairphone.com; s=20250804; h=from:subject:message-id;
 bh=4S0fonwtNaMiRsMJskKUXGgiupKPbZ1yq9y5vaUwWQ4=;
 b=OQkAvbTC0VB69piBjtPx6WV4d4BVHjc5nyvTAGrM7x9uvXVMxqQHHqI1k1gup8JsV4W4oIdYY
 jBiQtg/xFsABvz/OxeMwP76goePHsyKnz4O4MJO8F+38BboI/fQ4W+V
X-Developer-Key: i=griffin.kroah@fairphone.com; a=ed25519;
 pk=drSBvqKFiR+xucmLWONHSq/wGrW+YvcVtBXFYnYzn8U=

The DW9800K is a similar part to the DW9719. The method for operation is
the same as the DW9719, but the register set is different. Add support
for this part to the existing dw9719 driver.

Tested on the Fairphone 5 smartphone.

Signed-off-by: Griffin Kroah-Hartman <griffin.kroah@fairphone.com>
---
 drivers/media/i2c/dw9719.c | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/drivers/media/i2c/dw9719.c b/drivers/media/i2c/dw9719.c
index 3627e78b8b6668933c4ecd92231465ce4105ff0c..172479f2c9f63f6b2a1f6eccf8184142edb383b9 100644
--- a/drivers/media/i2c/dw9719.c
+++ b/drivers/media/i2c/dw9719.c
@@ -68,6 +68,9 @@
 #define DW9761_VCM_PRELOAD		CCI_REG8(8)
 #define DW9761_DEFAULT_VCM_PRELOAD	0x73
 
+#define DW9800K_DEFAULT_SAC		1
+#define DW9800K_MODE_SAC_SHIFT		6
+#define DW9800K_DEFAULT_VCM_FREQ		0x10
 
 #define to_dw9719_device(x) container_of(x, struct dw9719_device, sd)
 
@@ -75,6 +78,7 @@ enum dw9719_model {
 	DW9718S,
 	DW9719,
 	DW9761,
+	DW9800K,
 };
 
 struct dw9719_device {
@@ -137,6 +141,12 @@ static int dw9719_power_up(struct dw9719_device *dw9719, bool detect)
 			goto props;
 		}
 
+		if (dw9719->model == DW9800K) {
+			dw9719->sac_mode = DW9800K_DEFAULT_SAC;
+			dw9719->vcm_freq = DW9800K_DEFAULT_VCM_FREQ;
+			goto props;
+		}
+
 		ret = cci_read(dw9719->regmap, DW9719_INFO, &val, NULL);
 		if (ret < 0)
 			return ret;
@@ -177,6 +187,12 @@ static int dw9719_power_up(struct dw9719_device *dw9719, bool detect)
 	}
 
 	switch (dw9719->model) {
+	case DW9800K:
+		cci_write(dw9719->regmap, DW9719_CONTROL, DW9719_ENABLE_RINGING, &ret);
+		cci_write(dw9719->regmap, DW9719_MODE,
+				  dw9719->sac_mode << DW9800K_MODE_SAC_SHIFT, &ret);
+		cci_write(dw9719->regmap, DW9719_VCM_FREQ, dw9719->vcm_freq, &ret);
+		break;
 	case DW9718S:
 		/* Datasheet says [OCP/UVLO] should be disabled below 2.5V */
 		dw9719->sac_mode &= DW9718S_CONTROL_SAC_MASK;
@@ -426,6 +442,7 @@ static const struct of_device_id dw9719_of_table[] = {
 	{ .compatible = "dongwoon,dw9718s", .data = (const void *)DW9718S },
 	{ .compatible = "dongwoon,dw9719", .data = (const void *)DW9719 },
 	{ .compatible = "dongwoon,dw9761", .data = (const void *)DW9761 },
+	{ .compatible = "dongwoon,dw9800k", .data = (const void *)DW9800K },
 	{ }
 };
 MODULE_DEVICE_TABLE(of, dw9719_of_table);

-- 
2.43.0


