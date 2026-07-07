Return-Path: <linux-arm-msm+bounces-117147-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id ePuOFGSaTGq+mwEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117147-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Jul 2026 08:19:16 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id A49E8717E23
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Jul 2026 08:19:15 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=OoIDc5xK;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=gJkcD7xx;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117147-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117147-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 977AD302B0AD
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Jul 2026 06:17:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 47A8D346AE3;
	Tue,  7 Jul 2026 06:17:44 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A44D737EFE4
	for <linux-arm-msm@vger.kernel.org>; Tue,  7 Jul 2026 06:17:42 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783405064; cv=none; b=cvPtrkgHZOJj9j0le/Qt9Wd7hUxFINAH+me6tz+HIA9IrNWHChNVsEGUYHI1xFjWZnmAjDZtQVHTRZ0raxWYyhtQfKvx6vaFh49x+s/EvivuHljXqmW6aBT+HTQdXK15x8cM35aDUuE2IW6hY3hAfYQrB3D4BFS38AYugkHUr54=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783405064; c=relaxed/simple;
	bh=wtQTVfzkezqQV0RnJrEn/m3KjSX8pxjorSBtSg/NEdo=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=bbk53EBQgLTt/HurcYkTaReCtziDb0Canm5KP3N5c+VzIoFTC1rK6ZtqEbtZgfWIFqnZITnb1YPZzDETBUMbtrd1JrS0FmupCXXbS2L+rVG6CqxG2ktZaas6aB2BDyqo7znrqFSCGh2xNT38DbQceU7WJDpKrK1sHN5YjvrkuHY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OoIDc5xK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gJkcD7xx; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66749NsI2658630
	for <linux-arm-msm@vger.kernel.org>; Tue, 7 Jul 2026 06:17:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=pl1sWeMBafq5dBYywth/L+4oTHWDQJ/jNNc
	0mkSxTac=; b=OoIDc5xKTfO2RCmuaSgRisk3U91iIdyLsZxShpQ5Ug8oFX7kfEj
	WOQKn7ZtEVwPNQY2HEQPn9jmxfuMll+VBffdeRhbe8mOiiY9s6Zdirbfe+N+HJeJ
	7CMwMCxXVWwxEHgJTXxWroIzrXhJZcNHmrcmOxyu2wsEzxcMHttiQeBwqhvKimt0
	2VZTurA7U0ETULhaQmsdBmFxoR2nWPPQ9yS82dFwV+GXJM30gvaqYNyvecIU1T6V
	KHGOYwLTyMOHu28WILMuG6J8HC3ybluos7vQV8uNqpJST5BmRC0UjTD9ZWgOpTAM
	OtRtBm8qcWidh8NYd6s706nrGdjmkRhCMXQ==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f8a3r4ctk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 07 Jul 2026 06:17:41 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-8478d2bea7cso388661b3a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jul 2026 23:17:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783405061; x=1784009861; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=pl1sWeMBafq5dBYywth/L+4oTHWDQJ/jNNc0mkSxTac=;
        b=gJkcD7xxdhpwVHdYK0RIWvSvhVnGszcbAeB1iXpNpI2YGih5bBhwKJei/oiAPpaWMs
         IF0d9c0gcTBI6glEIxyDn+fQi2oXulsxHHhroGWkoVXdfxM6LKk/rcZhSFzwFkqtVymf
         Zaq7cVu2O59AC1hGk240mZhsqBMSZOpZp5oGBW175Y4Yq4fh4Pspp6Erpluda8eOom4n
         S7/+gwlbB7gNQ6rZktj9wiRZCWNgBDKt0D8X0SVFvzylN3SkcEpzuVEZM8e2PD0wQaTb
         vm+XxzCSApITFaLnQ8yLhIALFiC0BlDC44q/BTMzez09/4Hs5RVPA25nwcBOv3Ta3ZVG
         qQ5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783405061; x=1784009861;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pl1sWeMBafq5dBYywth/L+4oTHWDQJ/jNNc0mkSxTac=;
        b=YSQTxqKg+f6WwUQizNEruSI3hrLeyxQHYslI1qpLw5tffTtjQ5S47xd+HA6stLx+E3
         M78nRrdoikaAJr1eKk7Div0rz9XWwlnPf2yp1IVAQmwKNWHQircN4Xk/sx4LZ61ttg5N
         jJ04+wjpvz2fGAX4szvPjdYx2Zhamyk1Tq8J5HW9Vj5AQ1RxDiUzYHhPDy/P4inqhzts
         Efw5Crq+JTWr2CFN/jv06UbYsYxXfVAL3vyK6mtcmyR8iTN3RWc0nWffEFROoWVFx3bI
         eMx/g888gb8m1u0TXUSrmXLp30uSyqmnZw6i6+VsJYFYA96sGqJGQmmAN4D9fecajosT
         i5Mw==
