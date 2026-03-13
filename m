Return-Path: <linux-arm-msm+bounces-97326-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AK2GEh+0s2lYZwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-97326-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2026 07:52:15 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id A89C627E5E2
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2026 07:52:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B8D5930C0FC0
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2026 06:49:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E9DD5344D92;
	Fri, 13 Mar 2026 06:49:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="B/60IyaF";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CG3Tz/jK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D3A933F8B4
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 06:49:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773384593; cv=none; b=lbAh21gWF3+DSidRUV5k4gj+OXMnGyhaZn+lApBT1UUeAtTssisAXkj/eN2UI2FraTtPPQuuXhVtKHvGiBEaJxpOJciaalppuZvRx/fOREjUckFqQf+83XxM+V4WffDlPqgWE23/AUOeIfsMtgRMXM49tjQYR4E1l/WhTnuq/k0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773384593; c=relaxed/simple;
	bh=1MnAcOLx4PCMb5gcpoEh/1Z1hW023S7M6GRMHHtlKLA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Hz9zffNm0bwQAVRZqvauL4pGhXLAq7Ej4NUfbpmjQ9RqxRQle2kjYnJR4VZBGZ0CyCdMgdHfmfFvkI+zQiEku1n+yU45m3hjGoJR8br6iNUdvOxQ16m/12DCaj6I4hvj/OlfbFxC//wIWtJGusZ1Wp8Vy7VApavsaAaOxmAg+Ng=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=B/60IyaF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CG3Tz/jK; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62D5tbRB3466738
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 06:49:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RxmfRvfiRh5EUIJOf3+nb5lHp4eC5Rxoat19w1qMQgw=; b=B/60IyaFTEQblyBL
	IWqXfMOW93sgSJnlSuyg8UJQUHGrkISHXzwsiqxVLeyqfowDemIZguR6K5OCUk06
	yAcyBmXo9jnhy6rifmSpzLnd1SMw8PB5IzUndIT6BblqZ8QgcjD9D60qrp33TD9r
	F0bFhL19SmdQOHHywN19FycNWVG2oQWFuM75HfuYT2t9mr4LZp/m1uYM1jfRQ06j
	Tu0BmG3PElLOiz3D9jLQyd6Kqp+cQdSlIQTngs2GUGHda0/38Y/6y1+Sym+v1R+S
	ascgmSwQKDaJjKegdOYATATjrVyO/p97n4Ed+IBcOfQNmbXw+z+X3aAkfZ3m+1o9
	LOrTYA==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cuh60mv48-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 06:49:51 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2ae50463ba8so149047935ad.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 Mar 2026 23:49:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773384590; x=1773989390; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RxmfRvfiRh5EUIJOf3+nb5lHp4eC5Rxoat19w1qMQgw=;
        b=CG3Tz/jKMdelq4t5HeO5dTpyzC74l01FlHPuxFSdmgTkuvdjjSuXcMVaWdVxNkB+Y4
         atlfzItjzTMiATWke27yFoS7C1a587UiiA3N51xyYGUhhLN79qpPw1b9C2C/s/uOynu9
         8gwFw4ct4H+gbJDZeKS7AWAycCzKPsSpE5m1RFAsVjtPtQHOwqL+IwAWpk4GkkzLOc9P
         iW9NxMpUjQOrqA6I4KBRksNERvAW5YtpOpBUIZpbfCPxAeyecaMId77GlyvObuS2BMAh
         jytnN8T7mPVHTh2cutf63a6k9LoJTWO9TEobhQR+GTApWh7VAXRGYjycX/ejqqMeayVM
         XbNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773384590; x=1773989390;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=RxmfRvfiRh5EUIJOf3+nb5lHp4eC5Rxoat19w1qMQgw=;
        b=W740Qr/OKHDQp4rC+NdWSjmeVB0tE7CLhhsu8QSCiHtWF3CqATLy9+pUgaNccm5bIb
         CWzAiqXtbIGy04yv011HHikTfnY591vuri9F60gOtd7dIILIahBqkdvlH9YPC4+3UkAv
         u6IkI5Q3+m920t0ucxUhyfoiqNZg2RcBVsZfUfp40fYT3STVyQP/JmIyyEwAxKauwMLQ
         JBBuoh6LXJZOlL8BHOJGJMAWIw5LxpGwgPGIYya2x8OfaPfvdgSKEZLr9zBw0RRHI7OT
         cciYDC7mW7xQcHNvNmZZ8UWBiMBP3KuQficmpdu5e/VgA4/S9n8tpd5jiThTee5Vg7Rz
         59qQ==
X-Forwarded-Encrypted: i=1; AJvYcCXkS8FQhRTueQNHD4Va129L+iweH8zQ2vKvaVJ+xmjp7o8//6he4B+LSxaZMhLKgjmFaJO2inWlJ82ijBol@vger.kernel.org
X-Gm-Message-State: AOJu0YxvVz6yToKQLqgNdXy4nAcFLgyUIfwRjQSKQXndzk+gIQi0xgbZ
	Iod4DaSKibbe/PW2TmkPbXjnyLM/ANgUyJegKqyjNyQ5P8JW7077B8YNefWqf23xnjJL7PL0aHK
	KfWq6xKwzaM1h831cYgmq8/2G4fQcSwVzz2nO/oGzq6gf/w0zlgu6tWFnRQUgeXll5rg1
