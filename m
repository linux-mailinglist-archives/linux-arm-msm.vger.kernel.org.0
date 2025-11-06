Return-Path: <linux-arm-msm+bounces-80658-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id F3255C3D348
	for <lists+linux-arm-msm@lfdr.de>; Thu, 06 Nov 2025 20:13:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 3E7AA4E5D67
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Nov 2025 19:11:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 82F62351FD4;
	Thu,  6 Nov 2025 19:08:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="iDLrhueV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA483358D20
	for <linux-arm-msm@vger.kernel.org>; Thu,  6 Nov 2025 19:08:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762456121; cv=none; b=GeOSL5oOSlXRvgNthb72nXXUh1+8NoorFsNO74Y3xanE2/tWOjUdVYpmy1ZdHOWU4P0xxmvPF89HHFXgGyWCJQS5O9HeL0kxkROHjtRJxVSkaUUw34TMwIa6o6tya/SfYHd3HuHPtHT6SWVVycI9HiWP/sxvr0cp97USYbZT9Gg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762456121; c=relaxed/simple;
	bh=duU5u56PDy568nC9gTgD/sRRW1Kja+NAYhWyt8rAuUM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MQlBAKPxSsBcJE23m2ynbr60OjoZO/BDGqIj9OSJIJd7iaU+8JMvl1XW7QmOv6tqLYjRZEKkEVz+FGpw1asDFaV4wY8mDM3Zsm/V2ek6A19yHdzZ73AnfTYf+AdhhQ6RM9Ac8vqLRwD9gxVmGmk7q9/KBfwKb61fAdHJdws/9Mk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=iDLrhueV; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-640e970598cso244750a12.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 06 Nov 2025 11:08:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762456116; x=1763060916; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YCEpBcWqzOzxXS+spa/CGSDCftzF1chyjPQmDO6LlhQ=;
        b=iDLrhueVLDgcz0P30hT8Hucm3xNNZnhXdG6A4k1joRn7iu0/I+jiHJ5VIZ/QWp2k8e
         yPgCwF+1Qx+OnmZZce2NBtduUsOn8yNicMTGCWXAQ0JEnijIGu39UIGuGLM115kqzbKx
         nHiNcy8QPAFZMTvFSMU7gk2HlUEVzO46BP7woaG7oH69hLYl+q6nKgMJ356485Bcrpin
         0RMNrw7SxTeGGWPUThb3sSuDLfYL9yC2Afm9yYtz4VbBu5gBw8kQXSAEx/BpQjEIIvwg
         lTM1ghMQWOohECkZW4A6DoCmbWlr4iD/pUC9ONPMIcHfHYzebUGD26yX7V/GaRZTLmmd
         T9dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762456116; x=1763060916;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=YCEpBcWqzOzxXS+spa/CGSDCftzF1chyjPQmDO6LlhQ=;
        b=nDMZCP8wQw83/TMVbRmyGcdjniooWiTiDBbwkHJiw3/KWHYbyPV7/5F2W7l4mrQw0k
         2+MUkQJoRGOkAcQY5WSp8PZQDvkETb7VWR0A2k91qqhh9S1m9v7T/20m6eIWaDebB3zd
         AxHlfEY8Ah0o+ITxSi1yHNpjDn21EmnUo2DARiZ2nnvooe+thqj0GE8146zT+XaQcaDn
         HK0f3pOAWrWQdnXKK6x2FXjUu9Gpi6wKy1XP5dUTsOCJ7FJHSoF5WxZbTu9u+eyXXmMA
         2fhSfuO1t6GfG+ebzjRhHkcSCrSEsTcLd0t5jK+A1ytjVjjqASJrM9wxw5/n5rdCnpH3
         q+zg==
X-Forwarded-Encrypted: i=1; AJvYcCXs/ETgclRw98ewxKk1wTdIzw44cOzQuJQszbfHjz6BjSt3kzRghtgl/KX1dtZjMDJGfKI/aIx+Qz0wQS7S@vger.kernel.org
X-Gm-Message-State: AOJu0YzgvhDk6SdKHKD/8Ybi2HT2JSy4nuYvDO0seeUP43ZnWPfURb4q
	oG+jW4YQCnp2Lo9EkTkfRMFRwiON2LQV0ePhVCNnNX/SUI5xtD1hpIg7Hhdfb7Xg0eU=
X-Gm-Gg: ASbGnctGNCUOcUp6ExcZiPL0MjXOien/A0iILgPb4rCJaKRfVphBRfVum1LAeiAVgXj
	6wfdbsU1bsD1lbOELfL1OLzUTTwIBRRaIM9FRUmgYe2A9hu8tWibWQ/4pMkMFjnAM53khEo37dH
	KROahhzjkNaFetC3tyfj/i+27AXRH7kmxmbyjGfiZ8FVu80G/oOli4KvjvjYmQRWJYf8tkdJG+q
	JaVf9z+qbZUK0E3FulKpdOULKdXMNQAehG9VFHRVh25DIkSPjsSnwJQ0VXq6eaMcHORwf3cGi2j
	8hrzDB6GmW8O+mDNREjYeE2Y0HXxEFCVnQzEjCZxVX3cWgmq0+FTbAyv9N49iKTydjUaR2Xl9cr
	WtXMToU+eY0Yd5FLX3VCCZTmTlx4qc8c3s158vG2SvBuzdFG5gnjaYiTUMT+8l34orda89YZ/au
	/d4zWbuk6Q9DDmMzA/
