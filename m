Return-Path: <linux-arm-msm+bounces-113477-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id VRciDNG7MWpjpgUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113477-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jun 2026 23:10:41 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id C8EFA6955BB
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jun 2026 23:10:40 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=redhat.com header.s=mimecast20190719 header.b=RU54EoUq;
	dkim=pass header.d=redhat.com header.s=google header.b=S5q4joRk;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113477-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113477-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=redhat.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C7F73318C18A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jun 2026 21:10:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 76FB73A7D91;
	Tue, 16 Jun 2026 21:10:32 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 205223A6F0A
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jun 2026 21:10:31 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781644232; cv=none; b=TnTMBKxe73zH/vnStL091hlcCoyZq8DSBGCG0Au8ddIYXxs6DYpu+cpxfpyOi5jIz5UVYyL3vNIvKFr+Dc0N6ETX1d+ojG4orlDlqRQfmCG/1cFrZj2cIXzJOAimdHyBX9jZWsQ878zgak0kyZEs9+QJJlKdLfMpqmbZSF0y4P8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781644232; c=relaxed/simple;
	bh=9eulPnfkamBxPWVDUWSuJDF9EQBkFHk7RIvP4h4tkIw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GCju0+IAvgCflf30mJInaMP+Po8RiNg8WWLDODVV/MF+MzhdDNXamhSMFIihB4Y4e4c6V9TqGUYdSZbfT7+7o/p2x2Rsr7LMCpF38xg/stxD/z4x3HZ/mY/VnQE+7qmt4l2at+fKj2hHY7o0ZGNgy+wOkybo5MoTN3KNIKZyWf4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=RU54EoUq; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=S5q4joRk; arc=none smtp.client-ip=170.10.129.124
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1781644230;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=NYzm3gX2P2dHUEW9H/UGzkDoEHNOpxlaezzUPz9OhwA=;
	b=RU54EoUqTh9Y4aq0a0U/sr6nO9/FLyldNIbwIlVLbq8nVutXtpdayAsA3gX1eveYx6A1aK
	sD4Jth19ER3C2Rwrzs7JX2RJ1SPqbFhzxoaXqMDtX0dyChtU3VxfIkP9suSRidK7HY2J8l
	KU/tbDzyCNyTXkqXgnz/bMxCoHDyvTE=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-189-boEKZ19pPkK3AI6-YJzrkg-1; Tue, 16 Jun 2026 17:10:28 -0400
X-MC-Unique: boEKZ19pPkK3AI6-YJzrkg-1
X-Mimecast-MFC-AGG-ID: boEKZ19pPkK3AI6-YJzrkg_1781644227
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-8cea98a0effso108024226d6.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jun 2026 14:10:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1781644227; x=1782249027; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NYzm3gX2P2dHUEW9H/UGzkDoEHNOpxlaezzUPz9OhwA=;
        b=S5q4joRk3LrpBNlYcOzmdkYn0UIuLRBsM3h/enzR7+IbzFcp2DogwZESMVkRByfQIN
         umdk9tGsmZ3gX5hnSYvq3yphetwMB59034usZsjnYFLGtgWegujm3b22OjrDqUKBtuuW
         v9YM+Q1/2ajfkQMGcY5suJnI5TPswt/aK/AC/Yl29uCflDkTB0Y8Az48gHrCtMQr9TFq
         0jWOE38jUuTGv6uOfHdYMziho9nyWf59XuNfGnpYcasrsFBd/xqyFpP9vAV5QMGHSmDF
         VsJsGQ1FUnCosw1nESR8S3VcWtNYFVed8iD5kqar85WsUphehkSRKZlztkSkj7Hmp//m
         Cskg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781644227; x=1782249027;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=NYzm3gX2P2dHUEW9H/UGzkDoEHNOpxlaezzUPz9OhwA=;
        b=iKwGEF/3EK+sqFrgrQ/7Hlb2SkBjl6O02nDWN1Vs1NgMVXE6MKpGNBEaIHdAan9m+c
         /vQm75DUg1SpRzKp5SSZan6D8u3HrcoRV5LJJEqavgAfl8t5TJmwpHgVA7qPtrz7h1nk
         ZVlMD9o6vZupqygxgQd0T+m2SSqXh56n5AgkA6rRX3o1CiGROfVbuRoFjOmIRJWZ8UIj
         +X96Mt0ff3LAkjG4QO910ZBlYBDIdGMytl9FeNGxoVNwWwgqtmtAScx7TNEIgFUGFxEr
         LNbn5f0Ky6RvnzqdPmxB+3AIat/1/2baQbCVXzkrF9278ankEGD1WPSYC6RB+0tPEcK9
         1f7g==
