Return-Path: <linux-arm-msm+bounces-114202-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Dbq0B8N6OmrT9wcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114202-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jun 2026 14:23:31 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 697B46B70C6
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jun 2026 14:23:30 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b="F6m/yzxY";
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b="ZC/tlGv0";
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114202-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114202-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3948A30CAAC3
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jun 2026 12:21:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2A26226F2BF;
	Tue, 23 Jun 2026 12:21:06 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEED83CF962
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jun 2026 12:21:04 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782217266; cv=none; b=YZfBvsBKl9EB5413OriY/SCMCA+XnTNgKmkkHuvrTFumqsP9msjlsZArvOZ+4MvpU2R+iI/08vBeNT792ziB/A82iGR2jJAoZ+vnxlfQcJ7sMieF5VwJZ64YiUr7a/0soX8rB17DrHTBw7aH9cM++vajO4Pnawqrt1GOVrlB/ss=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782217266; c=relaxed/simple;
	bh=94jfzRBV157ACaB1PXeahfMYSo7DdtPYJEQZlADRXcA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Y6rtyEPgf5BY++sIfV7yqdJ9hmxIHK7znUHeDi3F9ryEUEmkQjTN7S1Y4KumDy7xQ/k96K0GmAvyAdZpKmdRPhUdf51GNS5vwFp9640hnEU0pfeSs7im46XRqHyJLIgMpMaCSKvlnl//7tAKbgrGgMZJbn8PBPQioGaM23CvQ8A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=F6m/yzxY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZC/tlGv0; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65NBXdKe2308562
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jun 2026 12:21:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1v/ynnXiKbGlgjlxO+YjIk/mxVwZxy5oog6I7VHwP2E=; b=F6m/yzxYQAhVEdPX
	K0AGg49/6psv5sZDCQlGnknWglUmWHw4CbQ8TXmzKKKbRvPyMOFsVWF6mrBBY6/d
	R3GonF9jFoa53XKMe660gYN8KfuT/Q50oltNwzBClRuQrZZkJKDl/EDOP1Cz52Jl
	GKD0RCTgkUgLxDwKKCYiT+A1+Y4qv6+IEbd9k+hPfsYOpNf0t9n7JjqJ0lvm+6cR
	M34lnTevTc3K6fjlfobSCtM81Mwz6IOCGe2gxPhy7WhENsCMmu+JnAOTLTCF8TKc
	Wyx1ctLGT38NrTmFPo0RsICNSQ6xrJ1v6IoRMwUe7fbjUmguEP+lax1sYf3btG0Q
	VnxXHw==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eyp1gs2wy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jun 2026 12:21:04 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-8453a81b846so8028421b3a.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jun 2026 05:21:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782217263; x=1782822063; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1v/ynnXiKbGlgjlxO+YjIk/mxVwZxy5oog6I7VHwP2E=;
        b=ZC/tlGv0EFZGrgTiJeS9/cKJkGqaJQVYZl4UFet2fc7ohprnfVhGGhiX92SXJ1gV7z
         OQWbNJSJpvGFCnJTvk1MlsDNZjkzuxkSyN2AmWaOVQvSiBPME6E7ly2qz6Xu9Hxxu+VP
         B6AXC2ArDHg9u0sG/gHxNX9iYWPMHwXWVebBhL4t2isv/AIJLzaL1msoqpT6qPlGz6qf
         4M8jTv6axwuf88wbRwOYDIfYdFdSg0a8jWP+ghWY1wwkSHP+1/xEylxOwmrHUTjJTKwk
         xZn4+MU4wC5LfzDJeLQ0CEy4zNjUeXGhDAl/0BeG77nv56M1ZdZZrDb1CBIMu2YZcTkN
         G47g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782217263; x=1782822063;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=1v/ynnXiKbGlgjlxO+YjIk/mxVwZxy5oog6I7VHwP2E=;
        b=G86SoHU3IdDhchKcqjvJ4wjm/OvZg5cVQjlpEW9jFPGTGnWlUnIxNTG3QIyObTrOe7
         hlzj1OmEQRc3cS4CfCq6m0IuD7pm/O8mGUQiVQc3shuW1TDVPdyvrU/Js4/8PItJ44N1
         LOhIzAqtAAbCRZYk45UQWb3LkyEp5+MVFlSjEQqjj4zvkqWw704O0h94M7nvAMonZs6T
         YIuXKqtB51aOSRnr5B8QZGlnnqpamXCklCBX2vCxZiov+Lti9U/055QnTrF6GYkmzupq
         vZXFc07hK16TqJRzKU9gFG8vs8Ay6fyX0WIiY5SBtYRcH1q2cIB7Z8ZuDv6e71xa8npm
         j9+w==
