Return-Path: <linux-arm-msm+bounces-102415-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8CR0MPBG12mTMAgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102415-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Apr 2026 08:28:00 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BE1A3C6968
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Apr 2026 08:28:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 82146301CCE4
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Apr 2026 06:26:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 604AE319601;
	Thu,  9 Apr 2026 06:26:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="U/FZNqWo";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="M2OVnFT7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1792B315D43
	for <linux-arm-msm@vger.kernel.org>; Thu,  9 Apr 2026 06:26:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775716008; cv=none; b=P4zrI3Us6+h2wXaNdHs9KTanohzPyHgcJoA2mWiXlVSBNB8MLw4Gx1ffCukPFXChDi3IWCh4FAEFmxgw4S6lEnpHL6pJjBPrYySzAOuC3IbyOvlhuhvMxi/VqQ+daXX5v3KwD6mudw5VvpKxKHhoD0nZQeZ87H7ebO8W6w3ilPQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775716008; c=relaxed/simple;
	bh=voof3OXR63zRr/xn1aaX4h9Q6+CP2DryZBJS4O9NWf4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=nIJyQ+hm052E43TNOiNfZskF6e0XmVZieuyi2t7ABlqfwjmdVSVPbu2Wz6kckk/GsolaoC1KI4Jj9s1GFSBxIFeiF4WGFVNr2o6QnqND3aj2rdLL9AiQkvJY5ZT7om4uzaVUYhK622y5LXL41ttMuacBRTMLPg/IfFKG8OV2oCo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=U/FZNqWo; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=M2OVnFT7; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6393BSLI1727555
	for <linux-arm-msm@vger.kernel.org>; Thu, 9 Apr 2026 06:26:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=cEmJBwZTivF
	/RSC2tmP5X0gUH+iQ6pYh8h5AOb4GCG0=; b=U/FZNqWoz9h74xg/WkfqqUZiAJh
	joY1iu4/n9oeAqFcM9AF3L3fXJNRwHCXF9JHiVMSJRL+40QjDZbnALzUfTzckItr
	Dw6mFVkQVjZiJTOUg87NJkk4zbDMRiGRuLjYzAcR5sCu36VKWBq/MyIMNJl8SZcw
	7MEVJFhcnRe0Hg6vm9MUT8xxZKrDzN7OFhejotnAXzEoRfVdX6vDtfzhWHX6s6xa
	N/t+uYETXR1j4ObDljFBZ4gKCxAV2IEjPFX7ZAKQar9eK7VZnrZ0v6tQrkt0hRBf
	Y5DEkOiicLQB8QwQtVSRQty5IaMk1tHymq+rfuXkDd60xhk9KGYk8ZxPNKw==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ddwcrsvu6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 09 Apr 2026 06:26:45 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2b23af7d7e8so18463065ad.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 Apr 2026 23:26:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775716005; x=1776320805; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cEmJBwZTivF/RSC2tmP5X0gUH+iQ6pYh8h5AOb4GCG0=;
        b=M2OVnFT7r3+w9b7L5tiGa273PYd83FjJpYXMU0YEkx22kUmFkNZcVVNhrXcMuCwBHc
         L1yHd1Ct4upNMRrn6Oemu33Feb9UXBf8q1hFhEFH8/vICfyWk9mqEU93Lr9eLsQ6hGBq
         F8LHm7YVN09LYBRHXtpnn986luFpiAMTFqCd2/+XINpEqosikM/z3W0KpWRvtZ1D7mB3
         PAOpTqgmVf3hpAEAwlEHILlJabAionXFkoEiEyg7a754E7pDEaox034N0+nKFcFPF9NF
         nfUU9gLVRWSvaQZVS6Lv7sTHPdVgz6xjZUYsTLSuh1fiIvTsnhQQPu4c8HiwqGkcerkH
         TDmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775716005; x=1776320805;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=cEmJBwZTivF/RSC2tmP5X0gUH+iQ6pYh8h5AOb4GCG0=;
        b=l5qelsaFWu50oaZv3lwJ71DhSiB9tTSxOBr5m0nh9CHOXK0bs7r+YXNmN4pszOw1Tv
         t7dd/RCUhy23XCzdEsmVtzIjowsj3X0ZtxxmAev3qSoxmWQPkUjG+WG58mKsfZvCsxmB
         z+uKcJXsAZEOPr7sN7S2ettKW2driArBsFMVPVIuAJpD86lrIOW7mfGq4StWNORRFm/I
         qTb9by2Ksfkon6DZP8Uk8uki2RPR9pWKW40KPijsxDs6iB0OXnkf6wCSNAW7BMCGdhQH
         0vLSoEfKp8rTLdgYMexxm5coZbWMVyRR9vGmOJcv3O+BlwgHWsEmyU6LKEQbFxq4KuL/
         vF4A==
