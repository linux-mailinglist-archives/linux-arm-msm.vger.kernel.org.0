Return-Path: <linux-arm-msm+bounces-111999-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id H2etDBeCJ2qIyQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111999-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 09 Jun 2026 05:01:43 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DD8A065BF3E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 09 Jun 2026 05:01:42 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=jb2u3vtw;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b="hMw/83Xo";
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111999-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111999-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id DE10E30C6DD0
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Jun 2026 03:00:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1598E2571DD;
	Tue,  9 Jun 2026 03:00:12 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C36C33630B7
	for <linux-arm-msm@vger.kernel.org>; Tue,  9 Jun 2026 03:00:09 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780974012; cv=none; b=d1mDOduB2TNMBCf1zVr+NbRvsl7dBpnP1MbxT0vSyy7DIxbBS7BelA/0aABO55/+nLuw8efp7Hqo3/pEJq/RtSas5s7/kMXwfT7FThhh+LuQl1zdJsEErf/udlTdsIObSpXpiDg2shBFDKUM4Z09R7hatYjNaGIBDGibQi1mNsk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780974012; c=relaxed/simple;
	bh=eWIeTYW7FeOdq0GfLYC8itEcxTSMTfbyp2U9xoYqsA0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=JxGZVO/PZWRV1UggFP1N9YUA/2M6z8jGwI0PngibT7yHvsWqKr/RQDvwbTXc7IyQnnHT/pVOCnM7gT6nWuhvGNE076fmLFC3BPJh7NQLLM0YXdeQ5vaPPPAB95EPQr3CU7AsIebQ7WZQDOuzZkIhN/nKecBjR63b3Iw+VDstdqo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jb2u3vtw; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hMw/83Xo; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6590rtBO659225
	for <linux-arm-msm@vger.kernel.org>; Tue, 9 Jun 2026 03:00:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=cisBsGwi1YI
	qjwGwTWwgeZV3iNbu+JN7OENdgw6CMME=; b=jb2u3vtwrbQWTMWOcQwac7zgp+G
	sBqfS0J4rid2VVUfbvrJx6v08YnQnMUaIkYdByNR8UtHlLsYbTehF7e6QdYb3jvO
	dQgOFRZSKgl4JhRGizhXY0GLXM9u0nMiBVyIAzRvx4rVZ+w0uUlb635rePAGCeqJ
	52MqCQimWDY4CuyaeqFzMAHrfnfJ3ilIcIvjjuzJQVgoSv+Oznp4aSOP4BFnD+8Q
	NRtPugewMW4SM3rCgetyw0AmE+Yu3MDh0mO1OMCzHIODhPRDl6jmUb37dLO2utld
	t9sHcJjFH2Okqu9HYTiuR90bxa0mkywLekebN95GC9pW8Z2h0zeog1SOMyA==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4envajbtas-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 09 Jun 2026 03:00:09 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-36d98b74447so3889019a91.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 08 Jun 2026 20:00:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780974008; x=1781578808; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cisBsGwi1YIqjwGwTWwgeZV3iNbu+JN7OENdgw6CMME=;
        b=hMw/83Xo3DhC57zzhAGYQYVwDXbUsbO4Z06M/aFRRG5EYzkfOEgyKDpXHND4kGizqY
         65zNaiuT3UtPizPC8AazLvXdytBXcgh6qAU8IsiBRPPVFUpsQ1t6bDYurTzkDw6ap7k4
         o9EzmcEr9GrOB0LtJTizey8El9JVqEHokn/x31i8lB1oRB2gdJdnARBMt9Sqz3Wf5SMT
         CEoUo3AdkvqNYB20Np7DdTHNY9sftCEVpP2TQtrYSHhH9MNZR9m7kQs4lgN7Iy+RDT8E
         aXnNBH8Fl5aIHwHp2TtzIMOvGnhvS4ADQ8yo8YXbKYPlhRiKMZCJxxBOPYXNFs+Xqrnw
         FlmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780974008; x=1781578808;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=cisBsGwi1YIqjwGwTWwgeZV3iNbu+JN7OENdgw6CMME=;
        b=m5urF4WuCjgu82G8A0Xxy6ZW+XQeglUGhd8C5wxxxn1zBWX2IAlD6lEntx2GV6dHTG
         ndG/aKnM5e/rhcFy65zl7Kd5X7Bby68YgRk4HSqsrAqy/MJN5OPsfbuqHRDX6mdluAFP
         LTgz+hjkvxgne/EZVzQqDSVl1LyyT9dBKD/rKYaSDkoTv5/MflXiYsPrWti72VgeXOR8
         ylTUZesv3pxokiClxgLtkrsf8InLuGCw5VZAyp4ycWcnhSsvDtVMeSCxU8DJ3cncM4D2
         KS/7dnkrebKVlkfrqDaSV2bRbq/DII2jc1hpydmtuT2E2krmA+/cEX62okZLCGq8NWv1
         5s6w==
