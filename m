Return-Path: <linux-arm-msm+bounces-101093-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qIrFIML1y2nlMwYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101093-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Mar 2026 18:26:42 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id E1F5636C960
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Mar 2026 18:26:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0625F307C276
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Mar 2026 16:24:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A7CFA3E92A5;
	Tue, 31 Mar 2026 16:24:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ouN8zF+L";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WX6IqhL7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D25F3F7A8B
	for <linux-arm-msm@vger.kernel.org>; Tue, 31 Mar 2026 16:24:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774974289; cv=none; b=FMgyx55Cgjnuk1yYgAwfYI3GIKQc+nkhEzLIAUbPLfDPRgVTZ1ADiK9kMAS9Nf5T7nd7f85iC7ToOdAt8ps321PDDhnnTEY15EK4w6+64Q7L1fxyMdTLalykO1NxgMBRC4jeDljsRU8uzx8/j8AdqGjc7Td5yejysbJLbxJYDR8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774974289; c=relaxed/simple;
	bh=24VqdfhjUi3H0FmoiCWOtWDHJwTBbmsuHdIIpk7JS1I=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Jj6LmM+/y1uErktN1DsPUOWiuveghXDUujkj6bn7YBLSIxsxkPKnvsfVfdzGVmyV2XuqPDzH9QV7u/mW1obdO+Ax/hxQEtbZHBDlW6TZ8WkYpEByTK64fxxYCMzagdmHe83e+0EISdYPmmNGaBevO4fqO4b5w5WpuR9n/1bSm4A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ouN8zF+L; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WX6IqhL7; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62VCvY4v1306359
	for <linux-arm-msm@vger.kernel.org>; Tue, 31 Mar 2026 16:24:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=zbEj4Kqx0eD/6L23wlXVeO2xRkopx2aYiVI
	3FqhH8KQ=; b=ouN8zF+LduCEG8aC6uD+9FisL2eRDy6k5Nc06OY/Hn355lMPMUD
	pJdiBZXMj9alMzrQFmk1+Sj2GFq8v9r25babB4QQ/blgf6BfnbqGZ4tyHm8TUXr7
	2yl6tzzcRKy4qSrkGGzs8XhQHLuZSBxIQ6EzFt+1wal6i6IvOY+jHL11Y4bN08RW
	q+EVPBEyyabQfbi3QxunAjTJKK5lrVVkOrybbY0/byBLKUQFpGJfOu1587IMcmp0
	ubnxAbNQnH8P0p13AadU7KYbTA8/0MToFLwxN8zJ7hYGIaM4rGDOcLn0ghU5kBAH
	LF5TWeIr7YUnLe8628Z5e/4BKlobar0J4iA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d8equ94b8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 31 Mar 2026 16:24:47 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2aad5fec175so130510785ad.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 31 Mar 2026 09:24:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774974287; x=1775579087; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=zbEj4Kqx0eD/6L23wlXVeO2xRkopx2aYiVI3FqhH8KQ=;
        b=WX6IqhL7QRe+cyNYYbTnml3oReHaXzXuzqukAYNsqDRhSyhySChTb7rhAreaAnNqQR
         +Xxnl9vMZkzRK49eD0EqJS9MhiEECNo4sT3Y7Vvj4RhAcCKfd8yxGsM/vGiH8t1oYHP2
         3IDQdusAU26MFKxhkJmYrveSGNLRs9TD/zJhG9PiM+K600sq4dSK2vep+IERwhWw+7dZ
         nF/pqBpPr1R+UIO21c1ubpqZxMYGVZ0+fORkngdDU/wsI//oWO2ErVcPZWcN2OOOth3s
         yqjjBDkZe1OqsdRce+ayhoZC+XfSAoaLc7LaPxQJYGJqZkVJVnto0ZpYQzwJTEIg04J8
         FL5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774974287; x=1775579087;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zbEj4Kqx0eD/6L23wlXVeO2xRkopx2aYiVI3FqhH8KQ=;
        b=X8en2qDNmXnStsARMmg1lBCdYs5M+27BHjdUGs1lnfP3VbNXzZwWrpX354sNUK23LI
         BlKL1A+awVLgVgO8Y7zS39OQ6orjbxDJ3Us9eKq3Pr9/0rf4AePxdWC8ycmNl+11kPgc
         Q4LsGk69Tyu46Iak8KNvyEjpKAAZLRwQGDmoMBT211XqpSJ1oXqcq8PKFX2QYEhlGyYC
         SoWfpyNq/AgIifEi358ybQWkTgENB9iR/NQGktZR35pEMH+sl+/SM4HU9w7/nPqS90tB
         6dmTXNFtaA5c7FsiZ9fLsswluWCfdsWPZvbo9/ZjN4oFl+1GfQo6FflomjHS26kkoU9W
         X1qw==
