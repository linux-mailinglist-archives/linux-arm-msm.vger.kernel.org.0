Return-Path: <linux-arm-msm+bounces-10991-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C74C9854901
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 Feb 2024 13:16:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 83AA9286910
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 Feb 2024 12:16:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F17DD1B959;
	Wed, 14 Feb 2024 12:16:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="o2SmQ6Uj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2553F1A58E
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 Feb 2024 12:16:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707912980; cv=none; b=PZa6h30kkZnmzSlRa7SXhTCgJvPgJG6pC3kh1r72qllftMrfPT48vWK6V4lDO90jrcdufpvh1r1FvuOSzfeHnicqjw5RMHR6f7B8GDsojq6llCHdVVsI6RJ3YD4hECzOxrmwWD/KVxdQokGxYGb+/V9hHDnjhS+R5CaxcGmv6nU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707912980; c=relaxed/simple;
	bh=P4QhJcesqbYNm9nO2fZ1EuiQnbIfQyGBttkwBRDMqKk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=mhxy1TNLNu8vRRNjh0GYkbJLrRJtgWVYttZ0RR4FvFKjBsUbbaj2VvLC9nhbFp0HQscw9onwRcAnKF8UOmTfDhVdQ8LkFvLXZRl9+cu3oJNzy8ciJTECVZFmapvTacarpq75a3USWkdcD2bONuY5Bedm2/qnkXset9nibQF9G2w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=o2SmQ6Uj; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-3394ca0c874so3647659f8f.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 14 Feb 2024 04:16:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1707912977; x=1708517777; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=GhHuiCAcyptrdbLMF5Odf/hTRL9Avb+7UyPysoDXBIg=;
        b=o2SmQ6Uj/Il3isavHk6kGghuiOGxm8oTJBnpDSNtAfh9l3BoQuw4+UnlVsuyAQ6NbP
         htg3yb3pktmP+0+H8UY0xWZWjEQjjgjqTGXN7nB2Q+ZmihAVpwdintDupK2vlZQJ1Kp0
         n2YHvjyQZXMsyGA8bk5LvzDtD58pzCV0+Im1tvulfhp0mHv6z1yLYJj2/VzHHrIjJm98
         yEWeb7KZGqXpaX59yfBepxlPoFWktbaOqaQf00J0ZOMqbhS6ioEoys86IIQhavMSj9j/
         PSJPY/68yH2j1+QmzeZvkxMTvcQg0+IMSWjJjJzKUAjjhVvksAW8LnbouoWPg0PKXAwT
         9cLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707912977; x=1708517777;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GhHuiCAcyptrdbLMF5Odf/hTRL9Avb+7UyPysoDXBIg=;
        b=HQXNcVDIVSHhash7Hb1InKSJFN5MvQYA6YPy4yEplddUTaJ9mQQdKfaqMfcyznSx5D
         p+TNTh+i59ju3vF6W6FNq9KjT2EpXH0oTb1lQJIfcipXckizgIf1OTMF8hNGD0u3ahVk
         O8cJgiJGs5tsKoxrB04r/niJIZBKP8UpXnQPZq121BXga9SpRFBQZyyUhIXs+lt9mQC9
         7bJEt8Afx2dygrUFar8PoyOkeXHjLbXG4yq3F+X43O9zt46wU9FDLgAJPWNTPpdwqYUk
         8bnprIDGNUa/rEGWofgIoMW4MsAT7dl/GG8rCyHCTmfeEoq35Um/HoSBiXMJAsFrfeSO
         C3oQ==
X-Gm-Message-State: AOJu0Yyp+G4/aX0o/taPT49KUNtGjsYrt0UmluwungkjdKKXdQzRIIYx
	ekm3BOyaGgrNlN8arCyfM1TmlY8ooHDkIDSniZEplB40j4MYOh9MlO5TFZSGtec=
X-Google-Smtp-Source: AGHT+IEZPuXLUFYYxcSL8OAqOoYeglhWN9m+WjGxYtIFnQojbHYLLYoQLgiKhsFp4RuPw4A0wlimsw==
X-Received: by 2002:a5d:618b:0:b0:33b:87c1:c51 with SMTP id j11-20020a5d618b000000b0033b87c10c51mr1616668wru.17.1707912977343;
        Wed, 14 Feb 2024 04:16:17 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXz/1HEPbuSKpdtkHcO2L0svgXhaeUDI1M+OwwgkRZs7ANreAgQ4dGQdI9AzQ7tkZOiGk9cahz3I4l+81PMEFtQliPZlAtXCnyEsrHOqKTRsGMaAxQk7WADa1YOSACvPeCYpJ3ZNq/0DuD7+Fwj3v8XVXFINRbV6VFmnqpnbJzLyCewIgTd0zAkn5f9E4B8pYvO/Qo4mSO+Ciaum4OXN+Axco9enKhIz7/hm5VS2+5KDPXrHN7DMYpH4qF0XYOwb0hgcJE/kC6oowBSTRWsHVsoRAiMNCBgJaHfGovO8w04aLe3D4EOeyvz/jZcA4X12PC7t673ysC2
Received: from sagittarius-a.nxsw.local ([176.61.106.68])
        by smtp.gmail.com with ESMTPSA id g7-20020a5d5407000000b003392206c808sm12195824wrv.105.2024.02.14.04.16.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Feb 2024 04:16:16 -0800 (PST)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To: bryan.odonoghue@nexus-software.ie,
	andersson@kernel.org,
	konrad.dybcio@linaro.org,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	quic_fenglinw@quicinc.com,
	quic_collinsd@quicinc.com
Cc: linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	bryan.odonoghue@linaro.org
Subject: [PATCH] regulator: qcom-rpmh: Fix pm8010 pmic5_pldo502ln minimum voltage
Date: Wed, 14 Feb 2024 12:16:14 +0000
Message-ID: <20240214121614.2723085-1-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The relevant documents and the dtsi specify the minimum value at 1.808v not
1.8v.

Prior to this fix we get the following error on boot:
[    1.353540] vrej_l3m_1p8: failed to get the current voltage: -ENOTRECOVERABLE
[    1.353544] qcom-rpmh-regulator 17500000.rsc:regulators-9: ldo3: devm_regulator_register() failed, ret=-131
[    1.353546] qcom-rpmh-regulator: probe of 17500000.rsc:regulators-9 failed with error -131

Fixes: 2544631faa7f ("regulator: qcom-rpmh: add support for pm8010 regulators")
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 drivers/regulator/qcom-rpmh-regulator.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/regulator/qcom-rpmh-regulator.c b/drivers/regulator/qcom-rpmh-regulator.c
index 80e304711345b..767a17fe0d51b 100644
--- a/drivers/regulator/qcom-rpmh-regulator.c
+++ b/drivers/regulator/qcom-rpmh-regulator.c
@@ -757,7 +757,7 @@ static const struct rpmh_vreg_hw_data pmic5_pldo502ln = {
 	.regulator_type = VRM,
 	.ops = &rpmh_regulator_vrm_ops,
 	.voltage_ranges = (struct linear_range[]) {
-		REGULATOR_LINEAR_RANGE(1800000, 0,  2,  200000),
+		REGULATOR_LINEAR_RANGE(1808000, 0,  2,  200000),
 		REGULATOR_LINEAR_RANGE(2608000, 3,  28, 16000),
 		REGULATOR_LINEAR_RANGE(3104000, 29, 30, 96000),
 		REGULATOR_LINEAR_RANGE(3312000, 31, 31, 0),
-- 
2.43.0


