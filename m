Return-Path: <linux-arm-msm+bounces-102414-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +FZFFs1G12mTMAgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102414-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Apr 2026 08:27:25 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id B2D083C695A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Apr 2026 08:27:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 05FCF303AAAD
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Apr 2026 06:26:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D863A31D75E;
	Thu,  9 Apr 2026 06:26:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="U3DRb75x";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZI10FtRB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62BA3319601
	for <linux-arm-msm@vger.kernel.org>; Thu,  9 Apr 2026 06:26:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775716002; cv=none; b=lEwCdBoF3D4OJ590VdZPH5TPbrsnFcT6YGD2X7gXmeHOGrbErwYh6xnA5x+DeISPJ5RGNQpSKIXUVdk5VRVsdc5Vemm4kxLITl0d+IRiDF//kv+jIduWuw4VRcmZejIXVeSfUugaToFUF9BwlrgrIjvvfcKXGKcLOKCdOwWnMnM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775716002; c=relaxed/simple;
	bh=MvR+SvaSEuYi/QfVS/RX8dfj8wgrFhoZokgaZ8UC3uY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=jXbtpZSdpydlXACvyCdUAa6oKlfREyJGo5NOUv0fJKHLWprJIRiA2JyzjZOXeC0a0aFYiQu0uD3VAeSgOXY4/al1NrrFbNVlrzE29EjeXjjG4suyAX+7PN90kCRdQ0i/f3ESw8Z2wOzfmiDddpXOT68ikQVhalYAzik+9ILeuWQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=U3DRb75x; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZI10FtRB; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6395kVnp1613687
	for <linux-arm-msm@vger.kernel.org>; Thu, 9 Apr 2026 06:26:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=R9COzrVJDDX
	VUzJaQuSwPTmlBGewfpyqlBcsp+gMY8o=; b=U3DRb75xOSbgTHI1ulCEnB8bTog
	isBc2sQ9jSMPjowrTL7ffkJQNyhmStDs1YQt0f8/bSnNmv4kI8GwOykXPeALMQ8W
	ZfclkGzsgJ9lKLasLkbV/P76y8BdSNwDPbo236FytKpAyTmmT40u+ewd8TqE/HRT
	sp4BYLjMv934LM3CNwX4hfrPeWRytTAg0xyPRZp1bFX8w08EYg0sJys+LJiEh2wi
	drLXI9nMQxa7Jn5JUuiX74++Wf5a4EO+TaQ7RZV4slFVZkmgqY7UWTw50jIHs+qo
	OeK2aFXcUE1MuCTm3yZRV8T3KjwPt15eT5ppLylsCnDox8jD4TXyWhgj0vg==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4de68v84g4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 09 Apr 2026 06:26:40 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2b242062308so17697135ad.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 Apr 2026 23:26:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775716000; x=1776320800; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=R9COzrVJDDXVUzJaQuSwPTmlBGewfpyqlBcsp+gMY8o=;
        b=ZI10FtRBGHtKeO1w6R/1ElKdMv4URqfQXkyUKyHz8Wht3Yy89j2ZTihZBk6CULf2f6
         VPrEbedizDjYRYboJTL/PHMwHUAsAmwbfcJ8PDfMhmbugyCatvG4Wy0HZkfNm1ixZyKg
         yxh1q6D0Ofteac+ZqKI3DQeRRf5xno1M7kJjvEAdkAfK3+Tu6BUos6hmZe0V2buT/fJm
         n4mkTHct7vQ7qC55FTSzaLz/T/3oNrsdAZrDx0rGU+e0DUNwqJk04h4YxHTeXdsgjUpS
         iM4yK1/8VwG7mG/G8Ld8Z6TM8bQfT1g81tNWQqEMsMsXXklGIxl5JpJ6eS3qHQSPa2qf
         3FZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775716000; x=1776320800;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=R9COzrVJDDXVUzJaQuSwPTmlBGewfpyqlBcsp+gMY8o=;
        b=gxwyHQlgFrbQ+Llp2E/H9MSf58R9V/8it536PypBK56SYw3RHi2/KHeKljiynrvJBH
         lqEhVsWkPygJAoE2Ld/y/E4GYmW4KGMyV3Z4wrfpPebtZFcFObJVU3PxwGIpJzh1+RAR
         O7amv2pTv6w4IYLTTO18znKZVkjXNxvHwQup9g/34lij034dy3M/tT84N0/DWk5c5Qvw
         P9atXgjQPnNUQW3/IN2p9IEW39gSQ59Vgf/hWxM6MRFL9HcUjk5CNePTQi7WcOZHcc/h
         TbyLogNu0It/8zFitBYUxWowwCDxtDswjQ7MXM4fmYk7SQ+gi+rJakrhXQBY2L41eru+
         nmdA==
