Return-Path: <linux-arm-msm+bounces-105458-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SF7sMN1w9GmKBQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-105458-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 01 May 2026 11:22:37 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 74BAC4AB4AF
	for <lists+linux-arm-msm@lfdr.de>; Fri, 01 May 2026 11:22:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3CF373038C7D
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 May 2026 09:18:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 83976382F03;
	Fri,  1 May 2026 09:18:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="OkGJbttg"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 451B03822A6
	for <linux-arm-msm@vger.kernel.org>; Fri,  1 May 2026 09:18:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777627123; cv=none; b=MysTnfSsy5SbbB7Wa1hSm5oYDBRiMs+WkfBdNsdJy9HS/u1zxHqJgACUF1wq0GMZAZPw7L+ZYI90qvoVSPsPrP3lyaYA0IBcOZsh+C/kAVGEfQDGiwMUHFZhLQ11WWxpnJbJKmnyWotZRhGNy+OA48LxzWyyCmHL33kfjMgcyVk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777627123; c=relaxed/simple;
	bh=vBFY+SmJjtC4cED2P3MAEeeRdb2vcanu7b6d3HDV3KQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZyGz8/ltz/Zza0d71E+JbgoUiXQ222VN3ugMwAemZh9J9WcQip84az06mw70/p6diwieADsYuIWtSxEI9dQKuRRPPQBovuSJDS3jGOx41ZAWIHakERdy6yeqBt4dyUktKVYQ+shtLvnu3FefXQjIxFeIs0iNpDKziTCOTrrGSJ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=OkGJbttg; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-43fe62837baso983460f8f.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 01 May 2026 02:18:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1777627120; x=1778231920; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+NWZu4H8hGDWhTzeuuLpxUjYIGK3vSOADuGQvxmMAgI=;
        b=OkGJbttg64JsfHR29FtQGErbF+buYxGQi7RjA49TSFM7+P9Z0qlFUUZb6utpBdRjDX
         yevRR/39ff9IiWQz+fw2IRfQ9a94GBOSCoFYjqUfPn0RoiD65JMV1Hu66vv6jdWg0FTW
         9RGYnG/mdHC/I8tDla22xCkw6oMisSNvqcOIz9yXCMBTeWR4Vv1lnmnTW8A3nNMSyofU
         ye3HnJmSKzCK9LDWZ+hm/2uQ3mciJkWF29kF/DyN8WsFPYiEE0nTlioZYvzOFZVaRi3y
         HXaWnvsBKiWpnDNqx6nG6wl/TH2KCFfbaI/8wyis43sBJKqeh2lZrjs+FOgqYhjnffjO
         siTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777627120; x=1778231920;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=+NWZu4H8hGDWhTzeuuLpxUjYIGK3vSOADuGQvxmMAgI=;
        b=kv2SsqOl9DZc78XBuwmujNTU4efEGxza5KQtVndKYk+DP4FIznRX1igzGoVX8jFwJg
         mjsZEDJE3c+IM62b3czOLJhBJBscUEgZ5NMuSeugQFpPmm7r4EB2XPZUzBsSWawIWYfE
         hJKLko1jR8UKZkGXEs73HE4jkglwU3IIQNp7ix459qjIgIMnuhAA1RYVtErDKVcWV7cP
         80x4g+P0QgN+v8k5LD4eVE01hZPJd85kGnIFkSs03OPT5LFxeufIEyJKuTSzF7fRoYWZ
         UolE3zK8w5HrNhB89jTBOnxxfAM+X+aDcp1bSCAC3M8KXu9f6IywV0tQlNFL4dP8UJrq
         WWWQ==
X-Forwarded-Encrypted: i=1; AFNElJ+qk1yRh50Lk3jKyb2ZUNTMLglGPKj+sC0QkTrUKHqVKD348aLITTu5U5QoHfREdXUS92bqdvHtNqLyz4YF@vger.kernel.org
X-Gm-Message-State: AOJu0YyZz+TtS7E94DvBLwj208q+Tc1hfeN08YiGEMy73cb1zoXPuw37
	JCN4lacCfsLOWZ+kJbTac3gy+kieftdL6g9Zjy3WWRe4L6PwR+14f1L6j09t2tweWao=
