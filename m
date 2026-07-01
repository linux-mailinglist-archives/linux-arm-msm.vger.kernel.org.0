Return-Path: <linux-arm-msm+bounces-115653-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id XDjqJl/uRGrF3QoAu9opvQ
	(envelope-from <linux-arm-msm+bounces-115653-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Jul 2026 12:39:27 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 158C96EC42C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Jul 2026 12:39:27 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=cpbEpQKY;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=iBHROBo4;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-115653-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-115653-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D652C3056264
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 Jul 2026 10:38:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 83B5C426D11;
	Wed,  1 Jul 2026 10:38:10 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8973E426693
	for <linux-arm-msm@vger.kernel.org>; Wed,  1 Jul 2026 10:38:07 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782902290; cv=none; b=JdTnVDo8b5qCQ1Nmyxb6r/8Bu5JgGJTxjaJp3bCUAKOrTaj6HIk9iXJMT5w/hd+iPyvLHam5zzULR+4vNAqnL1lkcjAMkfow9jJ3xD0mbNQjYurYCYi3maw506b18LOg/4f2oWcCHRw24uZn4liXIWvwBEA3xcLKMM3rlqUFphg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782902290; c=relaxed/simple;
	bh=y9g67LoOAK1zIYhgVoqMtpnLtPZtPHG+SZ4nbuUAoiw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KPXEYv5pZpxOD0yj0v5ABoXj5OScP5lCpv4/VVsVL/mMpppB0cp+f3IYkL7trrnpAPSA4HComLrT8wfsFm98fph1i2yLucyt5diAHe5QE3zUbBiHP/2seZn6Nl6Oa6IZH0pPvXC3PbYK+D3kVexYOorrl3gS3l4chW71dAPwU58=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cpbEpQKY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iBHROBo4; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 661A8aOm761871
	for <linux-arm-msm@vger.kernel.org>; Wed, 1 Jul 2026 10:38:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	eWnkB32rC8c/c1FmukfGJLAkXTQ/yzUwW5QZTJ1tuHA=; b=cpbEpQKYeJAibeQw
	DF/pYebaDlq3kYo/OPlezrMmkbtB6HKnIvcZnKq7/Uh0zSHdvpfOyepU7UY0/qJL
	oEseZXD5mMrlJAK4uD/xXudLJbf9dKPglADPs2AVOJo5id7HDRP4SaAoCLVDFVE2
	QohC+zc7CKE2QUntNlQFdxP4Y1AxlMMEuatAX4mGAaxZJMzFvlg/8Z4fVGehZzFS
	ra1u84e/bpbRSFwME5y+dHge3mAyLIUyKohwqKRgFaVLkai8OJo0TdGlI7DbhzVa
	Q7l1eg/sLgcHyA3Dnu1COBxvzH0/75VQAGGxiLOyyE1r+2j9Y+9Ssm85CTGbra+s
	qcC/VQ==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f4kgw3kaj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 01 Jul 2026 10:38:06 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-37fc13e8182so704501a91.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 01 Jul 2026 03:38:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782902286; x=1783507086; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eWnkB32rC8c/c1FmukfGJLAkXTQ/yzUwW5QZTJ1tuHA=;
        b=iBHROBo4iSm+61nMFQQYSg2Tf2tgMZZnY+gNstHthmaD6ZWvn2arO5lQekjsDuhlEa
         s1J7P8rO7kOKyqsuV9sc/YvMcp4DRmWgF8r14dJ0psOvVJe2SnsvBv26MEXYOSs0up3X
         qCRc8D99kZ/ClOLdfGcpVjwRWyvLLWPR5QhJ54g6vjNuS/lX4y7PX6UsJLYEHm5s6r9N
         HUKDVBbweRlddJXej0x+V4aCl3I1Rcsjmf1TZAGbwJitBbVsyK8DY1VBhS1H6B9IOuFM
         Li9Tkn8G9JGMCKp/lTFHkblBGG5+MVFpjXaDrtt9eps7yAIvN05VaYHJrLOJO6ssjIn9
         /slw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782902286; x=1783507086;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=eWnkB32rC8c/c1FmukfGJLAkXTQ/yzUwW5QZTJ1tuHA=;
        b=Vs8UUsXNZ+w7SJkr95TKYlYYLuhQc/nsfBbtB70CX/P2yFA1sPNUiF0g10U8r9b6Rp
         GqrEKI9zasS0hSMYmLsKSDu2Akz/k8iQUiFj1TQJQns1GO/rSgOT1bkxllCcyDvRjIqs
         Btl/yaq0gBZ6B/61CpDVKUTA80FPZWMVPKOOio0wG7MQt4JOEx8MWhUyssiiH57vGhSy
         b2bKx2ZcoLXlrAqp3C6/d5fd6YFEVA+3QG8aGLqLKmi3rgl7lDEGM71nRzlkpSeZg9T5
         T1bqxyEUXWyYkwGpjjBdG0yBeznsS8mRPPsyRDPijh58zK5dxtbAdMNMLOagTwqlJgZb
         LVeQ==
X-Forwarded-Encrypted: i=1; AHgh+RoT4guOT7e6iwCwwk6QYtUItq42b9WQifEJcABz2Qqzpdnb+iQXuvFXROGJjYeuoKGldqUyJaGWZk2VPQZK@vger.kernel.org
X-Gm-Message-State: AOJu0Yz8pA7rheMf12bosbchS/XdIPvtZ2DelIqEeTY2zi5Sbs4pfZmf
	jpfr8XiMhaElKaUJ4CyCzM2M58baik1DWdwkyU2ZkAu8K4W6zd0d2JhrCb6aa+THkpEiMtemEho
	kiwifv6MLHmbpViaDhXkjxZDwi1DKydE357lNCePtMaeZ1NfkdFS/M2O4sn5H92zkBuku
X-Gm-Gg: AfdE7ckQqes5enR0/aBmTU0NYg+JeyqhB4hJbZGSe88T8wNU7jvUuWgI6Q8sQfaugSS
	Tx5/8CpnJAI/yL6BwEBF6BzGAmvOn5gtNcplh22mHv1fwXp0HZhLiTkN/U4Uj2FoSDlmCZarEE2
	AN0EqpUYTmW58+2xcSYms6Vm0owyrJwv2unaLyOm9cEWJmx21Y+kfHRdo7SJ1bI2e0oPYBpepsl
	QjGmzK7Lef98ZCmhl2gSiM/sGlgEiofRELV6EDGLIO/fwJQklfFF/R5LXrlwKIpRCDQ2y/I5wbv
	92/bwZAwljLV7ODbKvX5uzs5BWuuvb/2GCxojw7Q+t9xlgFoLnKFf4Ry4JKtTAzEi9qviQDzZye
	sO2NXQla3/cBCynFxooEieLpTBiDsdEiWDd5dItem
X-Received: by 2002:a17:90b:562c:b0:37f:9ce3:ca97 with SMTP id 98e67ed59e1d1-380aa20e0cemr953612a91.32.1782902286099;
        Wed, 01 Jul 2026 03:38:06 -0700 (PDT)
X-Received: by 2002:a17:90b:562c:b0:37f:9ce3:ca97 with SMTP id 98e67ed59e1d1-380aa20e0cemr953589a91.32.1782902285554;
        Wed, 01 Jul 2026 03:38:05 -0700 (PDT)
Received: from hu-batta-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38095bc8a2asm765251a91.0.2026.07.01.03.38.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jul 2026 03:38:05 -0700 (PDT)
From: Kishore Batta <kishore.batta@oss.qualcomm.com>
Date: Wed, 01 Jul 2026 16:07:38 +0530
Subject: [PATCH v6 4/7] bus: mhi: Add QDU100 Sahara variant and firmware
 fallback
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260701-sahara_protocol_new_v2-v6-4-3a78362c4741@oss.qualcomm.com>
References: <20260701-sahara_protocol_new_v2-v6-0-3a78362c4741@oss.qualcomm.com>
In-Reply-To: <20260701-sahara_protocol_new_v2-v6-0-3a78362c4741@oss.qualcomm.com>
To: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
        Jeff Hugo <jeff.hugo@oss.qualcomm.com>,
        Carl Vanderlip <carl.vanderlip@oss.qualcomm.com>,
        Oded Gabbay <ogabbay@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        mhi@lists.linux.dev, Kishore Batta <kishore.batta@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782902263; l=5296;
 i=kishore.batta@oss.qualcomm.com; s=20260206; h=from:subject:message-id;
 bh=y9g67LoOAK1zIYhgVoqMtpnLtPZtPHG+SZ4nbuUAoiw=;
 b=jnKA84aJ1sECKLlROc87nix/+fJvHhxdehrww1VkOlAbyhF3aSuQQrLie42XItz0ub6ZmN/ZB
 r689bN1jkB9CaoIdFwF+Sin8UMVYjo36Y1sA5IsNj8RHzmnCNZTo7W3
X-Developer-Key: i=kishore.batta@oss.qualcomm.com; a=ed25519;
 pk=vJo8RvTf+HZpRLK2oOIljmbn9l3zFkibCGh+blaqZCw=
X-Authority-Analysis: v=2.4 cv=Co2PtH4D c=1 sm=1 tr=0 ts=6a44ee0e cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=3TBL8zyTcm-CCHetwZgA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-ORIG-GUID: DJ7-Nd7kumjANWYV6HZ9enDCTXaFICYA
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAxMDExMSBTYWx0ZWRfX5vXdhy7TiPaX
 8t3J6/q4G7nIHVb+KjT4q1OJghmZceOR/ONnL6Ik0C9AJRzJFryfGWHB5nqkhXbQvOLy3Uju9b5
 BgMO2TiP0FFYDR82QwhApUy1ZjzTw64=
X-Proofpoint-GUID: DJ7-Nd7kumjANWYV6HZ9enDCTXaFICYA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAxMDExMSBTYWx0ZWRfXzRN5UOzygPZ2
 wp9whgeqqfXyBy9esxcf7vVZ+FSA96ooNE2k6qH2NX5UdDshDnEr17LRj9yA2Qh0PIa7DMNTkhu
 g7fYSJI3IaHFpLbe64fiItwolGLgMyA06dpj4FoCxs6009JQIHJGhpTwAS1gsrVTZ2bwMrWUzxA
 Njuect0Emk2h2pQ409SvhB7yrlFCRiGdueJmLWkyX3ZjQrdjj/snNqpX0zlpUU0FCKBAdZ+SPL8
 6io3gPKM0sPAF3uf0fbSniYcb0eie/NYu4kZIMySnyeMmodFNff+TzzMjcSGVWESVJxlbJB4SxM
 ZGz1mRRm1BvZYX+diffPw8cUFN+G0NOwrDE40/2rjYfDvkrvBxFlPifo5NdPGlwaIdL2WPjmChn
 jd/FGw/M7yRVmiKAp3zm4cVAnwulk5SmIg+BamaBNyUEsA8uP4yFnpmLL8eMg5pZ9wkG43TrjZO
 u+GDanXgvTyxorwrsfA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-01_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 bulkscore=0 suspectscore=0 phishscore=0
 spamscore=0 lowpriorityscore=0 adultscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607010111
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-115653-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:corbet@lwn.net,m:skhan@linuxfoundation.org,m:jeff.hugo@oss.qualcomm.com,m:carl.vanderlip@oss.qualcomm.com,m:ogabbay@kernel.org,m:mani@kernel.org,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:mhi@lists.linux.dev,m:kishore.batta@oss.qualcomm.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[kishore.batta@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,vger.kernel.org:from_smtp];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kishore.batta@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 158C96EC42C

The Sahara driver currently selects a firmware image table based on the
attached device, but it does not recognize QDU100 devices that expose the
protocol on the SAHARA MHI channel. As a result, the host cannot associate
QDU100 devices with the correct firmware namespace during image transfer.

Extend the probe time variant selection to match the SAHARA MHI channel and
associate it with the QDU100 firmware folder. Add a firmware lookup
fallback for cases where an image does not have an explicit entry in the
device's firmware table. This allows required images to be provisioned by
the platform.

This change only affects devices matched on the SAHARA MHI channel and
does not change behavior for existing AIC100 and AIC200 devices.

Signed-off-by: Kishore Batta <kishore.batta@oss.qualcomm.com>
---
 drivers/bus/mhi/host/clients/sahara/sahara.c | 27 +++++++++++++++--
 drivers/bus/mhi/host/pci_generic.c           | 45 ++++++++++++++++++++++++++++
 2 files changed, 70 insertions(+), 2 deletions(-)

diff --git a/drivers/bus/mhi/host/clients/sahara/sahara.c b/drivers/bus/mhi/host/clients/sahara/sahara.c
index e339c67e236af271645ca81cc517efd9eead87e4..9adbd84859073d8024ba2a5fcfa33897439d6759 100644
--- a/drivers/bus/mhi/host/clients/sahara/sahara.c
+++ b/drivers/bus/mhi/host/clients/sahara/sahara.c
@@ -189,6 +189,7 @@ static bool is_streaming(struct sahara_context *context)
 
 static int sahara_find_image(struct sahara_context *context, u32 image_id)
 {
+	char *fw_path;
 	int ret;
 
 	if (image_id == context->active_image_id)
@@ -201,8 +202,28 @@ static int sahara_find_image(struct sahara_context *context, u32 image_id)
 	}
 
 	if (image_id >= context->table_size || !context->image_table[image_id]) {
-		dev_err(&context->mhi_dev->dev, "request for unknown image: %d\n", image_id);
-		return -EINVAL;
+		if (!context->fw_folder) {
+			dev_err(&context->mhi_dev->dev,
+				"Request for unknown image: %u (no fw folder)\n", image_id);
+			return -EINVAL;
+		}
+
+		fw_path = kasprintf(GFP_KERNEL, "qcom/%s/%u",
+				    context->fw_folder, image_id);
+		if (!fw_path)
+			return -ENOMEM;
+
+		ret = firmware_request_nowarn(&context->firmware,
+					      fw_path,
+					      &context->mhi_dev->dev);
+		kfree(fw_path);
+		if (ret) {
+			dev_err(&context->mhi_dev->dev,
+				"request for unknown image: %d\n", image_id);
+			return -EINVAL;
+		}
+		context->active_image_id = image_id;
+		return 0;
 	}
 
 	/*
@@ -870,8 +891,10 @@ static void sahara_mhi_dl_xfer_cb(struct mhi_device *mhi_dev, struct mhi_result
 
 static const struct mhi_device_id sahara_mhi_match_table[] = {
 	{ .chan = "QAIC_SAHARA", },
+	{ .chan = "SAHARA"},
 	{},
 };
+MODULE_DEVICE_TABLE(mhi, sahara_mhi_match_table);
 
 static struct mhi_driver sahara_mhi_driver = {
 	.id_table = sahara_mhi_match_table,
diff --git a/drivers/bus/mhi/host/pci_generic.c b/drivers/bus/mhi/host/pci_generic.c
index 391ab146f501c6ce1c81f6138f7c491a49c2f264..82e41632afc555a53dec3d8395558ae039b33bbd 100644
--- a/drivers/bus/mhi/host/pci_generic.c
+++ b/drivers/bus/mhi/host/pci_generic.c
@@ -300,6 +300,43 @@ static const struct mhi_pci_dev_info mhi_qcom_qdu100_info = {
 	.reset_on_remove = true,
 };
 
+static const char * const qdu100_image_table[] = {
+	[5] = "qcom/qdu100/uefi.elf",
+	[8] = "qcom/qdu100/qdsp6sw.mbn",
+	[16] = "qcom/qdu100/efs1.bin",
+	[17] = "qcom/qdu100/efs2.bin",
+	[20] = "qcom/qdu100/efs3.bin",
+	[23] = "qcom/qdu100/aop.mbn",
+	[25] = "qcom/qdu100/tz.mbn",
+	[29] = "qcom/qdu100/zeros_1sector.bin",
+	[33] = "qcom/qdu100/hypvm.mbn",
+	[34] = "qcom/qdu100/mdmddr.mbn",
+	[36] = "qcom/qdu100/multi_image_qti.mbn",
+	[37] = "qcom/qdu100/multi_image.mbn",
+	[38] = "qcom/qdu100/xbl_config.elf",
+	[39] = "qcom/qdu100/abl_userdebug.elf",
+	[40] = "qcom/qdu100/zeros_1sector.bin",
+	[41] = "qcom/qdu100/devcfg.mbn",
+	[42] = "qcom/qdu100/zeros_1sector.bin",
+	[45] = "qcom/qdu100/tools_l.elf",
+	[46] = "qcom/qdu100/Quantum.elf",
+	[47] = "qcom/qdu100/quest.elf",
+	[48] = "qcom/qdu100/xbl_ramdump.elf",
+	[49] = "qcom/qdu100/shrm.elf",
+	[50] = "qcom/qdu100/cpucp.elf",
+	[51] = "qcom/qdu100/aop_devcfg.mbn",
+	[52] = "qcom/qdu100/fw_csm_gsi_3.0.elf",
+	[53] = "qcom/qdu100/qdsp6sw_dtbs.elf",
+	[54] = "qcom/qdu100/qupv3fw.elf",
+};
+
+static const struct mhi_sahara_fw_table qdu100_sahara_fw = {
+	.image_table = qdu100_image_table,
+	.table_size = ARRAY_SIZE(qdu100_image_table),
+	.fw_folder = "qdu100",
+	.non_streaming = false,
+};
+
 static const struct mhi_channel_config mhi_qcom_sa8775p_channels[] = {
 	MHI_CHANNEL_CONFIG_UL(46, "IP_SW0", 2048, 1),
 	MHI_CHANNEL_CONFIG_DL(47, "IP_SW0", 2048, 2),
@@ -1399,6 +1436,14 @@ static int mhi_pci_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 
 	pci_set_drvdata(pdev, mhi_pdev);
 
+	/*
+	 * Provide Sahara firmware mapping. Sahara consumes it via
+	 * mhi_dev->mhi_cntrl->sahara_fw at probe time.
+	 */
+	if (info == &mhi_qcom_qdu100_info ||
+	    (info->name && !strcmp(info->name, "qcom-qdu100")))
+		mhi_cntrl->sahara_fw = &qdu100_sahara_fw;
+
 	/* Have stored pci confspace at hand for restore in sudden PCI error.
 	 * cache the state locally and discard the PCI core one.
 	 */

-- 
2.34.1


