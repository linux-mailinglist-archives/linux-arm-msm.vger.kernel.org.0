Return-Path: <linux-arm-msm+bounces-104195-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6K9lG9Gp6WkxgwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104195-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Apr 2026 07:10:41 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C15B544D29D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Apr 2026 07:10:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6D534301E979
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Apr 2026 05:09:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 156C636167E;
	Thu, 23 Apr 2026 05:09:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=packett.cool header.i=@packett.cool header.b="GtdnJKtv"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from out-181.mta0.migadu.com (out-181.mta0.migadu.com [91.218.175.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A084379EF2
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Apr 2026 05:09:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776920968; cv=none; b=QjsRRQa8tiKbVx1PdaXWHrO6NRuJ0BKa28cMuY5GqmBqDSYoPlzaddBz2xo71hHS6L0gbTdfDEFjbsPX/pvMeRLfIeSvM4HGN/PBce98+FtTiBGbv9R2Q/aQIGq6/8hqMhx3MvgYpSf2fQKH1qtumOSe/b5xgBZbetF3me+F9m4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776920968; c=relaxed/simple;
	bh=Awsbmf/is2gTwwsBREmIDYrM0WfnGvu/erL9Jv0a49A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lnkLPt7b6Dz+0Xyw51TJr+4BtDWltGf7OqNcm8RMQUcX3lF3+5ChlWOY8a0Pryy8e352IY0shTkuZL/PW1K52qWZHNDOHSHPdOjGr1gxU18eMHGoE35nRm4/RfR7nd/0fABukGBjH2isQBeK49eFLIqY2RxsOlnr1G71LIXw0k8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool; spf=pass smtp.mailfrom=packett.cool; dkim=pass (2048-bit key) header.d=packett.cool header.i=@packett.cool header.b=GtdnJKtv; arc=none smtp.client-ip=91.218.175.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=packett.cool
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=packett.cool;
	s=key1; t=1776920964;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=41KJpIHP9HEj9do1wX0yPVovg9t4I3SZtimzUmaH4dA=;
	b=GtdnJKtvRlYdz+w9F2yE+7+yMoL9OAvAU0QFCYpvt86NHtEkUZwROSyONTowBFSizdLXig
	QBtjpwlzO/0LmXLUVz7dR7GHYr0kAPNtnnofyYFkSvppHrv9n5cZ96mV7RBdTVDW/MA3Z6
	z6XBJxlHtIEDgZBICwba5zadPzN0FF6FBVBj4yVKjqlUqUD/l4smueARJHbgvrbetG3x4t
	XZe1LYhnvAdGgblQgRba0YqFIGmTgzSnyee9l6ejMX8U6D9+7uxl/Z2IB8Yvf+SDVlh6ok
	1R3dzEydwBQ6am6/B7oWuBQMeC9qYl9zcDiV74EjbQGrHCVH8qPomQtRZj2Ifg==
From: Val Packett <val@packett.cool>
To: Srinivas Kandagatla <srini@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Cc: Val Packett <val@packett.cool>,
	Bhushan Shah <bhushan.shah@machinesoul.in>,
	Luca Weiss <luca.weiss@fairphone.com>,
	Antoine Bernard <zalnir@proton.me>,
	~postmarketos/upstreaming@lists.sr.ht,
	phone-devel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/6] ASoC: qcom: qdsp6: q6afe: fix clk vote response type mismatch
Date: Thu, 23 Apr 2026 01:41:01 -0300
Message-ID: <20260423050801.210840-3-val@packett.cool>
In-Reply-To: <20260423050801.210840-2-val@packett.cool>
References: <20260423050801.210840-2-val@packett.cool>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[packett.cool,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[packett.cool:s=key1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-104195-lists,linux-arm-msm=lfdr.de];
	RCVD_COUNT_THREE(0.00)[3];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,perex.cz,suse.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[val@packett.cool,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[packett.cool:+];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[packett.cool:email,packett.cool:dkim,packett.cool:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: C15B544D29D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The response sent by the firmware when requesting a clock vote (opcode
AFE_CMD_RSP_REMOTE_LPASS_CORE_HW_VOTE_REQUEST) does not actually have
the same opcode + status payload as APR_BASIC_RSP_RESULT. Rather, it
returns one single u32 which is the client_handle that must be used in
future unvote requests for the same clock.

As a result of this type confusion, the status returned by the callback
to q6afe_vote_lpass_core_hw was actually an out-of-bounds read. It was
only interpreted as success (0) most of the time due to luck, but there
are reports of random ("more likely on cold boot", "depending on hacks
made in other drivers") errors such as:

[   20.961100] qcom-q6afe aprsvc:service:4:4: AFE failed to vote (3)
[   20.961131] Failed to prepare clk 'core': -110

Fix by correctly interpreting the response as a single u32, and actually
store it as the client_handle to ensure unvote would work correctly.

Link: https://lore.kernel.org/all/5976946.DvuYhMxLoT@antlia/
Signed-off-by: Val Packett <val@packett.cool>
---

Found by reading and comparing with downstream:
https://github.com/YumeMichi/kernel_xiaomi_pipa/blob/27190355fb31284988ddf505cb7cfba5128104cf/techpack/audio/dsp/q6afe.c#L1261-L1263

What's really bizzare though is that some of the logs go:

[ 10.827469] qcom-q6afe aprsvc:service:4:4: cmd = 0x100f4 returned error 
= 0x16
[ 10.827512] qcom-q6afe aprsvc:service:4:4: Unknown cmd 0x100f4
[ 14.052896] qcom-q6afe aprsvc:service:4:4: AFE failed to vote (3)

..where the "returned error =" message is something that can only be
printed by the callback if it goes into the **other** switch() branch,
i.e. when hdr->opcode == APR_BASIC_RSP_RESULT. How reading out-of-bounds
only in the AFE_CMD_RSP_REMOTE_LPASS_CORE_HW_VOTE_REQUEST branch would
cause that to happen (even on a subsequent vote after the first one to
perform the read) is beyond me.

Still, the person that reported this heisenbug told me that this has
actually completely fixed it.

---
 sound/soc/qcom/qdsp6/q6afe.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/sound/soc/qcom/qdsp6/q6afe.c b/sound/soc/qcom/qdsp6/q6afe.c
index 40237267fda0..28b5b6b91897 100644
--- a/sound/soc/qcom/qdsp6/q6afe.c
+++ b/sound/soc/qcom/qdsp6/q6afe.c
@@ -379,6 +379,7 @@ struct q6afe {
 	struct q6core_svc_api_info ainfo;
 	struct mutex lock;
 	struct aprv2_ibasic_rsp_result_t result;
+	uint32_t vote_result;
 	wait_queue_head_t wait;
 	struct list_head port_list;
 	spinlock_t port_list_lock;
@@ -968,13 +969,14 @@ static int q6afe_callback(struct apr_device *adev, const struct apr_resp_pkt *da
 	const struct aprv2_ibasic_rsp_result_t *res;
 	const struct apr_hdr *hdr = &data->hdr;
 	struct q6afe_port *port;
+	uint32_t *vote_res;
 
 	if (!data->payload_size)
 		return 0;
 
-	res = data->payload;
 	switch (hdr->opcode) {
 	case APR_BASIC_RSP_RESULT: {
+		res = data->payload;
 		if (res->status) {
 			dev_err(afe->dev, "cmd = 0x%x returned error = 0x%x\n",
 				res->opcode, res->status);
@@ -1001,8 +1003,10 @@ static int q6afe_callback(struct apr_device *adev, const struct apr_resp_pkt *da
 	}
 		break;
 	case AFE_CMD_RSP_REMOTE_LPASS_CORE_HW_VOTE_REQUEST:
+		vote_res = data->payload;
 		afe->result.opcode = hdr->opcode;
-		afe->result.status = res->status;
+		afe->result.status = 0;
+		afe->vote_result = *vote_res;
 		wake_up(&afe->wait);
 		break;
 	default:
@@ -1899,6 +1903,8 @@ int q6afe_vote_lpass_core_hw(struct device *dev, uint32_t hw_block_id,
 			       AFE_CMD_RSP_REMOTE_LPASS_CORE_HW_VOTE_REQUEST);
 	if (ret)
 		dev_err(afe->dev, "AFE failed to vote (%d)\n", hw_block_id);
+	else
+		*client_handle = afe->vote_result;
 
 	return ret;
 }
-- 
2.53.0


