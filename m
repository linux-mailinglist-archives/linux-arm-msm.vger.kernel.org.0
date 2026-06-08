Return-Path: <linux-arm-msm+bounces-111862-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id fSJPLS+xJmr7bAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111862-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 08 Jun 2026 14:10:23 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B0A8655FD5
	for <lists+linux-arm-msm@lfdr.de>; Mon, 08 Jun 2026 14:10:23 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=linaro.org header.s=google header.b="FVs/+zIp";
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111862-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111862-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=linaro.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B5B3C303B7F2
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Jun 2026 12:06:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 209C0376467;
	Mon,  8 Jun 2026 12:06:17 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E882376A1A
	for <linux-arm-msm@vger.kernel.org>; Mon,  8 Jun 2026 12:06:15 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780920377; cv=none; b=s30gdQlz0vGzsH+MVf40Gk2RWotDvMuKzV72Lbl9ME+F9GGhl+x7dmXk7wIG8inAwSwVdWTJpe++jO6I1IbwCNh614g9dHDpqnLmw63ki4OnwF1xwKGfELr8UJpHRM/ivIlZaMRl0XhAsQ7HIeb7UOIzkwUmszW0fT3ihOvAK6Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780920377; c=relaxed/simple;
	bh=psdlKRmlMOyfEpNVz9NH/d/+Z7S/hNOJKN2k6tGs9l4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=adXOITYiYziQxrNd5zmjQEbyOotjYci5HZteHHFL30fekjcyFxSfDZA++3tYrpZs8jhIevH1CxTXX2/1IBGWNdLSb2NW5YnIBK3WuHnwTPnwjIrZ/QqTGq2AG3QTXxAq3Xf6bfCYhpchNBSi0e0Ce2bhofu8za2HZWwe3/BolZE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=FVs/+zIp; arc=none smtp.client-ip=209.85.128.43
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-490ac357c55so47623065e9.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 08 Jun 2026 05:06:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1780920374; x=1781525174; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=z4Ag4hwxXni0Q4GlZ/0SV/0r7HfMZXBXNEFUido3hDw=;
        b=FVs/+zIptN7ALy/+pDqBgZ1zYqSN3/GGUQKArnJyLz/AdDlcc+TrrNnDfi/QxTSgep
         Wv/5vMiND7Dxw1pi8qNga0OWaAzMFsfnFSUj0srUeyJNbU4D0s1kkDdELKVXEuZ62MaK
         tRN08+h/nzvt2h7YyBftfAq4TXe7yoevWdiTf8thCEswCU4Ifvdt0/sXjTcamAFBhUm3
         OQQ3YhYBabYY9jmiA+/p7CFmqeoXYKLzW0Ujj7HWMJ1LXiMPxN5N01Fef/7sBuJ69oRI
         4jfcacQ03WyI3jnMlf8Mq7hMCPFC25r7J8Zf1UXtdfKPj+MOSm61TVWCiGPgEYl2bhIz
         o9dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780920374; x=1781525174;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=z4Ag4hwxXni0Q4GlZ/0SV/0r7HfMZXBXNEFUido3hDw=;
        b=sv7Wi1D2Y5lPKcJa3Y+0vIXf9ijwts1uMU7uE0OXzQwc4R7SF+2QjnhbKSOWDZ8lyp
         1P9YZ0OXW3iXx1r5dZRp3/ARHdlKCpRyRQ3uT/z26eTnQHP0qITbihPAFcE9AVYewGqJ
         nCrdo3TfeO7pfSBCmObVyEPzFwIundUi2Zd2EM3QT3NvAymzue35U/jaLPirRUOQce6x
         sVTVJAkQhOpnsVZu3TtQBqDKRHleNiLwBo7MwmZGG03jgXBEFm2DgfMzY8qfXEO5DNph
         vQxZh3+nRLFoNI3C7M/ySHgAw62pGXlMp0Hm3DN/+InrcG79hvZeLGglcO21EIFH88XJ
         B1WA==
