Return-Path: <linux-arm-msm+bounces-112677-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id IcB0CNN+KmrHrAMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112677-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jun 2026 11:24:35 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AD916705E2
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jun 2026 11:24:34 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=pR6DQiab;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=a+PjpUGf;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112677-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112677-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 973DB3034DEB
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jun 2026 09:22:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E9DEE38655D;
	Thu, 11 Jun 2026 09:22:35 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD0982FD681
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 09:22:34 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781169755; cv=none; b=F95NkEaM42lDKNUl8tT757Wbr8jgbXULNqse8rayD/G9WSwDSvABFPDnkLQ0r9nycR8K02VIQ3VdJQITJqHzg31DruV+nhImfmyJUudPHADC8td375BpFuLuBsUvhJJMpDokflun1fvFw3v+d77reOqXV1F30BHiPw162MeY8ck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781169755; c=relaxed/simple;
	bh=Zk8H4FwYMLTVTDtC4IiZOJd3d3cK7vNxMAb+5edZg60=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=WBrFJd1CbmppxUhDGb520dORUHcJpz67CbJESAgfh07uNJ8KLdn2wfPwS5rwgI/3/PyLNde3alqx+99X3l8QFeruRLkiDWvw1FK+2yUpnkhdnJo+Bki0nu1okIS25bj+X2IIbWNueiTPIw/EN70YzN52n4t1ml0VyOJNq5L+OeU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pR6DQiab; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=a+PjpUGf; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65B9MXrC215505
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 09:22:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=lRkZOp3iPYfQpAbFXsal39
	p3C4jzKAkopk1z5GMHzKg=; b=pR6DQiabb5dCwvywGX0y7Gf6KnTUbRYrcypq8l
	ZHmuh0d+Eu71BVn1PnZ8C3cozG1dkeGUnbIcOwQ9g5nKMISewtOYBjOQxB36IRDJ
	G1c/r1/Eq9kkaFTjOAUzku5Tdq8FwePWNXVMUmRtXOgJ0QyWvm2BX6CIS9ldBLbu
	juP8d9wJei0IhWv8DktpnxwI4KSeD0mSVEvt8l2/jw/9jFDMDQEbp7kmsb8m1Bkt
	YNIf25gX8BgFFxbqXtOEzjkCs0Di76M8aLmmiOEZargdEp9i0bE99LeLAiHbd6Mq
	6WTa/KsB6MVYkZbvx/+ZK9QRHngO++oHQBy0n4oK6ljQY9JQ==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eqtb5g00a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 09:22:33 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-307fd7138b1so204435eec.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 02:22:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781169753; x=1781774553; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=lRkZOp3iPYfQpAbFXsal39p3C4jzKAkopk1z5GMHzKg=;
        b=a+PjpUGfGMGUqa1Ow2MyXrBlZVubtCiZ3dCjYUKrlUQ+jkRD/tcHDdr1X9FoRSQ6IL
         TDJ2wB/INNloeIaMmrq2uqvIgq7XMIpKHYoMJTjC96m5788wLIt35FnOY0XtTvX1SFCe
         m1uJCb4Wrcjk+6aqCjeqg7hpFQpcTJVZC8se8kgG4GynmUwF64GeioOebtdDRsL/fUsb
         TfMc/0JnXjAXAtn6qnGGkcELxs/1/amFHAc22ByUH6u6hXvLDWFZqUyCokySeGoArLY8
         G1HaeAq1w9OgY+6e1mmUx/xBz5ROL8GPpcM9lNngwAo8s5hYgKTKPdwWA5aa4SZiHfrz
         WQ1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781169753; x=1781774553;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lRkZOp3iPYfQpAbFXsal39p3C4jzKAkopk1z5GMHzKg=;
        b=jvK4pWXC4ouv3zEQyj5zSW382qQI8JST0CQFFQhS0pdqlM5dZKUGXbOv99BOnnavN+
         UsSw/KnovsvnpzmCUtCwAJ1dTZXd3EWuxqyplaaFCmaw/ckxcQIUHQ+xU8TZdi2/Em5Y
         eXtLK3pAsZcEvntrfKgAqWhZjGDprD0mgrB4ncQ3XsAopnkF8r2t9tAnMb4aId4CIWeC
         eXzrU8BFnJft5jf2RVu9RRyS0/htFfFEh1xvBULYtXqF3owWlJ2r4pX8ivIP/PZ4EO0d
         f12VSTtUjOca31L98PJaJntTiC8sjfBzOmEXRflUOSdmuXrD+BPoQ4jICInj5BZaGUHq
         mABA==
X-Gm-Message-State: AOJu0YyWwY3uDwHAiBtOjRgZOzr8XMO4HBtllQRWrHClbLLH2VUACEs9
	1hPMgYJOkyjBtUHCblvzi9CTSAu8PR5Sub3uJG2uMh6+vuNdvDhUxQhtl8hqPJzAgjHuHDLdFAs
	63/Hla0s906wcUSJXGm9Bv/ikaPKe9BcR3C2k7rqCh1q0BDtE8LYzdBp0Q1apucFiCfDsxeM/SA
	6DOCM=
X-Gm-Gg: Acq92OEW96uAOk4xZSekkMrf4MPCU8p6SzLXs1e4XLKLfvBSLIpRxHvG7m82j25P08Y
	MLgMEBsKzsoZevWULq1kfUhBJ0DIwUDs8K/NZj2A4s4hF4bsgi5rPXmSsdbae53R/neM4mCWgdF
	bfGDZ0IjAI8x+ylvlc3+4e60wTc08X+N2Qk1mMi7DOVneuJLzUVFjCtB+pamUApwgXVeDL3FqQB
	HKCWXVWBTSavAv5bDxS5+ro3uT1lertGm+OgbzXM3Vtyy89XgBOF8D5XHwNE56N1V06JVghN/yj
	pNp7mC2mfNi4vROG5sj3OAoEM2ntAEQgsb4a5F6IDNhXpuQq6gaEFKVbYql51oOy5CF4r3Wtfis
	QcKg6gMypkBPVJvc5y5SWypNeGa2AU1ryupVxlZ4UH5hDHj528hp9qDsYnYxqmzUIGHHjdDda6U
	sCb2zp
