Return-Path: <linux-arm-msm+bounces-111662-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id v9JnEIlNJmpXUgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111662-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 08 Jun 2026 07:05:13 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 93D97652B04
	for <lists+linux-arm-msm@lfdr.de>; Mon, 08 Jun 2026 07:05:12 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=dYBVQ3Ar;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111662-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111662-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C89FE3014132
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Jun 2026 05:04:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D43202BEFFD;
	Mon,  8 Jun 2026 05:04:49 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F26BF30DEA5
	for <linux-arm-msm@vger.kernel.org>; Mon,  8 Jun 2026 05:04:47 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780895089; cv=none; b=FwHP9d1VUKtvsN/Z85Bbhai0P/NJCAaLZKgeBMsNMooter0iP5n4mu1i152NQLB36YIte0TCvvturwYVTfZI+hIJmXO1KB+CCMuH5kvJWiKwHHCknHjnnqfg8z5qpAQ5sgEbvjio+/rJnw7y4aTSYvTrAOhTNHAdcSbI8g5NUwc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780895089; c=relaxed/simple;
	bh=asqAK3SoXu8/htKWhVGXzuock8mQJTHGvtneCHlq64k=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=JStTZNxc7Jhw9gQ3PazLEw896dUQV4Bd6k559Fld1m6OYoHfWZ+r8ddh4wsgAHLdOJKRA6phudkzxmDe9yF24kZRwd69bEXxoZ2Jc6+yDFQmExL2N5MsyVHmMT31CzgFl2EI0lalxZfVboRHqzu/0Ic5eG0Bob7Vbc+2ra84olg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dYBVQ3Ar; arc=none smtp.client-ip=209.85.210.181
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-842288702fbso1486319b3a.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 07 Jun 2026 22:04:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780895087; x=1781499887; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2Msw1JwiAso6BYV3Ybo65LRpP2frOXynj3tYTZ5sNuE=;
        b=dYBVQ3ArTyGLFiKery8a0XcppHqj1Ij3kdCiHdCOHd63haKOcwjo4LXJGo93FDNDRz
         yX3wMCQXy8T7AG6qVd7Z80TQcHfHhkanVGFVN+T2ODN6MCrY/Icm2lZHY3mBidfult+n
         jpBo7MFcFf85NfejhzhgYffUc+fNkbG0PJuS36NGjPOQxff9mxg0tY97ywmNv1NFyP70
         I2a4Je29W6SjNxS6CTh1bkHl8G8A3EzvsriEU+fSXkaDLkxqPn8MArMRJpYFqd7xzfPg
         QQuEZS6Lp9zNVDyRMF/hOlzAH2EGv67ZKajq9/k8RHbqhH17rZz/ceLuyKmJ+9pqWusQ
         +3ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780895087; x=1781499887;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2Msw1JwiAso6BYV3Ybo65LRpP2frOXynj3tYTZ5sNuE=;
        b=Xm0swK4EbwXmDB5WXI3+09yOhoPlYYzbiPZwRhC2e1H3u5tZLOJaKvG8RlJjIKzEWU
         nMVDanjHZNyy+6MRrY+R9QGNyI3M33bMGvBq/FnmU4Q1+S+6ZJhMsd0A+z+JKgW5da9M
         Sr2sZK514oIaxuo/5wa6i9zzmNMkddp1F+db+kPHohTSqhvcXzwAxVv61kkFeZRzROys
         b7cTJqAaYGCGQlPsPr5PjqFd20ZwWF/aNU5AWhPtmGduK7GHyQ5GfaXKhusNs3FQOOEn
         B4nSjt6L8lfr2qXyGhXKBv7rZkggjtUQV/TQ9chnSgnDt8hAvNb/8dMtNVzoPfgG2NMk
         +5dA==
