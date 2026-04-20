Return-Path: <linux-arm-msm+bounces-103802-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8GW1Em9f5mkWvgEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103802-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Apr 2026 19:16:31 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 46967430E1E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Apr 2026 19:16:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id D52543244DB9
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Apr 2026 15:43:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E43693382DE;
	Mon, 20 Apr 2026 15:43:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dIMwr4B8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aqsxUFYA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6ACB1336EC9
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Apr 2026 15:43:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776699833; cv=none; b=e1rpJ9s6XuH4YXPzJnu9b2CXk3XH2CEIxZlakHPdit7oULMxIP2Qo8KB7az77U4e+thm9/t70LYel5AeRHsIcJ+E+iuQASXabC4pUaivcdz2pa2nKgc7gKyvhjwZ66uFG1cPz5QBNRc4wLgZb1zx61BJWXStBU9C4ZY2teo32lY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776699833; c=relaxed/simple;
	bh=StTSG59tnpNuMU2uPSZoLQzqbsMyq9fwcMZjiEpdg6Q=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gIjP4kwEL18wuUXHm+A/DTMH372ee9CDEaIuvhw7jQtrPgvU/+8O0B61P43taZqt/aTfef08m/RQGUyy7UzZv6uIqsueqt8eMzeV54PR5tJ7eSL/kfRm+XVUrFNueXum4sMM2bJoUc7ITm10TKk8s/BKW6SRLK4mtvgGQyisOtU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dIMwr4B8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aqsxUFYA; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63KCKxX31532112
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Apr 2026 15:43:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QPBEl2EmLgl2bXNI31IZObAQEh4tI8eXiCacsAP7fp4=; b=dIMwr4B8cfSCNHx9
	qrucKs3TxvUTQlQKmbeNjhui0ZzxHpUsGscXjDagruIGdJrs+bImVrjDOyJOzlHV
	tZh0QfywKhmw3xRb6B0uiMKJEMv2AbBx6IP8z8/sWkXOw4urV4VrMaXjJEEfKoaj
	1pWpKOWCqESLc38vywI6CXHa7pA4IzMeyN6NlD7z5ps2FTpqplMAYGDn7IFHtfXO
	gfDhmA1Tp9ENEh5En1SlgQq+vbrMtRQhGwhMQQTIvdQEyve8mBOqnIa7v6kxAqWN
	wv7ujUiFm+dfPITE829eTvr9KWr8EkVHdzEo5tovlgBkDUGtrwjZtRuRRa1vmf+3
	lLbRSw==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dnfus23av-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Apr 2026 15:43:51 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-82fa5ecd760so961999b3a.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Apr 2026 08:43:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776699831; x=1777304631; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QPBEl2EmLgl2bXNI31IZObAQEh4tI8eXiCacsAP7fp4=;
        b=aqsxUFYAgS5VF37A9TBdwZGNRzVXuWnZ+zR4Df8smW4qqr9uZdXKf9SZqyUyt6zJza
         lpynYCt6SnAnzzXUAW56egmNPGhtsv/VMvOCc/x3KXsKu+tegl3olzEEkhb+cNFW45l9
         +0bTJRQZ8FnbFRyr4FUCa4obDUOO9uiAkegTTVBX0CSHn+TV0Jxd0klp+b7BLgmN1ute
         2kQQjmoSUhHXI/0V07qsIdE8G09aufQanozZ9xWbA6JVKAOJFavZXbhZPP93CzhCZXZU
         gKP3Q+UJNW5L6ftTzLhRxLas0PXdgtes0wOAIFQBg1rjBVS85rfKoX0M054G+A04XGgN
         7V6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776699831; x=1777304631;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=QPBEl2EmLgl2bXNI31IZObAQEh4tI8eXiCacsAP7fp4=;
        b=IcmAkaDXgeWIcDO2PlzmeUHVG49DOGNs+JSdvlfuskQ6WZRpymn28FjwEIFFL9yDcp
         nF+pY5cJ5JW5cGUfRgtY6UG+fp3aho5Az0QGYeEwM3rHk4jQOMRGx3dy0SDF0/rmeD8z
         Iir3rTzPl73vjTxMtcq+wSAKijuLde0mtcUXrVbuQDPIwXLOzLbDynCglK7AFwoUVffQ
         soNK/85Q+IHGrrSapZ86C7YsbD/wSNysZQ+8+lX22embSEtK3vOuHUOy6mb2RUpno8KI
         aDLrR3WwXqSkHabTC68oT4gCMBqzK0QkHMXZoFMmiJSqOFrlqmMUFxErmT0HsXsgasxG
         GQXQ==
