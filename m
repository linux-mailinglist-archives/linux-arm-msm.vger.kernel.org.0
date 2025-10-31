Return-Path: <linux-arm-msm+bounces-79799-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 31646C234E3
	for <lists+linux-arm-msm@lfdr.de>; Fri, 31 Oct 2025 06:51:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 423501A6071D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 31 Oct 2025 05:51:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 520572DBF73;
	Fri, 31 Oct 2025 05:51:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ntjqJ7xK";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="T3OhUHYK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED67D299928
	for <linux-arm-msm@vger.kernel.org>; Fri, 31 Oct 2025 05:51:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761889877; cv=none; b=ZBoDbjsKqSqBQ7YRsOwDx/+9OQJiboxf172QnafsrHnqyeETWQSDsJqFT49VV1mDEoUVmLCbAe9FI81ncxF9GBsbGkqovAQUALg08+63QWvTwGv9SCxeH6txh4bFl/3j/+oCKVZ1ZaFY2QPNyt34gVZbcThcNoJISFhwlObxnF4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761889877; c=relaxed/simple;
	bh=/DzIKQ7XWn6XEbzai7GAbGUo88mw4Mg+1am0ONKm6R8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=auHZ+3fV9bXf3I6uNhkLhtqsv+n85jCqcni0DdTQNx2m2EfsIjp1wjbz0VTRodsCVD6n/8uWG2L9w688tHV9TuhhtAl4+If/fmu7wU6/JcgS90LAq66nzaj3l3U7yaGdlXQm1P+SM9YPE0HkHI6oF/RRk8a/yU7I7Y1syhgHyMk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ntjqJ7xK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=T3OhUHYK; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59V184EA1513338
	for <linux-arm-msm@vger.kernel.org>; Fri, 31 Oct 2025 05:51:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mIQz1cokq4RxQicP2F0TuAgbqbuY9MrpCe10+qTKnY4=; b=ntjqJ7xKyRf4CAK2
	UMWsTAvnQi2xc3lYCX19cdLfe3Csdh/Y1lx3F/mSnEptQbEBQFsKCgxXrrwu31nc
	qmhfl4hVj3svScLPa7MAgYVuxajk+X8KwZkUM5Y8nlT7jLLCqZp7dFjyXF2O8IY6
	/PqijMO3puRW1TBCZ0YZjrU8ON+mhtqlGJtsyCaRpSuvk6iuKReKnvHgHEof2vS8
	h0lRK1NBKhqoxFE0GRZI1ErbRlLJwd/BxzB1+OTWwR52fG3HwLU+CreIPXq0I5/3
	ktSJ3zSx2WVQSvmO2LkOFjFZzSpB8WGFhv8RPgf0mwPGW5BHse4de8GcM3ECIbfH
	moiAHQ==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a4k69gkgn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 31 Oct 2025 05:51:13 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-34082c48b2bso863875a91.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Oct 2025 22:51:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1761889873; x=1762494673; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mIQz1cokq4RxQicP2F0TuAgbqbuY9MrpCe10+qTKnY4=;
        b=T3OhUHYKC5iXopJ6pTUGpDFgZ1R89afEsoXyCW3HuFkMOfYd8Q+EbLLWPAglhWvkcV
         Iq01EwU8Zr+WKe7Yx9mxetWG0Kv8qRSA/pDWTv+H9hJ4P75AoDSBVGkv55FduvxtZ4vK
         UDMORmaNBbKGHoQX/bICCo1JwAP2k8SSD0iI3EBZ5dK8EaclooBj/haO+QoGgGznq7OP
         hA23vZT4ufJp283B0H7Jge0mID6dqUyELurfzQFijDF7eC2PM3BuRknpvv/m6V6OAavH
         cGYym8+GBFsTgaAxWqu/ibNdE119rzF8b5SPvM0miclui5O/d+flsQjzgHX//jbZF0lb
         bIKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761889873; x=1762494673;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mIQz1cokq4RxQicP2F0TuAgbqbuY9MrpCe10+qTKnY4=;
        b=OMPzv0FNb/IvP9Wuqp3FsOQuoHOAMl5fSzhB4nVQjg8J3/gs1zoGaeaAzqhh2m+gsz
         k+krUl4slKOhfDjbcHwLu+lpTyNiywC4Tkgz7+U+wfEM4aVFyDj4aCRFoFcSxoMittgD
         HhTguruaeETGVh4QKr0Xfv2cHk+/L5lCe3GtK9ZJcFfyx3cjbEe5H1kVGZAElMfTI6CP
         8qARCdAilyjQM5dI65HMBkQG+bo/AEVK5fYpMfGDCe9kYS3TuFbe8wRnIsy9wj0mkeaO
         YA7QkG3xvQYdC805hORfbVvnhJU1zR25+fsq3diOqlmbCY9Zneptz7RE80UJSK8cDSAG
         jSyA==
