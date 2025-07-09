Return-Path: <linux-arm-msm+bounces-64213-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 74366AFE794
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Jul 2025 13:23:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 63F8F1C80832
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Jul 2025 11:23:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6EC832D5A09;
	Wed,  9 Jul 2025 11:22:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="nsSYil+T"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 588AA2D46A0
	for <linux-arm-msm@vger.kernel.org>; Wed,  9 Jul 2025 11:22:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752060164; cv=none; b=AOTr+Cv+sk9cCTrdDVzYztu7Xh7Jd6nmq3EIOrpsaq+s5QuNDOnrfQ7UQ7yKTYN4qyJ6OgvuJ8cmDdWFUZJMbnqXBNB9kpPzv8dDEm2cWQ+QoUmi0Yih6JaRrJdPE6PXiDdgd2BBhrmIw/xGT/5GKZa4e73/ieyQxTFLKyYoqmQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752060164; c=relaxed/simple;
	bh=KV/da6xIzbVHrhG2xY2P4IEV9DKl1AvKU/5Rm5fhtk4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hfVM4B/uXjfjczeoKFg8xmdeq3AKG0GxW0rB/R4hg0AP1Yzv1NP2qac3cn6KQSUuSYTUpnhPdqiJbLFW0LgmgIzLixlOdEvoYQau4BZzC0+DfpVwC//9m2atreAFvzOwFKwNAbsEApWYi9pVDx/iiz1ffJChysVFM2uk+GZGx2A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=nsSYil+T; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-60c4f796446so8112321a12.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 09 Jul 2025 04:22:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1752060160; x=1752664960; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fK4ANoIWktsPShrmwGNUmQluv7mHl27MCE1eB8EJFoY=;
        b=nsSYil+T1Qd+O8Yt+BgQPYU4/pXrNW87XRBiUvhOP7R1BgXf1MekOxNCzLVQ39T2PV
         /3lo/EksnjEd1xrQT+N0T1WzuH/f6MTp4oP2pcapKRqJc2YpE4HZ01deUgJi5VvnWKSN
         mX27EK1cF+NsUlwoLL5+cn2KWPquNA4xhVF1ufNBXeIEkjP1f6INasEUVSpv8YHrlnLg
         rYDB+Y7a/zELato6+MJwQsd3DjIo+oiY7KidqSjp6SmIgAnJqL+PWOeKVF2ZkPEXe6Hg
         +i+GNTJkBt6kC6jKvd+asnO/wx1gYoL4l1KoD/3IgNRwTef0S+/InMUCaO96A/IltwGx
         LO+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752060160; x=1752664960;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fK4ANoIWktsPShrmwGNUmQluv7mHl27MCE1eB8EJFoY=;
        b=tOW3SH0+d2pW3CP/vriW3s/PbJhx4UJgPEdLWohhurS4T1mqKhjwREI0gpYL6nANj5
         B20kLbSdOKqfUjc9NbvQ8EUGIAzplhWg82WR21SYqzpf6JJ26ImAI4CwZ7vBVuRtJ+re
         TQKcuWQK9nSQ0JXlTK2XO9jKAl3jBgUFhmdQ0LO/vUnsc/zUbooMyTXV5j5STcCYtnZX
         tSEfzHrthI/hc81mGsNk2FGmNpbOyVj7scS6Yhnit1RmFOEuLLp40zl/5pLgigmITf7h
         gj8D5ucWZ6t6JeIJSQ69c6g8XerHqQFNjiY0K6LHgMUZZtYDGJL/o6ruFLOF81fxeIIm
         m+PA==
X-Forwarded-Encrypted: i=1; AJvYcCWd9GwGbfjiglRfHmXYdRB4rzGXQlqD45KKFf72Im4iHuUIyaTC51SINlvc2bDZjUlVh6PjDR0qkgi1EIPT@vger.kernel.org
X-Gm-Message-State: AOJu0YyqJ8CmSK1IjTMqVN9O/HBlaoo9EcRIQr4RGcSo8U+S8hItu45o
	GCoRpgKe+eVzAvdKHsLB0vJHSHXYi20g3MgqV1oIPzqOas5bpDJ9V6AHRpUVOoB/2zc=