X-Forwarded-Encrypted: i=1; AFNElJ/MU0WKrlvnBvCZeKGtK34dwhOTG2YFz1iIKogjdnYqJeh1O8gMYTpytC3+rgh8DnU2SxNDNzxIjNTZYHgt@vger.kernel.org
X-Gm-Message-State: AOJu0YwbXZRZ80cbbPVW95b9QP67fcgshxoOoNJIo0eFQKIL9QT2HfN8
	II2Kzz7QgVkxr2wQkA+oAyYHatKzFeniTNe3V6++pKK7yu4F7ksExeIKZDe8k7pLmY/DaYjraRk
	K7NkdqtRYDvgKnr+F8tLkZQHFQlg57gMS0z7URolRTU9QmR09IlwulIJh12wmxKhmVXVf
X-Gm-Gg: Acq92OG4k/BX0SrUMHR5bd/UKGOUA99t2A28nV+TJMmjLrCJQN4yubnX8+lnO1X05q2
	6+cgIykAwfbZcHBTpppVl6AvEBtodGsx5lgYBEfUvLXcrmd4Bb4D7W+VeNOffEx/in9zYy7zE+G
	5sW+E/yPUsrV9J3VSNGxs/YoEoQyAq/ucs2UJlLThThr8Y3ECUiUl5OZHE0kgJX/mabOveCehYy
	Ho2Wkdcf++TmzG+INxreXOFiM0OmiEDCc4vg7YF4yh1hr8pepY5ub2hQT1Ias582mnvL0s07NIp
	lTRmMn2Vu28im3sqv+k4TEEcrAnVz42KlCSMY4Jtcc0Dsf/1DPkaOpUroeSbcDelo12GkvFkZJN
	Ya8A4O7Eyjz7wjYNfqVT7t6ekG2+j3SvzgBd8hQZY43w0FuL7S7QQOrZwAy/U5cDONf84JXA+Lq
	QjTxzRd4a6KPkDr8Jb9WESnQ2QIg3c
X-Received: by 2002:a17:90b:4990:b0:36b:b9c7:35fb with SMTP id 98e67ed59e1d1-370f0579a1bmr17907731a91.14.1780974008356;
        Mon, 08 Jun 2026 20:00:08 -0700 (PDT)
X-Received: by 2002:a17:90b:4990:b0:36b:b9c7:35fb with SMTP id 98e67ed59e1d1-370f0579a1bmr17907685a91.14.1780974007681;
        Mon, 08 Jun 2026 20:00:07 -0700 (PDT)
Received: from QCOM-SocCW5bzXR.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3712fcb2607sm8713835a91.0.2026.06.08.20.00.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2026 20:00:07 -0700 (PDT)
From: Jianping Li <jianping.li@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Amol Maheshwari <amahesh@qti.qualcomm.com>
Cc: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Abel Vesa <abelvesa@kernel.org>,
        Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, quic_chennak@quicinc.com,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Jianping Li <jianping.li@oss.qualcomm.com>
