Return-Path: <linux-arm-msm+bounces-102016-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kGINMrEw1GmUsAcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102016-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Apr 2026 00:16:17 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6981E3A7CB9
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Apr 2026 00:16:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 73AC1305F3D5
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Apr 2026 22:15:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4D2C239D6FF;
	Mon,  6 Apr 2026 22:15:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="o1++lzw7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GJYWzSQS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDF0E39E192
	for <linux-arm-msm@vger.kernel.org>; Mon,  6 Apr 2026 22:15:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775513726; cv=none; b=SC+JiJZBLI8vGa8uhX2xG1yKQAIfN6T6nb+p39gp1+052VPjl0yJLde2rBq6VxZ+X3CtmV5vgoSPa5HVbSdzk9xkcmkx2QY74aLb2KpDYqLdZAimn45SmvcetcnyGoC+7KXCYIovMugsQ9svGkcnz3opqWw86yYxdBHF7uOT9TY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775513726; c=relaxed/simple;
	bh=21UOHw2FDKEN+NQXLQB0bKtW8K7sDULKYSr/W26DbLE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=J09AFsyaOMbsjqOTUYW9tEHMtuUbIF0RGYF0J4CmfvXeKTK2KEn3ksWWPROP8mgAbB/oNtajHebfMMccTxet1QmqH4udvbZZekB6FWIyWmBttKRF0fzo7tVjOvslRqVMr1LET2EW+QsdLNA8rCjg6X+edohLsxgpb3nGqyA+1K8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=o1++lzw7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GJYWzSQS; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 636LTKlZ2329704
	for <linux-arm-msm@vger.kernel.org>; Mon, 6 Apr 2026 22:15:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	d5wQ0jNKwTs0v9LfGYmAGw0dotNG//GXL5JPO5LvjF8=; b=o1++lzw72G68uDO3
	HYLJp1ahuyJI48XkOx7k8w2vA4NdpGbRsO2aWKB6vbIemDGzuzZs0LABVE6Mia/G
	ozBd7ienFDrcoQNRnhbl1yejtg+uY4kNxZhPwlnj3RiUozoB3s7yuC2D6xpFCNBC
	6s/z/x6wb0bcb1Tvfw0+4eFpTSMzxhOoXw5RMisvLDaaqNzZum2E6ol7FKlhOCeh
	yonZcVQ4z18WocZJyK4JNGQdN8kCWoZoLFtT4+WtQ/cG3+o/qV5LCoVaYS/hhuHd
	KSXi3AhEO/xacjrspKbuBxkDT4vIQjJ4YQlVFAooyzZtnwH4sEW8iKiNr60InRh8
	Y2mQiw==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dcms4r39b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 06 Apr 2026 22:15:23 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-35dacc40f92so3925366a91.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Apr 2026 15:15:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775513723; x=1776118523; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=d5wQ0jNKwTs0v9LfGYmAGw0dotNG//GXL5JPO5LvjF8=;
        b=GJYWzSQSiL1+TBs4aDJ2lh2yh87up3+XRFbFM+qWu+n7BqtgTKQqAVfevlH1GOt4N7
         UqHvP8CDrSdNhwLD2o+Bt8xF8L7+OzpYdjcqGupTWtxjPNF7AKDdjdCTklQgbRZzOAXR
         eluW4Ov3ICBSLj68xyeRpUI05pOWkoHS6wHt/mR8A5Y/SeI0IQ1lRk6IZr/gojrT2RVD
         gbxS1voN/qX2hZYC8VWOtsCWFIvlROLkA/PDs5GyjHX8qEUzpxEdwfIXRbTO1MletSHq
         pKFOPykEHRC4FL6oqxpiUpUfHIQzI0oyqoMv3iArV+86g/Xt088Wtrmm3qvLM1pEUcwU
         LMhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775513723; x=1776118523;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=d5wQ0jNKwTs0v9LfGYmAGw0dotNG//GXL5JPO5LvjF8=;
        b=gNIOnNItS/8+hwFO65dKtsNCEaKzSJDXxNQHTj1CMu6Cct9G4ut5dQNGUKo3HjwHKB
         O1xo0d7s38W6IMdjbpRhdqNX7TNPK8oeC9KQICRpCBpRKt8sbKjmrNOiginK35D/Dupf
         D8hPxUz1Qc/L9JgFoEKLrjNdubX2aNBZZ+mtjgNOFc9COWLzI7b4O/cV5EzgT0Qex5gi
         3fM3MLoRV1l6jm3bROuUsoXrvEdN/nX4Oq6UISPv6WUBITDiSODLAJI8s5GwrkIe6sxU
         og+LmRPlKPVr7S8106csYfZSSpFLyjF/JJ4vZtuAgEgcJWRdJJXz7CDxrKpWuld/9PKT
         t/JA==
X-Gm-Message-State: AOJu0YwCzALW3iaxzWek6Q57W8exBa8DLDv8Fm97jx8lKv7n972mUMxu
	yhPSm0ZCYC86melKaBXwFf+aT5bhq7cjYRZZ2d8ANxdWrpKQuyItr6RnHJzTOngN5WOzdI+8k4L
	v7s7J70wu2eEn7Fh1SWfWYN8tZpfjN4/uwmI/p6xxreqI/5AULC7oaaYzQnYPap29dsHB