X-Forwarded-Encrypted: i=1; AHgh+RpLbr7zqVY4bgfbRpHOpiyRQCvUN6tmw1pFrXHXk01JBr9eObqoFqLNusUcyhXVkSL1hFTzM/6wPR1o0vu8@vger.kernel.org
X-Gm-Message-State: AOJu0Yxhw/th0HdSazLJr2H+wPDtMXBv3DA4e/8690pHyoVMyrgaB/xc
	IGqO9W9PrQPXnv4k0HGUIomSz1hJV4WwJxqxDQtLLiZo4dBSgr5N79y9WzMrw4k7YiTJ5PTUdVN
	0QaJnDAleTRmwT+XeAYUWVnczSgsVkaGo2VA1MmEZJHR3YBblSJGItQyWpoxurJ8a1Xv6
X-Gm-Gg: AfdE7clYHQFvzspnKUQKWru2zBpb2O7ylJl1vPN9Fn6FRAY+ybd3YebNznXkP7GVjkx
	IqRyxAYVF4QyxeS1aYne2EAQIsGjYk8NP+uGYd7Qz8azILwbZ0pgNGDTWIuCyxWpjkU2i9pBEbV
	kR2yhsYBr7yuV7YB4dFtCnoMCYLYOx2jKLT3MTsemSjqbQor/JcD/hGB5MTJviTdoIOCJ+0Imxg
	RIbAXS1HQyo9QJV6QOKXTx9qmtkocmkYOlNSvbNqXYFMoKHn6NbfpHcMlTwxxWWtLD2PYsXB8nH
	YGO6TMmPFmV/BU6FyCrPPBep+9iF9Oo6X5NdL/U3pImYWy7Scabge5V3weIqyY9vV0vQ3PkBLwH
	4MhVBkcTQWFBMc1BfEnRq0fOpt/ZBSgf40AATceMSAW2dU9remDqf2xGCtikJguvfjNhD7dga22
	zriaXS/VE=
X-Received: by 2002:a05:6a00:3e1c:b0:842:3838:cb03 with SMTP id d2e1a72fcca58-8482f358cd6mr1181887b3a.11.1783405060443;
        Mon, 06 Jul 2026 23:17:40 -0700 (PDT)
X-Received: by 2002:a05:6a00:3e1c:b0:842:3838:cb03 with SMTP id d2e1a72fcca58-8482f358cd6mr1181856b3a.11.1783405059795;
        Mon, 06 Jul 2026 23:17:39 -0700 (PDT)
