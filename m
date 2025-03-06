Return-Path: <linux-arm-msm+bounces-50542-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 6415BA552CD
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Mar 2025 18:20:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9ED0B188CF71
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Mar 2025 17:20:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9897025C70C;
	Thu,  6 Mar 2025 17:20:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IoKBeOwR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDE3C25D1E1
	for <linux-arm-msm@vger.kernel.org>; Thu,  6 Mar 2025 17:20:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741281612; cv=none; b=NCuI5h6mrjIovxWNR/gXm3pJY8+7mXKPuQhewDYVfmW+PcaSqHPHEqCpepFILlqdc1Fhp1tHFaw/81oNwCV3gvsV0Ag/fLNDzkhuZoNRfx2TZQZy4uaI+xV6N+xfIdIzQRpVk/L+MzgdOKVElLUb5WXk1AEeFngAwJknmxqKuFU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741281612; c=relaxed/simple;
	bh=PhUYcQcjTQRm7opDhMqTr6UKw6MMZvVi48xkG2ruf0U=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Ewr0Sq94coUJ+tEomp+ABTwI2aeyyp7md2SiGaTNobGY4JmHHHv+GT3K8D9TD8CjTD2qxzBAoqhUmfhbmO7OukKW9+RExuObgFHJAkHVexBw9mcydRRWiEBF+W6VB11hodZDEb10und8uzLUZiQdXVZQDhgiaZWWh5kRZMAncBg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IoKBeOwR; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 526GI3me028604
	for <linux-arm-msm@vger.kernel.org>; Thu, 6 Mar 2025 17:20:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=mabVZF++F/IRRE+DpGcKkrClrfkIYBrazst
	8nqQFCNc=; b=IoKBeOwRPJLjLs/aSuQLn6aQd1A90ve3T5C4D9jLSXTgEMiRe9x
	Cr2Y0H60CMA/ACBaB9zf+8ObarxwViVwz6mDCIJXwUlr8H0cK2jL53Co83GPiE9r
	iWF7VmUcVjRzmHvxjUzMajQcyeLBJAn70585Jam6LkK8vfxZ5UddABRpFE2QmI9f
	DDokHyjgMbkA2gELGK1IIlAOCuNm3+JP1EQcakQqiAMHcf1OP3ZslOX35sOJ0YL4
	F5rI0b2xEvm0qMk6pRVMFp6S7O3yHR3qSkxukHUANqCPj6cxVYv9rjDeI8w5EA1M
	2gkPSNm2m/1ab+x4cDGYvQxJzs8jfOVvObA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4577rphq83-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 06 Mar 2025 17:20:09 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-22368a8979cso16186415ad.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 06 Mar 2025 09:20:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741281608; x=1741886408;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mabVZF++F/IRRE+DpGcKkrClrfkIYBrazst8nqQFCNc=;
        b=SZsGXxR+cKi9pfkKhT7OsrMlsppxUCdvJ7do1fxMLJafajWisUDH3lE+Sapa+3FSPA
         xCd+yf0ZQTOjnPBdGxdWBOBLjhPD2Vbt9xT0WmXFHbNOZCWDQzcLYQsHiiUdr6fgZTBs
         JDLlqr1181I2/O0dwpyuRKEo5dSIuAittbj0Aihuf5YmOKB0dwMQXhcAdSDGHR2IwGjm
         Slk4SSp6ndkwHYuaTyTuU7WlrsMyjzAufkdZSo61tD3GPfXjYUdbPLKYEKBFySsZyMjk
         tqTpMlJ0G1T+P4NFNMUxPqtJugZ97wRwxsnQ+gAmZBJO3Z3AfR+obbWnatJisjlMEPhw
         AKQQ==
X-Forwarded-Encrypted: i=1; AJvYcCV9T1Foz/ENdGoTjF3Fn2UX7uvNrXWKZvZPBLTPkuPKXcXwnq9QqNIxc3n2MCLFdBfLva26G8EHfIxm/mBX@vger.kernel.org
X-Gm-Message-State: AOJu0YzFe49voe/6jlDXU9aHg/iSOiKGKdKhJvi+5zVbKjIGilkiLrfg
	eIOgVDgxgPkEMS7tK0pZOxy3x5lK6NP+qgeQI2zhzUH0izJVo9P5EMGfTI3kRdPDiI7lTpDdKSs
	nW4X4SKRClVJOOS+gJsHXsUOlKebNpGqxUIi1jE5OlXbFyE9b8nM7RzLPiE+6a/Dj
X-Gm-Gg: ASbGncuX/69KJiMvz/VN0U2eAyS+UjxSvE5kTyStuCBrXQ1ME6KPr8SCTsJtY7Do1NN
	5AhdoEjO7TKqxTbjDPLMwfvWqZ0vOaNMcK44OjEWSmUx9P3c9tVa95cedZYEFV/JTyuAWTSSKey
	MbPYMx7qKaMs6MaItBRL20KGiNhL2N373i8mCUJxXKuPunplNZK0bjHqJAY/Tr1dU9FjSFSKLkG
	sfCl3wO/+Zxbbt7HFV3Yo3wE0eEwKQhVMO9O9lp4QWs4rm4K3ELAAVpnnQZ+b5U7DKq9ebKg62A
	GF7LQ7wnQWMxrZCkkwYvAME0ufhY2jdbyFDMZHbCBfWdbteWBVkLGPpjvkzt4Uj0