X-Forwarded-Encrypted: i=1; AFNElJ/nBSH0Lj2+AjNhgBNzM6DbPBmH+hdXv78H3nGb0BKn7RB3xR9tpUa9bTrZ4X5IlJ4B+PH9REph4Zinkwzf@vger.kernel.org
X-Gm-Message-State: AOJu0YyO/6rqQIMN4Iy7hE12dUWrN6EmkGaniAI8nY0937Bmw2MaojRo
	GZQczBmUWUjNqKQCYkqC3SajXLr/T8UnnaJQMJ7waAN9GLmpQ+uHdgCwR+5vT87dmiavtJzgKSV
	M2kVNr4ySnEpBhpii2H9UgumJGhPnaWOSARN/3MGNqxASr/7BGYreN/XXjOmAH8RSJ54=
X-Gm-Gg: Acq92OFXZmu2l5badg7cq+C+YJxX5aU0NUYV/5Qime7AXtGe7zh9Xbl/zLnX/vZOD6C
	bU1XPsvuT50isZzCHSUtGciGwLAT/Gi7QLqgTNxPEECdB9w4a5qLKG+MKJRnh1nY8cy1L5mMN7O
	8P2w0AKHO3mJLHNsHY/05KjBpTzWd/+0hWZx/khDQE0xSDqvERDTMMiN/PpN0LlwAD8wSrlhYvD
	/x9OCXUgaycATdECzfdCxCTQgSSJyPlE9b0excGqedtzaobhxbAT0hh8ueLVy4XruWsPTIAHVTu
	aeBzn+aDjt5FlidFzO0ZO7uDmYpyGGuPUvoFNouA5iam2VuB5dPE+agY2dB851NOJQKTxzFc6PR
	pJVAJ2/foAIQ9yzoISf5qSsNVEBVL7qv7P7P+c78gmBm+MP3+hiwpWGMtZ0yzBw==
X-Received: by 2002:a05:6214:428c:b0:8ac:a6bd:503b with SMTP id 6a1803df08f44-8db818f2ef5mr14524386d6.15.1781644227101;
        Tue, 16 Jun 2026 14:10:27 -0700 (PDT)
X-Received: by 2002:a05:6214:428c:b0:8ac:a6bd:503b with SMTP id 6a1803df08f44-8db818f2ef5mr14523526d6.15.1781644226485;
        Tue, 16 Jun 2026 14:10:26 -0700 (PDT)
Received: from [192.168.1.15] (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8d9f122b21bsm43742846d6.4.2026.06.16.14.10.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jun 2026 14:10:25 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Date: Tue, 16 Jun 2026 17:09:44 -0400
Subject: [PATCH v2 2/5] clk: qcom: common: introduce qcom_cc_sync_state()
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260616-clk-sync-state-v2-2-15f82c64d95c@redhat.com>
References: <20260616-clk-sync-state-v2-0-15f82c64d95c@redhat.com>
In-Reply-To: <20260616-clk-sync-state-v2-0-15f82c64d95c@redhat.com>
To: Saravana Kannan <saravanak@kernel.org>, Abel Vesa <abelvesa@kernel.org>, 
 Maxime Ripard <mripard@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Russell King <linux@armlinux.org.uk>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Hans de Goede <johannes.goede@oss.qualcomm.com>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, Brian Masney <bmasney@redhat.com>, 
 Jens Glathe <jens.glathe@oldschoolsolutions.biz>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2167; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=9eulPnfkamBxPWVDUWSuJDF9EQBkFHk7RIvP4h4tkIw=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGLIMd+8S/13UEvPa826n7dFZ7FGiDs2zy9S9OnZOVet/v
 nxGan1PRykLgxgXg6yYIsuSXKOCiNRVtvfuaLLAzGFlAhnCwMUpABMRF2H4zVrausI+JzzZfat3
 mILHCUXr2NQFSyw7OyPXCTy8eHfmEYbfrFluWxy/sa1M409uXXb7c/PTuZyz7j8sCjugdbp87c0
 J3AA=
X-Developer-Key: i=bmasney@redhat.com; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[redhat.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[redhat.com:s=mimecast20190719,redhat.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-113477-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:saravanak@kernel.org,m:abelvesa@kernel.org,m:mripard@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:linux@armlinux.org.uk,m:andersson@kernel.org,m:johannes.goede@oss.qualcomm.com,m:konrad.dybcio@oss.qualcomm.com,m:dmitry.baryshkov@oss.qualcomm.com,m:linux-clk@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:bmasney@redhat.com,m:jens.glathe@oldschoolsolutions.biz,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[bmasney@redhat.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[redhat.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bmasney@redhat.com,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,oldschoolsolutions.biz:email,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: C8EFA6955BB

Several qcom clk providers currently have a sync_state helper set to
icc_sync_state(). With an upcoming change to the clk framework, if
sync_state is not defined for the device, then the clk framework sets it
to clk_sync_state().

Clk providers that require their own sync_state will need to call the
framework level clk_sync_state(). Let's introduce a new common helper
qcom_cc_sync_state() that calls icc_sync_state() and clk_sync_state().

Tested-by: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
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


