Return-Path: <linux-arm-msm+bounces-61824-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id CCE07AE0975
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Jun 2025 16:59:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 073AF3A1E63
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Jun 2025 14:56:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AEEE428C860;
	Thu, 19 Jun 2025 14:55:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="LXV+9nc/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6170528BAB0
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Jun 2025 14:55:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750344928; cv=none; b=rrij3ZH0FWCmL4LiYKcM2ASYSM1tpixoNDWFWJDpn6+MI/A3tvMdd4uPYUfWMXoo2XHvkb43qrlKJEYWgjpV+/uQIzpzUDbustrEM5ZUPGvjJXSYd5v7oD3RluHodmaBOKRTKLrzoA5nECUXAzIp6ggd9g/tny+rgo3u74d+Apw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750344928; c=relaxed/simple;
	bh=5zLQjefFl1xoVe/hjAGrMynvu2zXA+YnEoPsGjdFfEE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=oxo0JMqLVJeWOczIjbkKXqGdeKNO9wUSvzqm9ziJMNjJJ6jtfRwx4IvDOJdFMotstLKKdV+joyqMKOKBq3UVRMr9pWM1kX373n2N69pc8VVrhTuwtzSMpPV2qme/qY7TK6NZA3GSjhPyeraUnR20iVDdzRscWm1KNaZ/+vOWgzI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=LXV+9nc/; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-3a548a73ff2so890175f8f.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 19 Jun 2025 07:55:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750344923; x=1750949723; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gLzhodFNjkX+gPU6aAgcbyZ8ijaQa1ht97PNw+na+88=;
        b=LXV+9nc/vNCVeHlWGbgbDdZH3dLqOuPng4aK846sesQD+tVwCDrEbNGd9GY0iEbVAM
         iTcVa17ToqJL4kH6wmbbiwNvOzRPJ5xWJCYH8+BnJ1wNo1tIa9tTtLcr8Klxsncsx9Id
         qXIkCzAAmfC7m+rfBXJOzT/8XamfD+VSEP6h4geTYMWotij7lQKMeRaUWhNxzsWSKR2n
         Q1a4jHXwZU/FT3wqqRNw3P9yqOOm6rjlo9k194gEwt6XT8b/qp8rnfbL/Y+klom13g5R
         7Ns3KFD58EuMQntKt6nzOTbNCeyr3iim41oXnfRb95gqgf6FeTGkEdvYlQ25Jna0W+0m
         P8rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750344923; x=1750949723;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gLzhodFNjkX+gPU6aAgcbyZ8ijaQa1ht97PNw+na+88=;
        b=IqGrUJnKlW7hfzgEHvYxwCqo1oQaw0zvFlOJFtQINd5bUJEE6goEyhtUVdJ970PJEP
         aClxRvJNCwkAnR97DXr2NOzfM/TWr0f8/k6X5P+KW8eCBHtob/2sXk/BWrPubMCh8aOh
         T1EWt9lCvJ+pVfm7N7Mv7DR5WLzmAxoJqu+WHhq5zU2EUn0yYGqoxrMw3/G1YsL0gbxp
         Kawvq9xpcHHfuUZp8WBWXrDUqW5cG8jzo0VmPkIuTg6STXXbPqsDFB0ziuLfjFxNRVJQ
         7jDEBBudCOUD51xCK8jsku1HxfTFWGoNrwXNngShGO4qZ4nmmdmG1nCJXjLVi/PLthzJ
         4nTQ==
X-Gm-Message-State: AOJu0YycjRl0CipIQOnYtiH2ijf70As/MUm1/NazuSZf7SqrTQ5lszzI
	wu/g5myDBWOtbmT8JpJQ1JgMA8jT7nD9kiRqEiF+bPATb7aK8tcdJcFIcBkNGm3rOk8=
X-Gm-Gg: ASbGncuSz5Tc5GsTJp1Htazb3+0GGJ5exheTjo0ZiUcy3qwTomG3skHbcY8IWZR+kyk
	dL37vC4JEhuWeXBJ2lbcl2Jh3tIeSXyPthzQmL08gUIb6/NNTp8mjM+ZddtTQgNNG9DsziTT/Z8
	qgRac0N3J+ABwwU68Xqgqh8/jbyyEJVi4H3gzC4QXWagnaomD0lq2hy3T5cGT5n6RvRUMT7pAav
	oIubTdis4BtpJ/Q0hgEenSM6IgugMyAOfDxnlXLpdNeshyVC1wBTflUS9VhuHOCg3VaBWptsoxC
	7BoumXpWHHH3ZyTMivER7L8Dz9yHRP897ccjtpRMzaB8xTrAtCNjjA1YS8FrtrPRKh9/fLwCpCv
	n6BfDbGqMK9w=
X-Google-Smtp-Source: AGHT+IEDxOs2fv0eODh32EDd8cdAU32JALjDJpZubvkYuesAwi2i9gcqAOAB2Ga5J//4M2trs4Fd0w==
X-Received: by 2002:a05:6000:210b:b0:3a5:8abe:a264 with SMTP id ffacd0b85a97d-3a58abed70emr6303048f8f.37.1750344923430;
        Thu, 19 Jun 2025 07:55:23 -0700 (PDT)