Subject: [PATCH v8 4/4] misc: fastrpc: Allow fastrpc_buf_free() to accept NULL
Date: Tue,  9 Jun 2026 10:59:38 +0800
Message-Id: <20260609025938.457-5-jianping.li@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260609025938.457-1-jianping.li@oss.qualcomm.com>
References: <20260609025938.457-1-jianping.li@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: rVWm8Tqo8G9Ob1vRoJYenOHzq-WMPgLc
X-Authority-Analysis: v=2.4 cv=eo3vCIpX c=1 sm=1 tr=0 ts=6a2781b9 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=XYmfcRj0Jzm9BuThv0sA:9 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-ORIG-GUID: rVWm8Tqo8G9Ob1vRoJYenOHzq-WMPgLc
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA5MDAyNSBTYWx0ZWRfX+b2zG6UPfhWT
 DF28GGUhSSQ/JnbCYC7ZnViPLKCjYw0STv85gBVcrvU6Tg3WAIGmkRSmMZBk1kBi3lr9R4NvsQk
 W7bc2l9HSFga6BXqHSsIZoIkFHMwl6817SGyRyba0L4E4ILVg7KHOlW+Lx1sLB+nQb+ALJujj7a
 DVva4SpLk8ETNv9F1WKuuXO06f3VOgwmL9VycyZMkNk/A6ocURTQu9j+VoVQ4mOXx8vvZWctC0Z
 Y7BkH4w9thOVIzzOVWX4EKeUMyeV7MhG8O/ETPyxj3eBxk9rs23Yufy7kvn/r44Na4ZYZ7XLwZy
 nrp3HRtqGRglojRmqRXqhF7tELFgEydeAeLES//Rl5D2vYy8h9g8XElrSKV3F1/sj58BKJN7Tk6
 4rLNlQaiRAgRnN4jtpti4nbbTbsnKLGe3d0rP1QU/RvxaWx9tlAft0gTUOSKKObMQhjvvPquR2V
 yxC11nJykCNpIJnzLuw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-08_06,2026-06-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 phishscore=0 clxscore=1015 bulkscore=0
 malwarescore=0 adultscore=0 lowpriorityscore=0 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606090025
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-111999-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:srini@kernel.org,m:amahesh@qti.qualcomm.com,m:ekansh.gupta@oss.qualcomm.com,m:arnd@arndb.de,m:gregkh@linuxfoundation.org,m:abelvesa@kernel.org,m:jorge.ramirez-ortiz@linaro.org,m:linux-arm-msm@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,m:quic_chennak@quicinc.com,m:dmitry.baryshkov@oss.qualcomm.com,m:jianping.li@oss.qualcomm.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORGED_SENDER(0.00)[jianping.li@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jianping.li@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email,vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: DD8A065BF3E

From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>

Make fastrpc_buf_free() a no-op when passed a NULL pointer, allowing
callers to avoid open-coded NULL checks.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
Signed-off-by: Jianping Li <jianping.li@oss.qualcomm.com>
---
 drivers/misc/fastrpc.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
index 1942e74535e5..b4912b443b98 100644
--- a/drivers/misc/fastrpc.c
+++ b/drivers/misc/fastrpc.c
@@ -424,6 +424,9 @@ static int fastrpc_map_lookup(struct fastrpc_user *fl, int fd,
 
 static void fastrpc_buf_free(struct fastrpc_buf *buf)
 {
+	if (!buf)
+		return;
+
 	dma_free_coherent(buf->dev, buf->size, buf->virt,
 			  fastrpc_ipa_to_dma_addr(buf->fl->cctx, buf->dma_addr));
 	kfree(buf);
@@ -516,8 +519,7 @@ static void fastrpc_user_free(struct kref *ref)
 	struct fastrpc_map *map, *m;
 	struct fastrpc_buf *buf, *b;
 
-	if (fl->init_mem)
-		fastrpc_buf_free(fl->init_mem);
+	fastrpc_buf_free(fl->init_mem);
 
 	list_for_each_entry_safe(ctx, n, &fl->pending, node) {
 		list_del(&ctx->node);
@@ -562,8 +564,7 @@ static void fastrpc_context_free(struct kref *ref)
 	for (i = 0; i < ctx->nbufs; i++)
 		fastrpc_map_put(ctx->maps[i]);
 
-	if (ctx->buf)
-		fastrpc_buf_free(ctx->buf);
+	fastrpc_buf_free(ctx->buf);
 
 	spin_lock_irqsave(&cctx->lock, flags);
 	idr_remove(&cctx->ctx_idr, ctx->ctxid >> 4);
-- 
2.43.0


