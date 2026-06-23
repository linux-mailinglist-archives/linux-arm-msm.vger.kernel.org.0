Return-Path: <linux-arm-msm+bounces-114208-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id /p1KDKd6OmrB9wcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114208-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jun 2026 14:23:03 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FD9C6B70B7
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jun 2026 14:23:02 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=IzVVX+bl;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=dbsnsi6A;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114208-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114208-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 2A93430B9C18
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jun 2026 12:21:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 232813D5C0C;
	Tue, 23 Jun 2026 12:21:27 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4B503D647F
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jun 2026 12:21:24 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782217287; cv=none; b=E7BrbN2pj+NPhFSfD8EDAiRTfvh7u/CqnRRovbsMgSOxVdzw8sjlgdcjF12kGeT2TiTAZ2TjSGQwmFKUyD3CzIn5jFg0Tsaf+fc/h5Z8P2PYUhhUNLIw99WdE/EDHcvVfTKhOsuErQQwVXJBCBqXQoFoSEXHBqrxBV0gFMyxyo4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782217287; c=relaxed/simple;
	bh=1btS+uahA/dpI1zSLWZlGibsdw6yI9eSlm1CTAaRCUA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=C8M8amR27sCAX/W+q6LNSLUFQRJBsjYhPnz3Ktsd6r3frEuZmeB04rljqs5evzm3ZE9WYeBv7+vWGZHA4vmH7D3DQnrNgXoPi3NYgfRKuXTl1XGPeM0XgbLmRk0EII+wHlv+CTAz75KhKwObLuwMXyRm7lClSm4T58Gw/qx3fBI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IzVVX+bl; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dbsnsi6A; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65NBY2kF3669396
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jun 2026 12:21:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=PSlGePwHyRY
	cFLv8EJamVpEvdvRpZ3GdhYpvSgrdXIA=; b=IzVVX+blTX52AsCG1uVLGDaDf9Q
	T/Josst+RPqMNJBDKYZZn5siB7ZIH08gOPHHVPWVkpns1uSvYpOMJhaL8XQdj6ZK
	oNHNTkMBTqBbnaLTFYzEmmZjP6sZ7QTgexX3xzsXXTV5WIvgog2F9hQEUJBmLZXG
	NS4XwHvCXN3r8Ahjk0Nccj2m7lONUEbBNmrDD42hrFS5XNccFP5eixjqcfpo0iJ+
	gA2doEIfp/V582jq0LkSb2tELSjlskyLLJavLdyJOGSfAOlAmUoYd3wpxvg7EqNC
	XK795HEdYWH6bCrEwGJs9AK2Cjrwc2TK84zxAAbkTgPa4CMZ6DcKu/CrpPQ==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eyppygwxp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jun 2026 12:21:24 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-845317fa7e6so7898458b3a.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jun 2026 05:21:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782217283; x=1782822083; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PSlGePwHyRYcFLv8EJamVpEvdvRpZ3GdhYpvSgrdXIA=;
        b=dbsnsi6AM/nrDmD0BACV7+mX9NGReXSdRX4+vHc9dENFRlxUfvhX0Rv4y1hh3njFXA
         EsEb2Zp40d/mSaE7X0yuGhBQ9WYerFle0Hh8UQyet9bFZY6VMLe1DseEYDsZqKHMM6hE
         KFhCnlKQcjRlqpTn+hz5yB4wUfS6nu3//qg4sekWmqzQ+6y0U/k9IKwELVKAGf0qTMGc
         WrNhyqqJF6yWo88U4nnfxz5f2Im1NOl+iH7+J+LnmXqe346FI4w5nR2Z/hC7Re2pVQUb
         RQYL0L30MGt5cJNYx8Jvuuws9GK2Sk0EcynX+6MuyJL/PIzIf4lelRIkiOCrUQ8sO/CE
         zZtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782217283; x=1782822083;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=PSlGePwHyRYcFLv8EJamVpEvdvRpZ3GdhYpvSgrdXIA=;
        b=MCm3upbb9fxWqeBoQ0CT8WWSWPEBmqbxz+nfbMGzPicOUrQb6LuFcagkj4DdeKX4xh
         cFf02sWREQqNowieL4Q1Vt4pilG+v8D0i6NA/EIUIUG+18Md3E5Az0cwSx4wk2qGTAxw
         q2DtZW7dS8SnG1YornQnD+nWZ1tum2uthBINXPTYHltoFC9bfOfZEN0GS2vuUjo5Wamo
         hznVvZAHXjmmDwZM70oBoL/eFeT1XYvwPJWGQQ/UKn8NOqqAxZvkQfKu6B5OPGka5yTc
         B6v3bz7GVAWd9vKZX+LmzOEo9UlFQ/pnnUrv9NpzGIJUaUMLrlIy0SVxo+cJ0Vg8O0lW
         crog==
