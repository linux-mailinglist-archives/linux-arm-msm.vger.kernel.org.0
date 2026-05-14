Return-Path: <linux-arm-msm+bounces-107675-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6IoOLuXvBWpWdgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107675-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 May 2026 17:53:09 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 38AFA54451E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 May 2026 17:53:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 7096B301DEC0
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 May 2026 15:51:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C448C31B11E;
	Thu, 14 May 2026 15:51:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XSrGnd1c";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eSjNzVxy"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 790503F4133
	for <linux-arm-msm@vger.kernel.org>; Thu, 14 May 2026 15:51:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778773877; cv=none; b=erne/uVIldlo4wpfcdkcAzkNL8ZtkkvY4fA5lJDEVY+hifvJCzGTPvFimA2KC6gIe7qkSLDLRR9EIBGxuXSD59IAuzCpLX53U/ruqGoYCyF0+skxHBJ9D8YaRwaYnBmX9iqIo9DUZPrgqGEg5mhj3nfoJMMGzwaCRaFC2HzSx0k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778773877; c=relaxed/simple;
	bh=sw65wg/gLObwIYJeE44DoHEjbavZZQqBt5qYGDc9Jx0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=i8XXvZThRY21WLRWNoWXGfB0TD9nlwsu7n4SN5D8Hu/1pG9xL3azyJxMUSK5Vb7nOiEbDM4BZudSlNnFE41fyiPYjxLx2Cp9zHjbc//Zp2JFqF1Iq+Vrzdup7YtbLXf7CHQUHngi9dkYHYR8bGiVK8YmeEgSUvJOYRH3LX3Y7yM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XSrGnd1c; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eSjNzVxy; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64EBeUer3061899
	for <linux-arm-msm@vger.kernel.org>; Thu, 14 May 2026 15:51:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=LLMRt9m1xYG
	D32un0pFlcXHxQno0LK7UKUpMQvEbLio=; b=XSrGnd1cg37Dy8h6AmTPM4EGd7g
	9YdEPvKat6xdhYCQVJYGfSTsYiiaX1gjPUqdZfcC9KexRqjgSr45OodTaEjjxfd/
	LXyF2Q3yXW2tIpqJEuLvxMBr6Ht4vuvlom3XW4Vu9fa81EzTEPCSK08mWYCXeWGp
	BI7u3p0p1E6sSjJaStnI/T66zD84Y1aYgd9M8OXXCaI45DT4EHY9KIHRGgvJdt0A
	0NFa1WjqWwMa1D3f3d8ZnU8fopd82zbc/Ygcz4wmSyBflQSAUrzyM1K93Mfh1Vbt
	iHGWmkO4wLhvfniZrTLlLscGXxpJhUitLA8k1S/0Oe1lk2OKLrgYMbNYfwg==
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com [209.85.222.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e554aart4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 14 May 2026 15:51:05 +0000 (GMT)
Received: by mail-ua1-f69.google.com with SMTP id a1e0cc1a2514c-950c363a552so4476549241.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 14 May 2026 08:51:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778773865; x=1779378665; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LLMRt9m1xYGD32un0pFlcXHxQno0LK7UKUpMQvEbLio=;
        b=eSjNzVxyD1aOEeZlbQtEVrOPaN6KPvPYFJkL/Hfplc7+dIqUZmBoDtlZYLLEqTHo+u
         SMlRWNC56PeWS5Lxz/Y+yPtEt5Q3JDEax7Z6j3SGEd5s+jNl/YeXL1UiBRZaa/xHhYjZ
         jQBfVgYbzgnanvAiKfoJ/5wA2ciAEXNhVwlceo8VXnmou8sxdeNZFq7iR9yqbqW0W6SM
         qKPh4GZoh9SNVSBlhJcSpG8npauMs6XxTbdZy7LgKgC9LEZwx44ZovxCLgr42TQywKvM
         PvN3la/pmV3YqZYOheXNBTGMqhXEi+VPotqC3P4rLJdaoAbb2kkIyEoaYg1TE2aeiLiG
         BPjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778773865; x=1779378665;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=LLMRt9m1xYGD32un0pFlcXHxQno0LK7UKUpMQvEbLio=;
        b=kTdPTeIH1vAq1zT+uBsJ4LrYYPl6Hqi6Km33mnm7/iU5MoE7W4iGmHgDyRNqz1nVuM
         FsIukSWTn2HAv7YvF7iN371erP8Vg+e613g48MhQIGDH6tWNOHtvSokRHc8XQog0Jcp5
         LTddijCNSOpGlApdcubgmrOjTFf6Qm5edH4mEunUrPPcOWZrlQJdbu5weleFnjuS34Dg
         hOYpRBMpSqeMYEUEXXEN3hCloYaQv1y6N2rSPIxIJ/pRFklc123l+ULGfgHYoS+4aLpM
         ltYq7FCgXHLzFNQPP9ppqTpz86HiIdtb9IbDIKRD7BE97xLpGYV517v2Dl/8t+ITZAig
         IxZQ==
X-Forwarded-Encrypted: i=1; AFNElJ98kiySkGkMw5kf2AV+43XzoMuCiQrMSuwdUBX/vQc6LGtpovrLHgLsdyZyPnhwLdGEc/Cj/0+Wt+nPzD4n@vger.kernel.org
X-Gm-Message-State: AOJu0Yyi+lXiLwloDJOSP2zqfflrrxsjyK3srFpdCGF0deAtwHYRQsP0
	OiIWGwCDQRknBvQqtTxTqLZ4xZBTwcm4InEgzlW3eD0e+jUQUIXP75nAxfAR+pgNUtWnWY8d4cA
	qLYu15zw7du5Aev8E2kVujjczAVAwdf507O/mz2/0EYfqX5DzbOrQHsgTLvYI1YNrTNk7
X-Gm-Gg: Acq92OHK8b8uFwRPAc8ccISlSwes1p41Y2Zjmu1vijCvwivHwEYefX/lI2LTDUxS3mm
	Tbgs88+h0gkBywTBXdAcf2foylKbM0FCyJsEHsMMi670KDJkzq1s1geNuHeNNXdZk5jZXIx2hT2
	owmLT7kimx3GkfKrJ78vBddiC81++g3NLeZQTYXxbQwjOupTGVa6FWAgIEPpZhu9RrdOUtuojph
	b7wa+FXNcloJnTnyiL6WKk62iyxhrBzkRGKUgfIPQCtaYCQE1snABsWU/L0uyo2mOf/Z5aCT64J
	RT5Etn2s9ZBKFbyOg++/hLUXDy+/f8EXk/9rorLl+uZH2bXOpR0xFCXkhoMo6DV8zEu1sOaonLU
	dTcu07T10qkvcgoaV8vxhmEUsWyvYXhbbwhECNUu2miO1bAcN3Ad9olQ=
X-Received: by 2002:a05:6102:605c:b0:604:f849:462e with SMTP id ada2fe7eead31-63774129752mr3880609137.25.1778773864427;
        Thu, 14 May 2026 08:51:04 -0700 (PDT)
X-Received: by 2002:a05:6102:605c:b0:604:f849:462e with SMTP id ada2fe7eead31-63774129752mr3880558137.25.1778773863721;
        Thu, 14 May 2026 08:51:03 -0700 (PDT)
Received: from localhost.localdomain ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45da15a666fsm6967067f8f.36.2026.05.14.08.51.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 May 2026 08:51:03 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: andersson@kernel.org
Cc: srini@kernel.org, konradybcio@kernel.org, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH 3/3] soc: qcom: apr: Process RX messages using per-service work items
Date: Thu, 14 May 2026 15:50:51 +0000
Message-ID: <20260514155051.2593354-4-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260514155051.2593354-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20260514155051.2593354-1-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: D0nvxY27orItRVjPXIAfSXZ4mwzIzALJ
X-Authority-Analysis: v=2.4 cv=Wag8rUhX c=1 sm=1 tr=0 ts=6a05ef69 cx=c_pps
 a=UbhLPJ621ZpgOD2l3yZY1w==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=Myf5NQMlE0kz4Lw5rJwA:9 a=TOPH6uDL9cOC6tEoww4z:22
