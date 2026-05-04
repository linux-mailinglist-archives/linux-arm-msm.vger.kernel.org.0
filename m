Return-Path: <linux-arm-msm+bounces-105785-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wCJBHYfV+Gm41AIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-105785-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 04 May 2026 19:21:11 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 819CD4C1DD4
	for <lists+linux-arm-msm@lfdr.de>; Mon, 04 May 2026 19:21:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A94CA3082D37
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 May 2026 17:17:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C94883E4C99;
	Mon,  4 May 2026 17:17:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gfVQdB2S";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OsYKnRh1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C39C3E3D94
	for <linux-arm-msm@vger.kernel.org>; Mon,  4 May 2026 17:17:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777915038; cv=none; b=uXUaqZZrgYI0H8IMurVs7+ZzHAMgWk6iW/X5sjpik/cOeyoU23eLzLohJNby4djvHH7wYQVhWfw2AQYv8gp0dx8HxfXWWWGpac6k6SWxTYcqm9NDA/XmEyJlAbBfxFKMdClCFu60LqOVfQspTdRvTxpvkFtY90/H2ZeJZPdJlX0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777915038; c=relaxed/simple;
	bh=5rHDln5Du7UKyd6NUfaYe1P/1bzBY58whz2jgf0kGFU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qzQNl5HX7/bETx58n8Msojx8oCJ79WTqfIcg9huh4IMhuwFH/ejxruvV/5iBUBVMc9mshBA/ue2gl6TYTB3tbaAq9DuTJ+Y47AL8+lmfzuAJ5G6mrruj85ZR79B4k1KZr332DFWHbLheMxaYD1OlH4HZzCXDG6zxN6tv7ErYkuU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gfVQdB2S; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OsYKnRh1; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 644B49gh4128676
	for <linux-arm-msm@vger.kernel.org>; Mon, 4 May 2026 17:17:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=yBTfPe5yUoE
	GsgDSiMIe7M0rHkLENgYzLNl7AyqRuE8=; b=gfVQdB2S0kXcvC7hXFi28+Zbmmf
	JrSyxSNRjdOEwOR+ORye/m0A3fQjUmwBz7AHXsEIe/y2B2kFpJtgKOMvXcQH/p9P
	sl6GLVv/uOKnfD33wFQTV/V3BTPOvccMc8fX1VX84WaT1iHeYZiIlmKoYRv5kdEk
	ULXcBZmai3u8Qr+OQaBq3rfM5GnyRK2IyG0vXOlBJw9nFysKAwCpR+E0NwJO6hxu
	X0HnZRfLTV2yu2Szq2/puT2u17PfFTXbZOLhRBk/MJTAZGFI+VW0Yktaub0gagQj
	JL2u4JeDAxEckV3L0fM70PBfIOak+tjKB64O6YdF1wLEEHhuREQfwQZvbdQ==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dxsdw1f4b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 04 May 2026 17:17:15 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c82346bdb00so183604a12.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 04 May 2026 10:17:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777915035; x=1778519835; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yBTfPe5yUoEGsgDSiMIe7M0rHkLENgYzLNl7AyqRuE8=;
        b=OsYKnRh1c6CrZwkD1aMhFrPJgKgZ3rMw5iUpxTO7xiJK1RE1PUNB9y3DeF+3Qwo5Rr
         l3TDc857o2UGcad+cfMNf9Vsc3GXVJ7P/ajAKtRWh7hjLq1EoGBOf9VjEN6mva/DiwGG
         y3o67WGqWEk3Q9Nxku+4n8NVk/6DtQG+3n94Rq6rezq+Bfr6htK0UAIQUYVHeMiN/efc
         vXkOLJ1S4cPyWrOb2SHu1QhIh+ojIg92vXVImti5gwiur4DznC2F/99ZsygL7IToakfx
         FpuHUMfjzD9d0TSIS/Uxt2uB0Jx0xxISx+PO0jMxdWrrC4w22cvU8o9eorA0ZPQELhNU
         gZjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777915035; x=1778519835;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=yBTfPe5yUoEGsgDSiMIe7M0rHkLENgYzLNl7AyqRuE8=;
        b=VHv/giTPV3nwyeczWGs04uDBnFwpfNoV0TCNr4bgeW6bjsmSnU0NkZa1FfLiMSeviK
         7N8NGbz6GiIQvfeJfpjbCHWm4e7Da9KN7nlNn9TctSbzvkH86VpiMgBwhsm1120MmAtz
         SSP4OkPdWeggpaXHCJfcHIVv4TAvfDTaOj8MYNsnFiwHzS3fyPiLvLCZsildepmBjq6/
         dfrA/tpHr+uGD3gVEDDoeNkWWnEbvG+f2vlc06Jadf8lWL9rqZMqRLXozyAJoFe1fQzq
         TV67ZwnAFFrpfrHZpHiwi/Q8GimE5+YOOi357ZBU7pyN343Fwxb41d/mV/8wuvfWDKi2
         JdMA==
