Return-Path: <linux-arm-msm+bounces-113456-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id fQPjA1mEMWqplQUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113456-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jun 2026 19:14:01 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B29B692E41
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jun 2026 19:14:00 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=hX1Jd+R5;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b="Qk/Sn8/+";
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113456-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113456-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3AA13304149A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jun 2026 17:03:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 75286328610;
	Tue, 16 Jun 2026 17:03:05 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C9A143D4E9
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jun 2026 17:03:04 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781629385; cv=none; b=RycxZtENqejoejoqJx9gxFbwDcxSoBY6amB5TZ3dfG7qTdd5lSe5B3BzRgpou+6FYrd94zQRsVJjELd5zGwhFA2BwTVZg15P5ty37DYyQ214tiLGwwETbU4L94ZV/mImsnpk4fam5Cu73mUzxy0Uw1gLZ/mJdv8yP9Eeargir0g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781629385; c=relaxed/simple;
	bh=lLxvdHCAPpQZp6pnlDmDv20UFFdnnMDjt/ZuR81XGvY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=eVTAP5FXTvgCm+0T8DajHJsskmmA7uwBZbC/K9liJlCZkiTJXu4H3rIExJgDvQ27gYJIFJUr+CfC/Tf/WCCqMWiiG+1M79JRZbi4tV9cAlAvczatLjv/LLk1nJQOiW0IwJHLEJo+ccUA6tngZU90fv0jX2Rz+czJR7HZMI+D+bk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hX1Jd+R5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Qk/Sn8/+; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65GFcsV53666614
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jun 2026 17:03:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=tqkhb6/HtxqIF1Por0FEpscFxhtJwz/EzUn
	01w0gJKE=; b=hX1Jd+R5M7aATIDNo799S+JfrEXg0FLn4Y28Qv/xWHwm8TauawI
	5G7SQ3qsafwuTiM41xKq01doa9Ge/mWvL83Idut1g5fUzgFdAC+b9U6mwpm/UIdG
	H+l2gbVs01XILvy1trVNSA5X7MNZfroE7dkom7jIoS57MGtJ8bFv3AZbaiPncBfK
	40V+khDciizBwclUqur/vCjAbyZNhYcOVMdTBYq2ck1B1ShyAXddQOyiqNdyZpl/
	d7PenKzkZquu/5aOyCxbFpkhSHha04ZkyeF+EhkNYqTiQaK+MlJOWDGhmeyI4Tnc
	mVDr2dJCJSGMtTaFRSrHF9ozg9R4bsvQl8Q==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eu1762u8m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jun 2026 17:03:03 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-c85a298cd62so3279727a12.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jun 2026 10:03:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781629383; x=1782234183; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=tqkhb6/HtxqIF1Por0FEpscFxhtJwz/EzUn01w0gJKE=;
        b=Qk/Sn8/+Mjw3vFTeiuOOMpQBacvqJrByzFGklbJ9LOzaIa0jcV7sA+LJb2KPGyo1go
         I05igR53LYO8p+mcw8i8Ghmo8fUDV2QIxKe/QuK10kN8S5JyZCfbD5oEOQ+U4hwIoptk
         RuS2iSfhnGCofMaHoLSutys1eevP7c54B3KRDXqzNOR6+mJFzmzquFYbyhzuTuASOjya
         u+Nj4YJP0qX+MLTLR9OknjViFz6RTQh88Tnv+46Z1ltKLj3JhYaxOemWRxqalJuh+kAG
         Wlc0PKqE+ZoLZ9SJsMUWaunLvS2wWhvG2uFp1N5LMBhGit5QsHouabBNCLXV4tPUgOzO
         8YSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781629383; x=1782234183;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tqkhb6/HtxqIF1Por0FEpscFxhtJwz/EzUn01w0gJKE=;
        b=bwoMRqBl8RTrtQumuSTku49kNWAb97fcSPOTWYgPgMPvyiyH38h/0NlBPSJeSXTu1e
         JWtoXLemCMEJ86riP0L0ts1OxujH96g7Xhu0Hm4Vw2AmS9BKkogMoaRfG6Cc8MEIkw7E
         AO7etcTjrWG1K3CO5UmMHXtnTxHQwiC3rtRvIVHZlPXwhJfc8yngiu6etvfPFMukVzIi
         E/+Isczu5eliw1K9QAStflqN/1tI0cDoEwBk3xp+ZdWxiFEanGgTvreGPleqk+d6o/pi
         exgGPe/ks/1ySVJg/3vtlkF2STl3oPg561jYyUrl2tkckFFYE8eUcae1AWjmdtLJzmvb
         ghBw==
