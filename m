Return-Path: <linux-arm-msm+bounces-113817-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id toJTGDzNNGpxhQYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113817-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Jun 2026 07:01:48 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id EC4A16A3E5E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Jun 2026 07:01:47 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=IqQrBs+q;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=O6sHwtpT;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113817-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113817-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 41EC3301477F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Jun 2026 05:01:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2E0C131F996;
	Fri, 19 Jun 2026 05:01:44 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7412332B132
	for <linux-arm-msm@vger.kernel.org>; Fri, 19 Jun 2026 05:01:42 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781845304; cv=none; b=G6/glwTVjUQNI1HRhbTJWwyg2/UaQhVmQRk0+hrclqZ61v0RLtj6f1xfQIvUKucJ0aAHkWcoc5U2G4whRZXSuNg7Ou0kkx2PP2IhFSTQBbuHLHoH+dIsndzhItqEjspuLPnL1dJ9v4wrwgnY1u5X5SpQsj+ehAh/nL/HjwzpEy4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781845304; c=relaxed/simple;
	bh=gRJJKHkavlo6wAUcgkd7tDL0JMH4jNW4P94d0RtG4ng=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=TOX+IRJz+tnUknQVSpFbRphB8LWiMYOo0bMdT8q1l/8XaJumvo+SflEWEiDK8MJid/F18Aqy7SINqMjgXwGoMyYvD6fy31ipEbLEYBJsJc/BfhSOsJhDjWo96tCEHW0shRTLe5j3zebpLnba08qUhyZbUFG/wXUUmvZyzu9OdQ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IqQrBs+q; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=O6sHwtpT; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65J4tCXd3948883
	for <linux-arm-msm@vger.kernel.org>; Fri, 19 Jun 2026 05:01:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=37n4L8BkTX+xlkdInVGxTW
	EzyLbrTOzGfYWCRWWK0m4=; b=IqQrBs+qWQctcaPtzAg3r+3HwZ4t00OebpeL/s
	K3Vdn0H+UsJF79xdU0Jq7maj3qXdIIGfHgzEwk6lBLLSJWKt5GFH8GCYlpKfyIzp
	rBKMj1dFK4KpVs22opgzTT1HGBW6vXXLH4dGBvTRZf76GDVurWRhXg9W5QqAjQ2m
	MkT5czB2g7D9rvsI9RxC2/c7oWy6YEVpyiymTPJnZrZJbuHJqeb8lVtIZHAngqq5
	sNlIhWonNbo4jcH467zHwSlTJAsqOGpWcBk3gIA9XS/Hu9NoGQqa4J+R7mwpDukl
	CCaqpy7v78M151+G7kq+LfvavmXtdaMCxqSxkHnnO7C0hTqg==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4evm22an6f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 19 Jun 2026 05:01:41 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-30bcb065bfdso3204418eec.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 18 Jun 2026 22:01:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781845300; x=1782450100; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=37n4L8BkTX+xlkdInVGxTWEzyLbrTOzGfYWCRWWK0m4=;
        b=O6sHwtpTrIe+PliRElafzMZL1dAB9RlwxhmGULibgA9yyD2iqBumFh+n9ICjClQn89
         Muu0qzNlSjHW+Mz1lJp0ryCAD/MjaOfoAFOEM+mZGA+I7f30Np3m7P86zaDAjVDxZEs3
         q01yKodawKaOiQIh8sRZX7KfOrimBkW9gFh1KD6RJha8zssjkxlGjzCdECWa/bUywmv4
         0PdyJJ3fq6F0hkSu6a+D/e1laaR22ccKLspcEZbK/v7v4ylQWA7gjOj+4FoaWYgoVKbF
         iCc4Wqzdal4MPqEN0B7drORjZXu/kWLgBl0lEtw82/S+h3iOpxQZ73nuNtJDFilkYcis
         HZcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781845300; x=1782450100;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=37n4L8BkTX+xlkdInVGxTWEzyLbrTOzGfYWCRWWK0m4=;
        b=V7IHKPLKl6f7EgbNUyUZjvw8mUBbWe4XvI8faaOSh350pFuTLyys9M8vT98cDpcMsF
         UEA1P7qhyJ1REhvJrhaCgBlG+yrOaqGVfsphXl+ohdaeEQBhtfKZe7fb3kPrp0lgG0yH
         i+CVzcaNFnXPAA9ObiPEeMxSccFZe3BhMMqjKAHbBbWMC2cA4w7DkNkD1gefk0b9xrIY
         eTwtI5B41uw9oPNM0+nXXAOLbfoWqCHF93Vz0J1LXBxZuo9BdVyiLEzcliwWsDZV9FsC
         iQyZx9k4sjblc48spyJ4SafnNMhtUQ+xJqsZDf28VarT+8DyVJkNryNG/0FpVxr/0BEK
         lL/g==