X-Gm-Gg: AeBDiesiADOwOfM1tmGi24NmtKtapmzouDX+avAJAi/4sfkulwa+s/2MpRKSoJdYn9A
	oNE03VvfjSmYmtlRCabqDsbvEFygn1ps7t+FG5Ls82r/+eYnn6a1s2hJv2s+9Oxez2/j61kfhY3
	+Qx9X8X6jCttsO5UI3quNG5ZLyfrW8WjRTbnRGZDDaJTeFGlfh4GA+Ry9m6WLWJ1XaZdPVV7qSL
	63SfMOC45aZqqhgEUq5Yp2co1SZipJ0OeAoYyM5WO20dkjFxr9SbZmwHKeJn60SpywOT/HHc42G
	gWOwjTaCgzkVh6Hq5E66HS75ExmMrYYv8WfuA6XJOp8ua1YLeZp0KvNbL9bM293p91WiGUmXLRQ
	GcsfRWbgdbdzn5KDDAyHCIs34u9BcIWrlXJklV2qUn8+Pqj8ekhfDFUcWkWhRhfuXqed3ESh4+S
	AUoNneXJEpqegPq1sM+qcX8pBE3ZV5quc/eXkWGek7bNllH6t0uX1aT7ie7j49ww+D1DGkjmr7X
	GUnbu55s1QI6EBs9/I=
X-Received: by 2002:a05:6000:26c8:b0:43f:e22f:606 with SMTP id ffacd0b85a97d-4493dbdb55dmr9921190f8f.2.1777627119767;
        Fri, 01 May 2026 02:18:39 -0700 (PDT)
