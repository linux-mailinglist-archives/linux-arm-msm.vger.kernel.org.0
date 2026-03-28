Return-Path: <linux-arm-msm+bounces-100512-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +Lc9JkQux2kEUAUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100512-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 28 Mar 2026 02:26:28 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id ED91434CE4A
	for <lists+linux-arm-msm@lfdr.de>; Sat, 28 Mar 2026 02:26:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DD57D30160F1
	for <lists+linux-arm-msm@lfdr.de>; Sat, 28 Mar 2026 01:26:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D2AE31ED83;
	Sat, 28 Mar 2026 01:26:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="VtVxiXdw"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7EE32C859
	for <linux-arm-msm@vger.kernel.org>; Sat, 28 Mar 2026 01:26:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774661185; cv=none; b=d/HLTOZLcsm351yMxh91umhz4N5FfJWRs7vffXGwutsP0SwxvhXPfc6MDe63WXSNG53/pqanX42RJ8n5FU5Ee8Xg2yhTILiSkKAOwzUG5xp+/dR61VDdHhcw2P+Y58f9N6/s6x14A0tVadW0W2HC/X97/zBvxA5f+zt0OUrFoD4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774661185; c=relaxed/simple;
	bh=IX3C4pIMJ8k9u4+4vziha/Y/uIGiYvafzFLAaw79hKQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=GYWrgD9bGSZaF0UbYJu75QhV+cpbC0qD/kakBygRE4WaebP58YfNPKEZcpvzZPWbOpt3nVhnvWFlt9hKAnNsX7nJiV+JNQAiNe1SK5v34oAxoaEPnNUNtKwRAOWCqVXykBCOeslPmmsa2dAgijpeZuzRsX6y3KcwE0SQfOZ39Mk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=VtVxiXdw; arc=none smtp.client-ip=209.85.208.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-38a42d3fb6bso2204551fa.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 18:26:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1774661182; x=1775265982; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=xR8gHqnNIiEnxM6fE1y2q/Bl9VFmaIbjQc2osrqR4us=;
        b=VtVxiXdw5inbK3vw3p3qyL7tbdCvr/knUcrlTChdphADc8h8ceuTPriVMHFlBnDgfT
         RDhqa+rZ031tniQ683eNE6stbG29OpGKH//itUuVTP0q9GEodVhrFHPk6s8qwpRrbZK9
         ijrwZBtibitEQBsNvPcN5gHAe/pEClWX4jVIpzjjIiPqQDASs6k5VBN4ncBSLFbb6F1N
         7BPg5nXcJmgh203kDj8+Ly2EMQxTSQXWjjjUlCT6Nhd6JKoC1FvaDUEZc9FlMHNstvAn
         Kae1b+QH+5JKMzAxuID5Vyzb7aeefAkRLK8+F+L+AyM8XbaJVG4rs+oIABXOlGd4VF6Y
         Dwuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774661182; x=1775265982;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xR8gHqnNIiEnxM6fE1y2q/Bl9VFmaIbjQc2osrqR4us=;
        b=nXD4TpWI4qg0ztIz6OPp83dk/BYDsOsAQkhBXpZQKTsglcTRkesTKyGwVTfsFWQ4l8
         pT7I2SiPDIbdHKNRGWsO8CiuFRRr3qj0Anqy+XiOqaKu3A54jEh866xf3pU1BWqYJJyG
         8o7XZelLB9xTlZnOf4VTGN+z6gYCafPLJYDyGbed6EAkm0EY5Y/6MSU3FMyGisBxg5Bs
         H61kP+fKfttWOYiNH0XQfRasGWpre8DxY5xwme6OJX8r5uA/WPttsB9bI7QZRnCrJfy0
         /JiB/juAI05oxUXO4BXAsEFvwlrAWLFVfQJiTvVefVtYWIfXoDBd67WwDJ3WmcrG6bGQ
         l4Hw==