X-Forwarded-Encrypted: i=1; AFNElJ+SKT7GW8Ed45WqPUypc0PaMy83McWgbccPgRGt3rDEuo2hEknObe7CUbgwATJlOokMpi/yJVV7+E1hGr0F@vger.kernel.org
X-Gm-Message-State: AOJu0YzsSsUJ9AfI1ec+O6YCWyoy74POWScU4IkKIuDS/F/VCTDLOLbX
	aqT4ngovdgq11PvfDIvUds+SxtzJein0Q6+IlFcRGd9JTsCmf4rjQB6/9ujeph4srJggV7JZdQl
	hU4GPLevXYKslB2Pl2VJnzYQxaQiocdaeeIifhSOq0drNVrVrdpOt+LBWOYdyW9kcaW6J
X-Gm-Gg: AfdE7cnBtxiOgSwrgyqQUJ3cpIkskEk74O464K2sTNXm36YM6NuFYPdmGuF7w9tcANC
	e9AWrCq/Wticu22BV3dNEHsQRvEXPNOZ26fr5KMYMJUQ9a4Vm57q7S4XL1Qut3ZIIQXy08FnkKm
	TlVodSHRws7BPTaYJaRCA4STxaFuyzk+vx40Zep9QdbbMt2SlDVeJlOqbpOm/iKG5MSzRhWGndd
	Xv0xW/mL/Y+2PkARZCq4CztfCxfX+mSdvLDxD6tPgx1cIJSqSf3qfnyviIieoeLnrgXNfEk51hY
	s1uI/wD6xLaLEas9Y9eVhQmIipQT/jVt3ZDGXEAOPjf3UTWSl95xT4VVZ/7Qy9rkTQKjKmYnOwj
	2E9yZUf5bjlU2JS+zRE7zZABmGElwrMHxlq9Wcg==
X-Received: by 2002:a05:6a00:c8b:b0:842:5da3:9b8c with SMTP id d2e1a72fcca58-845970e08d1mr2741603b3a.36.1782217263419;
        Tue, 23 Jun 2026 05:21:03 -0700 (PDT)
X-Received: by 2002:a05:6a00:c8b:b0:842:5da3:9b8c with SMTP id d2e1a72fcca58-845970e08d1mr2741555b3a.36.1782217262806;
        Tue, 23 Jun 2026 05:21:02 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84564e74646sm10171856b3a.29.2026.06.23.05.20.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jun 2026 05:21:02 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>, Will Deacon <will@kernel.org>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>
Cc: Robin Murphy <robin.murphy@arm.com>, iommu@lists.linux.dev,
        linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: [PATCH 1/8] iommu/qcom: Fix inverted fault report check in qcom_iommu_fault()
