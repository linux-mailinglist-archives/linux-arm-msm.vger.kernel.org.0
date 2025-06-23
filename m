Return-Path: <linux-arm-msm+bounces-62108-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D31BAE4B64
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Jun 2025 18:50:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1E846188A0AD
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Jun 2025 16:44:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 338B726D4ED;
	Mon, 23 Jun 2025 16:44:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gpmoWZTr"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7679429C328
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Jun 2025 16:43:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750697040; cv=none; b=WAy+KuhZvgNKpmVGy7wJWgxLmq06nqf899w0v+A1c9f/sj9Rf0MLhqSuCowFIbZvZcVqnsHFE3VSH79vIJGeZ/ZYMQvC65jtKFnmp9gjzxq5MAsE9EnRVOkSMo43MCHRMvH9tHgSMsFELVsdQBepgmPVErt8UY5Z8l7DGSFUtHo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750697040; c=relaxed/simple;
	bh=YZUBtdMrOu9oRJYltUtsuCHLn65wM+oMi2tnyHqk1ck=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jzzORiZQkpQ4dGeZZaJy3HmfLxxvLKiN/gUzpB7jT8D0fPg+heoEsDXnJ9IGJFAWWm5NxV9ab3Gob0jJ/g6yYflglvGlkQ2Dtj+bArNLaWJTxkPyEJ3pleQTG/zvPotKk6FqnWvA2zQzhXZnCk+91+3HY7+qp90XXDMw2+t3lMk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gpmoWZTr; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55N97SFf024850
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Jun 2025 16:43:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6Gp4KTM2ss1gIVnakPLCD9UpvQd1HhAAfpFPPwxXMtE=; b=gpmoWZTrzmcKuE+y
	Mv57i6/4TSXgcB2+QO8AuIsOHKAvVeMh4F7ZYmyEToJJxXvi7UOXFuQBOfgfmJhz
	JTb2jEULvdu5tZrCkyiY9tBf0yCi55wKb4lATKYsz3qYQM0EZ1HEb6EsvZpUy9n6
	KTwXImi5jZKSoOzax76TtSX13iyYb6Pkc2h6sORwtOe/dCNfpu4/dpMtuf+La4I6
	BneQFkYtrQ7QrXf/gYP4zUIUFICQ1N/t8VFBBl2k2hBn1RadyYUulwLsZs2BWgAd
	8+jlAcKSiZgFKU5CL2c4ocva9oOMKfdiT3qtYETy+DNlZ1b/vJQ1FnqGdhswz7xB
	gdnMaw==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47emcmk02n-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Jun 2025 16:43:56 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3141f9ce4e2so7033516a91.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Jun 2025 09:43:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750697035; x=1751301835;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6Gp4KTM2ss1gIVnakPLCD9UpvQd1HhAAfpFPPwxXMtE=;
        b=eue0TDCzoFGpOFizE4wyH/tVz/81IXBATwmAsP34FIyl48apVDDMd2J+ZWrZ4WeArR
         Y791VzwlmRIIjPCclowhcTIJw8sOBXDxgD3cSNdK/YLHtqvutqXFHEI50rJZN7f1lZgX
         UfwFSWSC3/UnloHUK64ekpu22Z/fRm9vkzK/rh3LCVuyRzdmII3ag/MbouYa+FMEBV2K
         WkzxGazBOyjRunxXss/EIZ32WQEhEBIwdXGs+SYLWJeXlc5doTaNwiDuuJuNjxMZXhGO
         PK32HZRTNSzimAQB5Db5FJtoch1BPmeCo5WEhyGIeDMmx4Nbns9HbOIYBeSN9OHuNKT9
         LkJg==
X-Gm-Message-State: AOJu0YxRr0HmtNIXvv+VfpEaXPDeMvWbpoNDmIp1bdFJjNgFzfU9qeO4
	ky2BS+mib23daa9m0aY0kdIkNKFpXtGJgrBvaKHO5+PobRD+eY9y9vUOillVdnpidFlwe/KurJo
	Z2NMzUUXXmX+QE5hjzxIdn4V3FYBdfEJ9JXvrLjdWxs00V5rBDF8wtN2fIzZ8WFzZToB2UcouDR
	4P
X-Gm-Gg: ASbGncvQ89QgTfwPp7NXr1Bd7+1R4YAeH8XaCP9hHMewv0xVtKzVSbj5bYKO2xa0DV6
	HAbgrYUPX9dqqHYYDH8NEiIfFfhY9U5op+mV3dkknpTknJiUjc3ZzBXuJ61EEEJ4gPyBSfUJQyZ
	emWlcyD7oG5kib9OJlkOv+9D/4svPrP492O6ixl8iXgpqfOA7gJR/KUvq/GV8JroqByhhO16g5j
	X9uWr3/qsB6nnJcd63Et1QmyLBOshYNjnMTphPv4i5GO2YbquqULcrsliok/ty5ynobDPkRTAws
	a48EGJVw+y9wcGqZ+1eE3TCF6Wc4dZRC5AuHcqdinuuOh9o99EWl