X-Forwarded-Encrypted: i=1; AJvYcCUVfIEW5aLiafYcnzV8qZ2HGnoct86MBOG9zguRo+h+J5vjWFXWzt3ORDqwkcUH+lIDcNYGaO1Mb2Vr5xas@vger.kernel.org
X-Gm-Message-State: AOJu0Yx5JjHPNCv54ZFNBKkQPNUOU4SJIKEYMr4C6RDRqPoy0Ic6XG2C
	/m2B8vqTg7ciWLm4m4PpzTlz0qGu7M5Ja4OObZjtlCCkJsFukGgvwaZKoKVHSRVbPd4oqK+bDjA
	zOWgr+K/B11VWtR7BBZdgBREBU1wOJZrB8PHDEnblNRuWNllmBNOsrb58PrkC3jTkKHnx
X-Gm-Gg: AeBDiesPrTDdH1M9wFI35Wmu01GQkT6s8w3bCA+NKUzGqiE8PvKpbtcNtQ1tut1JLW2
	dE/+rDKM8yuzyDRfATQFQ6kL6406+Tl6xs/nguXodCWg/evuxDTJRF0KEJLELwErQDmpYBoqj0x
	J/vt1YGGTUecjz97/GlvltaSrFiuVJl2YlfzcVx0CFJyHAMbnSnwLnSs5I/b4ZF0jS0qKfZ++N/
	uFmwwQ/7OvsCadqzfYRyJG4axIlRjUU/3WbaUIASDRkvfbQg7SOcf8aHvsNRYr4sFLmgSKg8T5X
	0/XvKR+hsKW2STyWtMKFbkGD/65egt1qfqzWAbJG8X9DBGzNxCVr6S2AL70ixSmAbwgjCmgK/SM
	b8Odt754kX71m8Bowej4M7i4ZtY1IvDqUlAmt/GF5CxZHGeCpnSTc+FvQGao88tuPL3G0FpKJW2
	pezzr3hJT2EADQ/Ggylg==
X-Received: by 2002:a17:903:1ab0:b0:2b2:5503:1ba0 with SMTP id d9443c01a7336-2b28182c321mr272849605ad.5.1775715999785;
        Wed, 08 Apr 2026 23:26:39 -0700 (PDT)
X-Received: by 2002:a17:903:1ab0:b0:2b2:5503:1ba0 with SMTP id d9443c01a7336-2b28182c321mr272849305ad.5.1775715999314;
        Wed, 08 Apr 2026 23:26:39 -0700 (PDT)
Received: from QCOM-SocCW5bzXR.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b2749cbd4dsm220786795ad.76.2026.04.08.23.26.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Apr 2026 23:26:39 -0700 (PDT)
From: Jianping Li <jianping.li@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Amol Maheshwari <amahesh@qti.qualcomm.com>
Cc: Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Abel Vesa <abelvesa@kernel.org>,
        Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, ekansh.gupta@oss.qualcomm.com,
        quic_chennak@quicinc.com, Jianping Li <jianping.li@oss.qualcomm.com>