X-Gm-Gg: ATEYQzzNXqf7N6hkMxI5zuZNmYt/y2RVJNhha8aEAwPCYsB91BnV/k1lSB8veQsFFSY
	jAQuvLtEsEK5/iT2y45axjFJsEKONfpvFTb4FjSdetT9lVCWECkq8FPj3EyACBTZyv3nuyMM4Y+
	MMsmW5Geu1hcykJyWaHAMJ2a8twVQ+Fejb7Z1eiTGQ5oVTRma4HILBvGbKDp8A0rgAf9RwwKPk9
	b5O2dUa9YJDCmF5+72+Ea/+rfEC8vrVMm/IQISTjw5Gb0bXjjMY+xM0URtcnDH0Gq4joLUSJEVp
	JLLdNhKHORc8KDtxPjG+rdy2N9dCNFz3gSXvW0F1vXO+gKKiOsOpSWfLw0H3CSjDnPfQMPboIOW
	tQPc0lenJWX2LZacFk6fZ9qXECriFblN/UBHZ0qkOIiwtExs=
X-Received: by 2002:a05:6a21:7704:b0:398:c0ba:9cef with SMTP id adf61e73a8af0-398ec9bb845mr1879510637.4.1773384590114;
        Thu, 12 Mar 2026 23:49:50 -0700 (PDT)
X-Received: by 2002:a05:6a21:7704:b0:398:c0ba:9cef with SMTP id adf61e73a8af0-398ec9bb845mr1879489637.4.1773384589622;
        Thu, 12 Mar 2026 23:49:49 -0700 (PDT)
Received: from hu-sumk-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c73eb97b41dsm936160a12.5.2026.03.12.23.49.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Mar 2026 23:49:49 -0700 (PDT)
From: Sumit Kumar <sumit.kumar@oss.qualcomm.com>
Date: Fri, 13 Mar 2026 12:19:27 +0530
Subject: [PATCH 3/3] bus: mhi: ep: Use batched read for ring caching
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260313-dma_multi_sg-v1-3-8fabb0d1a759@oss.qualcomm.com>
References: <20260313-dma_multi_sg-v1-0-8fabb0d1a759@oss.qualcomm.com>
In-Reply-To: <20260313-dma_multi_sg-v1-0-8fabb0d1a759@oss.qualcomm.com>
To: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Veerabhadrarao Badiganti <veerabhadrarao.badiganti@oss.qualcomm.com>,
        Subramanian Ananthanarayanan <subramanian.ananthanarayanan@oss.qualcomm.com>,
        Akhil Vinod <akhil.vinod@oss.qualcomm.com>,
        Manivannan Sadhasivam <mani@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Robin Murphy <robin.murphy@arm.com>,
        =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Bjorn Helgaas <bhelgaas@google.com>
Cc: dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org,
        iommu@lists.linux.dev, linux-pci@vger.kernel.org, mhi@lists.linux.dev,
        linux-arm-msm@vger.kernel.org,
        Sumit Kumar <sumit.kumar@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773384567; l=3155;
 i=sumit.kumar@oss.qualcomm.com; s=20250409; h=from:subject:message-id;
 bh=1MnAcOLx4PCMb5gcpoEh/1Z1hW023S7M6GRMHHtlKLA=;
 b=NG0SR4yVM0HV9OxMyQEnpKZl7hPzWEPlYMzQKUu/FDNzjAOqk6TmOE7GksQxJPF6zYeVbDVTJ
 96I85imVw15Ar0TX2v3sEbYcdkfX+Awb8CRi+kd2+Xn4L5c6xARalAW
X-Developer-Key: i=sumit.kumar@oss.qualcomm.com; a=ed25519;
 pk=3cys6srXqLACgA68n7n7KjDeM9JiMK1w6VxzMxr0dnM=
X-Proofpoint-ORIG-GUID: 3BYOk0-NBWVhrAdjaxy5pOgCVlF9Tk9T
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEzMDA1MyBTYWx0ZWRfX2FCK8n9brMql
 ZHANLhpynl9wbTfHpXIE0ZYysEJTMt0drT3ZR5/tc78XHaIpg4ox6ut/Up9jxNQREuMIcT2gMx+
 a8S8I43WAx0q17j6LN37F1/R0NXsaUQim1AIGobgmJ3CZ062+CDB/K3cSTPzTq7dK/5eHJYHTkq
 RL8HzdnM3srexwabeRQVkpvZvsz3mpMGG/CqF6z67A8MOhF7Wg+aY8nJ9cD5XKG9n1rFbqr7lsQ
 ealtqudoqWmLA5yKFU9pH68FdkZW9Xkv2485yWFX27UQ05yDDHuW6OeNdk/nth4cEkzSaNQB44a
 W2nPkimCEB7hizvGRARbwdadRiRmmKySI4zZRoJ98IRLetbjr+6FlXZgbI84IMVQlX6AuO93sJ1
 927AI9jDfkNpVqKWhotJDm8FhSwgP40BLYxotoouJueI8WD4gigFzWIkRpuZQNL/uT0EjMM+KYW
 UMft1Dd60xtPFkpielQ==