X-Received: by 2002:a05:7022:7a0:b0:138:30b1:4bfc with SMTP id a92af1059eb24-138421355f7mr1223023c88.9.1781169752573;
        Thu, 11 Jun 2026 02:22:32 -0700 (PDT)
X-Received: by 2002:a05:7022:7a0:b0:138:30b1:4bfc with SMTP id a92af1059eb24-138421355f7mr1223005c88.9.1781169751981;
        Thu, 11 Jun 2026 02:22:31 -0700 (PDT)
Received: from hu-yutlin-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-138430536ccsm1333005c88.15.2026.06.11.02.22.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jun 2026 02:22:31 -0700 (PDT)
From: Eddie Lin <eddie.lin@oss.qualcomm.com>
Date: Thu, 11 Jun 2026 02:21:44 -0700
Subject: [PATCH] misc: fastrpc: fix memory leak in fastrpc_channel_ctx_free
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260611-fastrpc-cctx-cleanup-v1-1-28097444116c@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIACd+KmoC/yXMwQrCMAyA4VcZORtoe9jEVxEPaZbOiNTSdDIYe
 3erHr/D/+9gUlUMLsMOVd5q+sod/jQA3ykvgjp3Q3BhdKP3mMhaLYzMbUN+CuW1YExzcERTPJO
 DnpYqSbff9nr729b4EG7fFxzHB4FP+zh4AAAA
X-Change-ID: 20260611-fastrpc-cctx-cleanup-bfd20aa7b8a0
To: Srinivas Kandagatla <srini@kernel.org>,
        Amol Maheshwari <amahesh@qti.qualcomm.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, Eddie Lin <eddie.lin@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjExMDA5MiBTYWx0ZWRfX0dH8qSh7WujS
 p366+L5/WfBGbU+CK0CEuOQixUlpp5tftGv8mCa35EVW4TdaJXT94tOkbv8MHd3fxVKroKE9AGU
 i2LCbMQI+wEFN/HZCTtNBWVG/uyBENRVxYE9zGhvDHUDsg25grdldMEct9hkyab7dteRdegjs6R
 5rXtN4/mdNfLfOfWDPG7JR6uS5xpGnZF+9NEy/3D3+gEkBfV1PKOe4hB+YuGlPYs0TyYtTs6vCc
 rw665ElEAI9CPmN5ca0RJLb6AGJfUwg2N1gyF6naLA4lyE3jc+7FHww8m8UQfz5H3C4IORCU9Hp
 ebCIG0u528xa0hROWmUeNDBgUV04MUudD2BA4SbZseCxvJKgJyibAxg5TLoGZWHp/aOt1HcSwgs
 +PkVotu8IfP5qAedpaDgPCYdV/cbSuQ1EWQ0VUboZRhWYhX7vKSmSXIXQWZ29TtuOOKv3+uUtsf
 yRJYH2yQJWaNHryqwtA==
X-Proofpoint-ORIG-GUID: dw4Bb0dJFQNGu_fUaTrQT6eKrwsRk5LO
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjExMDA5MiBTYWx0ZWRfX+8oJqwn4h4YR
 kKqAvThjxm4P8YwjKlDZGjpjpafOf026DYm6m1Yk0fj3oyDNFNBwF2cOApkz+TnO7+2zOYk0Lon
 sFzTGiD8J8BMEsdvDSSw2Y84MEk7/xs=
X-Authority-Analysis: v=2.4 cv=e6g2j6p/ c=1 sm=1 tr=0 ts=6a2a7e59 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=TEyi4pTYuxprMEVdLL4A:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-GUID: dw4Bb0dJFQNGu_fUaTrQT6eKrwsRk5LO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-11_01,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 bulkscore=0 priorityscore=1501 lowpriorityscore=0
 phishscore=0 clxscore=1011 impostorscore=0 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606110092
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-112677-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[eddie.lin@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:srini@kernel.org,m:amahesh@qti.qualcomm.com,m:arnd@arndb.de,m:gregkh@linuxfoundation.org,m:linux-arm-msm@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,m:eddie.lin@oss.qualcomm.com,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,vger.kernel.org:from_smtp,qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[eddie.lin@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 8AD916705E2

The 'ctx_idr' is initialized but never destroyed when
the channel context is freed, leading to a memory leak.
Add idr_destroy() to properly clean up the IDR resources.

Signed-off-by: Eddie Lin <eddie.lin@oss.qualcomm.com>
---
This patch series fixes a memory leak in the FastRPC driver.
The channel context's IDR was not being destroyed during cleanup.
---
 drivers/misc/fastrpc.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
index a9b2ae44c06f..7727850e9240 100644
--- a/drivers/misc/fastrpc.c
+++ b/drivers/misc/fastrpc.c
@@ -492,6 +492,7 @@ static void fastrpc_channel_ctx_free(struct kref *ref)
 
 	cctx = container_of(ref, struct fastrpc_channel_ctx, refcount);
 
+	idr_destroy(&cctx->ctx_idr);
 	kfree(cctx);
 }
 

---
base-commit: abe651837cb394f76d738a7a747322fca3bf17ba
change-id: 20260611-fastrpc-cctx-cleanup-bfd20aa7b8a0

Best regards,
--  
Eddie Lin <eddie.lin@oss.qualcomm.com>


