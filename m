Return-Path: <linux-arm-msm+bounces-101977-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EGz8HZrX02nUnAcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101977-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Apr 2026 17:56:10 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 61E713A4F5D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Apr 2026 17:56:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id C80BA30087F0
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Apr 2026 15:56:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 214BC3314B7;
	Mon,  6 Apr 2026 15:56:08 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtpbg150.qq.com (smtpbg150.qq.com [18.132.163.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EA45329C6D;
	Mon,  6 Apr 2026 15:56:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=18.132.163.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775490968; cv=none; b=qP+QV6CFw2Bg6xviUSxTAW8lNF1Ih2QtVtwjB2EA8Gn/o8Vdp00TEtJWMId/vZbZiJHvliYceRVICxUYrhCgrvXdsvnglybvtcU6/S5/6ai+aHavEdMKSK5R9i2n2sD2VHJnNch09RQDkSu+KO9EkRx/LftLIESPanWTsbs04GI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775490968; c=relaxed/simple;
	bh=3CXRrGnohZ/1ov6ZLvx49NEvzaqXLiwv8R5KgEUXWNw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=izdOp++3weqBojQ/qwtmMjr8OvAulNn2mttE95o1BKjfbCnBgz1CTV6Hb45P4N1uqQ67e294XDq4LD+5NxeGoaaX4BCwh9ygDnffYt+zrkjtFyAg2Pu9NjdCnYN+vypCr0hfjt7Pzr6hd6+KjB4IbOTTXRu8uos8//skvb4JGtc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=radxa.com; spf=pass smtp.mailfrom=radxa.com; arc=none smtp.client-ip=18.132.163.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=radxa.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=radxa.com
X-QQ-mid: zesmtpgz9t1775490894t032c96f4
X-QQ-Originating-IP: NwwJw9qpw8W/iHvEWx8Za8lBoUkFMiXVPxCDldnH0xs=
Received: from [192.168.30.32] ( [116.234.14.100])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Mon, 06 Apr 2026 23:54:53 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 7787406259801255964
EX-QQ-RecipientCnt: 11
From: Xilin Wu <sophon@radxa.com>
Date: Mon, 06 Apr 2026 23:54:34 +0800
Subject: [PATCH 2/5] clk: qcom: clk-rcg2: use 64-bit arithmetic in
 set_duty_cycle()
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260406-clk-qcom-gpclk-fixes-v1-2-7a14fe64552d@radxa.com>
References: <20260406-clk-qcom-gpclk-fixes-v1-0-7a14fe64552d@radxa.com>
In-Reply-To: <20260406-clk-qcom-gpclk-fixes-v1-0-7a14fe64552d@radxa.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Dzmitry Sankouski <dsankouski@gmail.com>, 
 Taniya Das <quic_tdas@quicinc.com>, Mike Turquette <mturquette@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Stephen Boyd <sboyd@codeaurora.org>, 
 Xilin Wu <sophon@radxa.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1358; i=sophon@radxa.com;
 h=from:subject:message-id; bh=3CXRrGnohZ/1ov6ZLvx49NEvzaqXLiwv8R5KgEUXWNw=;
 b=owGbwMvMwCVmdFg0fe08Iz/G02pJDJmXr7tf2q7D9mCbSlmccy+7UOWCl51XxetVqoUXJK04p
 KEYmMrcUcrCIMbFICumyKIQzzCXvTL32lOxUj2YOaxMIEMYuDgFYCJdwYwMmzSW3daaW657yFv7
 03ox1TSeHHW5izYS675G9d2P8f1kxchwa//C+U48mUrST+7/uMbl9n/bHAtTs6/x2XG/Hefn9zb
 zAQA=
X-Developer-Key: i=sophon@radxa.com; a=openpgp;
 fpr=205F009D07796DD6E516752E32C31567AD9E324E
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpgz:radxa.com:qybglogicsvrsz:qybglogicsvrsz3b-0
X-QQ-XMAILINFO: OIl0qrssdEn9MMMlWar/AkH1knhSRnQdQ61TzAj+99ud87IMBTL59eQ8
	dXPfYPhHFzfErhgqbIVSZvfR1hwOpq+Qk755sXfc7PVkcqep+MgBdUqmP1iYc0qpGW3yIJY
	57A8PvCidtyxmkoP67wq5HjKb5/iiaBsRLwgV6AoaAc43MMcdxOHYmyTfAbjWwzV8AwMtCM
	0gc1yB7f2BO8HNkAWyf6ApeoisT/lIIGZGi8JFQTo4Irp7mZXWoCc7ElWT8VBDcVMIHqrHN
	CjvVAiFZM8e0Km6dq9y9K9+PaNQlh/YXfQKqQYJuujqGfI/9I4fVu3Y99mpQJto4c+fQxqY
	6bbkMdOysxv6es020WMOZnVYLk/NnSx0M2/08JeHy3OLWfLDojkc2pA92UpWj7xLyJcIcSA
	d/MHB9dynk3xQ6gkOWQluikA/JKqiJHSMfXBjJwvdzg4rCXjpYyZPcYP1d6CTXQlPgapLUr
	7pDb04FPX5Jzq5NJbXafMBnB9o30SQftA6PUliei3UuAQ6l9mZdjotU6X3m0eYAOnn3SkqN
	UhuopDFB7rM6GOlCoiufIVpvxJOPxuOgqyuKvv95czx/xef4ursLoF/jijOfMaRhGFnwmDD
	zKqj8Yl/5CByGrvNktiHHbmeUgco1iG7mU2M0Fv5SdXvwyDhKRz8UxBd7o3T0YQBwvPfPP8
	1ED4nBNiQ+U+QtRhDmsmoOjy7zKJH/i0ly13/fJnnK914JbUCLEN5c0c+CKaOhVwedYonAf
	XWP0/DT92wdRlCYcH39YB8mGbJt4WhX/6srPnfqqUP8wXVFBJ6iG/h2T7vQqxuqmdwtCc8J
	XS6FjXxYAEadD3zLingAcefoAxvUAaR/Wzm65VT56osDpKo8g5LWqnp5yKgSpyHnL+uuu3C
	yNFQxXYZRE4kg/aKi/YZDcxbiiNK3UgrfaBKrrIJf53FgvFgfdK/tWeD6xbJSaMqfn5Wf6q
	2gQoEPs44eYQDbcJLEy1o4SRbpi02hCZTXrq1NY3an+xMj4UDmFqbBoZvJhecaavraqYxqf
	dxEWg2PD3RzbnkBLCPBtRCwITnOWw=
X-QQ-XMRINFO: OWPUhxQsoeAVwkVaQIEGSKwwgKCxK/fD5g==
X-QQ-RECHKSPAM: 0
X-Spamd-Result: default: False [-1.36 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[radxa.com : SPF not aligned (relaxed), No valid DKIM,none];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-101977-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,baylibre.com,gmail.com,quicinc.com,linaro.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	FROM_HAS_DN(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sophon@radxa.com,linux-arm-msm@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.806];
	RCPT_COUNT_SEVEN(0.00)[11];
	R_DKIM_NA(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,radxa.com:email,radxa.com:mid]
X-Rspamd-Queue-Id: 61E713A4F5D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The duty cycle calculation in clk_rcg2_set_duty_cycle() computes
"n * duty->num * 2" using u32 arithmetic. When n is large and
duty->num is also large, the intermediate result overflows u32.

For example, requesting 50% duty on a 1 kHz output derived from a
19.2 MHz parent gives n=19200, duty->num=500000, duty->den=1000000:

  19200 * 500000 * 2 = 19,200,000,000 > U32_MAX (4,294,967,295)

The truncated result produces a completely wrong duty cycle (5.26%
instead of the requested 50%).

Use DIV_ROUND_CLOSEST_ULL() with an explicit (u64) cast to prevent
the overflow.

Fixes: 7f891faf596e ("clk: qcom: clk-rcg2: Add support for duty-cycle for RCG")
Signed-off-by: Xilin Wu <sophon@radxa.com>
---
 drivers/clk/qcom/clk-rcg2.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/qcom/clk-rcg2.c b/drivers/clk/qcom/clk-rcg2.c
index 82ee7ca1703a..0e8f0473897e 100644
--- a/drivers/clk/qcom/clk-rcg2.c
+++ b/drivers/clk/qcom/clk-rcg2.c
@@ -783,7 +783,7 @@ static int clk_rcg2_set_duty_cycle(struct clk_hw *hw, struct clk_duty *duty)
 	n = (~(notn_m) + m) & mask;
 
 	/* Calculate 2d value */
-	d = DIV_ROUND_CLOSEST(n * duty->num * 2, duty->den);
+	d = DIV_ROUND_CLOSEST_ULL((u64)n * duty->num * 2, duty->den);
 
 	/*
 	 * Check bit widths of 2d. If D is too big reduce duty cycle.

-- 
2.53.0


