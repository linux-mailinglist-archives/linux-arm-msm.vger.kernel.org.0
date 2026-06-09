Return-Path: <linux-arm-msm+bounces-112274-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id v8eSOJaTKGrYGQMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112274-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2026 00:28:38 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 423DD664915
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2026 00:28:38 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=p2c6qQAi;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112274-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112274-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0AD573004C70
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Jun 2026 22:25:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 80D163E8346;
	Tue,  9 Jun 2026 22:25:13 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4321415C14F
	for <linux-arm-msm@vger.kernel.org>; Tue,  9 Jun 2026 22:25:12 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781043913; cv=none; b=PpbUPWAERr/+pONSbqGPYyI69p/5FcyT8w/2pbOW7SCZOligAkeuF/GaR7/LdBxJZjV0VPrZ/fSNeq5mr7S9FuOme8qi4HDZFR1U5b2LPsPZMgLzQoTBuxJx3RxThdjTHQIIBJUrfymwIgw4orixuw4MwUhT49iY4MnO1HeUoQU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781043913; c=relaxed/simple;
	bh=25uPJG35jMpSwWwmNLycgRCZaGsl+PNdPy3/92HsGh8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=VglK9nb629JYP769GPAzgaNO9gJmTO6vRLNEtvGABrEHQDJGC0IOpI66bpRZxyCa+WYqUIsU092Hoc1cYGGY4iT5x0X9Df4hnO2zeYNz1B6t1Fd3rbD+7q/K6wPhyjhSkcyCcIzzRUD5PXRZUocNacqlxT0F/DNZJzncUVExd2U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=p2c6qQAi; arc=none smtp.client-ip=209.85.214.171
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2bf1f074a12so62584355ad.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 09 Jun 2026 15:25:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781043911; x=1781648711; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ZNnl0xTEZP45RQ7ZoZEn+pJMzeJwUx2jPnwEWCmckDk=;
        b=p2c6qQAivpFaly95C2ObAfJFEZrHVoSFSSKCbDc4rwKU2xZQQ/GvZOwsLGGDLDv0lf
         EKN3PT7w6uk2vWeZuXFnJsZXO2XgSalmY0C9Q6+XXCwQY3hqUBUrQnr3Wn0HPnSCkkZf
         /XTKK9u/zccX+VoGc18I2V9HiNGQhWmgKQ0iRcACN8AmFWf6mOGS4kBU0sC4050N8aE4
         ldklq/nZ/oyLoZHN+s043dIDDZ/0L5jtAurXRyvCdGquqDTFuxhBnPY69SFLoYSN4ihI
         X7O5zsYG/2rw/lFbg5dioqJWvzKAUubv8tuXo866Jo4pmmieCDCYwegXgmDeUhxllS8t
         85Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781043911; x=1781648711;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZNnl0xTEZP45RQ7ZoZEn+pJMzeJwUx2jPnwEWCmckDk=;
        b=BvKFpMssp/Czq4cuDX8VctrzXCz1WrZrw5aqYw/tZvArO0upb3Z4F1yf3hTFkkgjhS
         Kom1F3+3wMAGD1Mrk1n5kHn2UjuayDrfoj+B8YtoUsYdKkPpi4iddGndBwz3hBdn8S+u
         8o/V/k/jkPdJuYL7Wah7qEFfC9NZHi49qrmXEzJ8zbE454KDcwypeMQMj15FT5ysKeKC
         zKYmbhXLrwUS4TaD9QCVCFkGHeSx0v5JGiTarnEvFe/Q+mSDMj+sZcEC+pr+kOC3iZZu
         7EWdPfJE0ZKD3QUQULeujLgMkO9fxWYRz79OTUCsoXsG+eV4SHkUxKty64r95eaHhYGk
         o1NA==
X-Forwarded-Encrypted: i=1; AFNElJ8EkTxl3VGu4052azvWNc4wZZ4yLvOF5d6nM4GBAXXzO5ceNG1Tj4HIGD/QiF8JN3RAEtKF8e26FNpVVtgN@vger.kernel.org
X-Gm-Message-State: AOJu0YxBcmmtI6N12y8M2+FLQTNBo2kwbRrAdZy/0cgsMSv0X7ASgj8y
	XOFKeKSD3UThx4zgOcvV3NxePlbXUeHtxlR9M/qBFTOuewtTxf/KHumi
X-Gm-Gg: Acq92OGwkLuRmQMKVTCR9uBhsG9BmO2EO+SeX5SuAS0zwoVektjd49TD00M7KQa0C2m
	Uk55SN+RxDV62hmp9EL1ShSFnk9aHcCJ9CyhBrMQANDO/84pMhPAagcTpSl7Lxif9ySDyl6+1ZT
	sCdoNWFCFEDGzP0i1nbVkGYzrqDwr3El9c7fWFhp3u0uV84rYzkrNxpf0ipjwS952EGw/cA3TlL
	ximbCZr6gJ2CD/xsCLmxqmijGb7fn+6OfcUncZbBTL04KH8xdWLcWBTjk+fI+dEncAXLQ4fHMjt
	dxqVVg5nQZRCLEbSEExstSj1Ff1yYT3AnrpMl5NOFfHbK33UKd9pAeKfqSz6HpkfbX7XJoinxtS
	Z4/IFOqJA9Od3ww8S4Mbtz/REUltin/U26Xw8b7fkLP25dludH2ocfZZDaJiEeT5uNqUgXSLveY
	negGWfuQhrfbFe3vPV0/HN/LBdP79O4ApQiGsRrSSvMpLA9UMP9LyA/73D8Kz7lBY4Zs/9uwgQ9
	tP21tHoLvpvAeAFeeYStNy4nh/XZB3QYiKTSc22MLsWOg==
