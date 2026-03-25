Return-Path: <linux-arm-msm+bounces-99827-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MKAxCFW/w2kRtwQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99827-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Mar 2026 11:56:21 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 314883235FC
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Mar 2026 11:56:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 23B36300F7A6
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Mar 2026 10:44:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 354E53BD240;
	Wed, 25 Mar 2026 10:44:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WgV0jAlg";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="U5hnc0DX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6D593BE65C
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Mar 2026 10:44:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774435484; cv=none; b=MZAoACLDdwWpkiMFSYU6EGlQm6L4+bZrCSHCuhvH9BgKv64YIc6QueS7imCS3RR74qRn2Ycxnj1u0/oauVaNePgyI1JruMohy9PMPIAS/fAFBjhUoa0sKbP4TcPPRaMMKvhWQxQMHks9pICe3j7JcrqbHF2xPT1xKHD84j/CDbA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774435484; c=relaxed/simple;
	bh=kP1JN0TOsfXEJgq4h81TD02jJQMr92Q+lzeaEK0wPp8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mti8hmUhjaFsbH+NAVehVLt7XS4qP1ecGI7JRhzVEw61f505k+EzEaN0foNYZ+XLM+jDX6G3KvkAB9NwBqhIBFfW7WqqG/olwLhY5jhNOGv6GvcJDtYpE2GMAfikSawAWyETUdiR45QWoflLQujFd8e+Uw62eqgHqX+EbC8Ne7A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WgV0jAlg; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=U5hnc0DX; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62PAiDW73110476
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Mar 2026 10:44:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=H3xEqupKPOV
	B9StA2RSOjiGfT+MC16oQI3PlkW+NAjA=; b=WgV0jAlg9v+aBGTve8TYJ8G78QG
	AqzY9gSnbrMfRwd2UWdamPjP82YtZ9BbfhvlsD7af/mRfyWNBf0E5T35+q4qhS7c
	2EgG685KuyWbtl8FFHHGkGFhP2gsxMMtozQwj5qyJr1bTxJulY0FhfkbnmlzubL0
	mwIbZM/um9Xb0rSYZa1KwrX0Ex3UrDddrMrWBFMuRnNIqrPEaOtOkKIEklZ/FRj2
	Snnkwh5nRi9EKVQZGqQNeYt6/o9+m30xRt48u4nwW/zQeINNdt8H7oSQ40rfxIH+
	Xh12NO/XicnfuY6izGPJBpltRagq+9aIU6lxfJJTGr3Ea/RLiRbvAN7xnhw==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d3vhvv1u7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Mar 2026 10:44:42 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-82a782029b7so4077108b3a.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Mar 2026 03:44:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774435481; x=1775040281; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=H3xEqupKPOVB9StA2RSOjiGfT+MC16oQI3PlkW+NAjA=;
        b=U5hnc0DXoIOAYPLo7oHUHnbdb9QijauP5hwG3/RicvtGusa6SNb/9ZFVQAdKgL8wwl
         N5otJjlJSgL7yWZ1qABjv9mTNZjAjVkUB/eBqc3BT//QBHYhMFUx+oPOCCLe6jB6O4fE
         CdU9APxSwSDhmZAoD23Lc+1io8OTObOg1MPRbmSbVA0h/JidUKGEJrzgwBK2IUC89iA2
         xr8QlSzniaarAyegcM2rGQ4sdCNq4upGL0nSP1bCiz0N11VNBVSKUdPmvQOURPzSae/+
         kvy5oYqlIUQKgbYuzVjrk2JU4ORDmg/he48O7oZNpddoeyhRsoTQYStEu0jf10ZQC+Ou
         MHVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774435481; x=1775040281;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=H3xEqupKPOVB9StA2RSOjiGfT+MC16oQI3PlkW+NAjA=;
        b=qAL0GO2P64ovBwaOImr4crzF3/fgdWcgoekZTHGUMADlV4l9K1xiMHsKIWmuBU2qVT
         3kilhrQ18gnG8Z0Ob9P01Vtd/O4QlgnsJOzDXQ2ME7sz8BYvK75LXQ3fIMK+6aKLWbFf
         L582f7ha2CoC8di/6BVbrdSIm1liw9BlIEP007x2EDKcZakvzESLvlTNhZi6nFU8KMEd
         HGS66YEc8Ec7q9zufCZj/q6pUj63VHKw8s4ujGDtpw1IpLlJ74/M1GxP4zVBFUtX5gUd
         w6mSBl/1+qcCWKd1tICGHiEz1FRif78SexCpO16Q2b9QjKElt4wsOkcwqD31bE7eDW6f
         dvug==
