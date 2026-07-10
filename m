Return-Path: <linux-arm-msm+bounces-118120-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id cAiDIB1cUGqRxQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-118120-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jul 2026 04:42:37 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id CD244736BCE
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jul 2026 04:42:36 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=j4i33xMJ;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=ETJsZ0FP;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-118120-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-118120-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CB4A23050D80
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jul 2026 02:40:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A0CFE31F9BE;
	Fri, 10 Jul 2026 02:40:14 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8334321F2D
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jul 2026 02:40:11 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783651214; cv=none; b=o9E00lCdQqfAuNzxLN5yFjyPo5ispPKNLeUSqY3vDxLSyL2iMteBIs/G107HGfnNPW13hBd953G/lsSpYxp/2w34AMDJ6+KHJ2UO75fQDgNQM0Ujld7i+EjfUpmmUL71dtO38FIyaSEKMxVBJjmhynO8aw2PJQg+aG+z7wMhY1s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783651214; c=relaxed/simple;
	bh=35bwKpdCP3dXZ0INIIP+IwE3pIKelQUJ8ujkrV7sSFI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=EmA0t7V9ePOK17GM3WxmhOL4cWR98E+CY/kIuvw4MbyoxhJN23a5UFfSPNksRwSwypmwpEvi9B2740omzu+sscoH09RQhvPmym5DI/4h9V8xZ10NCTUaLX7OUXLr0988khWLXWBOQ+3DLl26W7/4iwtT0iq1aHqk8lPJtc+d5pM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=j4i33xMJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ETJsZ0FP; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66A2WOJg2422271
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jul 2026 02:40:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	q2zBHv+smXSmMK9iUNkIcZ5MPC+eZbRWW/+ogeNKyx0=; b=j4i33xMJX4s7gE4D
	+TMsAfsECmTmDTkfZycjr7AqTezbEtQkJsYzjLp7FkcXDZckCtg8gYe5hcZJlWi+
	71HrFewKAG4RleTEk1NHlf2zF87gut2GKViLOBA8Pd9RywsVXahWoGy7fz27vQSF
	6JgKgnI6XfWEd8ssypqrliqiRSf/i7XAOeeVxqDLCxqhzzbIpezgfWVVSeGzSaMT
	kzoWKcyD0+C29qI6YC/KAR43OfCCPDomCfe8BmHOh6DQ6EvpEllVWzHklGwRRzF9
	h48WTLEKtp4X5aLlvqPjGG3pyjoAOTTSNDYnKuZkyS/Ggkh8nhuNhDhsoAjr51nS
	qzmoIQ==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fadvjahua-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jul 2026 02:40:10 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3855a987c0aso489943a91.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 Jul 2026 19:40:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783651210; x=1784256010; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=q2zBHv+smXSmMK9iUNkIcZ5MPC+eZbRWW/+ogeNKyx0=;
        b=ETJsZ0FPg7dSnpw5atbxCm5fLgrQ8ybjP9SVnnHDbngTU1IzuwQD8fm16DjNSCLNTv
         5dQkTwUjHR/FVdff1ZHQ1iKkqK+T1r25LP+Hdg2ardLI+81Fs3jB3ZX+TtJcHe+PWs3k
         LJ46U0jk/qZWk+Os+dgVrgwy4OYiBZ1Fx9DGGPAn4z72EbyxEzzlFCNNE3drkpVFEaC4
         W2WTbPfu0KWq+C8v4emG0WpiUkcACVvnDBO9M+AUDRZdiJjTwzqf80CKf8MOMnIXGCu9
         1pKLWMVCsYoSuTnJTgUf79fSl6C9j54u+V3BuWYCI91gfk2D3VQ53p4R8ZL/Ln6xoh3v
         2k0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783651210; x=1784256010;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=q2zBHv+smXSmMK9iUNkIcZ5MPC+eZbRWW/+ogeNKyx0=;
        b=Gt0id38ZAealwHZxNTWT8yabX6CbAJnk/UKoy3fY2aAETf8ejGw/3fzDBNZpG51nhM
         C5vTm+89IzxyKTyS29DSbsCFtGyXe23fvpL1a8uocKq3lz7uPsryym/x8Mt3dT5/VW4u
         4Dvizy8iIAYB637LveyoSXhY5fIZSQX6mqGqyt/bxj/qgLQsl75OAvuxFyfo2Jn3nJ8i
         aWddObI0hlQAmHSiEurIeeVI7+H2wh4aGnSe7wvYFP3y/omWaf3VfJyNZ4Q4Of2rcSCh
         C8HFhQJVENYsatGhs1QujCAQTwb3/22jaUW6oK4Trl3gzDZNhbfWXGcuCNCL/sx1jbcK
         TZGQ==
