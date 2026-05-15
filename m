Return-Path: <linux-arm-msm+bounces-107914-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SoY9IkAZB2rnrgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107914-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 May 2026 15:01:52 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C401C550178
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 May 2026 15:01:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CB0D3316EF53
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 May 2026 12:43:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E666F47ECFC;
	Fri, 15 May 2026 12:42:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kfPEuxtb";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iYwgylqY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6837C47DD5D
	for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2026 12:42:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778848975; cv=none; b=RiGio+2yC+BoF86sNDSAaZX18+YQUpGLQ4zQhYTDwXnfYuE/aa81pvckDuakoy0X2JyAi8kEYR1LS24UYUJsfsAIOnqpBIFd3UpXflfH6T2VNZIIWGLbrGj0TZ5QzJv0CTvPMVtARnzfN3BbdTqmE4NdRubWLZ+oyH5RYtZQVmA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778848975; c=relaxed/simple;
	bh=FPLE9T5TP21koJOUSS+HDVnGURL5C7htZLkDTy8lCJ0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Qhd4MMHuA0Yiel1Ra43c415CghOlmc/N6tRBllnLNvIzhSJr4/d+3Hj8PD4Wf87j8b0Z5rnLyA74BFIFDEPeV8lGDqn6CJOvc+e/2xl/EXgNFyUjCg/sQ8r2Rr5dUhBTvE/GZ75lVOmppqyBc0cRW0tu4tOH/LhV97gzwHzFdEw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kfPEuxtb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iYwgylqY; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64FBWFJp1848051
	for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2026 12:42:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=f+pEnlL/Dwk
	yKv8LqyGHXztzvJ/4aDMHJNFY2G154uM=; b=kfPEuxtbkcMaRh4yvf02rxab1IK
	y+4xxLhLCMVF/XownSzBhds5T8r8YxtR7oGVe0PKvvNWddNWteeLEysKG0/RQyGV
	EN9rnZvvZ/rFYUUAWW2Ve5FMTDF5jNW5ZBCEREbFAA3lkRU0JnsftR5OTkD7iGyN
	kAdNZImLzmSpTYe2JpJtxhvOue99ZRgGuR4LuPsePFON7J/o4+1C2m5zpz9o5x8Y
	WucIaNnqQzC82fHxt7sAcyVpeyeEHkJor3MLTUzeF7yDfJKyipwhCsvCjDFPZhvM
	pGQOXacTiy2EtXjKOF/zOFgNYRXG/gDhlEvFhbVO/QsPKGxL0roD0Ggv3rw==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e5m1t37eg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2026 12:42:53 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2baedd2fd43so58272845ad.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2026 05:42:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778848972; x=1779453772; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=f+pEnlL/DwkyKv8LqyGHXztzvJ/4aDMHJNFY2G154uM=;
        b=iYwgylqYDLw2bMQO2a06jPISRFcG2Re7GMQLOScYdj7FMdcRx3n5BolBHdiBe96AIS
         Sw/AJTM4kicfYn1T6Z5R3RxaU8gzzLaC6WTfb5cgsKQdJu0E6v36jkB3FKph9QQyWiwk
         0+YB0T1CmLqhIONYQ4ukKoa6Db0nEinbmtAmTdkIWKLKsH4lTQHs3SfYbyhKEBECHnfu
         hLM32Ygrx4WP/ThsqYuXGkdqs7W7BSOTHaEiq+pSwK3xH+6IZUAYgRH9e0bZAK2/C8X5
         jNI99yGD8nWAbEGORtW/z5iY/MHQXqhsyrBF54z0QhSGMaov7nJjm+snu7dkCyJkKNIP
         WQCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778848972; x=1779453772;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=f+pEnlL/DwkyKv8LqyGHXztzvJ/4aDMHJNFY2G154uM=;
        b=B1kvl2TuYty+rI4wv6kBIjpSooXWOlKoH8Hxl2mUftFUp3SxZnFXmlf1C7Fq3rE9nS
         ZVpnNpw8AYDI/nG1VnX8UDqUHwTbEEVLRbxaXzCBY446005M8QPt8cSvBCt692mssxYo
         WpYRLcbt/pJI3T/bl9laAlIlw+bKGVRKErrTz/KcC1RrEPrIlsSobcXytd79Z91T2eSe
         FL9K5P0HtxdELoAcNOvglaaTWXkJR5ML/16pc0hdGyMr76DEcg1gz2laFEGBHi2oE31+
         n+YsLd2Y4GGjNXNeuKZ74NglbH4uhUSk3xA9jHZIukQYoNQw3CCVCesjEQ5nwdzZJAWN
         barg==
