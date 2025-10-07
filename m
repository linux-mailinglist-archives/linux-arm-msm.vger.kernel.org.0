Return-Path: <linux-arm-msm+bounces-76234-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B0725BC1FC2
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Oct 2025 17:49:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0EF6A3E212A
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Oct 2025 15:49:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C4A692E6CB9;
	Tue,  7 Oct 2025 15:49:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mratWkzF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F5F72E62B7
	for <linux-arm-msm@vger.kernel.org>; Tue,  7 Oct 2025 15:48:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759852141; cv=none; b=MWv8+7PB9h8QQQ1XMO4ORMUhS3MEy9OrTssDbZlMEgCOlLSiDyL+kHpNvyOGbv7RK6bC9ww0eugtO3qO87UlfBMmn42Tme+o7r3eL+DiL2QkFF1IsY5OQo9koGjZWIGcTFrtDPtd4DfdT71+yvbhDYBZaxThC4iwv5a25XnRDWE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759852141; c=relaxed/simple;
	bh=mrXcZwq/+r+SJfx63O8BhYkpU/3sG7v+cuYQfENFMqc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=NA2jLJ7eQbrAntKTGN0wpRz2CNoC8Rz3B+ZNUaFIdiGzXaJwENnwhrfEe/pY+2xB1I9/i7hCwZRV4Ng5PO1pIdvOYLRTznYNtpswWxgpQ1eFdGhXrrF/TK/nvelxo7CCpAclTtm6WKANUxgsGQvMyDMoaTRsem+vXrw9AhLBWCo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mratWkzF; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 597ETA6e026886
	for <linux-arm-msm@vger.kernel.org>; Tue, 7 Oct 2025 15:48:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=c1qjRY3op/gn+0IA/O7osTr6HSBwDe8NnsP
	7uHQvcXY=; b=mratWkzFMolEnezgEQ82zafjGcVNRzkZbXXyEON0A/UyCRnbgVu
	J4eb/p4Cqnz1qsFLQu0tQtdEQnaOzlmY9hg0N2eyBmrToxqCVawCkiHS0RtdgYrb
	yoJYZmnyj5iAG2hAw2R6OfHZlE7kDHD9vk2wKI/m8kVJA/SyFrlYM1vNJz8Mbt0J
	MqxRZAq+DHdWTrdvmCC20H04PYCur9jpwOvYyuJer5dLyOLBEqrTY9IgoRksc3NT
	cSYYeqbdKul0MUKRVRgL7mTX/4s1YWVABkvNA+KccI13HW2osJKWEg1pPFwBWMit
	WA+rn+KbAxGepArRNpDHd7VpvNeU4vxx6AA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49mgd0kgpg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 07 Oct 2025 15:48:58 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4e0fcbf8eb0so159539651cf.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Oct 2025 08:48:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759852138; x=1760456938;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=c1qjRY3op/gn+0IA/O7osTr6HSBwDe8NnsP7uHQvcXY=;
        b=aMOytWDMJhhguiexpYvTDSdslRCZ0DsIpJrI8j/XIxcluBYG1mymvEWp9ct5FfBh/0
         O11jGYFP78us7fkhB5K5qc2pk5bwu3hYZCtjl3Y7TrTO6fpUbpsPjN/aCfG9Un4BhyX1
         MT7/APSllf3awRFDddxqhWNSvjA7yOegUCoSgx1Sq1IuAKFSX7bIlqra0DrtcwK4xENv
         KM+82UXetJUj00iMpCguNJWcb8jaai8mW6IsVXOscFpyIYIoQmuc5bUGi1DFT168Yi5Z
         ATZQCOxSlOSQu4AbyS3xVKLi2QPtZjEYhitYswLrCyWKnCINibE6+ytT4uUye1SU88Kw
         a7Yw==
X-Forwarded-Encrypted: i=1; AJvYcCX1GfZlD0DqApAJFlU0u/fSymbMPeAJOeDyTgnmPuKdX48rG/u7JWP15+2hFhakdEnbeIWITRTMBXgmgxee@vger.kernel.org
X-Gm-Message-State: AOJu0YwGIPwVYPSYPY9FjQy7wmFAk15tMpLSvGV6Cwkuz48FHciWWOi6
	MzYcosJ4nmqrImoiy2qHzkETv5EUuz3b+FPFxzbJUtIZSFMEHo7hPM9o503oCS+5iYDBzh7UBYH
	6WLWVyG2l/grr99Evqnbw3g/dfD34VKuXv8I6lqQ1IuwPS/bN5GAK4pSQCqjIG9j2z4yk
