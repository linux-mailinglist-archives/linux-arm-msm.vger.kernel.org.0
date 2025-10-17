Return-Path: <linux-arm-msm+bounces-77723-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E8450BE751D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Oct 2025 10:58:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 60A5B189961F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Oct 2025 08:58:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 876862D7DF3;
	Fri, 17 Oct 2025 08:56:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MbRHWv50"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F68E2D73B8
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Oct 2025 08:56:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760691398; cv=none; b=ZJ3tT8FvhMpINW3IIED0WL1MiL1mTwi2xsgjk3Ko0a9LXiQvLr0H9hhHi9b9sw1kUXExUw9HUBtx6Log0SlP2BjfTwCdIggQFOQPCEEzIHmSQ//B+7HWhaYHpmxJtKmnNfeiyQwFrTGhN9kFkAHPuYx4IbtabHtvdE2VNMmqgTQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760691398; c=relaxed/simple;
	bh=dLHz5GvCqsmxeiBqKMEL3HcMUOaRmWqxPH16ZJ+zr84=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=N+uu4679rWOLrsCVtFdzHLbNdRyjp9yaBQM8Mwo7DTRf27KPpjYJeUKeJhoZSP94q0vNclnqZplVt2DOKchAPKyzVlwJSJX5iqSWH3TAGcEr1rij8CTFIKKG/GqgmY6DFeOAPUiqTwpuGM7uKDtmZcWNCovsvTEU9KXhb4bqBvo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MbRHWv50; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59H8ATpb001691
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Oct 2025 08:56:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=JitUmPpOE5T
	5FCzl9njQ018JnbQNGz2uQiWhNK3tWOE=; b=MbRHWv50ntKOGmN0X9n6fxfL2ml
	35Q9vv4Fv63oV4svLmEMWsGOyDNvScWj/RyIKtA4Upsd4qPcXHQQZqKIs69hojcZ
	rVinsqfYqmoAibeFmErewScQWjS+cgsG0K80HQyJjA/7HFINUWsmmqQBYz9oJtoc
	JV6GsGsAs+YdFwusKIY3xGH2xIpEC6edM+HaafKEMc7r1JuqkWEGVf7UIjfeJHoS
	jLZnfkQlaJm3gz9aigaoP2id2cnVy2lhif3JUKOwlOuFdgFUq6e+NodwHCO7DmQL
	MG22/grPjnsVxT/Q2vNjO/OTyOJzYH8Ur3cmLLDDj0hRoxc4Ts0M+BpyfGw==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49qfd9bm9f-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Oct 2025 08:56:36 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-81d800259e3so27631806d6.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 17 Oct 2025 01:56:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760691395; x=1761296195;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JitUmPpOE5T5FCzl9njQ018JnbQNGz2uQiWhNK3tWOE=;
        b=A/tmgDh7EuwGvTZBb8dXrlsnsIFiHaH3zX02iB+o4AdKtQnmtAxxVmKO/tkyMiLBRl
         lEbKtQPS8DTyQZzhY91MMnDefjzEmXUPa1nwMzrjJXsWN6T+6sEVHf+q7m5sAiahI64A
         2WcgqvhJC3ZiIMBCHwfdTRbuifOIEuHLRsqNWkbAXn9v7EPAcAFw0pgNM6tQJ9qOuAzC
         rI5wQAJEC0KGSSvQYljWstZmF+f/GKNhchQzJNFZdbLAEk7r2KQoNK30PcKUV6+bBhz/
         +kJoz/4iPyDRb6+/JTrpxnBYWzCLhQC/cuZLA2wFEYZLJRcwzcFGtum769SV/91N5s1R
         +1Rg==
X-Forwarded-Encrypted: i=1; AJvYcCVCHsoLnMguClfaode5UBVf/rSYL/U4Mf5DENfqx8bXEKfZOVgNleAB310Yrd/P4tGXFmXum0bzfJ0RRwNT@vger.kernel.org
X-Gm-Message-State: AOJu0Yzz/dsM/IRDSGNQ57CsXd3Jd1dpc1Ps4oDZaWtGmAwhsKWJ710x
	up23E/SyuxZwnUtoNaIkc5cWJVgyfF4kpHWjSiRS+2Ujit/mqGOnDcidnp6LAEI12MFfUwXIO39
	/fs9Y+Bf37naDr5DXAhekVSQ6C4qcHoOU+tZDOivaOOeG1g0A8wTZJJYSdNwngfZ6If8c
X-Gm-Gg: ASbGncscxsj1zkpEKmbefAxh+FJsiG5c8OYMRGVHQ7k+Qf337DFjKVyJniCMcHObWfd
	YX8mOfGhwL3ydA7dB7nwvyaRZ/uQudTT8nfcnJ+a9/CZcIk6jz3qh6abB/U3UQLRfbfE41qEEDF
	/FZSNy6i+lhYWSRuqsWhhCS6PnVSB9b35wQpedaFnFuae+dnHIKQvjnWMWsKn3QbfV0Sfao7Rcg
	ZOR+nMJgaIABiU8LxhAdObCfXMuvLgwiu5IWtjcOAZc2yhbSnFiqcRLVfUFzHZX2ZLMG3yTY5VA
	Xix0YaXJltF6BYzzLDb7S6X2+gJS7Dx3DYHaWuULIylRtypgZsfKMJ0L4xCiEHyIw4uDnNgujra
	JBc46S7JHC3W/
