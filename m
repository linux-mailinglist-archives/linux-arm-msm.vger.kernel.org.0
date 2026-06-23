Return-Path: <linux-arm-msm+bounces-114206-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id D6U5ITd7Omr+9wcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114206-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jun 2026 14:25:27 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B44B86B70E5
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jun 2026 14:25:26 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=YHNtFBBD;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=UzHRy9Wr;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114206-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114206-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5105031475D0
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jun 2026 12:21:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9F7143D5C0C;
	Tue, 23 Jun 2026 12:21:19 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CAA13D6473
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jun 2026 12:21:18 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782217279; cv=none; b=mNbq1DmO36xfgnSFJeBOEqbB6JRTFloeJRg9pgXlPe4t0bH56LV1FdUg7XNUPQs3DhXFNrGrKTyw0xHVrPYUFJYsb7Z2KsXa2t9/rn6V9/z9iHxsh5QgIV4SjpSym68R5e3Vy5LwsjtW8NqtC9rCqVvFf+hXgx50kltU48qwr8A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782217279; c=relaxed/simple;
	bh=8BtzNJYd189mxIUKftmER9o/tQq+pg6bO8RXUFVJiDY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=b+C7VqC4F94bcfQNNmaJvauBRVIkGHI8DIIQ+VCqGhGjRFGgvT/UcQ+yI89UkaJBH5LAkWtJxshF4Oy7t4+LLwiomgT8CVBNss3qJlyJj9FkqinwezvXX/CgBGi+sZvKnwY3HyLXJqlkFuEzlaiPh8rC+4t30FkF6WcacPWOJoo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YHNtFBBD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UzHRy9Wr; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65NBXgX42309042
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jun 2026 12:21:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=Tl6TMjOkY0v
	pzUkVoZ6vM0rqRq7dBnGr6QKrXS58jEs=; b=YHNtFBBDs4TKgMga48qTiEUHFKi
	NmksgOIL2hvnjwXE61ef29VKhpTJ0T7IbUYhvOh2TVF9Qpkehu0YI8f8764Y8naO
	xX8+mTSMV6yeVIjL6RZKtfOUgFhRPtMR6ypwkMQ1A5O5sftSQeFh4/81MmplR9xe
	wCcHqiXMoonbj5/wn5u9Ta8Jqd9vi9bqMRUARtvSLDTgJzPciAGC+d+5tjqPx5fP
	lxa9daalE6wcTE1eo2CpcxGwaBEHP3449oEXbgdPCYnDIHQI/c3mx8xw11SJi92H
	djHxlxu3/wuSfosV8PXhRE20g+tb+hSPGQJ8UW55cq5JH3F4DPqsewuq8Tw==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eyp1gs2xy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jun 2026 12:21:17 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-c8a247a74b7so3249929a12.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jun 2026 05:21:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782217277; x=1782822077; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Tl6TMjOkY0vpzUkVoZ6vM0rqRq7dBnGr6QKrXS58jEs=;
        b=UzHRy9WrqtQYJP9Sut+leG9ToqbmRcK+WKSSi2jzudSGGMUlPeRNbVo+tHp08m4tGm
         8zx7YCNNV0Q9+9TH6Ljs0R4kuEWty6N1vmFXTWwJX6EB7V48MCoyf+tjxyiLYt/HXlXK
         szUAik+WUtRzxVBgMMjdOin2e4azZcDllIspWO/g23Il2d7Wt1sDvNkU/+0E29EyPXHu
         9eGw12IREA44UojxSrm1rBFc7njm7vymdXx/5GjJXupmvvmssYhMTbZBH5kahohh1o9A
         2/y4LlM2qFvSPimM026sZHZ/MV73wsGrypoONQnQa1sEwgkN4xWGJrB+9IbG1j+s7wm3
         RAgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782217277; x=1782822077;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Tl6TMjOkY0vpzUkVoZ6vM0rqRq7dBnGr6QKrXS58jEs=;
        b=jaKfmz2Kg7DC7ZWvkSBvCI9A4GqnxVjCFqyxUmDg5jlE2dIRPtD4DL1XuKjM7JF4Up
         HvLW/t44iZOuCzWN0KsAHAfeVymshtZUYqU0hz8x23zcCCcsx2XUx7pt2gKHfJjjKaFg
         AlkwXT59NFSXIWpIUZbWyYNBdy02uOda9UVNPKiijz5KAr7X/LcoUoU7F4pFpBxp7FOb
         udrRDE3pGQbBQ95nclLF/xUQgzhg3dsAOeZ18ns5q0TkFBchAEyAbqW81OdUJSROP4Gs
         l+wF7C/FL6iYge/53x+78REizeLfVJMQVbOCOwyITLsjtYTsJBjkKwnHT7eqwbjaqmjr
         65CA==
X-Forwarded-Encrypted: i=1; AFNElJ9Jk0VSsmVd0IbEEyhdIfG/KYI0M5Is0jxq9F2DdUoGRxtWnVXOPWz7/JAZOo05XEeQnHt+i4GM8HHD3xHc@vger.kernel.org
X-Gm-Message-State: AOJu0YxJYt+ZEmO+GKklEs+5i5Z2VXjSQMyd0V2xR9tbNEdbeyRO4G7W
	KIY4r7C4gDDagvtA+DQSCwDXd5r+S17ft5R9blyY6BYVRFaemrhbSA1vl0sOgjx9RzQVRnBrWmY
	lgTigQS2Ad5A7Po3RXHLJ4SdY8HVLxP69Zb9JVb8yYwzI8Y5XXmzvbUbxLitP27danvQTgcpwiE
	rC