X-Forwarded-Encrypted: i=1; AFNElJ/2ULTP44/MTBXwylHHpJjOENgwbJRR5A+0g/k9oO/PINHgwEKzmz7EKdzjCN1HKXrweDovq/f3GRMj9q+y@vger.kernel.org
X-Gm-Message-State: AOJu0YzPwo2UHbbLY+gxYeTePUmB3eR6AtBbIAx4ZohALLLzUgFRuEjF
	lraQYe/ULMTo8SMWUKTDssuDF+5X7DhhVqXYHIW1HxAA8GHnacVXtbO2oTiiwOxpTM8nBpB48k0
	4qNnD+MHM2tP176oNK0LucRP1+rrQ7lk4UBnctVGLVdkEEg/ACmg4g20eydxSsmefxqxH
X-Gm-Gg: Acq92OGgyLQT+6x1UE/VJ0e58hzGhJB8RN8y2Q3IVrpNOUftrWwfbOuqlrZkBfl42gQ
	EUeMwRC7X4bmMag5Gp1ttXFwlHVFA0tJh9UOZQSchsOPyH86AXcDqLqNf3BDJ9a21OTPbT+K+WW
	Y6UMw2MjGvSHyPrUVsj+NCATpbxVahupA67+HapDzWhZ6n4j/A8C6H5MGt9bXH0ytdmlaltxW3b
	vX4gQYmcFW9L+OQoVoDA8oWxljWScK7SEjHwh9qp6+UpSzS1vDjEsi+TTAdjFgqxZbNusS9aSQ5
	P4HWr62WWHnDy03ISgfvSV6FqPC26kmrxDbxUYGjPAyz7VbELaGuC2B2dWCELqjrfDFY1X/c51i
	EUjMe0K3dmO8zYJqlszai6qorFPDMdIfPoBU=
X-Received: by 2002:a05:6a21:3086:b0:3b4:85db:1bd0 with SMTP id adf61e73a8af0-3b8b603267dmr215803637.12.1781629382723;
        Tue, 16 Jun 2026 10:03:02 -0700 (PDT)
X-Received: by 2002:a05:6a21:3086:b0:3b4:85db:1bd0 with SMTP id adf61e73a8af0-3b8b603267dmr215723637.12.1781629382056;
        Tue, 16 Jun 2026 10:03:02 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49230a458f2sm75542575e9.3.2026.06.16.10.03.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jun 2026 10:03:01 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: broonie@kernel.org
Cc: perex@perex.cz, tiwai@suse.com, krzysztof.kozlowski@oss.qualcomm.com,
        andersson@kernel.org, pierre-louis.bossart@linux.dev,
        linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        Stable@vger.kernel.org, Val Packett <val@packett.cool>