X-Gm-Message-State: AOJu0Yzai8ON965y3yZ/8kqKsNC3rFu9T4jGNz9OolD+N7Y1u100br32
	pqAj1psRz25bjk9IqaG+dtbIZrPFlhIWgYKXv6Vzwp5sALWk3BU+wZGolBfK5Bx0eekqGX6GVEX
	YkekwmTOlFEs7q7yCLgbspOV0ylopsPa93SA0IzINbhI1bo4/QnSWimd2hMVOifZ1N6+J0D9DjT
	0y
X-Gm-Gg: ATEYQzxfgiYHcfMmSiGqu6clZdkDgCIJHYlAENez+DMCUWH7FSlLRzQgsBv3C8kT3Ou
	LVtkj21LfDC5jHHs3IKRo5iR2s9mfhDzF0xY+ScjGhOi9ygDPJGlsUaiUrlFXD1EKo2A92s0zS0
	n8WUjq5M30OkxHhjiDlbj30z8J5JT0cD0zkBcRtJZ/CUadt9YIYX+KhOa/wDoz5RIu/go5ZBPTy
	S8FJm1DRGAGssLTeMXS+u/YWaYvnS49r5NrGumAHVerl7rLtB7IzaanUBaFWRaxXkPzRznSOvH3
	Bjf7OrimVcg81esCWbWxHg5k3MDprVpgjVGoNp42HfhuXisolvGRRfVm9z2tqyy+XmaNiKQ2fU8
	PeyTgLlfCJVep0+2w9axfV1MgmVebTajxg9sp
X-Received: by 2002:a05:6a00:b908:b0:822:682d:2c5f with SMTP id d2e1a72fcca58-82c6df88024mr2827698b3a.28.1774435481258;
        Wed, 25 Mar 2026 03:44:41 -0700 (PDT)
X-Received: by 2002:a05:6a00:b908:b0:822:682d:2c5f with SMTP id d2e1a72fcca58-82c6df88024mr2827678b3a.28.1774435480683;
        Wed, 25 Mar 2026 03:44:40 -0700 (PDT)
Received: from work ([120.60.74.210])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82b0409c6besm17867251b3a.32.2026.03.25.03.44.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Mar 2026 03:44:40 -0700 (PDT)
From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
To: davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
        pabeni@redhat.com, horms@kernel.org
Cc: linux-arm-msm@vger.kernel.org, netdev@vger.kernel.org,
        linux-kernel@vger.kernel.org, andersson@kernel.org,
        yimingqian591@gmail.com, chris.lew@oss.qualcomm.com, mani@kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
        stable@vger.kernel.org
Subject: [PATCH 1/2] net: qrtr: ns: Limit the maximum server registration per node
Date: Wed, 25 Mar 2026 16:14:14 +0530
Message-ID: <20260325104415.104972-2-manivannan.sadhasivam@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260325104415.104972-1-manivannan.sadhasivam@oss.qualcomm.com>
References: <20260325104415.104972-1-manivannan.sadhasivam@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI1MDA3NiBTYWx0ZWRfX4yddm+wvuMyz
 bWXgFKN6rVnakBrqVuTqo2SVLBHIlhZ8HS7lzeTmcvAGY9iJuZDGCL0q88ukDRWhpyTckRSPQlo
 J6pUL3ik1j548N1Gct69haWRHCWdKopcTBJZxw9FqahXKl9hW9dwICQjkXCgJNY7cH6qkzespD2
 P4ekqbKLMWyYrdUJ3YE+MhwJbZxcfoWnoC0Ijt9ZE4Uf+EH6wVnrk2QXE+T3SAd7FgqPdUfZQLf
 rz9Rwd4o8DN950jROan9t0n08a1r5DXSTXmIxG/T62odlgqk8y6oVuD7WD3xt8mN81GpcmpVIK7
 LrgQvUOy5Y0rJkDLaNdOno/UMS8xO+v/imf2tW5PYCaBBkqcSU6hBeIFMu7zOM63xjMI3aUV+U1
 92r+x1N/OFIlF13O2C2TxLWd4HLZCI2u1COnd/gXO2PqrRu2nMERVdybvITCUmYZ682OX74YXjL
 +rnGwxI3eEUkJno/FhA==
