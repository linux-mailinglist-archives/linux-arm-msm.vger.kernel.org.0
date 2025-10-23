Return-Path: <linux-arm-msm+bounces-78543-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 046A1C00798
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Oct 2025 12:29:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 7E05B357755
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Oct 2025 10:29:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 967EE30F54B;
	Thu, 23 Oct 2025 10:26:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AaKUTF3e"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59C8430EF7E
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Oct 2025 10:26:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761215180; cv=none; b=uWVA+sZQwSltbrI+KuB8XNwn8TtolkM08b52NB8iiCAPlJpr7QPET0RGKsMHzW2BYvZswiG2vYwUStGQzr2duO4A9JbD0TxihHPJEvcEVi1kFap5wrcuqgHgg7MYxmAnOXGkj8W3kMZQaaOP63RF9/PeCEEKBlb7YmMdFwG5wvk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761215180; c=relaxed/simple;
	bh=dLHz5GvCqsmxeiBqKMEL3HcMUOaRmWqxPH16ZJ+zr84=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pNa17NFLiC12i6dh+ROmddG2OD3U4pDhfc4SJcm2uK2Bq0BqoPP39WqSVkYVA5iA6VkDj1/5t67bYelvNCksIfK1qjf16pFGNe4lioOL99FrevRSRrDGrCk4TymSHUooDHFKphihdmIHGOPmFJk7WwkogvAANTq0LLMvRLJfP14=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AaKUTF3e; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59N6wGch022476
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Oct 2025 10:26:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=JitUmPpOE5T
	5FCzl9njQ018JnbQNGz2uQiWhNK3tWOE=; b=AaKUTF3epbbr6yJaNDjUCsqzLAm
	11y2e6WNB8UIH0mVSKCRRFMKznv1p93IpJS6wXXwKqUnUNbxFlFOG2EQ/OlzxA4c
	9tIAcIsOrIHToT+i59sbKkEbCooFaW0LfPCDclQbIfHIeGNX2K9+C+8Bx966Lqer
	Bm+QfkfGcdrVKXOR3rkyydsG1QyIvGczahYTE2R6yZFeYe+A9810EV9c4oN9m0i0
	ZUr9qSxzY8Dt0kJaCJERKrUM2bdEejoAQl575l/B7Z4Hx5yiVVnchdx48joQRnKQ
	gfsM7PH8mUmztwLPd0Sa7ZJ58TZVJeE0fs+64smAJQBzQgXOgCDVMuuDbEw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49v1w8812w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Oct 2025 10:26:17 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4eb7853480dso22157381cf.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Oct 2025 03:26:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761215176; x=1761819976;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JitUmPpOE5T5FCzl9njQ018JnbQNGz2uQiWhNK3tWOE=;
        b=bRhsCgZ6WLQrmmPtEMEraTwrF9VhuA5MnDGgI1PZpsvYfJe1zyBQOTHBCwqw6oG8Du
         WeD6Nt+mUaOSitld6uF1QhaK90d3TTsLOPtz813wREx9N2SbLy2P5enVsd3ZCocEgPOL
         BYhLdzplADvfuPpHytyaf24hrCieuvpLQj0/ObWUihlmmyJH1J7znAVxIAofYBiuIFQQ
         LJxWIB1gSJYv2HtbUTwP9xUBvB2r5amQdkKPEMUsJdgn5MmuK3SEDkxK3fcPJB8WTP0R
         d76NaUi2sTehwBch2BAA9ZFx2G30w+p50WOyl0iCe/i6CQ4M0Xo2JXQihVKC4uRidHNN
         5VPw==
X-Forwarded-Encrypted: i=1; AJvYcCV/KsIw2o2soTceV0eCxcBc+So1ZoYelMoyr9yB7QTzLADdgjZRKdHP9FqN+UZrd/4xrilqXF7mYwOvLVzg@vger.kernel.org
X-Gm-Message-State: AOJu0Yxd2DM03mYbbf3V7BebYdoe5QukIhZLVTpunLPRqlT7xJEAQPAm
	lcC6ChPhTzCWDF1sOU7CprEug0qOGs+62HRU3rfnq4fzNAIeX+mC38xqiuLVrbNdox9kgIzjEq/
	2mv1EBiA/ZtIdRBK5ZVgn28DuZYncpBmqV2HA22KUXM3EQjN5QQbuGWVm/FpXmyrOOhTL
