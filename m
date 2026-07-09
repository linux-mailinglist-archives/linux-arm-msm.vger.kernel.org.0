Return-Path: <linux-arm-msm+bounces-117832-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id TvLlF88hT2oDbAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117832-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Jul 2026 06:21:35 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id E770E72C8AC
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Jul 2026 06:21:34 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b="k/6CHhaq";
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=SnK6C5yY;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117832-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117832-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 279CC301E9B1
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Jul 2026 04:21:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB0513939BD;
	Thu,  9 Jul 2026 04:21:02 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A32C39658D
	for <linux-arm-msm@vger.kernel.org>; Thu,  9 Jul 2026 04:21:01 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783570862; cv=none; b=apdx8NoYGv3okLCC1/NTEo/CRArWMC5FrD12ZqYgVM9f2+hOT9XOkptnnMIZFrTB7cEc3y3C8TTNdzped/K3UWqP4LII/8+ygUH+QaOUBI1VfukNw61ydAHIPQ73b+8fwgwTyJGugHFCfB8nVwJerGblX57Zaq/i8k76Vjkzxpk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783570862; c=relaxed/simple;
	bh=rvm1wz1ZLi+Wu8yKfQSbMLnWcPgwIpdMwa2eQX4CXKA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PaMvw35Lz57hKtTHUaTIMiUlzo8Ta0gbVGhYesxiZ/PoIs0KBhzrqjr8Ynwu0cUVL0/mm3Ej864+VO/+aK4OXqKgE605qceS8/RQ6e4PHASsqv6ehz3lyagBrfKilwvO+PX6HTNLz9A+uYn506O5XtvF7B1pS2n5R0wqjhNUwzI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=k/6CHhaq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SnK6C5yY; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 668N8Mpk083248
	for <linux-arm-msm@vger.kernel.org>; Thu, 9 Jul 2026 04:21:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nsz1H97/3mIQwsbA/XJBmxwh8+fKOZ0DFWQS+InwXQs=; b=k/6CHhaqcdFDevPc
	qdtrG50BN4sU3AOsD4sw5qrU/hdwu7pJxOK5vniJEka2MATwftQMCm+163/OnMvr
	m6T5l2eQYv5/dKT2dpl8DJHoQgvRlGAYIeORgWm6qG70yybtiZbCcMzrjlW3ifAK
	t6NX0XHFZqWfqGJ/yBgxeBaBirE+AayuqujJVfbir5sRdeC4dQkpkluK6Qx7MQ9y
	dSUlUl9vzpJqETtx6iOZehU26cSKZ9y6e/oH2stqJmlHEUCgcwjDphrJML24hu6S
	cZt6ObYMMD6IjFCY4T8gj48jnvXJ8OQnG32ZCd5o7vE/9fCKvkYi9FMBJbVVBNNt
	yhuoeg==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f9v4vsqn4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 09 Jul 2026 04:21:00 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-37e24235ce1so2639819a91.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 Jul 2026 21:21:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783570860; x=1784175660; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nsz1H97/3mIQwsbA/XJBmxwh8+fKOZ0DFWQS+InwXQs=;
        b=SnK6C5yYS9thEDgbzKKrA5eVaVsy7cLWqjWSEnPsN5gR22z6oznHLs3/jyKxQCK7zp
         PlDiknTWKhl/dyKjZgas0I52IE8AnaC+Ur06bXhwXFZJ+yE6yMU7maMLKDxB2uIigWBI
         Jbwkp1eK1S8IlxBXPVlsYq7H4N88nf+9IW9r09969jwOKSua/fBo3g9CN5DOLGg8SC6T
         iMYBJEL/5dEZXc1WgsgRIqTUkw8aw0Li0b3VKqNz09OyATEhSHF1qTr0Pa3jYDDlP4sJ
         0ypU86UBlRrlVYfsZobF2h0XY2LXTBjg1/1j8d4vIdkL4Awc99hVeNDPNCimOPAXxa2t
         EBxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783570860; x=1784175660;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nsz1H97/3mIQwsbA/XJBmxwh8+fKOZ0DFWQS+InwXQs=;
        b=DaGdZ8E3e2wjKo9yeQzJFvgdygm1Y4HEqpIC1f3VmHeMtlsQalbZi3OJKB8ocLdQfR
         xM9OJcRU7MjDz6IQA2tJxBTu/stkEvqFrEY1S97TKMOGPZwESYEMzYTgD0t8xMU4v+QB
         WgWKCoMny3/DFNE8AWwUBU0BvLFnFMUC7ppdFpzNzT9PdV6dBIDOuHCsQBs9J0zNkc8M
         8faM/oSFiYOyZ68ne21qEI3bQgtLEJkLLyUAtbOzjTw6ifwEPspdG9dcUPeYZRXCaKG4
         XVSxSWHncAIZVSD8kBxl/QcizVIqo5oJ/PixI4rnwJk+rmoqXUAKmteslTKSGInzOrOW
         Ea8A==