X-Forwarded-Encrypted: i=1; AFNElJ9DVPQWZIIIPMifQy2Izz+qpOo2cLNMXDP8I467pyEAT7ZPwsdOfYA8hqsIhgtMgnCy7v4A0mwYYB4out1a@vger.kernel.org
X-Gm-Message-State: AOJu0YympGYTWq9IWD4ubK09PRwmU97B0Fop2GNfM3usUI3kZ91mVSsz
	NOZ8n5Ac1Cpl8KgprHOLbsrEIy3IfMYuF6axVbBfLYhRSPQwfzAGdd2FZYKAMsZ4SjEYtHU82Tk
	j6kpUviZ49sSm0E/EqgIwr7IxVVKAcBAxcEVjMZ+KQgkWMFrmZT2rLmWMDjORHfSE5Eal
X-Gm-Gg: Acq92OHWyPRMPnlkaBWcgc6EF/v4AhZ6AT+fMZY2szJtUr+kVG4LRqBs+c5lztPho6u
	Y9KnNN6nFdlYp0C6L7vQLiAz2VvPPzbAKWe2bmVKKkJvzyaW9tNAHfWDuqppngbDDFayeD8Ss5f
	L8JFH2+OJjinULt7EA5gYxXK1Nxhbr06edtFD5s9QXZ1R7a65KIvQAfSkIVHgxuEJ++NqPENpSb
	d0kBgai2Hw5yDw5SCQjxFY6wqh7HFf97sSJkiBhIKwfYQ8B3bX27+hDeDIna5/Jqo+ePMD4MLdf
	3Ou3iZd7EbtxrUo3T0bxqY+3ftiJeF/x3DQnJm6j4pkfkZjSkHrli1pubJ4mhpRXOmuHmozjpYZ
	XTxWidPpPG3beDasL2Z8XzsHf60a/785kJf9D2iJX9wcdfOmQdzCmcnRVcFlg4zR/Vbw/maKL0J
	z03zT5EBvn0JW0bkLXQ/c=
X-Received: by 2002:a17:903:240c:b0:2bd:2439:25e9 with SMTP id d9443c01a7336-2bd7e9e263emr43094635ad.40.1778848972248;
        Fri, 15 May 2026 05:42:52 -0700 (PDT)
X-Received: by 2002:a17:903:240c:b0:2bd:2439:25e9 with SMTP id d9443c01a7336-2bd7e9e263emr43094215ad.40.1778848971640;
        Fri, 15 May 2026 05:42:51 -0700 (PDT)
Received: from QCOM-SocCW5bzXR.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bd5c05f27csm56119395ad.25.2026.05.15.05.42.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 May 2026 05:42:51 -0700 (PDT)
From: Jianping Li <jianping.li@oss.qualcomm.com>
To: srini@kernel.org, amahesh@qti.qualcomm.com, arnd@arndb.de,
        gregkh@linuxfoundation.org, abelvesa@kernel.org,
        jorge.ramirez-ortiz@linaro.org
Cc: Jianping Li <jianping.li@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        ekansh.gupta@oss.qualcomm.com, quic_chennak@quicinc.com
Subject: [PATCH v5 4/5] misc: fastrpc: Allocate entire reserved memory for Audio PD in probe
Date: Fri, 15 May 2026 20:42:16 +0800
Message-Id: <20260515124217.20723-5-jianping.li@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260515124217.20723-1-jianping.li@oss.qualcomm.com>
References: <20260515124217.20723-1-jianping.li@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=D7Z37PRj c=1 sm=1 tr=0 ts=6a0714cd cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=vXPY0jRleWu_0xqwLycA:9 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE1MDEyOSBTYWx0ZWRfX9ner8gKtdYDL
 ofiClKhMejCIdERtTnkesH80IGAFN2+ev5yDy+eILlv6sCg/QhLudPR5i/lkUM64QiaqoiMc/7Y
 abTZqy1EczdDA4f+ZUBXurQT6d+ajEcPWTFPE1PuVIVy6Np6uC7LH0+hjXCtkY80+DswI7ZUyvm
 EE89Rq4No2RETF2b+U7CA/JLKaS/OBqA+CCnlWzx+1DMRqhXZK2AbYpLOqR3viMkFv5UqQygZlf
 XDsPq1yEOpcvFhO+vrfOFHI/jgx1U4oFb+w8Xxiut4+SHdOW4fZ0rxbb3UQRnQzMxRE8WS7aEZt
 4q2zaOKhi8ExEqk3tUOPVDa5YnxCpbavcXCgNrf6vW0Nq64UnOhUpQ0sSN5ezbFgdx4dwYTWujt
 r1tNcO+NYXOSRdqyzgtihvYNzYTRGgYuK2meV6iTBAzBF+XDmR0USVcQFTSXbmtxwc3qprVZcXJ
 UyDle4l1a2u9nxtqkvA==
X-Proofpoint-ORIG-GUID: FUM1sfrKnJnIA8_lqcYJ49BDhIf1X6UI
X-Proofpoint-GUID: FUM1sfrKnJnIA8_lqcYJ49BDhIf1X6UI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-15_03,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 priorityscore=1501 impostorscore=0
 adultscore=0 phishscore=0 clxscore=1015 bulkscore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605150129