Subject: [PATCH] ASoC: qcom: q6apm: fix NULL pointer dereference in graph_callback
Date: Tue, 16 Jun 2026 18:02:57 +0100
Message-ID: <20260616170257.9381-1-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: V_2XLwH7Mez5UiysM37azNJK4QX_IAQS
X-Proofpoint-ORIG-GUID: V_2XLwH7Mez5UiysM37azNJK4QX_IAQS
X-Authority-Analysis: v=2.4 cv=I4RVgtgg c=1 sm=1 tr=0 ts=6a3181c7 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=MGBxgCYFQN7ghPknZEEA:9 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE2MDE3NSBTYWx0ZWRfX2w5JxaOmp/Ve
 EnA+cXwXw7McnGzuYZtX3zvwQIdo0e3yIjoCQnWJL+26v6ClYafg5KUHKMLqexq8ckQe2iSW/OU
 GKEKvHDqFqP+iKv4kgrLifGcJEJlYw0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE2MDE3NSBTYWx0ZWRfX/QFE8q83hst2
 AM0trzQpR1vbI9IBxt7easS4nY+3ZyhW5MzE17hvTLwJMV5QZyJDB8Q8laYlm7JgWRQrpaiakya
 FV4O9je3s48WccyVoUcg9DDlyQeqFyDiYRbPkq/9wXkclxJW02B2r4oRHHjyBgXURgeaDURJqto
 Zke/IaEwaHMrD3a3Cwmtfq9gS9mcz40vt/UMK6J0A8KV/EEfmdSnhEE/3I5FeDSVoUNnoZduK8T
 Kk92u42zMxuNAH81XlQc/WK8YG7X90HGqFC5tlgIJ6kolDGPVT0howz/vEV4JDPboLRFVa1woS3
 dFH//SWw53l3CNkH+xb/DRgTJb0xUx68f2vJExrGWkbRUxL8NYdVbryOEqdyKKpmJoajv/6DKAf
 /bxVgoslJxdBkQdN9Kio99vTTOUqs9gB740nzfxic+a4/RHFg1GlbSrFp4UJ5fZJNxlP63xF9Dd
 J1jz1yDug/xt5r3xHuw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-16_05,2026-06-15_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 spamscore=0 suspectscore=0 lowpriorityscore=0
 priorityscore=1501 clxscore=1015 bulkscore=0 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606160175
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-113456-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:broonie@kernel.org,m:perex@perex.cz,m:tiwai@suse.com,m:krzysztof.kozlowski@oss.qualcomm.com,m:andersson@kernel.org,m:pierre-louis.bossart@linux.dev,m:linux-sound@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:srinivas.kandagatla@oss.qualcomm.com,m:Stable@vger.kernel.org,m:val@packett.cool,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORGED_SENDER(0.00)[srinivas.kandagatla@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[srinivas.kandagatla@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,packett.cool:email];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 6B29B692E41

When q6apm_free_fragments() is called it frees rx_data.buf/tx_data.buf
and sets them to NULL under graph->lock. A late DSP buffer-done response
can race with this: graph_callback() passes the !graph->ar_graph guard
(not yet NULL), acquires the lock, but then dereferences a now-NULL buf
pointer to read buf[token].phys, crashing at virtual address 0x10.

Add a NULL check for buf inside the mutex-protected section in both the
write-done (DATA_CMD_RSP_WR_SH_MEM_EP_DATA_BUFFER_DONE_V2) and
read-done (DATA_CMD_RSP_RD_SH_MEM_EP_DATA_BUFFER_V2) handlers and bail
out cleanly if buffers have already been freed.

This problem is only shown up recently while apr bus was updated to
process the commands per service rather from single global queue.

Fixes: 5477518b8a0e ("ASoC: qdsp6: audioreach: add q6apm support")
Cc: Stable@vger.kernel.org
Assisted-by: Claude:claude-4-6-sonnet
Reported-by: Val Packett <val@packett.cool>
Closes: https://lore.kernel.org/all/133ced18-1aa9-475d-80d8-6120678bdde4@packett.cool/
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 sound/soc/qcom/qdsp6/q6apm.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/sound/soc/qcom/qdsp6/q6apm.c b/sound/soc/qcom/qdsp6/q6apm.c
index 2ab378fb5032..2873e831a8de 100644
--- a/sound/soc/qcom/qdsp6/q6apm.c
+++ b/sound/soc/qcom/qdsp6/q6apm.c
@@ -549,6 +549,10 @@ static int graph_callback(const struct gpr_resp_pkt *data, void *priv, int op)
 		token = hdr->token & APM_WRITE_TOKEN_MASK;
 
 		done = data->payload;
+		if (!graph->rx_data.buf) {
+			mutex_unlock(&graph->lock);
+			break;
+		}
 		phys = graph->rx_data.buf[token].phys;
 		mutex_unlock(&graph->lock);
 		/* token numbering starts at 0 */
@@ -571,6 +575,10 @@ static int graph_callback(const struct gpr_resp_pkt *data, void *priv, int op)
 		client_event = APM_CLIENT_EVENT_DATA_READ_DONE;
 		mutex_lock(&graph->lock);
 		rd_done = data->payload;
+		if (!graph->tx_data.buf) {
+			mutex_unlock(&graph->lock);
+			break;
+		}
 		phys = graph->tx_data.buf[hdr->token].phys;
 		mutex_unlock(&graph->lock);
 		/* token numbering starts at 0 */
-- 
2.53.0


