Return-Path: <linux-arm-msm+bounces-115651-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 82LqDw7uRGqi3QoAu9opvQ
	(envelope-from <linux-arm-msm+bounces-115651-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Jul 2026 12:38:06 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C70CD6EC3C0
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Jul 2026 12:38:05 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=hPeLipzv;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=hRmxRFAj;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-115651-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-115651-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 1E6FD3014275
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 Jul 2026 10:38:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2170B423170;
	Wed,  1 Jul 2026 10:38:01 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8414840960C
	for <linux-arm-msm@vger.kernel.org>; Wed,  1 Jul 2026 10:37:59 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782902281; cv=none; b=DhnLzA/3qn3zvazUOVAOWHhgIrkvrrwdheh9Pr91kscTcKzZHuUhlD78cfpKxCB3cI+/UTIRwgpxQAqUMw1MiVYfRye751e8Ph1xDtcfMlIfDlqU+Q7nQeWctxDlqNO13ofkN0s2qifn2wzh02bIN2BMJgUO0/SwtYZuLjIOWHE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782902281; c=relaxed/simple;
	bh=wxmxFNTxmH1BxvnW9OL8EFs3pxurc8AKng1CYfcu7cA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ERIWIhTLaPOVQLwXixgNvufeHxXg59MF0hzdx4QxgE7beFyjnJozCxtPxms82hA1SXpnRdIS62+XcX2HSvn7dnyWR4JPZJbrmNccyYds1obQEmK8gGHq0jGNLGfMHD+BBUVSifA80HvyZocy4+/C+BrW/HoEtEfasD1d7aTHnsE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hPeLipzv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hRmxRFAj; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 661A8Wbo673176
	for <linux-arm-msm@vger.kernel.org>; Wed, 1 Jul 2026 10:37:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9CGLii7+KdkxqW5GSTDgBYsnFCYt35AgEJQIXwVb6iw=; b=hPeLipzvwIxeQ6Iw
	I/v/aqXy1ukYmM6DwRcvC0nWDXL+G36WeNNdwXnRCEmJrDJa19wNZtVRsm2AYOsS
	9HsX6lO9ycs1nJpbAc5HiE/sFWQcc00UNWeh8bpHzJWAXJDstv+1ZeGj//PNss12
	jp90/9V/vi3axFOCRKe8NlxV4mqeYT/QV4xuh2PjP6t1CbSUGISNhSGGlJz2/bVl
	+2RbAZPYU0IxzJ5wBerzXfll1LX//KhnjbWoIl+clc1pGTgnKlXT00AJ4N7khEfk
	H84FzcC5h7s69iNzadyQqM7VblPhzFt/Qb/NHPiEyB7W84Ef3OnldCB+r2XO4S9f
	8zJf8Q==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f502urbn2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 01 Jul 2026 10:37:58 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-37fca5f21b1so1215596a91.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 01 Jul 2026 03:37:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782902277; x=1783507077; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9CGLii7+KdkxqW5GSTDgBYsnFCYt35AgEJQIXwVb6iw=;
        b=hRmxRFAjI8Qg2PtOtfqHs0ZcwLGxnprjLFh9sReGxGNSdE0ygOzmOPHz0R36C5/39f
         A/dlPxmljS8+NkjBBJpZbLhA3Ux87BiluEmdwCEBydfd/sObv5hvBGEN1HDZNS6J8KDa
         +1SWrOFTi1uXhFl+CzoSNYnkpgis22J5nFaBGVgwsc4tAG95kBWfo1ouFoVethY2bpL3
         sAIVynGJcxCb4JlFMFBXkIasI2srgyyAvcBkgrycLjUpJyq8L85ut05AH+RzR/QoO8jN
         LI7wQr93p/zhpbyTpL3HGf50tsIUXBj5MD+Rb0kHdzKb6epNlV1EJD85mZJMVVeJ0DtH
         XrTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782902277; x=1783507077;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=9CGLii7+KdkxqW5GSTDgBYsnFCYt35AgEJQIXwVb6iw=;
        b=Aju9ghQaYyb13PAMSlrXXerCTv29I7AoUu2L0QDQgPfvAAUfjxvIzE/PgnAuS5suCq
         8Ap0rfG1w9Qv0xQGMKwXKkzlnqkjCPG3pUgQMTOy/BQG+M7R0hbNgXZDAmHMwaJ+BixE
         B0xljd3tP8b0aUBwhirRBGh5CPtKpPQ1oMhkeR2qfoSA2CcTtBc7VGenhwEQGBgQAvmA
         iHnvuVyk7ckU40NX2K/duDQyzB2Rj8+NnKMRHOVC33XU8Z6bSTghuno2D5h1UjRMm8UX
         7Qye3xU98LlIn1GuzrtL2lSMxdl2orgDQtWtFb9wKeXiNJm7PgMBeOnRkFlpBxbApGO/
         wnLA==
X-Forwarded-Encrypted: i=1; AHgh+RouCsNTXVktGYLs46ti6qko0TYUJ96vFAk1kv2qBPmFbtsFJuO5ua4jIqME5EKLVh7lysoeZGU6C3IV0Tfo@vger.kernel.org
X-Gm-Message-State: AOJu0YxkmvRw9h2kaAkihZPY4hPyneoFx2HAMsNgXGBKnU+SX2N5Sy5X
	YVVhuEDoIOeayWuXejkjmjCUreWosfV4cZZCZ7GW8bIZAneayQLdIOKsmzQbd3qq/fGAZaBIj98
	Jlr7QKOq+dF0mH11BVXKZ9aX+Jcx1PjzuQ9rOSesgQQyjVwknNnVfWzmMdZUX0XAvATjm
X-Gm-Gg: AfdE7cl21IHKTSQsQ5p4TpbyOBP9ewmFY0vzi5ztjE503+cTMZw/rFLRP003XMo3687
	YFdjt3jHTaQtlzbH2WBpfjsyh+wJScgTGzlOszRdkyW3EQqdt6p/DL6xNqF3THiY52QcbRW8QzI
	LjkVhwsji75TiiSsf4qsPnwoELvewYLWYcHLvOZb9GiemmABaarKBeKcML58N3WK66vSMaAr3VE
	4f+/ZHbRS3S7tPge5/5NvAJ5z2o3oO9zdPqWREjmtR9m+iqviqnDmWaVKYd7E1kGe2mcImv0TV5
	guqpP5rjtGAb8tIhnOFmr4uV+qQaYgp8+NCyil0hxwDlpVoZrpitxUKuyOMBlwqwbzXyga/iKwi
	QUB3EtU1Aw7AIP7tpfH5g9sH6LWFfF6lCr/Le9uKh
X-Received: by 2002:a17:90b:3e8b:b0:36a:caf2:3815 with SMTP id 98e67ed59e1d1-38069c56f8dmr4794482a91.15.1782902277375;
        Wed, 01 Jul 2026 03:37:57 -0700 (PDT)
X-Received: by 2002:a17:90b:3e8b:b0:36a:caf2:3815 with SMTP id 98e67ed59e1d1-38069c56f8dmr4794461a91.15.1782902276872;
        Wed, 01 Jul 2026 03:37:56 -0700 (PDT)
Received: from hu-batta-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38095bc8a2asm765251a91.0.2026.07.01.03.37.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jul 2026 03:37:56 -0700 (PDT)
From: Kishore Batta <kishore.batta@oss.qualcomm.com>
Date: Wed, 01 Jul 2026 16:07:36 +0530
Subject: [PATCH v6 2/7] bus: mhi: Move Sahara protocol driver under MHI
 host client drivers
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260701-sahara_protocol_new_v2-v6-2-3a78362c4741@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782902263; l=8314;
 i=kishore.batta@oss.qualcomm.com; s=20260206; h=from:subject:message-id;
 bh=wxmxFNTxmH1BxvnW9OL8EFs3pxurc8AKng1CYfcu7cA=;
 b=32s35dE7TBGTdrUbkA5pWw9MVuhVZXZRIBb0AuTgB/dRjIjFnBAHX+KGwqCippedoqNKayW/w
 aJ9QaySeN5lBfhwZqJcp629lFPZM/xhN0waoYPP3rmxgoQvgrTZBNCg
X-Developer-Key: i=kishore.batta@oss.qualcomm.com; a=ed25519;
 pk=vJo8RvTf+HZpRLK2oOIljmbn9l3zFkibCGh+blaqZCw=
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAxMDExMSBTYWx0ZWRfX6DsnN5FPiXwl
 K3pkcvbdvE6qPcKv6JVOi1Y2c1b46LkBhhhXHetIrO9Ne35OEkg1x724tYMGJINEauD8KAAQhhJ
 1Tdhn1g+DOSFhTMVSh+Ebwt+OyTU98U=
X-Proofpoint-GUID: JOaY5EurIaPXB_KFHGeIapBVXvbTYFCt
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAxMDExMSBTYWx0ZWRfX9Ocm4XHHNKOq
 wnwyiom3+5HeRJNN2tAuynen//AixwxsZQgyekIGWBhdteEWJlHReH3SgPjCWN4lHb6n3UfnbzN
 gYPsGtE9/yhUoK7+Mw+GnqRx2IXCdTSl1QVvMH3eWMzuLd6TGPl0FtxNpJKyo3lFs+h/auKXRe5
 Yxhc4ZIKDNKQ60agrF0h2gUqjb/XOTA0s+1jbBNUK7cq9dLcmFM7rD6thCLFAVawssHG+yc3gbe
 82myVs19iuejtE5CB/kwPKRKdiNkkCKKUSeJferiFTTOMAucUGS6mH/2P2XyZKPiwWpBqssMQkL
 cmdRiOtai9oO+O52Iy80o5PFRmN4awPtMIQP7tfn/aGqj9TDYm+zJbzFknglmZFJb/Nwa/4py7x
 J8P04f+1MN7VMOP7iDmOL3rYXASnSf9GoOm6x039VD9JDCGCmUY8ceZ6tZes6CMVYBvCEcUTgKK
 1dxqV3IMzXQX9YPdXOA==
X-Proofpoint-ORIG-GUID: JOaY5EurIaPXB_KFHGeIapBVXvbTYFCt
X-Authority-Analysis: v=2.4 cv=PbLPQChd c=1 sm=1 tr=0 ts=6a44ee06 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=h4jUYMdnt1ASHzOZM6YA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-01_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1011 impostorscore=0 spamscore=0 lowpriorityscore=0
 suspectscore=0 phishscore=0 malwarescore=0 adultscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607010111
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-115651-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:corbet@lwn.net,m:skhan@linuxfoundation.org,m:jeff.hugo@oss.qualcomm.com,m:carl.vanderlip@oss.qualcomm.com,m:ogabbay@kernel.org,m:mani@kernel.org,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:mhi@lists.linux.dev,m:kishore.batta@oss.qualcomm.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[kishore.batta@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,vger.kernel.org:from_smtp];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kishore.batta@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: C70CD6EC3C0

The Sahara protocol driver currently lives under the QAIC accelerator
subsystem even though the protocol is transported over MHI and is used by
multiple Qualcomm flashless devices. This makes Sahara appear QAIC specific
and complicates reuse by other MHI based devices.

Move the Sahara protocol driver under drivers/bus/mhi as a host client
driver and build it as an independent MHI protocol driver. This keeps the
QAIC driver focused on the accelerator device while allowing other MHI
users to enable Sahara without depending on QAIC.

As part of the move, add a dedicated Kconfig/Makefile hierarchy under the
MHI host client drivers and convert the driver to use module_mhi_driver()
instead of register/unregister hooks.

Signed-off-by: Kishore Batta <kishore.batta@oss.qualcomm.com>
---
 drivers/accel/qaic/Kconfig                           |  1 +
 drivers/accel/qaic/Makefile                          |  3 +--
 drivers/accel/qaic/qaic_drv.c                        |  9 ---------
 drivers/accel/qaic/sahara.h                          | 10 ----------
 drivers/bus/mhi/Kconfig                              |  1 +
 drivers/bus/mhi/host/Makefile                        |  1 +
 drivers/bus/mhi/host/clients/Kconfig                 |  5 +++++
 drivers/bus/mhi/host/clients/Makefile                |  1 +
 drivers/bus/mhi/host/clients/sahara/Kconfig          | 15 +++++++++++++++
 drivers/bus/mhi/host/clients/sahara/Makefile         |  2 ++
 .../qaic => bus/mhi/host/clients/sahara}/sahara.c    | 20 +++++++-------------
 11 files changed, 34 insertions(+), 34 deletions(-)