X-Gm-Message-State: AOJu0YwMYSY6rLwmStmSoq0MFdy8CrXfN7+dHU11A3UePEzOjci4lzxN
	eC4n+06g5my//ppZIA15RCXmPiQFNqeNkUzkK6wL382VXL5u/iZ6aI/DDoBsbeNAM8zGEpznU7K
	vtg3Wavrb0iaeUEi8+cg0R2jlRnpVUljDG79xULsBcM2Dc6T6SrB23/x63dwk+eFmIYuk
X-Gm-Gg: AfdE7cnTtxfGw2izp2rJXu60vyKDK11RUSjOQ0ecqnlz8v/UTjVqehvwpod6NKgAunb
	8OIssS86k8seeQw9pQQ0MwgoomjCp6NAuACSUlxmeFlkPNcNMVq3/gK5cLrJUvZMvoSWohkHuKL
	Ass1S7hSK0mvZq4YJvMNA4bq2ay7wQHbFz5w3ZnLU+9a5KtihBDqhxsdnUC1B6GTUanOR3/ZB1x
	ElGTD3oUeXXyVtpeoc4qWJibmAyjOO8zBMrb30jXS6jpCwZjvmkDC7ebouOzGeN+LBLU2/6uzLX
	g3xkla34Mv+UDQwJcV/OWY7QgDOThcqJdyMHvZVOfE6BeflFPcR5qKb0gByyA4wGRVXx2kfZHu3
	GNpMORzbT2BPWpxs0QEu80cImzrElj14v7H/kjCqkIqDVGp4p7CWTIkgpmyBwcvyZPA==
X-Received: by 2002:a05:7300:5b95:b0:2ed:e12:376b with SMTP id 5a478bee46e88-30c0d29fafbmr510997eec.33.1781845300004;
        Thu, 18 Jun 2026 22:01:40 -0700 (PDT)
X-Received: by 2002:a05:7300:5b95:b0:2ed:e12:376b with SMTP id 5a478bee46e88-30c0d29fafbmr510980eec.33.1781845299474;
        Thu, 18 Jun 2026 22:01:39 -0700 (PDT)
Received: from hu-chunkaid-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30c066cc0ecsm1451978eec.1.2026.06.18.22.01.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jun 2026 22:01:39 -0700 (PDT)
From: Chunkai Deng <chunkai.deng@oss.qualcomm.com>
Date: Thu, 18 Jun 2026 22:01:37 -0700
Subject: [PATCH] rpmsg: glink: Split protocol start out of native_probe
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260618-rpmsg-glink-split-protocol-start-v1-1-c4f93986cdb4@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIADDNNGoC/4WOyw6CMBREf8V07SUt8hBX/odh0RdQBVp7C9EQ/
 t2Cce1mkpNM5sxCUHujkVwOC/F6NmjsGIEdD0R2fGw1GBWZpDQtaEEz8G7AFtrejA9A15sAztt
 gpe0BA/cBTqopMyVULquMxBnndWNeu+JWfxkncdcybLtbozMYrH/vH2a29X6683/dzIABLfOq0
 VoIXomrRUyeE++lHYYkBqnXdf0AJVp5UukAAAA=
X-Change-ID: 20260604-rpmsg-glink-split-protocol-start-3df74dbd5c94
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org, chris.lew@oss.qualcomm.com,
        tony.truong@oss.qualcomm.com,
        Chunkai Deng <chunkai.deng@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781845298; l=4370;
 i=chunkai.deng@oss.qualcomm.com; s=20260604; h=from:subject:message-id;
 bh=gRJJKHkavlo6wAUcgkd7tDL0JMH4jNW4P94d0RtG4ng=;
 b=MR1pC4sZTubdUcA3O8Xes3UJJhXqhh1+izdbIKQJXrYr4/25VtPuKjLgS38mcT/26Yhf7nhDN
 ZaMxxzeyavrBf3MNQReuetWkoHVokTkaGvb8K0WNiaFlGPnZ7TZSz0Y
