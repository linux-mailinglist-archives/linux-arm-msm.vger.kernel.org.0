Return-Path: <linux-arm-msm+bounces-34992-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DCDD9A45A5
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Oct 2024 20:20:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AD1371F23B74
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Oct 2024 18:20:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0F123204F8B;
	Fri, 18 Oct 2024 18:20:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="C0YBLrsg"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-oo1-f53.google.com (mail-oo1-f53.google.com [209.85.161.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 096E5204943;
	Fri, 18 Oct 2024 18:20:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729275616; cv=none; b=hjHewqzl1wAVye7UXI4b/B+Solhc8A0qp+pXnCDUpLQwYseLh2y90b75Gu9zUGmJeDN80L/Ui/WaxYti/ZVwA6QXUTTC1Dan1JwE7S5w9GvULjIlRVwfgV8SbBx9RPxyUWCa3Gz47gMYDCzXts2u5bfBrw77+CSJUBstt9aN1a8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729275616; c=relaxed/simple;
	bh=L23+6sq3kg2caMXWM/34FecMsesnc8/juvs69qPX+Wc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pr5QH3H7AaYplwWedEGek11h/rw7WajNlk5DOK8gzAoJmUzIawejyqaAROb8hil7HkiXOlTEsf21yGJ7Sz9A+WHQ8LtJOqN47AfgjLmJo0/t9BQuLTxPiTqGySrD8b7AlT9fu0/kgB7n0/dwQs4wTRSHqvuh7rWTPY6kGx7h9No=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=C0YBLrsg; arc=none smtp.client-ip=209.85.161.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oo1-f53.google.com with SMTP id 006d021491bc7-5e98bfea0ceso1184067eaf.0;
        Fri, 18 Oct 2024 11:20:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729275614; x=1729880414; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ciGorupT18JNvO1t/IWulr06C4PqVaO5+ZCUGfEvvMY=;
        b=C0YBLrsgjRHAzSNX7BNuuLPcCQgxC7D2qKvR//STtIqvUFiFFT1qu7enHrZB4GN9HH
         8WKuNnJlBN0jmqRPK07BoQQ+Rpn8AluLl3xmgJh6dz8jyiZIc5P3bCgj/VTy6TdIkHRZ
         reObXfldalm7NQsryyaUOKUcf+3H5bhGQ9c91DyxUdpM5Pg1xDw2Qc+/kIZvzC8Uo2oa
         a+mh/CH7nOEztN0tN2X0NsPz3/sQPR1czYg2FpKssdMvs2BhAtut4XFRGj1g3gUM7Mf+
         s07ZlwwpuxiLds8l20II4mH4WZwHHJoFChvp4mQxP5JNnKm3J/H+LUYZ5viNL/5tQU/t
         HdEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729275614; x=1729880414;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ciGorupT18JNvO1t/IWulr06C4PqVaO5+ZCUGfEvvMY=;
        b=oKMQZSvcE7ATCW7Ub4G8q+jfDNBnDiDHhsFMauAfTfVIAuCi06o7YPbkLGBD8Ou7sx
         BdwrRQrjLZQ/irf2HtC02MumbUbzuIXWCtY41zmY5+RztLFtC0HwhSz1ADgSVZWshxR/
         hHIKycO/yEmvNUbKA1SP4i16fix7tCs7lZSDzkURciuLPMP+K04LlmOp9+5WAJwDwd66
         kDsSfV4YVyL3kR/Jkue2z/BC6FwQxP5uKwe8PJKz2R+C/ZEBl7/b5yzofKyK/Awj61S2
         sBBPlz6BgABQLYOHLv2KW8DYkhTfDVyrp/OX9QpNHuQZpP5TJ531VuFf5yIW3NQJfEc7
         AL9g==
X-Forwarded-Encrypted: i=1; AJvYcCUlBD6ATS+Q/O2Cs1DdF+yJXfakDNTHQANS6ycrsx/IMPpEZYhJIsqoalbrNJ/IJqqjfH3Mf+ylMsD4YLDU@vger.kernel.org, AJvYcCV55SimWijPjGEXuPQ6llaon265nq/4T3zGIsZIGsyZV1vsTehon/kiWSJMZyE3FTXvzo/vLbPO8LUygnd8@vger.kernel.org
X-Gm-Message-State: AOJu0Yx3viNCVFEV65l7vrI0iknk0LeHpt0BYOIbxQxgS17b10VBuA5C
	VGE4vQSW/mBdVy/PXyuu3LFUFKbEaRfaHuYQMGfzbNnFHFrNqszghditTQ==
X-Google-Smtp-Source: AGHT+IFxbvRld1RRNMrjrSm2ZDFOtSkV02aoSNPU9/ci9YDUhC+qPIG7yGGbRPaWILoI0c4aqrYX/g==
X-Received: by 2002:a05:6820:160d:b0:5e1:e87d:9e75 with SMTP id 006d021491bc7-5eb8b7970b8mr2674476eaf.5.1729275613871;
        Fri, 18 Oct 2024 11:20:13 -0700 (PDT)
Received: from localhost.localdomain (syn-070-114-247-242.res.spectrum.com. [70.114.247.242])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-5eb8aa2f668sm340542eaf.44.2024.10.18.11.20.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Oct 2024 11:20:13 -0700 (PDT)
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
Subject: [RFC PATCH v1 02/10] net: qrtr: allocate and track endpoint ids
Date: Fri, 18 Oct 2024 13:18:20 -0500
Message-ID: <20241018181842.1368394-3-denkenz@gmail.com>
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

Currently, QRTR endpoints are tracked solely by their pointer value,
which is sufficient as they are not exposed to user space and it is
assumed that each endpoint has a unique set of node identifiers
associated with it.  However, this assumption does not hold when
multiple devices of the same type are connected to the system.  For
example, multiple PCIe based 5G modems.  Such a setup results in
multiple endpoints with confliciting node identifiers.

To enable support for such scenarios, introduce the ability to track
and assign unique identifiers to QRTR endpoints. These identifiers
can then be exposed to user space, allowing for userspace clients to
identify which endpoint sent a given message, or to direct a message
to a specific endpoint.

A simple allocation strategy is used based on xa_alloc_cyclic.  Remote
endpoint ids start at 'qrtr_local_nid' + 1.  Since qrtr_local_nid is
currently always set to 1 and never changed, node identifiers start at
'1' for the local endpoint and 2..INT_MAX for remote endpoints.

Signed-off-by: Denis Kenzior <denkenz@gmail.com>
Reviewed-by: Marcel Holtmann <marcel@holtmann.org>
Reviewed-by: Andy Gross <agross@kernel.org>
---
 net/qrtr/af_qrtr.c | 24 ++++++++++++++++++++++++
 net/qrtr/qrtr.h    |  1 +
 2 files changed, 25 insertions(+)

diff --git a/net/qrtr/af_qrtr.c b/net/qrtr/af_qrtr.c
index 00c51cf693f3..be275871fb2a 100644
--- a/net/qrtr/af_qrtr.c
+++ b/net/qrtr/af_qrtr.c
@@ -22,6 +22,7 @@
 #define QRTR_MAX_EPH_SOCKET 0x7fff
 #define QRTR_EPH_PORT_RANGE \
 		XA_LIMIT(QRTR_MIN_EPH_SOCKET, QRTR_MAX_EPH_SOCKET)
+#define QRTR_ENDPOINT_RANGE XA_LIMIT(qrtr_local_nid + 1, INT_MAX)
 
 #define QRTR_PORT_CTRL_LEGACY 0xffff
 
@@ -109,6 +110,10 @@ static LIST_HEAD(qrtr_all_nodes);
 /* lock for qrtr_all_nodes and node reference */
 static DEFINE_MUTEX(qrtr_node_lock);
 
+/* endpoint id allocation management */
+static DEFINE_XARRAY_ALLOC(qrtr_endpoints);
+static u32 next_endpoint_id;
+
 /* local port allocation management */
 static DEFINE_XARRAY_ALLOC(qrtr_ports);
 
@@ -585,6 +590,8 @@ static struct sk_buff *qrtr_alloc_ctrl_packet(struct qrtr_ctrl_pkt **pkt,
 int qrtr_endpoint_register(struct qrtr_endpoint *ep, unsigned int nid)
 {
 	struct qrtr_node *node;
+	u32 endpoint_id;
+	int rc;
 
 	if (!ep || !ep->xmit)
 		return -EINVAL;
@@ -593,6 +600,13 @@ int qrtr_endpoint_register(struct qrtr_endpoint *ep, unsigned int nid)
 	if (!node)
 		return -ENOMEM;
 
+	rc = xa_alloc_cyclic(&qrtr_endpoints, &endpoint_id, NULL,
+			     QRTR_ENDPOINT_RANGE, &next_endpoint_id,
+			     GFP_KERNEL);
+
+	if (rc < 0)
+		goto free_node;
+
 	kref_init(&node->ref);
 	mutex_init(&node->ep_lock);
 	skb_queue_head_init(&node->rx_queue);
@@ -608,8 +622,12 @@ int qrtr_endpoint_register(struct qrtr_endpoint *ep, unsigned int nid)
 	list_add(&node->item, &qrtr_all_nodes);
 	mutex_unlock(&qrtr_node_lock);
 	ep->node = node;
+	ep->id = endpoint_id;
 
 	return 0;
+free_node:
+	kfree(node);
+	return rc;
 }
 EXPORT_SYMBOL_GPL(qrtr_endpoint_register);
 
@@ -628,8 +646,10 @@ void qrtr_endpoint_unregister(struct qrtr_endpoint *ep)
 	struct sk_buff *skb;
 	unsigned long flags;
 	void __rcu **slot;
+	u32 endpoint_id;
 
 	mutex_lock(&node->ep_lock);
+	endpoint_id = node->ep->id;
 	node->ep = NULL;
 	mutex_unlock(&node->ep_lock);
 
@@ -656,6 +676,10 @@ void qrtr_endpoint_unregister(struct qrtr_endpoint *ep)
 	mutex_unlock(&node->qrtr_tx_lock);
 
 	qrtr_node_release(node);
+
+	xa_erase(&qrtr_endpoints, endpoint_id);
+
+	ep->id = 0;
 	ep->node = NULL;
 }
 EXPORT_SYMBOL_GPL(qrtr_endpoint_unregister);
diff --git a/net/qrtr/qrtr.h b/net/qrtr/qrtr.h
index 3f2d28696062..11b897af05e6 100644
--- a/net/qrtr/qrtr.h
+++ b/net/qrtr/qrtr.h
@@ -21,6 +21,7 @@ struct qrtr_endpoint {
 	int (*xmit)(struct qrtr_endpoint *ep, struct sk_buff *skb);
 	/* private: not for endpoint use */
 	struct qrtr_node *node;
+	u32 id;
 };
 
 int qrtr_endpoint_register(struct qrtr_endpoint *ep, unsigned int nid);
-- 
2.45.2