X-Gm-Message-State: AOJu0YzZNCAHChVBz8yIDXvCOKr9tt58kXcvKq1wH5vYNY1GfQsb4i6k
	kaFaB065A/icbtDeisdTiLLErL8PL16lm8jOGju+twFHLw2wuCUb91j8dIXwVe5MpXCXj5zMmRK
	Dd29rOY0mN7ujr8uRVUHrpnk5YUhotwIb5J/vEuUIdKvaanvxLuQuiLGH1SdfXieVBjtpRJjBaX
	xT
X-Gm-Gg: AfdE7cn6ibaHJ55RfQPalzvhHuV3xY71buCvNmTf5p8nKkHI3d3tFLR9P5gBdPc04Pz
	b+bdFCA/tTb0dfmYrUDevwsgM5n6WNVQW1kAB7oHLIuwavYYSdf+Is2fafY0853CZPgi8ICnj5l
	oDfTtUQ9YZFKpLFYdwGZbm99V2yNwSBXlhUZgvmMetp98SLCNP67i5sGgggEwffv969wPflLSut
	CiZEuDeHALMJzELWaH/eF37Iw6n77/pA8BwoIbe16NoLpozWOb0Tcb9H6NIJOlD+pWpexoB/2kg
	Mo8mlO2NvyEmUtBfuTB8HNVTDdAqr0F9PTn+u1RyjSKHJ1LNabg2enaB3XmMLXyXm0vw969f+th
	Pe+iQJicHhJ3JcLL7EKWkkoUyDNnJ1uh27ajlp5bE2R6R
X-Received: by 2002:a17:90a:d606:b0:37f:c683:e643 with SMTP id 98e67ed59e1d1-389421ae110mr5398317a91.24.1783570859878;
        Wed, 08 Jul 2026 21:20:59 -0700 (PDT)
X-Received: by 2002:a17:90a:d606:b0:37f:c683:e643 with SMTP id 98e67ed59e1d1-389421ae110mr5398288a91.24.1783570859310;
        Wed, 08 Jul 2026 21:20:59 -0700 (PDT)
Received: from hu-ptalari-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-311747f596asm25490098eec.2.2026.07.08.21.20.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 21:20:58 -0700 (PDT)
From: Praveen Talari <praveen.talari@oss.qualcomm.com>
Date: Thu, 09 Jul 2026 09:50:41 +0530
Subject: [PATCH v2 2/3] i2c: qcom-geni: use dedicated completions for abort
 and reset events
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260709-fix_cancel_sequence_on_failure_for_i2c-v2-2-1db178c695bb@oss.qualcomm.com>
References: <20260709-fix_cancel_sequence_on_failure_for_i2c-v2-0-1db178c695bb@oss.qualcomm.com>
In-Reply-To: <20260709-fix_cancel_sequence_on_failure_for_i2c-v2-0-1db178c695bb@oss.qualcomm.com>
To: Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>,
        Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>,
        Andi Shyti <andi.shyti@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Praveen Talari <praveen.talari@oss.qualcomm.com>,
        Naresh Maramaina <naresh.maramaina@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783570849; l=5993;
 i=praveen.talari@oss.qualcomm.com; s=20251114; h=from:subject:message-id;
 bh=rvm1wz1ZLi+Wu8yKfQSbMLnWcPgwIpdMwa2eQX4CXKA=;
 b=vLdbT+65qynAFb5+3LAb+VXPtCTywzS0LgL3bE43v5KiGPrD3WeEwwabWztdms/jyiD9wSW8j
 bUwhpKBOMiBCT3QIKrcGuUaRNhoLEsI8UwQ5lS3D0yuJlFTW5c81rbS