X-Received: by 2002:a17:902:cccd:b0:2bf:82c:6322 with SMTP id d9443c01a7336-2c1e80e41ebmr241260645ad.3.1781043911561;
        Tue, 09 Jun 2026 15:25:11 -0700 (PDT)
Received: from ryzen ([2601:644:8000:5b5d:7285:c2ff:fe45:8a32])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c16609e627sm228817565ad.52.2026.06.09.15.25.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 15:25:11 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-pm@vger.kernel.org
Cc: Georgi Djakov <djakov@kernel.org>,
	Kees Cook <kees@kernel.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	linux-arm-msm@vger.kernel.org (open list:ARM/QUALCOMM MAILING LIST),
	linux-kernel@vger.kernel.org (open list),
	linux-hardening@vger.kernel.org (open list:KERNEL HARDENING (not covered by other areas):Keyword:\b__counted_by(_le|_be|_ptr)?\b)
Subject: [PATCHv2] interconnect: qcom: simplify allocation
Date: Tue,  9 Jun 2026 15:24:54 -0700
Message-ID: <20260609222454.37352-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-112274-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:linux-pm@vger.kernel.org,m:djakov@kernel.org,m:kees@kernel.org,m:gustavoars@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-hardening@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER(0.00)[rosenp@gmail.com,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_NEQ_ENVFROM(0.00)[rosenp@gmail.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	ALIAS_RESOLVED(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FREEMAIL_FROM(0.00)[gmail.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 423DD664915

Use a flexible array member to reduce allocation by 1.

Add __counted_by for extra runtime analysis. Move counting variable
assignment after allocation before any array access.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 v2: fix kerneldoc
 drivers/interconnect/qcom/icc-rpm.c | 7 ++-----
 drivers/interconnect/qcom/icc-rpm.h | 8 ++++----
 2 files changed, 6 insertions(+), 9 deletions(-)

diff --git a/drivers/interconnect/qcom/icc-rpm.c b/drivers/interconnect/qcom/icc-rpm.c
index 23a1d116e79a..ca4c8a944755 100644
--- a/drivers/interconnect/qcom/icc-rpm.c
+++ b/drivers/interconnect/qcom/icc-rpm.c
@@ -479,13 +479,11 @@ int qnoc_probe(struct platform_device *pdev)
 		cd_num = 0;
 	}

-	qp = devm_kzalloc(dev, sizeof(*qp), GFP_KERNEL);
+	qp = devm_kzalloc(dev, struct_size(qp, intf_clks, cd_num), GFP_KERNEL);
 	if (!qp)
 		return -ENOMEM;

-	qp->intf_clks = devm_kcalloc(dev, cd_num, sizeof(*qp->intf_clks), GFP_KERNEL);
-	if (!qp->intf_clks)
-		return -ENOMEM;
+	qp->num_intf_clks = cd_num;

 	if (desc->bus_clk_desc) {
 		qp->bus_clk_desc = devm_kzalloc(dev, sizeof(*qp->bus_clk_desc),
@@ -507,7 +505,6 @@ int qnoc_probe(struct platform_device *pdev)
 		return -ENOMEM;
 	data->num_nodes = num_nodes;

-	qp->num_intf_clks = cd_num;
 	for (i = 0; i < cd_num; i++)
 		qp->intf_clks[i].id = cds[i];

diff --git a/drivers/interconnect/qcom/icc-rpm.h b/drivers/interconnect/qcom/icc-rpm.h
index 7d1cb2efa9ee..cdd5f444b152 100644
--- a/drivers/interconnect/qcom/icc-rpm.h
+++ b/drivers/interconnect/qcom/icc-rpm.h
@@ -40,7 +40,6 @@ struct rpm_clk_resource {
 /**
  * struct qcom_icc_provider - Qualcomm specific interconnect provider
  * @provider: generic interconnect provider
- * @num_intf_clks: the total number of intf_clks clk_bulk_data entries
  * @type: the ICC provider type
  * @regmap: regmap for QoS registers read/write access
  * @qos_offset: offset to QoS registers
@@ -49,13 +48,13 @@ struct rpm_clk_resource {
  * @bus_clk_rate: bus clock rate in Hz
  * @bus_clk_desc: a pointer to a rpm_clk_resource description of bus clocks
  * @bus_clk: a pointer to a HLOS-owned bus clock
- * @intf_clks: a clk_bulk_data array of interface clocks
  * @keep_alive: whether to always keep a minimum vote on the bus clocks
  * @ignore_enxio: whether to ignore ENXIO errors (for MSM8974)
+ * @num_intf_clks: the total number of intf_clks clk_bulk_data entries
+ * @intf_clks: a clk_bulk_data array of interface clocks
  */
 struct qcom_icc_provider {
 	struct icc_provider provider;
-	int num_intf_clks;
 	enum qcom_icc_type type;
 	struct regmap *regmap;
 	unsigned int qos_offset;
@@ -64,9 +63,10 @@ struct qcom_icc_provider {
 	u32 bus_clk_rate[QCOM_SMD_RPM_STATE_NUM];
 	const struct rpm_clk_resource *bus_clk_desc;
 	struct clk *bus_clk;
-	struct clk_bulk_data *intf_clks;
 	bool keep_alive;
 	bool ignore_enxio;
+	int num_intf_clks;
+	struct clk_bulk_data intf_clks[] __counted_by(num_intf_clks);
 };

 /**
--
2.54.0