X-Forwarded-Encrypted: i=1; AFNElJ/2w4nsgdOejRJMNMrlbKyumqJPxVAtQWBxAVPdWPJFYa18NWfWupqKFGtJX+mVQ5ZhrQRDONvjgUVD0TtC@vger.kernel.org
X-Gm-Message-State: AOJu0YxV73X6TzOPWs8Wz75FSDsXb40+QDbLuHroYloFRR1aAm6/6ydR
	sYeLBUPOeCtMaNiYeRyd6g71u7UWZOClQCjlzq12Kur8V7naukNTGCEfIHjG9LdzBLPxvoRbYNk
	s+q67vniqMmgQndPymtXKoAD+TcnWaUGe9Wt2PxL59otz1rrfwxMwBIdWpNB5UFdP6T4C
X-Gm-Gg: AfdE7ckM440n0QJNhXtUrYxL4kDj7fOZwaUNeGtkHnSMZ8egekQJyCbkosVSMF2Wc3P
	jP1VztaFZhkcMm7jUfT7p9CMK27s7zHlamKUa2mqL+TvehisxAUyzRVl90SSyf/uA0syRjRHzj/
	2D2hXp8d4a3MOQJtuGCZre3JD6IXc6G6KymZZbz6pn4N+5MfcnJtlIEQwqNt/F2WIzvWxJVmOl7
	Cu+aAY/DIX/C2hYrR3UG1pW1jC63K72VlGbd+iGzthwtaS83zqN8OtWXoYXN87zoP0L88uNo/sJ
	a/GOBh5Hul9ntLDZfuU//T+B7TGTgFPlTUaVMHwkdZ1XvgHKpkoW12zGlP/ElbRq4MSAXx6df5V
	aUFN2PejnG5mE1Y21Jm5/GIt7ixi+cTRaN8BtoA==
X-Received: by 2002:a05:6a00:951c:b0:827:2a07:231d with SMTP id d2e1a72fcca58-845970338ccmr2760025b3a.17.1782217283405;
        Tue, 23 Jun 2026 05:21:23 -0700 (PDT)
X-Received: by 2002:a05:6a00:951c:b0:827:2a07:231d with SMTP id d2e1a72fcca58-845970338ccmr2759991b3a.17.1782217282893;
        Tue, 23 Jun 2026 05:21:22 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84564e74646sm10171856b3a.29.2026.06.23.05.21.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jun 2026 05:21:22 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>, Will Deacon <will@kernel.org>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>
Cc: Robin Murphy <robin.murphy@arm.com>, iommu@lists.linux.dev,
        linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: [PATCH 7/8] iommu/qcom: Enable clocks before hardware access in qcom_iommu_ctx_probe()