X-Gm-Gg: ASbGncsRZDoofVrC1sCa5y6lInORoliJqJ+c2VnR1w0Oa0b2qqPqPUQkaVOet5+UbTg
	Pze2L+fy+yOrQY0c3rxeM9fP33nyeqbPIKi5Apsk6WnVMq2SywGEIHaiBPHe9MN4TtsDPYWON/z
	MTHypOzisV2O/8Br1EltQlR0YCf1/qolGQzTiRL7d8kk2i++wulhTUBhbCbrmno/sVze5MY4VOG
	fEifxAdA41ycSAHTd4I2EY4C/37wrotw6WsNIBih4tKGcpf3NL6lNuTOOydYnCL2c3xFI5b/OIa
	cWfnBGWySRGjgxRjh0WcmW+vZyfq2H0znUJAm/eUknBtcljzDiRTaNEwW5psSkeoHE6s/den6uI
	OsU3L4CKQzZl8
X-Received: by 2002:ac8:598b:0:b0:4e8:968d:b14a with SMTP id d75a77b69052e-4e89d28295amr268425391cf.22.1761215176224;
        Thu, 23 Oct 2025 03:26:16 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEj7fkh7+VmeztYn4QdA68cJbOaNXQj+xi9BZBCSrDbEh6Oo9ctMku5VaXZ9TTwndXPdbnPQw==
X-Received: by 2002:ac8:598b:0:b0:4e8:968d:b14a with SMTP id d75a77b69052e-4e89d28295amr268425171cf.22.1761215175778;
        Thu, 23 Oct 2025 03:26:15 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-475c427f77bsm92220685e9.3.2025.10.23.03.26.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Oct 2025 03:26:15 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: broonie@kernel.org
Cc: perex@perex.cz, tiwai@suse.com, srini@kernel.org,
        linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH v2 17/20] ASoC: qcom: q6afe: Use guard() for spin locks
Date: Thu, 23 Oct 2025 11:24:41 +0100
Message-ID: <20251023102444.88158-18-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251023102444.88158-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20251023102444.88158-1-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE4MDAxNSBTYWx0ZWRfX5U4p4CEt96t7
 KShUTnRAyfMoDUVzXnFBKkW3wpx7pzp6i9G2TmbQYFW0Frc0Vx3NdT4epBvopqNl3VTyOTihjK2
 oc3Nt5mhcw3aHAr6FnRzC5xOpe/XSAhzNyA4B0sMyLBo3cJYXLUBX19p3EsR4zSDdNJ3q/pINXL
 1DF4G+FYEdT1NBziF2yfK3Ws0RUoQcwZmzAeF8Xm6YY8j25CdkZhMkduGeVIwB1DgE74qTHYk/m
 nJ2hbBpUXdebxM1M4/YZxFUYujpXdrjaHqXEquV2uPVUAigNbzk480jiYkBph1n71n5v42BFC2U
 cNgePUmASfAlqI+i3gl2P66Ea9NOFZknqZlpBOEZFiDHaGKIYVndMRiBn0wVcdL9xIB853Nc8N6
 Ox2I+52g0yjRNSVAUFI1QMOQtLrCrA==
X-Authority-Analysis: v=2.4 cv=bNUb4f+Z c=1 sm=1 tr=0 ts=68fa02c9 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8
 a=RrrD4pAD4uqPltEmIwwA:9 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: NiWcR8bM8ajxmItkoespuMjLtpHG1Xid
X-Proofpoint-ORIG-GUID: NiWcR8bM8ajxmItkoespuMjLtpHG1Xid
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-22_08,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 malwarescore=0 lowpriorityscore=0 clxscore=1015
 priorityscore=1501 suspectscore=0 adultscore=0 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510180015

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