X-Gm-Message-State: AOJu0YzH6EOQaGLnOlA+UjybK/Zfyv9Fvqv8aJ1iFXdafqi2x3Twic2F
	LHekJBNCfETeiAUDe8RKSMK48lJ3nbyOvdwtfxkGvUnMKrxFvYhCSbew5iyFsraq+XaoqWvAnbi
	bscnQ2QbSUwk3j+d+4cvETkU1EsEq4U1r0ffqaOu1EWBYcE7ElNZIKpRaUuZz3pa1LZdN
X-Gm-Gg: AeBDiev9os7o8Z1NRfMyUMPOYNDYq7+9isK0UjkLQWIpff8CREGfznPOCcRBM3fuDtf
	R9/Nlan5vXydI5aK/Uulq2FvaVidhZeze/Wcmv1LpYFVT3Jjhp6YMLFdotkH9sVlATEZB+SJwZd
	8sh9zCevD3sqCKVUOqf2HznWXyVqpkKDYrq3kofItFSSMlxE1xna/z1dTw3OuFUPnLgBGRb150/
	hr8hH2myxrFEoTjlyXGeTWcMZp7n9iWjeBP4N5RQI9zzjtPGKCU9/PeJUQM9X7l2zxcbDsA0MQ7
	R1Qhk855UE6W73sc0s0yOek43lzKf82hpjoIMS6AkI8GIc1IryEFiTyhp0xghO2gdBpUjXZAHJN
	bAKvuB8v/bwhIVWlX53WnIM6Ptc8vnrSbW/h9AiWFhmwUVYcpPMXWjK6FTf08AA==
X-Received: by 2002:a05:6a00:4104:b0:82c:e9cc:f62f with SMTP id d2e1a72fcca58-82f8c82eab4mr13757359b3a.7.1776699830595;
        Mon, 20 Apr 2026 08:43:50 -0700 (PDT)
X-Received: by 2002:a05:6a00:4104:b0:82c:e9cc:f62f with SMTP id d2e1a72fcca58-82f8c82eab4mr13757329b3a.7.1776699830064;
        Mon, 20 Apr 2026 08:43:50 -0700 (PDT)
Received: from hu-kamalw-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f8e9cbb28sm10533230b3a.13.2026.04.20.08.43.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Apr 2026 08:43:49 -0700 (PDT)
From: Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
Date: Mon, 20 Apr 2026 21:13:38 +0530
Subject: [PATCH v4 1/4] soc: qcom: rpmh: Add support to read back resource
 settings
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260420-read-rpmh-v3-v4-1-70c152e6c958@oss.qualcomm.com>
References: <20260420-read-rpmh-v3-v4-0-70c152e6c958@oss.qualcomm.com>
In-Reply-To: <20260420-read-rpmh-v3-v4-0-70c152e6c958@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Vinod Koul <vkoul@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Maulik Shah <maulik.shah@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1776699822; l=7742;
 i=kamal.wadhwa@oss.qualcomm.com; s=20260406; h=from:subject:message-id;
 bh=fRLcFvxj66tpmAimv/ORz07g8Vv0sri2zroUI4okZes=;
 b=Xx92N3VspKFLJzgH0CnIJfJPFgOrpt2mCtj8Qa7ZI4Uh5ODlSqcp733FDnT2QDATTqXb4omQb
 zbOzcfvq7JMAbhPgHhVM4qLidBeSmmmON+VDLySHJ89xuhNWmxL6110