Received: from [192.168.178.36] (046124199213.public.t-mobile.at. [46.124.199.213])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-44a98b76fd0sm3820787f8f.35.2026.05.01.02.18.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 May 2026 02:18:39 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Fri, 01 May 2026 11:18:31 +0200
Subject: [PATCH v2 3/5] clk: qcom: gdsc: Support enabling interconnect path
 for power domain
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260501-milos-camcc-icc-v2-3-bb83c1256cc3@fairphone.com>
References: <20260501-milos-camcc-icc-v2-0-bb83c1256cc3@fairphone.com>
In-Reply-To: <20260501-milos-camcc-icc-v2-0-bb83c1256cc3@fairphone.com>
To: Georgi Djakov <djakov@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
 Mike Tipton <mike.tipton@oss.qualcomm.com>, 
 Taniya Das <taniya.das@oss.qualcomm.com>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777627112; l=3296;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=vBFY+SmJjtC4cED2P3MAEeeRdb2vcanu7b6d3HDV3KQ=;
 b=CuTWQZHPEoyAXshMVDX/yFOliGYdtzkkaIyHmaARqIg+fK+dPGUD9DrAF/BygWOYwuNS1kwTD
 pY2qmH0nSh6AoW3Hgdksd32nIiZDTh6dxuesD52F6aclCMmxBm7fxhc
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=
X-Rspamd-Queue-Id: 74BAC4AB4AF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[fairphone.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[fairphone.com:s=fair];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[18];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-105458-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[fairphone.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[luca.weiss@fairphone.com,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,fairphone.com:email,fairphone.com:dkim,fairphone.com:mid]

On newer SoCs like Milos the CAMSS_TOP_GDSC power domains requires the
enablement of the multimedia NoC, otherwise the GDSC will be stuck on
'off'.

Add support for getting an interconnect path as specified in the SoC
clock driver, and enabling/disabling that interconnect path when the
GDSC is being enabled/disabled.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
icc_enable()/icc_disable() seems like a nice API but doesn't work
without setting the bandwidth first, so it's not very useful for this
driver, at least I couldn't figure out how to use it correctly.
---
 drivers/clk/qcom/gdsc.c | 33 +++++++++++++++++++++++++++++++++
 drivers/clk/qcom/gdsc.h |  5 +++++
 2 files changed, 38 insertions(+)

diff --git a/drivers/clk/qcom/gdsc.c b/drivers/clk/qcom/gdsc.c
index 95aa07120245..ee5f86ca50cb 100644
--- a/drivers/clk/qcom/gdsc.c
+++ b/drivers/clk/qcom/gdsc.c
@@ -7,6 +7,7 @@
 #include <linux/delay.h>
 #include <linux/err.h>
 #include <linux/export.h>
+#include <linux/interconnect.h>
 #include <linux/jiffies.h>
 #include <linux/kernel.h>
 #include <linux/ktime.h>
@@ -147,6 +148,12 @@ static int gdsc_toggle_logic(struct gdsc *sc, enum gdsc_status status,
 			return ret;
 	}
 
+	if (status == GDSC_ON) {
+		ret = icc_set_bw(sc->icc_path, 1, 1);
+		if (ret)
+			goto err_disable_supply;
+	}
+
 	ret = gdsc_update_collapse_bit(sc, status == GDSC_OFF);
 
 	/* If disabling votable gdscs, don't poll on status */
@@ -177,6 +184,12 @@ static int gdsc_toggle_logic(struct gdsc *sc, enum gdsc_status status,
 	ret = gdsc_poll_status(sc, status);
 	WARN(ret, "%s status stuck at 'o%s'", sc->pd.name, status ? "ff" : "n");
 
+	if (!ret && status == GDSC_OFF) {
+		ret = icc_set_bw(sc->icc_path, 0, 0);
+		if (ret)
+			return ret;
+	}
+
 	if (!ret && status == GDSC_OFF && sc->rsupply) {
 		ret = regulator_disable(sc->rsupply);
 		if (ret < 0)
@@ -184,6 +197,12 @@ static int gdsc_toggle_logic(struct gdsc *sc, enum gdsc_status status,
 	}
 
 	return ret;
+
+err_disable_supply:
+	if (status == GDSC_ON && sc->rsupply)
+		regulator_disable(sc->rsupply);
+
+	return ret;
 }
 
 static inline int gdsc_deassert_reset(struct gdsc *sc)
@@ -584,6 +603,20 @@ int gdsc_register(struct gdsc_desc *desc,
 	if (!data->domains)
 		return -ENOMEM;
 
+	for (i = 0; i < num; i++) {
+		if (!scs[i] || !scs[i]->needs_icc)
+			continue;
+
+		scs[i]->icc_path = devm_of_icc_get_by_index(dev, scs[i]->icc_path_index);
+		if (IS_ERR(scs[i]->icc_path)) {
+			ret = PTR_ERR(scs[i]->icc_path);
+			if (ret != -ENODEV)
+				return ret;
+
+			scs[i]->icc_path = NULL;
+		}
+	}
+
 	for (i = 0; i < num; i++) {
 		if (!scs[i] || !scs[i]->supply)
 			continue;
diff --git a/drivers/clk/qcom/gdsc.h b/drivers/clk/qcom/gdsc.h
index dd843e86c05b..92ff6bcce7b1 100644
--- a/drivers/clk/qcom/gdsc.h
+++ b/drivers/clk/qcom/gdsc.h
@@ -9,6 +9,7 @@
 #include <linux/err.h>
 #include <linux/pm_domain.h>
 
+struct icc_path;
 struct regmap;
 struct regulator;
 struct reset_controller_dev;
@@ -74,6 +75,10 @@ struct gdsc {
 
 	const char 			*supply;
 	struct regulator		*rsupply;
+
+	bool				needs_icc;
+	unsigned int			icc_path_index;
+	struct icc_path			*icc_path;
 };
 
 struct gdsc_desc {

-- 
2.54.0


