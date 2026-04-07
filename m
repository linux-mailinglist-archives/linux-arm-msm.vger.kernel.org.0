Return-Path: <linux-arm-msm+bounces-102050-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YO4JL4aL1GmjvAcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102050-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Apr 2026 06:43:50 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 53BF63A9B9D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Apr 2026 06:43:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 7371930059B4
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Apr 2026 04:43:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4B17633A032;
	Tue,  7 Apr 2026 04:43:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hfPczcsi";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jowAfdip"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2B923385A7
	for <linux-arm-msm@vger.kernel.org>; Tue,  7 Apr 2026 04:43:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775537024; cv=none; b=mJr8ei6IiN5PjwV3DlLiUthFLk+UDHQrznq9FbBizKqghO8OrULIrgQK5IIUUb50EILNZMaFOifdOpRBgeOZgz1kKW1gR+cgKBUBE2vz6iCaL1RRD94WAz0AWfnOfegeXNNs8emhMJZZyw4HTJwzomQigeiCRdAPI2CNClR1cfs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775537024; c=relaxed/simple;
	bh=21UOHw2FDKEN+NQXLQB0bKtW8K7sDULKYSr/W26DbLE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=T/5jZ1DZ6BsgN+44Rse1ctvW7Mjmq9UKZ5oZQKge2xzKpBwRg2lCVjEeUWk72A8DEUBsxxfmrdiOybHA1jxb77r0ZonbxELTdtvh4b80VWEgs36tNXcltW+fF+3e81MsIJAqjBRKPTxfUSpU6Gh0uE/fIRqcjlKZHbbRD9I932g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hfPczcsi; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jowAfdip; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 636LQA4S3536852
	for <linux-arm-msm@vger.kernel.org>; Tue, 7 Apr 2026 04:43:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	d5wQ0jNKwTs0v9LfGYmAGw0dotNG//GXL5JPO5LvjF8=; b=hfPczcsii5WvHWyv
	PWiuGHCddGYuIXk6ktNy1zkkPkvPIEQRExsRZ4v8GiYOs5HP6eo+sjFQC7Fpcq6e
	uE0hTBjrD+8FD9h2DNYuTofND7BQanygv/rmDlHPIPOuPNOLfkNp/XE3oZ3fpBbw
	QImxC7OSEVyT4Y/6zNMITV3jJrnaY8Vq5cbr+0jcn/QFgrHX4Oakgg+6S3Q0T0Pi
	Qeioadww608jctcYOioy3YV+23GxR7EfsPpKmFR0vbh6+fSeeMJwG4av9V+sDT1m
	wtObmh/7bOi06y4BfIDmvRlnmzuOsuv/7hnG+k7G6Q/D7aAFo+CrC7uklMlxNvxg
	sRMKCw==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dcmra11s8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 07 Apr 2026 04:43:41 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-82ce0a9e125so2778158b3a.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Apr 2026 21:43:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775537021; x=1776141821; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=d5wQ0jNKwTs0v9LfGYmAGw0dotNG//GXL5JPO5LvjF8=;
        b=jowAfdipQuG+LDHDJfgMBtJPp4Z6AQDTiB+jLvtJ+JB+EbQTVwQM5NEvtWLd4QvOao
         8WsNzHsxiD0VfbvRVt+e1XdnerTCIB62yAePD143huF3o+JSLA4NG1KXkeBOM8CE37p3
         gT7rgEX0pBsE7vliT8jN+NNVclbMHK3qGvw9sB2kzt0LjUQgwkL2MdgXnlpuuaE8TrXG
         C6m5htgHedhMPSXV0zyAYyu76ADvPScdesmXOUCq4K15kETffwd9KntxXQbIjcOj888i
         g6oAOW3maVXW74klrIDCePoSL/86AnccljhKpmXPO+rHr8hteCxT40w2OoVFQ4oKFQ93
         OORg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775537021; x=1776141821;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=d5wQ0jNKwTs0v9LfGYmAGw0dotNG//GXL5JPO5LvjF8=;
        b=YHXdnpyux+USJECAdnJv4fvof6QlmSI6M7BvF3Zy9l2595Ps76g9ZskLreGkPyRw11
         I3S7KCas5PpfyRK7GcuuT9d7WUfKnMwYSyTA3AMS1mXl26dpjSF16C/gK4BV5GQpD9Hj
         DglZH8ljagosG8gJiQGFf3XlSJBBKrrZJgTL4lKqopthfBhZQGmzjIpjwKBKG8yTNEp1
         yBhSWWJ2d7kPaBxbRDw2iHzQzSXG+g9fZ8oXZ/X8ManeUoGbMaX4mkQrJ9rxAnbCPS38
         kLBI5tRdlYAbPb4Uwl5EIDnz0GfhU1hyjS7dgZY7Q4OAwWXM4tp0QMbfwnl8CHfHGCxj
         nFcg==
X-Gm-Message-State: AOJu0Yy15KQRWWSg2fbqavO5TUN+ibXQLAR2UOA8VSe26SRjN3pDSV1U
	E3JxE0yYFKRLN5Uj0eS1mz65/fti3dtlivUH9Y+P/KsmSK1P4826zIhQUnhTo94MT7H6A2VuHB+
	X0DY6YOKmDX7oHUs1fDoY6yrWwrmvZ4T1GWcQts82AwIxg32DtG71n3ux3cAnwT82RbWN
