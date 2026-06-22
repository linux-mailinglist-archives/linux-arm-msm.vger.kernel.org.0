Return-Path: <linux-arm-msm+bounces-113916-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id qjYJAqnDOGr+hgcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113916-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jun 2026 07:10:01 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 70DDC6ACA8E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jun 2026 07:10:00 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=hvRL0yEL;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=guvsO3tN;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113916-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113916-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7E0F7302DA15
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jun 2026 05:09:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5C2CF3546EB;
	Mon, 22 Jun 2026 05:09:30 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF21C356756
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Jun 2026 05:09:28 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782104970; cv=none; b=mBjKmO0l6YgwcqVO+iJGxQ5wAYzgj9sok9/0F/CUZKSTuQnx0/s+B8udH17HNPJf5q+yzb8ioFkM2qEdqZAYmyw+iRmKMx1CGktc9HMYVh9jCtSXexs+dmehccTL9KXOKqaZBps7e3b8mowJ63Q/GOxkC2f9BOM9/B6r2lYA9GE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782104970; c=relaxed/simple;
	bh=gGfaQBQV4ve45W3l4vga1g6v8XiqE+OMpkXU/G8WWwU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=feeecgSxiwBVhkx65oN6f7El+Z4asYE1w5UeFqe2OLBYHwBz6fWgO4aO6kHwoaQRE7n8Ib+CtY/uPbqeSLlm4jIxIU/HyhbwDdEjbQHxdAmWsNE1DwMs1wdT6FoJL67OIxOnRfWoPT2AsiVfgE+NaKZzTSm2upvJEeLXdoyoius=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hvRL0yEL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=guvsO3tN; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65LLTl6O3491582
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Jun 2026 05:09:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rFRW4uvz7oIyfQLLlTaUlea6eRZCi9oGvqy2/uhqCNc=; b=hvRL0yELe8o/N2tO
	J9l/e+TBTR0BSS8yq8+ypjq9FklOyYMpl/yExOtjX4PWLjwDQ/MjtnZQL/N8cQhE
	oMdl7X+ORpcnCYlkLpz5EYkG8dwCwp4/G/rmYFx6JFpg63f+2tQSu4DNOoxhCZSY
	vJK/jNa8NDcD8Dk1Ub6eWJsyaa9G+DhWtTb7r+MRZM3p0RDPlkiwjj7JNEjOT4uZ
	WVjKsyt+nnNOqOeEFljezIJp5Byf+4hnbWoEiIRvEbhFE6vC1UVx7pDi8nTQtWU7
	9FMGFkNA+XhnW+EN5B8FjFr8JxwRyv9am+kd25X3ws/ri/RQiJjzq3B4VkkRH7A5
	1cEc+g==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ewhv5mxgf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Jun 2026 05:09:27 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-845438fbd9cso2905807b3a.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 21 Jun 2026 22:09:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782104967; x=1782709767; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rFRW4uvz7oIyfQLLlTaUlea6eRZCi9oGvqy2/uhqCNc=;
        b=guvsO3tNBBT+/dGGVzwu6Om2aHV1cjjRHegLGXpgUj2e/Ej4dCDShZN8vjV9uXlgTI
         K7vcenn4Equ0XqACpSeMQANijAcBIbwr97xK1Rl/Bv/aeVqz6FEv3LVc8hDGYo7wWnBo
         68ZT/5q0C7msD5XGFwlBMSGbGyLyeTc0Qot6he++J0MJR9SmffUJSSzDxg1xqdRO4q8b
         eL60pCT/fcS1GcZu1uBd8tA6cNs7rRF0zl0GHuVXQ8AwJc1kbigDvUb1FmEiQsF7aqIj
         LBuTSfU4GZu2uLhEbxdDZNkhfNGqHe0xa34H1mEn9KQUw6+f+LinmIf5+eiGIizCHgqJ
         bv+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782104967; x=1782709767;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=rFRW4uvz7oIyfQLLlTaUlea6eRZCi9oGvqy2/uhqCNc=;
        b=CN3pQuiDqeFRlfWNU8fnWicp5eMlBG73j81U/S/WZe3h9fLoBAEW0vPVl0Tad8H9Ov
         LMjNA5UPu7GBPfUWcoo2yOPm7HGESoe5mQUN3rKWOqJjteBBN4UBP+t2DOPM8znEi9kD
         c1IqUtGEHZPNd7woKmZu3y7AiiCO81t+P+mxdXQqXfIYWoiQbCLXacPkq1XYh64sV0rT
         ju9zOy4ZfdvIkBOXwZrPZdsPSD9lJNbIPRAUlfMAkoNJZILE4dx0w37OVhlynsu/gOrR
         YrZjA25ZaGTkKbAmrxSkliVKF8locyjiTCzyamok+a5samipDlCNTWTIw2IvY8WFdHvE
         DCLQ==
