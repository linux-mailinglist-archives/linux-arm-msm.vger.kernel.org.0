Return-Path: <linux-arm-msm+bounces-102105-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QHmPOfvW1GnuxwcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102105-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Apr 2026 12:05:47 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EC4293AC86F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Apr 2026 12:05:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 1DA8E3010234
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Apr 2026 10:05:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A30A03A7825;
	Tue,  7 Apr 2026 10:05:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OgAe1mPh";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OhtN7SXD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6089A3A7850
	for <linux-arm-msm@vger.kernel.org>; Tue,  7 Apr 2026 10:05:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775556336; cv=none; b=LX/rIrxlkxxVilRsIDNnxXp6kwy95TbUsOl4GO7RmrupK0YcOr/XwEu2k4e+Tyqu12qeDp+vimNp1gVQErAqOFpxv8gNMx7QuW+MTh1KStBeJhvu7RYJ96rBfDrL4I5caRXSXauXttqWMktBIKZbF5wFoEH1IfCZe1Jn1y/c+bE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775556336; c=relaxed/simple;
	bh=MjMWRMM5joRS9XA8zxm8dI/0ckV7LszY4iDoeBvHxRs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=rqvUN+LnIZSvhDXaTZG+UGl5VnyjS6RCTwxbHtNXXrk9NOZ6khtT1EKUsjrkHzW/Cg4wLmzhFFNyscwlZJILtHKptSwCJIx5dG+fHlRJJkMb1oTO1Fz364JSzFsdPUpJiQFx9NEmJYPEQ2V0W85hxuDw6cxBjI5kdk4RvSWRtY8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OgAe1mPh; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OhtN7SXD; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6376XCQi2550330
	for <linux-arm-msm@vger.kernel.org>; Tue, 7 Apr 2026 10:05:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=YixsSb2TTJn
	uLGupqoyMhSdb+ojrNBo+brXNomdcgig=; b=OgAe1mPhvBNtKGJ6MbHPedieYiN
	kokpPaqY+09w7t+JAzfytIlpu1fDyR74hZblWX/Wp9i9+FTju1Tt03ayxNJEDaLf
	yKkHUStqtFSZ+pHvKrF1+Hn6jNTZzyYCZNrXmIhcUFkLiEXgE2O2sE+SVRfQ0yJQ
	lMWmrnvp3kxZkSeWaacJjuJejdnAXbKRs0J+Y3yP4nNQ9UQphiumt+0PEz/Q5cW2
	3Zglmnz1EweICJu2wPfgZyF3/bmP6Fecd1Z5vlVZ7koz3Sg1ElMQQ2BrJlFI8G6j
	bQgrvLWXy86EuQLHNM5vLlJXxx08cQkuSUlGdY8d3457jm7TFJD1S6ZraJA==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dcmrea6ub-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 07 Apr 2026 10:05:34 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-c70dd30025fso8187661a12.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Apr 2026 03:05:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775556334; x=1776161134; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YixsSb2TTJnuLGupqoyMhSdb+ojrNBo+brXNomdcgig=;
        b=OhtN7SXDfxAVFp2RDzXY+wfgd8XcZ8gvzOT4padUHgUrbFGgqOAuypShOwAt4E+OSc
         /5a1ZzP9d7Ierv/jCqE1wlVz6497+bWXzzFtQZytMUsI5/BKP3yKYiTSAfk2EhesgukN
         gdlql0+2eg4ZFjKpRHwgh6dMC0d3xvr6j8Y1ylE2mHoFUWiXIcc7yYXRE97h7uOqSABa
         eXnHVt1DItqNKBMRGJ1NsXYmNo+zwLC62V4Y+orRBU44NozQskNnJ+DDMTw6j6DD0s0F
         kphXFionGcxrVhA67npNzFy9kMnNXr8gIGPFTQLTBCB28jeWEdubrYIVEGsziDx9YCd9
         5a+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775556334; x=1776161134;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=YixsSb2TTJnuLGupqoyMhSdb+ojrNBo+brXNomdcgig=;
        b=d4YuC6vjj53BFD9lKoKjAXbClCw4sVZZJF98ujLTOHE+pMwtmI7t752vrLlS99ju7u
         T0FmOUPBemMXNjIqpYmzj8RG2o+Lh/mLXM79H4bGegQ0H5gn1yusxvsz+Iriqa37QifP
         ZDT9t7s/KcDOnlJPO4pSThr3XlbNpHQP/WZXIhO3i+/u8qb0hmckoxIczPdZB983VuGx
         m3JoD2HJBGgm6/PyQwkSSDAIE30IEQQIBjM+TqZs1/BhQA9MiAuc4+Hpcbl59/tz7+m5
         +v3Vign/hWWdxjTS1eXM+Gnm01/TVgneWeQ4DWY2NT85jzR4ZIlqNOJw1OGmviofU8tZ
         iPlA==