X-Gm-Gg: AeBDietEiEhdRI1qeB6JM5nPvPXrNOB7EQCqaNE0ml7IaTzNjjaU7L4BZyoQdTqEvy0
	/ojGyaT1r1UPRFrtjKiDLX86HoQJUNwxb6PGinCrsI+AQoTPLoqD1fl/DJUZMAQrip56ncL6zx4
	or+4bGK9nRx+B7qxHadVCVhz28Pyyk/wHWOLOGcBBq+VVheovxMpA1yq94+Y+D1OD42SLj8bjiC
	TWHBsw8N4vXf1b21JnqQmAjVz1DInQDQ0CX/YhNC9Wyv0fPk5C39mliw1vJev5PO6TsfW5md08T
	04K1znLIF2IoPLvHbMM9c4o0NwD+TyxUStfzum8enyEXr6x2xE+2/OPskdZdU6zyba1UJwFBFxi
	QZgJ8QZP7P2zs/2prxc3YbpHlmNV0JveaePEVJNgSIbfqfqxZzC0=
X-Received: by 2002:a17:90a:d40e:b0:359:f77f:8cff with SMTP id 98e67ed59e1d1-35de6970c7emr12184961a91.19.1775513722611;
        Mon, 06 Apr 2026 15:15:22 -0700 (PDT)
X-Received: by 2002:a17:90a:d40e:b0:359:f77f:8cff with SMTP id 98e67ed59e1d1-35de6970c7emr12184926a91.19.1775513721958;
        Mon, 06 Apr 2026 15:15:21 -0700 (PDT)
Received: from hu-kamalw-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35dd35e34f9sm14447519a91.1.2026.04.06.15.15.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Apr 2026 15:15:21 -0700 (PDT)
From: Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
Date: Tue, 07 Apr 2026 03:44:58 +0530
Subject: [PATCH 1/4] soc: qcom: rpmh: Add support to read back resource
 settings
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260407-read-rpmh-v3-v1-1-27db2a56b13e@oss.qualcomm.com>
References: <20260407-read-rpmh-v3-v1-0-27db2a56b13e@oss.qualcomm.com>
In-Reply-To: <20260407-read-rpmh-v3-v1-0-27db2a56b13e@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Vinod Koul <vkoul@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Maulik Shah <maulik.shah@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775513714; l=7614;
 i=kamal.wadhwa@oss.qualcomm.com; s=20260406; h=from:subject:message-id;
 bh=qzVzmZ1EREIjmG4dbbMdDRDlit/vRooP9sfacElO0es=;
 b=i3b2AcSmi/+j3y2qYBjomppAZtlEYSIGmbqnFT9mVeoiJYiFSUBorTqLior2xaxA4km3ILRut
 0qTp3SAUhgEBt0kNkZ5aHzjGR4Pf3FtjiVIbNbDgaR2WxCWKZ1/7dLw
X-Developer-Key: i=kamal.wadhwa@oss.qualcomm.com; a=ed25519;
 pk=ylH1NxUZkBpYsmww89g6zVxpS0q8qthtzcORkYxn/Ag=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA2MDIxOSBTYWx0ZWRfX2Rzoi3IdCY4j
 L7GzH9M5l04yTGDknGLrayaG3GN5ISC0kKC+TCOzbJZ+K68GBbdp5EPUGtrMlucbWpPSnSP1yN+
 YBRyRPtXBdIGjYiHpEHBc1LaIVY54ZdbqYla5mawSUT+gPJXxZNTsYxVxiXlZGh3H+38zx1rMbQ
 pHdHBeNWUmhe7MMW4xXRlprc3gRseSmwBoW5OhA23fOeHKsfVufFABYoa9upfglXpRFa1UjFzXB
 biVDKN1PUHT2jWcNJShfFx7EoVD/Tik5tvw7u3bQsfOYWIZ6Al4OuK4t7C6PvLTmNkZsZ3+8Cub
 Z2CGkh4ggytNt/gBtKniCLOihNvMucnPuqgK60dHt3G4wVMo73PJPHXOA0MzoMyoOX5pKLHQLNi
 /9D8tz9k5RaGiS6kjtm3yF2wXIB7XnAqv+sMBnEXlCyLPF8ocb0maTOvax8iH2lYexy+MkU7irX
 BFRSHwiQ0nWw83Ur01A==
X-Proofpoint-ORIG-GUID: XENu96_VGNiQ9avBJI7xs09qBtwdpyME
X-Authority-Analysis: v=2.4 cv=WNZPmHsR c=1 sm=1 tr=0 ts=69d4307b cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=RgaPuue0vXMEEcOqpiYA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-GUID: XENu96_VGNiQ9avBJI7xs09qBtwdpyME
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-06_04,2026-04-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 phishscore=0 spamscore=0 impostorscore=0
 lowpriorityscore=0 suspectscore=0 clxscore=1015 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604060219
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-102016-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kamal.wadhwa@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 6981E3A7CB9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Maulik Shah <maulik.shah@oss.qualcomm.com>

All rpmh_*() APIs so far have supported placing votes for various resource
settings but the H/W also have option to read resource settings.

Add new rpmh_read() API to allow clients to read back resource setting
from H/W. This will be useful for clients like regulators, which currently
don't have a way to know the settings applied during bootloader stage.

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


