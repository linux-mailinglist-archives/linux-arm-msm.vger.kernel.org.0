Return-Path: <linux-arm-msm+bounces-115269-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id o2M4K4ZjQ2r2XgoAu9opvQ
	(envelope-from <linux-arm-msm+bounces-115269-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jun 2026 08:34:46 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C1F46E0C71
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jun 2026 08:34:46 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=PmKdbvoY;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=LJVCOSpD;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-115269-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-115269-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A24B7300F5EA
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jun 2026 06:34:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 35FC023A99F;
	Tue, 30 Jun 2026 06:34:20 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC95A3F9FB
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jun 2026 06:34:18 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782801260; cv=none; b=AbpJY5/kCreNuGfrt3ZuEJHNPQke+Iz8hsFnRxyLdGAThtZo/7tbZBhbDn3hz4grfH4aOh7YnMxdroQdAihadycXngpnrSbrXolsxjtAvRl+moigw1cIua2ml132zkzoUQ6nCpzcKUij2TyFJuNX2lbmJXHzvQ1GDysKDHxgO84=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782801260; c=relaxed/simple;
	bh=0EL6ZU1jr7FjV/0QKknVsKrIBbWfjMwe1MCkyMpTnRM=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=fOKA9JZetGn3EdVqAOBHJ6pw21HLa+gyvyTYkt1UkyIzLyXR+d2pit3c7n0IIi7iLzsL3p+zsq1FMagILXfNMcInlPQop0A46IXuYXalRCwm3azgfmB/oVTGe2DKxTAtMNICNPFfY0Gr4HpSNKFdpgWIurOYLbS+jHViE1V3MLU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PmKdbvoY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LJVCOSpD; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65U6Cg2w1074128
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jun 2026 06:34:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=Lkk1aid6VSjCiAh0RBtC69AWGsaj2zmcu8D
	ZktAdjhA=; b=PmKdbvoYoQGt6wie3aKrjDVrvI47ima6lzT04Aznd9GbfdlaeF4
	wbLUBZVHd3yuMJbkZ2XdOvgeTkpbMCoZJ3lo6xkj30XLC9CvHNOaWm5Qhfwmd90D
	S9oztBzB4PT15/qpxqn7NFoiQuolBcy+sUBCk/GxxbMhVLCwwDHRi5XSCeeZdMUE
	mU66hWnt77zqT6n58ZgUIEQAqrC0bOkr+4LW0jamt2QeTcztvhU5y7AGsoV+7CpT
	c5gjKIZ+Z5Wr7zAWJrT6SYYd3JykFRXRWA+gNelZiu3YbydjZUzK2sOTMybEzFY8
	GrMGwQLKDtC9xxnTHMnjwKfYRoi8OT0oHSQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f3y9k1vye-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jun 2026 06:34:17 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2c7f385887bso69279765ad.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 23:34:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782801257; x=1783406057; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Lkk1aid6VSjCiAh0RBtC69AWGsaj2zmcu8DZktAdjhA=;
        b=LJVCOSpDAjgZGX4+VV0nub/3zoBH0ac1gbKESQkrnKAjuncNmBWFqPrzcMwI6nFFnK
         4YjqYDa91fIJZZnSmczPS/cbt4FMXkGCUekjecJu4x0RVvIH+SlGNufe1r4OMH0aJcp7
         NDFYu5Bvvaf1aT1miQbiTu6F0QalhS9vTiVZH6sg1iaIaN0j8elR8gR1/ra8uk8IP7U/
         Bv5EciVIu2TMqDjWPIHmYvIQU31NsFDKrTKtHrB9hsWLg66xGJ16yilCTkoiiv6zaTOq
         s/7i1NoyGPa7OHGW2j0cIrltuK4Idljj9w2AoWVi8Gq+ZsFsxdVEW9McnzUOXI5Ke75B
         8YzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782801257; x=1783406057;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Lkk1aid6VSjCiAh0RBtC69AWGsaj2zmcu8DZktAdjhA=;
        b=byEDABow1yd6E805rWBB7n9W3kUvx2ysceD9Iew9aSLTS+JX35HxuhL+/69f8o5Kja
         K+daPaYtG1ndywJhS5pAKuwIvseRAAkZnPKrkG0sVdqY4qwE4OFQZhdRKnCmmSMe1h3t
         dZVzQSbIZMDUI8ExpwrLaEYMo6ngHgWQC01Q8qcUgXutg7SQXqnCHU7+M8UgvIxKbrlE
         QYxtqm8I5N+i/ZrWXGOwwr0pcLLz4Dobhvn+ULb2Y8WKOVQvxgh9M+Ca86ut4f9g02SO
         qRFUyfJGLiHuwO8e+2K8SuyIVJxMcsdnMSD+IK7MxUKgALAIzX6p/j8GgD1bl+0le+my
         WyhQ==
X-Forwarded-Encrypted: i=1; AHgh+RrI5ovRP6I4AVw5OYCJt/TeXySUSYJfwlc8Sg7JoTB+x54vGqemRtRfHUl6cf6juM5Di1WtK/tr7Cfm16fn@vger.kernel.org
X-Gm-Message-State: AOJu0YzE49gQZ9U1cngjDTLM4TCkNsSnYO/yqt9MOvJutdqTwdN0z2Jf
	33vOD8FDS5X8Oa0MVa+UB95xxAu04i+zqyrsG0nIyQvqaG0Mzvsbfw55hk36wxtmkbqC4ZgGPXD
	a0y22rgXsviIf2vgMsZWZNh+CIdeUkjfJPPxWlTk7vRaZoUJ2Rn3VMaLw9TOjFPwSeMxX
X-Gm-Gg: AfdE7cn/3Nd73Nk1paU2ndPL04Y8Ws4PTO3Q5GcAYc1QTIghxAcWKLZ77Vngipzz3MY
	cCbRr1fF0tQ7GXWGZOVgyFLabY0RYs81JMXsTCbaJt/QuM6sdbPd7OSC3gt3jNopbQebBAN6GJP
	C/KqENruXQ/fMO+TeJ3DvEFGElVO/IFvxTa8TYMHYpuYYd18nuQrUFvUbrDCh+9CO/7y+H5OqTr
	7ScTp9vsmc3pukmosGeymQlNBqFjuH0RVbquCVOhBX/SEYcYXuqa/4S0mALi8/jcp7Gs6so0Bs2
	ru8s9x3HCPUFX+U90G1kjhU7gIYM4x3mJXImjLQENBFpS19H38k3xIL9DhlFYjXUtJpbAYeJtC+
	EvDJuF/kljya+56yCNxVmRcrsP9SBmlmnquVtwyTP3jIsKFYpY1Yd2KPgzIk0WtT8ZBphyZ+gY9
	sjsznI50k=
X-Received: by 2002:a17:903:4b2f:b0:2ca:11fd:659d with SMTP id d9443c01a7336-2ca2ea238ccmr19680545ad.34.1782801256820;
        Mon, 29 Jun 2026 23:34:16 -0700 (PDT)
X-Received: by 2002:a17:903:4b2f:b0:2ca:11fd:659d with SMTP id d9443c01a7336-2ca2ea238ccmr19680235ad.34.1782801256193;
        Mon, 29 Jun 2026 23:34:16 -0700 (PDT)
Received: from QCOM-SocCW5bzXR.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ca382d0d22sm6646345ad.80.2026.06.29.23.34.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 23:34:15 -0700 (PDT)
From: Jianping Li <jianping.li@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Amol Maheshwari <amahesh@qti.qualcomm.com>
Cc: Jianping Li <jianping.li@oss.qualcomm.com>, Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Thierry Escande <thierry.escande@linaro.org>,
        Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, quic_chennak@quicinc.com,
        stable@kernel.org
Subject: [PATCH v2] misc: fastrpc: fix UAF and kernel panic during cleanup on process abort
Date: Tue, 30 Jun 2026 14:34:09 +0800
Message-Id: <20260630063409.475-1-jianping.li@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjMwMDA1NCBTYWx0ZWRfX95X1Y6XK0sZU
 f3/kt2YG33jfE7GEIfrknBqogsPut5h9iu2aGf1fHyeHTyDm0IOVt6MM3bRn9mCeFz83jiQCCRz
 RHmKsHviH/HujAd8UbO0sSmIIKLSyRw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjMwMDA1NCBTYWx0ZWRfX9roq1RLUAJUv
 lHf7vRXawz/C6NZ6jjpIM0iSi29ud9R9eKxC+k7iOGcij3zSrlw3/R7kIsTRmJ0vRpGEXLKuxuG
 2lmomOPLPRklF/WCHJbpak5djg/WMq+eFlKmo+DAD4j5+f2Wbjxc9shVP+eXXw0viv/Jb8qWzHQ
 GellJm+MyZu0jsltVbT2gg+TpSCUdj/yH5bm0Un3Wv7Z1UdZB8Pap1CqWec+MePyeVSO9k5JdCT
 yNaWsrO+sGH0/kv0/fEadTxTT75IlBoHDQSLf1RveJYMulqDTXEXPEDoUpIeysCRnyuS6e6lVv2
 wQtVU9bBh/HiD5nZGdjWxKaj87lFJdJLc7M8Fwly+ziSJqCeHwTEBOO2fnQUe+yPqlRharO2qpW
 Tc7qTllKI0386FpISllEOJsoIlC6iAIFKovaQVBauDo4FlL5ENMpXL02wDp2u8tg3r2uUPyaLLC
 rPwL2q2wGUKNf+CeLdg==
X-Proofpoint-ORIG-GUID: R0_EoMhDEGYyrZPLo0_HbHWb4wjKX5nR
X-Authority-Analysis: v=2.4 cv=TeqmcxQh c=1 sm=1 tr=0 ts=6a436369 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=7UBpWWJXUKeOLZOJV8wA:9 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-GUID: R0_EoMhDEGYyrZPLo0_HbHWb4wjKX5nR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-30_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 phishscore=0 priorityscore=1501 malwarescore=0
 spamscore=0 adultscore=0 suspectscore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606300054
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-115269-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:srini@kernel.org,m:amahesh@qti.qualcomm.com,m:jianping.li@oss.qualcomm.com,m:arnd@arndb.de,m:gregkh@linuxfoundation.org,m:thierry.escande@linaro.org,m:ekansh.gupta@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,m:quic_chennak@quicinc.com,m:stable@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORGED_SENDER(0.00)[jianping.li@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jianping.li@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,qualcomm.com:dkim,qualcomm.com:email,vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 0C1F46E0C71

When a userspace FastRPC client is abruptly terminated, FastRPC
cleanup paths can race with device and session teardown.

This results in kernel panics in different release paths:
- fastrpc_release() when using remote heap, originating from
  fastrpc_buf_free()
- fastrpc_device_release() when using system heap, originating from
  fastrpc_free_map()

In addition, fastrpc_map_put() may trigger refcount use-after-free
due to concurrent cleanup without proper synchronization.

The root cause is that buffer and map cleanup paths may access map
and buf resources after the associated device or session has
already been released.

Fix this by:
- Introducing mutex protection for map and buf lifetime
- Serializing buffer and map cleanup against device teardown
- Skipping buffer and map operations when the device is already gone

These changes ensure cleanup paths are safe against unexpected
process aborts and prevent use-after-free and kernel panic scenarios.

Fixes: c68cfb718c8f9 ("misc: fastrpc: Add support for context Invoke method")
Cc: stable@kernel.org
Signed-off-by: Jianping Li <jianping.li@oss.qualcomm.com>
---
 drivers/misc/fastrpc.c | 57 ++++++++++++++++++++++++++++++++++++++----
 1 file changed, 52 insertions(+), 5 deletions(-)

diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
index a9b2ae44c06f..3521518f9fe5 100644
--- a/drivers/misc/fastrpc.c
+++ b/drivers/misc/fastrpc.c
@@ -255,6 +255,8 @@ struct fastrpc_session_ctx {
 	int sid;
 	bool used;
 	bool valid;
+	bool allocated;
+	struct mutex mutex;
 };
 
 struct fastrpc_soc_data {
@@ -335,9 +337,14 @@ static inline u64 fastrpc_sid_offset(struct fastrpc_channel_ctx *cctx,
 static void fastrpc_free_map(struct kref *ref)
 {
 	struct fastrpc_map *map;
+	struct fastrpc_user *fl;
 
 	map = container_of(ref, struct fastrpc_map, refcount);
 
+	fl = map->fl;
+	if (!fl)
+		return;
+
 	if (map->table) {
 		if (map->attr & FASTRPC_ATTR_SECUREMAP) {
 			struct qcom_scm_vmperm perm;
@@ -356,10 +363,16 @@ static void fastrpc_free_map(struct kref *ref)
 				return;
 			}
 		}
+		mutex_lock(&fl->sctx->mutex);
+		if (!fl->sctx->dev) {
+			mutex_unlock(&fl->sctx->mutex);
+			return;
+		}
 		dma_buf_unmap_attachment_unlocked(map->attach, map->table,
 						  DMA_BIDIRECTIONAL);
 		dma_buf_detach(map->buf, map->attach);
 		dma_buf_put(map->buf);
+		mutex_unlock(&fl->sctx->mutex);
 	}
 
 	if (map->fl) {
@@ -422,9 +435,18 @@ static int fastrpc_map_lookup(struct fastrpc_user *fl, int fd,
 
 static void fastrpc_buf_free(struct fastrpc_buf *buf)
 {
-	dma_free_coherent(buf->dev, buf->size, buf->virt,
-			  fastrpc_ipa_to_dma_addr(buf->fl->cctx, buf->dma_addr));
-	kfree(buf);
+	struct fastrpc_user *fl = buf->fl;
+
+	if (!fl)
+		return;
+	mutex_lock(&fl->sctx->mutex);
+	if (fl->sctx->dev) {
+		dma_free_coherent(buf->dev, buf->size, buf->virt,
+				  fastrpc_ipa_to_dma_addr(buf->fl->cctx,
+							  buf->dma_addr));
+		kfree(buf);
+	}
+	mutex_unlock(&fl->sctx->mutex);
 }
 
 static int __fastrpc_buf_alloc(struct fastrpc_user *fl, struct device *dev,
@@ -447,8 +469,11 @@ static int __fastrpc_buf_alloc(struct fastrpc_user *fl, struct device *dev,
 	buf->dev = dev;
 	buf->raddr = 0;
 
-	buf->virt = dma_alloc_coherent(dev, buf->size, &buf->dma_addr,
-				       GFP_KERNEL);
+	mutex_lock(&fl->sctx->mutex);
+	if (fl->sctx->dev)
+		buf->virt = dma_alloc_coherent(dev, buf->size, &buf->dma_addr,
+					       GFP_KERNEL);
+	mutex_unlock(&fl->sctx->mutex);
 	if (!buf->virt) {
 		mutex_destroy(&buf->lock);
 		kfree(buf);
@@ -491,6 +516,10 @@ static void fastrpc_channel_ctx_free(struct kref *ref)
 	struct fastrpc_channel_ctx *cctx;
 
 	cctx = container_of(ref, struct fastrpc_channel_ctx, refcount);
+	for (int i = 0; i < FASTRPC_MAX_SESSIONS; i++) {
+		if (cctx->session[i].allocated)
+			mutex_destroy(&cctx->session[i].mutex);
+	}
 
 	kfree(cctx);
 }
@@ -855,19 +884,28 @@ static int fastrpc_map_attach(struct fastrpc_user *fl, int fd,
 		goto get_err;
 	}
 
+	mutex_lock(&fl->sctx->mutex);
+	if (!fl->sctx->dev) {
+		err = -ENODEV;
+		mutex_unlock(&fl->sctx->mutex);
+		goto attach_err;
+	}
 	map->attach = dma_buf_attach(map->buf, sess->dev);
 	if (IS_ERR(map->attach)) {
 		dev_err(sess->dev, "Failed to attach dmabuf\n");
 		err = PTR_ERR(map->attach);
+		mutex_unlock(&fl->sctx->mutex);
 		goto attach_err;
 	}
 
 	table = dma_buf_map_attachment_unlocked(map->attach, DMA_BIDIRECTIONAL);
 	if (IS_ERR(table)) {
 		err = PTR_ERR(table);
+		mutex_unlock(&fl->sctx->mutex);
 		goto map_err;
 	}
 	map->table = table;
+	mutex_unlock(&fl->sctx->mutex);
 
 	if (attr & FASTRPC_ATTR_SECUREMAP)
 		map->dma_addr = sg_phys(map->table->sgl);
@@ -2246,6 +2284,8 @@ static int fastrpc_cb_probe(struct platform_device *pdev)
 	sess->used = false;
 	sess->valid = true;
 	sess->dev = dev;
+	mutex_init(&sess->mutex);
+	sess->allocated = true;
 	dev_set_drvdata(dev, sess);
 	sess->sid = sid;
 
@@ -2260,6 +2300,8 @@ static int fastrpc_cb_probe(struct platform_device *pdev)
 				break;
 			dup_sess = &cctx->session[cctx->sesscount++];
 			memcpy(dup_sess, sess, sizeof(*dup_sess));
+			mutex_init(&dup_sess->mutex);
+			dup_sess->allocated = true;
 		}
 	}
 	spin_unlock_irqrestore(&cctx->lock, flags);
@@ -2282,6 +2324,11 @@ static void fastrpc_cb_remove(struct platform_device *pdev)
 	spin_lock_irqsave(&cctx->lock, flags);
 	for (i = 0; i < FASTRPC_MAX_SESSIONS; i++) {
 		if (cctx->session[i].sid == sess->sid) {
+			spin_unlock_irqrestore(&cctx->lock, flags);
+			mutex_lock(&cctx->session[i].mutex);
+			cctx->session[i].dev = NULL;
+			mutex_unlock(&cctx->session[i].mutex);
+			spin_lock_irqsave(&cctx->lock, flags);
 			cctx->session[i].valid = false;
 			cctx->sesscount--;
 		}
-- 
2.43.0


