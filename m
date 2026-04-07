Return-Path: <linux-arm-msm+bounces-102103-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0EVwOO7W1GnuxwcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102103-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Apr 2026 12:05:34 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id B1C213AC83B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Apr 2026 12:05:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 22BF430098B4
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Apr 2026 10:05:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5779D3A3817;
	Tue,  7 Apr 2026 10:05:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="R5EhTiwV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HBYOzrKQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2BE93A6F15
	for <linux-arm-msm@vger.kernel.org>; Tue,  7 Apr 2026 10:05:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775556332; cv=none; b=jso15MgVG16W3wEKRZTBhS/0s7OyYBK8my1yO7nnVMD7R4L4Ln6MwkIB/MXbl9XbLAcH8JQyDedwZb1HjY2qkb2ya0spnkucZfxHtIx4Or7JurgZ8C/G816d93g0k0ByJZfd96Y1Q0vrPW2duGDv1mgCuQtNiHkzBbw0Ga5pHR8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775556332; c=relaxed/simple;
	bh=+bK468KNtO2zWcVagIj5V7Kwi3PQ7LvB8LycX6suXDk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ui1GFPre8nyRM2JncrW53l/TDowst0jHVUyzS9EXGKpCVwaoRlOcp3nTootUuhJG8i4hZhxsI7lXah1zy9mdANQWejTzATzfAm9y6fqRvOjf029N5/e3z2f/YZxVOoUUb/GMXy0bDrlBB+KFoldzjqE062v4XUenpSt34yPDSeI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=R5EhTiwV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HBYOzrKQ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6376wG1P1405882
	for <linux-arm-msm@vger.kernel.org>; Tue, 7 Apr 2026 10:05:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=ZJ0rOMNQkM9
	NjlMLDa9vYyhZJeWnJ4ED5lOjApBkm0M=; b=R5EhTiwV+lisT1g1dHWtbILqgac
	FEx+WJuhva4+++atLNfk55IGE3BYMth2XWHN5GgU5SCpJg60J3LfLMwM6Y/HI9ji
	tv3jZoWroy4VPQKkHFTj/rx7lkVsErx7LeN63RIuocAX1yJa19UfJIUCAJp4xUhH
	rl40hZF2BDbFS7DQNA1aBum3/5DND4K1uJCl79MbtUpcMhRhQCKKjhZSiPnC3gzw
	PI/e+bubKWTHL6mdLfCCH/rxwR9s3HnaOtYVI/9bteWFe9H5VIqo6UYt+06FycmL
	Bj206AJIT3xG6IeCLi4E5BlBe7bktb7MEEZOJl0zEGCciF5fq2z1hxMeBuA==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dcmrat6fm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 07 Apr 2026 10:05:30 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-82c63f85c84so2817795b3a.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Apr 2026 03:05:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775556330; x=1776161130; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZJ0rOMNQkM9NjlMLDa9vYyhZJeWnJ4ED5lOjApBkm0M=;
        b=HBYOzrKQOuTNkeFsEe0yU/ONp5ijbSSeWLy56DO0pUyfHVc45aE2jm60ajAiEEubTE
         4WHoOJTEaPZGHyXkxwEIiYDaFAPaS4xI7UBKPalbU/0BAfJCWWvgnJhjNHBq/uQcebwO
         goZmpbE+JOhLjSiaxqMNg6MIGb+2xre/cr0ijB0ygGDgrgKXVlW8qUiJqqCPkQY6Zbfk
         Ev+Q0+l3c0C30mzib+ae+O+VYp4/SknSG5jm/Dzeq95vFUCdLsuGqWeX8ts+eqAksQ6n
         dTMZzS7TV7Y3TtfIaa8u3DTECXOG9tgDaZ36CK+WMYfCAL9VH8yJgJRU5KhJ+WGRN1rE
         ln/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775556330; x=1776161130;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ZJ0rOMNQkM9NjlMLDa9vYyhZJeWnJ4ED5lOjApBkm0M=;
        b=F/JBWPOLnRRKD47Kl2x+b/JO+cah/QIebAIcvYfLiIzFOueD164JTNW6mU/rA5FgGv
         8SIJN2wbTLD4GSJNul8bCVOn12Axvbb981a/TbfavhYLr/VruGKJdNu6IH9Yl6MjJR6f
         7kZ/SJeLZexOi5s3cYMYz/wRsw7Emx7OO43/3vZ12hokefOwa9SMDBAXXoKEeUhddGNp
         Dfe2unbSYT5OxbJjxX34wMhX5bnz8Vwu/YC/87yHMXN79Z3SFKb/FdXctRUp2iz6AAMv
         6tAF1D/PYC0E44zBKlW/5/Dr3nGnhFK0rTWn26TSCrclmO042MUvtwz0PBHnbDdt4FWc
         d1Iw==