X-Gm-Gg: AeBDievjHoACIIDed7gxqYzutr/cP8VN/DM+HfWpO+FM0h/1jlovX5VPcPb9MvQ+gpj
	9oy/JVAaB7XvGBinvqNQhXVguhJktcZHp+T4DtLKUKQrcJiony3/JBuZwLraBerx2NmpIkyYe2L
	nQlFOEDr8zq339rGLRXxL6sSd2Xin0qZ7Bw7pGZ5YPdLqRJT3nAbcQxiGvrEWoul9Vqtj08dgOK
	Nm1l+8S/09EAyZY73Mj/optl2kPjejTTRJBSC/q/SfjD3geGDF/jNb3sN0r6ht0yGA6foMa3AW8
	aJWkkstkMoxAF0CISrlO7u/RAHZEI+WZ8kur8Tkn1Sdkg/sqamRpaFVIHiPOo7b16NxPMosUQ5b
	PJnGqocCVk40hiU5ZcCLDNU8c2P0klDOW+RwH5TyFh+PdfzgrU3w=
X-Received: by 2002:a05:6a00:1ad3:b0:82c:e5d0:5248 with SMTP id d2e1a72fcca58-82d0db53f0bmr13749223b3a.31.1775537021116;
        Mon, 06 Apr 2026 21:43:41 -0700 (PDT)
X-Received: by 2002:a05:6a00:1ad3:b0:82c:e5d0:5248 with SMTP id d2e1a72fcca58-82d0db53f0bmr13749163b3a.31.1775537020564;
        Mon, 06 Apr 2026 21:43:40 -0700 (PDT)
Received: from hu-kamalw-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82cf9c6ba2fsm16123299b3a.45.2026.04.06.21.43.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Apr 2026 21:43:40 -0700 (PDT)
From: Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
Date: Tue, 07 Apr 2026 10:13:29 +0530
Subject: [PATCH v3 1/4] soc: qcom: rpmh: Add support to read back resource
 settings
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260407-read-rpmh-v3-v3-1-34079f92691c@oss.qualcomm.com>
References: <20260407-read-rpmh-v3-v3-0-34079f92691c@oss.qualcomm.com>
In-Reply-To: <20260407-read-rpmh-v3-v3-0-34079f92691c@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Vinod Koul <vkoul@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Maulik Shah <maulik.shah@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775537013; l=7614;
 i=kamal.wadhwa@oss.qualcomm.com; s=20260406; h=from:subject:message-id;
 bh=qzVzmZ1EREIjmG4dbbMdDRDlit/vRooP9sfacElO0es=;
 b=dFnOPxqzhhYosJSn5DWzT4XFlXVQAoN2NTL939crRAQNdb4MQXntN+npmi3NhxKgioOOKk0Xv
 WgKfp1r2Dr0DImguPY5BNSc0gxwiceV18pkjfPPfNNu0fgmkQUA+DTa
X-Developer-Key: i=kamal.wadhwa@oss.qualcomm.com; a=ed25519;
 pk=ylH1NxUZkBpYsmww89g6zVxpS0q8qthtzcORkYxn/Ag=
X-Proofpoint-ORIG-GUID: dGM8Ug1eWU9EoCgPMXjCkAPnmeygjcFB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA3MDA0MSBTYWx0ZWRfX4duCAFJm3BOl
 //fPw4PxczEcd1/wsw9Z72rpE4X5i0cDRdhtHFse4KTobwraztIvPBsd/zwv9oBJBQybQE05Tqx
 q8gHVbi4rGf0YAchgojc2c2oibbS2c2LeFNPb7LY0P3MMHFoBxZNgMUEoV7nzLj1cBe4sPrH2Rx
 klCrYaJfJXu7hLAqMGqk11kwjCwavnD2xHTTOPh7Azc2KE70YFTkBB8ZPdlLIj37EKc/HVppuqr
 6eO8mQGKE5QYhaSqGfLkkAUb8r6uUrw2XDhhOcEGHZavtAvw+l2Zfqec03CUVnUJ9WFWcIsd6QZ
 QiP60SMxDQkhGO87s637WzkwLXZepzQVhzOVn2WrCyD7QOvej6KFyN+WrwwL4GdZpUo/Ag1Y3D7
 z+dHWrEMf2ZYDDDSzfNL1xqvCF9yyPfusV+gNOvUZJcbb8kwZi2DS56DjAnWVilb8f8iiTUHqT1
 gV897tWUR7PM7iB3Dtg==
X-Authority-Analysis: v=2.4 cv=BKGDalQG c=1 sm=1 tr=0 ts=69d48b7d cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=RgaPuue0vXMEEcOqpiYA:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-GUID: dGM8Ug1eWU9EoCgPMXjCkAPnmeygjcFB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-07_02,2026-04-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 clxscore=1015 bulkscore=0 suspectscore=0
 spamscore=0 impostorscore=0 malwarescore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604070041
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_FROM(0.00)[bounces-102050-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns];
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
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 53BF63A9B9D
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


