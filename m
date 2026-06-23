Return-Path: <linux-arm-msm+bounces-114209-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id FBWLCLt6OmrR9wcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114209-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jun 2026 14:23:23 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 912036B70C1
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jun 2026 14:23:22 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=TYZQL9E8;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b="VdD4h21/";
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114209-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114209-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 6AE8530C3187
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jun 2026 12:21:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 816113D5C2C;
	Tue, 23 Jun 2026 12:21:30 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26CD73D647C
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jun 2026 12:21:28 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782217290; cv=none; b=Vj3EDfJYt07wv4k6A9mkV9sPlLyb0VyDWkQBrfeuYe7OLVGqJ90HlWeNxQOevT9xaq1gj3mPzpzrg3hREZ/hrOEbHpeJ7AvCltX1RtpQdQvq6PaDQ6+tzx1goK6JnWMZwed14/P5KaYSQ6vyUOmmqkSVsU15Mt6HhCXoslJ5bDI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782217290; c=relaxed/simple;
	bh=wWGDMXGD5TISOPAYxck+Bim377mn/yH0BJMgpaHrpCI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SLFDxmbNfnbTakTyHGDbEAv6p4izgxkpOXqB18vvShZv8zY7uHidzPHb7CVy8gCBcn0WgF15By+kAXKtxLCWtZUD9KzUe1cbxLSQ3gQpeg7wx6YbVC5r4oUNw6a1k0DWaQSXw5bfL0pq5cP0ZhgfzzGZS957ekhc3lCVGmoZRis=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TYZQL9E8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VdD4h21/; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65NBajC5052414
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jun 2026 12:21:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=JBzpNmWrMK7
	7dv+oRp9gwFSkRedXf34HcCV2tGd28wc=; b=TYZQL9E8iFOu/LED/EVmRVaQnqM
	kltxe15x145sds5k3qvCjnnnbPX+49+ggmv2QX1KCaqUNgYIvbaE2R17t/aT9nLu
	1Q24L4rFnRQhE/uZY8tEQSqd0i6W/7vSlhV/qDRZTSeo6AWxSznmbRCJUnzq0AcT
	bOwxIZ/9uKDGJOfkqEmkJz2+2iTeQGYkivkeHzwSlitvorn/ldk/jRIKOeDRnaT1
	n+fIrMQZrhI+QEw/WZCgQ9psRRuIGDLV3s0HzWwPXP7lNaFd0o8vNElsC1xT+ffL
	VClykvintZVJI88aqR0BQtJLyaEIjV/TEGuN5+QbgTL872HOk6eRVBRk/nA==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ey5n44pfe-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jun 2026 12:21:27 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-842446a3851so2949215b3a.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jun 2026 05:21:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782217287; x=1782822087; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JBzpNmWrMK77dv+oRp9gwFSkRedXf34HcCV2tGd28wc=;
        b=VdD4h21/eX0p/Pfmg1C+/HWup/vma6n+aCyIuA00Lkk/TSw3YT4RkraPX+eC4q14T6
         q08tAMV8u7zn3lWFTeEhvaUFMT7ClgoKXmeSSlyimkM52ryJaw74Kl5UInVdYDdtS4XI
         JFEV66zFDsKXoBcRHpJx6P8Yi7Y9HpVBSh/wt6ku9/n0458l3+tWQi748cAbLnkbBPLC
         SesQqIirR2zoTeYHXXjWM+iwj20p9DIa7likp7RC5kDkXIEzS2+e69tufsPckCPhbT5k
         KTYSYDBrj7afInt9qUsj8xl55OVW9FX/83y5tfXWhTnzK7oHr+eifvRTqaYx338xhq4X
         V3Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782217287; x=1782822087;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=JBzpNmWrMK77dv+oRp9gwFSkRedXf34HcCV2tGd28wc=;
        b=fnPOjgfuWP+2LbvNoIBDtRc4yOJVNeAm3WeQ/HWPBxyQEVkc6l3cX7aWywcEMNd+9Q
         Ir0NjwpJfhlRnExpN02dKyGq2Rs+HOkZls+jSf/8AMN5HZSRyLXezGeOUYP8RIs+bdeK
         TLy4QIUcgQ+N3R2AJO12ZP5dGcXmhmbvakPu3wLlRDHRZ9oUY8ZbTlweofN0jOgpeRb4
         tis/1zyXw8cPnzR89HgMh0+MJSY18UvOqpyrEUDgpfeZE1xFBRE149mI5G2h5ae86G4U
         jp+sm+b6oeDCifbU5EMRN/ff/bL2fA3y2K418klojvLviwDFP5/LZyZdlxC7HnA4hSE8
         vPuA==
