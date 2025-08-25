Return-Path: <linux-arm-msm+bounces-70613-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C492B33C74
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 Aug 2025 12:20:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E63E93B13A8
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 Aug 2025 10:20:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D6CD2D12E4;
	Mon, 25 Aug 2025 10:20:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="X/tPbqlU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B03E2DD5F6
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 Aug 2025 10:20:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756117211; cv=none; b=TDoonHcE8x7opMmvylBUbjYae7Jsz0+hEYAyRV5lanxB99g59GRmTh6hFE9aj+VKQTQQgedCj0owyS2cSRcscoOWS0K3f3k3Wxxkk67c3rQwe1Y0yQggLhTuOPCTm3i0mblZ72ao9AERMCXKTW3QsLcsT30+DltQYAQEgrYyZxM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756117211; c=relaxed/simple;
	bh=weRJP8dvi67AXWJR3AgIsx5s5JxG2FucJvV20dN2d6o=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=rbEdXa5fITeInazrsJGKV21Q659QzMw23cHKj3QvmgYslNoPf992C138eaCpEq03DF0lIOy5TE8RRECbIkzNCjZQX+BxfVjMSf3ccRFCDl331YvCNm9Wd50FK63+QyHOp2m50vm+3293AORn2V7/HeUWEsq8XXDRlpzHBvx/iXo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=X/tPbqlU; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57P8Owig026509
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 Aug 2025 10:19:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=/4KiBLe9hDQ
	CdlEVn0uohK9SB8XQeh2aSguKNMJLWgM=; b=X/tPbqlUI0AT82er9Hm8aOKPFD4
	tw+sc78NvPVA5FIkj6ELCjy200L9zeR05jwxSjaoQZ7lQt56ZZ0G1Y9zzlvJVhiH
	yR5ywBoi1lvEA3REIJ7hMmNRwzTKG24PWFXpW3Yx5vEqZktLpTPOMl6jUnBIfqOj
	JpOL/zPJmt5L2aiClH0rzsx+kUduOSmy7B4asrAry+Q38NwzVSPruMe9ZNZmN30I
	TWP+e4JOWnJH5HPmK/iEHvdj5z0TRUul96nwgdTc/12y2JFPG0jPtUrclQoggxE/
	joQtfSvUeItKcTlS1cJhmOZ1oOJ9v/rPZUSr8L+zzzFf/n0dwkr2oqJXdsg==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48q5y5cmyu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 Aug 2025 10:19:59 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-244570600a1so49399675ad.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 25 Aug 2025 03:19:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756117198; x=1756721998;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/4KiBLe9hDQCdlEVn0uohK9SB8XQeh2aSguKNMJLWgM=;
        b=lkmFdI8nAKAUVvuZmfXECJTrxXgPXmtxXh1rjR8bXmoDje/E2g04Ud6qXB8hPAizIt
         D9XLz3NSUhqJ5KjLivTlioyfGBd9fY22PPgJcabKXxjZgycSPEl6KijDeLsRrOhJ0C/x
         gv8t5UHdDCG7Ip7NlXmNrxHru6CBn2g3n964SLzZB5+HKeJyP/gEntHdbiIHqeXnsgtu
         sLAitQf/5570xq1tqyZ8HFc9Va9D3ZJ4gijqp4Tona8286+UJYYvo/Jpkdr403n2YMoQ
         M4WMGSfOwAkqV6ept24ih2WZOJfXFwVz4fXy3Vccl261ypa4JfXJijNk38BR86MnwVi7
         /IwA==
X-Forwarded-Encrypted: i=1; AJvYcCW56ZlteF+GJimREeel1w2iHsnEzxnq1x97+qIn46z8yvW1k/bmWonoJGAADFbGVVO/YFZGAoEUNXP5mpVr@vger.kernel.org
X-Gm-Message-State: AOJu0YyEoQVyFAKdTaDI0dHyLmNUuQlxgqUfpgnyhJudTHkkh7nJPAwC
	IFuvsT3u1qPQVJM0oWghNoYszbOJzmfTZMnF+lOSzF1eju4RLRj9pUlaiwwkhWem4f+5uqz4fb6
	ROU7v3rohyWk4jFvVMe9gJt50iCWzZvPX4Ser8sP7VEVxqq82nzGlGOBikdPjyTGciQ40
X-Gm-Gg: ASbGnctJ4L7Dj8usQvBwJ9K2O8+SzlS59i2MAHSlD7nrfLjG/DRMagO90MKcWpEzi0R
	ey7gQ/GbHWL/7Bpr9UH3TJBaC0hKx7BLs4PnPMmoa96k1AYbkHZHpvFwYy8q86FJkyt5q/iVusu
	R4enaBQ5BxHVFNk/FBOjYNElFEmXXOHoC2tgn0DhqZ0q62uI23uOay2k1JqNyLSoCBZXgQx8CAo
	srI7dUMnXnMtuzyephu9D33TjfGChxbRnhDs3IhaeY3MvKhoSBGqK8ylte5qQbsm9tfvelIZtN4
	Sn3DLH/kSfIGvXfyT/itzvYquwbZ9+hiH6Ziz6GZtY8Pvh7BEtuow68+MDVaApllHz7fqw==