X-Proofpoint-ORIG-GUID: D0nvxY27orItRVjPXIAfSXZ4mwzIzALJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE0MDE2MCBTYWx0ZWRfX1iuw/loAXKE/
 pjBPRqfeKfTN/GRi4dCY7EH5W8RfwDr0CilGcxQnZj/q/BapTZevfjIfIOfLnh8lNYxBxdfO+p3
 mt2WQkrlYnurq5fSsIsbg7qvmJ/b9aF3efAB1Bl6SexSBZsWm38XNL8lbxTHW5yLIaWFaWhiICt
 bd+09Ltj2dN00ExIb80764LTmABNXtycv87nqn7WqOrgIGk3FsXspxBnJCjSYqADOgV9g3dZNIO
 7MFyoVZfV1yCzbMZqmTXmK2lRyRwaaGAdfTmPtYDB7QhklCHbccI/lTEAuE/VgASpMlKIBiOlUs
 aHZuDVC/cqMtitw4rPP/jRlZBSTO0mrLwoBGKwHh3ifi33lUK6O4gU9MZzhJNZupG/ovwK4+QQH
 ZSdA+xohULLOTEN53hghxdug80ii9ipkZjE4o2m8L2h8uLvuPx9MFkCesd7UGWzHzSklwdjm+Xo
 /F9lupEURKshLniyekw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-14_04,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 spamscore=0 bulkscore=0 impostorscore=0
 lowpriorityscore=0 clxscore=1015 phishscore=0 priorityscore=1501
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605050000
 definitions=main-2605140160