X-Gm-Gg: AfdE7cnF8eHev3D9xtX6pSNnnzu3VsQ/Y3T6kYlZ7GBwrYfVj3AdM0N3KKMoOri1x0k
	N3tM3YH+mfZ62lZkTF1v+g3YbJzQQFD+7jfi3zUIkXdn8MSXkhw2446lfsgCK9Uz/czcKmkOiQZ
	oJPSH/5Ka/urm8pm1miWp6k51BSHD5BLfIwEn7i2S7TerGPUHW9y53m/eaAzfyIKtPauoFl4hjt
	ftYaUSZeBwO2iWYdM36PDNoE0VRJOhoNyErsLkK9j1a1fqfUnRXvGAdfUJE8X0bro+0cdoyj6bm
	XSE6L/OI/P5h9NrcunaefLnH6Argn5jun1gWrAnmRK4WscF6f+DBOOkdolSkvpaMzHO0DBq29Q6
	zKeKGJXNQ4Ot9NaeFiUE0N3cqQPsgqNKsS31uPA==
X-Received: by 2002:a05:6a21:1f83:b0:39f:91e9:cada with SMTP id adf61e73a8af0-3bd14f00047mr3463383637.9.1782217276866;
        Tue, 23 Jun 2026 05:21:16 -0700 (PDT)
X-Received: by 2002:a05:6a21:1f83:b0:39f:91e9:cada with SMTP id adf61e73a8af0-3bd14f00047mr3463324637.9.1782217276119;
        Tue, 23 Jun 2026 05:21:16 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84564e74646sm10171856b3a.29.2026.06.23.05.21.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jun 2026 05:21:15 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>, Will Deacon <will@kernel.org>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>
Cc: Robin Murphy <robin.murphy@arm.com>, iommu@lists.linux.dev,
        linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: [PATCH 5/8] iommu/qcom: Publish pgtbl_ops before releasing init_mutex
Date: Tue, 23 Jun 2026 17:50:31 +0530
Message-ID: <20260623122034.1166295-6-mukesh.ojha@oss.qualcomm.com>
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
X-Proofpoint-ORIG-GUID: D9boLKKcO8YmU5xhS1268NFZNRgEs8ko
X-Proofpoint-GUID: D9boLKKcO8YmU5xhS1268NFZNRgEs8ko
X-Authority-Analysis: v=2.4 cv=QJhYgALL c=1 sm=1 tr=0 ts=6a3a7a3d cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=Ya-8ghbQ4qwRuljleqkA:9 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIzMDEwMSBTYWx0ZWRfX3YEgyWaXhVFp
 FX8v3OHU0cXRe0ZoHrCbLw9RuNcwVCl5NFUfnYPO3uRxocqXQBNDlREAgYAaOW2IbcGmm+XsQjx
 4bHwb7Uk4KX7XdnO5ZIn9mcnZJzvDv4=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIzMDEwMSBTYWx0ZWRfXz9N9tvNKuVyj
 XVZDMO9cbB3anx049qQG+wgH4tLg28lJmqX4d53l/TSNeRNITENfjREf6mbA0L7nr/cy624xDSn
 +A4RVw51Na76w8gOruWUU/ajj+gEXYCEaHZdz//A2OsGG93G1I/8qJWr4eQuycusm/9MBho0+42
 2HpE7Wa3DeOVLqS8jzAWTxWmFi5YLFJH+OWiOUbSi7wjhoDPgjz0d8I5vDVhbCF7U2v05EwQ32f
 ybHrA7at5883D/a22aMiZPtCHvN8WigSbIk2xMbgxZtwMVUZI391AJumO3BOAvVlh+b4bF6plsQ
 Rul1+G72mNBo8rq2csscpu90DGcVZ7Dz8mPBFyU9qWKzO81Y+XJ/Sr4uOQ9x38LgR1jC0fkO1vN
 5neMLiS5VHQdyp+FXUBGPdrsxeO1tLWfHQrrS5Q9FPEmsotYojr3IIck9pDuPerJ5GGV51Xg1Ls
 VYxJU+EpL/tvbz+93iw==
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
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-114206-lists,linux-arm-msm=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B44B86B70E5

qcom_domain->pgtbl_ops was assigned after mutex_unlock(). Another thread
calling qcom_iommu_init_domain() would see qcom_domain->iommu already set
(domain fully initialized) and skip re-initialization under the mutex.
If it then called qcom_iommu_map() before the first thread set pgtbl_ops,
it would observe a NULL ops pointer and return -ENODEV for valid mappings.

Move the assignment to before mutex_unlock() so that once the mutex is
released the domain is fully visible to concurrent operations.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 drivers/iommu/arm/arm-smmu/qcom_iommu.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/iommu/arm/arm-smmu/qcom_iommu.c b/drivers/iommu/arm/arm-smmu/qcom_iommu.c
index b6ce85f7f923..40fb0408dc07 100644
--- a/drivers/iommu/arm/arm-smmu/qcom_iommu.c
+++ b/drivers/iommu/arm/arm-smmu/qcom_iommu.c
@@ -306,13 +306,12 @@ static int qcom_iommu_init_domain(struct iommu_domain *domain,
 		ctx->domain = domain;
 	}
 
-	mutex_unlock(&qcom_domain->init_mutex);
-
 	/* Publish page table ops for map/unmap */
 	qcom_domain->pgtbl_ops = pgtbl_ops;
 
-	return 0;
+	mutex_unlock(&qcom_domain->init_mutex);
 
+	return 0;
 out_clear_iommu:
 	free_io_pgtable_ops(pgtbl_ops);
 	qcom_domain->iommu = NULL;
-- 
2.53.0