X-Received: by 2002:a17:902:ce03:b0:234:325:500b with SMTP id d9443c01a7336-246337abb11mr126699165ad.22.1756117197760;
        Mon, 25 Aug 2025 03:19:57 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGqffbMCsKB37vuObKu3XD8rVGWzAo11i0anSJThfMyo1042Hmm4IAPAE1O8dCgcOF6bUUCrA==
X-Received: by 2002:a17:902:ce03:b0:234:325:500b with SMTP id d9443c01a7336-246337abb11mr126698875ad.22.1756117197237;
        Mon, 25 Aug 2025 03:19:57 -0700 (PDT)
Received: from hu-batta-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-246687cedb2sm64540585ad.68.2025.08.25.03.19.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Aug 2025 03:19:57 -0700 (PDT)
From: Kishore Batta <kishore.batta@oss.qualcomm.com>
To: jeff.hugo@oss.qualcomm.com, bjorn.andersson@oss.qualcomm.com,
        konradybcio@kernel.org, konrad.dybcio@oss.qualcomm.com
Cc: andersson@kernel.org, linux-arm-msm@vger.kernel.org
Subject: [PATCH v1 09/12] drivers: soc: qcom: Remove is_mem_dump_mode variable.
Date: Mon, 25 Aug 2025 15:49:23 +0530
Message-Id: <20250825101926.2160554-10-kishore.batta@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250825101926.2160554-1-kishore.batta@oss.qualcomm.com>
References: <20250825101926.2160554-1-kishore.batta@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIzMDAzMyBTYWx0ZWRfX5kYME1OJhhu9
 c79kmMIYUM0bUBaU1ofiFB6tI8x9BhrqC+8M2O/EePfqkTSaGuk56Ru6InaQxy6l9iALXZzQHIP
 yefBXgRkInl2lbiNlLix27BMV4p4TRjuZ+K6+aoYcTmxOte/3zsMIa3QCw0k3PwY4omDa8Bz+/5
 WcptsWsknFrP7ZG26uWSGdSryF/JEU0pp/gHeQMZ4vVux4ylEQbNsKvTxb6IZvJkYCMDtoiVhws
 HGO8CLAiBIDD0pQ3ee/4SM24Hk8SbBnXMu/AmRk0vT8yyZYYKW2kXbI/26v2gnROgrr/JrqVqNM
 NkyH6xz4/NpaBYvvOhh3smPixPkcsTItQUGOijX79edfFTL0T6SkkhxwK3WiLcMacSDtSn3Uo8o
 x7ZPRRAb
X-Authority-Analysis: v=2.4 cv=Lco86ifi c=1 sm=1 tr=0 ts=68ac38cf cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=sj6VEsz_OozN98jaJmIA:9
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-GUID: k_3G5C0AgbhWLCI0qKEEdbnV6FKz7mN3
X-Proofpoint-ORIG-GUID: k_3G5C0AgbhWLCI0qKEEdbnV6FKz7mN3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-25_05,2025-08-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 clxscore=1015 malwarescore=0 spamscore=0
 suspectscore=0 phishscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508230033

Sahara driver now has "sahara_mode" enum defined. So, the variable
"is_mem_dump_mode" is redundant. The mode of sahara is set to
SAHARA_MODE_MEM_DUMP wherever required.

Signed-off-by: Kishore Batta <kishore.batta@oss.qualcomm.com>
---
 drivers/soc/qcom/sahara/sahara.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/soc/qcom/sahara/sahara.c b/drivers/soc/qcom/sahara/sahara.c
index 84327af48569..81d9b40d0f92 100644
--- a/drivers/soc/qcom/sahara/sahara.c
+++ b/drivers/soc/qcom/sahara/sahara.c
@@ -193,7 +193,6 @@ struct sahara_context {
 	u64				dump_image_offset;
 	void				*mem_dump_freespace;
 	u64				dump_images_left;
-	bool				is_mem_dump_mode;
 	enum sahara_mode		current_mode;
 };
 
@@ -302,7 +301,6 @@ static void sahara_send_reset(struct sahara_context *context)
 	sahara_data = dev_get_drvdata(&context->mhi_dev->dev);
 	sdev = sahara_data->sdev;
 
-	context->is_mem_dump_mode = false;
 	context->current_mode = SAHARA_MODE_NONE;
 	sdev->receiving_trng_data = false;
 
@@ -515,7 +513,7 @@ static void sahara_memory_debug64(struct sahara_context *context)
 	 * of the dump are that we can consume.
 	 */
 
-	context->is_mem_dump_mode = true;
+	context->current_mode = SAHARA_MODE_MEM_DUMP;
 
 	/*
 	 * Assume that the table is smaller than our MTU so that we can read it
@@ -971,7 +969,7 @@ static void sahara_mhi_dl_xfer_cb(struct mhi_device *mhi_dev, struct mhi_result
 
 	if (!mhi_result->transaction_status) {
 		context->rx_size = mhi_result->bytes_xferd;
-		if (context->is_mem_dump_mode)
+		if (context->current_mode == SAHARA_MODE_MEM_DUMP)
 			schedule_work(&context->dump_work);
 		else
 			schedule_work(&context->fw_work);
-- 
2.34.1


