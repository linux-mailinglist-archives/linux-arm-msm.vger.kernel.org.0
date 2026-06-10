Return-Path: <linux-arm-msm+bounces-112290-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 6bHwA9L7KGrgOQMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112290-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2026 07:53:22 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 7760F666040
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2026 07:53:21 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=jpDXfsIT;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=Eklz2DOQ;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112290-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112290-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 126E23052863
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2026 05:52:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AD8132DECA3;
	Wed, 10 Jun 2026 05:52:53 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DA24344D8B
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 05:52:52 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781070773; cv=none; b=DxrI4asQoenDLQin7gH6kWpSI70/mVYBAlN2I4tVOyZ8c76fPPzSAms1xuvmlpYRGXNd2IohWaPA16MkrmkOHQ0cXfTc6M2CsqJuk4ftcveFm+Vfely3BLWtWFyw6EyrPeQFl9XEidqAcym+r8Fc+9tO3PRp4yziarFB+ffqSD4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781070773; c=relaxed/simple;
	bh=kPiK4VVYK2YYSSKt+UOoRg5CfNLvCgE5KlbH1vf/nME=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZzE90LRJrTyNMpbcM9YJ2CoPQiRGqMU/dT7AGJniAhtSUxb4ykWlkENjL+KFSmva/5Cyt2EfzDOhUR1Af8u2Cw/CD3//I80OoBDuE2871EuAHn7QO2/05miziQrH0ihW9W1YYKCL5A2pEq+rVTL3QgME5oOXdZ7BVh36xrI7DOs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jpDXfsIT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Eklz2DOQ; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65A2eqvs4097280
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 05:52:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	avk5meTGBcIz3G48y/NS8SFzaal/HS1a4+vUZxSJN6o=; b=jpDXfsIT4AT4ka9V
	kFpZtT7578UkocoomF56qut2haoZtqeJoPeXeKJcyhW8LXhspVLysomeYybXw0Gt
	zhMYWTgeWZ3B0stIFdOtQTjA1CzFZLA0XZTnL/yMSVeQHkF8HNgO13GS/PqRsHpX
	dIPb33a+v3SXukEuUCjJUSWs+r1cU8cns6cvkXNm1Xz0lfiSGMy3bf0yRX2tAv33
	90JglukacCflDwjlcY5GFWhRc1L6EUc2PASloykGTI8+R90DNB7g6tJFyvjk48hq
	UnA6wJ79hxjXcdDQEEq37cPEdBHOY9YVOLbDdY+hhnynzMS1Y20RuvemP6l8mnkI
	xXKKBw==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4epg3jw50f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 05:52:51 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2bf32fb7cb2so45784395ad.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 09 Jun 2026 22:52:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781070771; x=1781675571; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=avk5meTGBcIz3G48y/NS8SFzaal/HS1a4+vUZxSJN6o=;
        b=Eklz2DOQ97+Yv46xlzGxrD7X0QoW+MwQ3+kjyjobDb/gzLiaFlhUJB6sGd8ulYc6/x
         dfBS65N3tuaNi8QSWK0vETDNZpblfPT86xyTww/eB/QvA9Hn1x5Au0nvqOsJDyIPTP/D
         oQUPRaBkINfWJ8po3rHMX4XwqC1IXrD23W/EwBIGxB7rrmI1Ksrp+3PxgGsv/Wbyiwzt
         z8g9qJNRYCYaHjbgNaSNA+/Frv0aZw4f9BsMzjDYfrLxsHIzl7feMZECtfpt8E0Zmoop
         lLgGC7GPqL4Zo5ocKUe82MdyJS3M3LMhPgNxrpd0GCOhwbguSmSGvczjqw9+/PDN2wkI
         t+gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781070771; x=1781675571;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=avk5meTGBcIz3G48y/NS8SFzaal/HS1a4+vUZxSJN6o=;
        b=MvYCfG7ua6CpyW4vudr0LfDNYCCuriejsGM9SMBFJeMMCBiBdi6hC0qxXqathzXTyV
         KiW3RBz1B8bYu2PYR5GKOMwUyFdtRV8//+M885O7yWBAI0du/q8f30Whz0pu3lYvtxcC
         uZz7Ue9A88jkQBNC8roqdpjSJrLzP9HMps+1EywenCJ5iiaePrktmMcX2cnz9VNnnBuS
         /Q03zOQv6CMf903DRX9kXfSNuSnWvpbjByM4ocJGISkcmVJ2bAZmdEUkOwGuEZ36QTst
         muKxC3dOixFEfjR6fsLoJ1hph93+DQMuk6v0L9qaCoRarvUiOPvBVs8oSwHhi0Kt4Lq4
         HTVQ==