X-Forwarded-Encrypted: i=1; AFNElJ9k3BTFo6bfy0Ws7XWc5c8lbmcSJR96FVeCaYeywdmhHL1cEJgUh0ZK5ePqqk6p3gln78opQSsdgiQ3Ijyi@vger.kernel.org
X-Gm-Message-State: AOJu0Yxn82MLUe+bLX862Nu81NU1Nczg3b1mxNzEQuOl88LKsWSg+QSl
	HjUNc7/hqXh9X36xNksHg50ZehK8J5oJ+ZSCxk2zDCl4qvzpelku9uRBbX0ASg==
X-Gm-Gg: Acq92OFV8OGz9OmJ+ruAetGGCUCqIyr1nftK7aaEAxs2RqLR7OwGEsuzJ92nC+ajCqb
	pI4Yccj365HVFFEAZRGXm8cLo4VLay614z3dMSgpNHD8GCTEC042u/2pRKJeE2yYj2oSPkod7a6
	uF8prwjUIAVLTuFMyvuNvcolEFN3sfwXeRBaODOI5RwKAaZDQUK4vEktfyLfwwRGBakonagaeOV
	JS/AyOvIS9wSY5aCeF7Jj0KBAhthSuNZ1bPTLGYar9DIj9/Wbi4VnYV0x66BsvEedm/gd8OPsBI
	wVyh1VVGx+bNjA4YZzbRCy2O34BLlou103P/aJO8Vv8k/Q8qZIw44O6Q1zs5PKLS9SviBLDMht9
	IT9b8QNV148gwBlSUccJWs2tC6l7j0CKEHDZgg59/EAz45ZoBOPlr6tmlfDTITWBmdQ3mzaY4QL
	MpcpP/+X2UzcSfpi/DDVH9gkZ6fxhmzR0JYggo1bVWLdgChPyY0dQED6jmEa7a34PjOR/RtBPUU
	ybM1uqLFehn7g7i9z7z0Oz+cAPrLlUnWMGiObqZDl779g==
X-Received: by 2002:a05:6a00:1d89:b0:842:4f49:6bfd with SMTP id d2e1a72fcca58-842b10677admr13727414b3a.26.1780895087366;
        Sun, 07 Jun 2026 22:04:47 -0700 (PDT)
Received: from ryzen ([2601:644:8000:5b5d:7285:c2ff:fe45:8a32])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-842828d6bd1sm19997835b3a.44.2026.06.07.22.04.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Jun 2026 22:04:46 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-pm@vger.kernel.org
Cc: Georgi Djakov <djakov@kernel.org>,
	Kees Cook <kees@kernel.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	linux-arm-msm@vger.kernel.org (open list:ARM/QUALCOMM MAILING LIST),
	linux-kernel@vger.kernel.org (open list),
	linux-hardening@vger.kernel.org (open list:KERNEL HARDENING (not covered by other areas):Keyword:\b__counted_by(_le|_be|_ptr)?\b)
Subject: [PATCH] interconnect: qcom: simplify allocation
Date: Sun,  7 Jun 2026 22:04:29 -0700
Message-ID: <20260608050429.5990-1-rosenp@gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-111662-lists,linux-arm-msm=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 93D97652B04

Use a flexible array member to reduce allocation by 1.

Add __counted_by for extra runtime analysis. Move counting variable
assignment after allocation before any array access,

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/interconnect/qcom/icc-rpm.c | 7 ++-----
 drivers/interconnect/qcom/icc-rpm.h | 2 +-
 2 files changed, 3 insertions(+), 6 deletions(-)

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
index 7d1cb2efa9ee..b08821c2ef74 100644
--- a/drivers/interconnect/qcom/icc-rpm.h
+++ b/drivers/interconnect/qcom/icc-rpm.h
@@ -64,9 +64,9 @@ struct qcom_icc_provider {
 	u32 bus_clk_rate[QCOM_SMD_RPM_STATE_NUM];
 	const struct rpm_clk_resource *bus_clk_desc;
 	struct clk *bus_clk;
-	struct clk_bulk_data *intf_clks;
 	bool keep_alive;
 	bool ignore_enxio;
+	struct clk_bulk_data intf_clks[] __counted_by(num_intf_clks);
 };

 /**
--
2.54.0


