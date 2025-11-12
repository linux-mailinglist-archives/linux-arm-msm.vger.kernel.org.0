Return-Path: <linux-arm-msm+bounces-81382-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B8210C51AC1
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Nov 2025 11:33:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2FC5A1891617
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Nov 2025 10:31:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 29F6A30AD1E;
	Wed, 12 Nov 2025 10:29:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="WhDK3/RB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C49930B507
	for <linux-arm-msm@vger.kernel.org>; Wed, 12 Nov 2025 10:29:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762943362; cv=none; b=RoaJAQiE/bSBfEeYAXyxFi+nlSkOBmCUn+ey1YkxHY3AOVGnw6qfn2P/YMeOVPxjpzeGGXj8mPeKd/ktVVb3ZemQV8k1xdYJAbiuok5rQqrMMMlSwRbzyOP7bLRprfcYekpu0CXdxRWOLQ7+M8D0at7xTEK1ldxzUxW727v3RP0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762943362; c=relaxed/simple;
	bh=kT5IA0GtAEQVfWhYH3L9qEziSnbAJtbqUptdjRPcgUw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Ov33qPUzHy+laJWJrZkKWX73f/HCnqEnAzsLGm+VyBhCl5oI5EucMwYYEB7ertkrw4fgj+IHmxobdg8mnVhqFCf3PFFGrtzISC4gURXKCcLyoF7NPGefJkgtMT6IVkSpk/3+MbwHudZ2N5uipLVN4VgMa8XXlXl1J9tXr+NPd7g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=WhDK3/RB; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-429c84bf326so55238f8f.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 12 Nov 2025 02:29:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762943357; x=1763548157; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kBavdG36JhZKmN/pedjw25qWHClEhA6t5bxsk6oa0rs=;
        b=WhDK3/RBVYDPnB9yUvRMIpmxuzu7NabzaXD6my13CRIPaKCeKN8jf9QQQ8JwtJKTch
         byw7aXhqu0CrspkxHTR4sEYidaXck3oZ4csuEo7ZUcQsWEO56MBMgbfcfVfiyWcjuf/p
         0S73GGOfHxWjyOmGSgq0gywSSbsliz/ffSu4qibE/PTXqZJb3tFkvUiF5ZMTL8tVvr0i
         IHulXuKEU88l4v+mpfht3ZPcSwrB+WV851G7UkUVrxscIf/AOGIiflvS1lMOZivNWrrg
         xK3qCcYbZMG+k7JTrctGLdQOKOnyli6UwqNDsQcT/KgjVxbLgkemoq4neqgm/RNqxLH0
         YJzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762943357; x=1763548157;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=kBavdG36JhZKmN/pedjw25qWHClEhA6t5bxsk6oa0rs=;
        b=lc5Jr8wJ6cBOhRCgrLf5/Jo/0sF7FFLtkQgGiJ5iz6RKb7ilwCYEY2ksHFrYlD9RaT
         3rvdAabznYGZj/A0TFgCKXeULoZ9MvO0PQ0c9wN/fHtjMj8uKaqfK//GYywQuGdRtGZ8
         vNqwowNaTEDmy/2KNBnnyQkqtp4qUFMimgesvPBfeUSWgCt76HoqaSkwkVbvWXOPQTKi
         IBm0cu01fb3f5KRYNl1CniB3EdGYwmQiD7ABO3EeJSIN03W2EG1uKZIjQ0AzI8DGPY2k
         7KPJ8Kr2oE7i5XthQ+FNKo0CAh4VU6Xj+vBIchkUnkVUKOoSAjdbMh9elF4kvy+A3gX7
         09MQ==
X-Forwarded-Encrypted: i=1; AJvYcCU9tTqtIKk5Tbr0iOsOrwqLi0UuV/Km/nFHXxcWl6NmSmFd/Lr6D8TM2KxXTte+a8CT3gDzC/4w/QOWw1qA@vger.kernel.org
X-Gm-Message-State: AOJu0Yx0W1vHIo5hZ+w/HcRCn7ilhjwEGCXDRfKwtik4FUkDaxnaEsoR
	tQ6sQRL2bPZiEc7GU7UnYI1e+vMJ7wrmR7gjhhR/T8zQbwHc9i4UCI6PoUGazj6CZbw=
X-Gm-Gg: ASbGnctpOxumWp9C4Lj6oarAJCtza8DlM6yK3Ndd+4HWNAK++a54t6PUH5A2EKYwtk3
	0h580R1KlcGNPoHEGSHdyka79rvlG844zyPnEVTv3KUuj+OB2LXzrGx1RtP7auzURaPyCkd7vs3
	I96TK7pLhHzRlCRWGP7OW4iBRjJmDsXC1tnYU9HKUrgLKoJlGk+6X+XgJzWtkxGHt0viCHMHLK3
	kUV1+oxZqgzDWSsMWnON96IcojCJCh3vSF6GnE27J4U8bAT382thtNxtOrajh4dfLdKMJhV3gBE
	JAGJ3Zn2091C1nLh1ygp3LmhpjCmrlwVbdaGR7+UtBsugZOjfhq/CIw0GXD5BW5yQ1I0qeHVqal
	Xfi8WjbjEq0hppL7u/Ka7PxpaUvKaSdMrI1hKNlNcZHJxd86HBJJTw+0BWJsq+iMWeawDq2KYUK
	ZFmutZGDcHGx3Ym11I
