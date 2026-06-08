Return-Path: <linux-arm-msm+bounces-111788-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id W8uWJw2UJmoHZAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111788-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 08 Jun 2026 12:06:05 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id F1B97654D77
	for <lists+linux-arm-msm@lfdr.de>; Mon, 08 Jun 2026 12:06:04 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=runbox.com header.s=selector1 header.b="Eu33my S";
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111788-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111788-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=fail reason="SPF not aligned (relaxed), DKIM not aligned (relaxed)" header.from=gmail.com (policy=none);
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 789273086FED
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Jun 2026 09:58:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A0F483CE4B6;
	Mon,  8 Jun 2026 09:55:55 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mailtransmit04.runbox.com (mailtransmit04.runbox.com [185.226.149.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F22833BBA1E;
	Mon,  8 Jun 2026 09:55:48 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780912554; cv=none; b=C9qKmNlAOeyexcogoXqliO+yBdaT7lybH+RmPG/Ui/hwnmK8AHkvRXiD37l0ovUrifXFKEVWvWZJV2oJqh6Y2CZBngL2bNby21sOxrMIzzgPzDAh69Ao8E7G6eoncrkCEE0AsRrBsJdi2BR1W5JuJncmlsmStvCAvUvOfrw/Wgw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780912554; c=relaxed/simple;
	bh=T1UnwiheuMCQMo9Tor9HwQyYwt8qU9lr2zSyiC/fCjU=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Vtvb2Kvo1YrAxEkjOUvao+lH3PB7lRuBF/bqhe9Pk7RL+ncZwDvsUHeG0r9/3WcQzcyrDcQ4k+2xcPQ23QH0G1lNrdyFXmMB+R/PJ/Q38G+kpG+OF5lq1YoNBhd73gZ9Pu/YexBjUMEICyeHdbt/qE8F42DP+2aBRUoFERc4oDk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=runbox.com; dkim=pass (2048-bit key) header.d=runbox.com header.i=@runbox.com header.b=Eu33mySv; arc=none smtp.client-ip=185.226.149.37
Received: from mailtransmit02.runbox ([10.9.9.162] helo=aibo.runbox.com)
	by mailtransmit04.runbox.com with esmtps  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.93)
	(envelope-from <david.laight.linux_spam@runbox.com>)
	id 1wWWhu-00BS3W-KZ; Mon, 08 Jun 2026 11:55:46 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=runbox.com;
	 s=selector1; h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:
	Subject:Cc:To:From; bh=lCNv8SqXm3jLhFD/4mnTRkOAbQTUcEWzk89I3JpGeBQ=; b=Eu33my
	SvMmqpG6hN2tGXjBEh9lduS8bxMMaQX6AiU4p4bA2g7cOrEgwBWgYbvC51/rGaT1dlTkVI3g55Gu5
	Isq0vEaItYfKeL4gQv/wJdNkMv9bAjLUvi3fVPLVcRHd/bdmr5c1X96GBosLHQwMFHGNZq7gRA6EC
	RnYBYP2c3wBqyArfdpVRP0iTXc+FJ2FfqaC5TnDcHvfbldjZROl0yAHIMJQy6LRq15/wnatWbVceG
	ZhkQ9UA/kE7SQAw2Oznd7JyTRzyGErpdWKzTBUGRR+Ip1hw/7s5Hdkst/CRVrOttYk+uXbJ5t10Yj
	oVpW8Krmn76SYg5rlvcDNCohzUtg==;
Received: from [10.9.9.73] (helo=submission02.runbox)
	by mailtransmit02.runbox with esmtp (Exim 4.86_2)
	(envelope-from <david.laight.linux_spam@runbox.com>)
	id 1wWWht-0000K8-It; Mon, 08 Jun 2026 11:55:45 +0200
Received: by submission02.runbox with esmtpsa  [Authenticated ID (1493616)]  (TLS1.2:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.95)
	id 1wWWhm-00Ag6G-Ov;
	Mon, 08 Jun 2026 11:55:38 +0200
From: david.laight.linux@gmail.com
To: Kees Cook <kees@kernel.org>,
	linux-hardening@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-remoteproc@vger.kernel.org
Cc: Arnd Bergmann <arnd@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	David Laight <david.laight.linux@gmail.com>
Subject: [PATCH next] drivers/rpmsg: Fix copy of channel->name into open request
Date: Mon,  8 Jun 2026 10:55:17 +0100
Message-Id: <20260608095523.2606-33-david.laight.linux@gmail.com>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.06 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[runbox.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[gmail.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-111788-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_CC(0.00)[kernel.org,linaro.org,gmail.com];
	FORGED_SENDER(0.00)[davidlaightlinux@gmail.com,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:kees@kernel.org,m:linux-hardening@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-remoteproc@vger.kernel.org,m:arnd@kernel.org,m:andersson@kernel.org,m:mathieu.poirier@linaro.org,m:david.laight.linux@gmail.com,m:davidlaightlinux@gmail.com,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[runbox.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NO_DN(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[davidlaightlinux@gmail.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	DBL_BLOCKED_OPENRESOLVER(0.00)[runbox.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: F1B97654D77

From: David Laight <david.laight.linux@gmail.com>

Nothing obvious ensures that the name is less than GLINK_CMD_OPEN (32)
bytes long. It is specified by the external caller.
The constant is only used in this function.

Truncate longer names to avoid smashing the stack.
zero-pad the copy to avoid sending stale stack bytes to the
remote system.

Signed-off-by: David Laight <david.laight.linux@gmail.com>
---
This is one of a group of patches that remove potentially unbounded
strcpy() calls.

They are mostly replaced by strscpy() or, when strlen() has just been
called, with memcpy() (usually including the '\0').

Calls with copy string literals into arrays are left unchanged.
They are safe and easily detected as such.

The changes were made by getting the compiler to detect the calls and
then fixing the code by hand.

Note that all the changes are only compile tested.

Some Makefiles were changed to allow files to contain strcpy().
As well as 'difficult to fix' files, this included 'show' functions
as they really need to use sysfs_emit() or seq_printf().

All the patches are being sent individually to avoid very long cc lists.
Apologies for the terse commit messages and likely unexpected tags.
(There are about 100 patches in total.)

 drivers/rpmsg/qcom_glink_native.c | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/drivers/rpmsg/qcom_glink_native.c b/drivers/rpmsg/qcom_glink_native.c
index 401a4ece0c97..d10abab6881e 100644
--- a/drivers/rpmsg/qcom_glink_native.c
+++ b/drivers/rpmsg/qcom_glink_native.c
@@ -481,8 +481,7 @@ static int qcom_glink_send_open_req(struct qcom_glink *glink,
 				    struct glink_channel *channel)
 {
 	DEFINE_RAW_FLEX(struct glink_msg, req, data, GLINK_NAME_SIZE);
-	int name_len = strlen(channel->name) + 1;
-	int req_len = ALIGN(sizeof(*req) + name_len, 8);
+	int name_len, req_len;
 	int ret;
 	unsigned long flags;
 
@@ -498,14 +497,20 @@ static int qcom_glink_send_open_req(struct qcom_glink *glink,
 
 	channel->lcid = ret;
 
+	name_len = strscpy_pad(req->data, channel->name, GLINK_NAME_SIZE);
+	if (name_len < 0)
+		name_len = GLINK_NAME_SIZE;
+	else
+		name_len++;
+
 	req->cmd = cpu_to_le16(GLINK_CMD_OPEN);
 	req->param1 = cpu_to_le16(channel->lcid);
 	req->param2 = cpu_to_le32(name_len);
-	strcpy(req->data, channel->name);
 
 	trace_qcom_glink_cmd_open_tx(glink->label, channel->name,
 				     channel->lcid, channel->rcid);
 
+	req_len = ALIGN(sizeof(*req) + name_len, 8);
 	ret = qcom_glink_tx(glink, req, req_len, NULL, 0, true);
 	if (ret)
 		goto remove_idr;
-- 
2.39.5