X-Forwarded-Encrypted: i=1; AJvYcCXr6sw+18Ml3O+QI5NwCWHjmNXWVLE3FMp5BKOOku7zoUZURONrfRKf4o1nQ+v6MawRZVL0GapsYLYPYArZ@vger.kernel.org
X-Gm-Message-State: AOJu0Yw9QsvTp63jrWng5mAg5sPtDuDdoO0sa/yDLBC8Gn8tv1ZlB9s/
	o9Mw2oWuzQ3uiAPf9f+xX2UjbXX+EbZVylOXYaM7a2j7xDXNd96dV13sl6Eg1POh1Ywr9TxJmpB
	kz31rBdTH22/EMUa/jzVk4/R13jolgqEaIKV4ibY0VGiXuGy0ZB29PioxrRFKFEEuCmJO
X-Gm-Gg: AeBDiesD/14oJLxlXi3r+ESdRoDNTYP2cHw9N+NdBehrjUSOIvsc+rQU4KIGJsX73Wv
	HXGFCwzXdHbo+/ciZBNiOFFABW6ouLscS+LQlxj6s7lzDR5odsJX3vO68gS/X/M3i7zBU+HBSN3
	CpcY3nvKk+klNgPtDRNoBTwTiD7pk3DjhC+IML+vbTLfa+hBn3JY05nmP0RxPd40IK5uQuFxOJR
	5+/XESIW8HUR6yoDPZGFCljmaIIk36myTom1JvBayQH2aMANrfmX9lnEwUSen+PsYmbUu9phz/d
	U3Owp1GrjuJHUPSXCdxzJkgOP9qcJGJtVMXgeT+v7KPeyk0a3vurj65SvH1UTrEwpuVdRtz7cMS
	PhC0My0ZcMWFMfzI/+40ZsFrsXVvuvkzI6TbcGE0CWNJbS7jAF8qhoAR7cdHUc1amf4/HWaRT3A
	mayFkX1IVzIAQvCV+Q0g==
X-Received: by 2002:a17:903:3586:b0:2b2:6b58:9317 with SMTP id d9443c01a7336-2b28194ec0fmr245636635ad.39.1775716004877;
        Wed, 08 Apr 2026 23:26:44 -0700 (PDT)
X-Received: by 2002:a17:903:3586:b0:2b2:6b58:9317 with SMTP id d9443c01a7336-2b28194ec0fmr245636355ad.39.1775716004452;
        Wed, 08 Apr 2026 23:26:44 -0700 (PDT)
Received: from QCOM-SocCW5bzXR.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b2749cbd4dsm220786795ad.76.2026.04.08.23.26.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Apr 2026 23:26:44 -0700 (PDT)
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
Subject: [PATCH v4 4/4] misc: fastrpc: Allow fastrpc_buf_free() to accept NULL
Date: Thu,  9 Apr 2026 14:26:17 +0800
Message-Id: <20260409062617.1182-5-jianping.li@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA5MDA1NSBTYWx0ZWRfXyKjshgbTjC5x
 Vzx2HG4idKSgdk6pdBJZXZhdbbbp924UECKf1S/rWRzcu+cCD0YOaA+Q/B3FIc7nvxRAyEDApTR
 l0Liltu9lHXWS6Mqd1gdJQzrLvShATwogj5z73KRbl2hZKlQO0I1yrrPNueOzJqf3+4PLcQyaz0
 qRVBPUQN3Osd/3cI0D0dthoTWzxEVqixNL7zH754kdVfyTay4EWr7xv3x3GPe7sxMRE6fv3+Mfe
 4os8daf9gP7MwPG2RqsRjt5SUUrSFFN1pmO+zLzPOi90sUcVxHT7UqQKlBsueEjJ9bo0HDlLPKN
 Q8Q4r7rrTk0sZj8j3eGnZzRjX0F+Vf+zFwrLY6i17UX8w0dOtVBvv0FxHmD3a6juWOGvXH8epRx
 1B+i2QzXDhrbVYdPl8esxiI+lvVWOcYZ3lDRox97r26O/1veUippPw3iOCyhPMoFCstYjWaIpby
 BqdG2sVpLeGNB6IGUJA==
X-Authority-Analysis: v=2.4 cv=SsWgLvO0 c=1 sm=1 tr=0 ts=69d746a5 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=GmafkBk8WXepDEkBruoA:9 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-GUID: p0y2Gt3_5C1juEQiaQZ3J4NENNWwsyWW
X-Proofpoint-ORIG-GUID: p0y2Gt3_5C1juEQiaQZ3J4NENNWwsyWW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-09_01,2026-04-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 lowpriorityscore=0 priorityscore=1501
 spamscore=0 impostorscore=0 adultscore=0 bulkscore=0 clxscore=1015
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604010000
 definitions=main-2604090055
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-102415-lists,linux-arm-msm=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 1BE1A3C6968
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
index a67ae991c0b0..3cce81d0cd8b 100644
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
@@ -1565,8 +1567,7 @@ static int fastrpc_device_release(struct inode *inode, struct file *file)
 	list_del(&fl->user);
 	spin_unlock_irqrestore(&cctx->lock, flags);
 
-	if (fl->init_mem)
-		fastrpc_buf_free(fl->init_mem);
+	fastrpc_buf_free(fl->init_mem);
 
 	list_for_each_entry_safe(ctx, n, &fl->pending, node) {
 		list_del(&ctx->node);
-- 
2.43.0


