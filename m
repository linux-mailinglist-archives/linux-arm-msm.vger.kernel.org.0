Return-Path: <linux-arm-msm+bounces-111006-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id mbeIKc06IGqqywAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111006-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 03 Jun 2026 16:31:41 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 50E356389C3
	for <lists+linux-arm-msm@lfdr.de>; Wed, 03 Jun 2026 16:31:36 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=redhat.com header.s=mimecast20190719 header.b=Sj0lFOf5;
	dkim=pass header.d=redhat.com header.s=google header.b=Wo1hKtSs;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111006-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111006-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=redhat.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 35EC430EBFF7
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Jun 2026 14:24:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 09A4F481670;
	Wed,  3 Jun 2026 14:22:27 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6914481257
	for <linux-arm-msm@vger.kernel.org>; Wed,  3 Jun 2026 14:22:25 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780496546; cv=none; b=HTaA0d9x1+b7UWi2XUEKo2ujZOOeEKtwq6j90y+yEiY3xsJJtG1L5UA7K3CAHTcxonUC3Nr8GsZrMNmnyYkew7xW/HKAt6ElFwVBgaVJRZVE0jG/J4uoZYDJds9yI5TaWv26dFZtGIg79lV6MZHVQfAwI0RArvgyhTlU+luAbuY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780496546; c=relaxed/simple;
	bh=JZF/Cu1Lu/+vvFbUxKQUvMxkNiBd2sXQABNziPpbgqA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UYyHx9KAsnRYIB+SdveDxG9h/EAoWeX2PX4CjmbwSybwZtvNmUH003uwjnvc//uqw/DMXsaJUgx0X8GVn32tJwV6zLJjIeEQxLwbetXSoOBsJch2DDdfoQTrUEGJAQDXt5KVV7BSKUKB6g1xC6FtyiO9JrR3ACNEHWqsOqtnFKg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Sj0lFOf5; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=Wo1hKtSs; arc=none smtp.client-ip=170.10.129.124
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1780496544;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=sc+5V9Ml7sv1NeeOOXUch3H7RjzHTXyFc4umZk6JURs=;
	b=Sj0lFOf5Chif54Irnv3SDqLJlUs99uoknA495FMIxFYc6okO9T3rwbQMDBEJS+vUyoq+ZZ
	PNMwHEgnwjBz6YlMFo5NkYtjL2zsX3DzaBZVeeRNVQ/5uCl+dcINaC6NgGXVY7NHBbHbJq
	+dSEjL5w3PFvjHS5BLpW9zK3bmvJqRM=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-387-YpiodrP3NdCRoOR8oEny5w-1; Wed, 03 Jun 2026 10:22:23 -0400
X-MC-Unique: YpiodrP3NdCRoOR8oEny5w-1
X-Mimecast-MFC-AGG-ID: YpiodrP3NdCRoOR8oEny5w_1780496543
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-91578c374easo526227185a.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 03 Jun 2026 07:22:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1780496543; x=1781101343; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sc+5V9Ml7sv1NeeOOXUch3H7RjzHTXyFc4umZk6JURs=;
        b=Wo1hKtSsnjkP451JPmkIlYhAPLfppMP+t+Xl5fO9P31cUtYYKRIN7Cr10rumoXD8ur
         LV635NiuSA3/ll+Qn5NqXNlp6KHcYXcC9KqyWTOvGSHnCWjQ6Y7SGrwLgS9sn2rv/4AW
         EL0WxtZoTdxOV4YjzUC7daAkio+bwdZk4W5CCMPoyBVN36ZnVdIaOcGSTRy7sJVCywLt
         cW4wFd9XTaVNfqzjiPJ39YYrGK2HFHKfU6rEdPgNHY1ZQSNtQw9aey2XO8DvrCfD1IGm
         VprdRarJIqOTgbgmAtE+/jQ+VIHBlyR189qkTpiPkNk3O88/JiTVbKGIRqUgtYwo6sSi
         18Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780496543; x=1781101343;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=sc+5V9Ml7sv1NeeOOXUch3H7RjzHTXyFc4umZk6JURs=;
        b=Brj7/ysdMRCb3XUn+Mt86I2VT/JfLBL6VGd4KhzPq083hSkVBUt4ctBptcBAltgCrV
         yXpX2dF5/vE0Io1cldaDSQ2o8CzPWuW7+LQi9lirt3tBSib4G1JBYyxi1znt8whHq3k1
         q1QAjdSCQIOo5cd8KLCEnmMFNleAZPzQ4dwQogzHmxY/2SuzFJkQs48UI7qtnceX+FSY
         Ap3n+vHkQO23Yv/1rwEURyEoOuF3yx2sHE23FtyELCqS9NTK1/992wJm16zIjDXaTeN8
         apBRLuUb4GrvvD8p7aAXNLlCZOrtjMS2q/6MWnIOOCJWn8KvckdNNRdgO/rjymR8Q1OY
         LlFg==
