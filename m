Return-Path: <linux-arm-msm+bounces-28106-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 63C9494ACB0
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 Aug 2024 17:21:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D34651F22E60
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 Aug 2024 15:21:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 112E312F398;
	Wed,  7 Aug 2024 15:19:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Tba5G9VH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE37E85260;
	Wed,  7 Aug 2024 15:19:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723043951; cv=none; b=H12VHqrOcSYX+AKX1RMJzFLB14gayOPHTU/zKCTlr3wH5hl5zg3+aJ1Ya9t7BxpGzJxStTLKdYv8PIpsAn1a1KFUKwrAfrYJaFH0TVPzey/i9K9dog8qOCSr2qTcum5RkTW6Xn46Q/wqI88DGgM6y5YLo9sBflxpwh2RYZXzShI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723043951; c=relaxed/simple;
	bh=SPE6Fim3/iZTP8g9bx27PJRqcSTjDSUfrbucJsDcrEU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=c2w6agOQk8Nv0pj4RxbpI7wUMh9pMikwoP6x9cAluhp9o9y92LfRPKn5Jc4EspRh1Si+ZwUVLJXKMwwLDm89vWYnXttT6vcQV0BZbeH++TF8Ai1wdpXGrPAh9e38ZpDrbBXawsUzcfUhm9y3/S14ESzoipsJPKlju7Bs2DDrJBY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Tba5G9VH; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BBB7CC32781;
	Wed,  7 Aug 2024 15:19:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723043950;
	bh=SPE6Fim3/iZTP8g9bx27PJRqcSTjDSUfrbucJsDcrEU=;
	h=Date:From:To:Cc:Subject:From;
	b=Tba5G9VHUKd48En9J++DR0cKiGu175i47rvAl2+Pj2n0kDPB/3pVN2V/vP9r2nUIP
	 ZHWmKBBvBsORM0FMdFlX9qLm9thrGYmJYWUBB5uGluD6b6XZBS03gIvI4sy8QrRZPk
	 gLV9prQUWxB5x+aQmD6GlHAH1pMCyFzTwLikqysDskFp2wIxONT5FBuGlBW13qFh9V
	 1sOj9cglhq8FC8jDWYwlINzveoYMFaUxXxmgiZfRxOYO8+tYT/mtcmSMNSrVMyg10H
	 nJYYigNvl6Cqlx6dtRMd3mueSk8AuDfydnG2HoyWeJwf/R6r4QM32RtMmd3zlINK4f
	 ni9XGLPod0euQ==
Date: Wed, 7 Aug 2024 09:19:07 -0600
From: "Gustavo A. R. Silva" <gustavoars@kernel.org>
To: Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	linux-hardening@vger.kernel.org
Subject: [PATCH][next] rpmsg: glink: Avoid -Wflex-array-member-not-at-end
 warnings
Message-ID: <ZrOQa2gew5yadyt3@cute>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

-Wflex-array-member-not-at-end was introduced in GCC-14, and we are
getting ready to enable it, globally.

So, in order to avoid ending up with a flexible-array member in the
middle of multiple other structs, we use the `__struct_group()`
helper to create a new tagged `struct glink_msg_hdr`. This structure
groups together all the members of the flexible `struct glink_msg`
except the flexible array.

As a result, the array is effectively separated from the rest of the
members without modifying the memory layout of the flexible structure.
We then change the type of the middle struct members currently causing
trouble from `struct glink_msg` to `struct glink_msg_hdr`.

We also want to ensure that when new members need to be added to the
flexible structure, they are always included within the newly created
tagged struct. For this, we use `static_assert()`. This ensures that the
memory layout for both the flexible structure and the new tagged struct
is the same after any changes.

This approach avoids having to implement `struct glink_msg_hdr` as a
completely separate structure, thus preventing having to maintain two
independent but basically identical structures, closing the door to
potential bugs in the future.

We also use `container_of()` whenever we need to retrieve a pointer to
the flexible structure, through which we can access the flexible-array
member, if necessary.

Additionally, we use the `DEFINE_RAW_FLEX()` helper for an on-stack
definition of a flexible structure where the size for the flexible-array
member is known at compile-time.

So, with these changes, fix the following warnings:
drivers/rpmsg/qcom_glink_native.c:51:26: warning: structure containing a flexible array member is not at the end of another structure [-Wflex-array-member-not-at-end]
drivers/rpmsg/qcom_glink_native.c:459:34: warning: structure containing a flexible array member is not at the end of another structure [-Wflex-array-member-not-at-end]
drivers/rpmsg/qcom_glink_native.c:846:34: warning: structure containing a flexible array member is not at the end of another structure [-Wflex-array-member-not-at-end]
drivers/rpmsg/qcom_glink_native.c:968:34: warning: structure containing a flexible array member is not at the end of another structure [-Wflex-array-member-not-at-end]
drivers/rpmsg/qcom_glink_native.c:1380:34: warning: structure containing a flexible array member is not at the end of another structure [-Wflex-array-member-not-at-end]

Signed-off-by: Gustavo A. R. Silva <gustavoars@kernel.org>
---
 drivers/rpmsg/qcom_glink_native.c | 42 +++++++++++++++++--------------
 1 file changed, 23 insertions(+), 19 deletions(-)

