Return-Path: <linux-arm-msm+bounces-77452-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 868D2BDFC68
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Oct 2025 18:54:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 3925F4F1DEF
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Oct 2025 16:54:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 92DD925333F;
	Wed, 15 Oct 2025 16:54:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Y4doWy8p"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD7DA2ED853
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Oct 2025 16:54:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760547254; cv=none; b=P1Bmbyc+AeGCb4YBKf+4iK7NqgwQ+HEJEF1pH7hOFerdanhuKKoE2zfLhahIFd9JNA9FhbT+xUHceaFGCg3n5I5kyKg6dOwBQcxSy48/fFZWvXpS8pcsjay245LYSLt6m1/hmjYsgFHVrUfpk7XptyLt0MzcKv9FJdh2awYgwP4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760547254; c=relaxed/simple;
	bh=vKTabf1FkBnPwJLk3Dz8z3soy0NQ1zcviYhPbV0OzYY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=sdfKP6fYJTw06bMZ8f1Pc1fvL6+OFP7qfxVdm1FckoZWWyXM9L9MFEFkmvvt4hIbzyU0Ge79ecgYA8Ec3OaOnh2WUSZB68TIWOpCIdYEf808LWQZth+EZcsisXDbp3rJg+tQTVD4IgYfAWkEzDAsf1o8wKcGBUirgeu3XgCth5Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Y4doWy8p; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59FAUocg003404
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Oct 2025 16:54:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=UMM9PuJ2lRpfyxHawkG9j4m1D9oD1iAKwRU
	T2udZ5x0=; b=Y4doWy8pxA9wf1/0BSOrHyAf3DfePZ+8ca4jGUyoLJmiBUbp8CZ
	8i70Y+H9FuS0v+f3AB57ieeQCFPDGXe3CAugvqO3U11S+zkNAbpF2P9SRDvTd7fX
	Q8cnvATEjS41o4WnAaGtdIZbWHu6hmNfgDjy1iEd+YW6yoEZx0LH7tGZg3xzSjet
	TAaLt84jgfOZcy7Fq/51Jg6fBnZrvvWYPwlGSU6IgC7knFGIXWMiMW5SfjNB9/fi
	Wdwwp3Bt+RVe21SBD9UBSwBn2f79LTEyqSO4X/6nRtvAnuobmsRsS/+DdwQYfhsh
	zjGohuyuGqSdzDqUaOxCkl5m1NdY15koKHA==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49sua8kvxk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Oct 2025 16:54:11 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-8741223accfso386827186d6.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Oct 2025 09:54:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760547250; x=1761152050;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UMM9PuJ2lRpfyxHawkG9j4m1D9oD1iAKwRUT2udZ5x0=;
        b=FPAjTmnUUC+wlcF8774g8EMEH4pn3JmOh2dNFTEYIJRHwank1BRmhRvtPP1bZR1Qao
         i3Bt82W+E74rMWtLcNOxcqMOIGm8DrocLLKPyO6xJwJSpp1zfAGhou5gCSzX/BDql9U7
         EKWo/G1TyqFJPZAfReB/SbjSkUSPA4+5lLL6XeQVWt/4IZdSviwbVV7d3ZwxSEGKPM7W
         DP76HIA8Ej3DjabYUOe8wcURrqgOIU3bKYmREL7vcDPgA9w7UL/mW+EXiTkhZMXv5WfH
         czYsBC9Hv4l0jjFu9pZdPgzmc7hq6CKk13FGSJogmij6at9AWJwn2nvOae1qBW5VCdGl
         5CsA==
X-Forwarded-Encrypted: i=1; AJvYcCUb5TSKU9Ydr8hi/EmIm5h2nwT3joleTBhWpJlSEtCeFWo21CxcQMlJU1ipIT/4Fcqp2POTskCIQu0E4Bbe@vger.kernel.org
X-Gm-Message-State: AOJu0Yw9mth5elEjNF/z+XyrdDxOsEtv39Aa6S85F+abmkYj4pxlJ8cq
	3p2hla/lzoLOZgCS9+UyzatGJnpVGQi+jisJBoo/OdmjVs/EGNnFK4Jdzw6D5NLrSim4+id19sm
	NBsviiF5GLd9I4h+FH1CcUcPq+vVFrhFPw0fD7rZxPI99J1zlbJUee4BJdDRBx3D08v81
X-Gm-Gg: ASbGncs/3AbpE/gz7we6XlS1rYXRXFV8B0hsJt/FEVJU6elkz6fpekck6pCaKhtFjVs
	ZkgYXwj5ogP/aQiD86ay/j2odlj31BIo4KyMuIPVVuUVshcXlXALn4Zod6a42CMVeG8TPhrwGSX
	+9RQYKDujPs7XVN8I1GqBt78qH2wMp4D+T9UExAG61DaQKCmz5iJCM0iIvoOF0a7ridbHBuUXCe
	n6J3xtdO1fR40tgCJEEOBkrqTyXS6IwMWmKb2e10J61TCnEb5SqFuTQrI4H3kx+aS6KCwn61TQl
	6EzB75k34M4dDjkqad+rIAEwD+vQp/togTiwuqwm959hzqghpjING0ky5eSKgjl4GcR5p3xmLpa
	zvFj1