Received: from QCOM-SocCW5bzXR.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847f6b96c0fsm4816238b3a.20.2026.07.06.23.17.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 23:17:39 -0700 (PDT)
From: Jianping Li <jianping.li@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
Cc: Jianping Li <jianping.li@oss.qualcomm.com>, Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Abel Vesa <abelvesa@kernel.org>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        quic_chennak@quicinc.com, stable@kernel.org
Subject: [PATCH v9] misc: fastrpc: Allocate entire reserved memory for Audio PD in probe
Date: Tue,  7 Jul 2026 14:17:33 +0800
Message-Id: <20260707061733.495-1-jianping.li@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA3MDA1NyBTYWx0ZWRfX61zbpVmGPVPC
 wXpRgkrI6ITqi/1ef4hjOj+fp/79rZwpHhOjIf0vGsqxSw+2c2IhyW4tpM90isfjGJd91mnKIbJ
 HOswoiBst6401JMuYhMSl/phUhLHulwVNl+IhZKO7ZcBoFy5HudMgoPSQFkucCuSJnN1pJqzHi3
 jUGmaLKnLTP53B1MBubchpX5o5F8WcYgzUOSGUcV3wwMLAkcmSSmvk2SkJYVHW48YYBrK93x/ai
 64iRhyxOa7W7ae870aKauEA7l9rDdJ82ZNsMVFUsFg3coME2AF2+NqIRhpQm2AElaZxHHjZFzox
 3PmZ9SOsCnIpf16gENNFNviK1hHftSDye+La08Ms7rjApgDqTpERxYenKGOVgaBdA/KNDGons2v
 CE9O4Rx2sN5mGQ7qij4Srr9XzzPuzIRQh+pBK+nxcIBruK58wYd5nFGF6Mz45AJLUt/iGaQlWTH
 uZnnNvjSnY9OHNTCSgg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA3MDA1NyBTYWx0ZWRfXx73i9M3xgd8d
 5HZnuMVDz14NaXbn8wl5kc2UqDdcP6e6qnj3YnPCf/DEyvvRaSVh16IlTkEszKPySYY66gXW8lB
 vzs3l1eozL/xv1X/pIdpmNQpclpMseE=