X-Google-Smtp-Source: AGHT+IGtACsnNdaWz105iCINoWr5n9UXht5NcROgRS6+92tcuuFFCVXa8Xeak1w/fHe1KKxJJQTUmQ==
X-Received: by 2002:a17:907:86a1:b0:b70:ab64:434f with SMTP id a640c23a62f3a-b72c0a8cb89mr17450666b.6.1762456116128;
        Thu, 06 Nov 2025 11:08:36 -0800 (PST)
Received: from [127.0.1.1] ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b72bfa2510esm26739566b.72.2025.11.06.11.08.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Nov 2025 11:08:35 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Thu, 06 Nov 2025 20:07:19 +0100
Subject: [PATCH 12/13] soc: qcom: ubwc: Simplify with
 of_machine_get_match_data()
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251106-b4-of-match-matchine-data-v1-12-d780ea1780c2@linaro.org>
References: <20251106-b4-of-match-matchine-data-v1-0-d780ea1780c2@linaro.org>
In-Reply-To: <20251106-b4-of-match-matchine-data-v1-0-d780ea1780c2@linaro.org>
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
 linux-tegra@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1291;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=duU5u56PDy568nC9gTgD/sRRW1Kja+NAYhWyt8rAuUM=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpDPITu0xcd1Xu7SDbTfboqrqtm0O8I5f3k4GxJ
 sb3DuVcYy6JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaQzyEwAKCRDBN2bmhouD
 13hVD/4nWu9gGWq6/LJwCrfVYOFlQ2hUn93EjQWiFRTwwmgC9sbS3NA9MR19W+gEIdKMVerKLcR
 qWz4RXbJ3AR8qwBVAgGhp5mP8v68fVp06zYEjKkmsDZd1zJYY6QRtlVK4l5h0J+my+9zwRl8O+Q
 YzKoXLBhxFNRiLPny1JxlIa1yaTC6CNYWDt04MnQmbnPJehWYg1NUbSWkF6HsEdtyFhqGcvc/+B
 9uZA72RelClKR8PfknzlUexnJVx/QyUbApsMuxODlLZaZAV7oL9xM4Zqgxolw1524IZe2eDPBgD
 KS1EquOwIM6NUJIbkQ0MTBy48To3g3jW7ssf0ktGE7EI1tPR3YvdCgq4R9h6yWDw3KaquxNvqRM
 JBcv1EnddNFIiMxi05AfKZ5xkuWv4dxzdVQqw8kgF6p9YpgE8ib3h3WM5JtHXptC3QswTi8sspr
 HocdHYB2mNKGLOKFSZ+4N+xnPr/oO49a15Nl0B1bNbdKTUmPBLfIn5f2jGjRubu6zmW6mF9m132
 6WsB6B1i6jZUXmWjgSvfn4pc092phlb0LULHZfbJSgzsN/y0xTkKM3TihUIYS0w34xthKyg8Zk3
 pRt3JEIKc/Qm4FALNBmlQN6hGotDxh4wfz1G2vFQhMROvMlxYyGvu+V0LTe0qSvGDwveKy11LUH
 1LudEj4LNSbfXzw==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Replace open-coded getting root OF node, matching against it and getting
the match data with new of_machine_get_match_data() helper.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Depends on the first OF patch.
---
 drivers/soc/qcom/ubwc_config.c | 14 ++++----------
 1 file changed, 4 insertions(+), 10 deletions(-)

diff --git a/drivers/soc/qcom/ubwc_config.c b/drivers/soc/qcom/ubwc_config.c
index 1c09796163b0..1c25aaf55e52 100644
--- a/drivers/soc/qcom/ubwc_config.c
+++ b/drivers/soc/qcom/ubwc_config.c
@@ -301,21 +301,15 @@ static const struct of_device_id qcom_ubwc_configs[] __maybe_unused = {
 
 const struct qcom_ubwc_cfg_data *qcom_ubwc_config_get_data(void)
 {
-	const struct of_device_id *match;
-	struct device_node *root;
+	const struct qcom_ubwc_cfg_data *data;
 
-	root = of_find_node_by_path("/");
-	if (!root)
-		return ERR_PTR(-ENODEV);
-
-	match = of_match_node(qcom_ubwc_configs, root);
-	of_node_put(root);
-	if (!match) {
+	data = of_machine_get_match_data(qcom_ubwc_configs);
+	if (!data) {
 		pr_err("Couldn't find UBWC config data for this platform!\n");
 		return ERR_PTR(-EINVAL);
 	}
 
-	return match->data;
+	return data;
 }
 EXPORT_SYMBOL_GPL(qcom_ubwc_config_get_data);
 

-- 
2.48.1