X-Received: by 2002:ac8:5905:0:b0:4dc:5ab:6d7b with SMTP id d75a77b69052e-4e6ead65026mr360871761cf.65.1760547250523;
        Wed, 15 Oct 2025 09:54:10 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFdnfbBlKzfjih9LMH5x6zwOdq1Ehq7XA62QcL8Ycn259PSie/gSkvXaQIk9+WUoeS5VTiJ6A==
X-Received: by 2002:ac8:5905:0:b0:4dc:5ab:6d7b with SMTP id d75a77b69052e-4e6ead65026mr360871411cf.65.1760547249913;
        Wed, 15 Oct 2025 09:54:09 -0700 (PDT)
Received: from hu-yabdulra-ams.qualcomm.com ([212.136.9.4])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b5ccd6b9596sm270960566b.80.2025.10.15.09.54.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Oct 2025 09:54:09 -0700 (PDT)
From: Youssef Samir <youssef.abdulrahman@oss.qualcomm.com>
To: jeff.hugo@oss.qualcomm.com, carl.vanderlip@oss.qualcomm.com,
        troy.hanson@oss.qualcomm.com, zachary.mckevitt@oss.qualcomm.com
Cc: ogabbay@kernel.org, lizhi.hou@amd.com, karol.wachowski@linux.intel.com,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org
Subject: [PATCH v3] accel/qaic: Use check_add_overflow in sahara for 64b types
Date: Wed, 15 Oct 2025 18:54:08 +0200
Message-ID: <20251015165408.213645-1-youssef.abdulrahman@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: QQcZfNQhM_ApnbLE-9cIPvJvqIzga9U0
X-Authority-Analysis: v=2.4 cv=e5MLiKp/ c=1 sm=1 tr=0 ts=68efd1b3 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=HRjgDChM0F6sfIyO2f4A:9 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE0MDEzNCBTYWx0ZWRfX+OFQfNuEyMSB
 kNyjFPh/RiH0MHWggef/1nHHMd4I5tRwZJgLcTStjp+WckFK/9Cl3jHtxSQNPtoWoBDmrAkVhVD
 +qt9QFWkm6PETC4BQ79zFnhYvv/gKpewWNPvz0Av0M8pV9bqYRaIXW3nzht5iYGHj2akw6WGdbN
 aG31njNhvbt82HqBrSlpPLj+GUccb3+8luarOhJ9Fs+URf1iu7tLdyBZ2B/3N4p2RptJI7eoDek
 mHAPRQj7mF2UPoQRHQ0ZImYz3m7E9iKgAXd4OOcq8TLwazAtbdsN8FKvmL5fYrGaGuFZeMbmWIc
 DtExnjPEC6RU956zxxwrhKu2fLHDMS7BSdIQeIdQPYb1ynR4WHdIkvCGk6mJBFdXC65E3pqH+uj
 UF6xYGiwHFAf/O+MbM1bUh8zBXBjxw==
X-Proofpoint-ORIG-GUID: QQcZfNQhM_ApnbLE-9cIPvJvqIzga9U0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-15_06,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 spamscore=0 adultscore=0 clxscore=1015
 priorityscore=1501 impostorscore=0 malwarescore=0 bulkscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2510020000
 definitions=main-2510140134

From: Zack McKevitt <zmckevit@qti.qualcomm.com>

Use check_add_overflow instead of size_add in sahara when
64b types are being added to ensure compatibility with 32b
systems. The size_add function parameters are of size_t, so
64b data types may be truncated when cast to size_t on 32b
systems. When using check_add_overflow, no type casts are made,
making it a more portable option.

Signed-off-by: Zack McKevitt <zmckevit@qti.qualcomm.com>
Signed-off-by: Youssef Samir <youssef.abdulrahman@oss.qualcomm.com>
Reviewed-by: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
---
Changes in V3:
- Remove the min() to min_t() changes
- Link to V2: https://lore.kernel.org/all/20251014170927.3908383-1-youssef.abdulrahman@oss.qualcomm.com

Changes in V2:
- Use explicit casts with check_*_overflow() calls
- Replace min() with min_t()
- Link to V1: https://lore.kernel.org/all/20251007154853.417114-1-youssef.abdulrahman@oss.qualcomm.com
---
 drivers/accel/qaic/sahara.c | 17 +++++++++++------
 1 file changed, 11 insertions(+), 6 deletions(-)

diff --git a/drivers/accel/qaic/sahara.c b/drivers/accel/qaic/sahara.c
index 3ebcc1f7ff58..351348f06755 100644
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
-- 
2.43.0