X-Forwarded-Encrypted: i=1; AFNElJ9f3X795q+CAeepXfBSHoudV4eO187/7Y7+aLg4rB3itm/4xwgZ98kp0yeJS9Pfb2vSXmoNzwKyIYM6hGrZ@vger.kernel.org
X-Gm-Message-State: AOJu0YwNafZiHidbPVxdo8IYGvVOk3XJIQhChoxE3SOF16dUiRpwViLy
	GrroZlCuuXq9R4khinMlWdkHaEykB9wvI2kpr4l6+gP4U5RbTHOcfwol8cMKfBtCP9Oe/OrUaSC
	sh4eWf9OudYUVIikeQiRItquvjxwiL9iMR1sXHhInt3l5Wkw7SjR4kyWanuUOCckzFnzs8lRz3+
	kc
X-Gm-Gg: Acq92OEPGQX68g4hoIqTDvWs2VYBM5vmlURQ1ulnOCbLrMHVX0oZf0qO7l0l0/DvFNu
	YpB6GIeu9Sg/as4nusYAni7S6jMpgetudfrYX+SAb4Hpk4VLfE8CCG2oniyQUiiiRd6gykdQawW
	ZZ+oIO9OliU2azhKi8ijF3qr3YplqCQE7wQ7X4H8IZMUqsOtalnmeZYA6oTGt2cwWqeLAaiCm0t
	JYeIvWT4nStc/XVpGSzMNiTl4p6yNaV+0KvI4YM89QZ2C/p24hKiNLoAV5tHM5nmOxVHgnJEnzf
	+/fgLY7wz9mmN42+omvyPhkrerJebhxxEd0TkpIA1NaVUQ99NQMtVUtMIs1BTVIO5Sr6eNK91J5
	8h/sicdcrR5Tea0k/wFwIjh9M/aVxqoCJEJF4F3M10HEz2CJgPCqZxaCA4A==
X-Received: by 2002:a17:902:ffce:b0:2c0:a746:7aff with SMTP id d9443c01a7336-2c1e80ebb9amr268984225ad.24.1781070770782;
        Tue, 09 Jun 2026 22:52:50 -0700 (PDT)
X-Received: by 2002:a17:902:ffce:b0:2c0:a746:7aff with SMTP id d9443c01a7336-2c1e80ebb9amr268983905ad.24.1781070770232;
        Tue, 09 Jun 2026 22:52:50 -0700 (PDT)
Received: from hu-sumk-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c24edc8acasm108601105ad.45.2026.06.09.22.52.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 22:52:49 -0700 (PDT)
From: Sumit Kumar <sumit.kumar@oss.qualcomm.com>
Date: Wed, 10 Jun 2026 11:22:26 +0530
Subject: [PATCH v3 2/3] bus: mhi: ep: Add mhi_ep_queue_buf() API for raw
 buffer queuing
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260610-loopback_mhi-v3-2-a733c0cef61a@oss.qualcomm.com>
References: <20260610-loopback_mhi-v3-0-a733c0cef61a@oss.qualcomm.com>
In-Reply-To: <20260610-loopback_mhi-v3-0-a733c0cef61a@oss.qualcomm.com>
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Sumit Kumar <sumit.kumar@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781070762; l=4302;
 i=sumit.kumar@oss.qualcomm.com; s=20250409; h=from:subject:message-id;
 bh=kPiK4VVYK2YYSSKt+UOoRg5CfNLvCgE5KlbH1vf/nME=;
 b=q4wkcXgb9kSyURpLBh9O/mKjiY/e3Q45Mu4AC/46kfOxEMBEgeGRBEwxDgEYIfi4SctX4pwcR
 D7bJIgV7+RWC93s7so8eWsurMOAJUZhs1AD3sJj9oOuUYon+1d0ryER