diff --git a/drivers/accel/qaic/Kconfig b/drivers/accel/qaic/Kconfig
index 116e42d152ca885b8c59e33c7a87519a0abc6bb3..af90fdfcf77eeb6dd5ad309b33d793d4fdc91b1e 100644
--- a/drivers/accel/qaic/Kconfig
+++ b/drivers/accel/qaic/Kconfig
@@ -8,6 +8,7 @@ config DRM_ACCEL_QAIC
 	depends on DRM_ACCEL
 	depends on PCI && HAS_IOMEM
 	depends on MHI_BUS
+	depends on MHI_SAHARA
 	select CRC32
 	select WANT_DEV_COREDUMP
 	help
diff --git a/drivers/accel/qaic/Makefile b/drivers/accel/qaic/Makefile
index 71f727b74da3bb4478324689f02a7cea24a05c2d..e7b8458800072aa627f7f36c3257883aa56f4ce4 100644
--- a/drivers/accel/qaic/Makefile
+++ b/drivers/accel/qaic/Makefile
@@ -13,7 +13,6 @@ qaic-y := \
 	qaic_ras.o \
 	qaic_ssr.o \
 	qaic_sysfs.o \
-	qaic_timesync.o \
-	sahara.o
+	qaic_timesync.o
 
 qaic-$(CONFIG_DEBUG_FS) += qaic_debugfs.o