Subject: [PATCH v4 3/4] misc: fastrpc: Allocate entire reserved memory for Audio PD in probe
Date: Thu,  9 Apr 2026 14:26:16 +0800
Message-Id: <20260409062617.1182-4-jianping.li@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260409062617.1182-1-jianping.li@oss.qualcomm.com>
References: <20260409062617.1182-1-jianping.li@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: iaQCeq6X7Om0C898GvXdraxjRx7oLR6_
X-Authority-Analysis: v=2.4 cv=b7OCJNGx c=1 sm=1 tr=0 ts=69d746a0 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=4k61BgtcDmjeHYH7visA:9 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-GUID: iaQCeq6X7Om0C898GvXdraxjRx7oLR6_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA5MDA1NSBTYWx0ZWRfX/do8sA9l1Qg8
 pwyVNTqwfMi6jxXCEf/YTHdj8jI6OscQBiN9XT5lPr8+J0VL9vFMd5ixjU/IhH0bkGjHTy8wYgz
 WkWipiofBx4luZDmukNt3Xf8HrD0rU3kHxsQqvIMevC1HzbR5rB03hWhmLL+5v+mrjAKvta4MSK
 jeG9DnIwvJLHNzAFyvHc4K2y+YIo9ALeNfQwYQWvelleBDX33KPlzOaTzNANNvPqfoAQDKC0Atk
 b0fR1PeYQDVdyOP1eROy7dscqpNO+d3FZHZgT/mC5lOoTBnct0V98vYXi5hewYninO9TUVxtRIP
 trh3EvrAHFDZ+i+zS7P9uo04in5F3hXBfGG+qlB78MJUqvJ5h99sXA/IF4w6vPd2r/w1EsgWDS4
 Yt/NEBXHmCF3x8y3VAEyrlU+B8FIF67/GvNEDnOFKb24jkQX9Ifca4C6vfhoNBqCD8MtlonnJRq
 pcq+7SewsxF8oIZA+eQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-09_01,2026-04-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 lowpriorityscore=0 malwarescore=0 priorityscore=1501
 impostorscore=0 bulkscore=0 phishscore=0 spamscore=0 suspectscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604010000
 definitions=main-2604090055
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-102414-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	FROM_NEQ_ENVFROM(0.00)[jianping.li@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: B2D083C695A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Allocating and freeing Audio PD memory from userspace is unsafe because
the kernel cannot reliably determine when the DSP has finished using the
memory. Userspace may free buffers while they are still in use by the DSP,
and remote free requests cannot be safely trusted.

Allocate the entire Audio PD reserved-memory region upfront during rpmsg
probe and tie its lifetime to the rpmsg channel. This avoids userspace-
controlled alloc/free and ensures memory is reclaimed only when the DSP
shuts down.

Signed-off-by: Jianping Li <jianping.li@oss.qualcomm.com>
---
 drivers/misc/fastrpc.c | 104 +++++++++++++++++++++--------------------
 1 file changed, 53 insertions(+), 51 deletions(-)

diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
index 148085c3b61a..a67ae991c0b0 100644
--- a/drivers/misc/fastrpc.c
+++ b/drivers/misc/fastrpc.c
@@ -276,6 +276,8 @@ struct fastrpc_channel_ctx {
 	struct kref refcount;
 	/* Flag if dsp attributes are cached */
 	bool valid_attributes;
+	/* Flag if audio PD init mem was allocated */
+	bool audio_init_mem;
 	u32 dsp_attributes[FASTRPC_MAX_DSP_ATTRIBUTES];
 	struct fastrpc_device *secure_fdevice;
 	struct fastrpc_device *fdevice;
@@ -1295,15 +1297,16 @@ static int fastrpc_init_create_static_process(struct fastrpc_user *fl,
 	struct fastrpc_init_create_static init;
 	struct fastrpc_invoke_args *args;
 	struct fastrpc_phy_page pages[1];
+	struct fastrpc_channel_ctx *cctx = fl->cctx;
 	char *name;
 	int err;
-	bool scm_done = false;
 	struct {
 		int client_id;
 		u32 namelen;
 		u32 pageslen;
 	} inbuf;
 	u32 sc;
+	unsigned long flags;
 
 	args = kzalloc_objs(*args, FASTRPC_CREATE_STATIC_PROCESS_NARGS);
 	if (!args)
@@ -1327,31 +1330,6 @@ static int fastrpc_init_create_static_process(struct fastrpc_user *fl,
 	inbuf.client_id = fl->client_id;
 	inbuf.namelen = init.namelen;
 	inbuf.pageslen = 0;
-	if (!fl->cctx->remote_heap) {
-		err = fastrpc_remote_heap_alloc(fl, fl->sctx->dev, init.memlen,
-						&fl->cctx->remote_heap);
-		if (err)
-			goto err_name;
-
-		/* Map if we have any heap VMIDs associated with this ADSP Static Process. */
-		if (fl->cctx->vmcount) {
-			u64 src_perms = BIT(QCOM_SCM_VMID_HLOS);
-
-			err = qcom_scm_assign_mem(fl->cctx->remote_heap->dma_addr,
-							(u64)fl->cctx->remote_heap->size,
-							&src_perms,
-							fl->cctx->vmperms, fl->cctx->vmcount);
-			if (err) {
-				dev_err(fl->sctx->dev,
-					"Failed to assign memory with dma_addr %pad size 0x%llx err %d\n",
-					&fl->cctx->remote_heap->dma_addr,
-					fl->cctx->remote_heap->size, err);
-				goto err_map;
-			}
-			scm_done = true;
-			inbuf.pageslen = 1;
-		}
-	}
 
 	fl->pd = USER_PD;
 
@@ -1363,8 +1341,25 @@ static int fastrpc_init_create_static_process(struct fastrpc_user *fl,
 	args[1].length = inbuf.namelen;
 	args[1].fd = -1;
 
-	pages[0].addr = fl->cctx->remote_heap->dma_addr;
-	pages[0].size = fl->cctx->remote_heap->size;
+	spin_lock_irqsave(&cctx->lock, flags);
+	if (!fl->cctx->audio_init_mem) {
+		if (!fl->cctx->remote_heap ||
+		    !fl->cctx->remote_heap->dma_addr ||
+		    !fl->cctx->remote_heap->size) {
+			spin_unlock_irqrestore(&cctx->lock, flags);
+			err = -ENOMEM;
+			goto err;
+		}
+
+		pages[0].addr = fl->cctx->remote_heap->dma_addr;
+		pages[0].size = fl->cctx->remote_heap->size;
+		fl->cctx->audio_init_mem = true;
+		inbuf.pageslen = 1;
+	} else {
+		pages[0].addr = 0;
+		pages[0].size = 0;
+	}
+	spin_unlock_irqrestore(&cctx->lock, flags);
 
 	args[2].ptr = (u64)(uintptr_t) pages;
 	args[2].length = sizeof(*pages);
@@ -1382,26 +1377,7 @@ static int fastrpc_init_create_static_process(struct fastrpc_user *fl,
 
 	return 0;
 err_invoke:
-	if (fl->cctx->vmcount && scm_done) {
-		u64 src_perms = 0;
-		struct qcom_scm_vmperm dst_perms;
-		u32 i;
-
-		for (i = 0; i < fl->cctx->vmcount; i++)
-			src_perms |= BIT(fl->cctx->vmperms[i].vmid);
-
-		dst_perms.vmid = QCOM_SCM_VMID_HLOS;
-		dst_perms.perm = QCOM_SCM_PERM_RWX;
-		err = qcom_scm_assign_mem(fl->cctx->remote_heap->dma_addr,
-						(u64)fl->cctx->remote_heap->size,
-						&src_perms, &dst_perms, 1);
-		if (err)
-			dev_err(fl->sctx->dev, "Failed to assign memory dma_addr %pad size 0x%llx err %d\n",
-				&fl->cctx->remote_heap->dma_addr, fl->cctx->remote_heap->size, err);
-	}
-err_map:
-	fastrpc_buf_free(fl->cctx->remote_heap);
-err_name:
+	fl->cctx->audio_init_mem = false;
 	kfree(name);
 err:
 	kfree(args);
@@ -2390,7 +2366,7 @@ static int fastrpc_rpmsg_probe(struct rpmsg_device *rpdev)
 		}
 	}
 
-	if (domain_id == SDSP_DOMAIN_ID) {
+	if (domain_id == SDSP_DOMAIN_ID || domain_id == ADSP_DOMAIN_ID) {
 		struct resource res;
 		u64 src_perms;
 
@@ -2402,6 +2378,15 @@ static int fastrpc_rpmsg_probe(struct rpmsg_device *rpdev)
 				    data->vmperms, data->vmcount);
 		}
 
+		if (domain_id == ADSP_DOMAIN_ID) {
+			data->remote_heap =
+				kzalloc_obj(*data->remote_heap, GFP_KERNEL);
+			if (!data->remote_heap)
+				return -ENOMEM;
+
+			data->remote_heap->dma_addr = res.start;
+			data->remote_heap->size = resource_size(&res);
+		}
 	}
 
 	secure_dsp = !(of_property_read_bool(rdev->of_node, "qcom,non-secure-domain"));
@@ -2482,6 +2467,7 @@ static void fastrpc_rpmsg_remove(struct rpmsg_device *rpdev)
 	struct fastrpc_buf *buf, *b;
 	struct fastrpc_user *user;
 	unsigned long flags;
+	int err;
 
 	/* No invocations past this point */
 	spin_lock_irqsave(&cctx->lock, flags);
@@ -2499,8 +2485,24 @@ static void fastrpc_rpmsg_remove(struct rpmsg_device *rpdev)
 	list_for_each_entry_safe(buf, b, &cctx->invoke_interrupted_mmaps, node)
 		list_del(&buf->node);
 
-	if (cctx->remote_heap)
-		fastrpc_buf_free(cctx->remote_heap);
+	if (cctx->remote_heap && cctx->vmcount) {
+		if (cctx->vmcount) {
+			u64 src_perms = 0;
+			struct qcom_scm_vmperm dst_perms;
+
+			for (u32 i = 0; i < cctx->vmcount; i++)
+				src_perms |= BIT(cctx->vmperms[i].vmid);
+
+			dst_perms.vmid = QCOM_SCM_VMID_HLOS;
+			dst_perms.perm = QCOM_SCM_PERM_RWX;
+
+			err = qcom_scm_assign_mem(cctx->remote_heap->dma_addr,
+						  cctx->remote_heap->size,
+						  &src_perms, &dst_perms, 1);
+			if (!err)
+				fastrpc_buf_free(cctx->remote_heap);
+		}
+	}
 
 	of_platform_depopulate(&rpdev->dev);
 
-- 
2.43.0