X-Received: by 2002:a17:90b:2889:b0:311:e8cc:4248 with SMTP id 98e67ed59e1d1-3159d8f7f8emr25727505a91.33.1750697035145;
        Mon, 23 Jun 2025 09:43:55 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE7X9jf+cu1c0sm4aA1WuSCQvY3/vycTn+T2aPmrvRj0ZYX3vnW7zvYC9mDTYusdSfBoC548w==
X-Received: by 2002:a17:90b:2889:b0:311:e8cc:4248 with SMTP id 98e67ed59e1d1-3159d8f7f8emr25727484a91.33.1750697034750;
        Mon, 23 Jun 2025 09:43:54 -0700 (PDT)
Received: from hu-kamalw-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3159e048346sm9271254a91.26.2025.06.23.09.43.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Jun 2025 09:43:54 -0700 (PDT)
From: Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
Date: Mon, 23 Jun 2025 22:13:40 +0530
Subject: [PATCH 1/2] soc: qcom: rpmh: Add support to read back resource
 settings
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250623-add-rpmh-read-support-v1-1-ae583d260195@oss.qualcomm.com>
References: <20250623-add-rpmh-read-support-v1-0-ae583d260195@oss.qualcomm.com>
In-Reply-To: <20250623-add-rpmh-read-support-v1-0-ae583d260195@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Maulik Shah <maulik.shah@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1750697028; l=7829;
 i=kamal.wadhwa@oss.qualcomm.com; s=20241018; h=from:subject:message-id;
 bh=Deo7CKV42V7f0kQwaNWmGiavoI3ZoT4v46mr2+YU2yo=;
 b=a4sojfD84Lo46zdhKgpPLd3fwsOR3V/ye/0R4FY+vXkRE2NnV9waoeetz6o5Teakcc95Seq+I
 YAWHwR+8BQdB7WSzG5eHXVdbehEjDeZDR1V0jEPalAX6YHPBvflsf0k
X-Developer-Key: i=kamal.wadhwa@oss.qualcomm.com; a=ed25519;
 pk=XbPE6DM5/mJi2tsiYwMCJCZ4O5XPMqColJRlGVcM7Hs=
X-Proofpoint-GUID: ZPTJvKNCIYqrKO8uuoMcZEq4keam6VSA
X-Proofpoint-ORIG-GUID: ZPTJvKNCIYqrKO8uuoMcZEq4keam6VSA
X-Authority-Analysis: v=2.4 cv=J+eq7BnS c=1 sm=1 tr=0 ts=6859844c cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=J08J-H9Ko50usCvt6EIA:9
 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjIzMDEwMSBTYWx0ZWRfX8/znBOhDaTUr
 fhVww/eZktrLp7xUbrWdQJ4TlPEwHCwQROR1AYRsS/dzxmtzn7kJCFM/M7YWXNrjNnH0gpnvpZG
 XUvCK2C1OYOJvIdz1jLYvJlZlxONiLCZGYq+kJMK61gLdoCb7qoJCPCkEwVY9PJL9lY3goH9j+D
 LDRPQgJrAblj7aKmpsLONli2+Aaq1kAPjZV0ufBN1oO3/DoD6CxBKwmjmLwLp2wtK6DteobiBBd
 w36fZ8/OWwyW29fh9vdFrG+lT/t2elB+n8SqlrI5bnOxcRmdPyZLmjqbizfE5C1qV9AlDQ6enDt
 qgablCuWkHOkT0SegbCZQvPLqcTpX1VMgj7rMzmYX3PXR+wd/sJDUG7XuIFVbnc6zn5ZJR/ZKyN
 2v0xl+Us6FQ1Ulcq9yRddHbUyZ73yuvXdkM7gMGkWdlKk2dnyuc5dduSodtZEHXLPrAIUkyd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-23_04,2025-06-23_07,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 mlxlogscore=999 adultscore=0 impostorscore=0 clxscore=1015
 spamscore=0 malwarescore=0 phishscore=0 priorityscore=1501 suspectscore=0
 mlxscore=0 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506230101

From: Maulik Shah <maulik.shah@oss.qualcomm.com>

All rpmh_*() APIs so far have supported placing votes for various
resource settings but the H/W also have option to read resource
settings.

This change adds a new rpmh_read() API to allow clients
to read back resource setting from H/W. This will be useful for
clients like regulators, which currently don't have a way to know
the settings applied during bootloader stage.

Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>
---
 drivers/soc/qcom/rpmh-rsc.c | 12 ++++++++--
 drivers/soc/qcom/rpmh.c     | 54 +++++++++++++++++++++++++++++++++++++++++----
 include/soc/qcom/rpmh.h     |  7 ++++++
 include/soc/qcom/tcs.h      |  2 ++
 4 files changed, 69 insertions(+), 6 deletions(-)

