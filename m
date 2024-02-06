Return-Path: <linux-arm-msm+bounces-9979-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EF5C84BD1C
	for <lists+linux-arm-msm@lfdr.de>; Tue,  6 Feb 2024 19:44:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 842981C22AE1
	for <lists+linux-arm-msm@lfdr.de>; Tue,  6 Feb 2024 18:44:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1340513AD9;
	Tue,  6 Feb 2024 18:43:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="n88zmfA1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19ED713FE2
	for <linux-arm-msm@vger.kernel.org>; Tue,  6 Feb 2024 18:43:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707245026; cv=none; b=uF2fXNSICNAoR5+/ekam9NbbIoZ4qbx2psZS1vGLKhpnu0hUbi0UqHrWGXjNrR8FgzzhXEZzcrFdHS9hUPn+RdHSRZmGPwrlhZENY0C3p1bUfROL3PEJ1IiT75jrv6yl/zWKqHPElpXdjVw/DJheIr7PEX5toOJ9eX2PCskC9ms=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707245026; c=relaxed/simple;
	bh=XwCgSZpLR0e1PPyOXyw9iz+BwYBf4ZHexOSsfIVdxQU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CFCC/FIu9xfdVcGJhu2d33ky73F19nCQIhPI+c+vKop09Z03sDrrO+02rD88+luI76c4WWXXYR9N5hhC+tHzWf/Ed3oHTJGRq8/VpcIPo/bGl4/juQlcixUSRPkBuTVdpUDk/VMiqoxkxdO2SYoA2ZzcQLBvM7OpgYNdnrONgv4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=n88zmfA1; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-a2f79e79f0cso172256866b.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 06 Feb 2024 10:43:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1707245023; x=1707849823; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hvL5qVc53pRM2ItjtrWEvKCgIea1KTM6jFEXiD2pTIk=;
        b=n88zmfA16tac3dTriWwFjbFeppDs3QCehS3dS9zYc6ISdsqi/+N7kYa8RVdk7PrG3V
         JHVd+fGdNvr8dYF/b3lZ2LuAvAn6vQ+ISxAHLRd3Td3dIzJCa4/JkqRtftbwRLg93Ja7
         ZdS0iL/SaqjeHZcUVj73ubTEbWbev/8mPkFjJjJYDZZgwTOUS8/CzRIjCWEuE1bnBsvG
         HhJ1G8HZwFmObUd7znj6gCCXlBLzp1qdJijj8flCbLkXXIkTTart4jOJX2RJo9Il2atq
         ETVk+QWMQ6MzEJp6ZKJg6bhzjoejLap/VGQuG8QSPHKKh6R7C6P/q2fupy8BTqbVHnPN
         tFgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707245023; x=1707849823;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hvL5qVc53pRM2ItjtrWEvKCgIea1KTM6jFEXiD2pTIk=;
        b=bkSCAI4TVriDzmJGXcZdTUBvx6VNp+9WDJkmkGDBfWzegR/DkJzuuTPMu7CJ4Wj16k
         8c7KPA4DmDYiItHeyPrbxhaZ9AODptbpTr3G1eir1zuQQGcaVtimYQhoy/yHL6zUf/fD
         EpfDP7u0OHZ53faZKXTql5trJviL8Nz7Xh3eV4E2/d+ij5Kz8YGYnyPKpGAF1vt7iafY
         CfdEb7MHPS5bxAFvbiq5PaSgU5Xl3/sb5lW7SvWhxZKnCBNm1WTWQfJB+8w3IM5ckoex
         a6ZRWvRuZLOy4tnyQdU0QJYZRaJK6UAsNJIY55SqbX4Gh24OdM0JRCc/W4C9Cdh42EGN
         nPjg==
X-Gm-Message-State: AOJu0Yxd0UIM/cX/rb5xDK54aJcvc2Nz5QAcTmFAHIRBmSdqbW/kxlH9
	xpgv6/Gx43kA+3MYe06erOjtBFFMCsXnZRvX8fi8rp+QY8OwprNJ0JKwouImBio=
