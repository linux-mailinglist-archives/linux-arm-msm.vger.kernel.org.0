Return-Path: <linux-arm-msm+bounces-65752-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DA5F2B0B197
	for <lists+linux-arm-msm@lfdr.de>; Sat, 19 Jul 2025 21:01:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 99761564A9A
	for <lists+linux-arm-msm@lfdr.de>; Sat, 19 Jul 2025 19:01:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5BE9228B511;
	Sat, 19 Jul 2025 18:59:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ionic.de header.i=@ionic.de header.b="rlf3mvdU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail.ionic.de (ionic.de [145.239.234.145])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DB0A28983B;
	Sat, 19 Jul 2025 18:59:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=145.239.234.145
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752951587; cv=none; b=oO9P67Fnj5ShYxqPUWsfCrNZ1wYCEOkSsBETv4bKAOfI3cOwg990HAHY2BLsvQ78MoP9L4nFHcM48PTAUMFqsBEH37/V+7/Wl4SatjUQh6RhVTVfPteDxISknefkra3fEnJuJSk3mjoUVfnJlYUCQZV7jSgenOCoYAIDzsn4/WM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752951587; c=relaxed/simple;
	bh=RVKKb4KW2UI7MlO5tYtSygFYLvgaUoidJffWP3Xl+74=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=l2IzHwCfNWEVctAWv4EZCt9kaXq32kpbTkeV7zGf1j4g0mxX7JM83hFPunMn+Do2UwsIkBLI8EIqxLiOeYwRxExOSKobL/+k7AGpse0lyLjUYFscL+U2RXn477hkw/3fpCJW+4wGPMXEmcrWWcD/8GMHG7wUMcrQHUeLh28VkCo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ionic.de; spf=pass smtp.mailfrom=ionic.de; dkim=pass (1024-bit key) header.d=ionic.de header.i=@ionic.de header.b=rlf3mvdU; arc=none smtp.client-ip=145.239.234.145
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ionic.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ionic.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ionic.de; s=default;
	t=1752951579; bh=RVKKb4KW2UI7MlO5tYtSygFYLvgaUoidJffWP3Xl+74=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=rlf3mvdUjTBL4yeQ3KhtHDBeXoJfk9/CXS23OX3JYV7toIPu3dXGFl/Cn43Iugd8O
	 cILy72j8AnkUXIqe5kG7SSdsUOYVInVTH+rZ1g5TfB72RQIpNm/1iKqUwUycMvamp/
	 Pv9NzAm9jjon7TUYRvn/creba36ddB75ArKqJG38=
Received: from grml.local.home.ionic.de (unknown [IPv6:2a00:11:fb41:7a00:21b:21ff:fe5e:dddc])
	by mail.ionic.de (Postfix) with ESMTPSA id E718914890D6;
	Sat, 19 Jul 2025 20:59:38 +0200 (CEST)
From: Mihai Moldovan <ionic@ionic.de>
To: linux-arm-msm@vger.kernel.org,
	Manivannan Sadhasivam <mani@kernel.org>
Cc: Denis Kenzior <denkenz@gmail.com>,
	Eric Dumazet <edumazet@google.com>,
	Kuniyuki Iwashima <kuniyu@google.com>,
	Paolo Abeni <pabeni@redhat.com>,
	Willem de Bruijn <willemb@google.com>,
	"David S . Miller" <davem@davemloft.net>,
	Jakub Kicinski <kuba@kernel.org>,
	Simon Horman <horms@kernel.org>,
	linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org
Subject: [PATCH v2 09/10] net: qrtr: ns: support multiple endpoints
Date: Sat, 19 Jul 2025 20:59:29 +0200
Message-ID: <0781b3d2293d05616f18b03439a08ae8612b2dbb.1752947108.git.ionic@ionic.de>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <cover.1752947108.git.ionic@ionic.de>
References: <cover.1752947108.git.ionic@ionic.de>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Denis Kenzior <denkenz@gmail.com>

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
Signed-off-by: Mihai Moldovan <ionic@ionic.de>

---

v2:
  - rebase against current master
  - drop socket locking from qrtr_sock_set_report_endpoint() as per
    review comment
---
 net/qrtr/af_qrtr.c |  12 ++
 net/qrtr/ns.c      | 296 +++++++++++++++++++++++++++------------------
 net/qrtr/qrtr.h    |   1 +
 3 files changed, 191 insertions(+), 118 deletions(-)

diff --git a/net/qrtr/af_qrtr.c b/net/qrtr/af_qrtr.c
index 53cdf7d70fbe..6ce2f87b7418 100644
--- a/net/qrtr/af_qrtr.c
+++ b/net/qrtr/af_qrtr.c
@@ -107,6 +107,13 @@ static inline struct qrtr_sock *qrtr_sk(struct sock *sk)
 	return container_of(sk, struct qrtr_sock, sk);
 }
 
+void qrtr_sock_set_report_endpoint(struct sock *sk)
+{
+	struct qrtr_sock *ipc = qrtr_sk(sk);
+
+	assign_bit(QRTR_F_REPORT_ENDPOINT, &ipc->flags, 1);
+}
+
 int qrtr_msg_get_endpoint(struct msghdr *msg, u32 *out_endpoint_id)
 {
 	struct cmsghdr *cmsg;
@@ -1092,6 +1099,11 @@ static int qrtr_sendmsg(struct socket *sock, struct msghdr *msg, size_t len)
 
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
index 2bcfe539dc3e..a84c286209d9 100644
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
 		if ((size_t)msglen < sizeof(*pkt))
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
2.50.0