X-Gm-Gg: ASbGncviVin9cQ69n5hhdgjpYyvW+hY3BbfHXYNxeYzwovQr5uwbfdgzhHWR3L540au
	P/iGs6JcMxe6FAl8o0I0n90/ZreVQcBmmD0AYUlwicT3lajZxFCeAzQckE/Q3wZU94V/WFpCICY
	qfgN977ZDgRhBuFXcjkEOqVDEqhvpfOsVroJWe1mMyzcmzlNkTv1KUbxvCwV79emXYtG87FzQJS
	6/SdEqdO9bLEYW1ug7md3zVk179M+/OglwxUNJ3cN4lbQWLuqgY4n3vBq/z/5Uqdx8/IAQBhO5S
	sKeXq8JV7eoY1SlVRYYJ13NflE3TEf4/IMWlcTfWC9JvBTCuu9AzfVZtg8uAMjU3rhMpys9FkzL
	e4mhAZo43FMLp8DsZAfDHyGFjHJcmmgYu05qXeMtqM88=
X-Google-Smtp-Source: AGHT+IHZxwLmYMHgjDd4zGI1+9Hd3ISiMtfdbCFiwSyXc9F1royVFxYLXpMSuKapmOzkESC7IF979g==
X-Received: by 2002:a17:907:6d0a:b0:ae3:6994:5511 with SMTP id a640c23a62f3a-ae6cf5d76e9mr268843566b.16.1752060159608;
        Wed, 09 Jul 2025 04:22:39 -0700 (PDT)
Received: from otso.local (144-178-202-139.static.ef-service.nl. [144.178.202.139])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae3f66d93basm1079861066b.4.2025.07.09.04.22.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Jul 2025 04:22:39 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Wed, 09 Jul 2025 13:22:28 +0200
Subject: [PATCH v2 3/4] pinctrl: qcom: spmi: Add PMIV0104
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250709-sm7635-pmiv0104-v2-3-ebf18895edd6@fairphone.com>
References: <20250709-sm7635-pmiv0104-v2-0-ebf18895edd6@fairphone.com>
In-Reply-To: <20250709-sm7635-pmiv0104-v2-0-ebf18895edd6@fairphone.com>
To: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
 Luca Weiss <luca.weiss@fairphone.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752060155; l=1096;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=KV/da6xIzbVHrhG2xY2P4IEV9DKl1AvKU/5Rm5fhtk4=;
 b=xXytyaef40ZyvPrSPOwWzJfwNcIkMrPdQjGb0A6tTQU0ejQ5IAIsJ0UY+yU49mxJVPhVCpSQq
 rA33o/OJcXeBDA04u4TVHfK+ujFJ9Ntn6/I3J6W7oVdYHSKos4UDQQb
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

PMIV0104 is a PMIC, featuring 10 GPIOs. Describe it.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 drivers/pinctrl/qcom/pinctrl-spmi-gpio.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c b/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c
index bc082bfb52ef480941e1804f1142496e1db6413a..40de5554c771d0c034a458fb4d5e8876473b391c 100644
--- a/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c
+++ b/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c
@@ -1244,6 +1244,7 @@ static const struct of_device_id pmic_gpio_of_match[] = {
 	{ .compatible = "qcom,pmi8994-gpio", .data = (void *) 10 },
 	{ .compatible = "qcom,pmi8998-gpio", .data = (void *) 14 },
 	{ .compatible = "qcom,pmih0108-gpio", .data = (void *) 18 },
+	{ .compatible = "qcom,pmiv0104-gpio", .data = (void *) 10 },
 	{ .compatible = "qcom,pmk8350-gpio", .data = (void *) 4 },
 	{ .compatible = "qcom,pmk8550-gpio", .data = (void *) 6 },
 	{ .compatible = "qcom,pmm8155au-gpio", .data = (void *) 10 },

-- 
2.50.0