X-Received: by 2002:a05:6a00:3e29:b0:736:5ee3:64d5 with SMTP id d2e1a72fcca58-736aaaed79amr85196b3a.23.1741281607783;
        Thu, 06 Mar 2025 09:20:07 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG+tFxjMOU8QYHbNpJWXs7OJQKMk3Ok7HsvwzeRAonVT5P4nLFzbt5g+6v1CWcS27E7pCMP3A==
X-Received: by 2002:a05:6a00:3e29:b0:736:5ee3:64d5 with SMTP id d2e1a72fcca58-736aaaed79amr85152b3a.23.1741281607279;
        Thu, 06 Mar 2025 09:20:07 -0800 (PST)
Received: from jhugo-lnx.qualcomm.com (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7369820699fsm1612277b3a.23.2025.03.06.09.20.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Mar 2025 09:20:06 -0800 (PST)
From: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
To: quic_carlv@quicinc.com, quic_thanson@quicinc.com
Cc: ogabbay@kernel.org, lizhi.hou@amd.com, jacek.lawrynowicz@linux.intel.com,
        dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        Jeffrey Hugo <quic_jhugo@quicinc.com>,
        Jeff Hugo <jeff.hugo@oss.qualcomm.com>
Subject: [PATCH] accel/qaic: Fix possible data corruption in BOs > 2G
Date: Thu,  6 Mar 2025 10:19:59 -0700
Message-Id: <20250306171959.853466-1-jeff.hugo@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=EYQyQOmC c=1 sm=1 tr=0 ts=67c9d949 cx=c_pps a=JL+w9abYAAE89/QcEU+0QA==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17 a=Vs1iUdzkB0EA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=7nXvnx2kSAOllYvKTkUA:9 a=324X-CrmTo6CU4MGRt3R:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: 8o4F84-GJdLvW1vxzYUa_qrFSENySngK
X-Proofpoint-GUID: 8o4F84-GJdLvW1vxzYUa_qrFSENySngK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-06_05,2025-03-06_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 clxscore=1015
 priorityscore=1501 bulkscore=0 spamscore=0 impostorscore=0 suspectscore=0
 adultscore=0 mlxscore=0 lowpriorityscore=0 malwarescore=0 mlxlogscore=999
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2502100000
 definitions=main-2503060132

From: Jeffrey Hugo <quic_jhugo@quicinc.com>

When slicing a BO, we need to iterate through the BO's sgt to find the
right pieces to construct the slice. Some of the data types chosen for
this process are incorrectly too small, and can overflow. This can
result in the incorrect slice construction, which can lead to data
corruption in workload execution.

The device can only handle 32-bit sized transfers, and the scatterlist
struct only supports 32-bit buffer sizes, so our upper limit for an
individual transfer is an unsigned int. Using an int is incorrect due to
the reservation of the sign bit. Upgrade the length of a scatterlist
entry and the offsets into a scatterlist entry to unsigned int for a
correct representation.

While each transfer may be limited to 32-bits, the overall BO may exceed
that size. For counting the total length of the BO, we need a type that
can represent the largest allocation possible on the system. That is the
definition of size_t, so use it.

Fixes: ff13be830333 ("accel/qaic: Add datapath")
Signed-off-by: Jeffrey Hugo <quic_jhugo@quicinc.com>
Signed-off-by: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
---
 drivers/accel/qaic/qaic_data.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/accel/qaic/qaic_data.c b/drivers/accel/qaic/qaic_data.c
index c20eb63750f5..ffcdf5738d09 100644
--- a/drivers/accel/qaic/qaic_data.c
+++ b/drivers/accel/qaic/qaic_data.c
@@ -172,9 +172,10 @@ static void free_slice(struct kref *kref)
 static int clone_range_of_sgt_for_slice(struct qaic_device *qdev, struct sg_table **sgt_out,
 					struct sg_table *sgt_in, u64 size, u64 offset)
 {
-	int total_len, len, nents, offf = 0, offl = 0;
 	struct scatterlist *sg, *sgn, *sgf, *sgl;
+	unsigned int len, nents, offf, offl;
 	struct sg_table *sgt;
+	size_t total_len;
 	int ret, j;
 
 	/* find out number of relevant nents needed for this mem */
@@ -182,6 +183,8 @@ static int clone_range_of_sgt_for_slice(struct qaic_device *qdev, struct sg_tabl
 	sgf = NULL;
 	sgl = NULL;
 	nents = 0;
+	offf = 0;
+	offl = 0;
 
 	size = size ? size : PAGE_SIZE;
 	for_each_sgtable_dma_sg(sgt_in, sg, j) {
-- 
2.34.1


