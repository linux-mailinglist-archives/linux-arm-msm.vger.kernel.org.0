Return-Path: <linux-arm-msm+bounces-77245-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D6325BDABDC
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Oct 2025 19:09:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A6B671921D0B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Oct 2025 17:09:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E974E2FC007;
	Tue, 14 Oct 2025 17:09:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JbTfr9HC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 253E5302147
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Oct 2025 17:09:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760461772; cv=none; b=U9llemnz1KAEHCc7ZIFspenjfMp8QYT5sxNtd2sZVY4jZU14K3Xfn/uLYTkvP20S4IuRUHyvqPM7ZOfcl01nC3XUp2SRavqABOPgWfwhaKALP56K09efc6Hagkocdac1lllMqM5wRrzEgium62McXFL5qR3Oxd56MqWEA1fuN3k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760461772; c=relaxed/simple;
	bh=ozsp4jGopzIULlBxFM56GIwshBKjmjrq5s6/g7dJ1TE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Mwjjl/7scJ5ImQviZtIOXM8I0h6gOQ8RQ57a+1ZkYdWakHdwxN6CBa1mYc3S/oSnBL0/QLxdMJtmTQaMMEKMTbPYG686NXCONcGOJO/RKP5dCCruHYjadi86iPj0Ke6a627CM2KeVffeXjifJbu/UL4aBAOt7Gzmw3/H8IRz/ho=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JbTfr9HC; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59EFc9Ff008894
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Oct 2025 17:09:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=9/aGIvQBh2tgVTJBx/k6X5qPb12sbo+I0ay
	iwi1WVb0=; b=JbTfr9HCB77lwiJlMPZUendaEQ4Nh0o6NR5n99i9YgA+SBB7NwN
	fzxMvy0hDqe9wm7cV/iWekLsEX93t0/sLyTMOjs4FwHn60PWphXtaekO2mU0sX2j
	YfTt6IGCg2avMlI1vs9y8RB/D1ZeaD+vty1RuseNBoB6lsjUDa1wu9SPVvfdNPkD
	w/QNQLywPU3kqBniiQG45ABDhQYM63Fd8EUDVTdfbbThx4P0Xjjf8Zh1IdT1M9l1
	vTj4XDA7Dm8vvJ98NVeRYDzy/bUUDV/SPJe6CWdUBX3twRZaUX2YH44XrDtegGTd
	ooK3t2o1J5lQJwdr1rPWMMcYNLWeL4TZUmw==
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com [209.85.222.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49rtrt676q-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Oct 2025 17:09:29 +0000 (GMT)
Received: by mail-ua1-f70.google.com with SMTP id a1e0cc1a2514c-92ec0c21020so13890203241.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Oct 2025 10:09:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760461769; x=1761066569;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9/aGIvQBh2tgVTJBx/k6X5qPb12sbo+I0ayiwi1WVb0=;
        b=I8hHzWE5Ax6MNnhgjGxaQq68iB3QUdKA+95gKILBDGA9IjQ2NH+gq0aN5d+soLoqjh
         smB9W5S35yBWoKnxy1Pfs+rgi9M1zws4h083ldL6TsMxLJI5+VCYBiN1sUtp9I5YQ0QJ
         nYWh70dmgvnGEZSjrm691edYyYGDphGr1eXZPywj2BcMKuEkF8U9da8S0+F/fTatmXKM
         gKuQNcS+fx1EvnmGz3a2AoDx20p9KtoUXVTzKMHA2ryyPMhicDYVJZdg6JBNtlNjYjL3
         RoP/ZNp4Qjr+GgaHZZl5L0aIN5sXIM896+atfmEmMdo1OdeDCVcPaK5yroTUntlohR1u
         ak4g==
X-Forwarded-Encrypted: i=1; AJvYcCXWoneVVfTLEOVSFYcFsz1zwh3oSI1C1IG6CjP3u/TU7jiao9q2HkPkNnpL1Ml39TOpLml6zxMMKVcdIzXU@vger.kernel.org
X-Gm-Message-State: AOJu0YxHKFsX04SJ9Zo3p5I3IXuNia0EzQdMkjFd1WTEor0JmBWomzjF
	mEjVUWbRPnr2ZJrgW4n4aSd4YLXjqktxJyshBtfqNSn+Q7XLbwKA59YobDS2+vPqpdSiPSygJLe
	6VRRe+Xim2ZrFbgGzguSlarjjZGwj+J6z7JqDdX81fhtFC8PMR3K9Rht3iB0/nWv+hWbC
X-Gm-Gg: ASbGncua1CppUj8WVgLBordOQBp6ps+zE8yNQDloKJ4+tYaGNDHGUbdlKu8zNkLd4eJ
	PEakq1i8h+oIW/7LQfhKlFCI9Y52P5CZD2qqJP70RAV19bCnBzNZTB45o+WfG8EQL1u+B8j7eun
	nRL689JsYt6p4JkPAS9bmd6Pj3O46djSlgJnAfGKtRK0MsVGZxSAUoqyIudjCIuZ+CLIY2crCLD
	9KdqozLmztC2Iznybqkt2rUfMq42ETQtPdFUHHLcQTfczvP4JFWqH8O718Td+gBYrnbWd08LNMX
	3CT4I6GxWmcKhTLIjomeDArHZEhbMOWWGriwEVfisjCkJF2c9kw4/+1uJoZcXXpSKo6if98YYyA
	csfta
X-Received: by 2002:a05:6102:1492:b0:5d6:2bec:755e with SMTP id ada2fe7eead31-5d62bec9904mr2583458137.28.1760461768772;
        Tue, 14 Oct 2025 10:09:28 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEXAfETHk/CmL+i87ZoiPrIrtzgvDwckjo6RH7ob324bDEk0qZkd9yIqKWCVtoEhfHJcvnN/w==
X-Received: by 2002:a05:6102:1492:b0:5d6:2bec:755e with SMTP id ada2fe7eead31-5d62bec9904mr2583447137.28.1760461768317;
        Tue, 14 Oct 2025 10:09:28 -0700 (PDT)
Received: from hu-yabdulra-ams.qualcomm.com ([212.136.9.4])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-63a52b0f358sm11452431a12.10.2025.10.14.10.09.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Oct 2025 10:09:27 -0700 (PDT)
From: Youssef Samir <youssef.abdulrahman@oss.qualcomm.com>
To: jeff.hugo@oss.qualcomm.com, carl.vanderlip@oss.qualcomm.com,
        troy.hanson@oss.qualcomm.com, zachary.mckevitt@oss.qualcomm.com
Cc: ogabbay@kernel.org, lizhi.hou@amd.com, karol.wachowski@linux.intel.com,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org
Subject: [PATCH v2] accel/qaic: Use check_add_overflow in sahara for 64b types
Date: Tue, 14 Oct 2025 19:09:27 +0200
Message-ID: <20251014170927.3908383-1-youssef.abdulrahman@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: xH1JEBtm7tDi1J75NCclpJYuYwuQT38G
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDEzMDAyMiBTYWx0ZWRfXyhNjeolIs0wJ
 hznTfg/KQxqr0cuhpN8fm8mfPiytqB4NB0vwmTyyyljK86qdKtlaarXGJ6lFyU/o948jwAoMMUK
 6nrUQbuERYT/7K/mgL4Ksq0OkNaJui8aPV6K/VdtFgPKCuV8bG8STnhIAYaVVy6NUXFvxmKuD0E
 OUpXRNnZaVC7925sKVj7kkcBSpz8/a5UPHKbPyHDdZ+ptu82ByVE9ly6sGxM0O5MwCy6cUavgVS
 U7z/I9csap4AE3ACWjqSs5ntqo1K2OPiyp2SrS3iqYPqBazp5QsJy8MfBsJLJbsZ6972ToNzvWp
 VjtWqpM0ki3MXiLaKBaIIkTJNTQe18yTEi7KhSPNKhnuB2SLeoMgpYJ11QB+OXEaZl/QQu6jatQ
 KMkXxBeUM3s5o1qhyu90YkAVTZS4vQ==
X-Authority-Analysis: v=2.4 cv=SfD6t/Ru c=1 sm=1 tr=0 ts=68ee83c9 cx=c_pps
 a=R6oCqFB+Yf/t2GF8e0/dFg==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=EJfbDqG2qL1ptMKNElEA:9 a=TD8TdBvy0hsOASGTdmB-:22
X-Proofpoint-GUID: xH1JEBtm7tDi1J75NCclpJYuYwuQT38G
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-14_03,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 adultscore=0 phishscore=0 lowpriorityscore=0
 bulkscore=0 impostorscore=0 priorityscore=1501 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510130022

From: Zack McKevitt <zmckevit@qti.qualcomm.com>

Use check_add_overflow instead of size_add in sahara when
64b types are being added to ensure compatibility with 32b
systems. The size_add function parameters are of size_t, so
64b data types may be truncated when cast to size_t on 32b
systems. When using check_add_overflow, no type casts are made,
making it a more portable option.

Signed-off-by: Zack McKevitt <zmckevit@qti.qualcomm.com>
Signed-off-by: Youssef Samir <youssef.abdulrahman@oss.qualcomm.com>
---
Changes in V2:
- Use explicit casts with check_*_overflow() calls
- Replace min() with min_t()
- Link to V1: https://lore.kernel.org/all/20251007154853.417114-1-youssef.abdulrahman@oss.qualcomm.com
---
 drivers/accel/qaic/sahara.c | 21 +++++++++++++--------
 1 file changed, 13 insertions(+), 8 deletions(-)

diff --git a/drivers/accel/qaic/sahara.c b/drivers/accel/qaic/sahara.c
index 3ebcc1f7ff58..0591faa25e00 100644
--- a/drivers/accel/qaic/sahara.c
+++ b/drivers/accel/qaic/sahara.c
@@ -538,6 +538,7 @@ static void sahara_parse_dump_table(struct sahara_context *context)
 	struct sahara_memory_dump_meta_v1 *dump_meta;
 	u64 table_nents;
 	u64 dump_length;
+	u64 mul_bytes;
 	int ret;
 	u64 i;
 
@@ -551,8 +552,9 @@ static void sahara_parse_dump_table(struct sahara_context *context)
 		dev_table[i].description[SAHARA_TABLE_ENTRY_STR_LEN - 1] = 0;
 		dev_table[i].filename[SAHARA_TABLE_ENTRY_STR_LEN - 1] = 0;
 
-		dump_length = size_add(dump_length, le64_to_cpu(dev_table[i].length));
-		if (dump_length == SIZE_MAX) {
+		if (check_add_overflow(dump_length,
+				       le64_to_cpu(dev_table[i].length),
+				       &dump_length)) {
 			/* Discard the dump */
 			sahara_send_reset(context);
 			return;
@@ -568,14 +570,17 @@ static void sahara_parse_dump_table(struct sahara_context *context)
 			dev_table[i].filename);
 	}
 
-	dump_length = size_add(dump_length, sizeof(*dump_meta));
-	if (dump_length == SIZE_MAX) {
+	if (check_add_overflow(dump_length, (u64)sizeof(*dump_meta), &dump_length)) {
 		/* Discard the dump */
 		sahara_send_reset(context);
 		return;
 	}
-	dump_length = size_add(dump_length, size_mul(sizeof(*image_out_table), table_nents));
-	if (dump_length == SIZE_MAX) {
+	if (check_mul_overflow((u64)sizeof(*image_out_table), table_nents, &mul_bytes)) {
+		/* Discard the dump */
+		sahara_send_reset(context);
+		return;
+	}
+	if (check_add_overflow(dump_length, mul_bytes, &dump_length)) {
 		/* Discard the dump */
 		sahara_send_reset(context);
 		return;
@@ -615,7 +620,7 @@ static void sahara_parse_dump_table(struct sahara_context *context)
 
 	/* Request the first chunk of the first image */
 	context->dump_image = &image_out_table[0];
-	dump_length = min(context->dump_image->length, SAHARA_READ_MAX_SIZE);
+	dump_length = min_t(u64, context->dump_image->length, SAHARA_READ_MAX_SIZE);
 	/* Avoid requesting EOI sized data so that we can identify errors */
 	if (dump_length == SAHARA_END_OF_IMAGE_LENGTH)
 		dump_length = SAHARA_END_OF_IMAGE_LENGTH / 2;
@@ -663,7 +668,7 @@ static void sahara_parse_dump_image(struct sahara_context *context)
 
 	/* Get next image chunk */
 	dump_length = context->dump_image->length - context->dump_image_offset;
-	dump_length = min(dump_length, SAHARA_READ_MAX_SIZE);
+	dump_length = min_t(u64, dump_length, SAHARA_READ_MAX_SIZE);
 	/* Avoid requesting EOI sized data so that we can identify errors */
 	if (dump_length == SAHARA_END_OF_IMAGE_LENGTH)
 		dump_length = SAHARA_END_OF_IMAGE_LENGTH / 2;
-- 
2.43.0