diff --git a/drivers/soc/qcom/rpmh-rsc.c b/drivers/soc/qcom/rpmh-rsc.c
index cb82e887b51d4401edba713348eed9621622b73b..18eed2cb8d300e862991efc20be58ff7ead378ce 100644
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
 		/*
 		 * If wake tcs was re-purposed for sending active
 		 * votes, clear AMC trigger & enable modes and
@@ -496,13 +502,14 @@ static void __tcs_buffer_write(struct rsc_drv *drv, int tcs_id, int cmd_id,
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
+	cmd_msgid |= (!msg->is_read) ? CMD_MSGID_WRITE : 0;
 
 	for (i = 0, j = cmd_id; i < msg->num_cmds; i++, j++) {
 		cmd = &msg->cmds[i];
@@ -516,7 +523,8 @@ static void __tcs_buffer_write(struct rsc_drv *drv, int tcs_id, int cmd_id,
 
 		write_tcs_cmd(drv, drv->regs[RSC_DRV_CMD_MSGID], tcs_id, j, msgid);
 		write_tcs_cmd(drv, drv->regs[RSC_DRV_CMD_ADDR], tcs_id, j, cmd->addr);
-		write_tcs_cmd(drv, drv->regs[RSC_DRV_CMD_DATA], tcs_id, j, cmd->data);
+		if (!msg->is_read)
+			write_tcs_cmd(drv, drv->regs[RSC_DRV_CMD_DATA], tcs_id, j, cmd->data);
 		trace_rpmh_send_msg(drv, tcs_id, msg->state, j, msgid, cmd);
 	}
 
diff --git a/drivers/soc/qcom/rpmh.c b/drivers/soc/qcom/rpmh.c
index 8903ed956312d0a2ac7f673d86ef504947e9b119..c69f08fc76eea724f2c9933c7e25fbf671820764 100644
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
@@ -204,10 +208,52 @@ static int __fill_rpmh_msg(struct rpmh_request *req, enum rpmh_state state,
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
+ * @state: Must be Active state
+ * @cmd: The payload having address of resource to read
+ * @n: The number of elements in @cmd, must be single command
+ *
+ * Reads the value for the resource address given in tcs_cmd->addr
+ * and returns the tcs_cmd->data filled with same.
+ *
+ * May sleep. Do not call from atomic contexts.
+ *
+ * Return:
+ * * 0			- Success
+ * * -Error             - Error code
+ */
+int rpmh_read(const struct device *dev, enum rpmh_state state, struct tcs_cmd *cmd, u32 n)
+{
+	int ret;
+	DECLARE_COMPLETION_ONSTACK(compl);
+	DEFINE_RPMH_MSG_ONSTACK(dev, state, &compl, rpm_msg);
+
+	if (n != 1 || state != RPMH_ACTIVE_ONLY_STATE)
+		return -EINVAL;
+
+	ret = __fill_rpmh_msg(&rpm_msg, state, cmd, n, true);
+	if (ret)
+		return ret;
+
+	ret = __rpmh_write(dev, state, &rpm_msg);
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
@@ -230,7 +276,7 @@ int rpmh_write_async(const struct device *dev, enum rpmh_state state,
 		return -ENOMEM;
 	rpm_msg->needs_free = true;
 
-	ret = __fill_rpmh_msg(rpm_msg, state, cmd, n);
+	ret = __fill_rpmh_msg(rpm_msg, state, cmd, n, false);
 	if (ret) {
 		kfree(rpm_msg);
 		return ret;
@@ -257,7 +303,7 @@ int rpmh_write(const struct device *dev, enum rpmh_state state,
 	DEFINE_RPMH_MSG_ONSTACK(dev, state, &compl, rpm_msg);
 	int ret;
 
-	ret = __fill_rpmh_msg(&rpm_msg, state, cmd, n);
+	ret = __fill_rpmh_msg(&rpm_msg, state, cmd, n, false);
 	if (ret)
 		return ret;
 
@@ -352,7 +398,7 @@ int rpmh_write_batch(const struct device *dev, enum rpmh_state state,
 	rpm_msgs = req->rpm_msgs;
 
 	for (i = 0; i < count; i++) {
-		__fill_rpmh_msg(rpm_msgs + i, state, cmd, n[i]);
+		__fill_rpmh_msg(rpm_msgs + i, state, cmd, n[i], false);
 		cmd += n[i];
 	}
 
diff --git a/include/soc/qcom/rpmh.h b/include/soc/qcom/rpmh.h
index bdbee1a97d3685d8a6153d586ddf650bd3bd3dde..03eea0bc798e6b66a4d47e9ae1bc408de696c059 100644
--- a/include/soc/qcom/rpmh.h
+++ b/include/soc/qcom/rpmh.h
@@ -11,6 +11,9 @@
 
 
 #if IS_ENABLED(CONFIG_QCOM_RPMH)
+int rpmh_read(const struct device *dev, enum rpmh_state state,
+	      struct tcs_cmd *cmd, u32 n);
+
 int rpmh_write(const struct device *dev, enum rpmh_state state,
 	       const struct tcs_cmd *cmd, u32 n);
 
@@ -24,6 +27,10 @@ void rpmh_invalidate(const struct device *dev);
 
 #else
 
+static inline int rpmh_read(const struct device *dev, enum rpmh_state state,
+			    struct tcs_cmd *cmd, u32 n)
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