X-Forwarded-Encrypted: i=1; AJvYcCXdICwGQSXLqCs9W64ir7lZUWORMeiVn6H5wuDJbBnamg2KA5y0kBLkBITkWauFxwRhKUkEA+wA+S5zYwsT@vger.kernel.org
X-Gm-Message-State: AOJu0Yy2ntsA4OYmO9zVKFymLKY8RwEWXKWVf11UWc6S2bJ7giofB8nH
	QcVtqKBkDk2fUHrxDFNkzRKJgTNInWkUZtN/S0pt7X7syneGMf1E8ZY2e2J9lxnuDy0u5ChMTGH
	619RyQYcAiCq+F0Uqeyhs/j/dr2wkAFw9zBiHErWHZYPjNF4fTfkmfVkqx13+pn/aw3YC
X-Gm-Gg: AeBDieu4DbRekxSLvWVsUvrDsXcRXJKLL3OT2jiuzUh34QtlFQVQ1e6vR9m3llh0RIj
	X50FJGPmhWghGfhMohZHmi72YhA1afJKZddpnqiNu8VhwL9//5v72m5PSCvNSesXGnQuJdqyvjw
	lt4Mj9I0uUsGgDqaTyFHZ/Qjjidg9wpfX9ANpa8qvDnnemqseDJWvPaFBhJNADPFVp3MS5EZFSD
	29m56C8P/gVDX6xUnWloycQ0va029V4NH1lZYNfsey51lIVor5exzxC2JoFAV4cBPGIXmHC86nr
	BSeX6JRNF1x4GtXc7oDgRvSznp0PdepKDkhEjFeg/9ISkA6Rx+bxPmLiEs1gcyIFKc0l+pDOq7x
	xpBybKstgOHtd9Z86X68EIo98j0ORpMoRRU9d+dj7QdxAyV5gXphAk5l1HZSOHebt+7I7JVqBCr
	K8uVaBuNU/W4cH9/AlxQ==
X-Received: by 2002:a05:6a00:6ca8:b0:82a:786f:e39c with SMTP id d2e1a72fcca58-82d0dbca63amr16203825b3a.47.1775556333630;
        Tue, 07 Apr 2026 03:05:33 -0700 (PDT)
X-Received: by 2002:a05:6a00:6ca8:b0:82a:786f:e39c with SMTP id d2e1a72fcca58-82d0dbca63amr16203800b3a.47.1775556333062;
        Tue, 07 Apr 2026 03:05:33 -0700 (PDT)
Received: from QCOM-SocCW5bzXR.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82cf9b272bdsm17844323b3a.12.2026.04.07.03.05.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Apr 2026 03:05:32 -0700 (PDT)
From: Jianping Li <jianping.li@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Amol Maheshwari <amahesh@qti.qualcomm.com>
Cc: Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Abel Vesa <abelvesa@kernel.org>,
        Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>,
        linux-arm-msm@vger.kernel.org, ekansh.gupta@oss.qualcomm.com,
        quic_chennak@quicinc.com, Jianping Li <jianping.li@oss.qualcomm.com>
