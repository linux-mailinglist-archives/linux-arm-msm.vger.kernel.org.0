Return-Path: <linux-arm-msm+bounces-106194-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0ISmDumn+2mYewMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106194-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 06 May 2026 22:43:21 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CD564E045A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 06 May 2026 22:43:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 81DF630063A9
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 May 2026 20:43:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CDEB53AF660;
	Wed,  6 May 2026 20:43:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=packett.cool header.i=@packett.cool header.b="UL1QvyZO"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from out-179.mta1.migadu.com (out-179.mta1.migadu.com [95.215.58.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65F0336164B;
	Wed,  6 May 2026 20:43:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778100194; cv=none; b=GSsxvUwFZlTmysNb5AZtkn93K9PPV32RntBDopmbNx4YXcG8YDVCsOYWJV1tgoqCKU9mNI+ZMwU6lJ2akqnVcddE2KaBX85XHZP1loGVnB7tZElmkaoqyb6Q+pWi8JFNU4vBLFtruyK4rzrizVDvkLoxbmr7wptQJb63N23SR2g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778100194; c=relaxed/simple;
	bh=0QiQBPIOcLjIk+6uVZ2ym6r2K6OOhQg2VGfU3Pf5PwM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RHQFyxOXNaC37FFFPn6hOyeBzozmnvOpDzShc2e9MIpEJSK3R81Cl2qi4bDqNROSuOKL0ouMpKDDO4BDjUS3QvhHh1eJiB+dTbkDoSzIjbYJHDha/86Jn/SgyAy10mrSGP5RrOcDa7CnnGaYWtDCtlMIqMfJnLLASAcN961/jK8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool; spf=pass smtp.mailfrom=packett.cool; dkim=pass (2048-bit key) header.d=packett.cool header.i=@packett.cool header.b=UL1QvyZO; arc=none smtp.client-ip=95.215.58.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=packett.cool
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=packett.cool;
	s=key1; t=1778100189;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=W1Y43cl3NFWC2uTS5PoFccmqAiBjm5cvOxvgFfBLr4E=;
	b=UL1QvyZOPHYGTO8hTStY+HmqBR5MB/RV8keKyFDCly7SbFDcejaobMPNs/TrHa2iMhHHlJ
	Vr15Te0ceR05o3mpRksK2X/Rg2UeAYWrd5wrm6CEwJfahREWQwHe8l7ywzjUeDTIC1QFuv
	NcVvW4a8WNvg0uTVxRnEdCNbnx+9JHLPM82DutEKnHpDihPlYUX5v0rfT/FWyM06wJlL9U
	Xy2c7AdEE3Hzfp/lNVF8Y+Y2avwYnAZNkUAg7ocPolOUAmzZutvnxMiPpq+S2EnqZVvWu8
	FCQ7qpwNh70TeHhAT7foA4+2+hcXU2RzN5YrLcPxvuR+0P/566/ifWA1Nr0HLw==
From: Val Packett <val@packett.cool>
To: Srinivas Kandagatla <srini@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Cc: Val Packett <val@packett.cool>,
	Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
	Bhushan Shah <bhushan.shah@machinesoul.in>,
	Luca Weiss <luca.weiss@fairphone.com>,
	Antoine Bernard <zalnir@proton.me>,
	~postmarketos/upstreaming@lists.sr.ht,
	phone-devel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH v2 1/6] ASoC: qcom: qdsp6: q6afe: fix clk vote response type mismatch
Date: Wed,  6 May 2026 17:33:02 -0300
Message-ID: <20260506204142.659778-2-val@packett.cool>
In-Reply-To: <20260506204142.659778-1-val@packett.cool>
References: <20260506204142.659778-1-val@packett.cool>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-Rspamd-Queue-Id: 9CD564E045A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[packett.cool,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[packett.cool:s=key1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-106194-lists,linux-arm-msm=lfdr.de];
	RCVD_COUNT_THREE(0.00)[3];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,perex.cz,suse.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[val@packett.cool,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[packett.cool:+];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[packett.cool:email,packett.cool:dkim,packett.cool:mid,qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]

The response sent by the firmware when requesting a clock vote (opcode
AFE_CMD_RSP_REMOTE_LPASS_CORE_HW_VOTE_REQUEST) does not actually have
the same opcode + status payload as APR_BASIC_RSP_RESULT. Rather, it
returns one single u32 which is the client_handle that must be used in
future unvote requests for the same clock.

As a result of this type confusion, the status returned by the callback
to q6afe_vote_lpass_core_hw was actually an out-of-bounds read. It was
only interpreted as success (0) most of the time due to luck, but there
are some reports of random errors such as:

[   20.961100] qcom-q6afe aprsvc:service:4:4: AFE failed to vote (3)
[   20.961131] Failed to prepare clk 'core': -110

Fix by correctly interpreting the response as a single u32, and actually
store it as the client_handle to ensure unvote would work correctly.

Cc: stable@vger.kernel.org
Link: https://lore.kernel.org/all/5976946.DvuYhMxLoT@antlia/
Fixes: 55e07531d922 ("ASoC: q6dsp: q6afe: add lpass hw voting support")
Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Signed-off-by: Val Packett <val@packett.cool>
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