X-Forwarded-Encrypted: i=1; AJvYcCUrsub9ws883NXD/xAYrDPF3Jji301Kd/XF4f4QJO5FuHJ0daEw91ATcjGOahcvQfH/7f+Pkt65SMrQhFm8@vger.kernel.org
X-Gm-Message-State: AOJu0YzZG/ToLf08/oR1wR0M6XlooDBaWZ/ZoOM/aX2ViU0k+kj5TF7R
	tvBjIefC6ooIVEytpCngXLZ6sRTU6zQPr9pLiBr9CGmawFt8Gn6GRVBFYjyU2mWl3N02sTa404l
	lMBJne3O18O6Y5VGyQTShNXiLMIUZJC4va+r2y3C6A9WewCFo7Dot1UQFMFKCjvIE3Vpw
X-Gm-Gg: AeBDietXg5wMgAirN08tYM0AkLCWsMfjw/yGO5fXEIJk5FEyq2LXLg2FEjoHpSy7Ad+
	w0E4W0vSDpuLb8B4ozFyW2E7siWLd7wr7bFHxJxGXbLbLF3vNF2stsBv9HzF43NMd6GKfWljsbM
	juF2pWbIpmhJeNXlJInbSrreSgKnlgtIq13wtBXqywMlJRi01LmFFjcqSve1CcdpGTPluzXkdWO
	p7Wixope8xRJuc60MBOHJG90+1VcRNhsk8VTpa2JMMUbYMcI7RH2LmEfh96SesowK5gaQJcG16n
	B1hwZr3v8TjXqLyMiRPw4IvnT7TEOpKjN7PjkgW0X5Q7o5ck37yLmkYn4VUF2F//8xSpl5HlbMc
	Ooim6mzXBzIOvSVMv80j1GhBLPz5kNk0j4iIOkt2NHoWnRk9kmtEsUayDVydnna7L2crHBUV+YS
	6cGc6dJcqq/xl3h4OKYA==
X-Received: by 2002:a05:6a00:13a3:b0:82d:2a2:1b57 with SMTP id d2e1a72fcca58-82d0dbd7d7emr15741214b3a.51.1775556329489;
        Tue, 07 Apr 2026 03:05:29 -0700 (PDT)
X-Received: by 2002:a05:6a00:13a3:b0:82d:2a2:1b57 with SMTP id d2e1a72fcca58-82d0dbd7d7emr15741192b3a.51.1775556328957;
        Tue, 07 Apr 2026 03:05:28 -0700 (PDT)
Received: from QCOM-SocCW5bzXR.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82cf9b272bdsm17844323b3a.12.2026.04.07.03.05.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Apr 2026 03:05:28 -0700 (PDT)
From: Jianping Li <jianping.li@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Amol Maheshwari <amahesh@qti.qualcomm.com>
Cc: Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Abel Vesa <abelvesa@kernel.org>,
        Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>,
        linux-arm-msm@vger.kernel.org, ekansh.gupta@oss.qualcomm.com,
        quic_chennak@quicinc.com, Jianping Li <jianping.li@oss.qualcomm.com>
Subject: [PATCH v3 3/4] misc: fastrpc: Allocate entire reserved memory for Audio PD in probe
Date: Tue,  7 Apr 2026 18:05:07 +0800
Message-Id: <20260407100508.1027-4-jianping.li@oss.qualcomm.com>
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
X-Proofpoint-ORIG-GUID: mIfc9vmK9AX9CbDZ5-3mjn_bpZacMUrX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA3MDA5MCBTYWx0ZWRfX2z9MRSQnbtu/
 MfyjaRkROtWYAwMyDnSnDZLMCPZm7XRgbnVFXvoLJ+9xawdaqdSbwRAbfvhUkz2cusYh4UUKS5g
 pzb4nhIPJCZcngH0wFsRB37sn5wrHCLNtfH4mSdE/LBKEE6XlvBQVsqaJHseC9J/dyyWprkeAcz
 QpLfkKl4jZPwkFDEQqBRs87IyFayvDCM2OE2zWSD+uxE/94br46+JvVTqNNbnJ5DPtgZiewZxdU
 7M2EIbT/P2Pz8HDMMTIgnAMIXBh8a0HulYCu0J3cKbuR5HhZb72NWWqdMMvvTgS1yndPTbDVXiD
 WfCh2aah3hzpaFWHoOnthAu3Qc4uTsyIb3Tes/gdHvB2LTZFvsXvbcdMCNZf4GU82JS5aJKHJn/
 fyet/OWUbGCc2itoMdtHAlbD5XEd8YWoIYRodiIHsspo0sAcyzR2HXZr4Jvb13cMoYRjbvQ2fEn
 onLPy/vBhrlvo3qQ9FA==