X-Forwarded-Encrypted: i=1; AHgh+RpDWepFf4alaKHbbKkmHT8TVvRUfQbqR7jbZik3ThI2FFI2IUNRKmP+6ub4VWyUWp8RJOsGXE7hjs6tYEZa@vger.kernel.org
X-Gm-Message-State: AOJu0YwAab3m3xgUgEprlUJ4WGIvVhmgW+L0tg4sAwvjuHGwjWrThaud
	yIVokZW33RxGCYHT9rqDBzpXJueOb0Z75qzcABzjNJGy/ypX2EgypXhyU+1FJVGWND500zCl64F
	gvCV0iLaBfweFJECV9PKWjiPL0a96bB88FXfCyEEm/YOs1pFZtH1eQYyXr3aA7aqIUvVk
X-Gm-Gg: AfdE7clwjkVRKSlzXwgEZjOpx/YXCyYtXNNX0xc9H46J53+c4y7zLe2386PXACIeEhu
	alIFiI1L/IE9l9g0XrrrYmu5cPXQdr8dJXRwJH4i9D64XFMNljo+47jXdelcXpQRoz7asAG6fG3
	3lzq/Sl0L9udlh3yXU4EYDwn11hhDB4SvefNrKoOAYkPFvL4cjQPtPhH4eTBnCVz6GADNB/4sBo
	hEB+vMYVSudD6bp44EiZ2ESZRSdGpFhF/UpqYN4DPDHPJua1rE/NhpVn8gEejAb18bmRQyHherN
	qtAQvuu0ZyN7ygGBbsm30CHg1QWWtP4wmgS1s2LT4/TazQCFqYPA3iZuAXvYH64caPfYV2JgCI/
	varfU3T3si52MR6MpyAhP57gN54wveD9jNiWKiqgiGr2w
X-Received: by 2002:a17:90b:1d44:b0:37f:d9dc:557 with SMTP id 98e67ed59e1d1-38940638b51mr11721909a91.16.1783651209504;
        Thu, 09 Jul 2026 19:40:09 -0700 (PDT)
X-Received: by 2002:a17:90b:1d44:b0:37f:d9dc:557 with SMTP id 98e67ed59e1d1-38940638b51mr11721872a91.16.1783651209072;
        Thu, 09 Jul 2026 19:40:09 -0700 (PDT)
Received: from hu-bvisredd-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31174ae6cd9sm38300227eec.31.2026.07.09.19.40.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 19:40:08 -0700 (PDT)
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Date: Fri, 10 Jul 2026 08:09:13 +0530
Subject: [PATCH 2/2] media: iris: add hierarchical coding support for
 ar50lt encoder
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260710-shikra_ltr_support-v1-2-458b587268ea@oss.qualcomm.com>
References: <20260710-shikra_ltr_support-v1-0-458b587268ea@oss.qualcomm.com>
In-Reply-To: <20260710-shikra_ltr_support-v1-0-458b587268ea@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>,
        Gourav Kumar <gouravk@qti.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783651196; l=6390;
 i=busanna.reddy@oss.qualcomm.com; s=20260216; h=from:subject:message-id;
 bh=zQke4TZ0Iyzuzkw4lcAoc8YECKGhYqJX9CxejxA5mFQ=;
 b=Rs0IruUuDUMLeaH68+GMHwMKBHW6T2T5PlOx36vIADaUbGCoKHx8XaJy4wuZDXR/MREkXky/I
 wHRQ09BKKh6DA5HaLnpiOLpm2PagFEAOoC3rD/8kSQDD0mWCxCd/P/J