X-Authority-Analysis: v=2.4 cv=P5M3RyAu c=1 sm=1 tr=0 ts=69c3bc9a cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=DfnuZq+CPLWApegUcJV09w==:17
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=VwQbUJbxAAAA:8
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=CceYW8o60cFt6G1gYt4A:9
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-ORIG-GUID: al9s97SsFXyk_PrDi_-Ju89OtPiR7ZHb
X-Proofpoint-GUID: al9s97SsFXyk_PrDi_-Ju89OtPiR7ZHb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-25_03,2026-03-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 adultscore=0 lowpriorityscore=0 malwarescore=0
 priorityscore=1501 spamscore=0 bulkscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603250076
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[14];
	FREEMAIL_CC(0.00)[vger.kernel.org,kernel.org,gmail.com,oss.qualcomm.com];
	TAGGED_FROM(0.00)[bounces-99827-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[manivannan.sadhasivam@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 314883235FC
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Current code does no bound checking on the number of servers added per
node. A malicious client can flood NEW_SERVER messages and exhaust memory.

Fix this issue by limiting the maximum number of server registrations to
256 per node. If the NEW_SERVER message is received for an old port, then
don't restrict it as it will get replaced.

Note that the limit of 256 is chosen based on the current platform
requirements. If requirement changes in the future, this limit can be
increased.

Cc: stable@vger.kernel.org
Fixes: 0c2204a4ad71 ("net: qrtr: Migrate nameservice to kernel from userspace")
Reported-by: Yiming Qian <yimingqian591@gmail.com>
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
---
 net/qrtr/ns.c | 24 ++++++++++++++++++++----
 1 file changed, 20 insertions(+), 4 deletions(-)

diff --git a/net/qrtr/ns.c b/net/qrtr/ns.c
index 3203b2220860..fb4e8a2d370d 100644
--- a/net/qrtr/ns.c
+++ b/net/qrtr/ns.c
@@ -67,8 +67,14 @@ struct qrtr_server {
 struct qrtr_node {
 	unsigned int id;
 	struct xarray servers;
+	u32 server_count;
 };
 
+/* Max server limit is chosen based on the current platform requirements. If the
+ * requirement changes in the future, this value can be increased.
+ */
+#define QRTR_NS_MAX_SERVERS 256
+
 static struct qrtr_node *node_get(unsigned int node_id)
 {
 	struct qrtr_node *node;
@@ -229,6 +235,17 @@ static struct qrtr_server *server_add(unsigned int service,
 	if (!service || !port)
 		return NULL;
 
+	node = node_get(node_id);
+	if (!node)
+		return NULL;
+
+	/* Make sure the new servers per port are capped at the maximum value */
+	old = xa_load(&node->servers, port);
+	if (!old && node->server_count >= QRTR_NS_MAX_SERVERS) {
+		pr_err_ratelimited("QRTR client node %u exceeds max server limit!\n", node_id);
+		return NULL;
+	}
+
 	srv = kzalloc_obj(*srv);
 	if (!srv)
 		return NULL;
@@ -238,10 +255,6 @@ static struct qrtr_server *server_add(unsigned int service,
 	srv->node = node_id;
 	srv->port = port;
 
-	node = node_get(node_id);
-	if (!node)
-		goto err;
-
 	/* Delete the old server on the same port */
 	old = xa_store(&node->servers, port, srv, GFP_KERNEL);
 	if (old) {
@@ -252,6 +265,8 @@ static struct qrtr_server *server_add(unsigned int service,
 		} else {
 			kfree(old);
 		}
+	} else {
+		node->server_count++;
 	}
 
 	trace_qrtr_ns_server_add(srv->service, srv->instance,
@@ -292,6 +307,7 @@ static int server_del(struct qrtr_node *node, unsigned int port, bool bcast)
 	}
 
 	kfree(srv);
+	node->server_count--;
 
 	return 0;
 }
-- 
2.51.0


