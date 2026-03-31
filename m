Return-Path: <linux-arm-msm+bounces-101065-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0GKgCTbVy2mILwYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101065-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Mar 2026 16:07:50 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A9FFB36AAED
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Mar 2026 16:07:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E7E6B30D0CFA
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Mar 2026 14:02:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E0B6F3F9F30;
	Tue, 31 Mar 2026 14:02:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="tMSRRxGU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D178C3F99FD
	for <linux-arm-msm@vger.kernel.org>; Tue, 31 Mar 2026 14:01:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774965723; cv=none; b=afkP1Se8aae3w22H239rrIy+0Ns3jNANeaExDRlxAt9Xs/ST0tB+p/wBqYVKUx7PNX04Gq0PDWPKGgV2gqQaTRBF0yRu1d2IdRiLiLkqy5hMzxmrn9rDIsQ3nbhHi/xMeosZm0XNUkeygzB5SRQtW60gJ8itDulU6zVPXVgj2AM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774965723; c=relaxed/simple;
	bh=PDgD9m1sXAG6hNkensMGB8zb+sGnox1Y8gux2vXUMOo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gV7dpEajUC4Hdy2whHR23uzq+aJiU7GRM7JWVvsEm+CwemRGGqkIWorl2iR7nQF9FBLLelqiDoeILk933OhjwWQWrlWVm0HQEdd7bZ6FPuPyw9FaBbZQ7OxmEFUuPndGjf0SP4aaFvkRAtO8CM+wbbRIW9HrSp3uGBY+Ch4NK6I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=tMSRRxGU; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-5a2bf521011so57647e87.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 31 Mar 2026 07:01:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1774965717; x=1775570517; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ac1ZXKFRDWaQXxMIkrFurE+eC1IYhavMswMXIL5j1GU=;
        b=tMSRRxGUgKePqVYeVnd0uxfAKgZVG6A8ssA35Yv7RC/eRcm2K0jxNkMIIl2TBqUOiP
         YpgpRg7PphuDmCtcSkXHyPOly9iz3U8LURfcMchrC6jzsNZR4yafaNCJCBAaaltm9WlS
         T5gn40FAfRSo6GwAZ77JQgwQ/qluuC6kfMjq4JRm2JAq1iqhlJ+4u28eHxLUXSqToTJI
         49m4cdlDDOkpO7wqOASai6aMGOcqAKRMYOpNpbExPG1ZyqfYdMQgfSiUrcoRkuPv57uZ
         ws2iXOO4vCCekA8vBbMROmFc3d0tNuh2tWCqDy8Kr2K+lRwC/P1zLpOXnToucI9CMIH8
         bRPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774965717; x=1775570517;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Ac1ZXKFRDWaQXxMIkrFurE+eC1IYhavMswMXIL5j1GU=;
        b=d/LdgFjXsa3SFgsTKBYxp0z5j5d+HSJlnWrhTBU1RhG54fmr+sBQfvNP/fwHl1jVhU
         lASF6kNwCNih1CBmgj9OCgrNS8m1EsI0V2rdhHAgmmSebGewUyZjjZC2iafpdubHh0kX
         G6LAx4c9qqfKR0M+0Piym084ChXor9yTwTUro6a+mXg7oK/aO/X/4TrQTh2nGNHfxPH9
         wEz2HPfIsLRiKrTQN8pv0+4eK2n8QYSCfHp3P/Rmz4/DS4K2cGNc+FKobr2FjyEJz472
         uYkvSdAWfe8lGFTINfSKRrQb7kNznD7o0/rfZgGmtfAueFSIofeRfGIrTiC2d4Y6C2MC
         Ks+w==
X-Forwarded-Encrypted: i=1; AJvYcCUHCqB8/OLzLfKh+8r0H7tRQECyKmgrtBvgpap6hmt3NXmnE0IfOqi9vTulCG3B9dOsaCSAzNXOXBHnH6H5@vger.kernel.org
X-Gm-Message-State: AOJu0YwfreoW1/s1y7n4Bdh93vUzdhVIhkve4eJclSBCaCOdOjF2V5lY
	JqfMZWGNvBxKixHjn+FE3GVJ3/jhqf/vdxVog2u/KFcIxjnhKTTZ7EAxqwO3waXiPlE=