X-Gm-Message-State: AOJu0YzPTsiNINHfOm7arXjCNCKI1s56S/qejU7Z81/WUaOhZYoR3szl
	6+5y0icixiqILsg309fi8/sJ120TBaSqtNf9WGU9iyeTsWdzKXlx0a9jDch2ytBHuU+IERy7aOL
	PP4ymB99ZXuyTx/0Pv+7FIuCYr83jbZCLVv1pGQEhZHjSohGiToaGAW4e1vay8BiEg/Nq
X-Gm-Gg: AeBDieujp+rnPkuYQFvzs3u/2iZFcroZH2gF4MPqlKh4LVzgXrqT90NlWyOiNOdpmsU
	m9yUlf1sLeoDfWC64DyX5DiYcK5fU2n+Bk8gq7kB04DAyozhEXBa6oHukkzv4nH6zudwaQym1Wy
	L50Abx6M/DjTdO1cPwoPxQWGJVtZ+PmwR4+wuIlzX2hrRBV67HQRM2+kHeTY2D8EZzRgvEALdIY
	wmxnOzgRsxNaf5qhUiVHvqphSnWJaNq+CaipZNW+1mKcyrwt/zqDY0SHR8OMEfkSAe+jfGyZt2n
	W0xcBPNCIRk3H+/RqnZIUBC2FEA9ZDeIOQYERWf5aqqAQk53Z0dHwsR8IFY7PyYnXFEpLgq124R
	gLXMG1VRpeZqF0ygXjKyFeZ+EKsRfIdgwtgLU+5BKBz7DZ/vwVy/Tph558QY=
X-Received: by 2002:a05:6a20:1584:b0:3a2:d838:bfc6 with SMTP id adf61e73a8af0-3a7f1c392d9mr11544527637.29.1777915034607;
        Mon, 04 May 2026 10:17:14 -0700 (PDT)
X-Received: by 2002:a05:6a20:1584:b0:3a2:d838:bfc6 with SMTP id adf61e73a8af0-3a7f1c392d9mr11544478637.29.1777915034013;
        Mon, 04 May 2026 10:17:14 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c7ffbc6f063sm10398240a12.20.2026.05.04.10.17.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 May 2026 10:17:13 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Amol Maheshwari <amahesh@qti.qualcomm.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Thierry Escande <thierry.escande@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: [PATCH v2 2/2] misc: fastrpc: Move prints outside spinlock in fastrpc_cb_probe