diff --git a/drivers/rpmsg/qcom_glink_native.c b/drivers/rpmsg/qcom_glink_native.c
index 82d460ff4777..ed89b810f262 100644
--- a/drivers/rpmsg/qcom_glink_native.c
+++ b/drivers/rpmsg/qcom_glink_native.c
@@ -30,11 +30,16 @@
 #define RPM_GLINK_CID_MAX	65536
 
 struct glink_msg {
-	__le16 cmd;
-	__le16 param1;
-	__le32 param2;
+	/* New members MUST be added within the __struct_group() macro below. */
+	__struct_group(glink_msg_hdr, hdr, __packed,
+		__le16 cmd;
+		__le16 param1;
+		__le32 param2;
+	);
 	u8 data[];
 } __packed;
+static_assert(offsetof(struct glink_msg, data) == sizeof(struct glink_msg_hdr),
+	      "struct member likely outside of __struct_group()");
 
 /**
  * struct glink_defer_cmd - deferred incoming control message
@@ -48,7 +53,7 @@ struct glink_msg {
 struct glink_defer_cmd {
 	struct list_head node;
 
-	struct glink_msg msg;
+	struct glink_msg_hdr msg;
 	u8 data[];
 };
 
@@ -455,12 +460,9 @@ static void qcom_glink_intent_req_abort(struct glink_channel *channel)
 static int qcom_glink_send_open_req(struct qcom_glink *glink,
 				    struct glink_channel *channel)
 {
-	struct {
-		struct glink_msg msg;
-		u8 name[GLINK_NAME_SIZE];
-	} __packed req;
+	DEFINE_RAW_FLEX(struct glink_msg, req, data, GLINK_NAME_SIZE);
 	int name_len = strlen(channel->name) + 1;
-	int req_len = ALIGN(sizeof(req.msg) + name_len, 8);
+	int req_len = ALIGN(sizeof(*req) + name_len, 8);
 	int ret;
 	unsigned long flags;
 
@@ -476,12 +478,12 @@ static int qcom_glink_send_open_req(struct qcom_glink *glink,
 
 	channel->lcid = ret;
 
-	req.msg.cmd = cpu_to_le16(GLINK_CMD_OPEN);
-	req.msg.param1 = cpu_to_le16(channel->lcid);
-	req.msg.param2 = cpu_to_le32(name_len);
-	strcpy(req.name, channel->name);
+	req->cmd = cpu_to_le16(GLINK_CMD_OPEN);
+	req->param1 = cpu_to_le16(channel->lcid);
+	req->param2 = cpu_to_le32(name_len);
+	strcpy(req->data, channel->name);
 
-	ret = qcom_glink_tx(glink, &req, req_len, NULL, 0, true);
+	ret = qcom_glink_tx(glink, req, req_len, NULL, 0, true);
 	if (ret)
 		goto remove_idr;
 
@@ -826,7 +828,9 @@ static int qcom_glink_rx_defer(struct qcom_glink *glink, size_t extra)
 
 	INIT_LIST_HEAD(&dcmd->node);
 
-	qcom_glink_rx_peek(glink, &dcmd->msg, 0, sizeof(dcmd->msg) + extra);
+	qcom_glink_rx_peek(glink,
+			   container_of(&dcmd->msg, struct glink_msg, hdr), 0,
+			   sizeof(dcmd->msg) + extra);
 
 	spin_lock(&glink->rx_lock);
 	list_add_tail(&dcmd->node, &glink->rx_queue);
@@ -843,7 +847,7 @@ static int qcom_glink_rx_data(struct qcom_glink *glink, size_t avail)
 	struct glink_core_rx_intent *intent;
 	struct glink_channel *channel;
 	struct {
-		struct glink_msg msg;
+		struct glink_msg_hdr msg;
 		__le32 chunk_size;
 		__le32 left_size;
 	} __packed hdr;
@@ -965,7 +969,7 @@ static void qcom_glink_handle_intent(struct qcom_glink *glink,
 	};
 
 	struct {
-		struct glink_msg msg;
+		struct glink_msg_hdr msg;
 		struct intent_pair intents[];
 	} __packed * msg;
 
@@ -1377,7 +1381,7 @@ static int __qcom_glink_send(struct glink_channel *channel,
 	struct glink_core_rx_intent *tmp;
 	int iid = 0;
 	struct {
-		struct glink_msg msg;
+		struct glink_msg_hdr msg;
 		__le32 chunk_size;
 		__le32 left_size;
 	} __packed req;
@@ -1685,7 +1689,7 @@ static void qcom_glink_work(struct work_struct *work)
 		list_del(&dcmd->node);
 		spin_unlock_irqrestore(&glink->rx_lock, flags);
 
-		msg = &dcmd->msg;
+		msg = container_of(&dcmd->msg, struct glink_msg, hdr);
 		cmd = le16_to_cpu(msg->cmd);
 		param1 = le16_to_cpu(msg->param1);
 		param2 = le32_to_cpu(msg->param2);
-- 
2.34.1