X-Authority-Analysis: v=2.4 cv=DsRbOW/+ c=1 sm=1 tr=0 ts=69b3b38f cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=gm0tR4x7yrig-FKTUfQA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-GUID: 3BYOk0-NBWVhrAdjaxy5pOgCVlF9Tk9T
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-13_01,2026-03-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 impostorscore=0 suspectscore=0 adultscore=0
 clxscore=1015 bulkscore=0 spamscore=0 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603130053
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[18];
	TAGGED_FROM(0.00)[bounces-97326-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sumit.kumar@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: A89C627E5E2
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Simplify ring caching logic by using the new read_batch() callback
for all ring read operations, replacing the previous approach that
used separate read_sync() calls.

Signed-off-by: Sumit Kumar <sumit.kumar@oss.qualcomm.com>
---
 drivers/bus/mhi/ep/ring.c | 43 +++++++++++++++++++++++--------------------
 1 file changed, 23 insertions(+), 20 deletions(-)

diff --git a/drivers/bus/mhi/ep/ring.c b/drivers/bus/mhi/ep/ring.c
index 26357ee68dee984d70ae5bf39f8f09f2cbcafe30..03c60c579e12c3bad100c7e1b6a75ae0e5646281 100644
--- a/drivers/bus/mhi/ep/ring.c
+++ b/drivers/bus/mhi/ep/ring.c
@@ -30,7 +30,7 @@ static int __mhi_ep_cache_ring(struct mhi_ep_ring *ring, size_t end)
 {
 	struct mhi_ep_cntrl *mhi_cntrl = ring->mhi_cntrl;
 	struct device *dev = &mhi_cntrl->mhi_dev->dev;
-	struct mhi_ep_buf_info buf_info = {};
+	struct mhi_ep_buf_info buf_info[2] = {};
 	size_t start;
 	int ret;
 
@@ -44,35 +44,38 @@ static int __mhi_ep_cache_ring(struct mhi_ep_ring *ring, size_t end)
 
 	start = ring->wr_offset;
 	if (start < end) {
-		buf_info.size = (end - start) * sizeof(struct mhi_ring_element);
-		buf_info.host_addr = ring->rbase + (start * sizeof(struct mhi_ring_element));
-		buf_info.dev_addr = &ring->ring_cache[start];
+		/* No wraparound */
+		buf_info[0].size = (end - start) * sizeof(struct mhi_ring_element);
+		buf_info[0].host_addr = ring->rbase + (start * sizeof(struct mhi_ring_element));
+		buf_info[0].dev_addr = &ring->ring_cache[start];
 
-		ret = mhi_cntrl->read_sync(mhi_cntrl, &buf_info);
+		ret = mhi_cntrl->read_batch(mhi_cntrl, buf_info, 1);
 		if (ret < 0)
 			return ret;
+
+		dev_dbg(dev, "Cached ring: start %zu end %zu size %zu\n", start, end,
+			buf_info[0].size);
 	} else {
-		buf_info.size = (ring->ring_size - start) * sizeof(struct mhi_ring_element);
-		buf_info.host_addr = ring->rbase + (start * sizeof(struct mhi_ring_element));
-		buf_info.dev_addr = &ring->ring_cache[start];
+		/* Wraparound */
+
+		/* Buffer 0: Tail portion (start → ring_size) */
+		buf_info[0].size = (ring->ring_size - start) * sizeof(struct mhi_ring_element);
+		buf_info[0].host_addr = ring->rbase + (start * sizeof(struct mhi_ring_element));
+		buf_info[0].dev_addr = &ring->ring_cache[start];
 
-		ret = mhi_cntrl->read_sync(mhi_cntrl, &buf_info);
+		/* Buffer 1: Head portion (0 → end) */
+		buf_info[1].size = end * sizeof(struct mhi_ring_element);
+		buf_info[1].host_addr = ring->rbase;
+		buf_info[1].dev_addr = &ring->ring_cache[0];
+
+		ret = mhi_cntrl->read_batch(mhi_cntrl, buf_info, 2);
 		if (ret < 0)
 			return ret;
 
-		if (end) {
-			buf_info.host_addr = ring->rbase;
-			buf_info.dev_addr = &ring->ring_cache[0];
-			buf_info.size = end * sizeof(struct mhi_ring_element);
-
-			ret = mhi_cntrl->read_sync(mhi_cntrl, &buf_info);
-			if (ret < 0)
-				return ret;
-		}
+		dev_dbg(dev, "Cached ring (batched): start %zu end %zu tail_size %zu head_size %zu\n",
+			start, end, buf_info[0].size, buf_info[1].size);
 	}
 
-	dev_dbg(dev, "Cached ring: start %zu end %zu size %zu\n", start, end, buf_info.size);
-
 	return 0;
 }
 

-- 
2.34.1


