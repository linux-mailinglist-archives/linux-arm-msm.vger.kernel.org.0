Return-Path: <linux-arm-msm+bounces-110993-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id uPXlGTk9IGpGzAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-110993-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 03 Jun 2026 16:42:01 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id CEB96638B55
	for <lists+linux-arm-msm@lfdr.de>; Wed, 03 Jun 2026 16:42:00 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=k3P9REkT;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=kSBc0kSH;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-110993-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-110993-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 45E5C30D8A48
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Jun 2026 14:20:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C094B39C00E;
	Wed,  3 Jun 2026 14:20:33 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E7B0394493
	for <linux-arm-msm@vger.kernel.org>; Wed,  3 Jun 2026 14:20:32 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780496433; cv=none; b=MTzafqJUDfXmiT7ZW3gOVOxahJQHWG3iMDpCwzz8LRijpMGs8J49iAmE8FnahNGXnxVFjy3CppwZN6DcGn0GnzYxYnbkYHAJKr+ukC+jQG4RLZ2tVVd2DLB50xpJdK/R8Ifw64M4+emiTO1nIHAoPVo5aqos+sem7S4AphNukIQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780496433; c=relaxed/simple;
	bh=uXvxBqV29dnRWJEGEW3qlSEg81UU7hjiwTjaC3X/PPM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hn3nnosMbAjCxLjzDlufR/KDseaHb3Y7uQNcxWGyaFAkaQpTbn8jsv50kbsNzrKHGLwCyqaFLblVywuVt7/qM9QgM295nNDdZ4u6r+Z7DAWZsrtQHuMsZyk08+lcvek4CyPIqEd22KE7qBXhtkE3t7w1ueLFK6EuxuHjJCerKBE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=k3P9REkT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kSBc0kSH; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 653CODVB2076277
	for <linux-arm-msm@vger.kernel.org>; Wed, 3 Jun 2026 14:20:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FTAIALqBJRf66dVYSvKWnyN0r7BVNV/Albq1Zho5l84=; b=k3P9REkT5TdTSfQN
	7IrHvxQQcMaCfNnB7NUoR/bkVk1X48zsAZM0olykjHIT6CwBk4+ORQvcAxCIS0Ht
	pUTSnOgz9T0NcHot/icmMPceiDQ1UjNqPFAU7G17jERzze556d46h0giaEvvPZFe
	9z7GrQP5uE3jZfLI83Rbe6Yf8oScWxKTOQRIsmGwRvc4I6Av8BfWr4t1Kz1DZEqr
	JxRg2jWYR+N//RC3tUny3tzT1EqSORm9OQFYXZx1/EHfTFPBepyla5uBZpqVDprl
	zn1+uVgsJDMPJv5GtfEUKEAfmbayAethRw5aDBoQ1Qcqe0H8LepfgAQLZKvZ331C
	n94OVQ==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ejev19xa4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 03 Jun 2026 14:20:31 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2c0c272e532so41734105ad.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 03 Jun 2026 07:20:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780496430; x=1781101230; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FTAIALqBJRf66dVYSvKWnyN0r7BVNV/Albq1Zho5l84=;
        b=kSBc0kSHZBQ2yZ+ZpYYc7uIF5ylnq13fk9g0eT79uSAoN+9UCy7J2V0VO+UwXquOc6
         KbWCeDo5s0b9VwjBUT4tRxE7mPCU9DwI5ihy2vtVVgJQ+TXyeDMo27nM+FxhCo1tUVOG
         MF3Hi0CMQ9qPNm6oF+9yKi26zzhFuHxVIuwVg0Hl+Ww1DEqHiWgs3U+Skj2MvCbhjO/b
         0F7X6W5KZszCRQLzJ/HNMqjupq814y+wtXtX//hAOkAMOSjrqC5AZuiAZ0OLwZ2cERIX
         EMr8BO+Y2ZwXM3vS3tOV73/7kr6hLdJENQF/S+iRYN/0pX0GV9vGgt7umn+Vhk+IIHL0
         drpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780496430; x=1781101230;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=FTAIALqBJRf66dVYSvKWnyN0r7BVNV/Albq1Zho5l84=;
        b=MyCv4iGEf7Rmh7kpv1vMu1HWQ8I1dT2nH57MBtq57vxd8hKWMrWxQ0I8Jo8bdnrx4P
         snkIQyqa6PgxfDqm8vmI6/MVmRP3CW9zoXivn9w7CNUoMUSDB6NcxGh5685qOsXsQBwR
         l4eCSJa2kqnRCKLESRf88AnfitDZ+vdqlZu0U3bDIXgky8/WFZgvxeTnL420B14UThuQ
         Os9PpBKeMhf2iEIrVss1vxlqRjUxm2Beg742oZnSNmJka1clwFKjSMf0QPilJngqy7Ga
         aPEsM928PV7Hs8/SGkUcasDnUTgcWcyTeKqSm+KcuO4Vlb5pg3R5JUZDRwqpXDH707+A
         0Gig==