X-Developer-Key: i=busanna.reddy@oss.qualcomm.com; a=ed25519;
 pk=9vmy9HahBKVAa+GBFj1yHVbz0ey/ucIs1hrlfx+qtok=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEwMDAyMyBTYWx0ZWRfX5SOBxx+kg8Lt
 rQKU2MMyNmCpuEiaVKAL6tNkCl9L1oy+0m0UeJdCCe/M/S6sQAULT/X2VWwNK9j6Ie4FQ3KGMhp
 IslBEXSqL2GBh3okF0AqBz3HNjE7tq8GLZk6dmgRC8mkts0+7WlWrqwxEI9pl9mZniBRFupDsG/
 N4+3bWhX3HVPAFIHiBE+zkTbD/qVg84ljum6llYHF+EVioKqrn13txZiGb92WjISnLFIhTXad0j
 cFBigrlmHG/cJXVi8tPlxFD8WZ+VndkgG9kSKHsoQiXwWujsJ1AeJ0BUC07cP/q+m3nur/RiTSr
 j9Sd3CSdhFUCn1hwDsh8RDI9y8gyk5TKiuFm7aTcM9ztxzVP/uk/7PRP/Mh0ibHxeT1axiqoxiK
 a49d3aDti4yJEyp5tEO7G+VCDCO8TgFa192iczlCi2qnHScSkgHB+iaaYNf21hyTtJW9aePvPVJ
 6xPbN/xrcdMG4cpuBGg==
X-Authority-Analysis: v=2.4 cv=WpIb99fv c=1 sm=1 tr=0 ts=6a505b8a cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=jI2tO5MT3nXOp3B53W8A:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-GUID: m4rJk5xzHaGHDh8iVww8F_1aaI-fPgAC
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEwMDAyMyBTYWx0ZWRfXxAJqkjYjstnN
 Stdm4bpDr+HmOUK52w61pIy407dhl/Ux1Pkw/TP6cpJN8TroiSeu1ICmsNZ8IG77YE0V3jBe191
 bYeI0BvETCi/t02kWFWHn9T4Sz627Xo=