X-Proofpoint-GUID: mIfc9vmK9AX9CbDZ5-3mjn_bpZacMUrX
X-Authority-Analysis: v=2.4 cv=D/d37PRj c=1 sm=1 tr=0 ts=69d4d6ea cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=vdXGJuizA_9wgsUJU-sA:9 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-07_02,2026-04-07_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 bulkscore=0 impostorscore=0 lowpriorityscore=0
 priorityscore=1501 malwarescore=0 spamscore=0 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604070090
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-102103-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jianping.li@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	RCPT_COUNT_SEVEN(0.00)[10];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: B1C213AC83B
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
 drivers/misc/fastrpc.c | 99 ++++++++++++++++++++----------------------
 1 file changed, 48 insertions(+), 51 deletions(-)

diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
index 148085c3b61a..3b2dc6a9e886 100644
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
 
@@ -1363,8 +1341,17 @@ static int fastrpc_init_create_static_process(struct fastrpc_user *fl,
 	args[1].length = inbuf.namelen;
 	args[1].fd = -1;
 
-	pages[0].addr = fl->cctx->remote_heap->dma_addr;
-	pages[0].size = fl->cctx->remote_heap->size;
+	spin_lock_irqsave(&cctx->lock, flags);
+	if (!fl->cctx->audio_init_mem) {
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
@@ -1382,26 +1369,7 @@ static int fastrpc_init_create_static_process(struct fastrpc_user *fl,
 
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
@@ -2390,7 +2358,7 @@ static int fastrpc_rpmsg_probe(struct rpmsg_device *rpdev)
 		}
 	}
 
-	if (domain_id == SDSP_DOMAIN_ID) {
+	if (domain_id == SDSP_DOMAIN_ID || domain_id == ADSP_DOMAIN_ID) {
 		struct resource res;
 		u64 src_perms;
 
@@ -2402,6 +2370,15 @@ static int fastrpc_rpmsg_probe(struct rpmsg_device *rpdev)
 				    data->vmperms, data->vmcount);
 		}
 
+		if (domain_id == ADSP_DOMAIN_ID) {
+			data->remote_heap =
+				kzalloc(sizeof(*data->remote_heap), GFP_KERNEL);
+			if (!data->remote_heap)
+				return -ENOMEM;
+
+			data->remote_heap->dma_addr = res.start;
+			data->remote_heap->size = resource_size(&res);
+		}
 	}
 
 	secure_dsp = !(of_property_read_bool(rdev->of_node, "qcom,non-secure-domain"));
@@ -2482,6 +2459,8 @@ static void fastrpc_rpmsg_remove(struct rpmsg_device *rpdev)
 	struct fastrpc_buf *buf, *b;
 	struct fastrpc_user *user;
 	unsigned long flags;
+	bool skip_free = false;
+	int err;
 
 	/* No invocations past this point */
 	spin_lock_irqsave(&cctx->lock, flags);
@@ -2499,8 +2478,26 @@ static void fastrpc_rpmsg_remove(struct rpmsg_device *rpdev)
 	list_for_each_entry_safe(buf, b, &cctx->invoke_interrupted_mmaps, node)
 		list_del(&buf->node);
 
-	if (cctx->remote_heap)
-		fastrpc_buf_free(cctx->remote_heap);
+	if (cctx->remote_heap) {
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
+			if (err)
+				skip_free = true;
+		}
+		if (!skip_free)
+			fastrpc_buf_free(cctx->remote_heap);
+	}
 
 	of_platform_depopulate(&rpdev->dev);
 
-- 
2.43.0