Received: from toyger.tail248178.ts.net ([2a0e:c5c1:0:100:b058:b8f5:b561:423c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4535ebced8asm31343715e9.40.2025.06.19.07.55.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Jun 2025 07:55:22 -0700 (PDT)
From: Casey Connolly <casey.connolly@linaro.org>
Date: Thu, 19 Jun 2025 16:55:13 +0200
Subject: [PATCH 05/11] power: supply: qcom_smbx: allow disabling charging
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250619-smb2-smb5-support-v1-5-ac5dec51b6e1@linaro.org>
References: <20250619-smb2-smb5-support-v1-0-ac5dec51b6e1@linaro.org>
In-Reply-To: <20250619-smb2-smb5-support-v1-0-ac5dec51b6e1@linaro.org>
To: Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Kees Cook <kees@kernel.org>, 
 "Gustavo A. R. Silva" <gustavoars@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Sebastian Reichel <sebastian.reichel@collabora.com>, 
 linux-hardening@vger.kernel.org, Casey Connolly <casey.connolly@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1357;
 i=casey.connolly@linaro.org; h=from:subject:message-id;
 bh=5zLQjefFl1xoVe/hjAGrMynvu2zXA+YnEoPsGjdFfEE=;
 b=owEBbQKS/ZANAwAKAQWDMSsZX2S2AcsmYgBoVCTR5g7afOe/JLNddLPQnw8+CLIW9X0RRbizc
 AD20INQzGuJAjMEAAEKAB0WIQS2UaFGPGq+0GkMVc0FgzErGV9ktgUCaFQk0QAKCRAFgzErGV9k
 tr3SEACdCNo03bzqVOxk1mrxOgrONtYGGJjUcXqLvWuPXcJs2Dngoaq/Dg3UvuhGe8oGlZwrD+I
 Fzo4PwcBuIqf8SOc9A/MJsNyS7FJX0oYJrpNI/ta8TSk0i32NTYFCpVtmIRPN+RZ3Fpxzr1uzAL
 sqHS1LXrjlth/+XJwkdtPyFavnmeKl2MiWY6GtsC/UVNaVMKLtjA0UTv7icN/ozvlSxNhKU6tEU
 UoLYtPz9Fqwp5QiAKn847s/tKxODhKRYFOPYA0rhB985tOyhpHkYsCk+4IPIwAczS4snyPa9uuB
 YKy5vRvAT0lsVAd6Vh6UGyXh+ZXIZjXwpibHxG4yRqGSsS3qztTOfeJ/C6bXLEZ6i16fx7cwZaF
 V/9yRpXf5Aj7TTyBq8C3mXogqE+hn7RxSdnGW+PTlwKxfmzY0LQam5UY81bxoZ8ZzcNa01EP5Zf
 +kkcNaaVJ3PPSpcRRsVP7UXgNotlvibEA8VFJmQnh3EqmA5Hppn3XJfHoe+BmNnOp8h/YRfH+n4
 htj80jTZ3GTFjCOgH7wUAOiQt28xTy/QUPfcVWIKaavS4SKv40NQpof49aLlY2ArkCy635xjTuL
 Z8IcsmPymiw1jJ1zDNie+RbE6ONBiA4PQ5Q1qAx9yNC5wu5AHv2/5UsRLB+v2rk8SztZdJHlvo8
 /lcBkraryspc5oA==
X-Developer-Key: i=casey.connolly@linaro.org; a=openpgp;
 fpr=83B24DA7FE145076BC38BB250CD904EB673A7C47

Hook up USBIN_CMD_IL so that writing "0" to the status register will
disable charging, this is useful to let users limit charging
automatically.

Signed-off-by: Casey Connolly <casey.connolly@linaro.org>
---
 drivers/power/supply/qcom_smbx.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/power/supply/qcom_smbx.c b/drivers/power/supply/qcom_smbx.c
index b1cb925581ec6b8cfca3897be2de5b00a336c920..fc2a8e20435639a9da4d966c43271beaeb57a03f 100644
--- a/drivers/power/supply/qcom_smbx.c
+++ b/drivers/power/supply/qcom_smbx.c
@@ -692,8 +692,11 @@ static int smb_set_property(struct power_supply *psy,
 {
 	struct smb_chip *chip = power_supply_get_drvdata(psy);
 
 	switch (psp) {
+	case POWER_SUPPLY_PROP_STATUS:
+		return regmap_update_bits(chip->regmap, chip->base + USBIN_CMD_IL,
+					  USBIN_SUSPEND_BIT, !val->intval);
 	case POWER_SUPPLY_PROP_CURRENT_MAX:
 		return smb_set_current_limit(chip, val->intval);
 	default:
 		dev_err(chip->dev, "No setter for property: %d\n", psp);
@@ -704,8 +707,9 @@ static int smb_set_property(struct power_supply *psy,
 static int smb_property_is_writable(struct power_supply *psy,
 				     enum power_supply_property psp)
 {
 	switch (psp) {
+	case POWER_SUPPLY_PROP_STATUS:
 	case POWER_SUPPLY_PROP_CURRENT_MAX:
 		return 1;
 	default:
 		return 0;

-- 
2.49.0