X-Gm-Message-State: AOJu0Ywg017O9Oo7QyTS8OWwo/reppplAgelZCgDMJfNBdTn7qnJjNuv
	NQJHhUGKATk1DeBCJ3EZA5E9g4lReLmuy0bbTMqtN7MBa/4QYhliQDSFh/Se9Ir3WjWRWJL1QdK
	3NV1QtLg9/5abAQD9oRogsuAaQQKH3EZpuepd3eslfEHD3yrDU1xC1jnO/k91WjpmF8Te
X-Gm-Gg: ASbGncsPbxLWN71jIdfkFzuUHvvojHMcjlq1jLDGGK4OxsB8cdLLCrSjWEBaZwXY4eJ
	vKzkL114NN4WDXWZRkiVnz+PpIIGoOraN/MV7y9i0M0ta8aewpV/aF4nv04yPcWASlPCSJpB1qg
	/lLGaLlAlmkNHlSLbOAVFM0emD7lcRYJ9UGxnlA4aPDFraQloCosVKoDRKaagnGN1A9OA4A9k0R
	shsW6+Qx8jbEWr6W3pVnH+7d91aaY/a0cLJUd43Yyyd0PK9tsPlzJyGJkz9lzZKmZJkpbVuw77n
	tDvUDUyeQr09XIvbev8nYJ6Cgj7FVWugaF5stHLHUufaK8oY5UZREL5NRIUZfBM3u2tI4zaU5O7
	n6yDZfJEcwGK0XE5SJzThTT4qbtyuVl/qP4gnoexg933DVG06P9lhxpBmr33pXKiMxaPbLKb5OK
	d9rZ6ZGnqhlaZeivWSHVrhMk3P4fRxWLg+eg==
X-Received: by 2002:a17:90b:3f84:b0:340:7b2e:64cc with SMTP id 98e67ed59e1d1-34082fd8a43mr3260735a91.15.1761889872725;
        Thu, 30 Oct 2025 22:51:12 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF3AZ8PsZSTaBHXCxCrRX2eM4z237NcEQuf3OD2MDuS3VO//02j2ns8S3wP0lbEic9bGqUkUQ==
X-Received: by 2002:a17:90b:3f84:b0:340:7b2e:64cc with SMTP id 98e67ed59e1d1-34082fd8a43mr3260712a91.15.1761889872226;
        Thu, 30 Oct 2025 22:51:12 -0700 (PDT)