X-Proofpoint-GUID: iGHtDww3cDgqS0f4uOd3vVJRVmPMd-PE
X-Proofpoint-ORIG-GUID: iGHtDww3cDgqS0f4uOd3vVJRVmPMd-PE
X-Authority-Analysis: v=2.4 cv=OKcXGyaB c=1 sm=1 tr=0 ts=6a4c9a05 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=c8cBMUidy7NAwe8AhH0A:9 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-07_01,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 malwarescore=0 clxscore=1015 suspectscore=0
 spamscore=0 phishscore=0 priorityscore=1501 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607070057
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-117147-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:srini@kernel.org,m:ekansh.gupta@oss.qualcomm.com,m:jianping.li@oss.qualcomm.com,m:arnd@arndb.de,m:gregkh@linuxfoundation.org,m:abelvesa@kernel.org,m:linux-arm-msm@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,m:quic_chennak@quicinc.com,m:stable@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[jianping.li@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_NEQ_ENVFROM(0.00)[jianping.li@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	ALIAS_RESOLVED(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: A49E8717E23

Allocating and freeing Audio PD memory from userspace is unsafe because
the kernel cannot reliably determine when the DSP has finished using the
memory. Userspace may free buffers while they are still in use by the DSP,
and remote free requests cannot be safely trusted.

Additionally, the current implementation allows userspace to repeatedly
grow the Audio PD heap, but does not support shrinking it. This can lead
to unbounded memory usage over time, effectively causing a memory leak.

Fix this by allocating the entire Audio PD reserved-memory region during
rpmsg probe and tying its lifetime to the rpmsg channel. This removes
userspace-controlled alloc/free and ensures that memory is reclaimed only
when the DSP process is torn down.

Add explicit validation for remote_heap presence and size before sending
the memory to DSP, and fail early if the reserved-memory region is
missing or incomplete.

Fixes: 0871561055e66 ("misc: fastrpc: Add support for audiopd")
Cc: stable@kernel.org
Signed-off-by: Jianping Li <jianping.li@oss.qualcomm.com>
---
 drivers/misc/fastrpc.c | 119 +++++++++++++++++++++++------------------
 1 file changed, 66 insertions(+), 53 deletions(-)

diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
index d86e79134c68..1ec37e6c68a2 100644
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
@@ -1344,15 +1346,24 @@ static int fastrpc_init_create_static_process(struct fastrpc_user *fl,
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
+
+	if (!cctx->remote_heap || !cctx->remote_heap->dma_addr ||
+	    !cctx->remote_heap->size) {
+		err = -ENOMEM;
+		dev_err(fl->sctx->dev,
+			"remote heap memory region is not added\n");
+		return err;
+	}
 
 	args = kzalloc_objs(*args, FASTRPC_CREATE_STATIC_PROCESS_NARGS);
 	if (!args)
@@ -1376,31 +1387,6 @@ static int fastrpc_init_create_static_process(struct fastrpc_user *fl,
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
 
@@ -1412,8 +1398,24 @@ static int fastrpc_init_create_static_process(struct fastrpc_user *fl,
 	args[1].length = inbuf.namelen;
 	args[1].fd = -1;
 
-	pages[0].addr = fl->cctx->remote_heap->dma_addr;
-	pages[0].size = fl->cctx->remote_heap->size;
+	/*
+	 * Audio PD is a static PD and retains the remote heap
+	 * information across daemon restarts. Therefore only
+	 * the first attach should provide heap information to
+	 * DSP. Subsequent attaches reuse the previously
+	 * initialized memory pool.
+	 */
+	spin_lock_irqsave(&cctx->lock, flags);
+	if (!cctx->audio_init_mem) {
+		pages[0].addr = cctx->remote_heap->dma_addr;
+		pages[0].size = cctx->remote_heap->size;
+		cctx->audio_init_mem = true;
+		inbuf.pageslen = 1;
+	} else {
+		pages[0].addr = 0;
+		pages[0].size = 0;
+	}
+	spin_unlock_irqrestore(&cctx->lock, flags);
 
 	args[2].ptr = (u64)(uintptr_t) pages;
 	args[2].length = sizeof(*pages);
@@ -1431,27 +1433,7 @@ static int fastrpc_init_create_static_process(struct fastrpc_user *fl,
 
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
+	cctx->audio_init_mem = false;
 	kfree(name);
 err:
 	kfree(args);
@@ -2418,12 +2400,23 @@ static int fastrpc_rpmsg_probe(struct rpmsg_device *rpdev)
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
+				if (!data->remote_heap) {
+					err = -ENOMEM;
+					goto err_free_data;
+				}
+
+				data->remote_heap->dma_addr = res.start;
+				data->remote_heap->size = resource_size(&res);
+			}
 			src_perms = BIT(QCOM_SCM_VMID_HLOS);
 
 			err = qcom_scm_assign_mem(res.start, resource_size(&res), &src_perms,
@@ -2431,7 +2424,6 @@ static int fastrpc_rpmsg_probe(struct rpmsg_device *rpdev)
 			if (err)
 				goto err_free_data;
 		}
-
 	}
 
 	secure_dsp = !(of_property_read_bool(rdev->of_node, "qcom,non-secure-domain"));
@@ -2490,6 +2482,7 @@ static int fastrpc_rpmsg_probe(struct rpmsg_device *rpdev)
 		misc_deregister(&data->secure_fdevice->miscdev);
 
 err_free_data:
+	kfree(data->remote_heap);
 	kfree(data);
 	return err;
 }
@@ -2512,6 +2505,7 @@ static void fastrpc_rpmsg_remove(struct rpmsg_device *rpdev)
 	struct fastrpc_buf *buf, *b;
 	struct fastrpc_user *user;
 	unsigned long flags;
+	int err;
 
 	/* No invocations past this point */
 	spin_lock_irqsave(&cctx->lock, flags);
@@ -2529,8 +2523,27 @@ static void fastrpc_rpmsg_remove(struct rpmsg_device *rpdev)
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
+		if (err)
+			dev_err(&rpdev->dev,
+				"Failed to assign memory back to HLOS: dma_addr %pad size %#llx err %d\n",
+				&cctx->remote_heap->dma_addr, cctx->remote_heap->size, err);
+	}
+
+	kfree(cctx->remote_heap);
+	cctx->remote_heap = NULL;
 
 	of_platform_depopulate(&rpdev->dev);
 
-- 
2.43.0


