Return-Path: <linux-arm-msm+bounces-111663-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id xCMXL75NJmpcUgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111663-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 08 Jun 2026 07:06:06 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E750652B0B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 08 Jun 2026 07:06:06 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=MOkoHAU4;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111663-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111663-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id C4B44300233C
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Jun 2026 05:06:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B721A3546CC;
	Mon,  8 Jun 2026 05:06:03 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2A233546C5
	for <linux-arm-msm@vger.kernel.org>; Mon,  8 Jun 2026 05:06:00 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780895163; cv=none; b=B0VuSI+e1QwQnmg8pUX7dq/Xn5khy1SZlBD1OpRQsl5FdydBWFZO13wL0W6TeKHfoVbRr8zTQeI8GgJqetzcT5gWi+Zo9/DXD3Rmb6tT9LHYE2Mnde3XUYTklV43phZ0eJs+Fl4+Q3Cz5/1+S6hH1cR1a8LqKVNfgzFesVa6fDQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780895163; c=relaxed/simple;
	bh=0wKTHNlDJp0L4K8AyG2qz8CpJ4CZ8pskH0AsiWABxHQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=LPd93Bfa8XtADI2KA/e7Y+WgALZ5m/AhtIM077Ra21L48ddXwamsKIGyHROZZfXh+LsG88a6daxd/8pvSAOJvU9ZZEVn//GKWhbpGpLvjVin8XQqiZvKuDJrt1l+j3+l1PZz2g/uYDgC6ZGNUbiXX3B9EL3RVWkeiQxD3gtPAsg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MOkoHAU4; arc=none smtp.client-ip=209.85.210.173
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-8423f420455so1555481b3a.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 07 Jun 2026 22:06:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780895160; x=1781499960; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=vyAIUXjw4gQB5sSCj4eOpRr2MuOQteh+bl1WhDK1GiQ=;
        b=MOkoHAU4YmaZ2xRPPDW2071cpyl16Fj06t6yb4LJ8CFp+JRXXS6DriDKNk0fTym41w
         at7Sxu3VzDA0QX0YVSTAjFJ5vSn9VCDpVa5WBERtSNS1jszrEZacVJIEFzhO5ZCqOddA
         YMTdps3Vi3sdMPpqMFNKvuFIO6m1Ua1I6GI2dqhS0vPhuR9uFdubh/v42+oWLdDC3mgW
         fZ0c7/Kobcmrl8fIMjU0LnpNuwEgnTny85PMZjQQRDU8sWczsgZD0/SmpXGZTZ0wpCpn
         T05n9eO/g5cKujTm/OoDyAAuyt5uusajRNtSdICCf4WTm6/55HYpoGfzAvsUZA0LmYv2
         fAeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780895160; x=1781499960;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vyAIUXjw4gQB5sSCj4eOpRr2MuOQteh+bl1WhDK1GiQ=;
        b=quCQCl3zTr23VPfzsK4rw7qpG8mPSucjcOw9C3g1ZAItxFMx9VP2bTbZJXVAV3VnlJ
         86n3qELHZaAUvrV1ZhSbwbFdCK6291D0YoS6GW/rBC+wuztVsTT5CdYMCooVU0bnC3Yr
         2UpqCtG05EommD0bnDquN5oOKXajmSgN1JQOIQWOCX5ZxMDb99PJyFP1t0eINqML3zPg
         eewW1wdpnVthbDlVa0UBFv9/sF021BdQ8YLEiT5w4ehNCJhOjFtDJ8OyNkld6TvsgSms
         4KeeHGOYqXtrY7QJZuZBhyrGPqChQv2BwoI4gKBSGUsbpjuPEZgeKtMThiYB9SAYdLxc
         JjSA==
X-Forwarded-Encrypted: i=1; AFNElJ/j92uhTpgd0CEwVUSiOrpN48s5a34msmykKVW7pvfZfQSo8LB8NUT7iNEdABL8/y/wPYgyf0u6731hQ+j3@vger.kernel.org
X-Gm-Message-State: AOJu0YzPuQeF8ZbVh6yxLXODAL9QsAt62NMUKths0aJCOLWtum5u1kuG
	8KAugN8FMHbva0jZEDfwKI/G7B+wiDf1R5wtJC+paz3qL4vT13aUOti4
X-Gm-Gg: Acq92OHdZxJNtgqzdd9CThpt97REm0eRYIseRXZEXHW1H36SSvZedHf+nF+kzoFIob2
	C1v7Y5J7sasma7p3cJYW9lt22huwYs8gryBmd2G1Ab3KPLJX322tMiiDp/aCT6o3yFmC2u2crR7
	f/aPKThZRD6SJhCrRiQSL+BPNVmyjH8L7hr9eyvKO5KGdvyIdjU1wnhzgjFWBVt5O3BQvJUsPNN
	OaR8AGLpYPeXKteRLtDwFzLT4tdaFXMy0WJlQii2hsCkP3+RqUcEx/IRDraHhu9UIUD+abiMXqX
	k7VPeF4Z3NnBPIMjgsWVgzrgYO6jRUJgF52LqeSi/mXOixJ7GzhznyiFKSjHnEN94gniof4VHsq
	Q0JwTyBZpyY+Ip40VdyjdtZzVP78xlTduMKIyposb3aIr/tNYhJ3peLId19erb1R+jirTNWc69N
	nWlp7ux/eSQk1O9kfJTm44PdJwMVJXdarY05/83fCacfKmDoW/OcEDfXPTcSmVM8OywIgv8iUtc
	ylmr0TyNvLm7JBG8c7lXGjEA3y0oReq+i52QB9M263nsIxTeRVhaB5N
X-Received: by 2002:a05:6a00:3e05:b0:842:5711:9a44 with SMTP id d2e1a72fcca58-842b0fb8bfbmr13310504b3a.36.1780895159887;
        Sun, 07 Jun 2026 22:05:59 -0700 (PDT)
Received: from ryzen ([2601:644:8000:5b5d:7285:c2ff:fe45:8a32])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84282915fe8sm16728565b3a.54.2026.06.07.22.05.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Jun 2026 22:05:59 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-pm@vger.kernel.org
Cc: Georgi Djakov <djakov@kernel.org>,
	linux-arm-msm@vger.kernel.org (open list:ARM/QUALCOMM MAILING LIST),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] interconnect: qcom: add COMPILE_TEST
Date: Sun,  7 Jun 2026 22:05:42 -0700
Message-ID: <20260608050542.6167-1-rosenp@gmail.com>
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
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-111663-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[rosenp@gmail.com,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:linux-pm@vger.kernel.org,m:djakov@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCPT_COUNT_THREE(0.00)[4];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rosenp@gmail.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 5E750652B0B

Allow non-ARM to build this.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/interconnect/qcom/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/interconnect/qcom/Kconfig b/drivers/interconnect/qcom/Kconfig
index 5b8a094ca4ed..e6a65ca611a0 100644
--- a/drivers/interconnect/qcom/Kconfig
+++ b/drivers/interconnect/qcom/Kconfig
@@ -1,7 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0-only
 config INTERCONNECT_QCOM
 	tristate "Qualcomm Network-on-Chip interconnect drivers"
-	depends on ARCH_QCOM
+	depends on ARCH_QCOM || COMPILE_TEST
 	help
 	  Support for Qualcomm's Network-on-Chip interconnect hardware.
 
-- 
2.54.0


