Return-Path: <linux-arm-msm+bounces-107674-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KKtTH8LvBWpWdgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107674-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 May 2026 17:52:34 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 58C515444EA
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 May 2026 17:52:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 26E223014866
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 May 2026 15:51:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 91EB22F90C5;
	Thu, 14 May 2026 15:51:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GQKXIe/I";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kdrm9DTt"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAA9E30E0C0
	for <linux-arm-msm@vger.kernel.org>; Thu, 14 May 2026 15:51:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778773872; cv=none; b=pBu+uiuCrzFaSB/gbtHZVf81CglySFM0f3j7D0a2mtrXzWLdpn4RdjH0O1hDENbfjzAOB8YjlbqLK6jmWYYCK7aa0LNtPIVZhQMooV0HBx/aNEiWC1LU843uy0ruYQUuGgOp+has9u+Ypxeph3tn7OhO6Y9Up6otP2kQUhFPgr0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778773872; c=relaxed/simple;
	bh=8MEl+BgGkiaZBwbz6FvWwT8L3rP9aORLehU5yrQrfCY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kBsHp8PrjEVDzhllyMm5APNA3z8GXLH3UvI3dtCRlN3WmypCVHyaviJBiKyGB2BNPi+JOL6kQYu3m7W2ZD90tyzukviA3SXnv38wHn6hz/Oj9Ls4tLn6+UlofMemNYiDYxKC+yG4w5ehbyceg576egaQbvjmzubCB28cMFzqo1s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GQKXIe/I; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kdrm9DTt; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64EBeY8H1717897
	for <linux-arm-msm@vger.kernel.org>; Thu, 14 May 2026 15:51:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=kp+b1sDmdyU
	7/z1soTFzi5u3lYlucYrQChAjmvIDfQI=; b=GQKXIe/I3Za95Z0qTsXBMembtZj
	nw5pKpCq/KGNVkfCuNOKA/17oElGpTuKE5WJr9xZ5Lun4OIUwgRpfxr8pySLAbv0
	S/9bLTHWh5X9uXTuLJ5zJI/MGep2WlgQ5Pk83NOHmkDV8aGf4WxMwS9oUdutCSK8
	lwBhCzD4fe7n5vV4iEmljHBDJwegv5nHmTHe4YE0YCnB3e7tcoeT70Zd7SKFOL/q
	9tv+A/WKwU9G47qYjYXC55fJFFJbIMNC4ElLCQwS0EezSDX+DPXd7jd7ROo9Z6lj
	JWXPAhnsxEO/f9QKpjoiwo9GwrcWOuiNITytDWBd1J6euPQBlF7MzEXDNEQ==
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com [209.85.222.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e57y7j8pq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 14 May 2026 15:51:03 +0000 (GMT)
Received: by mail-ua1-f70.google.com with SMTP id a1e0cc1a2514c-95cf8749d71so11453315241.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 14 May 2026 08:51:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778773863; x=1779378663; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kp+b1sDmdyU7/z1soTFzi5u3lYlucYrQChAjmvIDfQI=;
        b=kdrm9DTt+MT00P5htNXy1L/aV0QgkAYgUQIz3DCQXO+abv83iEn1lSjq7eX0qEXvnj
         KtOuzKV8dWe9zyBCnkdjtTHn3LR/2Mib0VxqXkvnuPp24lLMyCVKDuKWyq4hZU8RI+Rk
         MqH7gf3vHsVXv0HseqzkNd22w7QMM8sQ8Jnwr7k+iFBvmQN3nbHEzH1n+qeXp0V84j29
         4fMVXxZd/S6ucvf+2YgyYeXXZ2ta7fbAq03CQhj/m04dUev3147WhoUkY7bUk+q9viue
         Qprbt8E5yzEkyByeHTnuXRfgjadZ34WCFjJPTgb+zDuTKxxz44Ojd8riocdNVtpjI3TC
         ErhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778773863; x=1779378663;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=kp+b1sDmdyU7/z1soTFzi5u3lYlucYrQChAjmvIDfQI=;
        b=lQvlyr0eY65MQLXR5POORayGNoCHzK33GZ4JeThZm20HaKHkkPVv1feM2woXhPUWex
         U/KYca9VQdOfD8V9owfb5kXZd+6qyRr90vUHBQ184OF9IDxNmOUd2+p8D1SIjXVIUuP4
         zXfRwZ+DfAbu6m84mjymtHb5/JL/AvcuHLT3wqk8LHtdEzwUgDQKwmqmdCiwnYGBJTZv
         Cb4NjPsBSDLFraZRzWe9hZFzVJz9SUfLgvuh7ciePJkbONSy8kIBywxSO3/Bst8cjvuZ
         AKhG45VJC+whaNz2uQVDg7hVe4hiursQpev3vmaWREr7Ozxx9n5Xaq5Pd3jZRcfwcAiv
         1LtQ==
X-Forwarded-Encrypted: i=1; AFNElJ+ReS/aDaYGDOyFZBLrZpGO8WpGaO/dsAPDIhw5k7LHzyHX0pDhi5sF9dyTpOJH273WCP00LzlwJLi72dzc@vger.kernel.org
X-Gm-Message-State: AOJu0Ywbl12aio7GP43UDPtlS4e/ABmUTbzS1pWjIiNYJrvWnFf9+kyJ
	arf4QHP1hsAS7GCPqUZkAiBpErvUTRUjgjnUI2PtwgD9Kw/Hh838r6eE76PekxqE11IwMNXyV/9
	M9haR2bkykHySc88tqSX3CRF6cdWDZm8i10HbwmI7S5IIVgptJsENLLQCD9JpRHjRRvu4
X-Gm-Gg: Acq92OGjvWrhj3XTn2XzSxc8ycxY4oN/DSm1EDuQODlXb0i+eyuWzpP784r8brWrTPI
	vrEDEkMtm4CcgD5Zm8Z2PPKUYEeAP2QgxISY/yTBYCPsy+4C9dG+MpYOp8f8Ihdyyjeoh8VkhXz
	ugcYnr2hlx+DeVHuMGWLUhWflQ1dLpo09YtOsZOxdOy+1YSiLf2FsaimoNvpZboQPnHF03c44pC
	xVb9qQYsIrQ2WD68cmTRYNE2V6XSKUhNiRaN3Raah1wnTC6vGHXp8Gu96/mCVyTfsq2oCGeG22i
	3zQNN5XtNTAFo25tE1xg0/f09YCsacmu3eIeJ0qNW04N6j9KPvK/X4CnHNxDt54eFrKoTHE3gF+
	FyLnGFKDMCHP611FSwLQVBQlcmoQSH7jpevO+cgJlDZuTg7Bu8K6oCRw=
X-Received: by 2002:a05:6102:32cb:b0:631:44d9:2ca2 with SMTP id ada2fe7eead31-63776780cb8mr5037605137.30.1778773862982;
        Thu, 14 May 2026 08:51:02 -0700 (PDT)
X-Received: by 2002:a05:6102:32cb:b0:631:44d9:2ca2 with SMTP id ada2fe7eead31-63776780cb8mr5037585137.30.1778773862563;
        Thu, 14 May 2026 08:51:02 -0700 (PDT)
Received: from localhost.localdomain ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45da15a666fsm6967067f8f.36.2026.05.14.08.51.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 May 2026 08:51:01 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: andersson@kernel.org
Cc: srini@kernel.org, konradybcio@kernel.org, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH 2/3] soc: qcom: apr: Check response packet length by router type
Date: Thu, 14 May 2026 15:50:50 +0000
Message-ID: <20260514155051.2593354-3-srinivas.kandagatla@oss.qualcomm.com>
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
X-Proofpoint-ORIG-GUID: eRfI0XgACoaSmYnpT4exBhk29ViaedUS
X-Authority-Analysis: v=2.4 cv=UY9hjqSN c=1 sm=1 tr=0 ts=6a05ef67 cx=c_pps
 a=R6oCqFB+Yf/t2GF8e0/dFg==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=DocHB_6yuvdUiAEOOo8A:9 a=TD8TdBvy0hsOASGTdmB-:22