X-Rspamd-Queue-Id: 38AFA54451E
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-107675-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[srinivas.kandagatla@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim];
	RCPT_COUNT_SEVEN(0.00)[7];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

The APR transport currently serializes all incoming packets through a
single work item and a global RX queue. If one service callback blocks
or takes a long time to complete, packet processing for all other
services is delayed.

Move RX buffering and work items from the packet router to each
individual service. Incoming packets are queued on a per-service list
and processed by that service's work item, allowing unrelated services
to make progress independently while preserving message ordering within
each service.

Since queued packets may outlive service removal, add a reference count
to keep the service object alive until all queued packets have been
processed, and reject new packets once the service begins shutting down.

Switch the shared APR workqueue to an unbound reclaim workqueue so that
multiple services can process packets in parallel.

This also addresses the random CMD timeouts seen with audio commands
that are sent to DSP which timeout on the response as they are waiting in
the queue for other commands to finish.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 drivers/soc/qcom/apr.c       | 265 +++++++++++++++++++++++------------
 include/linux/soc/qcom/apr.h |   6 +
 2 files changed, 185 insertions(+), 86 deletions(-)

diff --git a/drivers/soc/qcom/apr.c b/drivers/soc/qcom/apr.c
index 68b357462438..f25219b48cdc 100644
--- a/drivers/soc/qcom/apr.c
+++ b/drivers/soc/qcom/apr.c
@@ -28,14 +28,11 @@ struct packet_router {
 	struct rpmsg_endpoint *ch;
 	struct device *dev;
 	spinlock_t svcs_lock;
-	spinlock_t rx_lock;
 	struct idr svcs_idr;
 	int dest_domain_id;
 	int type;
 	struct pdr_handle *pdr;
 	struct workqueue_struct *rxwq;
-	struct work_struct rx_work;
-	struct list_head rx_list;
 };
 
 struct apr_rx_buf {
@@ -74,54 +71,58 @@ int apr_send_pkt(struct apr_device *adev, struct apr_pkt *pkt)
 }
 EXPORT_SYMBOL_GPL(apr_send_pkt);
 
-void gpr_free_port(gpr_port_t *port)
+static void apr_svc_release(struct kref *ref)
 {
-	struct packet_router *gpr = port->pr;
-	unsigned long flags;
+	struct pkt_router_svc *svc;
 
-	spin_lock_irqsave(&gpr->svcs_lock, flags);
-	idr_remove(&gpr->svcs_idr, port->id);
-	spin_unlock_irqrestore(&gpr->svcs_lock, flags);
+	svc = container_of(ref, struct pkt_router_svc, refcount);
 
-	kfree(port);
+	if (svc->dynamic_svc)
+		kfree(svc);
 }
-EXPORT_SYMBOL_GPL(gpr_free_port);
 
-gpr_port_t *gpr_alloc_port(struct apr_device *gdev, struct device *dev,
-				gpr_port_cb cb,	void *priv)
+static void apr_svc_get(struct pkt_router_svc *svc)
 {
-	struct packet_router *pr = dev_get_drvdata(gdev->dev.parent);
-	gpr_port_t *port;
-	struct pkt_router_svc *svc;
-	int id;
+	kref_get(&svc->refcount);
+}
 
-	port = kzalloc_obj(*port);
-	if (!port)
-		return ERR_PTR(-ENOMEM);
+static void apr_svc_put(struct pkt_router_svc *svc)
+{
+	kref_put(&svc->refcount, apr_svc_release);
+}
 