X-Forwarded-Encrypted: i=1; AFNElJ+1ZnuR1QbfPKwcGLJu78h7BxnMeAdehG8LQkNnWLAndZcNfIc30i6oPjfQ6WTImc6a6w34Duf9DeE/X+35@vger.kernel.org
X-Gm-Message-State: AOJu0Yw/GHIQ+O5pUayB7hHMDoWAZcBu18HWae1Ihm581r1nOSJZIAqK
	MvR5wApSv/qsbnkqLHxdT9Rzqdk4eqDWEDzhAJ0viReTooVEX4W24HdIUiaBV6/m0zD4DlGSeDh
	eKZHrRYAQUR5UAMVA3tCn3LLs/Jgn4RSeO4pi6mL/6YMHr4zeZuxm8Mgv8/7Q0c3Az2leDe/Ykr
	5z
X-Gm-Gg: AfdE7cksTHOQzAU1JEVEihoNJFH3tAVXTk3d6exC3z/BODI6hEl6jXHvxoPQFyQYu2B
	pQtds0dmddI1m6qEF2jhds1QNGZGi2iBaQFbHRHfneNvD+1ZVmz13yTOCYa6+UlvD4Kt2jeWjBQ
	hXyW62WIkvPlLnGTqWA1XtE8iKPgVIwsTg1Ja7HJABmgoXaLOmZ3ybHa3ebETFDj03TdH6NWziW
	RiqNHsV4DJIssT4awskiI0ZbNOtWU+4siDhuKOvU5SUsVoc9Ll0rOk4d/GmUBx3dVtTiQbrFF1C
	FNQciCqHKr3gEZ83RqA31JxqP9la8HQBrL73hy/y6YHn1/vaU1uP1E5ElYsKcXzJ/Ftq1Ucc9ki
	PkFxQocVayuGbkSAprsVsSCbGcnMi1A2VwTdP
X-Received: by 2002:a05:6a00:1307:b0:842:21f0:5113 with SMTP id d2e1a72fcca58-8455088e136mr13692083b3a.24.1782104966682;
        Sun, 21 Jun 2026 22:09:26 -0700 (PDT)
X-Received: by 2002:a05:6a00:1307:b0:842:21f0:5113 with SMTP id d2e1a72fcca58-8455088e136mr13692050b3a.24.1782104965798;
        Sun, 21 Jun 2026 22:09:25 -0700 (PDT)
Received: from hu-sumk-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84564d6c5dbsm5905996b3a.12.2026.06.21.22.09.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Jun 2026 22:09:25 -0700 (PDT)
From: Sumit Kumar <sumit.kumar@oss.qualcomm.com>
Date: Mon, 22 Jun 2026 10:39:16 +0530
Subject: [PATCH v4 2/3] bus: mhi: ep: Add mhi_ep_queue_buf() API for raw
 buffer queuing
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260622-loopback_mhi-v4-2-782b3a0f2eef@oss.qualcomm.com>
References: <20260622-loopback_mhi-v4-0-782b3a0f2eef@oss.qualcomm.com>
In-Reply-To: <20260622-loopback_mhi-v4-0-782b3a0f2eef@oss.qualcomm.com>
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Sumit Kumar <sumit.kumar@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782104957; l=4444;
 i=sumit.kumar@oss.qualcomm.com; s=20250409; h=from:subject:message-id;
 bh=gGfaQBQV4ve45W3l4vga1g6v8XiqE+OMpkXU/G8WWwU=;
 b=Inx12IRZtn+PGKi5C1sB8q4ewBGMbnrNj8GYASSzmUwR1k7xA3mbnVEG8aUXfV+Xod2ur6uq5
 01H8HcJBDr8BFAzLvLBvrjsrtJTYRYlP8ncdGf4jBCr4NQ0tn5QOv4s