diff --git a/drivers/accel/qaic/qaic_drv.c b/drivers/accel/qaic/qaic_drv.c
index 63fb8c7b4abcbe4f1b76c32106f4e8b9ea5e2c8e..3907b13e426064f4fa069e803cc44462feea4063 100644
--- a/drivers/accel/qaic/qaic_drv.c
+++ b/drivers/accel/qaic/qaic_drv.c
@@ -32,7 +32,6 @@
 #include "qaic_ras.h"
 #include "qaic_ssr.h"
 #include "qaic_timesync.h"
-#include "sahara.h"
 
 MODULE_IMPORT_NS("DMA_BUF");
 
@@ -791,12 +790,6 @@ static int __init qaic_init(void)
 		goto free_pci;
 	}
 
-	ret = sahara_register();
-	if (ret) {
-		pr_debug("qaic: sahara_register failed %d\n", ret);
-		goto free_mhi;
-	}
-
 	ret = qaic_timesync_init();
 	if (ret)
 		pr_debug("qaic: qaic_timesync_init failed %d\n", ret);
@@ -818,7 +811,6 @@ static int __init qaic_init(void)
 
 free_bootlog:
 	qaic_bootlog_unregister();
-free_mhi:
 	mhi_driver_unregister(&qaic_mhi_driver);
 free_pci:
 	pci_unregister_driver(&qaic_pci_driver);