X-Developer-Key: i=kamal.wadhwa@oss.qualcomm.com; a=ed25519;
 pk=ylH1NxUZkBpYsmww89g6zVxpS0q8qthtzcORkYxn/Ag=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIwMDE1MiBTYWx0ZWRfX3+Ezcshh9qVK
 DtiVJ8byYJPCwZ9/6EgNTnucGug6t83NQ/kOCR5sczVSbK5//lWcGtnYHAStt4Pfe8I1pBW+3Ov
 WepHtAvi1rHQZtL+Ucoyz0TkPPn4MgOmyme+EZvqp6EI8JFu5stFW99WWEyorkGUES1gjw/cgMu
 JOkhi04oP9WhpjQSxFvkcJkNvHtabJCFk8YvDlPuQ1NYabPajKT0AoA5rFBTE1EnyRmawGoelsP
 7KLVnwjvJzKdcNPPyxbroqXjO4jU9O74eGJmH17AbkuIYAopOEG6evWwl5y3oPzljVyVbyTIuMJ
 echkgvqtdt5ZXXEA9tXFcjvVubVls4BwuvhkmxZ7hexjeFgv44E/Qpe8yUhquscM+Rmet6Jdk3Y
 mcUtckPu54YrtJ+3u4KCzbjMf0umXT4QGDTggfYzmZOHPoP3uOG/r/PCHT8WdF9oNwEGEOxKAeO
 2dSfocNY2T9PkT/v6Dg==