X-Developer-Key: i=chunkai.deng@oss.qualcomm.com; a=ed25519;
 pk=wWxCpsJRKQeVRzpZ8GLRnUX6ozLMowqE3hiz/j+j9O8=
X-Authority-Analysis: v=2.4 cv=YN+vDxGx c=1 sm=1 tr=0 ts=6a34cd35 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=oe6ozcHpWozmWDpEdRcA:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-GUID: JnOsEgPSLo2ixvzTiH08BJysLsGkZtaS
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE5MDA0MiBTYWx0ZWRfX4J/SpgyfC7+g
 Pyrxx+2xizDln/whkHVRLHPSDlm8wQOi9ugIivr7l8fc3rLo3EqtFJlsBCqmcPpGNQo8Sf2xbFJ
 jDHuIH7gq2WCdfEhK5AxvLLmpSSxzqo=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE5MDA0MiBTYWx0ZWRfX5nEvMWacUYyb
 cUXgE/rxhbYby8kua1F4/VsUDLrjNCZtWPu/FGvvzF0S7JtSptGJrWIHbgn3wtQ3YOWYTXAGj0G
 D8eCjNKKCLZHsgzwNZem5a5e03zj70Ja9WEI+B0dy44lVPGDQZbdaYTB03C2hVZG4dRyv4uTffx
 uJZrhHWuiK8wHtp6DH7s+RmOhGES4uBa7WPDQdsgArVZp+SnLmQLqgkamRFcvsOAabT+Bl73ego
 yBsL2pGrZOl9g1nsj1KKqUulDB9LYijDve0mOcE3f6AR9hwJiOb6XGpmVdi2WoNlmGrnGllpnCF
 lWmbAgldxEmToH9fyB2TqRrwBR8KLvsS32vW+6DKQKA0xV4/JDZb6NU82lsbvIvuYpoJbC3XXiS
 EJ/1Qm8aPKU3nn80ZhkqRxqxZlicY33ioD2L1lDYnqenO54uaxs1lwIhpJITBlU7l6jFq8jkJ2v
 DOJ3jgZiqeJxHjmEuLQ==