-	svc = port;
-	svc->callback = cb;
-	svc->pr = pr;
-	svc->priv = priv;
-	svc->dev = dev;
-	spin_lock_init(&svc->lock);
+static void apr_svc_purge_rx(struct pkt_router_svc *svc)
+{
+	struct apr_rx_buf *abuf, *tmp;
+	unsigned long flags;
 
-	spin_lock(&pr->svcs_lock);
-	id = idr_alloc_cyclic(&pr->svcs_idr, svc, GPR_DYNAMIC_PORT_START,
-			      GPR_DYNAMIC_PORT_END, GFP_ATOMIC);
-	if (id < 0) {
-		dev_err(dev, "Unable to allocate dynamic GPR src port\n");
-		kfree(port);
-		spin_unlock(&pr->svcs_lock);
-		return ERR_PTR(id);
+	spin_lock_irqsave(&svc->lock, flags);
+	list_for_each_entry_safe(abuf, tmp, &svc->rx_list, node) {
+		list_del(&abuf->node);
+		kfree(abuf);
+		apr_svc_put(svc);
 	}
+	spin_unlock_irqrestore(&svc->lock, flags);
+}
 
-	svc->id = id;
-	spin_unlock(&pr->svcs_lock);
+void gpr_free_port(gpr_port_t *port)
+{
+	struct packet_router *gpr = port->pr;
+	unsigned long flags;
 
-	return port;
+	spin_lock_irqsave(&port->lock, flags);
+	port->dying = true;
+	spin_unlock_irqrestore(&port->lock, flags);
+
+	spin_lock_irqsave(&gpr->svcs_lock, flags);
+	idr_remove(&gpr->svcs_idr, port->id);
+	spin_unlock_irqrestore(&gpr->svcs_lock, flags);
+
+	cancel_work_sync(&port->rx_work);
+	apr_svc_purge_rx(port);
+	apr_svc_put(port);
 }
-EXPORT_SYMBOL_GPL(gpr_alloc_port);
+EXPORT_SYMBOL_GPL(gpr_free_port);
 
 static int pkt_router_send_svc_pkt(struct pkt_router_svc *svc, const struct gpr_pkt *pkt)
 {
@@ -155,15 +156,53 @@ static void apr_dev_release(struct device *dev)
 {
 	struct apr_device *adev = to_apr_device(dev);
 
+	cancel_work_sync(&adev->svc.rx_work);
+	apr_svc_purge_rx(&adev->svc);
+	apr_svc_put(&adev->svc);
 	kfree(adev);
 }
 
+static struct pkt_router_svc *apr_find_svc(struct packet_router *apr, void *buf)
+{
+	struct pkt_router_svc *svc;
+	unsigned long flags;
+	uint32_t svc_id;
+	struct apr_hdr *ahdr;
+	struct gpr_hdr *ghdr;
+
+	switch (apr->type) {
+	case PR_TYPE_APR:
+		ahdr = buf;
+		svc_id = ahdr->dest_svc;
+		break;
+	case PR_TYPE_GPR:
+		ghdr = buf;
+		svc_id = ghdr->dest_port;
+		break;
+	default:
+		dev_err(apr->dev, "Invalid Packet Router\n");
+		return NULL;
+	}
+
+	spin_lock_irqsave(&apr->svcs_lock, flags);
+	svc = idr_find(&apr->svcs_idr, svc_id);
+	if (svc)
+		apr_svc_get(svc);
+	spin_unlock_irqrestore(&apr->svcs_lock, flags);
+
+	if (!svc)
+		dev_err(apr->dev, "APR: service is not registered (%d)\n", svc_id);
+
+	return svc;
+}
+
 static int apr_callback(struct rpmsg_device *rpdev, void *buf,
 				  int len, void *priv, u32 addr)
 {
 	struct packet_router *apr = dev_get_drvdata(&rpdev->dev);
 	struct apr_rx_buf *abuf;
 	unsigned long flags;
+	struct pkt_router_svc *svc;
 
 	switch (apr->type) {
 	case PR_TYPE_APR:
@@ -189,24 +228,35 @@ static int apr_callback(struct rpmsg_device *rpdev, void *buf,
 	abuf->len = len;
 	memcpy(abuf->buf, buf, len);
 
-	spin_lock_irqsave(&apr->rx_lock, flags);
-	list_add_tail(&abuf->node, &apr->rx_list);
-	spin_unlock_irqrestore(&apr->rx_lock, flags);
+	svc = apr_find_svc(apr, buf);
+	if (!svc) {
+		kfree(abuf);
+		return 0;
+	}
+
+	spin_lock_irqsave(&svc->lock, flags);
+	if (svc->dying) {
+		spin_unlock_irqrestore(&svc->lock, flags);
+		kfree(abuf);
+		apr_svc_put(svc);
+		return 0;
+	}
+
+	list_add_tail(&abuf->node, &svc->rx_list);
+	spin_unlock_irqrestore(&svc->lock, flags);
 
-	queue_work(apr->rxwq, &apr->rx_work);
+	queue_work(apr->rxwq, &svc->rx_work);
 
 	return 0;
 }
 
-static int apr_do_rx_callback(struct packet_router *apr, struct apr_rx_buf *abuf)
+static int apr_do_rx_callback(struct pkt_router_svc *svc, struct apr_rx_buf *abuf)
 {
-	uint16_t hdr_size, msg_type, ver, svc_id;
-	struct pkt_router_svc *svc;
-	struct apr_device *adev;
+	uint16_t hdr_size, msg_type, ver;
+	struct apr_device *adev = NULL;
 	struct apr_driver *adrv = NULL;
 	struct apr_resp_pkt resp;
 	struct apr_hdr *hdr;
-	unsigned long flags;
 	void *buf = abuf->buf;
 	int len = abuf->len;
 
@@ -217,18 +267,18 @@ static int apr_do_rx_callback(struct packet_router *apr, struct apr_rx_buf *abuf
 
 	hdr_size = APR_HDR_FIELD_SIZE_BYTES(hdr->hdr_field);
 	if (hdr_size < APR_HDR_SIZE) {
-		dev_err(apr->dev, "APR: Wrong hdr size:%d\n", hdr_size);
+		dev_err(svc->dev, "APR: Wrong hdr size:%d\n", hdr_size);
 		return -EINVAL;
 	}
 
 	if (hdr->pkt_size < APR_HDR_SIZE || hdr->pkt_size != len) {
-		dev_err(apr->dev, "APR: Wrong packet size\n");
+		dev_err(svc->dev, "APR: Wrong packet size\n");
 		return -EINVAL;
 	}
 
 	msg_type = APR_HDR_FIELD_MT(hdr->hdr_field);
 	if (msg_type >= APR_MSG_TYPE_MAX) {
-		dev_err(apr->dev, "APR: Wrong message type: %d\n", msg_type);
+		dev_err(svc->dev, "APR: Wrong message type: %d\n", msg_type);
 		return -EINVAL;
 	}
 
@@ -236,22 +286,17 @@ static int apr_do_rx_callback(struct packet_router *apr, struct apr_rx_buf *abuf
 			hdr->dest_domain >= APR_DOMAIN_MAX ||
 			hdr->src_svc >= APR_SVC_MAX ||
 			hdr->dest_svc >= APR_SVC_MAX) {
-		dev_err(apr->dev, "APR: Wrong APR header\n");
+		dev_err(svc->dev, "APR: Wrong APR header\n");
 		return -EINVAL;
 	}
 
-	svc_id = hdr->dest_svc;
-	spin_lock_irqsave(&apr->svcs_lock, flags);
-	svc = idr_find(&apr->svcs_idr, svc_id);
 	if (svc && svc->dev->driver) {
 		adev = svc_to_apr_device(svc);
 		adrv = to_apr_driver(adev->dev.driver);
 	}
-	spin_unlock_irqrestore(&apr->svcs_lock, flags);
 
 	if (!adrv || !adev) {
-		dev_err(apr->dev, "APR: service is not registered (%d)\n",
-			svc_id);
+		dev_err(svc->dev, "APR: service device not found\n");
 		return -EINVAL;
 	}
 
@@ -270,13 +315,11 @@ static int apr_do_rx_callback(struct packet_router *apr, struct apr_rx_buf *abuf
 	return 0;
 }
 
-static int gpr_do_rx_callback(struct packet_router *gpr, struct apr_rx_buf *abuf)
+static int gpr_do_rx_callback(struct pkt_router_svc *svc, struct apr_rx_buf *abuf)
 {
 	uint16_t hdr_size, ver;
-	struct pkt_router_svc *svc = NULL;
 	struct gpr_resp_pkt resp;
 	struct gpr_hdr *hdr;
-	unsigned long flags;
 	void *buf = abuf->buf;
 	int len = abuf->len;
 
@@ -287,12 +330,12 @@ static int gpr_do_rx_callback(struct packet_router *gpr, struct apr_rx_buf *abuf
 
 	hdr_size = hdr->hdr_size;
 	if (hdr_size < GPR_PKT_HEADER_WORD_SIZE) {
-		dev_err(gpr->dev, "GPR: Wrong hdr size:%d\n", hdr_size);
+		dev_err(svc->dev, "GPR: Wrong hdr size:%d\n", hdr_size);
 		return -EINVAL;
 	}
 
 	if (hdr->pkt_size < GPR_PKT_HEADER_BYTE_SIZE || hdr->pkt_size != len) {
-		dev_err(gpr->dev, "GPR: Wrong packet size\n");
+		dev_err(svc->dev, "GPR: Wrong packet size\n");
 		return -EINVAL;
 	}
 
@@ -306,49 +349,91 @@ static int gpr_do_rx_callback(struct packet_router *gpr, struct apr_rx_buf *abuf
 	if (resp.payload_size > 0)
 		resp.payload = buf + (hdr_size *  4);
 
-
-	spin_lock_irqsave(&gpr->svcs_lock, flags);
-	svc = idr_find(&gpr->svcs_idr, hdr->dest_port);
-	spin_unlock_irqrestore(&gpr->svcs_lock, flags);
-
-	if (!svc) {
-		dev_err(gpr->dev, "GPR: Port(%x) is not registered\n",
-			hdr->dest_port);
-		return -EINVAL;
-	}
-
 	if (svc->callback)
 		svc->callback(&resp, svc->priv, 0);
 
 	return 0;
 }
 
-static void apr_rxwq(struct work_struct *work)
+static void apr_service_rxwq(struct work_struct *work)
 {
-	struct packet_router *apr = container_of(work, struct packet_router, rx_work);
+	struct pkt_router_svc *svc = container_of(work, struct pkt_router_svc, rx_work);
+	struct packet_router *apr = svc->pr;
 	struct apr_rx_buf *abuf, *b;
 	unsigned long flags;
 
-	if (!list_empty(&apr->rx_list)) {
-		list_for_each_entry_safe(abuf, b, &apr->rx_list, node) {
+	for (;;) {
+		LIST_HEAD(local);
+
+		spin_lock_irqsave(&svc->lock, flags);
+		if (list_empty(&svc->rx_list)) {
+			spin_unlock_irqrestore(&svc->lock, flags);
+			break;
+		}
+
+		list_splice_init(&svc->rx_list, &local);
+		spin_unlock_irqrestore(&svc->lock, flags);
+
+		list_for_each_entry_safe(abuf, b, &local, node) {
 			switch (apr->type) {
 			case PR_TYPE_APR:
-				apr_do_rx_callback(apr, abuf);
+				apr_do_rx_callback(svc, abuf);
 				break;
 			case PR_TYPE_GPR:
-				gpr_do_rx_callback(apr, abuf);
+				gpr_do_rx_callback(svc, abuf);
 				break;
 			default:
 				break;
 			}
-			spin_lock_irqsave(&apr->rx_lock, flags);
+			apr_svc_put(svc);
 			list_del(&abuf->node);
-			spin_unlock_irqrestore(&apr->rx_lock, flags);
 			kfree(abuf);
 		}
 	}
 }
 
+gpr_port_t *gpr_alloc_port(struct apr_device *gdev, struct device *dev,
+				gpr_port_cb cb,	void *priv)
+{
+	struct packet_router *pr = dev_get_drvdata(gdev->dev.parent);
+	gpr_port_t *port;
+	struct pkt_router_svc *svc;
+	int id;
+
+	port = kzalloc_obj(*port);
+	if (!port)
+		return ERR_PTR(-ENOMEM);
+
+	svc = port;
+	svc->callback = cb;
+	svc->pr = pr;
+	svc->priv = priv;
+	svc->dying = false;
+	svc->dynamic_svc = true;
+	svc->dev = dev;
+	spin_lock_init(&svc->lock);
+
+	INIT_WORK(&svc->rx_work, apr_service_rxwq);
+	INIT_LIST_HEAD(&svc->rx_list);
+	kref_init(&svc->refcount);
+
+	spin_lock(&pr->svcs_lock);
+	id = idr_alloc_cyclic(&pr->svcs_idr, svc, GPR_DYNAMIC_PORT_START,
+			      GPR_DYNAMIC_PORT_END, GFP_ATOMIC);
+	if (id < 0) {
+		dev_err(dev, "Unable to allocate dynamic GPR src port\n");
+		kfree(port);
+		spin_unlock(&pr->svcs_lock);
+		return ERR_PTR(id);
+	}
+
+	svc->id = id;
+	spin_unlock(&pr->svcs_lock);
+
+	return port;
+}
+EXPORT_SYMBOL_GPL(gpr_alloc_port);
+
 static int apr_device_match(struct device *dev, const struct device_driver *drv)
 {
 	struct apr_device *adev = to_apr_device(dev);
@@ -390,6 +475,11 @@ static void apr_device_remove(struct device *dev)
 	struct apr_device *adev = to_apr_device(dev);
 	struct apr_driver *adrv = to_apr_driver(dev->driver);
 	struct packet_router *apr = dev_get_drvdata(adev->dev.parent);
+	unsigned long flags;
+
+	spin_lock_irqsave(&adev->svc.lock, flags);
+	adev->svc.dying = true;
+	spin_unlock_irqrestore(&adev->svc.lock, flags);
 
 	if (adrv->remove)
 		adrv->remove(adev);
@@ -437,9 +527,15 @@ static int apr_add_device(struct device *dev, struct device_node *np,
 	svc->id = svc_id;
 	svc->pr = apr;
 	svc->priv = adev;
+	svc->dying = false;
 	svc->dev = dev;
+	svc->dynamic_svc = false;
 	spin_lock_init(&svc->lock);
 
+	INIT_WORK(&svc->rx_work, apr_service_rxwq);
+	INIT_LIST_HEAD(&svc->rx_list);
+	kref_init(&svc->refcount);
+
 	adev->domain_id = domain_id;
 
 	if (np)
@@ -488,7 +584,6 @@ static int apr_add_device(struct device *dev, struct device_node *np,
 		dev_err(dev, "device_register failed: %d\n", ret);
 		put_device(&adev->dev);
 	}
-
 out:
 	return ret;
 }
@@ -629,12 +724,12 @@ static int apr_probe(struct rpmsg_device *rpdev)
 	dev_set_drvdata(dev, apr);
 	apr->ch = rpdev->ept;
 	apr->dev = dev;
-	apr->rxwq = create_singlethread_workqueue("qcom_apr_rx");
+
+	apr->rxwq = alloc_workqueue("qcom_apr_rx", WQ_UNBOUND | WQ_MEM_RECLAIM, 0);
 	if (!apr->rxwq) {
 		dev_err(apr->dev, "Failed to start Rx WQ\n");
 		return -ENOMEM;
 	}
-	INIT_WORK(&apr->rx_work, apr_rxwq);
 
 	apr->pdr = pdr_handle_alloc(apr_pd_status, apr);
 	if (IS_ERR(apr->pdr)) {
@@ -643,8 +738,6 @@ static int apr_probe(struct rpmsg_device *rpdev)
 		goto destroy_wq;
 	}
 
-	INIT_LIST_HEAD(&apr->rx_list);
-	spin_lock_init(&apr->rx_lock);
 	spin_lock_init(&apr->svcs_lock);
 	idr_init(&apr->svcs_idr);
 
diff --git a/include/linux/soc/qcom/apr.h b/include/linux/soc/qcom/apr.h
index 58fa1df96347..f5bc55c3d025 100644
--- a/include/linux/soc/qcom/apr.h
+++ b/include/linux/soc/qcom/apr.h
@@ -3,6 +3,7 @@
 #ifndef __QCOM_APR_H_
 #define __QCOM_APR_H_
 
+#include <linux/kref.h>
 #include <linux/spinlock.h>
 #include <linux/device.h>
 #include <linux/mod_devicetable.h>
@@ -129,6 +130,11 @@ struct pkt_router_svc {
 	gpr_port_cb callback;
 	struct packet_router *pr;
 	spinlock_t lock;
+	struct work_struct rx_work;
+	struct list_head rx_list;
+	struct kref refcount;
+	bool dying;
+	bool dynamic_svc;
 	int id;
 	void *priv;
 };
-- 
2.47.3