X-Forwarded-Encrypted: i=1; AFNElJ+2u+Gj3z3Uuya85xkIhXxqXRxocQ4cM0Vd/wDX99TTauDsTwob2qE9OFbcbmwehL94dow4bCR/rD0QdbeV@vger.kernel.org
X-Gm-Message-State: AOJu0YxX5BGZ+/C2zJ2Bto26N2bn+RRrtGdcsL3G/ZKJi/blFMyH98Wd
	ottx7iDRpHG7lMqcDgn4AQtZDgIXD1DFXYKdkqdd/RIqRbgPTEY0ER1Buho3yVf4WSZvlCiqV50
	H1E78qsAqFMhJd7s0kIhhjiLpzd2k+0M30zaPj7Ns6RvDNK0HejBYGVlQrq3KeMFTvqeR
X-Gm-Gg: Acq92OFuomoPK61EsNilsObQX2WCDkdEOirPQQcmyUBicOj5kQswPTTgDQdcjBLIZmd
	7T9iaXyYx7lQYWgpL1My1+fgFS0JfSn/jAJxCgj+YytlEf66s8HycDFsiR2YnRNIQ1jTiC/Zfbq
	OYaDzNJgap426fEwz3muCzfWlw6ztKgZJZ2MhznxZditA0E+4LOwsS+LfrsWmu09EA9Q0lzRguh
	wqpOrPGYNSexQY7Q+fpvp7oYoOkTXq3ENuNmuKMwGJXQaXK54Ul3JljJ0bu70lkOZHIy2nWMfId
	23fo0XLUaOpatz5WVfNOIyI0LKxSkYtuEbBW1ATTQCfJ+toAf+4zo1siymcl2vJZ8kwyKWymKX/
	5+d39EkKBS7S46r6CBVpngac4ZObuwHGmkivjital3J7kCGPG+LcHa6uGx2zZGu+z8Q==
X-Received: by 2002:a17:903:2904:b0:2bc:db02:d1e6 with SMTP id d9443c01a7336-2c1644aae27mr26600655ad.38.1780496430447;
        Wed, 03 Jun 2026 07:20:30 -0700 (PDT)
X-Received: by 2002:a17:903:2904:b0:2bc:db02:d1e6 with SMTP id d9443c01a7336-2c1644aae27mr26600175ad.38.1780496429889;
        Wed, 03 Jun 2026 07:20:29 -0700 (PDT)
Received: from hu-bvisredd-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c164f6d37esm41514955ad.9.2026.06.03.07.20.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 07:20:29 -0700 (PDT)
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Date: Wed, 03 Jun 2026 19:48:40 +0530
Subject: [PATCH v7 02/12] iommu: Add iris-vpu-bus to iommu_buses
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260603-glymur-v7-2-afaa55d11fe0@oss.qualcomm.com>
References: <20260603-glymur-v7-0-afaa55d11fe0@oss.qualcomm.com>
In-Reply-To: <20260603-glymur-v7-0-afaa55d11fe0@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, iommu@lists.linux.dev,
        devicetree@vger.kernel.org,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780496410; l=1090;
 i=busanna.reddy@oss.qualcomm.com; s=20260216; h=from:subject:message-id;
 bh=dJOak676jq9xOdkTjWpAc2d8f8wOtUNP7aR0VoiKGvo=;
 b=WOak3EvlYvqbKF6T2lN6EhIkDnf/uHBTEyz38sitDdIOdCEAnsIybqDkj/uRlostDJJ78PqAj
 ADfcNs1g7JZD7SmFqCWV6+7FZcaiKw4i0T0Q8XsPrE2PHfTqssaBHjL