X-Forwarded-Encrypted: i=1; AJvYcCXPfl5xuhJ7jQH2D7UnuIrVtN4s4W4uYAHob0SanILGtQeVrNf8bCge85BOXIv6p5CnYQ8y7VptYSxDCndR@vger.kernel.org
X-Gm-Message-State: AOJu0YzeItMTo0vOlgj3UXx1tprkjND6FDv7WtAO/IJujYrYExiQ0hRH
	cAxmcXJtod9U9qMu88XMOcTYwjaxIvKyBXjHRfrzcg/7XdLcZ9AtB0DwPYcMSBSnKO8=
X-Gm-Gg: ATEYQzxHZWiaVjHiyOpdv194E1g9aUpv/lXJDe+wTuWCE69cFdWxbebwu6+oyuVmrbG
	yp1T7Hep6Mh9Q037h0kXh4cmiDkEz2mm9ubd7PqZqrGUvzqxqDxKBd88A8cQgDk7zp1c9oup7qj
	sGF3BkTVwbbFfB8GEkJhzTD/H4zkrIBjLREOOYNrYw5qXDWOEMeECnLYfEyXNmhYyid+tHQTRsM
	XFGgBu28ernFI0F5ZZyZ+EaxJ6UAeY27UsyZ8sGbQFDFCZgNbzVb75peRi7q6g8eAS+GMYzv4Jx
	gkefRPHDNwinOrB5TSWRZhRzoP9wmMzwjYNlGvshsA7Su5uOLXsKYVQP2MV2gyFQtgorbwEWjQr
	XOUTQF9EqF17neL2Nr5U/i/vjSB8NxjKGo8Ddi5uV7vTjjmFcneQIrsf6UnFc0ifTAT5d1oNO77
	eeNLYzLxiedVBdOmhY1G6b70ibLlDrxM4BVQ+aXERq8USBcHONOrg8tBC5J0nAUbc9My+eno8v9
	U3t
X-Received: by 2002:a2e:bcc1:0:b0:380:a1c:7031 with SMTP id 38308e7fff4ca-38c730d38b2mr6254411fa.1.1774661181970;
        Fri, 27 Mar 2026 18:26:21 -0700 (PDT)
Received: from thyme.. (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38c837130basm1562201fa.12.2026.03.27.18.26.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Mar 2026 18:26:21 -0700 (PDT)
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org
Subject: [PATCH] clk: qcom: gdsc: Fix error path on registration of multiple pm subdomains
Date: Sat, 28 Mar 2026 03:26:19 +0200
Message-ID: <20260328012619.832770-1-vladimir.zapolskiy@linaro.org>
X-Mailer: git-send-email 2.49.0
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
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-100512-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vladimir.zapolskiy@linaro.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[linaro.org:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCPT_COUNT_FIVE(0.00)[6];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,linaro.org:dkim,linaro.org:email,linaro.org:mid]
X-Rspamd-Queue-Id: ED91434CE4A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Some pm subdomains may be left in added to a parent domain state, if
gdsc_add_subdomain_list() function fails in the middle and bails from
a GDSC power domain controller registration out.

Fixes: b489235b4dc0 ("clk: qcom: Support attaching GDSCs to multiple parents")
Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
---
 drivers/clk/qcom/gdsc.c | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/qcom/gdsc.c b/drivers/clk/qcom/gdsc.c
index 7deabf8400cf..95aa07120245 100644
--- a/drivers/clk/qcom/gdsc.c
+++ b/drivers/clk/qcom/gdsc.c
@@ -518,10 +518,20 @@ static int gdsc_add_subdomain_list(struct dev_pm_domain_list *pd_list,
 
 		ret = pm_genpd_add_subdomain(genpd, subdomain);
 		if (ret)
-			return ret;
+			goto remove_added_subdomains;
 	}
 
 	return 0;
+
+remove_added_subdomains:
+	for (i--; i >= 0; i--) {
+		struct device *dev = pd_list->pd_devs[i];
+		struct generic_pm_domain *genpd = pd_to_genpd(dev->pm_domain);
+
+		pm_genpd_remove_subdomain(genpd, subdomain);
+	}
+
+	return ret;
 }
 
 static void gdsc_remove_subdomain_list(struct dev_pm_domain_list *pd_list,
-- 
2.49.0


