Return-Path: <linux-arm-msm+bounces-112763-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id eBCJK/ewKmpTvAMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112763-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jun 2026 14:58:31 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 50928672172
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jun 2026 14:58:31 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=X9hn9HkK;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112763-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112763-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B39EA3351A9C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jun 2026 12:55:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DA2253FA5E7;
	Thu, 11 Jun 2026 12:55:09 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com [209.85.219.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AF6B3FB069
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 12:55:07 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781182509; cv=none; b=qlxgbNfUMH2meAcdOJJYgl1hODMMvqpXOshIVXgiNNJoPQlZFrfBalBIaeJtj+BVozstSAhyb1rjtQ8bc2U1UKC27zq6kIQMV9c+mKbNbJy/hcYp5vodFzdMytVK+xSDIZwDMABNPpYDc/IcQutqwPMNfTgdve+AKC9U58npHXk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781182509; c=relaxed/simple;
	bh=oZStNDXWE/AcTOTzD9NBJlNmFJtQ1MWzYyCoyRxg4UI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=AEbeS4Dzp1fyg8T++O+MTS5i54JFvSj1Sxnzy/craDRhrTVKntdVgG1jQFENxsPUmLGOfKG/mSbjEHFUGe8NfnmOl6UzGwmCPp+5qOg9aCz4lzDNhPXQIMVM7Mz10QssKX6Og8F9yP6QfCeasLfVxFAXsQxUF8CjNlnWM4RPIbo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=X9hn9HkK; arc=none smtp.client-ip=209.85.219.53
Received: by mail-qv1-f53.google.com with SMTP id 6a1803df08f44-8ced8f44da0so86749566d6.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 05:55:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781182506; x=1781787306; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=E5v1bno7gDTE2v+U9DKoHdWFvECaXXlbgInGSkG+Fe8=;
        b=X9hn9HkKBKLyVckfu9st4+hgxwhDmWcYq7Q7+NEYY3lq+msfJMhRdN7Nrzsa2pHodI
         BzF1aibVmpl1q4C7l8m4boXNaiNFXUh96FkdUEZ9RTI8seZlLFSoYNESu/fe88kjlTWa
         XCwCs/z4JUJis4bxjkA1+i4I2NSJhLeq6IEOQVF9+PJdw7k3aXMNvtYWvqy3sd+FYnPl
         QjrrZ9UDJLbYQL7siCbc01XDslL7EnI2uKPJf26cT4nMrViO234vl118Qt0+qf0L4hHd
         Eo8dWA7s9pqtQujePwfjPFEX7YGpX6sf2G6bWhRDuuy+T5xZnXpob8MfdAqas1e115r6
         XOPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781182506; x=1781787306;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=E5v1bno7gDTE2v+U9DKoHdWFvECaXXlbgInGSkG+Fe8=;
        b=oKQEM/wOqXAZJp4CQHxYX4bdKcIM3uXyibx3GWHt+9HWKQhNlmy47MCa6NBAxsOSP9
         xPVzdg3whBIQSQqaP2SF2WIW79QBTQqLzgt8AlsovXpj34ZRuZI5R56vikabaubbRUD5
         JnMEuq34v6AomFH2Gfe7xopoCr81NhpRKWPWMxoZbAmxd1ybOtCKkb9K7Bn1qkxv6cJ4
         THtNNGS+33f5pesraRX8kMtNf6svzL2jHHF7YSlU0SdU0rysqtMfDWBIUvUk8kubYr7/
         18VrrkQkZqNgFYfO/hHVKmlW1gsgk3LwzkuBfgMglCuFOxO1SO5epRJ8ZkGzv0BJ2Doz
         z50g==
X-Forwarded-Encrypted: i=1; AFNElJ+NEBn0+OzA8o+anF7/3iWh8WnNQ1kjK24ReO4Farr0qwvw/5isNakJqOPe6lb5vHQkqxljqH8NZo8lD3lB@vger.kernel.org
X-Gm-Message-State: AOJu0YwEmoKTpKzALXa7+l/1w/nsfIeYEFNR86T5uCXq0Tnl+sFOjWby
	Apm284U/xR7O3J/7Zet3GPD6QWkXF7p154Kf+1HgkVMzmlZim0WkJaAX
X-Gm-Gg: Acq92OG3jyxApWzSl25ABOMn+mJLzz510r6oGlHRVhfD4t6MutoQlHoHpxqpLBHueNr
	7RMK9HNXkhDW6aq5joyPbhjES8d/X5ttKaKSzt3RIocgBCluXQY7sBKUodqfHTN/VCUwASctBch
	+XYwwlRKR6puMQ/Rx4oNdbEQAyRTuBVDtxuxG47wc51FVV/MtzzkVfyQr84g1osI5rozORhIrsf
	qa0mCirtIX3c5lrcTzGiPFL8h8s9JcAWq+fsFU8/4YuhATEB/Lz3NP2R46GRu9JsvXOkJ8tPKKE
	BddPiaVP3BqUXMH2NAb6IKy88JA6LRY3KJ1NMtE4ohnF0fh1bEvdnZ3CKf4frNP3lOQJWI2Cync
	ZGxa2SCyaP7V4+wq358p6yD0UgIzJ8LMayzTN6p52limf/cOwGPr75fTxEL60jC09m+T4puuivv
	NHQIXOzNseOs9ghrxc/+TvgZu8YiAUw5qb3mGPVo6P1qCwHkrYNi5QdbIeFnuy/3+m15H0K/2J+
	3+d7wXhPpzLAkaLMuG8n9QwAe9FXBQ=
X-Received: by 2002:a05:6214:5b82:b0:8cc:e8f4:1630 with SMTP id 6a1803df08f44-8d1dac25ab5mr42471256d6.30.1781182506291;
        Thu, 11 Jun 2026 05:55:06 -0700 (PDT)
Received: from server0 (c-68-48-65-54.hsd1.mi.comcast.net. [68.48.65.54])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8d1e7bc298esm17792936d6.1.2026.06.11.05.55.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jun 2026 05:55:05 -0700 (PDT)
From: Michael Bommarito <michael.bommarito@gmail.com>
To: Manivannan Sadhasivam <mani@kernel.org>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>
Cc: Simon Horman <horms@kernel.org>,
	netdev@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	stable@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] net: qrtr: fix 32-bit integer overflow in qrtr_endpoint_post()