X-Developer-Key: i=sumit.kumar@oss.qualcomm.com; a=ed25519;
 pk=3cys6srXqLACgA68n7n7KjDeM9JiMK1w6VxzMxr0dnM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIyMDA0NyBTYWx0ZWRfX9GuVfS7Gpug/
 geqdhQmYVhuH2fm2pX/TJoyxOoJ7bHEQHyMDbvsnjLoaiVwku+KYcbi3bE8Z35vOKh6yxxr058T
 1CD/OeZMIb/hzBh028duFRX5uc7SzUFuFFhktXFWXu7n+AMOoV+nnRBR/BBjNvpA1FDC5lfKgQC
 fqlEyEd7Swbcxlsdu8XcBWF34bnimvyiMHoTMUD4imhbWIqMFvhk4OVc/NKmWrars5kWzNRJzNZ
 6Y2OL1hEXZB8OYkc5Ckdcr/4MgjfNuCVGxCM3yGF2EWnLIabxKcUZ+kb9ifU0IIhXUBdVlmiXfq
 G52dpk52He5fAcQO7iiIBsjr15JvZx4q0hbp+z3eZhCJTU3uFcP0hSj7jB2YZgcyA7RkouWZbpT
 wanAX+cgnldp4ESj+bymZBV451mygLbJ5zG6fcjHN+9VZLlhwQEG7Orl3OocD8AOs/pCsa2IC73
 O28eS9N686L56DIGxkg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIyMDA0NyBTYWx0ZWRfX+5QJcxMuBU7h
 JRLc0qTIujeZW/K0EN+nFXiN2o5T+OnV9j5abvxx8UU2NqWb1/fmnHIq5AwVyQj8iXmhsrOxl3C
 28ZsWA49XngmCnYuXsfSKmgwhA1M5ZQ=
X-Proofpoint-ORIG-GUID: 5-vL6CxHCEDPk26dD-V6A1qkAiEzDWTe
X-Proofpoint-GUID: 5-vL6CxHCEDPk26dD-V6A1qkAiEzDWTe
X-Authority-Analysis: v=2.4 cv=UrZT8ewB c=1 sm=1 tr=0 ts=6a38c387 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=27Ti7_ZD70JoqEhemiIA:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-21_02,2026-06-18_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 impostorscore=0 clxscore=1015 malwarescore=0
 bulkscore=0 suspectscore=0 priorityscore=1501 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606220047
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-113916-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[sumit.kumar@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:mani@kernel.org,m:mhi@lists.linux.dev,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:sumit.kumar@oss.qualcomm.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCPT_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sumit.kumar@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 70DDC6ACA8E

Some MHI endpoint clients do not use socket buffers and need a way to queue
raw buffers for DL transfers. Add mhi_ep_queue_buf() to support this use
case.

Refactor mhi_ep_queue_skb() to delegate to a new internal mhi_ep_queue()
helper shared by both APIs, and rename mhi_ep_skb_completion() to
mhi_ep_buf_completion() to reflect its broader use.

Signed-off-by: Sumit Kumar <sumit.kumar@oss.qualcomm.com>
---
 drivers/bus/mhi/ep/main.c | 29 ++++++++++++++++++++---------
 include/linux/mhi_ep.h    | 15 +++++++++++++++
 2 files changed, 35 insertions(+), 9 deletions(-)

diff --git a/drivers/bus/mhi/ep/main.c b/drivers/bus/mhi/ep/main.c
index b3eafcf2a2c50d95e3efd3afb27038ecf55552a5..d44e1e54cfb4404b6589aab372e687db7492d3c3 100644
--- a/drivers/bus/mhi/ep/main.c
+++ b/drivers/bus/mhi/ep/main.c
@@ -516,7 +516,7 @@ static int mhi_ep_process_ch_ring(struct mhi_ep_ring *ring)
 	return 0;
 }
 
-static void mhi_ep_skb_completion(struct mhi_ep_buf_info *buf_info)
+static void mhi_ep_buf_completion(struct mhi_ep_buf_info *buf_info)
 {
 	struct mhi_ep_device *mhi_dev = buf_info->mhi_dev;
 	struct mhi_ep_cntrl *mhi_cntrl = mhi_dev->mhi_cntrl;
@@ -544,22 +544,22 @@ static void mhi_ep_skb_completion(struct mhi_ep_buf_info *buf_info)
 
 	mhi_ep_ring_inc_index(ring);
 }
-
 /* TODO: Handle partially formed TDs */
