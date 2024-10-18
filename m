Return-Path: <linux-arm-msm+bounces-34999-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 71C119A45BC
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Oct 2024 20:23:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 12ED0285D3A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Oct 2024 18:23:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1CD002101B9;
	Fri, 18 Oct 2024 18:20:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eAYGNToP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ot1-f42.google.com (mail-ot1-f42.google.com [209.85.210.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EE2F20E034;
	Fri, 18 Oct 2024 18:20:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729275634; cv=none; b=CT5z0RjB/ruyhi4QySgHnNHvqByj8Wr+P8EGgQ8uNQKkpE7waJSUS4xkYp68xEePv8uFZpkc4so007qWEZO9041XZW6pfXglaSnMyEd3FCaq9sPq4SLATPvIqHMqaQQ+YcRKne/met6m8Gd0b3/nZvUXb4ursBdgzdUVPRnKHn8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729275634; c=relaxed/simple;
	bh=aA2jSJoNyalqp8WXqjcCcmVDza8tosKbDMDvAIGniio=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SEVhsIbj3bzScwR7mbaPkAs9/jCFatFlSFV07JY3XTfWl2D7I8x3YM3eO9YX7+unWXgEu1jN3I+BlifjhIiCrSxC9yUdFkgwsqP4hW8zfOwwlaHXULrwCq4EgCrhhHpN48OVcGWn4t/bfGYKWYzU3zQsSU790MVGmrjsds8Boto=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eAYGNToP; arc=none smtp.client-ip=209.85.210.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ot1-f42.google.com with SMTP id 46e09a7af769-7181b86a749so475005a34.3;
        Fri, 18 Oct 2024 11:20:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729275630; x=1729880430; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tPt7HWg9o/t9Kiabv7bBS/POb/GbeQprp+oLjeSGecY=;
        b=eAYGNToPLAjEPukGK+pjA2OkSroXQ3RktIdg+kEu6h5I/0ysuOqBe+ZGseyqBGlXB3
         is6gvUQj9Zq3RINA52eilSyfn9PfUBwbe9r9uIyt4Lqe2ujCyje3dAR7mZ2fW70GqKV4
         iKPOHp2FfTLxQHaWZm/3TtoPx8CkNwIvZFB0sp83/96z7oFbrCazy1dj5iOEzlneGKA/
         RMgnNR0Fs2kfYsbm2PZodlpkHqxtUzPFbtjdXkEsScKpQRfY3Kb6+JDw7LWVvLN0DSuf
         40sE7BWgGW6yTeSpgtAS1YIS4e1z2GH+1GrAlAGJC5QrRuapEG2oR1fG5kkVZ/wiGM67
         vgBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729275630; x=1729880430;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tPt7HWg9o/t9Kiabv7bBS/POb/GbeQprp+oLjeSGecY=;
        b=OFZK4GTe6HDNBIC1sjQCUcg3/oGchKqpyQZQtE0qLUNIK59RVjrStYZtZnmD5VUbii
         tM3NhZsj5g3Hy/9+clFnPcWGEHBCEfALr8DlPfaD6/O5qh1EC68umo2xIk9xIkLB+HNP
         sVBwHhijRPk6oUphjmzwcRIDjWXDlD1cfrzaRvCCEJVUX+sBKjo3RTAj//ANSRiDOlHg
         vfsWwfj24KN9ORk13UJUdTDrKGHx2HuMgv9IwWnoB7YiHKsYAWv4bWaQeNezQgChILvO
         x3bJD0bBiqhowN+SZg8G0JwaS/cI9+dCz9gtj0x77Bm1M0bh6rZM0R82+PZmSYdf3TiF
         HHgA==
X-Forwarded-Encrypted: i=1; AJvYcCX9xvLbr9b+nzh0n5hgJxMq0CauoeeOlSdnT5YwsngHD4I+iiA58mJFSbCXooY2zak5qr1yWDqoFO53fACN@vger.kernel.org, AJvYcCXBbG4/2xaQkzyzsVPRHnnvokWMmaEu0343I8TuhlP7B/W0vmg0clptri4ULzf9OeyKk9P8ZBvXZmEcv6Ky@vger.kernel.org
X-Gm-Message-State: AOJu0YzrLaVUy5pKgsrMhwNCAH2KKZ1gfEpX/Pabf9sq0BV07gOttO0+
	/EIFJ0nqBItJrLrl4hPLTDwOhdMmGwwK0UlSk0+ftAV6OcIB47rc+O+qiA==
X-Google-Smtp-Source: AGHT+IELXxVKa8uSNHsrmFkWlSULMmo+HrSU9FKGLh9XpdiQDGAyW7oTf42WeF24URvVoJpzBZQzIQ==
X-Received: by 2002:a05:6830:3989:b0:717:f707:cb92 with SMTP id 46e09a7af769-7181a8c20d7mr2879917a34.28.1729275630276;
        Fri, 18 Oct 2024 11:20:30 -0700 (PDT)
Received: from localhost.localdomain (syn-070-114-247-242.res.spectrum.com. [70.114.247.242])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-5eb8aa2f668sm340542eaf.44.2024.10.18.11.20.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Oct 2024 11:20:29 -0700 (PDT)
From: Denis Kenzior <denkenz@gmail.com>
To: netdev@vger.kernel.org
Cc: denkenz@gmail.com,
	Marcel Holtmann <marcel@holtmann.org>,
	Andy Gross <agross@kernel.org>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [RFC PATCH v1 09/10] net: qrtr: ns: support multiple endpoints
Date: Fri, 18 Oct 2024 13:18:27 -0500
Message-ID: <20241018181842.1368394-10-denkenz@gmail.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241018181842.1368394-1-denkenz@gmail.com>
References: <20241018181842.1368394-1-denkenz@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Extend the qrtr name service with the concept of an endpoint.  Endpoints
can be remote or local, and are represented by a unique endpoint id.
This allows the qrtr name service to support multiple devices
(endpoints) that might have overlapping node / port combinations.

The socket used by the name service is subscribed to receive endpoint
information via a mechanism similar to the SOL_QRTR QRTR_REPORT_ENDPOINT
socket option.  Internal data structures are then extended to track
endpoint information in addition to nodes and ports.

The name service directs packets to the endpoint originating the
request.  For NEW_SERVER and DEL_SERVER messages triggered using lookups
or due to remote endpoints sending the corresponding message, qrtr name
service generates a NEW_SERVER and DEL_SERVER messages to all local
sockets registered to receive such notifications.  The messages are made
to look as if they're coming from the remote endpoint using a special
extension to AF_QRTR sendmsg operation.  This extension only works for
the local socket that owns the QRTR_PORT_CTRL port (name service).

Signed-off-by: Denis Kenzior <denkenz@gmail.com>
Reviewed-by: Marcel Holtmann <marcel@holtmann.org>
Reviewed-by: Andy Gross <agross@kernel.org>
---
 net/qrtr/af_qrtr.c |  14 +++
 net/qrtr/ns.c      | 296 +++++++++++++++++++++++++++------------------
 net/qrtr/qrtr.h    |   1 +
 3 files changed, 193 insertions(+), 118 deletions(-)

diff --git a/net/qrtr/af_qrtr.c b/net/qrtr/af_qrtr.c
index 95c9679725ee..ea678c3c5752 100644
--- a/net/qrtr/af_qrtr.c
+++ b/net/qrtr/af_qrtr.c
@@ -107,6 +107,15 @@ static inline struct qrtr_sock *qrtr_sk(struct sock *sk)
 	return container_of(sk, struct qrtr_sock, sk);
 }
 
+void qrtr_sock_set_report_endpoint(struct sock *sk)
+{
+	struct qrtr_sock *ipc = qrtr_sk(sk);
+
+	lock_sock(sk);
+	assign_bit(QRTR_F_REPORT_ENDPOINT, &ipc->flags, 1);
+	release_sock(sk);
+}
+
 int qrtr_msg_get_endpoint(struct msghdr *msg, u32 *out_endpoint_id)
 {
 	struct cmsghdr *cmsg;
@@ -1092,6 +1101,11 @@ static int qrtr_sendmsg(struct socket *sock, struct msghdr *msg, size_t len)
 
 		/* control messages already require the type as 'command' */
 		skb_copy_bits(skb, 0, &qrtr_type, 4);
+		/*
+		 * Allow local name service to make packets appear as if
+		 * they originated remotely
+		 */
+		endpoint_id = msg_endpoint_id;
 	}
 
 	type = le32_to_cpu(qrtr_type);
diff --git a/net/qrtr/ns.c b/net/qrtr/ns.c
index 6158e08c0252..a3118a05dcb8 100644
--- a/net/qrtr/ns.c
+++ b/net/qrtr/ns.c
@@ -5,6 +5,7 @@
  * Copyright (c) 2020, Linaro Ltd.
  */
 
+#define pr_fmt(fmt) "QRTR NS: "fmt
 #include <linux/module.h>
 #include <linux/qrtr.h>
 #include <linux/workqueue.h>
@@ -16,7 +17,7 @@
 #define CREATE_TRACE_POINTS
 #include <trace/events/qrtr.h>
 
-static DEFINE_XARRAY(nodes);
+static DEFINE_XARRAY(endpoints);
 
 static struct {
 	struct socket *sock;
@@ -60,6 +61,7 @@ struct qrtr_server {
 
 	unsigned int node;
 	unsigned int port;
+	u32 endpoint_id;
 
 	struct list_head qli;
 };
@@ -69,28 +71,70 @@ struct qrtr_node {
 	struct xarray servers;
 };
 
-static struct qrtr_node *node_get(unsigned int node_id)
+struct qrtr_ns_endpoint {
+	unsigned int id;
+	struct xarray nodes;
+};
+
+static struct qrtr_node *node_lookup(u32 endpoint_id, unsigned int node_id)
+{
+	struct qrtr_ns_endpoint *endpoint;
+
+	endpoint = xa_load(&endpoints, endpoint_id);
+	if (!endpoint)
+		return NULL;
+
+	return xa_load(&endpoint->nodes, node_id);
+}
+
+static struct qrtr_node *node_new(u32 endpoint_id, unsigned int node_id)
 {
+	struct qrtr_ns_endpoint *endpoint;
 	struct qrtr_node *node;
+	bool new_endpoint = false;
 
-	node = xa_load(&nodes, node_id);
-	if (node)
-		return node;
+	endpoint = xa_load(&endpoints, endpoint_id);
+	if (!endpoint) {
+		endpoint = kzalloc(sizeof(*endpoint), GFP_KERNEL);
+		if (!endpoint)
+			return NULL;
+
+		endpoint->id = endpoint_id;
+		xa_init(&endpoint->nodes);
+
+		if (xa_store(&endpoints, endpoint_id, endpoint, GFP_KERNEL)) {
+			kfree(endpoint);
+			return NULL;
+		}
+
+		new_endpoint = true;
+	} else {
+		node = xa_load(&endpoint->nodes, node_id);
+		if (node)
+			return node;
+	}
 
 	/* If node didn't exist, allocate and insert it to the tree */
 	node = kzalloc(sizeof(*node), GFP_KERNEL);
 	if (!node)
-		return NULL;
+		goto error;
 
 	node->id = node_id;
 	xa_init(&node->servers);
 
-	if (xa_store(&nodes, node_id, node, GFP_KERNEL)) {
+	if (xa_store(&endpoint->nodes, node_id, node, GFP_KERNEL)) {
 		kfree(node);
-		return NULL;
+		goto error;
 	}
 
 	return node;
+error:
+	if (new_endpoint) {
+		xa_erase(&endpoints, endpoint_id);
+		kfree(endpoint);
+	}
+
+	return NULL;
 }
 
 static int server_match(const struct qrtr_server *srv,
@@ -106,19 +150,42 @@ static int server_match(const struct qrtr_server *srv,
 	return (srv->instance & ifilter) == f->instance;
 }
 
-static int service_announce_new(struct sockaddr_qrtr *dest,
-				struct qrtr_server *srv)
+static int qrtr_ns_sendmsg(u32 endpoint_id, struct sockaddr_qrtr *dest,
+			   struct qrtr_ctrl_pkt *pkt)
 {
-	struct qrtr_ctrl_pkt pkt;
 	struct msghdr msg = { };
 	struct kvec iv;
+	u8 control[CMSG_SPACE(sizeof(endpoint_id))];
+	struct cmsghdr *cmsg;
+
+	iv.iov_base = pkt;
+	iv.iov_len = sizeof(*pkt);
+
+	msg.msg_name = (struct sockaddr *)dest;
+	msg.msg_namelen = sizeof(*dest);
+
+	if (endpoint_id) {
+		msg.msg_control = control;
+		msg.msg_controllen = sizeof(control);
+
+		cmsg = CMSG_FIRSTHDR(&msg);
+		cmsg->cmsg_level = SOL_QRTR;
+		cmsg->cmsg_type = QRTR_ENDPOINT;
+		cmsg->cmsg_len = CMSG_LEN(sizeof(endpoint_id));
+		memcpy(CMSG_DATA(cmsg), &endpoint_id, sizeof(endpoint_id));
+	}
+
+	return kernel_sendmsg(qrtr_ns.sock, &msg, &iv, 1, sizeof(*pkt));
+}
+
+static int service_announce_new(u32 endpoint_id, struct sockaddr_qrtr *dest,
+				struct qrtr_server *srv)
+{
+	struct qrtr_ctrl_pkt pkt;
 
 	trace_qrtr_ns_service_announce_new(srv->service, srv->instance,
 					   srv->node, srv->port);
 
-	iv.iov_base = &pkt;
-	iv.iov_len = sizeof(pkt);
-
 	memset(&pkt, 0, sizeof(pkt));
 	pkt.cmd = cpu_to_le32(QRTR_TYPE_NEW_SERVER);
 	pkt.server.service = cpu_to_le32(srv->service);
@@ -126,26 +193,18 @@ static int service_announce_new(struct sockaddr_qrtr *dest,
 	pkt.server.node = cpu_to_le32(srv->node);
 	pkt.server.port = cpu_to_le32(srv->port);
 
-	msg.msg_name = (struct sockaddr *)dest;
-	msg.msg_namelen = sizeof(*dest);
-
-	return kernel_sendmsg(qrtr_ns.sock, &msg, &iv, 1, sizeof(pkt));
+	return qrtr_ns_sendmsg(endpoint_id, dest, &pkt);
 }
 
-static void service_announce_del(struct sockaddr_qrtr *dest,
+static void service_announce_del(u32 endpoint_id, struct sockaddr_qrtr *dest,
 				 struct qrtr_server *srv)
 {
 	struct qrtr_ctrl_pkt pkt;
-	struct msghdr msg = { };
-	struct kvec iv;
 	int ret;
 
 	trace_qrtr_ns_service_announce_del(srv->service, srv->instance,
 					   srv->node, srv->port);
 
-	iv.iov_base = &pkt;
-	iv.iov_len = sizeof(pkt);
-
 	memset(&pkt, 0, sizeof(pkt));
 	pkt.cmd = cpu_to_le32(QRTR_TYPE_DEL_SERVER);
 	pkt.server.service = cpu_to_le32(srv->service);
@@ -153,27 +212,22 @@ static void service_announce_del(struct sockaddr_qrtr *dest,
 	pkt.server.node = cpu_to_le32(srv->node);
 	pkt.server.port = cpu_to_le32(srv->port);
 
-	msg.msg_name = (struct sockaddr *)dest;
-	msg.msg_namelen = sizeof(*dest);
-
-	ret = kernel_sendmsg(qrtr_ns.sock, &msg, &iv, 1, sizeof(pkt));
+	ret = qrtr_ns_sendmsg(endpoint_id, dest, &pkt);
 	if (ret < 0 && ret != -ENODEV)
 		pr_err("failed to announce del service\n");
-
-	return;
 }
 
-static void lookup_notify(struct sockaddr_qrtr *to, struct qrtr_server *srv,
-			  bool new)
+static void lookup_notify(u32 endpoint_id, struct sockaddr_qrtr *to,
+			  struct qrtr_server *srv, bool new)
 {
 	struct qrtr_ctrl_pkt pkt;
-	struct msghdr msg = { };
-	struct kvec iv;
 	int ret;
 
-	iv.iov_base = &pkt;
-	iv.iov_len = sizeof(pkt);
-
+	/*
+	 * Notify a local client at @to about a server change.  The aux data
+	 * will look as if it came from the endpoint that reported the event
+	 * (remote or local)
+	 */
 	memset(&pkt, 0, sizeof(pkt));
 	pkt.cmd = new ? cpu_to_le32(QRTR_TYPE_NEW_SERVER) :
 			cpu_to_le32(QRTR_TYPE_DEL_SERVER);
@@ -184,28 +238,25 @@ static void lookup_notify(struct sockaddr_qrtr *to, struct qrtr_server *srv,
 		pkt.server.port = cpu_to_le32(srv->port);
 	}
 
-	msg.msg_name = (struct sockaddr *)to;
-	msg.msg_namelen = sizeof(*to);
-
-	ret = kernel_sendmsg(qrtr_ns.sock, &msg, &iv, 1, sizeof(pkt));
+	ret = qrtr_ns_sendmsg(endpoint_id, to, &pkt);
 	if (ret < 0 && ret != -ENODEV)
 		pr_err("failed to send lookup notification\n");
 }
 
-static int announce_servers(struct sockaddr_qrtr *sq)
+static int announce_servers(u32 endpoint_id, struct sockaddr_qrtr *sq)
 {
 	struct qrtr_server *srv;
 	struct qrtr_node *node;
 	unsigned long index;
 	int ret;
 
-	node = node_get(qrtr_ns.local_node);
+	node = node_lookup(qrtr_ns.local_node, qrtr_ns.local_node);
 	if (!node)
 		return 0;
 
-	/* Announce the list of servers registered in this node */
+	/* Announce servers registered on local endpoint to remote endpoint */
 	xa_for_each(&node->servers, index, srv) {
-		ret = service_announce_new(sq, srv);
+		ret = service_announce_new(endpoint_id, sq, srv);
 		if (ret < 0) {
 			if (ret == -ENODEV)
 				continue;
@@ -217,7 +268,8 @@ static int announce_servers(struct sockaddr_qrtr *sq)
 	return 0;
 }
 
-static struct qrtr_server *server_add(unsigned int service,
+static struct qrtr_server *server_add(u32 endpoint_id,
+				      unsigned int service,
 				      unsigned int instance,
 				      unsigned int node_id,
 				      unsigned int port)
@@ -238,7 +290,7 @@ static struct qrtr_server *server_add(unsigned int service,
 	srv->node = node_id;
 	srv->port = port;
 
-	node = node_get(node_id);
+	node = node_new(endpoint_id, node_id);
 	if (!node)
 		goto err;
 
@@ -264,7 +316,8 @@ static struct qrtr_server *server_add(unsigned int service,
 	return NULL;
 }
 
-static int server_del(struct qrtr_node *node, unsigned int port, bool bcast)
+static int server_del(u32 endpoint_id, struct qrtr_node *node,
+		      unsigned int port, bool bcast)
 {
 	struct qrtr_lookup *lookup;
 	struct qrtr_server *srv;
@@ -276,9 +329,10 @@ static int server_del(struct qrtr_node *node, unsigned int port, bool bcast)
 
 	xa_erase(&node->servers, port);
 
-	/* Broadcast the removal of local servers */
+	/* Broadcast the removal of local servers to remote endpoints */
 	if (srv->node == qrtr_ns.local_node && bcast)
-		service_announce_del(&qrtr_ns.bcast_sq, srv);
+		service_announce_del(qrtr_ns.local_node,
+				     &qrtr_ns.bcast_sq, srv);
 
 	/* Announce the service's disappearance to observers */
 	list_for_each(li, &qrtr_ns.lookups) {
@@ -288,7 +342,7 @@ static int server_del(struct qrtr_node *node, unsigned int port, bool bcast)
 		if (lookup->instance && lookup->instance != srv->instance)
 			continue;
 
-		lookup_notify(&lookup->sq, srv, false);
+		lookup_notify(endpoint_id, &lookup->sq, srv, false);
 	}
 
 	kfree(srv);
@@ -296,23 +350,15 @@ static int server_del(struct qrtr_node *node, unsigned int port, bool bcast)
 	return 0;
 }
 
-static int say_hello(struct sockaddr_qrtr *dest)
+static int say_hello(u32 endpoint_id, struct sockaddr_qrtr *dest)
 {
 	struct qrtr_ctrl_pkt pkt;
-	struct msghdr msg = { };
-	struct kvec iv;
 	int ret;
 
-	iv.iov_base = &pkt;
-	iv.iov_len = sizeof(pkt);
-
 	memset(&pkt, 0, sizeof(pkt));
 	pkt.cmd = cpu_to_le32(QRTR_TYPE_HELLO);
 
-	msg.msg_name = (struct sockaddr *)dest;
-	msg.msg_namelen = sizeof(*dest);
-
-	ret = kernel_sendmsg(qrtr_ns.sock, &msg, &iv, 1, sizeof(pkt));
+	ret = qrtr_ns_sendmsg(endpoint_id, dest, &pkt);
 	if (ret < 0)
 		pr_err("failed to send hello msg\n");
 
@@ -320,42 +366,38 @@ static int say_hello(struct sockaddr_qrtr *dest)
 }
 
 /* Announce the list of servers registered on the local node */
-static int ctrl_cmd_hello(struct sockaddr_qrtr *sq)
+static int ctrl_cmd_hello(u32 endpoint_id, struct sockaddr_qrtr *sq)
 {
 	int ret;
 
-	ret = say_hello(sq);
+	/* Send Hello and New Server messages to remote endpoint */
+	ret = say_hello(endpoint_id, sq);
 	if (ret < 0)
 		return ret;
 
-	return announce_servers(sq);
+	return announce_servers(endpoint_id, sq);
 }
 
-static int ctrl_cmd_bye(struct sockaddr_qrtr *from)
+static int ctrl_cmd_bye(u32 endpoint_id, struct sockaddr_qrtr *from)
 {
 	struct qrtr_node *local_node;
 	struct qrtr_ctrl_pkt pkt;
 	struct qrtr_server *srv;
 	struct sockaddr_qrtr sq;
-	struct msghdr msg = { };
 	struct qrtr_node *node;
 	unsigned long index;
-	struct kvec iv;
 	int ret;
 
-	iv.iov_base = &pkt;
-	iv.iov_len = sizeof(pkt);
-
-	node = node_get(from->sq_node);
+	node = node_lookup(endpoint_id, from->sq_node);
 	if (!node)
 		return 0;
 
 	/* Advertise removal of this client to all servers of remote node */
 	xa_for_each(&node->servers, index, srv)
-		server_del(node, srv->port, true);
+		server_del(endpoint_id, node, srv->port, true);
 
 	/* Advertise the removal of this client to all local servers */
-	local_node = node_get(qrtr_ns.local_node);
+	local_node = node_lookup(qrtr_ns.local_node, qrtr_ns.local_node);
 	if (!local_node)
 		return 0;
 
@@ -368,10 +410,8 @@ static int ctrl_cmd_bye(struct sockaddr_qrtr *from)
 		sq.sq_node = srv->node;
 		sq.sq_port = srv->port;
 
-		msg.msg_name = (struct sockaddr *)&sq;
-		msg.msg_namelen = sizeof(sq);
-
-		ret = kernel_sendmsg(qrtr_ns.sock, &msg, &iv, 1, sizeof(pkt));
+		/* Bye will look as if it came from endpoint_id */
+		ret = qrtr_ns_sendmsg(endpoint_id, &sq, &pkt);
 		if (ret < 0 && ret != -ENODEV) {
 			pr_err("failed to send bye cmd\n");
 			return ret;
@@ -380,25 +420,20 @@ static int ctrl_cmd_bye(struct sockaddr_qrtr *from)
 	return 0;
 }
 
-static int ctrl_cmd_del_client(struct sockaddr_qrtr *from,
+static int ctrl_cmd_del_client(u32 endpoint_id, struct sockaddr_qrtr *from,
 			       unsigned int node_id, unsigned int port)
 {
 	struct qrtr_node *local_node;
 	struct qrtr_lookup *lookup;
 	struct qrtr_ctrl_pkt pkt;
-	struct msghdr msg = { };
 	struct qrtr_server *srv;
 	struct sockaddr_qrtr sq;
 	struct qrtr_node *node;
 	struct list_head *tmp;
 	struct list_head *li;
 	unsigned long index;
-	struct kvec iv;
 	int ret;
 
-	iv.iov_base = &pkt;
-	iv.iov_len = sizeof(pkt);
-
 	/* Don't accept spoofed messages */
 	if (from->sq_node != node_id)
 		return -EINVAL;
@@ -423,12 +458,12 @@ static int ctrl_cmd_del_client(struct sockaddr_qrtr *from,
 	 * DEL_SERVER. Neighbours would've already removed the server belonging
 	 * to this port due to the DEL_CLIENT broadcast from qrtr_port_remove().
 	 */
-	node = node_get(node_id);
+	node = node_lookup(endpoint_id, node_id);
 	if (node)
-		server_del(node, port, false);
+		server_del(endpoint_id, node, port, false);
 
 	/* Advertise the removal of this client to all local servers */
-	local_node = node_get(qrtr_ns.local_node);
+	local_node = node_lookup(qrtr_ns.local_node, qrtr_ns.local_node);
 	if (!local_node)
 		return 0;
 
@@ -442,10 +477,8 @@ static int ctrl_cmd_del_client(struct sockaddr_qrtr *from,
 		sq.sq_node = srv->node;
 		sq.sq_port = srv->port;
 
-		msg.msg_name = (struct sockaddr *)&sq;
-		msg.msg_namelen = sizeof(sq);
-
-		ret = kernel_sendmsg(qrtr_ns.sock, &msg, &iv, 1, sizeof(pkt));
+		/* Del Client will look as if it came from endpoint_id */
+		ret = qrtr_ns_sendmsg(endpoint_id, &sq, &pkt);
 		if (ret < 0 && ret != -ENODEV) {
 			pr_err("failed to send del client cmd\n");
 			return ret;
@@ -454,7 +487,7 @@ static int ctrl_cmd_del_client(struct sockaddr_qrtr *from,
 	return 0;
 }
 
-static int ctrl_cmd_new_server(struct sockaddr_qrtr *from,
+static int ctrl_cmd_new_server(u32 endpoint_id, struct sockaddr_qrtr *from,
 			       unsigned int service, unsigned int instance,
 			       unsigned int node_id, unsigned int port)
 {
@@ -469,12 +502,16 @@ static int ctrl_cmd_new_server(struct sockaddr_qrtr *from,
 		port = from->sq_port;
 	}
 
-	srv = server_add(service, instance, node_id, port);
-	if (!srv)
+	srv = server_add(endpoint_id, service, instance, node_id, port);
+	if (!srv) {
+		pr_err("Failed to add server\n");
 		return -EINVAL;
+	}
 
 	if (srv->node == qrtr_ns.local_node) {
-		ret = service_announce_new(&qrtr_ns.bcast_sq, srv);
+		/* Broadcast local server info to all peer endpoints */
+		ret = service_announce_new(qrtr_ns.local_node,
+					   &qrtr_ns.bcast_sq, srv);
 		if (ret < 0) {
 			pr_err("failed to announce new service\n");
 			return ret;
@@ -489,13 +526,13 @@ static int ctrl_cmd_new_server(struct sockaddr_qrtr *from,
 		if (lookup->instance && lookup->instance != instance)
 			continue;
 
-		lookup_notify(&lookup->sq, srv, true);
+		lookup_notify(endpoint_id, &lookup->sq, srv, true);
 	}
 
 	return ret;
 }
 
-static int ctrl_cmd_del_server(struct sockaddr_qrtr *from,
+static int ctrl_cmd_del_server(u32 endpoint_id, struct sockaddr_qrtr *from,
 			       unsigned int service, unsigned int instance,
 			       unsigned int node_id, unsigned int port)
 {
@@ -511,24 +548,22 @@ static int ctrl_cmd_del_server(struct sockaddr_qrtr *from,
 	if (from->sq_node == qrtr_ns.local_node && from->sq_port != port)
 		return -EINVAL;
 
-	node = node_get(node_id);
+	node = node_lookup(endpoint_id, node_id);
 	if (!node)
 		return -ENOENT;
 
-	server_del(node, port, true);
+	server_del(endpoint_id, node, port, true);
 
 	return 0;
 }
 
-static int ctrl_cmd_new_lookup(struct sockaddr_qrtr *from,
+static int ctrl_cmd_new_lookup(u32 endpoint_id, struct sockaddr_qrtr *from,
 			       unsigned int service, unsigned int instance)
 {
 	struct qrtr_server_filter filter;
 	struct qrtr_lookup *lookup;
-	struct qrtr_server *srv;
-	struct qrtr_node *node;
-	unsigned long node_idx;
-	unsigned long srv_idx;
+	unsigned long id;
+	struct qrtr_ns_endpoint *endpoint;
 
 	/* Accept only local observers */
 	if (from->sq_node != qrtr_ns.local_node)
@@ -547,22 +582,30 @@ static int ctrl_cmd_new_lookup(struct sockaddr_qrtr *from,
 	filter.service = service;
 	filter.instance = instance;
 
-	xa_for_each(&nodes, node_idx, node) {
-		xa_for_each(&node->servers, srv_idx, srv) {
-			if (!server_match(srv, &filter))
-				continue;
+	xa_for_each(&endpoints, id, endpoint) {
+		struct qrtr_node *node;
+		unsigned long node_idx;
 
-			lookup_notify(from, srv, true);
+		xa_for_each(&endpoint->nodes, node_idx, node) {
+			unsigned long srv_idx;
+			struct qrtr_server *srv;
+
+			xa_for_each(&node->servers, srv_idx, srv) {
+				if (!server_match(srv, &filter))
+					continue;
+
+				lookup_notify(id, from, srv, true);
+			}
 		}
 	}
 
 	/* Empty notification, to indicate end of listing */
-	lookup_notify(from, NULL, true);
+	lookup_notify(0, from, NULL, true);
 
 	return 0;
 }
 
-static void ctrl_cmd_del_lookup(struct sockaddr_qrtr *from,
+static void ctrl_cmd_del_lookup(u32 endpoint_id, struct sockaddr_qrtr *from,
 				unsigned int service, unsigned int instance)
 {
 	struct qrtr_lookup *lookup;
@@ -595,6 +638,7 @@ static void qrtr_ns_worker(struct work_struct *work)
 	ssize_t msglen;
 	void *recv_buf;
 	struct kvec iv;
+	u8 control[32];
 	int ret;
 
 	msg.msg_name = (struct sockaddr *)&sq;
@@ -605,8 +649,12 @@ static void qrtr_ns_worker(struct work_struct *work)
 		return;
 
 	for (;;) {
+		u32 endpoint_id;
+
 		iv.iov_base = recv_buf;
 		iv.iov_len = recv_buf_size;
+		msg.msg_control = control;
+		msg.msg_controllen = sizeof(control);
 
 		msglen = kernel_recvmsg(qrtr_ns.sock, &msg, &iv, 1,
 					iv.iov_len, MSG_DONTWAIT);
@@ -619,6 +667,16 @@ static void qrtr_ns_worker(struct work_struct *work)
 			break;
 		}
 
+		/* AUX data is written direct into the control buffer */
+		msg.msg_control = control;
+		msg.msg_controllen = sizeof(control) - msg.msg_controllen;
+
+		ret = qrtr_msg_get_endpoint(&msg, &endpoint_id);
+		if (ret < 0) {
+			pr_err("error receiving endpoint id: %d\n", ret);
+			break;
+		}
+
 		if ((size_t)msglen < sizeof(pkt))
 			break;
 
@@ -632,25 +690,25 @@ static void qrtr_ns_worker(struct work_struct *work)
 		ret = 0;
 		switch (cmd) {
 		case QRTR_TYPE_HELLO:
-			ret = ctrl_cmd_hello(&sq);
+			ret = ctrl_cmd_hello(endpoint_id, &sq);
 			break;
 		case QRTR_TYPE_BYE:
-			ret = ctrl_cmd_bye(&sq);
+			ret = ctrl_cmd_bye(endpoint_id, &sq);
 			break;
 		case QRTR_TYPE_DEL_CLIENT:
-			ret = ctrl_cmd_del_client(&sq,
+			ret = ctrl_cmd_del_client(endpoint_id, &sq,
 					le32_to_cpu(pkt->client.node),
 					le32_to_cpu(pkt->client.port));
 			break;
 		case QRTR_TYPE_NEW_SERVER:
-			ret = ctrl_cmd_new_server(&sq,
+			ret = ctrl_cmd_new_server(endpoint_id, &sq,
 					le32_to_cpu(pkt->server.service),
 					le32_to_cpu(pkt->server.instance),
 					le32_to_cpu(pkt->server.node),
 					le32_to_cpu(pkt->server.port));
 			break;
 		case QRTR_TYPE_DEL_SERVER:
-			ret = ctrl_cmd_del_server(&sq,
+			ret = ctrl_cmd_del_server(endpoint_id, &sq,
 					 le32_to_cpu(pkt->server.service),
 					 le32_to_cpu(pkt->server.instance),
 					 le32_to_cpu(pkt->server.node),
@@ -661,12 +719,12 @@ static void qrtr_ns_worker(struct work_struct *work)
 		case QRTR_TYPE_RESUME_TX:
 			break;
 		case QRTR_TYPE_NEW_LOOKUP:
-			ret = ctrl_cmd_new_lookup(&sq,
+			ret = ctrl_cmd_new_lookup(endpoint_id, &sq,
 					 le32_to_cpu(pkt->server.service),
 					 le32_to_cpu(pkt->server.instance));
 			break;
 		case QRTR_TYPE_DEL_LOOKUP:
-			ctrl_cmd_del_lookup(&sq,
+			ctrl_cmd_del_lookup(endpoint_id, &sq,
 				    le32_to_cpu(pkt->server.service),
 				    le32_to_cpu(pkt->server.instance));
 			break;
@@ -700,6 +758,8 @@ int qrtr_ns_init(void)
 	if (ret < 0)
 		return ret;
 
+	qrtr_sock_set_report_endpoint(qrtr_ns.sock->sk);
+
 	ret = kernel_getsockname(qrtr_ns.sock, (struct sockaddr *)&sq);
 	if (ret < 0) {
 		pr_err("failed to get socket name\n");
@@ -727,7 +787,7 @@ int qrtr_ns_init(void)
 	qrtr_ns.bcast_sq.sq_node = QRTR_NODE_BCAST;
 	qrtr_ns.bcast_sq.sq_port = QRTR_PORT_CTRL;
 
-	ret = say_hello(&qrtr_ns.bcast_sq);
+	ret = say_hello(qrtr_ns.local_node, &qrtr_ns.bcast_sq);
 	if (ret < 0)
 		goto err_wq;
 
diff --git a/net/qrtr/qrtr.h b/net/qrtr/qrtr.h
index 22fcecbf8de2..b4f50336ae75 100644
--- a/net/qrtr/qrtr.h
+++ b/net/qrtr/qrtr.h
@@ -35,5 +35,6 @@ int qrtr_ns_init(void);
 void qrtr_ns_remove(void);
 
 int qrtr_msg_get_endpoint(struct msghdr *msg, u32 *out_endpoint_id);
+void qrtr_sock_set_report_endpoint(struct sock *sk);
 
 #endif
-- 
2.45.2