X-Developer-Key: i=sumit.kumar@oss.qualcomm.com; a=ed25519;
 pk=3cys6srXqLACgA68n7n7KjDeM9JiMK1w6VxzMxr0dnM=
X-Proofpoint-GUID: J5RovMApJFgpBjZs7zk88ErKX5pisV7Y
X-Authority-Analysis: v=2.4 cv=aa9RWxot c=1 sm=1 tr=0 ts=6a28fbb3 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=27Ti7_ZD70JoqEhemiIA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEwMDA1MiBTYWx0ZWRfXypwWrAVgEfbC
 fwquz8jgLsDtu0Eo246Y8/7Rim5Z3ZqZf0UTCjVl6X1vWUlTRdtfqC4P+cNzHjF2DyR3uU1JRrL
 CnmCYNOGc58xLGvPSUgpta4jCO/tt7itfOotNBqCnal+THrVtdSlLevowNN8DXCT7vJAewLKneP
 ZmjePAYCEhqk0oWwGaiUGBS58TjTYmRRdx230etldwXL82fuGSX9QfOyTuBQHbWiMgzkcL7iw6X
 jW4F2X5XjLXgxvPXAfE8nu65PFJ2hmZ/oADOX+f5ImZv5wNxn3/ZQnm0WHPfM70Dh3BESumN+nE
 Il8bS9yReGSWxMazGWAKaSrJ21p8kCkWHGXWqQ8nO+wtGYJIwIU75sVAcTMmsTsaVQVovYz0QuV
 4+d/Pj9VlruO1bDE3kcNqyb6ACLVU6yOWYMezcVgSQHWVZ1CYk/Vmkxgo3I3bcC30lyGH0q4QkP
 7qF65woVTT5nYkdI71w==
X-Proofpoint-ORIG-GUID: J5RovMApJFgpBjZs7zk88ErKX5pisV7Y
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-10_01,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 priorityscore=1501 impostorscore=0 adultscore=0
 spamscore=0 bulkscore=0 malwarescore=0 clxscore=1015 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606100052
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-112290-lists,linux-arm-msm=lfdr.de];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:mani@kernel.org,m:mhi@lists.linux.dev,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:sumit.kumar@oss.qualcomm.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[sumit.kumar@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,vger.kernel.org:from_smtp,qualcomm.com:dkim,qualcomm.com:email];
	RCPT_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sumit.kumar@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 7760F666040

Some MHI endpoint clients do not use socket buffers and need a way to queue
raw buffers for DL transfers. Add mhi_ep_queue_buf() to support this use
case.

Refactor mhi_ep_queue_skb() to delegate to a new internal mhi_ep_queue()
helper shared by both APIs, and rename mhi_ep_skb_completion() to
mhi_ep_buf_completion() to reflect its broader use.

Signed-off-by: Sumit Kumar <sumit.kumar@oss.qualcomm.com>
---
 drivers/bus/mhi/ep/main.c | 27 +++++++++++++++++++--------
 include/linux/mhi_ep.h    | 15 +++++++++++++++
 2 files changed, 34 insertions(+), 8 deletions(-)

diff --git a/drivers/bus/mhi/ep/main.c b/drivers/bus/mhi/ep/main.c
index b3eafcf2a2c50d95e3efd3afb27038ecf55552a5..6c4c5ca473b821f9c2abe11cfe5043ec4c5545f4 100644
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
@@ -544,9 +544,9 @@ static void mhi_ep_skb_completion(struct mhi_ep_buf_info *buf_info)
 
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
@@ -559,7 +559,7 @@ int mhi_ep_queue_skb(struct mhi_ep_device *mhi_dev, struct sk_buff *skb)
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