@@ -847,7 +839,6 @@ static void __exit qaic_exit(void)
 	qaic_ras_unregister();
 	qaic_bootlog_unregister();
 	qaic_timesync_deinit();
-	sahara_unregister();
 	mhi_driver_unregister(&qaic_mhi_driver);
 	pci_unregister_driver(&qaic_pci_driver);
 }
diff --git a/drivers/accel/qaic/sahara.h b/drivers/accel/qaic/sahara.h
deleted file mode 100644
index 640208acc0d13d423bd9220e6861b7c141af74ff..0000000000000000000000000000000000000000
--- a/drivers/accel/qaic/sahara.h
+++ /dev/null
@@ -1,10 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0-only */
-
-/* Copyright (c) 2024 Qualcomm Innovation Center, Inc. All rights reserved. */
-
-#ifndef __SAHARA_H__
-#define __SAHARA_H__
-
-int sahara_register(void);
-void sahara_unregister(void);
-#endif /* __SAHARA_H__ */
diff --git a/drivers/bus/mhi/Kconfig b/drivers/bus/mhi/Kconfig
index b39a11e6c624ba00349cca22d74bd876020590ab..720115218c2401c99b29f79bbd4113cd877503ac 100644
--- a/drivers/bus/mhi/Kconfig
+++ b/drivers/bus/mhi/Kconfig
@@ -7,3 +7,4 @@
 
 source "drivers/bus/mhi/host/Kconfig"
 source "drivers/bus/mhi/ep/Kconfig"
+source "drivers/bus/mhi/host/clients/Kconfig"
diff --git a/drivers/bus/mhi/host/Makefile b/drivers/bus/mhi/host/Makefile
index 859c2f38451c669b3d3014c374b2b957c99a1cfe..2e8949f1a2fe6f3f3b2e1dc541f97d2c393d6a0f 100644
--- a/drivers/bus/mhi/host/Makefile
+++ b/drivers/bus/mhi/host/Makefile
@@ -4,3 +4,4 @@ mhi-$(CONFIG_MHI_BUS_DEBUG) += debugfs.o
 
 obj-$(CONFIG_MHI_BUS_PCI_GENERIC) += mhi_pci_generic.o
 mhi_pci_generic-y += pci_generic.o