X-Proofpoint-ORIG-GUID: JnOsEgPSLo2ixvzTiH08BJysLsGkZtaS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-19_01,2026-06-18_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 adultscore=0 clxscore=1015 impostorscore=0
 phishscore=0 lowpriorityscore=0 malwarescore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606190042
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-113817-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[chunkai.deng@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:mathieu.poirier@linaro.org,m:linux-arm-msm@vger.kernel.org,m:linux-remoteproc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:chris.lew@oss.qualcomm.com,m:tony.truong@oss.qualcomm.com,m:chunkai.deng@oss.qualcomm.com,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,vger.kernel.org:from_smtp];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[chunkai.deng@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: EC4A16A3E5E

The SMEM and RPM transports request their receive interrupt with
IRQF_NO_AUTOEN and enable it only after qcom_glink_native_probe()
returns. Since native_probe() sends the initial version command, the
remote may ACK before the local IRQ is enabled, stalling the version
handshake on a fast remote.

Split the protocol start (qcom_glink_send_version() and
qcom_glink_create_chrdev()) into a new qcom_glink_native_start().
Transports now enable their IRQ first, then call native_start(), so the
version ACK is guaranteed to be serviced.

Signed-off-by: Chunkai Deng <chunkai.deng@oss.qualcomm.com>
---
 drivers/rpmsg/qcom_glink_native.c | 32 ++++++++++++++++++++++++++++----
 drivers/rpmsg/qcom_glink_native.h |  1 +
 drivers/rpmsg/qcom_glink_rpm.c    |  8 ++++++++
 drivers/rpmsg/qcom_glink_smem.c   |  8 ++++++++
 4 files changed, 45 insertions(+), 4 deletions(-)

diff --git a/drivers/rpmsg/qcom_glink_native.c b/drivers/rpmsg/qcom_glink_native.c
index d9d4468e4cbd..2a284b22a037 100644
--- a/drivers/rpmsg/qcom_glink_native.c
+++ b/drivers/rpmsg/qcom_glink_native.c
@@ -1928,17 +1928,41 @@ struct qcom_glink *qcom_glink_native_probe(struct device *dev,
 	if (ret)
 		dev_err(dev, "failed to add groups\n");
 
+	return glink;
+}
+EXPORT_SYMBOL_GPL(qcom_glink_native_probe);
+
+/**
+ * qcom_glink_native_start() - start the GLINK protocol handshake
+ * @glink:	glink handle returned by qcom_glink_native_probe()
+ *
+ * Send the initial version command and register the chrdev. This is split
+ * out from qcom_glink_native_probe() so that a transport can enable its
+ * receive interrupt before the version handshake is initiated, ensuring the
+ * version ACK from the remote is not missed.
+ *
+ * Failure to register the chrdev is not fatal and only logged, matching the
+ * previous behaviour of qcom_glink_native_probe().
+ *
+ * Return: 0 on success, negative errno if sending the version command failed.
+ */
+int qcom_glink_native_start(struct qcom_glink *glink)
+{
+	int ret;
+
 	ret = qcom_glink_send_version(glink);
-	if (ret)
-		return ERR_PTR(ret);
+	if (ret) {
+		dev_err(glink->dev, "failed to send version: %d\n", ret);
+		return ret;
+	}
 
 	ret = qcom_glink_create_chrdev(glink);
 	if (ret)
 		dev_err(glink->dev, "failed to register chrdev\n");
 
-	return glink;
+	return 0;
 }
-EXPORT_SYMBOL_GPL(qcom_glink_native_probe);
+EXPORT_SYMBOL_GPL(qcom_glink_native_start);
 
 static int qcom_glink_remove_device(struct device *dev, void *data)
 {
diff --git a/drivers/rpmsg/qcom_glink_native.h b/drivers/rpmsg/qcom_glink_native.h
index 8dbec24de23e..783209980c3a 100644
--- a/drivers/rpmsg/qcom_glink_native.h
+++ b/drivers/rpmsg/qcom_glink_native.h
@@ -35,6 +35,7 @@ struct qcom_glink *qcom_glink_native_probe(struct device *dev,
 					   struct qcom_glink_pipe *rx,
 					   struct qcom_glink_pipe *tx,
 					   bool intentless);
+int qcom_glink_native_start(struct qcom_glink *glink);
 void qcom_glink_native_remove(struct qcom_glink *glink);
 void qcom_glink_native_rx(struct qcom_glink *glink);
 
diff --git a/drivers/rpmsg/qcom_glink_rpm.c b/drivers/rpmsg/qcom_glink_rpm.c
index e3ba2c63a5fc..34f18c3e58c8 100644
--- a/drivers/rpmsg/qcom_glink_rpm.c
+++ b/drivers/rpmsg/qcom_glink_rpm.c
@@ -358,6 +358,14 @@ static int glink_rpm_probe(struct platform_device *pdev)
 
 	enable_irq(rpm->irq);
 
+	ret = qcom_glink_native_start(glink);
+	if (ret) {
+		disable_irq(rpm->irq);
+		qcom_glink_native_remove(glink);
+		mbox_free_channel(rpm->mbox_chan);
+		return ret;
+	}
+
 	return 0;
 }
 
diff --git a/drivers/rpmsg/qcom_glink_smem.c b/drivers/rpmsg/qcom_glink_smem.c
index 62adc4db2317..28f6cfda6352 100644
--- a/drivers/rpmsg/qcom_glink_smem.c
+++ b/drivers/rpmsg/qcom_glink_smem.c
@@ -348,8 +348,16 @@ struct qcom_glink_smem *qcom_glink_smem_register(struct device *parent,
 
 	enable_irq(smem->irq);
 
+	ret = qcom_glink_native_start(glink);
+	if (ret)
+		goto err_disable_irq;
+
 	return smem;
 
+err_disable_irq:
+	disable_irq(smem->irq);
+	qcom_glink_native_remove(glink);
+
 err_free_mbox:
 	mbox_free_channel(smem->mbox_chan);
 

---
base-commit: a225caacc36546a09586e3ece36c0313146e7da9
change-id: 20260604-rpmsg-glink-split-protocol-start-3df74dbd5c94

Best regards,
--  
Chunkai Deng <chunkai.deng@oss.qualcomm.com>


