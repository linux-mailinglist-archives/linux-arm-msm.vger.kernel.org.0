Return-Path: <linux-arm-msm+bounces-20211-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 523E68CC043
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 May 2024 13:30:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E7CD81F219F1
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 May 2024 11:30:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 34FB182D9C;
	Wed, 22 May 2024 11:30:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="MZ1oSmi1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A8BA82D6D
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 May 2024 11:30:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716377416; cv=none; b=pM+T+V23uzh5NUY6ATwcuroSAySaRKvZWuuerXPvNl63uMPCRN7KXatKxCbReWzhkvjBHV2gMIyfYeZOG0BZKGBwMzYFTQ5Ww3KQoRJP6Y9xpUm4QAs8e6Mb0W11Il9T4+m2Vke5e6DHyoxn+d8wyuLCSkkHx4OjLAvAK5KHdio=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716377416; c=relaxed/simple;
	bh=4CIO6artRJ4ZRunAE1h2kRB6vpyNhD0KsLJ2hd/Tayo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZYlqOopDW/E1QII8lP2wlFDETKRmnwF3SNOPm+QIpMrqa7QQk5MkkOyZ67rA4tXZiFvFXv/6JIZBDniPfLukH9oCVlZ0KYsO/GAdsT8rYAJWVgFcnVzelt3UwQdSDlzM9tnh6pQEsL2Qe2szBpXGcLmUFuUA92Re5+OFlcg16Rc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=MZ1oSmi1; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-a599a298990so1033008266b.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 May 2024 04:30:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1716377413; x=1716982213; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mJNcJC3ubId/j8V3zKbBbmUpsocF9nZYwPjWMkiBbRI=;
        b=MZ1oSmi15yjxcPzhQ7Q1d67WMSkwHlMGK49ImKXtOy5fUAJqQ/OhYrUQqwMyRwE5I4
         cNZfiTEfGf5o57r8kVpvnAUuZgW4WdX2qL2hqhXp0mR8v3d8xk817AU+Ce95LYjs+lz4
         pxxPY9jC8dBTWCiqWxzhKvN0FeL/mYLfd/E5EhyAZp4gU6dfOqq7EZUaTxX7aINMTY7W
         bn7swuheVDpaCmcfEMuyu/CoA9BAeFg7U81iufasw0mjq3+UJnRobW/E35UC4RSyJENf
         LNHcjqEQEOB04xe7RvSulmnwv2B270hEGpWNq3M9D51YlpnYcZYElyXCBXblyH35j0tj
         FmnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716377413; x=1716982213;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mJNcJC3ubId/j8V3zKbBbmUpsocF9nZYwPjWMkiBbRI=;
        b=tNZluyVuooumczmC1q+7f+Dks64gVMBPK9Z7C1VYTPK/tSxKsXNl89/Ny3wasEuU59
         WnqbkdEljU4LXEtQA/hSciObfzZzE6aAM+K5TYze+VEfJo14Wut3/eB4W+zEQ0H43Ei1
         MKmi9UAMyC3IfxfUsUQ297E2Wl7V78XtInsO18uvRkwScJN+i9o1Wzl2FlH8RGbNWcO9
         UKXKAv6S1xeq2LUCwvGjFNDLfmAyhudaHbqN/1QAWbPWI9OaPBrsxOsZ2adovxRd1MNy
         BR2pXA+GyhWP/0ohRfBs8jVSgc95vwXVdA0DGBmuOXmJ5GiRRD21DNPCBOq4uFSocI5t
         qMkQ==
X-Gm-Message-State: AOJu0Yy88HUbhUBEtM9aQ4e+43I3TDXIX8acamX9c6+AzjFyVvcr/196
	s1EUVFIOwN5myGkAh5wjwt3sT/HxxXguwoq2a5MhltI0wN4d6qMgE/lxEu2FZQk=
X-Google-Smtp-Source: AGHT+IEzNDd0Cncky8DxksUpwFp2MAsZW2IdqX/pyaQ60q+kGtJRzL8vAfOsh7cZPyw5OgbfI7vWpg==
X-Received: by 2002:a17:907:6016:b0:a59:af54:1651 with SMTP id a640c23a62f3a-a62281646d9mr96720166b.57.1716377412863;
        Wed, 22 May 2024 04:30:12 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:f41:c55:53ae:4d0a:75f4:a9ea:5025])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a5a17b01652sm1768363066b.167.2024.05.22.04.30.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 May 2024 04:30:12 -0700 (PDT)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Wed, 22 May 2024 13:30:05 +0200
Subject: [PATCH 2/2] pinctrl: qcom: spmi: Add PMC8380
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240522-topic-pmc8380_gpio-v1-2-7298afa9e181@linaro.org>
References: <20240522-topic-pmc8380_gpio-v1-0-7298afa9e181@linaro.org>
In-Reply-To: <20240522-topic-pmc8380_gpio-v1-0-7298afa9e181@linaro.org>
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