X-Gm-Gg: ASbGnctap4mjBXSM3wh8Fk7j9sIoJYB8dCH+/361453z2VXFsgML8u7y5I2LrmGDJQA
	b3kv6jmqbEaTVrKCHG0d3SyrV+m0gjXOv9JnqNvtUg+1eIPO8SwdIBhEgV+5Jyz+QLGfYD61GKg
	Xo//YNgW45enk4rDck79w0mm41RRlUA+Bnlhyw6xMLuayP16XqL+/Mb4QZ3w5onSL1ws2FeCEsX
	w5IWMbri2j0S5c8pss2q7IbdZbG4kokRxriOs4gHZlJxOWgGHqNnA8eBAVzSB0tnBT0x5VBwEpi
	Rb7NKkTGNIwr7jFE+bEq3uvNR/QF9vZGwqlXKIfOpYHNogldL8hpKw/pdCY7BtsHdggxaJ7bDrZ
	eAAcRsiT62g==
X-Received: by 2002:a05:622a:58cd:b0:4db:7bc2:92b with SMTP id d75a77b69052e-4e576adc4d0mr257098691cf.42.1759852137106;
        Tue, 07 Oct 2025 08:48:57 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHRAe8BoC+LGCEdh5x4KPB9T7OtWd3E2I/TUO6+zj8+KMfcpjopZ8RHzlCMwMHMOajcgRmY/A==
X-Received: by 2002:a05:622a:58cd:b0:4db:7bc2:92b with SMTP id d75a77b69052e-4e576adc4d0mr257096581cf.42.1759852134856;
        Tue, 07 Oct 2025 08:48:54 -0700 (PDT)
Received: from hu-yabdulra-ams.qualcomm.com ([212.136.9.4])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b486970b32bsm1457499866b.50.2025.10.07.08.48.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Oct 2025 08:48:54 -0700 (PDT)
From: Youssef Samir <youssef.abdulrahman@oss.qualcomm.com>
To: jeff.hugo@oss.qualcomm.com, carl.vanderlip@oss.qualcomm.com,
        troy.hanson@oss.qualcomm.com, zachary.mckevitt@oss.qualcomm.com
Cc: ogabbay@kernel.org, lizhi.hou@amd.com, karol.wachowski@linux.intel.com,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org
Subject: [PATCH] accel/qaic: Use check_add_overflow in sahara for 64b types
Date: Tue,  7 Oct 2025 17:48:53 +0200
Message-ID: <20251007154853.417114-1-youssef.abdulrahman@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: FnV-dydIEyvQs7tj7gmpdUTG2CKSPzoE
X-Authority-Analysis: v=2.4 cv=T8aBjvKQ c=1 sm=1 tr=0 ts=68e5366a cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=x6icFKpwvdMA:10 a=EUspDBNiAAAA:8 a=tuiY0EAVXOpYqngSybMA:9
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-ORIG-GUID: FnV-dydIEyvQs7tj7gmpdUTG2CKSPzoE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA2MDEyMyBTYWx0ZWRfX0ykxNy9tLsuf
 RefT03JaY1NilD8/wvK85hZb2X8gUNl2kxlTFIb8V4BkL7x8FizufG8irbrq7mK1wHCzzhOLmCX
 DveD4/djBasNGPM9/AK1gPoWCsNRLh+BUj/kiFRRFouqtLLKfQJPLIvE0qEEUry8vmBcoE/KruD
 hJ+25WPZSCwUAdXHTUVH02I/zKT5U3vm4zEbLrie5zz98Fw9KKNgAKRmJ90VJp/O7Er6P0c3ujs
 4RBY3r0inO+Bq34YyK20McLOrcz7ZFjcr+7RDaWZS0qBhde3y5bA1xTVby9xZmsaNXhiCJG14MF
 ByqSozxBnksF0nI0abj7mRQkfwDo1Xv3ikG/d2bgjdMp3QFLwJSoFyPdplzrpehelp62tOb2hVf
 A/NzhybzSsJPjaRkxkljUoCMedNFbA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-07_02,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 phishscore=0 clxscore=1015 priorityscore=1501
 impostorscore=0 lowpriorityscore=0 suspectscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2510060123

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
 drivers/accel/qaic/sahara.c | 17 +++++++++++------
 1 file changed, 11 insertions(+), 6 deletions(-)

diff --git a/drivers/accel/qaic/sahara.c b/drivers/accel/qaic/sahara.c
index 3ebcc1f7ff58..9765da1f2312 100644
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
+	if (check_add_overflow(dump_length, sizeof(*dump_meta), &dump_length)) {
 		/* Discard the dump */
 		sahara_send_reset(context);
 		return;
 	}
-	dump_length = size_add(dump_length, size_mul(sizeof(*image_out_table), table_nents));
-	if (dump_length == SIZE_MAX) {
+	if (check_mul_overflow(sizeof(*image_out_table), table_nents, &mul_bytes)) {
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