+obj-$(CONFIG_MHI_BUS) += clients/
diff --git a/drivers/bus/mhi/host/clients/Kconfig b/drivers/bus/mhi/host/clients/Kconfig
new file mode 100644
index 0000000000000000000000000000000000000000..a4f2a3c1d20c887cc474646ea91532d775a13f57
--- /dev/null
+++ b/drivers/bus/mhi/host/clients/Kconfig
@@ -0,0 +1,5 @@
+menu "MHI host client drivers"
+
+source "drivers/bus/mhi/host/clients/sahara/Kconfig"
+
+endmenu
diff --git a/drivers/bus/mhi/host/clients/Makefile b/drivers/bus/mhi/host/clients/Makefile
new file mode 100644
index 0000000000000000000000000000000000000000..62e2fa161565225be7f6a23d3cdf4f2f169cb7ce
--- /dev/null
+++ b/drivers/bus/mhi/host/clients/Makefile
@@ -0,0 +1 @@
+obj-$(CONFIG_MHI_SAHARA) += sahara/
diff --git a/drivers/bus/mhi/host/clients/sahara/Kconfig b/drivers/bus/mhi/host/clients/sahara/Kconfig
new file mode 100644
index 0000000000000000000000000000000000000000..f1fc7013a2dee0be645c50f32305659e591de7e7
--- /dev/null
+++ b/drivers/bus/mhi/host/clients/sahara/Kconfig
@@ -0,0 +1,15 @@
+config MHI_SAHARA
+	tristate "Sahara protocol driver"
+	depends on MHI_BUS
+	help
+	  Enable support for the Sahara protocol transported over the MHI bus.
+
+	  The Sahara protocol is used to transfer firmware images, retrieve
+	  memory dumps and exchange command mode DDR calibration data between
+	  host and device. This driver is not tied to a specific SoC and may be
+	  used by multiple MHI based devices.
+
+	  If unsure, say N.
+
+	  To compile this driver as a module, choose M here: the module will be
+	  called mhi_sahara.
diff --git a/drivers/bus/mhi/host/clients/sahara/Makefile b/drivers/bus/mhi/host/clients/sahara/Makefile
new file mode 100644
index 0000000000000000000000000000000000000000..fc02a25935011cbd7138ea8f24b88cf5b032a4ce
--- /dev/null
+++ b/drivers/bus/mhi/host/clients/sahara/Makefile
@@ -0,0 +1,2 @@
+obj-$(CONFIG_MHI_SAHARA) += mhi_sahara.o
+mhi_sahara-y := sahara.o
diff --git a/drivers/accel/qaic/sahara.c b/drivers/bus/mhi/host/clients/sahara/sahara.c
similarity index 99%
rename from drivers/accel/qaic/sahara.c
rename to drivers/bus/mhi/host/clients/sahara/sahara.c
index fd3c3b2d1fd3bb698809e6ca669128e2dce06613..858dc5bc39c1ad42922cabef3b1abcd43bc4f0f4 100644
--- a/drivers/accel/qaic/sahara.c
+++ b/drivers/bus/mhi/host/clients/sahara/sahara.c
@@ -1,6 +1,8 @@
 // SPDX-License-Identifier: GPL-2.0-only
-
-/* Copyright (c) 2024 Qualcomm Innovation Center, Inc. All rights reserved. */
+/*
+ * Copyright (c) 2024 Qualcomm Innovation Center, Inc. All rights reserved.
+ *
+ */
 
 #include <linux/devcoredump.h>
 #include <linux/firmware.h>
@@ -13,8 +15,6 @@
 #include <linux/vmalloc.h>
 #include <linux/workqueue.h>
 
-#include "sahara.h"
-
 #define SAHARA_HELLO_CMD		0x1  /* Min protocol version 1.0 */
 #define SAHARA_HELLO_RESP_CMD		0x2  /* Min protocol version 1.0 */
 #define SAHARA_READ_DATA_CMD		0x3  /* Min protocol version 1.0 */
@@ -923,13 +923,7 @@ static struct mhi_driver sahara_mhi_driver = {
 		.name = "sahara",
 	},
 };
+module_mhi_driver(sahara_mhi_driver);
 
-int sahara_register(void)
-{
-	return mhi_driver_register(&sahara_mhi_driver);
-}
-
-void sahara_unregister(void)
-{
-	mhi_driver_unregister(&sahara_mhi_driver);
-}
+MODULE_LICENSE("GPL");
+MODULE_DESCRIPTION("Qualcomm Sahara MHI protocol driver");

-- 
2.34.1


