Return-Path: <linux-arm-msm+bounces-20431-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 65C358CED02
	for <lists+linux-arm-msm@lfdr.de>; Sat, 25 May 2024 01:38:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 180CF1F21B30
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 May 2024 23:38:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AE5D5158A3A;
	Fri, 24 May 2024 23:37:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ica0YS4B"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51DC915887A
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 May 2024 23:37:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716593857; cv=none; b=lyWLxKldKh+sn6stEsjtmLnUq4u3XyU30o055tmxJh9Ok6soeOWOdLgARqtnnHfMyJLUQ9P0Bo/ISpySHhuixuymqT7P9G5vlyXuDHHEQBXTAeqNVVdAdFrcJ3X6bgpHVndwCMvU3IZGWf0fRyjLb6gkHuRL36yyfogRTzHUavE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716593857; c=relaxed/simple;
	bh=4CIO6artRJ4ZRunAE1h2kRB6vpyNhD0KsLJ2hd/Tayo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Y0XNdcovInJh1C2jkhp0ItprcRZZAGmvAT3CZbFrAEweR977jZH7SCquZIe6GaSCUBCs42J7lh1eDfQZGsSt/UzGZZXvnl1yslgD/rO8Qon0bY6+OGcm+R0bolJzsogs/qyk8XE4yGYUKcBQIypT/tvqRadblS1b3Fyykmme5W4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ica0YS4B; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-57857e0f45cso1153576a12.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 24 May 2024 16:37:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1716593854; x=1717198654; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mJNcJC3ubId/j8V3zKbBbmUpsocF9nZYwPjWMkiBbRI=;
        b=ica0YS4BQaD78nrTdOh0FPS/pBdNyguxYw7o0jYCw7Cwx5vpNo9RMpg79Rh5WPbdon
         R2FLvSF8s3rqJWAZZYJMdckoU5dW+BxwemrkLLTJSaXZPhdrMQtXvoERd9FWDVhhT73w
         PZDPDWxDG17qW/CVNJo/BFPyG79f1Iu0yv98AN9OxFby3EWKTfnNarupx5EpudBM98kP
         3yW9vPmhbEi8rFefuPyqeDB8E+oK23crygAyzzcY4dQufnN1fzErEM3HfOcmPnXcI0PC
         5CNZxn8C4xeqAkJ47iX43T7ZXF7f+dB323VbN3BIvNylMyhSwZiV9f5JEF8zSO5ig+r4
         Mfiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716593854; x=1717198654;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mJNcJC3ubId/j8V3zKbBbmUpsocF9nZYwPjWMkiBbRI=;
        b=AS/5c0MYRnWkWWCAc8zuf7M7HkR78/F1qMrL/dQaETBzuppGA/T9WRUq/HwtMDlPXE
         rT6gowXc7p2bAvY/smKcU8XCziVlP5T8dkiv2p/rVNBCqK0HhY+9umksT8sydNajPgIR
         4YMtLBMwEscO4iDPp3KbffnZIBqcRvLycoXTYJXm/6Ev72OreSKyTpLEN97FD6KspHku
         1iu1J0ixbXom1QRCEXA0/X3jcyJ+upzWE8u0AIYgBcjvGtd26ShTCZjziMNiwfLR/Wnw
         vu2jIpQLh3QdTF7csLvwQ8IqPB2VuO7s2FhTUw2wu327yHTqMq3WO/L0PZiqkm5yM3IB
         QBVQ==
X-Gm-Message-State: AOJu0YwGYqnTrmYPdtY4N/PiUHgENofZI4EPFFImgpWr98DEB9A7J1uo
	GU0zZDCnxREUHlzk3OgX86ml2hFuefMdMB9OL/+9wCe8QxgKXqYm5cm8VabayJI=
X-Google-Smtp-Source: AGHT+IHPJ0VtOHp/meGK+w4U8wsWiUsXkAhCNyBm7BoGgef2yPcg/JAZngzYS1ErPBaPD1zCE4RxbQ==
X-Received: by 2002:a17:906:2a05:b0:a59:afbc:1b0 with SMTP id a640c23a62f3a-a6265114f2cmr231846166b.64.1716593853825;
        Fri, 24 May 2024 16:37:33 -0700 (PDT)
Received: from [127.0.1.1] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a626c938815sm189475466b.78.2024.05.24.16.37.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 May 2024 16:37:33 -0700 (PDT)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Sat, 25 May 2024 01:37:29 +0200
Subject: [PATCH v2 2/2] pinctrl: qcom: spmi: Add PMC8380
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240525-topic-pmc8380_gpio-v2-2-2de50cb28ac1@linaro.org>
References: <20240525-topic-pmc8380_gpio-v2-0-2de50cb28ac1@linaro.org>
In-Reply-To: <20240525-topic-pmc8380_gpio-v2-0-2de50cb28ac1@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Konrad Dybcio <konrad.dybcio@linaro.org>
X-Mailer: b4 0.14-dev

PMC8380 is a new chip, featuring 10 GPIOs. Describe it.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/pinctrl/qcom/pinctrl-spmi-gpio.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c b/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c
index 4e80c7204e5f..ce576149b7ae 100644
--- a/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c
+++ b/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c
@@ -1235,6 +1235,7 @@ static const struct of_device_id pmic_gpio_of_match[] = {
 	{ .compatible = "qcom,pm8994-gpio", .data = (void *) 22 },
 	{ .compatible = "qcom,pm8998-gpio", .data = (void *) 26 },
 	{ .compatible = "qcom,pma8084-gpio", .data = (void *) 22 },
+	{ .compatible = "qcom,pmc8380-gpio", .data = (void *) 10 },
 	{ .compatible = "qcom,pmd8028-gpio", .data = (void *) 4 },
 	{ .compatible = "qcom,pmi632-gpio", .data = (void *) 8 },
 	{ .compatible = "qcom,pmi8950-gpio", .data = (void *) 2 },

-- 
2.43.0


