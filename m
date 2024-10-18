Return-Path: <linux-arm-msm+bounces-34993-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 626009A45A8
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Oct 2024 20:21:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 910B61C215C5
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Oct 2024 18:21:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8FAC7205ABA;
	Fri, 18 Oct 2024 18:20:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NtyTox00"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-oo1-f47.google.com (mail-oo1-f47.google.com [209.85.161.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2D89204F7E;
	Fri, 18 Oct 2024 18:20:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729275618; cv=none; b=mR2nUj/FYecPe8+LgbSjN/ninHHNdnIr/aXodyufxR4kLabdBhXyyfwde0/rSvlISf01DWVGumMxfOhodtAd/pIYRWGV96DLZthHU0BB4fuzn9RwmwVTlK8mUSwKXA2UsAl1cG8KMP0hkZtY+cjDVcJ4MqLy7UNGPkomQRMX804=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729275618; c=relaxed/simple;
	bh=WudN9ftC6DeqlaCrwSUWzPCAN0Q9s+iy462O/XnUrdU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AyDTT6g4LjBnJXoobjgnU09LTnZxW4xKXbfHV5XuQYRe9m8q+7GSWpNrOzp7ucFeWCzzWpeAcjNX7tZG+VPqWNrtvQ8eDgzK+VAr50pEjVWFY1lI1R4mdlzzKfTeK3fuG4iQ4u1Xy/x+HEmwfzMM5JfsumfrmECLS7hGzpQl5ac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NtyTox00; arc=none smtp.client-ip=209.85.161.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oo1-f47.google.com with SMTP id 006d021491bc7-5eb8099f2e2so815337eaf.3;
        Fri, 18 Oct 2024 11:20:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729275615; x=1729880415; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=33FckhCRiLLoBZH7c4mWURCUmvTf+hn2g56oXXwJibo=;
        b=NtyTox0042+vaO6foqBp/QM+OSiO7FwrUklF6o94otzoW5QHML9Uw9ZXjbouSc4lQG
         xjgM5ECty2Tz6XR88gdNrBtZoDeAqqgDQ9/D/o7Oc/rfhZH6bo4ViED3eSuPTkYD2SQz
         ybWshcL2Y+l2zfgQKDxVcr9Kk49uqp91uZdCqJnuffq1zsbv/47y7ewcZRtZrZ6337Ix
         H0SpntncP5zcKyuAs10Kp/h9Cs4XtOnfRMv3KuiOjYy27hAIv0weBXbdK3J2nwD5CMoG
         ijDLDZiPOvAH1/e82AE39F/ZGEPtgntR4B0jFpR5QabqCW101Szp+houkt7j/tmJ3/MO
         1gzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729275615; x=1729880415;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=33FckhCRiLLoBZH7c4mWURCUmvTf+hn2g56oXXwJibo=;
        b=oA67Kfwjaf9vlVwNcjgBCgvrAq60tD2muiSHnu4CXkjXvz+ymxFdF0kwYueDbsi41o
         DmpVJ7raaJm4VWGPIO2t4EOsC92pprYSf8ep3jBLzVNjZkdh7WUOJfybovSXPNBoukd4
         Ax88krXtWE5xgj3jWMobu6wEzxjXRVxNVLePDRFa7mldohOcLhGncTBnre6o5HjnPCel
         UqRTdZeBaadXfkeGPSwRhqHX2PgTGEpuvviMmNa5eR4u66KoTt7bvyqUmgzpBiY32ACN
         g4uaKYgeB91gWBMwfPbdqi/d19lCoxQBFJUoOsOKloSOqGIiDIyaIImFkI+3Kl2Ec/9/
         5txg==
X-Forwarded-Encrypted: i=1; AJvYcCW619WKqyrkUfAulmOtECJZI+dkeQN7bf+/HIA5HUOvsd8OdS0+6EESxhR37qkdoIEy6csSdUNERbvjFsgf@vger.kernel.org, AJvYcCX67aESW8B8QD5Qr1x8wmZ75gJpnJojJE5lxj0HGqrhNq3a8JL0U5zrauvmeqEGmuZLIzO5V8JBqqZSGzhc@vger.kernel.org
X-Gm-Message-State: AOJu0YwsEwRsDHLl4FD2HGs2JRcuS6R3aZ24QjjOaa0WlITe+ukYJL9Z
	tO/VlrzNdIoNgZY3jAEO3mxgO9VZGvsW54z1uS/tMldVe76na4JsESNhYg==
X-Google-Smtp-Source: AGHT+IHyWOcgr4FWztL1ijnQ1zPOX+9VjBTxIsRdSUtYUaREeHMbbj4CLzZSuGU1zUiyi3qwWZiqZQ==
X-Received: by 2002:a05:6820:610:b0:5e7:caf5:ae1f with SMTP id 006d021491bc7-5eb8b36af65mr3052839eaf.2.1729275615643;
        Fri, 18 Oct 2024 11:20:15 -0700 (PDT)
Received: from localhost.localdomain (syn-070-114-247-242.res.spectrum.com. [70.114.247.242])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-5eb8aa2f668sm340542eaf.44.2024.10.18.11.20.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Oct 2024 11:20:15 -0700 (PDT)
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
Subject: [RFC PATCH v1 03/10] net: qrtr: support identical node ids
Date: Fri, 18 Oct 2024 13:18:21 -0500
Message-ID: <20241018181842.1368394-4-denkenz@gmail.com>
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

Add support for tracking multiple endpoints that may have conflicting
node identifiers. This is achieved by using both the node and endpoint
identifiers as the key inside the radix_tree data structure.

For backward compatibility with existing clients, the previous key
schema (node identifier only) is preserved. However, this schema will
only support the first endpoint/node combination.  This is acceptable
for legacy clients as support for multiple endpoints with conflicting
node identifiers was not previously possible.

Signed-off-by: Denis Kenzior <denkenz@gmail.com>
Reviewed-by: Marcel Holtmann <marcel@holtmann.org>
Reviewed-by: Andy Gross <agross@kernel.org>
---
 net/qrtr/af_qrtr.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/net/qrtr/af_qrtr.c b/net/qrtr/af_qrtr.c
index be275871fb2a..e83d491a8da9 100644
--- a/net/qrtr/af_qrtr.c
+++ b/net/qrtr/af_qrtr.c
@@ -418,12 +418,20 @@ static struct qrtr_node *qrtr_node_lookup(unsigned int nid)
 static void qrtr_node_assign(struct qrtr_node *node, unsigned int nid)
 {
 	unsigned long flags;
+	unsigned long key;
 
 	if (nid == QRTR_EP_NID_AUTO)
 		return;
 
 	spin_lock_irqsave(&qrtr_nodes_lock, flags);
-	radix_tree_insert(&qrtr_nodes, nid, node);
+
+	/* Always insert with the endpoint_id + node_id */
+	key = (unsigned long)node->ep->id << 32 | nid;
+	radix_tree_insert(&qrtr_nodes, key, node);
+
+	if (!radix_tree_lookup(&qrtr_nodes, nid))
+		radix_tree_insert(&qrtr_nodes, nid, node);
+
 	if (node->nid == QRTR_EP_NID_AUTO)
 		node->nid = nid;
 	spin_unlock_irqrestore(&qrtr_nodes_lock, flags);
-- 
2.45.2