Date: Tue, 23 Jun 2026 17:50:27 +0530
Message-ID: <20260623122034.1166295-2-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260623122034.1166295-1-mukesh.ojha@oss.qualcomm.com>
References: <20260623122034.1166295-1-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: DKj62LUSp7ctzInj4FboxmxzsSd0zpTD
X-Proofpoint-GUID: DKj62LUSp7ctzInj4FboxmxzsSd0zpTD
X-Authority-Analysis: v=2.4 cv=QJhYgALL c=1 sm=1 tr=0 ts=6a3a7a30 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=xmDQi4VeJV1Yj6r8B4kA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIzMDEwMSBTYWx0ZWRfX4oFLhzY84WPp
 jJqWuEFJKx1GrtH0JYDYNMIz0XVL8FLV+NMMJowPrvCbsaEJxLbao92/9t4oDB4oimSA/mWcu8x
 t9/p8pnz8DwzImEjMMjU+zVL07bVdQE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIzMDEwMSBTYWx0ZWRfXzbJ2vr6Y5mJT
 YqIGH5f4DENSoB/xqkrvLH45k7XPaODFQF3YLYXJ3oCmKrL0yNJtnr7jJVUqMCW5FJgk3IiOh5F
 snlJxWhPdDEhwiB0Gqi4/Bz1y0MM/m1LGNkPDGRB2/0tSADGRSrf0It7EeaefFlZSyhDNOMJ3IN
 nIHCH657Lbx4v6U1vjYb5eEy/3V1p46By2CRsvfyFeCE16iuKNGvWZ8s8HDdQnHJKo908hl8ltN
 SYUHt/DpJYiO72iwDiP0GImzFWuJehp3Vy/4sukUpvJK1wm9RPekfFeYYXWrDjEXV+MR1j0D3sB
 kiftvkkqdYlkMOlBZbTOXJICIMoFy9RoqV3dC8dVZ22SmTdYvxRsPcOFsBGoMpjogYZgYxRpecv
 40CPez/12wW9mccwbWUOYDuXeFViEjzPP2eCXG8FQMw7+aLBKbAPWBftfg5vNOe5VPYbIOUtx81
 QMLWN8wWegPZgvPE8IA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-23_03,2026-06-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 bulkscore=0 adultscore=0 suspectscore=0
 lowpriorityscore=0 phishscore=0 malwarescore=0 priorityscore=1501
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606230101
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-114202-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER(0.00)[mukesh.ojha@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:robin.clark@oss.qualcomm.com,m:will@kernel.org,m:joro@8bytes.org,m:robin.murphy@arm.com,m:iommu@lists.linux.dev,m:linux-arm-msm@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:mukesh.ojha@oss.qualcomm.com,s:lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mukesh.ojha@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 697B46B70C6

report_iommu_fault() returns 0 when a fault handler successfully handles
the fault, and -ENOSYS when no handler is installed. The condition
'!report_iommu_fault()' evaluates to true (printing "Unhandled context
fault") precisely when the fault *was* handled, and stays silent when no
handler is present — the opposite of what is intended.

Remove the '!' so the driver logs unhandled faults correctly.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 drivers/iommu/arm/arm-smmu/qcom_iommu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/iommu/arm/arm-smmu/qcom_iommu.c b/drivers/iommu/arm/arm-smmu/qcom_iommu.c
index 32efef69e72d..09f2ee6be988 100644
--- a/drivers/iommu/arm/arm-smmu/qcom_iommu.c
+++ b/drivers/iommu/arm/arm-smmu/qcom_iommu.c
@@ -200,7 +200,7 @@ static irqreturn_t qcom_iommu_fault(int irq, void *dev)
 	fsynr = iommu_readl(ctx, ARM_SMMU_CB_FSYNR0);
 	iova = iommu_readq(ctx, ARM_SMMU_CB_FAR);
 
-	if (!report_iommu_fault(ctx->domain, ctx->dev, iova, 0)) {
+	if (report_iommu_fault(ctx->domain, ctx->dev, iova, 0)) {
 		dev_err_ratelimited(ctx->dev,
 				    "Unhandled context fault: fsr=0x%x, "
 				    "iova=0x%016llx, fsynr=0x%x, cb=%d\n",
-- 
2.53.0