X-Proofpoint-GUID: FOeLIN31xlhl6OXxucIJ_y9PZ3RRvP7T
X-Authority-Analysis: v=2.4 cv=PMQ/P/qC c=1 sm=1 tr=0 ts=69e649b7 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=RgaPuue0vXMEEcOqpiYA:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-ORIG-GUID: FOeLIN31xlhl6OXxucIJ_y9PZ3RRvP7T
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-20_03,2026-04-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 impostorscore=0 adultscore=0 lowpriorityscore=0
 suspectscore=0 priorityscore=1501 clxscore=1015 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604200152
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_FROM(0.00)[bounces-103802-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kamal.wadhwa@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 46967430E1E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Maulik Shah <maulik.shah@oss.qualcomm.com>

All rpmh_*() APIs so far have supported placing votes for various resource
settings but the H/W also have option to read resource settings.

Add new rpmh_read() API to allow clients to read back resource setting
from H/W. This will be useful for clients like regulators, which currently
don't have a way to know the settings applied during bootloader stage.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>
Signed-off-by: Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
---
 drivers/soc/qcom/rpmh-rsc.c | 13 +++++++++++--
 drivers/soc/qcom/rpmh.c     | 47 +++++++++++++++++++++++++++++++++++++++++----
 include/soc/qcom/rpmh.h     |  5 +++++
 include/soc/qcom/tcs.h      |  2 ++
 4 files changed, 61 insertions(+), 6 deletions(-)

diff --git a/drivers/soc/qcom/rpmh-rsc.c b/drivers/soc/qcom/rpmh-rsc.c
index c6f7d5c9c493d9e06c048930b8a14a38660df4b1..ec85c457ea4527f94339c2033bfcc12346e3c443 100644
--- a/drivers/soc/qcom/rpmh-rsc.c
+++ b/drivers/soc/qcom/rpmh-rsc.c
@@ -443,6 +443,7 @@ static irqreturn_t tcs_tx_done(int irq, void *p)
 	int i;
 	unsigned long irq_status;
 	const struct tcs_request *req;
+	u32 reg;
 
 	irq_status = readl_relaxed(drv->tcs_base + drv->regs[RSC_DRV_IRQ_STATUS]);
 
@@ -453,6 +454,11 @@ static irqreturn_t tcs_tx_done(int irq, void *p)
 
 		trace_rpmh_tx_done(drv, i, req);
 
+		if (req->is_read) {
+			reg = drv->regs[RSC_DRV_CMD_RESP_DATA];
+			req->cmds[0].data = read_tcs_reg(drv, reg, i);
+		}
+
 		/* Clear AMC trigger & enable modes and
 		 * disable interrupt for this TCS
 		 */
@@ -493,13 +499,15 @@ static void __tcs_buffer_write(struct rsc_drv *drv, int tcs_id, int cmd_id,
 			       const struct tcs_request *msg)
 {
 	u32 msgid;
-	u32 cmd_msgid = CMD_MSGID_LEN | CMD_MSGID_WRITE;
+	u32 cmd_msgid = CMD_MSGID_LEN;
 	u32 cmd_enable = 0;
 	struct tcs_cmd *cmd;
 	int i, j;
 
 	/* Convert all commands to RR when the request has wait_for_compl set */
 	cmd_msgid |= msg->wait_for_compl ? CMD_MSGID_RESP_REQ : 0;
+	if (!msg->is_read)
+		cmd_msgid |= CMD_MSGID_WRITE;
 
 	for (i = 0, j = cmd_id; i < msg->num_cmds; i++, j++) {
 		cmd = &msg->cmds[i];
@@ -513,7 +521,8 @@ static void __tcs_buffer_write(struct rsc_drv *drv, int tcs_id, int cmd_id,
 
 		write_tcs_cmd(drv, drv->regs[RSC_DRV_CMD_MSGID], tcs_id, j, msgid);
 		write_tcs_cmd(drv, drv->regs[RSC_DRV_CMD_ADDR], tcs_id, j, cmd->addr);
-		write_tcs_cmd(drv, drv->regs[RSC_DRV_CMD_DATA], tcs_id, j, cmd->data);
+		if (!msg->is_read)
+			write_tcs_cmd(drv, drv->regs[RSC_DRV_CMD_DATA], tcs_id, j, cmd->data);
 		trace_rpmh_send_msg(drv, tcs_id, msg->state, j, msgid, cmd);
 	}
 
diff --git a/drivers/soc/qcom/rpmh.c b/drivers/soc/qcom/rpmh.c
index ca37da3dc2b148c76e50e25885bd85a0cb47c9b6..f881c4c757ec8302b09eabf2f18bc79941a6f2c5 100644
--- a/drivers/soc/qcom/rpmh.c
+++ b/drivers/soc/qcom/rpmh.c
@@ -175,6 +175,9 @@ static int __rpmh_write(const struct device *dev, enum rpmh_state state,
 	struct cache_req *req;
 	int i;
 
+	if (rpm_msg->msg.is_read)
+		goto send_data;
+
 	/* Cache the request in our store and link the payload */
 	for (i = 0; i < rpm_msg->msg.num_cmds; i++) {
 		req = cache_rpm_request(ctrlr, state, &rpm_msg->msg.cmds[i]);
@@ -182,6 +185,7 @@ static int __rpmh_write(const struct device *dev, enum rpmh_state state,
 			return PTR_ERR(req);
 	}
 
+send_data:
 	if (state == RPMH_ACTIVE_ONLY_STATE) {
 		ret = rpmh_rsc_send_data(ctrlr_to_drv(ctrlr), &rpm_msg->msg);
 	} else {
@@ -194,7 +198,7 @@ static int __rpmh_write(const struct device *dev, enum rpmh_state state,
 }
 
 static int __fill_rpmh_msg(struct rpmh_request *req, enum rpmh_state state,
-		const struct tcs_cmd *cmd, u32 n)
+		const struct tcs_cmd *cmd, u32 n, bool is_read)
 {
 	if (!cmd || !n || n > MAX_RPMH_PAYLOAD)
 		return -EINVAL;
@@ -204,10 +208,45 @@ static int __fill_rpmh_msg(struct rpmh_request *req, enum rpmh_state state,
 	req->msg.state = state;
 	req->msg.cmds = req->cmd;
 	req->msg.num_cmds = n;
+	req->msg.is_read = is_read;
 
 	return 0;
 }
 
+/**
+ * rpmh_read: Read a resource value
+ *
+ * @dev: The device making the request
+ * @cmd: The payload having address of resource to read
+ *
+ * Reads the value for the resource address given in tcs_cmd->addr
+ * and returns the tcs_cmd->data filled with same.
+ *
+ * Context: May sleep. Do not call from atomic contexts.
+ *
+ * Return: 0 on success, negative errno on failure
+ */
+int rpmh_read(const struct device *dev, struct tcs_cmd *cmd)
+{
+	DECLARE_COMPLETION_ONSTACK(compl);
+	DEFINE_RPMH_MSG_ONSTACK(dev, RPMH_ACTIVE_ONLY_STATE, &compl, rpm_msg);
+	int ret;
+
+	ret = __fill_rpmh_msg(&rpm_msg, RPMH_ACTIVE_ONLY_STATE, cmd, 1, true);
+	if (ret)
+		return ret;
+
+	ret = __rpmh_write(dev, RPMH_ACTIVE_ONLY_STATE, &rpm_msg);
+	if (ret)
+		return ret;
+
+	ret = wait_for_completion_timeout(&compl, RPMH_TIMEOUT_MS);
+	cmd[0].data = rpm_msg.cmd[0].data;
+
+	return (ret > 0) ? 0 : -ETIMEDOUT;
+}
+EXPORT_SYMBOL_GPL(rpmh_read);
+
 /**
  * rpmh_write_async: Write a set of RPMH commands
  *
@@ -230,7 +269,7 @@ int rpmh_write_async(const struct device *dev, enum rpmh_state state,
 		return -ENOMEM;
 	rpm_msg->needs_free = true;
 
-	ret = __fill_rpmh_msg(rpm_msg, state, cmd, n);
+	ret = __fill_rpmh_msg(rpm_msg, state, cmd, n, false);
 	if (ret) {
 		kfree(rpm_msg);
 		return ret;
@@ -257,7 +296,7 @@ int rpmh_write(const struct device *dev, enum rpmh_state state,
 	DEFINE_RPMH_MSG_ONSTACK(dev, state, &compl, rpm_msg);
 	int ret;
 
-	ret = __fill_rpmh_msg(&rpm_msg, state, cmd, n);
+	ret = __fill_rpmh_msg(&rpm_msg, state, cmd, n, false);
 	if (ret)
 		return ret;
 
@@ -352,7 +391,7 @@ int rpmh_write_batch(const struct device *dev, enum rpmh_state state,
 	rpm_msgs = req->rpm_msgs;
 
 	for (i = 0; i < count; i++) {
-		__fill_rpmh_msg(rpm_msgs + i, state, cmd, n[i]);
+		__fill_rpmh_msg(rpm_msgs + i, state, cmd, n[i], false);
 		cmd += n[i];
 	}
 
diff --git a/include/soc/qcom/rpmh.h b/include/soc/qcom/rpmh.h
index bdbee1a97d3685d8a6153d586ddf650bd3bd3dde..14ecbf242b6bd67c8167c176ed0970f42432f4f4 100644
--- a/include/soc/qcom/rpmh.h
+++ b/include/soc/qcom/rpmh.h
@@ -11,6 +11,8 @@
 
 
 #if IS_ENABLED(CONFIG_QCOM_RPMH)
+int rpmh_read(const struct device *dev, struct tcs_cmd *cmd);
+
 int rpmh_write(const struct device *dev, enum rpmh_state state,
 	       const struct tcs_cmd *cmd, u32 n);
 
@@ -24,6 +26,9 @@ void rpmh_invalidate(const struct device *dev);
 
 #else
 
+static inline int rpmh_read(const struct device *dev, struct tcs_cmd *cmd)
+{ return -ENODEV; }
+
 static inline int rpmh_write(const struct device *dev, enum rpmh_state state,
 			     const struct tcs_cmd *cmd, u32 n)
 { return -ENODEV; }
diff --git a/include/soc/qcom/tcs.h b/include/soc/qcom/tcs.h
index cff67ce25488e2d3603a7707af2ca77f8266a713..45b8513be2f9bb0957796476f6031146ee34e931 100644
--- a/include/soc/qcom/tcs.h
+++ b/include/soc/qcom/tcs.h
@@ -51,6 +51,7 @@ struct tcs_cmd {
  * struct tcs_request: A set of tcs_cmds sent together in a TCS
  *
  * @state:          state for the request.
+ * @is_read:        set for read only requests
  * @wait_for_compl: wait until we get a response from the h/w accelerator
  *                  (same as setting cmd->wait for all commands in the request)
  * @num_cmds:       the number of @cmds in this request
@@ -58,6 +59,7 @@ struct tcs_cmd {
  */
 struct tcs_request {
 	enum rpmh_state state;
+	bool is_read;
 	u32 wait_for_compl;
 	u32 num_cmds;
 	struct tcs_cmd *cmds;

-- 
2.25.1