X-Forwarded-Encrypted: i=1; AFNElJ/qjfb25l79U9eIniN8kEe7pOo8YuNaf0h9fIof3j+zVmQa6vuvLPYD7KovHDALrQfB94IlwQvdcxra8WOJ@vger.kernel.org
X-Gm-Message-State: AOJu0YyhNQyLYGpEAfs8jlMZcej7kYy7ik0X8MfF1c5lUqRraCpoMVkk
	hQ6HYYhYumAjoZl0v2IyH3ncB0kPpE8jI3g9oGp3BR3IAyNaqKq+rDBIzosCkthBT5NRL/hf+oH
	GfZk1sTEMf3wt5ShsN2OWS+6WydLYTS16KTGaKy6zbf4afxn8uEz5+jbjIe7uh3QHmrw3
X-Gm-Gg: AfdE7clq3qZB7LJ1xUYZ50jhWXYLmROdWJ/fJyVsCMlWXvmbWR8NwKX8xwSAim1rRT4
	W3e/meMrN0I3ptxlMjA2TVtZvfVgJOH91t6Qg6PqqwrWFJdzq9+kt3hRA2C+AwC+KYHYjyoPuCR
	/P31gBeGSG6LXDARHlbMRRDq1nankJ2cgZL7yDM8Tq+uO+8awyPfTjvPyqjyBskeDmnqDiPn+tA
	NfLPXu8JYUXgQztF/7cVWBopptHaICsI8/3X7ag35qNvrii/bM6G3jev5yrY7x/ASf6/v6Q3u7V
	b/YeWe/v7cT2i6HYsudbDrkeEMkSzKccJTuvibtbL+ylpwafdM8uee61egxYVTSESWZNc1/zkbf
	jgLWUltyHHR6LR0EzsVH+SVFpPIRrNzUUKt3qig==
X-Received: by 2002:a05:6a00:2e22:b0:82f:abc8:ae0 with SMTP id d2e1a72fcca58-84597066cb7mr2782735b3a.17.1782217286766;
        Tue, 23 Jun 2026 05:21:26 -0700 (PDT)
X-Received: by 2002:a05:6a00:2e22:b0:82f:abc8:ae0 with SMTP id d2e1a72fcca58-84597066cb7mr2782687b3a.17.1782217286206;
        Tue, 23 Jun 2026 05:21:26 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84564e74646sm10171856b3a.29.2026.06.23.05.21.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jun 2026 05:21:25 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>, Will Deacon <will@kernel.org>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>
Cc: Robin Murphy <robin.murphy@arm.com>, iommu@lists.linux.dev,
        linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: [PATCH 8/8] iommu/qcom: Document why sec_ptbl allocated flag needs no locking
Date: Tue, 23 Jun 2026 17:50:34 +0530
Message-ID: <20260623122034.1166295-9-mukesh.ojha@oss.qualcomm.com>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIzMDEwMSBTYWx0ZWRfX2aLPFlcO2fW2
 CKOsiA/JffKkDbdoSRCEnjIA33+458ZJzNV6zm/YfXzEyfZ5sOsCktF3EZJtBRhfG5RYfKLWOYI
 Qi2PJm5muAlpfZ+PnS9h3msspss8mDI=
