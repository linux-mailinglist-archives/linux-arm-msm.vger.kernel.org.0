Return-Path: <linux-arm-msm+bounces-20164-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A07248CB4BA
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 May 2024 22:31:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3D9D81F226C6
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 May 2024 20:31:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E977F149C6E;
	Tue, 21 May 2024 20:30:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="gdwzOf54"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18F2947A5C
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 May 2024 20:30:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716323452; cv=none; b=IZX86jKTts5G8Mrefbdmqk0vn/eCkhEv/3BQ/rEJoxmFHSVh2DgNI2zAfNSs3N1QaOZURYFxSTIhGQEKz+WmMknsQyR9KUONGy049NYOZ7QjY3UcEKFMdNIJOCs+LFa5i7H5TYhfYnL4GeUSvCAQE3zcl50JzL5IBzvbdtUw0sk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716323452; c=relaxed/simple;
	bh=+BCS5fG7t1ac6ivgcoP/WGAfPI0hUuFmhb/yRKE0Y3Q=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Gfn+qguZL+kKFpuOClYXBvI2sal6ffPD6+9W23njUTtOZ3Ih/FsLGub4EpTjKQtRDtEwr8U2ht/swCpKB32BY+ifFMGeFO4nmgIGmoNttlv2peDAuN9qKwUIevS2MdmJF+tMhK6GemirjSl37tE+6sszUyv8Khz341YbZL+ZFe8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=gdwzOf54; arc=none smtp.client-ip=209.85.208.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-2e73359b8fbso25512401fa.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 May 2024 13:30:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1716323448; x=1716928248; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=61aHwd2183bAP0kT15DI6K+JvUWTUFMjXYFTY8xR2sg=;
        b=gdwzOf54YG5qRzUKwmvrPBZkODYT+zOz7+fIOuD3MAgzaqDo3tC/74S7SMLAUe4GOM
         MWwC91nlJ24SVSpkJxEflSIVUoKDfMfAmOFCcbpDOl5R6gt+bkiQzMrplrotM/BkUN8g
         2v/6Lh3LfMz4d9fCre3sV1qWOuErFKwoUYkCDjoIgAJCzkPzXZFbWQc2e4pp3k7x6IlI
         15+GtvHLiZWkH6flAjJwLiciCvg/4zt5Uf/Ui5ekc4C/wbrRNkgh8zjT4R/NH4NpEOj2
         lYpv7NPkl9pz+oivlEX+adRk3N1VWxuNtDF9KfmweOTkRDtVkPAkTlqRYiJmX71srPPH
         KvqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716323448; x=1716928248;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=61aHwd2183bAP0kT15DI6K+JvUWTUFMjXYFTY8xR2sg=;
        b=hUOqXW3I3K+qgPRqxz/C5dS7rkBbmtqY3YnkquQ7Ax3eUCdldrdygEIV+Z+kN1fPxo
         EUruqn7DkLY2E7/t/9vzJ6ELBqv89q2AyGHYMqQi5UMfGODbFth8mjiunAI4ALa5ZRE1
         hlhTQNTIyS5561OS/8pQriTpBpH9GjvY6D2/K+M9S4IryhvwLNlWARb9econACZe7OHr
         W31TRGhppFiO+B940w2zywAYDE4MFYfaKq9RXqaaQqbJz/eEuCS0D5WZnVhn3phVmiMG
         1vJlnmRqdm9P9DzTAiew4jj8EvwOc8xliOGmpiAtaBAzEKCQDsxMrgvUHl7UwF1sxEPz
         Gs/Q==
X-Gm-Message-State: AOJu0YzRtp0+x4ethBZe0dXWcozK1ZeE3szWQ62DIZ/+F9to7JtsZnij
	G8Z0QilvaekZ/cLXiyi8/SGYNY7YTaGQ7DHyyZR+uUEa3XaMDOfxH/8JlXZL3BE=
X-Google-Smtp-Source: AGHT+IHy0pjC5CDy3P6mbf7msRN50iLlv/wcGutIEXt9GlQXiF1OAnp2jM95uZzEJ4jxdQSM2h9I+w==
X-Received: by 2002:a05:6512:3294:b0:51b:6366:3459 with SMTP id 2adb3069b0e04-5221027800cmr27851507e87.67.1716323448405;
        Tue, 21 May 2024 13:30:48 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5238ec18fd2sm2538664e87.155.2024.05.21.13.30.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 May 2024 13:30:47 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 21 May 2024 23:30:45 +0300
Subject: [PATCH 1/2] phy: qcom: qmp-pcie: restore compatibility with
 existing DTs
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240521-fix-pcie-phy-compat-v1-1-8aa415b92308@linaro.org>
References: <20240521-fix-pcie-phy-compat-v1-0-8aa415b92308@linaro.org>
In-Reply-To: <20240521-fix-pcie-phy-compat-v1-0-8aa415b92308@linaro.org>
To: Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
 linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 devicetree@vger.kernel.org
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1536;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=+BCS5fG7t1ac6ivgcoP/WGAfPI0hUuFmhb/yRKE0Y3Q=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQ5ovS1mu0/nibRkdWhw9d1ZFnVJhnxugl2whuDxytnRy/
 /WWbM5ORmMWBkYuBlkxRRafgpapMZuSwz7smFoPM4iVCWQKAxenAEwkcDn7f4/f+0RuqrBI3jzO
 vCPyrtznwwsSlvofCw/N5zt1STu9c1tpQOfU4J2szYYa2nHJobY338T6mjFWzznGPbnv8lR7wYz
 VLt1mTE+SZulbFW9h2LXY1UPX5lCDcdzfF5wrXum9ETn+uuzEqg8TZ2zPKb82T6n6tMKPimUMFQ
 0bC9VXXW6anzql8L/jp7zWZuVzlfPWbM9g2zT1A+f7kBvzbH5VxqossUw9v2hKMzefXVrcErFLA
 u1P/2TzFRt42ukcWLOEyaV2CaeAdR7j12cCF/1+rr8drih4g684313fZNVEU8WvDQafQto8jCdW
 bprhx1uhdHyiq75HrsnF/Wycrb8WPgnZaVge83J2w0o/AA==
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

Existing device trees specify only a single clock-output-name for the
PCIe PHYs. The function phy_aux_clk_register() expects a second entry in
that property. When it doesn't find it, it returns an error, thus
failing the probe of the PHY and thus breaking support for the
corresponding PCIe host.

Follow the approach of the combo USB+DT PHY and generate the name for
the AUX clocks instead of requiring it in DT.

Fixes: 583ca9ccfa80 ("phy: qcom: qmp-pcie: register second optional PHY AUX clock")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/phy/qualcomm/phy-qcom-qmp-pcie.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c b/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
index 6c796723c8f5..b4767b8cc014 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
@@ -3730,14 +3730,11 @@ static int phy_aux_clk_register(struct qmp_pcie *qmp, struct device_node *np)
 {
 	struct clk_fixed_rate *fixed = &qmp->aux_clk_fixed;
 	struct clk_init_data init = { };
-	int ret;
+	char name[64];
 
-	ret = of_property_read_string_index(np, "clock-output-names", 1, &init.name);
-	if (ret) {
-		dev_err(qmp->dev, "%pOFn: No clock-output-names index 1\n", np);
-		return ret;
-	}
+	snprintf(name, sizeof(name), "%s::pipe_aux_clk", dev_name(qmp->dev));
 
+	init.name = name;
 	init.ops = &clk_fixed_rate_ops;
 
 	fixed->fixed_rate = qmp->cfg->aux_clock_rate;

-- 
2.39.2