X-Forwarded-Encrypted: i=1; AFNElJ+5dB1pocke8aW4egcpVXi7Hw3BVWEoZsQMfa1jw08PVi36qZgYfGsETzGgRQt1s3N/hxzlw3a2yGP1wpT1@vger.kernel.org
X-Gm-Message-State: AOJu0Yzz2PW37L1DyMfBeAM7B1VFYf9NiGX61GH0PPcZyPNmOMvjqjWW
	WLOvLBNw60/bW6gwGN6cEAjRsoNZ/k80+bS1gkx0BmRFveFI/whP8+mfek8Pi0DvkbdqJBSSM8y
	c/9z84hLXQF8JQIW23LuLmROplWj9fSlBwGIvF+7+hGH5dsV+sBwI2ApkJH4LtmPzERA=
X-Gm-Gg: Acq92OHvqoN0JJq+JsWe+P3g7ON4Wo5jbvc9zhvw0xTyyvRnAFVt+mvAnKKeRj2aRn+
	q/vXneEfFvPMw37lWYI0NrTSCeyHwebk+8/nvYURHPljk0QbgE54yZINTpagnch3Gf1fx/3s48h
	K9H1sjQkjLg2y0IzDDn8OyHTQthA8IoQtgrtjLv/HMOFpRmSnXXgpHUmQMLeodJ7e0pYQWbVkyi
	8GLA8K5+4ty2UlG4SxN6Xvl81okTOGcUzbHYY+vWrVTQ0QlvlrS9TXeNmGKNAggCjfoJbc+K40E
	aRo5I04z2p55Fvdd60jeCHcA1EIioZW+UhNK4pTJdOBsEMpjiFHlFP27EqQ4DDxVovPu5F5FNxb
	tELBsGZnXCvstXrYdeTwVec+xnu4xfRAw7hBkTkECt05ABGB+GV1tNKGA8K5bWCY3bDNStg0=
X-Received: by 2002:a05:620a:2890:b0:913:7bc8:79ac with SMTP id af79cd13be357-9158a71f5bcmr642620885a.26.1780496542935;
        Wed, 03 Jun 2026 07:22:22 -0700 (PDT)
X-Received: by 2002:a05:620a:2890:b0:913:7bc8:79ac with SMTP id af79cd13be357-9158a71f5bcmr642614485a.26.1780496542503;
        Wed, 03 Jun 2026 07:22:22 -0700 (PDT)