X-Gm-Gg: ATEYQzzoqLr9D/t+PkGh3LR6rtCAQsGldd53thX1XDeGBqmnbZBTlqEJCzIn652iwjg
	bn+nX8Ttt6LHRMwyZw3hjvAOSUi3VcVKedINuwFb5MCp2mMLtYInPX8TKkhrcxm5KcgGrguMZc5
	IEs0riTvIw/KYtoNa2snGm1BP1d/77FOJHX3fc2T54teb2sQcbTzfI44uAFhIauxcZhpmPCWnbC
	Dvd8dJZOatRZzlbyBIbxm8FpLCQMK/W+e+uNSt173w3T/7xdIbZgCIYhF0PufV2BQVhw0PvEvpB
	VLEuHyt2VJ8vmUmk7/7GNVnPigSiB43GIXqVy0LZsY+luuWIoIEG72X7cI6RlunaFK6GkwdfGEK
	KaZABfYaX0j35LOgksz5s7EzLgN+IJklXRuZcg7TPVOdv+pdajgc7vEluG6RssGtLjDMlZtNMZY
	8TD+a6KxbsG7K8gGycErgLbnS6ECLbBrvsf2ZPF+29bezFjcaMmuzFcy0o7qPdPFXLEA==
X-Received: by 2002:a05:6512:39d6:b0:5a2:a52a:c69e with SMTP id 2adb3069b0e04-5a2ab913ef4mr3011777e87.4.1774965717147;
        Tue, 31 Mar 2026 07:01:57 -0700 (PDT)
Received: from thyme.. (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a2b1456aa2sm2434745e87.68.2026.03.31.07.01.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Mar 2026 07:01:56 -0700 (PDT)
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org
Subject: [PATCH 1/2] clk: qcom: common: Add option to link clock controller to power domain
Date: Tue, 31 Mar 2026 17:01:41 +0300
Message-ID: <20260331140142.892579-2-vladimir.zapolskiy@linaro.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20260331140142.892579-1-vladimir.zapolskiy@linaro.org>
References: <20260331140142.892579-1-vladimir.zapolskiy@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[linaro.org:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-101065-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vladimir.zapolskiy@linaro.org,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[7];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:dkim,linaro.org:email,linaro.org:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: A9FFB36AAED
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Starting from Snapdragon 845 times CAMCC device serves as both a power
domain provider with a special Titan GDSC as a top power domain in
the hierarchy and as a clock controller, where the clock provider
function of the IP strictly depends on top Titan GDSC being enabled,
thus it makes the CAMCC clock controller to belong to Titan power domain.

Today the formal hardware dependency between CAMCC power domain and clock
controller is managed by runtime PM in every CAMCC consumer device driver
like CAMSS and CCI, however this is terribly scalable to any future
CAMSS IP device drivers, and unfortunately it is not scalable at all
camera sensor drivers, which are also CAMCC clock controller consumers.

The change adds an option to describe CAMCC power domain to CAMCC clock
controller dependency properly, therefore runtime PM management can
be simplified on the CAMCC client's side.

Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
---
 drivers/clk/qcom/common.c | 16 ++++++++++++++++
 drivers/clk/qcom/common.h |  1 +
 2 files changed, 17 insertions(+)

diff --git a/drivers/clk/qcom/common.c b/drivers/clk/qcom/common.c
index eec369d2173b..558823e220a8 100644
--- a/drivers/clk/qcom/common.c
+++ b/drivers/clk/qcom/common.c
@@ -144,6 +144,11 @@ static void qcom_cc_gdsc_unregister(void *data)
 	gdsc_unregister(data);
 }
 
+static void qcom_cc_pm_genpd_unregister(void *data)
+{
+	pm_genpd_remove_device(data);
+}
+
 /*
  * Backwards compatibility with old DTs. Register a pass-through factor 1/1
  * clock to translate 'path' clk into 'name' clk and register the 'path'
@@ -424,6 +429,17 @@ int qcom_cc_really_probe(struct device *dev,
 	if (ret)
 		goto put_rpm;
 
+	if (desc->use_rpm && desc->cc_gdsc) {
+		ret = pm_genpd_add_device(&desc->cc_gdsc->pd, dev);
+		if (ret)
+			goto put_rpm;
+
+		ret = devm_add_action_or_reset(dev, qcom_cc_pm_genpd_unregister,
+					       dev);
+		if (ret)
+			goto put_rpm;
+	}
+
 	ret = qcom_cc_icc_register(dev, desc);
 
 put_rpm:
diff --git a/drivers/clk/qcom/common.h b/drivers/clk/qcom/common.h
index 953c91f7b145..7661a01d8e82 100644
--- a/drivers/clk/qcom/common.h
+++ b/drivers/clk/qcom/common.h
@@ -48,6 +48,7 @@ struct qcom_cc_desc {
 	const struct qcom_icc_hws_data *icc_hws;
 	size_t num_icc_hws;
 	unsigned int icc_first_node_id;
+	struct gdsc *cc_gdsc;
 	bool use_rpm;
 	struct qcom_cc_driver_data *driver_data;
 };
-- 
2.49.0