X-Gm-Message-State: AOJu0YySlbM3luzhpFC/MTNaqZCd13tuGi3Wh9UElP8EuPxW7v/BmwFm
	+QA5HWmSgPmogoAZXOZkGKgfiHIirh8BHkEkaF6+P6BzVleBVFuObSnwz6rrqgIPDEKZRhPahr3
	BvLxqv6odkJq/PYxZLhEZvI5/H0XwSy0fLgH0clcAY3Y8n1fWKNmwlA1JddV1rJmO+i5g1GEVQU
	U/
X-Gm-Gg: ATEYQzz65XEeVrn4ILTonCzvUKgt1xibBP0mwVUeRvbTk5ZK9PxRyHeBa+L/16FrVph
	I4J8yD0ALL9AjEr4m11AwPtAugdSrOFFHRgrUYwCRER/y0QYDbSM/hdQWMnX3uYPBmrb2ivv7bC
	O/iSl6ysZE7ielhEvqSw3SJkg+Zl97s9Zp9k7Gpcp6/T+dmQ8R/Ywe4cGFA6+uVR9qmHV8Qrh10
	ZTqJGCP1jHGMSvA5K7MBq7rnEIE8i/HSiKwBbNmtYNJ9TQxQCJWZA3PGniclZZ/UZX82WY+SIut
	GVyhZ6YEmDtWBQtNfvCkBPBUCIeQdtN+CLpzwX9Lba29IKYxNBbyZR3u3TdgTJ63O9zVpMV0tGF
	NrI6PLv+R6aIG7z6MoAN/kBeeCZ1H2XN7Z3z1WvoRY70hVpTy
X-Received: by 2002:a17:903:138a:b0:2b0:41eb:165e with SMTP id d9443c01a7336-2b0cdcd64aemr183403435ad.38.1774974286592;
        Tue, 31 Mar 2026 09:24:46 -0700 (PDT)
X-Received: by 2002:a17:903:138a:b0:2b0:41eb:165e with SMTP id d9443c01a7336-2b0cdcd64aemr183403135ad.38.1774974285980;
        Tue, 31 Mar 2026 09:24:45 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b242680148sm114284545ad.31.2026.03.31.09.24.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Mar 2026 09:24:45 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: [PATCH] soc: qcom: smem: Update max processor count
Date: Tue, 31 Mar 2026 21:54:39 +0530
Message-ID: <20260331162439.1922486-1-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMxMDE1NiBTYWx0ZWRfX1ooalGJViOG3
 1HY/j5Arjxq3gc0EP7eDYKp7PfOOmTroqugZU7G3y0GzDCYEFKkBBGjbPdWAOAoboXPq2aDHePG
 G10QB+AZnCTyE0HRVciX/4RjnfkGAY8zJ7OyA8icZ9CQr96VHkKRSXH4RzkIaPiIYa8Ce5bKUoA
 /J8HhBH4/vT4GIlj4wQu468kRo6Q2NgjsmIAdlMcAcr9Z5VB5PuC47GzkkYWIxFxK5rkHANXwiM
 qXx+zv1RQVleYl3o++Z+HDvYtLNfgY2AUraWyzdV9q0R6Cxs2cQlptU8O8qiVv60rT9OfzdnlzX
 1fGd/6LPcBC/srzwhhX4iQWH/hOLxI4Jlsor0MjMlamZD04L7mwcxGauJs54ZyiludJ/UUMVjz6
 5TBNf9I3r1UuI/UlAn1KFRmK48Paq/sy+VWCtyrHK+5Hz8ISZIS+faLuHpcV1F0Tvq/oaFjLSI9
 2uKXMOBqurH+qeQOUCQ==
X-Proofpoint-GUID: 4vx1YoNgTccUhmLxbnWYpsXUx6grErjQ
X-Proofpoint-ORIG-GUID: 4vx1YoNgTccUhmLxbnWYpsXUx6grErjQ
X-Authority-Analysis: v=2.4 cv=YMOSCBGx c=1 sm=1 tr=0 ts=69cbf54f cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=dluG079SF-FDyRJlmAYA:9 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-31_03,2026-03-31_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 spamscore=0 impostorscore=0 adultscore=0
 lowpriorityscore=0 bulkscore=0 phishscore=0 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603310156
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-101093-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mukesh.ojha@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: E1F5636C960
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Update max processor count to reflect the number of co-processors on
upcoming SoC.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 drivers/soc/qcom/smem.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/soc/qcom/smem.c b/drivers/soc/qcom/smem.c
index d5c94b47f431..8daa25d16fdc 100644
--- a/drivers/soc/qcom/smem.c
+++ b/drivers/soc/qcom/smem.c
@@ -86,7 +86,7 @@
 #define SMEM_GLOBAL_HOST	0xfffe
 
 /* Max number of processors/hosts in a system */
-#define SMEM_HOST_COUNT		25
+#define SMEM_HOST_COUNT		30
 
 /**
   * struct smem_proc_comm - proc_comm communication struct (legacy)
-- 
2.53.0