Received: from [192.168.1.3] (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9158a238f8esm255611585a.15.2026.06.03.07.22.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 07:22:21 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Date: Wed, 03 Jun 2026 10:21:47 -0400
Subject: [PATCH 2/4] clk: qcom: common: introduce qcom_cc_sync_state()
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260603-clk-sync-state-v1-2-457120eed200@redhat.com>
References: <20260603-clk-sync-state-v1-0-457120eed200@redhat.com>
In-Reply-To: <20260603-clk-sync-state-v1-0-457120eed200@redhat.com>
To: Saravana Kannan <saravanak@kernel.org>, Abel Vesa <abelvesa@kernel.org>, 
 Maxime Ripard <mripard@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Russell King <linux@armlinux.org.uk>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Hans de Goede <johannes.goede@oss.qualcomm.com>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, Brian Masney <bmasney@redhat.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2106; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=JZF/Cu1Lu/+vvFbUxKQUvMxkNiBd2sXQABNziPpbgqA=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGLIULKalT707RceH93adVeuLyYv23bi062PBTInLgZwM0
 0xrrwoe6ShlYRDjYpAVU2RZkmtUEJG6yvbeHU0WmDmsTCBDGLg4BWAiv7UYGfq2mZ9xLxKamhfy
 aFrd3F2fBU6+2lBtM6nhUOtfmT7bX9cYGfZlxVkH5eiJ3Unz47m8RT8/McTyu9eMs01ZB897cl2
 OYQcA
X-Developer-Key: i=bmasney@redhat.com; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[redhat.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[redhat.com:s=mimecast20190719,redhat.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-111006-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:saravanak@kernel.org,m:abelvesa@kernel.org,m:mripard@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:linux@armlinux.org.uk,m:andersson@kernel.org,m:johannes.goede@oss.qualcomm.com,m:linux-clk@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:bmasney@redhat.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[bmasney@redhat.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[12];
	DKIM_TRACE(0.00)[redhat.com:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	MAILSPIKE_FAIL(0.00)[2600:3c09:e001:a7::12fc:5321:query timed out];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bmasney@redhat.com,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	FORGED_SENDER_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 50E356389C3

Several qcom clk providers currently have a sync_state helper set to
icc_sync_state(). With an upcoming change to the clk framework, if
sync_state is not defined for the device, then the clk framework sets it
to clk_sync_state().

Clk providers that require their own sync_state will need to call the
framework level clk_sync_state(). Let's introduce a new common helper
qcom_cc_sync_state() that calls icc_sync_state() and clk_sync_state().

Signed-off-by: Brian Masney <bmasney@redhat.com>
---
 drivers/clk/qcom/common.c | 9 +++++++++
 drivers/clk/qcom/common.h | 1 +
 2 files changed, 10 insertions(+)

diff --git a/drivers/clk/qcom/common.c b/drivers/clk/qcom/common.c
index eec369d2173b..31382c49c948 100644
--- a/drivers/clk/qcom/common.c
+++ b/drivers/clk/qcom/common.c
@@ -3,12 +3,14 @@
  * Copyright (c) 2013-2014, The Linux Foundation. All rights reserved.
  */
 
+#include <linux/clk.h>
 #include <linux/export.h>
 #include <linux/module.h>
 #include <linux/regmap.h>
 #include <linux/platform_device.h>
 #include <linux/clk-provider.h>
 #include <linux/interconnect-clk.h>
+#include <linux/interconnect-provider.h>
 #include <linux/pm_runtime.h>
 #include <linux/reset-controller.h>
 #include <linux/of.h>
@@ -464,5 +466,12 @@ int qcom_cc_probe_by_index(struct platform_device *pdev, int index,
 }
 EXPORT_SYMBOL_GPL(qcom_cc_probe_by_index);
 
+void qcom_cc_sync_state(struct device *dev)
+{
+	icc_sync_state(dev);
+	clk_sync_state(dev);
+}
+EXPORT_SYMBOL_GPL(qcom_cc_sync_state);
+
 MODULE_LICENSE("GPL v2");
 MODULE_DESCRIPTION("QTI Common Clock module");
diff --git a/drivers/clk/qcom/common.h b/drivers/clk/qcom/common.h
index 6f2406f8839e..ee448163b1fc 100644
--- a/drivers/clk/qcom/common.h
+++ b/drivers/clk/qcom/common.h
@@ -88,5 +88,6 @@ extern int qcom_cc_probe(struct platform_device *pdev,
 			 const struct qcom_cc_desc *desc);
 extern int qcom_cc_probe_by_index(struct platform_device *pdev, int index,
 				  const struct qcom_cc_desc *desc);
+extern void qcom_cc_sync_state(struct device *dev);
 
 #endif

-- 
2.54.0