-int mhi_ep_queue_skb(struct mhi_ep_device *mhi_dev, struct sk_buff *skb)
+static int mhi_ep_queue(struct mhi_ep_device *mhi_dev, void *buf, size_t len,
+			void *cb_buf)
 {
 	struct mhi_ep_cntrl *mhi_cntrl = mhi_dev->mhi_cntrl;
 	struct mhi_ep_chan *mhi_chan = mhi_dev->dl_chan;
 	struct device *dev = &mhi_chan->mhi_dev->dev;
 	struct mhi_ep_buf_info buf_info = {};
 	struct mhi_ring_element *el;
-	u32 buf_left, read_offset;
+	size_t buf_left, read_offset;
 	struct mhi_ep_ring *ring;
 	size_t tr_len;
 	u32 tre_len;
 	int ret;
 
-	buf_left = skb->len;
+	buf_left = len;
 	ring = &mhi_cntrl->mhi_chan[mhi_chan->chan].ring;
 
 	mutex_lock(&mhi_chan->lock);
@@ -582,13 +582,13 @@ int mhi_ep_queue_skb(struct mhi_ep_device *mhi_dev, struct sk_buff *skb)
 		tre_len = MHI_TRE_DATA_GET_LEN(el);
 
 		tr_len = min(buf_left, tre_len);
-		read_offset = skb->len - buf_left;
+		read_offset = len - buf_left;
 
-		buf_info.dev_addr = skb->data + read_offset;
+		buf_info.dev_addr = buf + read_offset;
 		buf_info.host_addr = MHI_TRE_DATA_GET_PTR(el);
 		buf_info.size = tr_len;
-		buf_info.cb = mhi_ep_skb_completion;
-		buf_info.cb_buf = skb;
+		buf_info.cb = mhi_ep_buf_completion;
+		buf_info.cb_buf = cb_buf;
 		buf_info.mhi_dev = mhi_dev;
 
 		/*
@@ -627,8 +627,19 @@ int mhi_ep_queue_skb(struct mhi_ep_device *mhi_dev, struct sk_buff *skb)
 
 	return ret;
 }
+
+int mhi_ep_queue_skb(struct mhi_ep_device *mhi_dev, struct sk_buff *skb)
+{
+	return mhi_ep_queue(mhi_dev, skb->data, skb->len, skb);
+}
 EXPORT_SYMBOL_GPL(mhi_ep_queue_skb);
 
+int mhi_ep_queue_buf(struct mhi_ep_device *mhi_dev, void *buf, size_t len)
+{
+	return mhi_ep_queue(mhi_dev, buf, len, buf);
+}
+EXPORT_SYMBOL_GPL(mhi_ep_queue_buf);
+
 static int mhi_ep_cache_host_cfg(struct mhi_ep_cntrl *mhi_cntrl)
 {
 	size_t cmd_ctx_host_size, ch_ctx_host_size, ev_ctx_host_size;
diff --git a/include/linux/mhi_ep.h b/include/linux/mhi_ep.h
index 7b40fc8cbe77ab8419d167e89264b69a817b9fb1..59f796e56207aaf8be09edc9ba4d1f59b665581f 100644
--- a/include/linux/mhi_ep.h
+++ b/include/linux/mhi_ep.h
@@ -302,4 +302,19 @@ bool mhi_ep_queue_is_empty(struct mhi_ep_device *mhi_dev, enum dma_data_directio
  */
 int mhi_ep_queue_skb(struct mhi_ep_device *mhi_dev, struct sk_buff *skb);
 
+/**
+ * mhi_ep_queue_buf - Send buffer to host over MHI Endpoint
+ * @mhi_dev: Device associated with the DL channel
+ * @buf: Buffer to be queued. On success, ownership passes to the MHI stack;
+ *       the caller must not free @buf until the DL transfer callback fires
+ *       with result->buf_addr equal to @buf. On failure, the caller retains
+ *       ownership and must free @buf.
+ *       Note: if @len spans multiple host DL TREs, the DL transfer callback
+ *       fires once per TRE, each time with result->buf_addr equal to @buf.
+ * @len: Size of the buffer
+ *
+ * Return: 0 if the buffer has been sent successfully, a negative error code otherwise.
+ */
+int mhi_ep_queue_buf(struct mhi_ep_device *mhi_dev, void *buf, size_t len);
+
 #endif

-- 
2.34.1