X-Forwarded-Encrypted: i=1; AFNElJ9iDVPM6jwc0a8dRym8T1IBUUTx9J+xH9BDplaWwD4EvkMvkuoRH5a1vBHVnxaR4mpyEbWVBzhfAKWKOAoA@vger.kernel.org
X-Gm-Message-State: AOJu0YwXcItj6mpaqzoSFj9viJafX7bqfRU4z6SERWSvebTYu3fJxRgJ
	cVB+twkUjLxl04Y60cSUkifAaziM/i1fYGRaXmAyh3YGI9vP3wRZyCRqt+B9I4DKhHc=
X-Gm-Gg: Acq92OHva0vQdMRkPElPF1tY9HR0aneoX+KbqorEU+NZ1BPhGy7YDYkuJDKW5Ka2wVH
	dz+ZaFqUsWAdogUE0vvQFp+980JdGH4ZObPgZfhxTrg6vkvz5W8KGsuJPC0cB7on2GSJl4vU7io
	2Hbsiq6fGJP7mmVibPwMi1NxGaXWNymEKhOYTsaW7FrafsZFqwr1xPoqp6RmBKa/3gLYFY5rkto
	k7nWG5LADTYwV9KKPuZmmvKyUc25DoRefS/cizsJflHf142nDG83V3Jo9XuItGnoi02Cwb5dH/j
	GVzycZU1sAdHCYWWhdCMGSk67i5fxkEfpnLQRtzRdIXarX8SY6pLRdkUhpkARWqmxshbnB37EQz
	ndwItjUfWL8bAvK1Dtf6wVOyAKawdItZLDK5+ho0/yi1abfRg9RPOYA96BEhn35s4pFoMDxKhwD
	bb8C0jJBFlLAhn+regm9hMDKkX4i6qYGuyeDqCGke45Fr+EGY=
X-Received: by 2002:a05:600c:c0d3:b0:490:53b0:9e53 with SMTP id 5b1f17b1804b1-490c265c107mr211049105e9.1.1780920374045;
        Mon, 08 Jun 2026 05:06:14 -0700 (PDT)