X-Received: by 2002:a05:622a:134a:b0:4e6:ef26:3152 with SMTP id d75a77b69052e-4e89d415399mr41172661cf.80.1760691394762;
        Fri, 17 Oct 2025 01:56:34 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IECLncEtQ/xMqZowWNexF5mITfqx6IZzM+n9Z8TxJParb7CY65kZ74qpDXSRgl56uflB/Cpyw==
X-Received: by 2002:a05:622a:134a:b0:4e6:ef26:3152 with SMTP id d75a77b69052e-4e89d415399mr41172511cf.80.1760691394323;
        Fri, 17 Oct 2025 01:56:34 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4711444d919sm70764985e9.14.2025.10.17.01.56.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Oct 2025 01:56:33 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: broonie@kernel.org
Cc: perex@perex.cz, tiwai@suse.com, srini@kernel.org, alexey.klimov@linaro.org,
        linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH 09/12] ASoC: qcom: q6afe: Use guard() for spin locks
Date: Fri, 17 Oct 2025 09:53:04 +0100
Message-ID: <20251017085307.4325-10-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251017085307.4325-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20251017085307.4325-1-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: fMOeEsd5Wb2ideKnkWVbk33cgJqtn6J0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDExMDAxOCBTYWx0ZWRfX4HB++eAf7e5I
 cSENpnpNC2tcVE1y9E6zwKqsZrjJnpGIgeBHPXZbgGj61TVACV/QYWiGTNT8AmBda6M5VYLWgv/
 7ftIWkVfKKSvSCc/EuL3TdAOoft9WWvGNwHjpOwIgoiuCVDX/gTopvWgSLLvThhvtMMfpOI72jx
 xUI9qR3AVje4RNeUbhnsoUwmsWPUEkwODzI95zjnRgvmjfrIB4lDnzxKsbltrX5pxG0ZhO+p2bo
 Q/y+7M5EAeZH2p829fP67SPqZOvxPeslZClLO7p7+/7Ci9P2LHRdzpl12yw3kcuLvEPt2TxP/BM
 HfzO9FMOLDFStWMWWC9SZcLJaSF8SMwTkf7OdA3jo3Hjx0FxLyqY2MUttr38l25bZRLSPsn/fNF
 5APhQQzqi57p0r6NtuRxR8kkHTDJ6Q==
X-Proofpoint-GUID: fMOeEsd5Wb2ideKnkWVbk33cgJqtn6J0
X-Authority-Analysis: v=2.4 cv=PdTyRyhd c=1 sm=1 tr=0 ts=68f204c4 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8
 a=RrrD4pAD4uqPltEmIwwA:9 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-17_03,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 bulkscore=0 clxscore=1015 adultscore=0
 lowpriorityscore=0 impostorscore=0 priorityscore=1501 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2510020000
 definitions=main-2510110018

Clean up the code using guard() for spin locks.

No functional changes, just cleanup.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 sound/soc/qcom/qdsp6/q6afe.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/sound/soc/qcom/qdsp6/q6afe.c b/sound/soc/qcom/qdsp6/q6afe.c
index 56f85f1c2425..980851a12976 100644
--- a/sound/soc/qcom/qdsp6/q6afe.c
+++ b/sound/soc/qcom/qdsp6/q6afe.c
@@ -946,9 +946,8 @@ static struct q6afe_port *q6afe_find_port(struct q6afe *afe, int token)
 {
 	struct q6afe_port *p;
 	struct q6afe_port *ret = NULL;
-	unsigned long flags;
 
-	spin_lock_irqsave(&afe->port_list_lock, flags);
+	guard(spinlock)(&afe->port_list_lock);
 	list_for_each_entry(p, &afe->port_list, node)
 		if (p->token == token) {
 			ret = p;
@@ -956,7 +955,6 @@ static struct q6afe_port *q6afe_find_port(struct q6afe *afe, int token)
 			break;
 		}
 
-	spin_unlock_irqrestore(&afe->port_list_lock, flags);
 	return ret;
 }
 
@@ -1733,7 +1731,6 @@ struct q6afe_port *q6afe_port_get_from_id(struct device *dev, int id)
 	int port_id;
 	struct q6afe *afe = dev_get_drvdata(dev->parent);
 	struct q6afe_port *port;
-	unsigned long flags;
 	int cfg_type;
 
 	if (id < 0 || id >= AFE_PORT_MAX) {
@@ -1810,9 +1807,8 @@ struct q6afe_port *q6afe_port_get_from_id(struct device *dev, int id)
 	port->cfg_type = cfg_type;
 	kref_init(&port->refcount);
 
-	spin_lock_irqsave(&afe->port_list_lock, flags);
+	guard(spinlock)(&afe->port_list_lock);
 	list_add_tail(&port->node, &afe->port_list);
-	spin_unlock_irqrestore(&afe->port_list_lock, flags);
 
 	return port;
 
-- 
2.51.0