X-Developer-Key: i=praveen.talari@oss.qualcomm.com; a=ed25519;
 pk=NGK/88fjyHXgfhIKwag7+uIytOmyOypvZ/hDFaYPEss=
X-Proofpoint-GUID: DYHkUHeIGuT-7teR0hVab58kz04sH2fK
X-Proofpoint-ORIG-GUID: DYHkUHeIGuT-7teR0hVab58kz04sH2fK
X-Authority-Analysis: v=2.4 cv=GIg41ONK c=1 sm=1 tr=0 ts=6a4f21ac cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=KPPVM4V1oce58VYRkwwA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA5MDAzNyBTYWx0ZWRfX/+FkTScgiLQ9
 i+xEOd3ZuQH3HkvaPHwrkgKLmUsJFXX5/V1QEymRPDFQ5e1uyAjEIt2nIxs6UbRi5dnx609kflt
 1T1tMM0JdaEHBqhMUkbWJilVdMZXTZ2+5M8JvCXPv7nUeMkZXCGnlrU25+QYurj2XhUPB1s7S2v
 81xC4HcxGLp63TaRxYrHp7lhhMYv7mypdCHH+tA49Y7Gn/PKVDB2/m0904Kua3JxReejztFekt2
 R0/iesVJ+Kn0WkmjpOkiciFqiCLO8IldOPq0ioD0zR1Fa2/Xr3E2eLeE/qbVyycusQiBWQfk91e
 /3hCPD8qQ+vbC07VMP8ndGJ1Dg1tqDNvDftz9PgVEIOpb4+WKVeyE1xQGXDkJp/0squ3eWCjBRL
 2eVAQU/A9VfATtsXgyit+s6aBEa5aHVfSgoe5YZ3v+1mRsBax4A6hA/g5o93X5bU59J2Thg7dPr
 68aFyENpTLTclgxaFfQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA5MDAzNyBTYWx0ZWRfX06oli6+9Xstu
 IVCmczFHLsO0UqmLIDWwDVuYcwcAZjfbk4yg0p7urtwdustyVe0yQuCtMupdB/MVAzlzMLKaQL8
 +z85UmgFgQv9JR6SLL+pYB9Inh3etok=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-08_05,2026-07-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 suspectscore=0 adultscore=0 priorityscore=1501
 spamscore=0 malwarescore=0 bulkscore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607090037
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-117832-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[praveen.talari@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:mukesh.savaliya@oss.qualcomm.com,m:viken.dadhaniya@oss.qualcomm.com,m:andi.shyti@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-i2c@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:praveen.talari@oss.qualcomm.com,m:naresh.maramaina@oss.qualcomm.com,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,vger.kernel.org:from_smtp,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[praveen.talari@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: E770E72C8AC

The driver uses a common completion event for transfer, abort and DMA
reset operations.  This allows unrelated completion events to
prematurely wake abort and reset waiters, leading to incorrect
synchronization.

Introduce dedicated completions for abort, TX reset, and RX reset
operations, and signal them only from their respective interrupt
events.  This removes the dependency on shared completion state and
eliminates the abort_done flag-based synchronization.

Co-developed-by: Naresh Maramaina <naresh.maramaina@oss.qualcomm.com>
Signed-off-by: Naresh Maramaina <naresh.maramaina@oss.qualcomm.com>
Signed-off-by: Praveen Talari <praveen.talari@oss.qualcomm.com>
---
 drivers/i2c/busses/i2c-qcom-geni.c | 54 +++++++++++++++++++-------------------
 1 file changed, 27 insertions(+), 27 deletions(-)

diff --git a/drivers/i2c/busses/i2c-qcom-geni.c b/drivers/i2c/busses/i2c-qcom-geni.c
index 15403edb355a..9490aee4928c 100644
--- a/drivers/i2c/busses/i2c-qcom-geni.c
+++ b/drivers/i2c/busses/i2c-qcom-geni.c
@@ -113,7 +113,10 @@ struct geni_i2c_dev {
 	int err;
 	struct i2c_adapter adap;
 	struct completion done;
+	struct completion abort_done;
 	struct completion cancel_done;
+	struct completion tx_reset_done;
+	struct completion rx_reset_done;
 	struct i2c_msg *cur;
 	int cur_wr;
 	int cur_rd;
@@ -127,7 +130,6 @@ struct geni_i2c_dev {
 	struct dma_chan *rx_c;
 	bool no_dma;
 	bool gpi_mode;
-	bool abort_done;
 	bool is_tx_multi_desc_xfer;
 	u32 num_msgs;
 	struct geni_i2c_gpi_multi_desc_xfer i2c_multi_desc_config;
@@ -256,8 +258,6 @@ static void geni_i2c_err(struct geni_i2c_dev *gi2c, int err)
 
 	switch (err) {
 	case GENI_ABORT_DONE:
-		gi2c->abort_done = true;
-		break;
 	case NACK:
 	case GENI_TIMEOUT:
 		dev_dbg(gi2c->se.dev, "%s\n", gi2c_log[err].msg);
@@ -359,12 +359,18 @@ static irqreturn_t geni_i2c_irq(int irq, void *dev)
 		writel_relaxed(dm_rx_st, base + SE_DMA_RX_IRQ_CLR);
 
 	/* if this is err with done-bit not set, handle that through timeout. */
-	if (m_stat & M_CMD_DONE_EN || m_stat & M_CMD_ABORT_EN ||
-	    dm_tx_st & TX_DMA_DONE || dm_tx_st & TX_RESET_DONE ||
-	    dm_rx_st & RX_DMA_DONE || dm_rx_st & RX_RESET_DONE)
+	if (m_stat & M_CMD_DONE_EN ||
+	    dm_tx_st & TX_DMA_DONE ||
+	    dm_rx_st & RX_DMA_DONE)
 		complete(&gi2c->done);
 	if (m_stat & M_CMD_CANCEL_EN)
 		complete(&gi2c->cancel_done);
+	if (m_stat & M_CMD_ABORT_EN)
+		complete(&gi2c->abort_done);
+	if (dm_tx_st & TX_RESET_DONE)
+		complete(&gi2c->tx_reset_done);
+	if (dm_rx_st & RX_RESET_DONE)
+		complete(&gi2c->rx_reset_done);
 
 	spin_unlock(&gi2c->lock);
 
@@ -376,17 +382,13 @@ static void geni_i2c_abort_xfer(struct geni_i2c_dev *gi2c)
 	unsigned long time_left = ABORT_TIMEOUT;
 	unsigned long flags;
 
+	reinit_completion(&gi2c->abort_done);
+
 	spin_lock_irqsave(&gi2c->lock, flags);
-	geni_i2c_err(gi2c, GENI_TIMEOUT);
-	gi2c->cur = NULL;
-	gi2c->abort_done = false;
 	geni_se_abort_m_cmd(&gi2c->se);
 	spin_unlock_irqrestore(&gi2c->lock, flags);
 
-	do {
-		time_left = wait_for_completion_timeout(&gi2c->done, time_left);
-	} while (!gi2c->abort_done && time_left);
-
+	time_left = wait_for_completion_timeout(&gi2c->abort_done, time_left);
 	if (!time_left)
 		dev_err(gi2c->se.dev, "Timeout abort_m_cmd\n");
 }
@@ -414,31 +416,25 @@ static void geni_i2c_cancel_xfer(struct geni_i2c_dev *gi2c)
 
 static void geni_i2c_rx_fsm_rst(struct geni_i2c_dev *gi2c)
 {
-	u32 val;
 	unsigned long time_left = RST_TIMEOUT;
 
+	reinit_completion(&gi2c->rx_reset_done);
 	writel_relaxed(1, gi2c->se.base + SE_DMA_RX_FSM_RST);
-	do {
-		time_left = wait_for_completion_timeout(&gi2c->done, time_left);
-		val = readl_relaxed(gi2c->se.base + SE_DMA_RX_IRQ_STAT);
-	} while (!(val & RX_RESET_DONE) && time_left);
 
-	if (!(val & RX_RESET_DONE))
+	time_left = wait_for_completion_timeout(&gi2c->rx_reset_done, time_left);
+	if (!time_left)
 		dev_err(gi2c->se.dev, "Timeout resetting RX_FSM\n");
 }
 
 static void geni_i2c_tx_fsm_rst(struct geni_i2c_dev *gi2c)
 {
-	u32 val;
 	unsigned long time_left = RST_TIMEOUT;
 
+	reinit_completion(&gi2c->tx_reset_done);
 	writel_relaxed(1, gi2c->se.base + SE_DMA_TX_FSM_RST);
-	do {
-		time_left = wait_for_completion_timeout(&gi2c->done, time_left);
-		val = readl_relaxed(gi2c->se.base + SE_DMA_TX_IRQ_STAT);
-	} while (!(val & TX_RESET_DONE) && time_left);
 
-	if (!(val & TX_RESET_DONE))
+	time_left = wait_for_completion_timeout(&gi2c->tx_reset_done, time_left);
+	if (!time_left)
 		dev_err(gi2c->se.dev, "Timeout resetting TX_FSM\n");
 }
 
@@ -851,6 +847,7 @@ static int geni_i2c_gpi_xfer(struct geni_i2c_dev *gi2c, struct i2c_msg msgs[], i
 	for (i = 0; i < num; i++) {
 		gi2c->cur = &msgs[i];
 		gi2c->err = 0;
+		reinit_completion(&gi2c->done);
 		dev_dbg(gi2c->se.dev, "msg[%d].len:%d\n", i, gi2c->cur->len);
 
 		peripheral.stretch = 0;
@@ -920,6 +917,8 @@ static int geni_i2c_fifo_xfer(struct geni_i2c_dev *gi2c,
 		m_param |= ((msgs[i].addr << SLV_ADDR_SHFT) & SLV_ADDR_MSK);
 
 		gi2c->cur = &msgs[i];
+		gi2c->err = 0;
+		reinit_completion(&gi2c->done);
 		if (msgs[i].flags & I2C_M_RD)
 			ret = geni_i2c_rx_one_msg(gi2c, &msgs[i], m_param);
 		else
@@ -939,8 +938,6 @@ static int geni_i2c_xfer(struct i2c_adapter *adap,
 	struct geni_i2c_dev *gi2c = i2c_get_adapdata(adap);
 	int ret;
 
-	gi2c->err = 0;
-	reinit_completion(&gi2c->done);
 	ret = pm_runtime_get_sync(gi2c->se.dev);
 	if (ret < 0) {
 		dev_err(gi2c->se.dev, "error turning SE resources:%d\n", ret);
@@ -1132,7 +1129,10 @@ static int geni_i2c_probe(struct platform_device *pdev)
 
 	gi2c->adap.algo = &geni_i2c_algo;
 	init_completion(&gi2c->done);
+	init_completion(&gi2c->abort_done);
 	init_completion(&gi2c->cancel_done);
+	init_completion(&gi2c->tx_reset_done);
+	init_completion(&gi2c->rx_reset_done);
 	spin_lock_init(&gi2c->lock);
 	platform_set_drvdata(pdev, gi2c);
 

-- 
2.34.1