Received: from [127.0.0.2] ([2a02:2454:ff23:4410:7dca:9001:34e4:f362])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490c2d30eeasm250331745e9.1.2026.06.08.05.06.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2026 05:06:13 -0700 (PDT)
From: Stephan Gerhold <stephan.gerhold@linaro.org>
Date: Mon, 08 Jun 2026 14:05:44 +0200
Subject: [PATCH 2/2] regulator: qcom_smd-regulator: Add PM8019
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260608-rpm-smd-regulator-pm8019-v1-2-c671388b9ea5@linaro.org>
References: <20260608-rpm-smd-regulator-pm8019-v1-0-c671388b9ea5@linaro.org>
In-Reply-To: <20260608-rpm-smd-regulator-pm8019-v1-0-c671388b9ea5@linaro.org>
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Andy Gross <agross@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
X-Mailer: b4 0.15.2
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-111862-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:broonie@kernel.org,m:lgirdwood@gmail.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:agross@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[linaro.org:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[stephan.gerhold@linaro.org,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[stephan.gerhold@linaro.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:mid,linaro.org:from_mime,linaro.org:dkim,vger.kernel.org:from_smtp,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,gerhold.net:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 1B0A8655FD5

From: Stephan Gerhold <stephan@gerhold.net>

Add the definitions for the regulators in PM8019 to allow controlling them
through the RPM firmware. Reading the TYPE/SUBTYPE registers using SPMI
reveals that PM8019 uses a mixture of regulators from PMA8084 (hfsmps,
pldo) and PM8916 (nldo).

Signed-off-by: Stephan Gerhold <stephan@gerhold.net>
---
 drivers/regulator/qcom_smd-regulator.c | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/drivers/regulator/qcom_smd-regulator.c b/drivers/regulator/qcom_smd-regulator.c
index 3ee7f5d0c694..23ed594b574e 100644
--- a/drivers/regulator/qcom_smd-regulator.c
+++ b/drivers/regulator/qcom_smd-regulator.c
@@ -913,6 +913,28 @@ static const struct rpm_regulator_data rpm_pm660l_regulators[] = {
 	{ }
 };
 
+static const struct rpm_regulator_data rpm_pm8019_regulators[] = {
+	{ "s1", QCOM_SMD_RPM_SMPA, 1, &pma8084_hfsmps, "vdd_s1" },
+	{ "s2", QCOM_SMD_RPM_SMPA, 2, &pma8084_hfsmps, "vdd_s2" },
+	{ "s3", QCOM_SMD_RPM_SMPA, 3, &pma8084_hfsmps, "vdd_s3" },
+	{ "s4", QCOM_SMD_RPM_SMPA, 4, &pma8084_hfsmps, "vdd_s4" },
+	{ "l1", QCOM_SMD_RPM_LDOA, 1, &pm8916_nldo, "vdd_l1" },
+	{ "l2", QCOM_SMD_RPM_LDOA, 2, &pma8084_pldo, "vdd_l2_l3" },
+	{ "l3", QCOM_SMD_RPM_LDOA, 3, &pma8084_pldo, "vdd_l2_l3" },
+	{ "l4", QCOM_SMD_RPM_LDOA, 4, &pma8084_pldo, "vdd_l4_l5_l6" },
+	{ "l5", QCOM_SMD_RPM_LDOA, 5, &pma8084_pldo, "vdd_l4_l5_l6" },
+	{ "l6", QCOM_SMD_RPM_LDOA, 6, &pma8084_pldo, "vdd_l4_l5_l6" },
+	{ "l7", QCOM_SMD_RPM_LDOA, 7, &pma8084_pldo, "vdd_l7_l8_l11" },
+	{ "l8", QCOM_SMD_RPM_LDOA, 8, &pma8084_pldo, "vdd_l7_l8_l11" },
+	{ "l9", QCOM_SMD_RPM_LDOA, 9, &pm8916_nldo, "vdd_l9" },
+	{ "l10", QCOM_SMD_RPM_LDOA, 10, &pm8916_nldo, "vdd_l10"},
+	{ "l11", QCOM_SMD_RPM_LDOA, 11, &pma8084_pldo, "vdd_l7_l8_l11"},
+	{ "l12", QCOM_SMD_RPM_LDOA, 12, &pm8916_nldo, "vdd_l12"},
+	{ "l13", QCOM_SMD_RPM_LDOA, 13, &pma8084_pldo, "vdd_l13_l14"},
+	{ "l14", QCOM_SMD_RPM_LDOA, 14, &pma8084_pldo, "vdd_l13_l14"},
+	{}
+};
+
 static const struct rpm_regulator_data rpm_pm8150_regulators[] = {
 	{ "s1", QCOM_SMD_RPM_SMPA, 1, &pmic5_ftsmps520, "vdd-s1" },
 	{ "s2", QCOM_SMD_RPM_SMPA, 2, &pmic5_ftsmps520, "vdd-s2" },
@@ -1390,6 +1412,7 @@ static const struct of_device_id rpm_of_match[] = {
 	{ .compatible = "qcom,rpm-pm6125-regulators", .data = &rpm_pm6125_regulators },
 	{ .compatible = "qcom,rpm-pm660-regulators", .data = &rpm_pm660_regulators },
 	{ .compatible = "qcom,rpm-pm660l-regulators", .data = &rpm_pm660l_regulators },
+	{ .compatible = "qcom,rpm-pm8019-regulators", .data = &rpm_pm8019_regulators },
 	{ .compatible = "qcom,rpm-pm8150-regulators", .data = &rpm_pm8150_regulators },
 	{ .compatible = "qcom,rpm-pm8226-regulators", .data = &rpm_pm8226_regulators },
 	{ .compatible = "qcom,rpm-pm8841-regulators", .data = &rpm_pm8841_regulators },

-- 
2.54.0