X-Developer-Key: i=busanna.reddy@oss.qualcomm.com; a=ed25519;
 pk=9vmy9HahBKVAa+GBFj1yHVbz0ey/ucIs1hrlfx+qtok=
X-Proofpoint-ORIG-GUID: N8E6jSmcs1uqPAWgeRVep5KnLwDzvX8a
X-Authority-Analysis: v=2.4 cv=PNE/P/qC c=1 sm=1 tr=0 ts=6a20382f cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=ZGoT60Gb6PEvP4nDRaMA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-GUID: N8E6jSmcs1uqPAWgeRVep5KnLwDzvX8a
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAzMDEzNyBTYWx0ZWRfX1SRYByDAs9nJ
 B7KZspOCyAJDyw5s45VBj5pTBEErGbXblRaVJVbtjhOQt0RUBHyJ1uXt1gzY5o78c20/Ha6nGcr
 HXl0f39aFzAeNMypyGuBYiwltuueyn5r6n1H/DgWi8vGhQOw95oKZtmlyI56XaOLIEop8QI0IJF
 nxWlee/QEF1Yvw0PoFL2YoylBtgiZjD6v2jgHeQc/dLC3De6pd+TxGKiZk+ZeS+kww27mPLlZ5v
 Vv35fG/C/b/EvZT6cx6XgTp3ok14NHRX/Hr27wIQh6m68bMtnVlC8wMf46nGaMO2ukBxz/L1lsY
 FJbCRacoPy5Mll/upuc+WfgAwZ7wIMrANR3f8uRVxnDBRKs1WlIsV3BA0m3/NU0UHIfhHNys9BB
 6ZlBzMCYJdQ/sbEKYSa2Vn1W5PEdJUdVD+cpcj+g1XNHX1Pg8nl25cWKSIwQNklyA9fI4xjtSJ7
 9S864O3AUe7hQDH8aWA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-03_05,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 clxscore=1015 malwarescore=0 spamscore=0
 adultscore=0 impostorscore=0 suspectscore=0 priorityscore=1501
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606030137
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-110993-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[21];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,linux.dev,kernel.org,8bytes.org,arm.com,gmail.com];
	FORGED_RECIPIENTS(0.00)[m:vikash.garodia@oss.qualcomm.com,m:dikshita.agarwal@oss.qualcomm.com,m:abhinav.kumar@linux.dev,m:bod@kernel.org,m:mchehab@kernel.org,m:joro@8bytes.org,m:will@kernel.org,m:robin.murphy@arm.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:stanimir.k.varbanov@gmail.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:linux-kernel@vger.kernel.org,m:linux-media@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:iommu@lists.linux.dev,m:devicetree@vger.kernel.org,m:busanna.reddy@oss.qualcomm.com,m:dmitry.baryshkov@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,m:stanimirkvarbanov@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[busanna.reddy@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,vger.kernel.org:from_smtp,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[busanna.reddy@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: CEB96638B55

From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>

Add iris_vpu_bus_type to the iommu_buses array in the core IOMMU
subsystem so that the bus notifier callbacks are registered for
device addition and removal events.

Reviewed-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
---
 drivers/iommu/iommu.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/iommu/iommu.c b/drivers/iommu/iommu.c
index e8f13dcebbde..fe51600953ce 100644
--- a/drivers/iommu/iommu.c
+++ b/drivers/iommu/iommu.c
@@ -13,6 +13,7 @@
 #include <linux/bug.h>
 #include <linux/types.h>
 #include <linux/init.h>
+#include <linux/iris_vpu_bus.h>
 #include <linux/export.h>
 #include <linux/slab.h>
 #include <linux/errno.h>
@@ -200,6 +201,9 @@ static const struct bus_type * const iommu_buses[] = {
 #ifdef CONFIG_CDX_BUS
 	&cdx_bus_type,
 #endif
+#ifdef CONFIG_QCOM_IRIS_VPU_BUS
+	&iris_vpu_bus_type,
+#endif
 };
 
 /*

-- 
2.34.1


