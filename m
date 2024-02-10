Return-Path: <linux-arm-msm+bounces-10488-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id CDA1E850334
	for <lists+linux-arm-msm@lfdr.de>; Sat, 10 Feb 2024 08:16:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0B6B31C243D0
	for <lists+linux-arm-msm@lfdr.de>; Sat, 10 Feb 2024 07:16:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 006473D38F;
	Sat, 10 Feb 2024 07:10:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="CXyG0Mzu"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-oo1-f48.google.com (mail-oo1-f48.google.com [209.85.161.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B8BF3CF73
	for <linux-arm-msm@vger.kernel.org>; Sat, 10 Feb 2024 07:10:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707549015; cv=none; b=qksEbbqr4lEDQdnRoyNr6ZV6nVh0m7koEfzLyzqIFPPv8ZJc4y1tcYvNbF8JsRWQ/qnlcvnT0Urwjaq40caXMLkMR7wRDC/oBDlKIiN8tj6baitfzUaTOTCrURYXJtpv+ps6UaEOsf+Ke0qcXCrVt0lXlGsW/UHHTObd+bLx40I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707549015; c=relaxed/simple;
	bh=uNtg6CNmd9g6D1sTnVrmmBjdLymre6S2FvTNdICMapI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=S7SWpiJ0hWA87WTAqqzq4gvzWHury6WCR5SdHsB9/+zu2bL1KNES0fsPEA45rcxp9XgPAcl1T+kUDE0ZvUoh7ZggHkhFR2oQz/Ajn/Ggr1aQe77uaSapjRbJzVgTWuF8WuLsdueK7xwIs03/3xbmOfooD3YFtlS5A/tCMgTUiQ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=CXyG0Mzu; arc=none smtp.client-ip=209.85.161.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-oo1-f48.google.com with SMTP id 006d021491bc7-59d11e0b9e1so962595eaf.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 09 Feb 2024 23:10:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1707549013; x=1708153813; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2cCreiQeaQPfjD+hacap9EW4I/2E2LqZap0vCweqZeE=;
        b=CXyG0Mzu2Xvb5nM0nLD9eds/tZdPMrSXNgosUbq5S3rVXViUeI2yNCc3Qq4JwZTp8v
         dR8P7V5yMKnRLqa/hQTiU8yVfcvPSsi7/e3hg8zdDCeH6m0myFOGMnbbqFGTrOCwS0CO
         kDQnWAan+oqA+7zkK0RN8e0bWOWRAQ5wlNR50=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707549013; x=1708153813;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2cCreiQeaQPfjD+hacap9EW4I/2E2LqZap0vCweqZeE=;
        b=AULpAeYoUVuockTkxTcTUiCB1XYD9sq5U3Los10YCMusG009Pn9BjKvw8T/B0DYLz1
         zMN4rnNpdGt+ZUxHWq2Jsb/DQFoGb+dYMc/R3WKDozONDZu/zH+m21davlU4OHxauG9v
         UBEdXPC2jUUeOjG3qpVjUTojm6Q6RKPtBHyFNYbRi30tXz0CDvIIbsUkUgEO/H0wiWrC
         RAQ+w3hx1/nYu7pcw67/L8R6bBCq/b2v7zBgw+V1uwneJGVsinZNuMuVYL2kZP/hRYfH
         4b5nbDLRx7QgfOrqtM7U5hhZdr2dqnwhB9iTF8DBF5j8cE2pTlFY7eb9t066gsVFyaey
         J/2g==
X-Gm-Message-State: AOJu0YyywMuQTAJCMDBuu5g/ZWjG+80vPy5WTpeouFLxLJrxJTZ9KhNj
	+wXwQz3eUQsMLqhp0G2RTDTHWHILu4zJp3LuJK4+8ejcEhPR0t/SpqOKxQHUhw==
X-Google-Smtp-Source: AGHT+IHmIBXR3wTN+fnMxCGP+XCwXJqcs2DSyOB+AQ0XxDnDr1ftAkvP1E8Ip81n7RTMzc7ueUQ+5Q==
X-Received: by 2002:a05:6358:750d:b0:175:c1d8:7c61 with SMTP id k13-20020a056358750d00b00175c1d87c61mr2464147rwg.12.1707549013289;
        Fri, 09 Feb 2024 23:10:13 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVrUedD/UnAk3HKDxEGV83AYo8GBo7hWhlcoAZgULLhTJWi6/kUeog2hDaitCzqURciEjhoayaHgdZ/5X2eKy7547us70905x3X9/a8Yu3Tab0PaOOV3AyTHHRaKGiKrh9swnEiVwYwkwDM2gHfMwsVx3WIRgGwh8paDpPxQ3PgzmPq/kDmKjROhqAlJlYfNi6uvCtki4AehhaQRff9jXrXhX25lUDre0eYuhJPCpc1zZrz24yrxVsBXmt9LmHXpDJR0WlVreLSHV+vw/gWyNyGzSBKJSv9U1+OBKIlqlDiqReIp0VdviRmL0g3I0ntOL9ql8Z6S1WKOwT2rfPOiHJHg2nRfyo8rLWKW8hgscXEIoSggIiFTPde27pOl3+wMUaWZy/O8TktXpmAHRe/VMSMChhv/JKUsya7655B9iFe8QV0Y9t3kHVZZ3hJvDMKXGxkQPiLo1G27Wr+EnLW4JM821QQHEIWPScXd7tPCFPK1bBe41uywl/TFbrP+qkmJx7BFF6FGMfKSR4jhg==
Received: from localhost (175.199.125.34.bc.googleusercontent.com. [34.125.199.175])
        by smtp.gmail.com with UTF8SMTPSA id gm15-20020a17090b100f00b00296f780de33sm2898701pjb.36.2024.02.09.23.10.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 Feb 2024 23:10:12 -0800 (PST)
From: Stephen Boyd <swboyd@chromium.org>
To: chrome-platform@lists.linux.dev
Cc: linux-kernel@vger.kernel.org,
	patches@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	Douglas Anderson <dianders@chromium.org>,
	Pin-yen Lin <treapking@chromium.org>,
	cros-qcom-dts-watchers@chromium.org,
	Andy Gross <agross@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>
Subject: [PATCH 20/22] arm64: dts: qcom: sc7180: pazquel: Add missing comment header
Date: Fri,  9 Feb 2024 23:09:31 -0800
Message-ID: <20240210070934.2549994-21-swboyd@chromium.org>
X-Mailer: git-send-email 2.43.0.687.g38aa6559b0-goog
In-Reply-To: <20240210070934.2549994-1-swboyd@chromium.org>
References: <20240210070934.2549994-1-swboyd@chromium.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

We put a header before modifying pinctrl nodes defined in
sc7180-trogdor.dtsi in every other file. Add one here so we know that
this section is for pinctrl modifications.

Cc: <cros-qcom-dts-watchers@chromium.org>
Cc: Andy Gross <agross@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: Rob Herring <robh+dt@kernel.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: <linux-arm-msm@vger.kernel.org>
Cc: <devicetree@vger.kernel.org>
Cc: Pin-yen Lin <treapking@chromium.org>
Signed-off-by: Stephen Boyd <swboyd@chromium.org>
---
 arch/arm64/boot/dts/qcom/sc7180-trogdor-pazquel.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sc7180-trogdor-pazquel.dtsi b/arch/arm64/boot/dts/qcom/sc7180-trogdor-pazquel.dtsi
index 8823edbb4d6e..73aa75621721 100644
--- a/arch/arm64/boot/dts/qcom/sc7180-trogdor-pazquel.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7180-trogdor-pazquel.dtsi
@@ -83,6 +83,8 @@ &pp3300_dx_edp {
 	gpio = <&tlmm 67 GPIO_ACTIVE_HIGH>;
 };
 
+/* PINCTRL - modifications to sc7180-trogdor.dtsi */
+
 &en_pp3300_dx_edp {
 	pins = "gpio67";
 };
-- 
https://chromeos.dev