Subject: [PATCH v3 4/4] misc: fastrpc: Allow fastrpc_buf_free() to accept NULL
Date: Tue,  7 Apr 2026 18:05:08 +0800
Message-Id: <20260407100508.1027-5-jianping.li@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260407100508.1027-1-jianping.li@oss.qualcomm.com>
References: <20260407100508.1027-1-jianping.li@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=OKEXGyaB c=1 sm=1 tr=0 ts=69d4d6ee cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=GmafkBk8WXepDEkBruoA:9 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-GUID: fRoTiEAPjxFW_BQipSQfPvCqUjy6wvqO
X-Proofpoint-ORIG-GUID: fRoTiEAPjxFW_BQipSQfPvCqUjy6wvqO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA3MDA5MCBTYWx0ZWRfX7sS6f1c4QWnM
 J3j+472OZNlaemUd0HmYTCnRISxVPBHZ/T0LcQuSVnZPuokq62rZPZovocsP4DKLIarqD40DS8g
 W4JR2Ez/LDmugwPhdZLH38V8NIziEZiVMu4aqc3xWJS3lREpbVK668qMsQ36sfObXnF7phdOvgO
 Yi/+ZlCDoueDqux/ObDUDk2fG1x9Sr03qQsSkCPonnrWJcLoN+qHCoaDhnT5mtAvEbhZo9hDXeL
 2FfS87ZAhf/8SnE4D23uSoaGKwCYLC7lNwPZ5VN54kkqfQleGd1i7jSAqO4oVLeXyOjy9kaajkR
 hRTBsRtnPzfmWD1OdTewq3tLYJ3VyzvYa6hyvguH2r04+0rAP+b9rCxZeCx2W5/Cmu1cn2UkCNB
 QtH6KgXqycSBCHyFAi00lVjNx/GpAmSRgw6cUiwbHrGc6SXix7A144/+O0sN5Q6TnvSpohUA098
 QfhTnuubGxSFTEIrPUg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-07_02,2026-04-07_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 spamscore=0 impostorscore=0 lowpriorityscore=0
 clxscore=1015 adultscore=0 malwarescore=0 suspectscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604070090
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-102105-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jianping.li@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	RCPT_COUNT_SEVEN(0.00)[10];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: EC4293AC86F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>

Make fastrpc_buf_free() a no-op when passed a NULL pointer, allowing
callers to avoid open-coded NULL checks.

Co-developed-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
Signed-off-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
Signed-off-by: Jianping Li <jianping.li@oss.qualcomm.com>
---
 drivers/misc/fastrpc.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
index 3b2dc6a9e886..f95a2ba77b15 100644
--- a/drivers/misc/fastrpc.c
+++ b/drivers/misc/fastrpc.c
@@ -416,6 +416,9 @@ static int fastrpc_map_lookup(struct fastrpc_user *fl, int fd,
 
 static void fastrpc_buf_free(struct fastrpc_buf *buf)
 {
+	if (!buf)
+		return;
+
 	dma_free_coherent(buf->dev, buf->size, buf->virt,
 			  fastrpc_ipa_to_dma_addr(buf->fl->cctx, buf->dma_addr));
 	kfree(buf);
@@ -512,8 +515,7 @@ static void fastrpc_context_free(struct kref *ref)
 	for (i = 0; i < ctx->nbufs; i++)
 		fastrpc_map_put(ctx->maps[i]);
 
-	if (ctx->buf)
-		fastrpc_buf_free(ctx->buf);
+	fastrpc_buf_free(ctx->buf);
 
 	spin_lock_irqsave(&cctx->lock, flags);
 	idr_remove(&cctx->ctx_idr, ctx->ctxid >> 4);
@@ -1557,8 +1559,7 @@ static int fastrpc_device_release(struct inode *inode, struct file *file)
 	list_del(&fl->user);
 	spin_unlock_irqrestore(&cctx->lock, flags);
 
-	if (fl->init_mem)
-		fastrpc_buf_free(fl->init_mem);
+	fastrpc_buf_free(fl->init_mem);
 
 	list_for_each_entry_safe(ctx, n, &fl->pending, node) {
 		list_del(&ctx->node);
-- 
2.43.0