X-Proofpoint-GUID: eRfI0XgACoaSmYnpT4exBhk29ViaedUS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE0MDE2MCBTYWx0ZWRfXw0ZBmEAo1o3Y
 xtz29GXzh0L2HTs11+N0Z/8uIQrqDfEW4YElGBFIkparrLig5OBoXYdbC6PBO+0XUy/6lDVSHXo
 hQ5sAXlDQVenvXV5mQ+YaAwU+a8rHPdJTLrWLo874Yprg/W146JTrZ2c8D+kRCgc75W7+i68Vgw
 c3ERnLwx/+r7WbeXNogIu3VkAGxZd4DVe9IVHZM1VgzGMuiwWGhqwjFQhNIDvkHiQafY8gv4n8N
 4e+AeGSIMwvK16HG4j0Fh+PRXVejn30ETWoPopWUJgLOYw6FgAwoLGhtbBamiEcZ/2BfOcRJnQn
 lMmA8aUz53ltuU54YS7W2lea2v1UNEbeiH7Y2RsYLhOSv5xaM7HDUBwoIKM0PA4W7TYRXLMDo4A
 hibzEcKDverUv80zgy14glTsGVr1KXUrtDrCU9n0soHtl64ds6l4YisudJ7dJOps5Y6BmSk7vcS
 qkmMDEVftE6j5iJTPdg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-14_04,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 clxscore=1015 lowpriorityscore=0
 priorityscore=1501 bulkscore=0 impostorscore=0 phishscore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605050000
 definitions=main-2605140160
X-Rspamd-Queue-Id: 58C515444EA
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-107674-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[srinivas.kandagatla@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim];
	RCPT_COUNT_SEVEN(0.00)[7];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

apr_callback() currently validates all received packets against
APR_HDR_SIZE before queueing them for the RX worker. This is not correct
for GPR packets, which use a different header size.

Validate the received packet length against the header size matching the
packet router type before copying the packet.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 drivers/soc/qcom/apr.c | 17 ++++++++++++++---
 1 file changed, 14 insertions(+), 3 deletions(-)

diff --git a/drivers/soc/qcom/apr.c b/drivers/soc/qcom/apr.c
index 127204c195ea..68b357462438 100644
--- a/drivers/soc/qcom/apr.c
+++ b/drivers/soc/qcom/apr.c
@@ -165,9 +165,20 @@ static int apr_callback(struct rpmsg_device *rpdev, void *buf,
 	struct apr_rx_buf *abuf;
 	unsigned long flags;
 
-	if (len <= APR_HDR_SIZE) {
-		dev_err(apr->dev, "APR: Improper apr pkt received:%p %d\n",
-			buf, len);
+	switch (apr->type) {
+	case PR_TYPE_APR:
+		if (len <= APR_HDR_SIZE) {
+			dev_err(apr->dev, "APR: Improper apr pkt received:%p %d\n", buf, len);
+			return -EINVAL;
+		}
+		break;
+	case PR_TYPE_GPR:
+		if (len <= GPR_HDR_SIZE) {
+			dev_err(apr->dev, "APR: Improper gpr pkt received:%p %d\n", buf, len);
+			return -EINVAL;
+		}
+		break;
+	default:
 		return -EINVAL;
 	}
 
-- 
2.47.3