Date: Thu, 11 Jun 2026 08:54:55 -0400
Message-ID: <20260611125455.2352279-1-michael.bommarito@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-112763-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:mani@kernel.org,m:davem@davemloft.net,m:edumazet@google.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:horms@kernel.org,m:netdev@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:stable@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[michaelbommarito@gmail.com,linux-arm-msm@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[michaelbommarito@gmail.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 50928672172

qrtr_endpoint_post() validates an incoming packet with

	if (!size || len != ALIGN(size, 4) + hdrlen)
		goto err;

where size comes from the wire. On 32-bit, size_t is 32 bits and
ALIGN(size, 4) wraps to 0 for size >= 0xfffffffd, so the check
passes and skb_put_data(skb, data + hdrlen, size) writes past the
hdrlen-sized skb and oopses the kernel. 64-bit is unaffected.

This is the 32-bit residual of ad9d24c9429e2 ("net: qrtr: fix OOB
Read in qrtr_endpoint_post"), which fixed only the 64-bit case.

Reject any size that cannot fit the buffer before the ALIGN.

Fixes: ad9d24c9429e2 ("net: qrtr: fix OOB Read in qrtr_endpoint_post")
Cc: stable@vger.kernel.org
Assisted-by: Claude:claude-opus-4-8
Signed-off-by: Michael Bommarito <michael.bommarito@gmail.com>
---
32-bit only; reachable via /dev/qrtr-tun (CONFIG_QRTR_TUN) or a QMI modem.
Reproduced on i386 (a 32-byte write with size 0xfffffffd faults; well-formed
writes are unaffected).  QRTR mostly runs on 64-bit now, so this is a
correctness fix completing ad9d24c9429e2, not a high-severity bug.

 net/qrtr/af_qrtr.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/net/qrtr/af_qrtr.c b/net/qrtr/af_qrtr.c
index 7cec6a7859b03..ba6d38244c440 100644
--- a/net/qrtr/af_qrtr.c
+++ b/net/qrtr/af_qrtr.c
@@ -496,7 +496,7 @@ int qrtr_endpoint_post(struct qrtr_endpoint *ep, const void *data, size_t len)
 	if (cb->dst_port == QRTR_PORT_CTRL_LEGACY)
 		cb->dst_port = QRTR_PORT_CTRL;
 
-	if (!size || len != ALIGN(size, 4) + hdrlen)
+	if (!size || size > len || len != ALIGN(size, 4) + hdrlen)
 		goto err;
 
 	if ((cb->type == QRTR_TYPE_NEW_SERVER ||

base-commit: 5200f5f493f79f14bbdc349e402a40dfb32f23c8
-- 
2.53.0