X-Authority-Analysis: v=2.4 cv=R8Uz39RX c=1 sm=1 tr=0 ts=6a3a7a47 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=KL97T5h_q3IXvoetim4A:9 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-ORIG-GUID: WbmStxWoIBvi5qKsy2RS0J6PD4KaRPxr
X-Proofpoint-GUID: WbmStxWoIBvi5qKsy2RS0J6PD4KaRPxr
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIzMDEwMSBTYWx0ZWRfX3oX76TXbYsPS
 75D45WOsOQCj7oK55XnXzA4bb2SS72eEoSzvhMAL48XVctE7dTJZCTkDT8NYqYsWIN5Knu8AEu7
 vYpLzfhhM20WABkkWVQjCfSWNQbyAHQlYYg3iBkd72dk+l2CwdpX7Z6HOPlsbhysvDwGvAtWq75
 s2sEo1I+YczAfinwrdv516guVaYoLD9Av1/hOdRlzqHgJZpmGmfqX+KCItDI57fCcmRYYrNMf7s
 4W+3ZngBhxum2M3yPyysHRGtYmYqm9ZJA9L1WlAqMaTJR+vCPUlC8Z/rHaxjLAuAt/CVqYnt7zw
 HcI3oQWsGHHH18wbs+3bCPspJQeIC6x51UXc+ebUcyV4tSwaK04qz8Gl4/CVyWJAll2gUMWiXKa
 u6UwZmhF/HJhejTI3PfGey4s1SLNE6j6ihDnZp+cJ1G+WIdpgeuZy+Nt6lnCv/5VSqvJkEXp+By
 YJGxgVAQ/kdhGu2YHEg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-23_03,2026-06-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 impostorscore=0 priorityscore=1501
 lowpriorityscore=0 bulkscore=0 suspectscore=0 adultscore=0 malwarescore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606230101
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-114209-lists,linux-arm-msm=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 912036B70C1

qcom_iommu_sec_ptbl_init() uses a function-static bool to track whether
the secure page table has been initialized, with no locking around it.

Only one IOMMU device per SoC has secure context banks (the others have
only non-secure context banks), and platform devices probe serially since
the driver does not set PROBE_PREFER_ASYNCHRONOUS. Concurrent calls to
this function are therefore not reachable. Add a comment to make the
absence of locking intentional rather than an oversight.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 drivers/iommu/arm/arm-smmu/qcom_iommu.c | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/drivers/iommu/arm/arm-smmu/qcom_iommu.c b/drivers/iommu/arm/arm-smmu/qcom_iommu.c
index 0df8c2af8eed..bcf5ab049aed 100644
--- a/drivers/iommu/arm/arm-smmu/qcom_iommu.c
+++ b/drivers/iommu/arm/arm-smmu/qcom_iommu.c
@@ -624,7 +624,11 @@ static int qcom_iommu_sec_ptbl_init(struct device *dev)
 	void *cpu_addr;
 	dma_addr_t paddr;
 	unsigned long attrs;
-	static bool allocated = false;
+	/*
+	 * Only one IOMMU device per SoC has secure context banks, and
+	 * platform devices probe serially, so no locking is needed here.
+	 */
+	static bool allocated;
 	int ret;
 
 	if (allocated)
@@ -651,15 +655,12 @@ static int qcom_iommu_sec_ptbl_init(struct device *dev)
 	ret = qcom_scm_iommu_secure_ptbl_init(paddr, psize, spare);
 	if (ret) {
 		dev_err(dev, "failed to init iommu pgtable (%d)\n", ret);
-		goto free_mem;
+		dma_free_attrs(dev, psize, cpu_addr, paddr, attrs);
+		return ret;
 	}
 
 	allocated = true;
 	return 0;
-
-free_mem:
-	dma_free_attrs(dev, psize, cpu_addr, paddr, attrs);
-	return ret;
 }
 
 static int get_asid(const struct device_node *np)
-- 
2.53.0