X-Google-Smtp-Source: AGHT+IFcsJyQX0vQHIxt0g6rxRaeK4KQcZ7ubS4Xn6BHNva6HYRONLKZdEpigTSHkx+N3rxTuPNAQA==
X-Received: by 2002:a05:6000:2888:b0:429:d4c2:caf3 with SMTP id ffacd0b85a97d-42b4bddfecfmr917139f8f.10.1762943356808;
        Wed, 12 Nov 2025 02:29:16 -0800 (PST)
Received: from [127.0.1.1] ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42b32ecf522sm22020001f8f.45.2025.11.12.02.29.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Nov 2025 02:29:16 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Wed, 12 Nov 2025 11:28:51 +0100
Subject: [PATCH v2 06/11] firmware: qcom: scm: Simplify with
 of_machine_device_match()
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251112-b4-of-match-matchine-data-v2-6-d46b72003fd6@linaro.org>
References: <20251112-b4-of-match-matchine-data-v2-0-d46b72003fd6@linaro.org>
In-Reply-To: <20251112-b4-of-match-matchine-data-v2-0-d46b72003fd6@linaro.org>
To: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@google.com>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, 
 Viresh Kumar <viresh.kumar@linaro.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Yangtao Li <tiny.windzz@gmail.com>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 Daniel Lezcano <daniel.lezcano@linaro.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Thomas Gleixner <tglx@linutronix.de>, 
 Nicolas Ferre <nicolas.ferre@microchip.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
 Maximilian Luz <luzmaximilian@gmail.com>, Hans de Goede <hansg@kernel.org>, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
 Daniel Lezcano <daniel.lezcano@kernel.org>, 
 Thierry Reding <thierry.reding@gmail.com>, 
 Jonathan Hunter <jonathanh@nvidia.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-pm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-arm-msm@vger.kernel.org, platform-driver-x86@vger.kernel.org, 
 linux-tegra@vger.kernel.org, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1468;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=kT5IA0GtAEQVfWhYH3L9qEziSnbAJtbqUptdjRPcgUw=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpFGFoaaq85XzS8Gm+QHLYdjGk6xAwN9M9CcUpd
 yKEYT6rj7WJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaRRhaAAKCRDBN2bmhouD
 10RbD/0QYyKGuzIytM2noX3te8ScA/nUleatTJOM6knZFKx9CzhpYG1nOZVLI10Q72t5HzseI+4
 Oi4wEKdkIUc6XVheTGBlr8XH/Ezs2NIXUugeMoQ28U1w20QF+5sOdKiBJ8lFGbqUkaW5ErSIVt/
 /3YLlicO6MacIZ4wG1GV3ODj0yi29Vwzsw8iQ6oINdD7te+YPp7eyFYr3u9hVy7D9m+AtgpqlhE
 1jwS8nFRrDTRBr3vIOIiXi6uTMdXTyROOufwqlETGtvxuy6WC0fZnONEg2PJ8qVsPQNOyCBh0Qe
 KuXhHY2766mkdS+jVh41HhZh7SIw5e2xVOU2um3CFI40O24+xT7NU210IHtd0D59Tlt7f8ahqeT
 gqgGRTtrIZEtR1EJqjwVRMIFU03xVQa0xRCSi0n0lLlN+IbtqaO6q7tuszNI5dmnr83xoxqPSmw
 +ADtjoptZfcndaqEjxeun09qQBsRMAEB6TRQESSXEFwnhpgJx5nYI/WyXlNdMqRoWjIPW9dVcVZ
 2tmiITlPOWGxzTM7M0qFmJKgZds1jse18mQQhDI4U8b1YwJ5dY51NFWt/lDicye1EK9A1LMjS2h
 EuQHxg4sJU6eEe4Iuvo3xH1mzT4yrfSHABnMOF76JT3JLeDs1x8Mp3J67S03B0BKK8z92LlIU4Y
 mvucL86lWwzH1vQ==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Replace open-coded getting root OF node and matching against it with
new of_machine_device_match() helper.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---

Depends on the first OF patch.
---
 drivers/firmware/qcom/qcom_scm.c | 17 +----------------
 1 file changed, 1 insertion(+), 16 deletions(-)

diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
index e777b7cb9b12..1a6f85e463e0 100644
--- a/drivers/firmware/qcom/qcom_scm.c
+++ b/drivers/firmware/qcom/qcom_scm.c
@@ -2018,21 +2018,6 @@ static const struct of_device_id qcom_scm_qseecom_allowlist[] __maybe_unused = {
 	{ }
 };
 
-static bool qcom_scm_qseecom_machine_is_allowed(void)
-{
-	struct device_node *np;
-	bool match;
-
-	np = of_find_node_by_path("/");
-	if (!np)
-		return false;
-
-	match = of_match_node(qcom_scm_qseecom_allowlist, np);
-	of_node_put(np);
-
-	return match;
-}
-
 static void qcom_scm_qseecom_free(void *data)
 {
 	struct platform_device *qseecom_dev = data;
@@ -2064,7 +2049,7 @@ static int qcom_scm_qseecom_init(struct qcom_scm *scm)
 
 	dev_info(scm->dev, "qseecom: found qseecom with version 0x%x\n", version);
 
-	if (!qcom_scm_qseecom_machine_is_allowed()) {
+	if (!of_machine_device_match(qcom_scm_qseecom_allowlist)) {
 		dev_info(scm->dev, "qseecom: untested machine, skipping\n");
 		return 0;
 	}

-- 
2.48.1