X-Google-Smtp-Source: AGHT+IEwcGzkit3UG7RgaJhKZBhIWNsb1zukExW6YjVWP6FLguEvzUDQXDK8pJXm4ibakI9xGX20fA==
X-Received: by 2002:a17:906:5290:b0:a31:83a2:463c with SMTP id c16-20020a170906529000b00a3183a2463cmr2821529ejm.34.1707245023306;
        Tue, 06 Feb 2024 10:43:43 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCWzBwgE40NoQJNzoN6JSw4Wjez8/Ag0DcojFpjommyB40AgMlUE/2XqAEx8GzyqQRu0n+Gf6BPPBtw0GJk5JHQhpqnm9wTanHLkqAFGNEu9StIqpimJ3LQ/bh/choLxc9xYvIslXMUyNrY61oIAjPhXTck3pQDC3OFqGLXAFx/TIN6rxWNRnLl80REIXNm+H3LWvFfoHxYHliZ1b9Cd6Z8qWIxWNz28bbjp874R4NzcK4HaJPXy8u14SqljSDsQrMCSy9WfeYwae54IR4lpNeZcjYCgKl0toBqdAzeEWdi5p6i08NE4A/IeL2gwgUisfg5IsdlgXA4KSzvf1vmfsL4BBtBTJbSf5KNssuSrsYrfPg3umt1i6MAG8r11TtQZdMAC35PIbJJgHuTLP0vc/N+7NYdxkR5syNN31BkE+v98az+z1IISEBMTlSD9hRllymVU34Asv/su
Received: from [10.167.154.1] (037008245233.garwolin.vectranet.pl. [37.8.245.233])
        by smtp.gmail.com with ESMTPSA id un9-20020a170907cb8900b00a384365e3b9sm562305ejc.195.2024.02.06.10.43.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Feb 2024 10:43:43 -0800 (PST)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Tue, 06 Feb 2024 19:43:36 +0100
Subject: [PATCH v2 03/18] clk: qcom: reset: Ensure write completion on
 reset de/assertion
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240105-topic-venus_reset-v2-3-c37eba13b5ce@linaro.org>
References: <20240105-topic-venus_reset-v2-0-c37eba13b5ce@linaro.org>
In-Reply-To: <20240105-topic-venus_reset-v2-0-c37eba13b5ce@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>
Cc: Marijn Suijten <marijn.suijten@somainline.org>, 
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Dikshita Agarwal <quic_dikshita@quicinc.com>, 
 Vikash Garodia <quic_vgarodia@quicinc.com>, 
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1707245017; l=1253;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=XwCgSZpLR0e1PPyOXyw9iz+BwYBf4ZHexOSsfIVdxQU=;
 b=Tq60ALVlciDLkdivYsIcmrQF748EJR+pUE1IufXNafFGsZuOAbb9f/rPSAB0nnwQSqzg3qqQb
 6l7lLfFExgEDOXPfLnpXb/GSuu3ptYAHeuizJ30cBnCMswdh1J1/Bz5
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

Trying to toggle the resets in a rapid fashion can lead to the changes
not actually arriving at the clock controller block when we expect them
to. This was observed at least on SM8250.

Read back the value after regmap_update_bits to ensure write completion.

Fixes: db1029814f1f ("clk: qcom: reset: Ensure write completion on reset de/assertion")
Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/clk/qcom/reset.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/qcom/reset.c b/drivers/clk/qcom/reset.c
index 20d1d35aaf22..d96c96a9089f 100644
--- a/drivers/clk/qcom/reset.c
+++ b/drivers/clk/qcom/reset.c
@@ -33,7 +33,12 @@ static int qcom_reset_set_assert(struct reset_controller_dev *rcdev,
 	map = &rst->reset_map[id];
 	mask = map->bitmask ? map->bitmask : BIT(map->bit);
 
-	return regmap_update_bits(rst->regmap, map->reg, mask, assert ? mask : 0);
+	regmap_update_bits(rst->regmap, map->reg, mask, assert ? mask : 0);
+
+	/* Read back the register to ensure write completion, ignore the value */
+	regmap_read(rst->regmap, map->reg, &mask);
+
+	return 0;
 }
 
 static int qcom_reset_assert(struct reset_controller_dev *rcdev, unsigned long id)

-- 
2.43.0


