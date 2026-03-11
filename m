Return-Path: <linux-arm-msm+bounces-97048-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qCcJDuuysWnbEgAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-97048-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 19:22:35 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D64E268821
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 19:22:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 29A5C300614E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 18:21:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A0C49312819;
	Wed, 11 Mar 2026 18:21:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ERezV393"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A2363E6DE6
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Mar 2026 18:21:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773253318; cv=none; b=LKwc6E8RJZTKRb2YKRcLdIPmTbav6EdXyXTC0fCQzB5+dTi506Lz5dAo21JhbQBjk1QuMa+cbAjg4A13wSLNFdm5EgqGXOyElzUcIQZ7hvIRYSFU6WZuHZCXyhquJzVThWU1moj5jQjwRTWwA1LnCF7s/ZrgA6AqH0WEkHjWOZM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773253318; c=relaxed/simple;
	bh=MFgYY7643GUWuqoTdmop0Qb/gEDZtoEx/qcVezAWPvc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=CJLanG/Nrg6AK6pidvsvmIo6alxtSdyLG6kpidtUBRu8BMjJFHpLxuTk+fI/FMCMFIgyBBLU3noPi2FPllhuPWX6HAfR+rMBAUc5LLoTx7AA7rkJYq/y3w/Uq5ONdqtSSagZ0kKZacsfQJ2r7DV1RCLnfng+Jgrttnj7H5KSD3Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ERezV393; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4853aec185aso1173195e9.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Mar 2026 11:21:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773253316; x=1773858116; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/8pjK+lITqFvqVmVlowmWtOmjb1H8Ha6m3w9r5dFPrI=;
        b=ERezV393wWn0KJLxNOjLJsU5JlexAeu+RgemxuJ9W7BEBlGxTKLcM7Z2JTy8/i56G3
         5t1Kn8KTZs4p+T5V9rSxJlMRmDb6BTOgexNNlWCrR4RhElOD+HBaNbTpD0rFg3PRQtHz
         enmSGqOnbuLMpd8BcJS67H5bOaj8X/yR4SuBftiYv+xsgNAiD95JzNhnXRJCPfgzx5E6
         nAFdutA1dG5uUTo782l1IqoADJTVv7sXr1RmvqtUCTkF7vy+6YHOCp922vO7mAO8J2CY
         uOYknfu++Vf/fPFp8DN+u+QVornNttzQ3FpgtPsT2f6Tj2p4/SHftA0O9G8FSDmXTMDv
         vk7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773253316; x=1773858116;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/8pjK+lITqFvqVmVlowmWtOmjb1H8Ha6m3w9r5dFPrI=;
        b=CRYSqA0QXJh4vLV4A/ApLOKs7AbNduvWtDH0nCOkWbW6uR2QtlFOSKWRXVp49wc1iL
         kfYmXs069lYx1CN4qSy/OW0kXRj3M1flbXmhQnuhN8dCvEm9Q4ujGcGqTj4zJBRXIS9o
         QAvnKUJRP6V0kVOZBILmcA5XBZfCRmed6JSyfYz4piiL1a+ymA9/Amh+eBU6DwhuZyJm
         QmVpb6YbCVwKHw0HaUn8lQjkZJtDjM2lHf6dXs+vKVlm2mR/mL5dUYvDa+YreyR1MJrB
         sgfJvCuRrXBoYBjnbgH4VRK1rGcg6SNgBpfhJNw2xAKVRPFBI76wmWFo6VnX+yPZP1RQ
         NigQ==
X-Forwarded-Encrypted: i=1; AJvYcCWYOfN+zf1PPWslNO7EuoM7Ly6FxhTrfUICkvDWIOfCPAZJKhh4R6VwLqAKfrfnghKUZgO8X3Z5WG39JHJZ@vger.kernel.org
X-Gm-Message-State: AOJu0Yy01EPXJUPhwmk5sCefFD9OEI6Av9fW3ujP04kcY8M3RrvGCLrO
	ypHzX9cLKDRXqbTq4POMXA2gAIIUtUNJV1j4H/LHJKmK3iPa9seErTbf
X-Gm-Gg: ATEYQzxIJyoFezXvs22iD0p756N6wYSFVLcamLwRkXPwLmMApVjZGa8jc/Bm4v4YpKH
	zys+q/uFGlfcv+O2xauB0elWouUomREQuiZ5kh9v5QFtuzbnGqVAjl8nUR/4l/RrvYWCKWj+0aW
	exLPXWHf+JxiVDdo/LdMuo5agmmKYxF8mNCCzA/RQKOuLDZq9NfjaEN1KE+VPvspDGArts9GrE2
	LEQEJw/YCLKvnXw6UcnyCRwi9OGHqamgzkoQLzca6rR+T8hHY0bikkerozo5kKYnCp+GazkGevn
	lcsaR52a4KsjSc231Sh770uXiQtq1CMiRVfj0XVLUOBH3mxKcTrp8OODud1Q51MyoZXagy5fp60
	jzv4T7a2AjYQOESUUseMkn8/C6Wwt7plllOg8l6Y2dXslW/U9pIdIVqORqvGukEzh+jytFkCHzF
	vLXPfxY8SzFliwqrvkEdj2QMnW28POusFxOuMpCLJVUxfF35NrG/KkPlQ=
X-Received: by 2002:a05:600c:8b38:b0:485:3fc8:de9c with SMTP id 5b1f17b1804b1-4854b0be1b5mr63417565e9.12.1773253315564;
        Wed, 11 Mar 2026 11:21:55 -0700 (PDT)
Received: from Ansuel-XPS24 (93-34-88-122.ip49.fastwebnet.it. [93.34.88.122])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4854b0b95f4sm39063925e9.5.2026.03.11.11.21.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Mar 2026 11:21:55 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: John Crispin <john@phrozen.org>,
	Christian Marangi <ansuelsmth@gmail.com>
Subject: [PATCH] clk: qcom: gcc-ipq6018: mark gcc_xo_clk_src as critical
Date: Wed, 11 Mar 2026 19:21:42 +0100
Message-ID: <20260311182147.30266-1-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.53.0
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
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[phrozen.org,gmail.com];
	TAGGED_FROM(0.00)[bounces-97048-lists,linux-arm-msm=lfdr.de];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ansuelsmth@gmail.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 8D64E268821
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: John Crispin <john@phrozen.org>

The XO clock source is always-on in hardware and cannot be gated.
Without CLK_IS_CRITICAL, runtime PM of downstream consumers (such as
the CMN PLL driver) cascades a disable up to gcc_xo_clk_src, causing
a branch status timeout warning.

The IPQ8074 GCC driver already marks this clock as CLK_IS_CRITICAL.
Apply the same fix to IPQ6018.

Signed-off-by: John Crispin <john@phrozen.org>
Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 drivers/clk/qcom/gcc-ipq6018.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/qcom/gcc-ipq6018.c b/drivers/clk/qcom/gcc-ipq6018.c
index d4fc491a18b2..6943dc511534 100644
--- a/drivers/clk/qcom/gcc-ipq6018.c
+++ b/drivers/clk/qcom/gcc-ipq6018.c
@@ -400,7 +400,7 @@ static struct clk_branch gcc_xo_clk_src = {
 				.fw_name = "xo",
 			},
 			.num_parents = 1,
-			.flags = CLK_SET_RATE_PARENT,
+			.flags = CLK_SET_RATE_PARENT | CLK_IS_CRITICAL,
 			.ops = &clk_branch2_ops,
 		},
 	},
-- 
2.53.0