X-Proofpoint-ORIG-GUID: m4rJk5xzHaGHDh8iVww8F_1aaI-fPgAC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-09_04,2026-07-09_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 adultscore=0 lowpriorityscore=0
 clxscore=1015 malwarescore=0 phishscore=0 spamscore=0 bulkscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607100023
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-118120-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[busanna.reddy@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:vikash.garodia@oss.qualcomm.com,m:dikshita.agarwal@oss.qualcomm.com,m:abhinav.kumar@linux.dev,m:bod@kernel.org,m:mchehab@kernel.org,m:linux-media@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:busanna.reddy@oss.qualcomm.com,m:gouravk@qti.qualcomm.com,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,qualcomm.com:email,qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[busanna.reddy@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: CD244736BCE

From: Gourav Kumar <gouravk@qti.qualcomm.com>

Add LAYER_ENABLE, LAYER_TYPE_H264/HEVC, LAYER_COUNT_H264/HEVC and
per-layer bitrate fw_caps entries to inst_fw_cap_gen2_ar50lt_enc,
enabling V4L2_CID_MPEG_VIDEO_H264_HIERARCHICAL_CODING and related
hierarchical/layered encoding controls for ar50lt platforms.

Signed-off-by: Gourav Kumar <gouravk@qti.qualcomm.com>
Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_hfi_gen2.c | 182 +++++++++++++++++++++++
 1 file changed, 182 insertions(+)

diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2.c b/drivers/media/platform/qcom/iris/iris_hfi_gen2.c
index ae0512971e8a..74115e15edbc 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen2.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2.c
@@ -1699,6 +1699,188 @@ static const struct platform_inst_fw_cap inst_fw_cap_gen2_ar50lt_enc[] = {
 		.flags = CAP_FLAG_INPUT_PORT | CAP_FLAG_DYNAMIC_ALLOWED,
 		.set = iris_set_use_and_mark_ltr,
 	},
+	{
+		.cap_id = LAYER_ENABLE,
+		.min = 0,
+		.max = 1,
+		.step_or_mask = 1,
+		.value = 0,
+		.flags = CAP_FLAG_OUTPUT_PORT,
+	},
+	{
+		.cap_id = LAYER_TYPE_H264,
+		.min = V4L2_MPEG_VIDEO_H264_HIERARCHICAL_CODING_B,
+		.max = V4L2_MPEG_VIDEO_H264_HIERARCHICAL_CODING_P,
+		.step_or_mask = BIT(V4L2_MPEG_VIDEO_H264_HIERARCHICAL_CODING_B) |
+				BIT(V4L2_MPEG_VIDEO_H264_HIERARCHICAL_CODING_P),
+		.value = V4L2_MPEG_VIDEO_H264_HIERARCHICAL_CODING_P,
+		.hfi_id = HFI_PROP_LAYER_ENCODING_TYPE,
+		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_MENU,
+		.set = iris_set_layer_type,
+	},
+	{
+		.cap_id = LAYER_TYPE_HEVC,
+		.min = V4L2_MPEG_VIDEO_HEVC_HIERARCHICAL_CODING_B,
+		.max = V4L2_MPEG_VIDEO_HEVC_HIERARCHICAL_CODING_P,
+		.step_or_mask = BIT(V4L2_MPEG_VIDEO_HEVC_HIERARCHICAL_CODING_B) |
+				BIT(V4L2_MPEG_VIDEO_HEVC_HIERARCHICAL_CODING_P),
+		.value = V4L2_MPEG_VIDEO_HEVC_HIERARCHICAL_CODING_P,
+		.hfi_id = HFI_PROP_LAYER_ENCODING_TYPE,
+		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_MENU,
+		.set = iris_set_layer_type,
+	},
+	{
+		.cap_id = LAYER_COUNT_H264,
+		.min = 0,
+		.max = 5,
+		.step_or_mask = 1,
+		.value = 0,
+		.hfi_id = HFI_PROP_LAYER_COUNT,
+		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_DYNAMIC_ALLOWED,
+		.set = iris_set_layer_count_gen2,
+	},
+	{
+		.cap_id = LAYER_COUNT_HEVC,
+		.min = 0,
+		.max = 5,
+		.step_or_mask = 1,
+		.value = 0,
+		.hfi_id = HFI_PROP_LAYER_COUNT,
+		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_DYNAMIC_ALLOWED,
+		.set = iris_set_layer_count_gen2,
+	},
+	{
+		.cap_id = LAYER0_BITRATE_H264,
+		.min = 1,
+		.max = BITRATE_MAX_AR50LT,
+		.step_or_mask = 1,
+		.value = BITRATE_DEFAULT_AR50LT,
+		.hfi_id = HFI_PROP_BITRATE_LAYER1,
+		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_INPUT_PORT |
+			CAP_FLAG_DYNAMIC_ALLOWED,
+		.set = iris_set_layer_bitrate,
+	},
+	{
+		.cap_id = LAYER1_BITRATE_H264,
+		.min = 1,
+		.max = BITRATE_MAX_AR50LT,
+		.step_or_mask = 1,
+		.value = BITRATE_DEFAULT_AR50LT,
+		.hfi_id = HFI_PROP_BITRATE_LAYER2,
+		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_INPUT_PORT |
+			CAP_FLAG_DYNAMIC_ALLOWED,
+		.set = iris_set_layer_bitrate,
+	},
+	{
+		.cap_id = LAYER2_BITRATE_H264,
+		.min = 1,
+		.max = BITRATE_MAX_AR50LT,
+		.step_or_mask = 1,
+		.value = BITRATE_DEFAULT_AR50LT,
+		.hfi_id = HFI_PROP_BITRATE_LAYER3,
+		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_INPUT_PORT |
+			CAP_FLAG_DYNAMIC_ALLOWED,
+		.set = iris_set_layer_bitrate,
+	},
+	{
+		.cap_id = LAYER3_BITRATE_H264,
+		.min = 1,
+		.max = BITRATE_MAX_AR50LT,
+		.step_or_mask = 1,
+		.value = BITRATE_DEFAULT_AR50LT,
+		.hfi_id = HFI_PROP_BITRATE_LAYER4,
+		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_INPUT_PORT |
+			CAP_FLAG_DYNAMIC_ALLOWED,
+		.set = iris_set_layer_bitrate,
+	},
+	{
+		.cap_id = LAYER4_BITRATE_H264,
+		.min = 1,
+		.max = BITRATE_MAX_AR50LT,
+		.step_or_mask = 1,
+		.value = BITRATE_DEFAULT_AR50LT,
+		.hfi_id = HFI_PROP_BITRATE_LAYER5,
+		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_INPUT_PORT |
+			CAP_FLAG_DYNAMIC_ALLOWED,
+		.set = iris_set_layer_bitrate,
+	},
+	{
+		.cap_id = LAYER5_BITRATE_H264,
+		.min = 1,
+		.max = BITRATE_MAX_AR50LT,
+		.step_or_mask = 1,
+		.value = BITRATE_DEFAULT_AR50LT,
+		.hfi_id = HFI_PROP_BITRATE_LAYER6,
+		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_INPUT_PORT |
+			CAP_FLAG_DYNAMIC_ALLOWED,
+		.set = iris_set_layer_bitrate,
+	},
+	{
+		.cap_id = LAYER0_BITRATE_HEVC,
+		.min = 1,
+		.max = BITRATE_MAX_AR50LT,
+		.step_or_mask = 1,
+		.value = BITRATE_DEFAULT_AR50LT,
+		.hfi_id = HFI_PROP_BITRATE_LAYER1,
+		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_INPUT_PORT |
+			CAP_FLAG_DYNAMIC_ALLOWED,
+		.set = iris_set_layer_bitrate,
+	},
+	{
+		.cap_id = LAYER1_BITRATE_HEVC,
+		.min = 1,
+		.max = BITRATE_MAX_AR50LT,
+		.step_or_mask = 1,
+		.value = BITRATE_DEFAULT_AR50LT,
+		.hfi_id = HFI_PROP_BITRATE_LAYER2,
+		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_INPUT_PORT |
+			CAP_FLAG_DYNAMIC_ALLOWED,
+		.set = iris_set_layer_bitrate,
+	},
+	{
+		.cap_id = LAYER2_BITRATE_HEVC,
+		.min = 1,
+		.max = BITRATE_MAX_AR50LT,
+		.step_or_mask = 1,
+		.value = BITRATE_DEFAULT_AR50LT,
+		.hfi_id = HFI_PROP_BITRATE_LAYER3,
+		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_INPUT_PORT |
+			CAP_FLAG_DYNAMIC_ALLOWED,
+		.set = iris_set_layer_bitrate,
+	},
+	{
+		.cap_id = LAYER3_BITRATE_HEVC,
+		.min = 1,
+		.max = BITRATE_MAX_AR50LT,
+		.step_or_mask = 1,
+		.value = BITRATE_DEFAULT_AR50LT,
+		.hfi_id = HFI_PROP_BITRATE_LAYER4,
+		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_INPUT_PORT |
+			CAP_FLAG_DYNAMIC_ALLOWED,
+		.set = iris_set_layer_bitrate,
+	},
+	{
+		.cap_id = LAYER4_BITRATE_HEVC,
+		.min = 1,
+		.max = BITRATE_MAX_AR50LT,
+		.step_or_mask = 1,
+		.value = BITRATE_DEFAULT_AR50LT,
+		.hfi_id = HFI_PROP_BITRATE_LAYER5,
+		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_INPUT_PORT |
+			CAP_FLAG_DYNAMIC_ALLOWED,
+		.set = iris_set_layer_bitrate,
+	},
+	{
+		.cap_id = LAYER5_BITRATE_HEVC,
+		.min = 1,
+		.max = BITRATE_MAX_AR50LT,
+		.step_or_mask = 1,
+		.value = BITRATE_DEFAULT_AR50LT,
+		.hfi_id = HFI_PROP_BITRATE_LAYER6,
+		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_INPUT_PORT |
+			CAP_FLAG_DYNAMIC_ALLOWED,
+		.set = iris_set_layer_bitrate,
+	},
 };
 
 static const u32 iris_hfi_gen2_ar50lt_dec_ip_int_buf_tbl[] = {

-- 
2.34.1