Received: from hu-kathirav-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-34050992f92sm4646049a91.6.2025.10.30.22.51.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Oct 2025 22:51:11 -0700 (PDT)
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Date: Fri, 31 Oct 2025 11:21:01 +0530
Subject: [PATCH v2 1/2] soc: qcom: smem: drop the WARN_ON() on SMEM item
 validation
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251031-image-crm-part2-v2-1-c224c45c381a@oss.qualcomm.com>
References: <20251031-image-crm-part2-v2-0-c224c45c381a@oss.qualcomm.com>
In-Reply-To: <20251031-image-crm-part2-v2-0-c224c45c381a@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        chris.lew@oss.qualcomm.com
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1761889866; l=1196;
 i=kathiravan.thirumoorthy@oss.qualcomm.com; s=20230906;
 h=from:subject:message-id; bh=/DzIKQ7XWn6XEbzai7GAbGUo88mw4Mg+1am0ONKm6R8=;
 b=EmmL9RtBsT19xYNzFlFV3D9fH7m+/q8Ar9OgehVu4RKNmgYGXsB5YCVDb/IY1jwpcIoaUYb8e
 aA5eHfjpo+6DSoH7NHtk/NdIRbjps2usQXAPRthYSPW3cok0go9fJLC
X-Developer-Key: i=kathiravan.thirumoorthy@oss.qualcomm.com; a=ed25519;
 pk=xWsR7pL6ch+vdZ9MoFGEaP61JUaRf0XaZYWztbQsIiM=
X-Proofpoint-ORIG-GUID: 2_eB44KDsP-8TtzeNZ_Ow5DF1F_udlUo
X-Proofpoint-GUID: 2_eB44KDsP-8TtzeNZ_Ow5DF1F_udlUo
X-Authority-Analysis: v=2.4 cv=OYaVzxTY c=1 sm=1 tr=0 ts=69044e51 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=eyY2OFHguXDrM2cP1SAA:9
 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDMxMDA1MSBTYWx0ZWRfX7xctdKsx0Twb
 0+UwNlXisvYQPqqRVDBycH9p44Q3dBA3htWXrCpHrupBvmzOvJQtyvSm+fZSgZZ2nWDiBlUs0Be
 lHizWyyLXGw6UOMi0DxsDyuRZ6DBwPvpgruQa/qSmrFAfWaTgBSJ5qyqqAKC3OudpU10dK4dc3V
 IXuJWTVbkMyyMrwZOS/V8IdxdT8O+BZJ8tiXVZnJ96SqQoV3wERBrR9NzVWn1nZcuBal8xXV+EA
 j9eI0yQKgAqNShwQNdyB2SA20H6iQDAVaUDY1aUcmeqe8qBP8REWaqmUBipTK+GzoNLR1nCBs1j
 6vkzpF+gVyJDx5EEZyKl9TYkffmKm+g+/H/nWfclBZsExj4wyfF+UzaCIX8YvHyFf0oCCUsRR++
 iqsR4cJblS7weFJwI87j30XvIQ+Pmg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-10-31_01,2025-10-29_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 clxscore=1015 bulkscore=0 priorityscore=1501
 lowpriorityscore=0 suspectscore=0 malwarescore=0 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2510310051

When a SMEM item is allocated or retrieved, sanity check on the SMEM item
is performed and backtrace is printed if it is invalid. But there is no
benefit in dumping that information in the logs. Lets drop it.

Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
---
 drivers/soc/qcom/smem.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/soc/qcom/smem.c b/drivers/soc/qcom/smem.c
index c4c45f15dca4fb14f97df4ad494c1189e4f098bd..2c8f2494118378718bd40949aeff7af20465d2f9 100644
--- a/drivers/soc/qcom/smem.c
+++ b/drivers/soc/qcom/smem.c
@@ -517,7 +517,7 @@ int qcom_smem_alloc(unsigned host, unsigned item, size_t size)
 		return -EINVAL;
 	}
 
-	if (WARN_ON(item >= __smem->item_count))
+	if (item >= __smem->item_count)
 		return -EINVAL;
 
 	ret = hwspin_lock_timeout_irqsave(__smem->hwlock,
@@ -690,7 +690,7 @@ void *qcom_smem_get(unsigned host, unsigned item, size_t *size)
 	if (!__smem)
 		return ptr;
 
-	if (WARN_ON(item >= __smem->item_count))
+	if (item >= __smem->item_count)
 		return ERR_PTR(-EINVAL);
 
 	if (host < SMEM_HOST_COUNT && __smem->partitions[host].virt_base) {

-- 
2.34.1