X-Rspamd-Queue-Id: C401C550178
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[12];
	TAGGED_FROM(0.00)[bounces-107914-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jianping.li@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

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
 drivers/misc/fastrpc.c | 107 +++++++++++++++++++----------------------
 1 file changed, 49 insertions(+), 58 deletions(-)

diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
index a0337cce77f3..9c70788afa0f 100644
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
 
@@ -1363,14 +1341,24 @@ static int fastrpc_init_create_static_process(struct fastrpc_user *fl,
 	args[1].length = inbuf.namelen;
 	args[1].fd = -1;
 
-	if (!fl->cctx->remote_heap ||
-	    !fl->cctx->remote_heap->dma_addr ||
-	    !fl->cctx->remote_heap->size) {
-		err = -ENOMEM;
-		goto err;
+	spin_lock_irqsave(&cctx->lock, flags);
+	if (!fl->cctx->audio_init_mem) {
+		if (!fl->cctx->remote_heap ||
+		    !fl->cctx->remote_heap->dma_addr ||
+		    !fl->cctx->remote_heap->size) {
+			spin_unlock_irqrestore(&cctx->lock, flags);
+			err = -ENOMEM;
+			goto err;
+		}
+		pages[0].addr = fl->cctx->remote_heap->dma_addr;
+		pages[0].size = fl->cctx->remote_heap->size;
+		fl->cctx->audio_init_mem = true;
+		inbuf.pageslen = 1;
+	} else {
+		pages[0].addr = 0;
+		pages[0].size = 0;
 	}
-	pages[0].addr = fl->cctx->remote_heap->dma_addr;
-	pages[0].size = fl->cctx->remote_heap->size;
+	spin_unlock_irqrestore(&cctx->lock, flags);
 
 	args[2].ptr = (u64)(uintptr_t) pages;
 	args[2].length = sizeof(*pages);
@@ -1388,27 +1376,7 @@ static int fastrpc_init_create_static_process(struct fastrpc_user *fl,
 
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
-	fl->cctx->remote_heap = NULL;
-err_name:
+	fl->cctx->audio_init_mem = false;
 	kfree(name);
 err:
 	kfree(args);
@@ -2397,12 +2365,21 @@ static int fastrpc_rpmsg_probe(struct rpmsg_device *rpdev)
 		}
 	}
 
-	if (domain_id == SDSP_DOMAIN_ID) {
+	if (domain_id == SDSP_DOMAIN_ID || domain_id == ADSP_DOMAIN_ID) {
 		struct resource res;
 		u64 src_perms;
 
 		err = of_reserved_mem_region_to_resource(rdev->of_node, 0, &res);
 		if (!err) {
+			if (domain_id == ADSP_DOMAIN_ID) {
+				data->remote_heap =
+					kzalloc_obj(*data->remote_heap, GFP_KERNEL);
+				if (!data->remote_heap)
+					return -ENOMEM;
+
+				data->remote_heap->dma_addr = res.start;
+				data->remote_heap->size = resource_size(&res);
+			}
 			src_perms = BIT(QCOM_SCM_VMID_HLOS);
 
 			err = qcom_scm_assign_mem(res.start, resource_size(&res), &src_perms,
@@ -2410,7 +2387,6 @@ static int fastrpc_rpmsg_probe(struct rpmsg_device *rpdev)
 			if (err)
 				goto err_free_data;
 		}
-
 	}
 
 	secure_dsp = !(of_property_read_bool(rdev->of_node, "qcom,non-secure-domain"));
@@ -2491,6 +2467,7 @@ static void fastrpc_rpmsg_remove(struct rpmsg_device *rpdev)
 	struct fastrpc_buf *buf, *b;
 	struct fastrpc_user *user;
 	unsigned long flags;
+	int err;
 
 	/* No invocations past this point */
 	spin_lock_irqsave(&cctx->lock, flags);
@@ -2508,8 +2485,22 @@ static void fastrpc_rpmsg_remove(struct rpmsg_device *rpdev)
 	list_for_each_entry_safe(buf, b, &cctx->invoke_interrupted_mmaps, node)
 		list_del(&buf->node);
 
-	if (cctx->remote_heap)
-		fastrpc_buf_free(cctx->remote_heap);
+	if (cctx->remote_heap && cctx->vmcount) {
+		u64 src_perms = 0;
+		struct qcom_scm_vmperm dst_perms;
+
+		for (u32 i = 0; i < cctx->vmcount; i++)
+			src_perms |= BIT(cctx->vmperms[i].vmid);
+
+		dst_perms.vmid = QCOM_SCM_VMID_HLOS;
+		dst_perms.perm = QCOM_SCM_PERM_RWX;
+
+		err = qcom_scm_assign_mem(cctx->remote_heap->dma_addr,
+					  cctx->remote_heap->size, &src_perms,
+					  &dst_perms, 1);
+		if (!err)
+			kfree(cctx->remote_heap);
+	}
 
 	of_platform_depopulate(&rpdev->dev);
 
-- 
2.43.0