Date: Mon,  4 May 2026 22:47:01 +0530
Message-ID: <20260504171701.18164-2-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260504171701.18164-1-mukesh.ojha@oss.qualcomm.com>
References: <20260504171701.18164-1-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=a7AAM0SF c=1 sm=1 tr=0 ts=69f8d49b cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=6S_dsKRq4wc0odEj1ooA:9 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-GUID: TjsYUm5I5T5gQqIOhmJUCpeYX9AbczL7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA0MDE1NyBTYWx0ZWRfX0pQVA19Psp5+
 Tfz60jaSoLUqH2q8xhk2DM5IJVdRSOA4wOMSA7qx9Qy50UHc4ZZeQvAb9N16i79cA4H/2uGLgfR
 kTQohDfUkYj4le9Q9F4TxrcBDY/esEh0COIKqA+h9JWP6/xEbeXD+UByUUY9J1JKMhVES4eh9hL
 TaJcmx+wJW9RKD2QY2MlaKxEwCHmQevAAxC4qaHesz/m6Mhm0qNQ/Uhvw+0kLO8/wXVU84IieZV
 cJ1a1XgXv5KfKh2hMCOh0EwPYvpOpuRAOAcZk/gAbKIloTG7+4zslcYH2nYC58XFIa7tlBPbdnO
 TNCzOgHbNSv58sssmoma3ucN8/l9XgUjqJ6w0KBoV4IsY4m/SkBdWmnk5cZbRtC24Pvs94Cd+jS
 GsjCobUjhUdtBuj7eJiEbP3Z4rsOUh4+xic5m+I72RxauMl4BFLJ3cIk5KzGtHzjGSI6Oksz6RG
 dM67WEMCMUkgVAhRX8Q==
X-Proofpoint-ORIG-GUID: TjsYUm5I5T5gQqIOhmJUCpeYX9AbczL7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-04_05,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 spamscore=0 adultscore=0 clxscore=1015
 suspectscore=0 priorityscore=1501 malwarescore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605040157
X-Rspamd-Queue-Id: 819CD4C1DD4
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_NEQ_ENVFROM(0.00)[mukesh.ojha@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-105785-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCPT_COUNT_SEVEN(0.00)[9];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]

dev_err() and dev_info() were called while holding a spinlock with
IRQs disabled, which is incorrect as printk can be slow and should
not be called in atomic context.

Move the dev_err() for the FASTRPC_MAX_SESSIONS check to after the
spinlock is released, and save the return value of of_property_read_u32()
to print dev_info() after the lock is dropped. Minor variable style
correction in probe function.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
Changes in v2:
 - New change.

 drivers/misc/fastrpc.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
index a1a54453bb7e..d169dea961f0 100644
--- a/drivers/misc/fastrpc.c
+++ b/drivers/misc/fastrpc.c
@@ -2197,19 +2197,22 @@ static int fastrpc_cb_probe(struct platform_device *pdev)
 	struct device *dev = &pdev->dev;
 	int i, sessions = 0;
 	unsigned long flags;
-	int rc;
 	u32 dma_bits;
+	u32 sid = 0;
+	int rc;
 
 	cctx = dev_get_drvdata(dev->parent);
 	if (!cctx)
 		return -EINVAL;
 
 	of_property_read_u32(dev->of_node, "qcom,nsessions", &sessions);
+	if (of_property_read_u32(dev->of_node, "reg", &sid))
+		dev_info(dev, "FastRPC Session ID not specified in DT\n");
 
 	spin_lock_irqsave(&cctx->lock, flags);
 	if (cctx->sesscount >= FASTRPC_MAX_SESSIONS) {
-		dev_err(&pdev->dev, "too many sessions\n");
 		spin_unlock_irqrestore(&cctx->lock, flags);
+		dev_err(&pdev->dev, "too many sessions\n");
 		return -ENOSPC;
 	}
 	dma_bits = cctx->soc_data->dma_addr_bits_default;
@@ -2218,13 +2221,11 @@ static int fastrpc_cb_probe(struct platform_device *pdev)
 	sess->valid = true;
 	sess->dev = dev;
 	dev_set_drvdata(dev, sess);
+	sess->sid = sid;
 
 	if (cctx->domain_id == CDSP_DOMAIN_ID)
 		dma_bits = cctx->soc_data->dma_addr_bits_cdsp;
 
-	if (of_property_read_u32(dev->of_node, "reg", &sess->sid))
-		dev_info(dev, "FastRPC Session ID not specified in DT\n");
-
 	if (sessions > 0) {
 		struct fastrpc_session_ctx *dup_sess;
 
-- 
2.53.0