Date: Tue, 23 Jun 2026 17:50:33 +0530
Message-ID: <20260623122034.1166295-8-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260623122034.1166295-1-mukesh.ojha@oss.qualcomm.com>
References: <20260623122034.1166295-1-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIzMDEwMSBTYWx0ZWRfX+6m2qAF7I0e9
 7d+UZkT4DN6J6ZMzHFxvvV3/0tn9amCDlb+8CsuZdvQMROC5dvpd6PmynOYZv/P/6l35+fYTuh3
 XfiesHpn3o7BioBxnuBkU+w7j3uYQGy4ENTRKelayXWbrJ+XwYC1jq9w22+JquNCjkC7glsrsrk
 sbO96O8TEwysMGHQligSWq06+60v/ZOqPwwgS4+9HSgajEIO0c5QoZ4LXWYY9/1x24JEQ71TMx7
 k468yMKHeYL7BBrxPc3IK7uIDtY/z9ZYJnd4kUGCgnh2UlfLN2bm1ZUeOizbEC/XUepxkNgiuLT
 AxgzcrJfOehH1d2f8HmRNzo+kDMyPYW0vMmkrgKeJeFDpMpiIlx3ePbF+Wat7MW46XdZjnECQiF
 5pSvbUklC6WdJFSEFlLZ0tOGsNpTWUQ+9uqe3zEB3RQhH8soRYwbVjz+BIYyxCOPioefBh68Dak
 dbYyzUJF04tKR2t5keg==
X-Proofpoint-GUID: CzTo2bHIFupTH-MTloVsRJEsen-p-FlR
X-Authority-Analysis: v=2.4 cv=dvfrzVg4 c=1 sm=1 tr=0 ts=6a3a7a44 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=8cASqgOsboiLGU4YZykA:9 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIzMDEwMSBTYWx0ZWRfX4t10Vg2YIHkX
 Xgmd/YD3Ud8Z3cGZP/VlLRr5d6pkoYm0kqyyh/vJeFAeMPmm/vqrMQjv18ANUsqyGl1GxU8XHLO
 mv6TCVgAel4/yqQ0RAzXpBZ/7ILE7fE=
X-Proofpoint-ORIG-GUID: CzTo2bHIFupTH-MTloVsRJEsen-p-FlR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-23_03,2026-06-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 spamscore=0 adultscore=0 clxscore=1015
 suspectscore=0 malwarescore=0 priorityscore=1501 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606230101
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-114208-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:robin.clark@oss.qualcomm.com,m:will@kernel.org,m:joro@8bytes.org,m:robin.murphy@arm.com,m:iommu@lists.linux.dev,m:linux-arm-msm@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:mukesh.ojha@oss.qualcomm.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[mukesh.ojha@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_NEQ_ENVFROM(0.00)[mukesh.ojha@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	ALIAS_RESOLVED(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,qualcomm.com:dkim,qualcomm.com:email,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 8FD9C6B70B7

qcom_iommu_ctx_probe() reads and writes the CB_FSR register to clear any
stale IRQ left by the bootloader. This happens during
devm_of_platform_populate() which is called from the parent device's
probe before any pm_runtime_get(). The parent's clocks (iface, bus, tbu)
are therefore not guaranteed to be on, making the register access
unreliable on rebind or after a suspend cycle.

Use pm_runtime_resume_and_get() on the parent device to ensure clocks
are enabled before the register access, and release the reference
immediately after.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 drivers/iommu/arm/arm-smmu/qcom_iommu.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/iommu/arm/arm-smmu/qcom_iommu.c b/drivers/iommu/arm/arm-smmu/qcom_iommu.c
index 51b60b296bb8..0df8c2af8eed 100644
--- a/drivers/iommu/arm/arm-smmu/qcom_iommu.c
+++ b/drivers/iommu/arm/arm-smmu/qcom_iommu.c
@@ -714,8 +714,13 @@ static int qcom_iommu_ctx_probe(struct platform_device *pdev)
 	/* clear IRQs before registering fault handler, just in case the
 	 * boot-loader left us a surprise:
 	 */
-	if (!ctx->secured_ctx)
+	if (!ctx->secured_ctx) {
+		ret = pm_runtime_resume_and_get(dev->parent);
+		if (ret)
+			return ret;
 		iommu_writel(ctx, ARM_SMMU_CB_FSR, iommu_readl(ctx, ARM_SMMU_CB_FSR));
+		pm_runtime_put_sync(dev->parent);
+	}
 
 	ret = devm_request_irq(dev, irq,
 			       qcom_iommu_fault,
-- 
2.53.0


