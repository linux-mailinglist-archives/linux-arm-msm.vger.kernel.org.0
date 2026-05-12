Return-Path: <linux-arm-msm+bounces-107060-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qCHIGGrsAmryygEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107060-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 May 2026 11:01:30 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 697F951D30B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 May 2026 11:01:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id CAD443047964
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 May 2026 08:57:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 662CB39DBD7;
	Tue, 12 May 2026 08:55:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="H+css+vK";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KQc8VoR4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB56B3A545C
	for <linux-arm-msm@vger.kernel.org>; Tue, 12 May 2026 08:55:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778576154; cv=none; b=JMLY7WQL82lAEJLIPGYl5wylRkhUns1ZcE+AbVqyUGCFd9oNynHrRRx2LTwJIX6imHVbDkLZGeX7x38UWV2yyHPEtyXTYHGOavIAOHPFuq6w3HeEre8ci5K4WL85sFchFU/1J3LidM1T2G/HtQo8YymQVVBiknjZ4LVAstIdUqo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778576154; c=relaxed/simple;
	bh=oKyxv1kvMdyRYLfpJoBQM0SLvUyZbzRQr78EWfmIvEI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DW6dOb/qCdrhHmV3rhz2S6kL6qVf4RuvnFpSEpdBIvYcM5FbqhAQJyfNB6aHLkB3viiAOp1eNiSxDoum5lko2tttaDoYvGls8S47jS6C3hkAATnbaJGxHX0IgagRVDMtvZAPq6jrk7ofpbR22Tih/N6m4fT06mlvq4TYodwZyvs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=H+css+vK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KQc8VoR4; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64C5Oawh1184120
	for <linux-arm-msm@vger.kernel.org>; Tue, 12 May 2026 08:55:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fUMIIa00afYZEA5MbAYNO41DoI7NKvRkyQl5PMTlsFU=; b=H+css+vKjMod976+
	mdNUAettKOoF5WvuHJKYFQRBUwE4ZUN1R8q6B1U2OBQsn1P2Iq+9zIZj6zXbqLxt
	IisGi6iQ02quDfmxtvT0+Pcs/ddUqTETLMTx9Zew1ePmBc/AXpW8+zTeLWDnxwze
	uuM7DESM03nE11vbpLdLKiQFHyvtxj+c/FAC61yv/e3bUcfpsai5PWW6hn3FNnUk
	EH2t1IP6nkOjND37bGK7PYZ3enEqxjqjkNgVaQy6Y1gnsM4Fx9AqvU+JmIk9VamK
	Qn4D5KR/dqLOEfI5N/rG74MGQcW1A/asKAw3zF1o/3Pb9zs/QLVzG/LfMcm+T90Z
	6EnlUw==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e3nuyab6q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 12 May 2026 08:55:38 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2b99eb06178so111205045ad.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 12 May 2026 01:55:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778576138; x=1779180938; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fUMIIa00afYZEA5MbAYNO41DoI7NKvRkyQl5PMTlsFU=;
        b=KQc8VoR4HyyNo5OlfdD7rzghR/ONFHr1qXV6wDBRQSmHoo0Bjf3Ln2fYcJHSOWWrq4
         dwlVOgz8Vfl4PZC/yhYsiiXeidglVJ/jaZ+M3zMgy28bCPqPt9UAcutbhTyg4DKyWL1x
         1cKCc1nUxIHNUanUb2KxnYQtSIon9k5rt0PVAK7xk3IVoblJVBIduGXd0RSMC/spT0Mr
         cLQggWeyG8OzArbOr+OyqHkkSkkrR/8wr8fJPvisx97KF6L1/LKn6W5VrMkTFyO0/JQW
         YBACokC4EWsKzuSrPLxVlu/n/kZkDHYJtjBEABF5ZNGEbKA5aX7JJLugtGYsY6V9LGSz
         ulcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778576138; x=1779180938;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=fUMIIa00afYZEA5MbAYNO41DoI7NKvRkyQl5PMTlsFU=;
        b=CwB/MwcLuUT7qiLz+0Dev7Jgf7kSvBdR/yKxxZKc1hrhkhnS3DyRcyEL7XMfr6WJov
         lnPd8Y4zfU/tbdXEDrbo66afZg3C2SCy/At8FspadqJkvNfCFQgKFhktvbVg9lKwcxLU
         tX9hZpeF0vtc8o5daxaendVuxk03VL8Puzglu+tV8n2Kcy35f8PcnElZPLUIim0Om7mX
         R6xKUyXIZetKMePmDJEn/+Z1K26HSfFaNtQefYd0J60g7FHgPN+S7Of+3J4HSJoN0AFB
         XAv0lmc2YxSDQbj+nzug7OrMC0nlLnuxaX6riYvJs/uo75i1qIfOOkdOU9+qzzyZvg67
         NzFA==
X-Forwarded-Encrypted: i=1; AFNElJ/t3m/Z/XMRrErAn06JW5yeJvN+bImEnX7MJYfD2AitKwIituyZsk9nuStWJa4fthKJFv0qw9t1rRLf4sHp@vger.kernel.org
X-Gm-Message-State: AOJu0YzTaxfS9eir8mDLmnFVg5rR7cNI1TYRjSJqnRsqOW0gNMRibDHV
	u6Ibc6gH2fUqoOCinim0qLYcjvuXQbbeYmboTEqs0hZLFJJ9F1jipcaP6zy8VSeCSJxPv/SbW2a
	miTerht21bCrzLpSWjPoA5OW38dLxlQcYqkyncDJX1Hwg+Egrg/ctCLXecnXWEUDGaRE1
X-Gm-Gg: Acq92OHX3IK7exAa3hF6x3yC/Pt1RR+whVa5Auwd23TISlowxVMRR/l3loHxI0HT44C
	a6fVR1vz9db8Voha24k/WIxr/xuaMNgSwPc3lEPBO3bMMz8gTINBQJKZWaPuNunerkfCO6u8MmX
	wOs76dSBprfmW/cCFKAdivGQn6xqU1asq2wXMTqZmVMjrmQC+HE7gaW7O4BLoYIZyPgz1lzV+Z2
	7MpfVXK2t/DD7FlFcZnSwo5sgBhdSJBz4dc2p4oFfSdWTWdB45klfSMRgjbj4x4Whz6GpKeCGMK
	98U/NE0cPyttnkBH9X2r0RBHtntO/2jAxBt1RKToFHkHhQanOPEL3WEzT9sfgosdCTWb1ZMNJLp
	BHEzl3pO7Qi6YY68aD9dBdCjwwJmpA7TVZg5D5qNihrjrSwW2uNbsdI0bcvtD4MzxIdhchsJ5KH
	iNS26r5yVrrwdRKe1u5AJT
X-Received: by 2002:a17:903:37c5:b0:2bc:e628:9cc7 with SMTP id d9443c01a7336-2bd012d5bf8mr24144955ad.24.1778576137635;
        Tue, 12 May 2026 01:55:37 -0700 (PDT)
X-Received: by 2002:a17:903:37c5:b0:2bc:e628:9cc7 with SMTP id d9443c01a7336-2bd012d5bf8mr24144625ad.24.1778576137140;
        Tue, 12 May 2026 01:55:37 -0700 (PDT)
Received: from WANGAOW-LAB01.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2baf1e90854sm127641405ad.66.2026.05.12.01.55.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 May 2026 01:55:36 -0700 (PDT)
From: Wangao Wang <wangao.wang@oss.qualcomm.com>
Date: Tue, 12 May 2026 16:55:14 +0800
Subject: [PATCH v7 5/6] media: qcom: iris: Optimize
 iris_hfi_gen1_packet_session_set_property
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260512-batch2_features-v7-5-4954e3b4df84@oss.qualcomm.com>
References: <20260512-batch2_features-v7-0-4954e3b4df84@oss.qualcomm.com>
In-Reply-To: <20260512-batch2_features-v7-0-4954e3b4df84@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Wangao Wang <wangao.wang@oss.qualcomm.com>,
        Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778576115; l=9503;
 i=wangao.wang@oss.qualcomm.com; s=20251021; h=from:subject:message-id;
 bh=oKyxv1kvMdyRYLfpJoBQM0SLvUyZbzRQr78EWfmIvEI=;
 b=orPoYIW33IQqzM3j6w/JUwIqmjRRRDk6d3p3IaZXfDZbBnkhYbt104RyWP//mD6TzXP+i5ozs
 YAhAfE7p+Z8AoeLLTa3SaOLQUgH4LqmI0NUcnmGDR9DN3sukvBBvZQY
X-Developer-Key: i=wangao.wang@oss.qualcomm.com; a=ed25519;
 pk=bUPgYblBUAsoPyGfssbNR7ZXUSGF8v1VF4FJzSO6/aA=
X-Proofpoint-ORIG-GUID: qaMRG01Sg8U0OBOayYUe6x3bg2rfWvxT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEyMDA5MCBTYWx0ZWRfX0Vh/HaD1yUXE
 HX5kIUrTG/kDHE2MSDnJ6rReI0cTIHIF7UB2P+8H/L6GmPdwEtX33hkKgGfF/9EHs26D5tu7nX1
 McgZHrZ94pTMjoYvY43bQeJpIH5PooGCxzygVtuOukVCrVEYcacC7WV6Y/JO3P8tgYxUBRvvjQv
 WJXNpC2Y1RuIMIGsYkZVDXbiNTS3GtoJQzWAwnkQa0j3bHX/vusnuJ0kTTxHpNumv8ftHASMbqg
 E6iKWxvGmf6Wjb9bXhNKjd224VQ1FgwmlcR/b5+ntIy5Ib46dow16Q/6uJbK1svkOCPbcoGpEBN
 Fj7E+D4pRttn8fkF1OUtN0iaZBNeqjiwWTOisjPib8pGygPPnHRH4CWi10x6tOTfj2TiVD8yMHB
 GxuFUSNoEssRFZoz1xSb/qK9TKY/v5ew0sacXp/nJiEjD/FxVudDTNFflqV61ZFOafgWnF7A7xW
 zASuecvhExdRCvecw+A==
X-Authority-Analysis: v=2.4 cv=UZ5hjqSN c=1 sm=1 tr=0 ts=6a02eb0a cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=7zm3FxsWSslHyZ29AF8A:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: qaMRG01Sg8U0OBOayYUe6x3bg2rfWvxT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_05,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 phishscore=0 adultscore=0 clxscore=1015
 lowpriorityscore=0 suspectscore=0 bulkscore=0 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605120090
X-Rspamd-Queue-Id: 697F951D30B
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,linaro.org:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-107060-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FROM_NEQ_ENVFROM(0.00)[wangao.wang@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

Modify iris_hfi_gen1_packet_session_set_property to simplify size
calculations and remove redundant code patterns.

Previously, packet->shdr.hdr.size was incremented by sizeof(u32) in
every switch case, resulting in repetitive and less maintainable
logic.

Reviewed-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8650-HDK
Signed-off-by: Wangao Wang <wangao.wang@oss.qualcomm.com>
---
 .../platform/qcom/iris/iris_hfi_gen1_command.c     | 50 +++++++++++-----------
 1 file changed, 25 insertions(+), 25 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c b/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c
index 4cb54e5e4f1f15137d08027ac9a0d46c46784ea8..7674b47ad6c49adfaf16b444c8ec7295b230a529 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c
@@ -485,7 +485,7 @@ iris_hfi_gen1_packet_session_set_property(struct hfi_session_set_property_pkt *p
 {
 	void *prop_data = &packet->data[1];
 
-	packet->shdr.hdr.size = sizeof(*packet);
+	packet->shdr.hdr.size = sizeof(*packet) + sizeof(ptype);
 	packet->shdr.hdr.pkt_type = HFI_CMD_SESSION_SET_PROPERTY;
 	packet->shdr.session_id = inst->session_id;
 	packet->num_properties = 1;
@@ -498,14 +498,14 @@ iris_hfi_gen1_packet_session_set_property(struct hfi_session_set_property_pkt *p
 		fsize->buffer_type = in->buffer_type;
 		fsize->height = in->height;
 		fsize->width = in->width;
-		packet->shdr.hdr.size += sizeof(u32) + sizeof(*fsize);
+		packet->shdr.hdr.size += sizeof(*fsize);
 		break;
 	}
 	case HFI_PROPERTY_CONFIG_VIDEOCORES_USAGE: {
 		struct hfi_videocores_usage_type *in = pdata, *cu = prop_data;
 
 		cu->video_core_enable_mask = in->video_core_enable_mask;
-		packet->shdr.hdr.size += sizeof(u32) + sizeof(*cu);
+		packet->shdr.hdr.size += sizeof(*cu);
 		break;
 	}
 	case HFI_PROPERTY_PARAM_UNCOMPRESSED_FORMAT_SELECT: {
@@ -514,7 +514,7 @@ iris_hfi_gen1_packet_session_set_property(struct hfi_session_set_property_pkt *p
 
 		hfi->buffer_type = in->buffer_type;
 		hfi->format = in->format;
-		packet->shdr.hdr.size += sizeof(u32) + sizeof(*hfi);
+		packet->shdr.hdr.size += sizeof(*hfi);
 		break;
 	}
 	case HFI_PROPERTY_PARAM_UNCOMPRESSED_PLANE_ACTUAL_CONSTRAINTS_INFO: {
@@ -533,7 +533,7 @@ iris_hfi_gen1_packet_session_set_property(struct hfi_session_set_property_pkt *p
 			info->plane_format[1].buffer_alignment = 256;
 		}
 
-		packet->shdr.hdr.size += sizeof(u32) + sizeof(*info);
+		packet->shdr.hdr.size += sizeof(*info);
 		break;
 	}
 	case HFI_PROPERTY_PARAM_BUFFER_COUNT_ACTUAL: {
@@ -543,7 +543,7 @@ iris_hfi_gen1_packet_session_set_property(struct hfi_session_set_property_pkt *p
 		count->type = in->type;
 		count->count_actual = in->count_actual;
 		count->count_min_host = in->count_min_host;
-		packet->shdr.hdr.size += sizeof(u32) + sizeof(*count);
+		packet->shdr.hdr.size += sizeof(*count);
 		break;
 	}
 	case HFI_PROPERTY_PARAM_VDEC_MULTI_STREAM: {
@@ -552,7 +552,7 @@ iris_hfi_gen1_packet_session_set_property(struct hfi_session_set_property_pkt *p
 
 		multi->buffer_type = in->buffer_type;
 		multi->enable = in->enable;
-		packet->shdr.hdr.size += sizeof(u32) + sizeof(*multi);
+		packet->shdr.hdr.size += sizeof(*multi);
 		break;
 	}
 	case HFI_PROPERTY_PARAM_BUFFER_SIZE_ACTUAL: {
@@ -560,7 +560,7 @@ iris_hfi_gen1_packet_session_set_property(struct hfi_session_set_property_pkt *p
 
 		sz->size = in->size;
 		sz->type = in->type;
-		packet->shdr.hdr.size += sizeof(u32) + sizeof(*sz);
+		packet->shdr.hdr.size += sizeof(*sz);
 		break;
 	}
 	case HFI_PROPERTY_PARAM_WORK_ROUTE: {
@@ -568,7 +568,7 @@ iris_hfi_gen1_packet_session_set_property(struct hfi_session_set_property_pkt *p
 		u32 *in = pdata;
 
 		wr->video_work_route = *in;
-		packet->shdr.hdr.size += sizeof(u32) + sizeof(*wr);
+		packet->shdr.hdr.size += sizeof(*wr);
 		break;
 	}
 	case HFI_PROPERTY_PARAM_WORK_MODE: {
@@ -576,7 +576,7 @@ iris_hfi_gen1_packet_session_set_property(struct hfi_session_set_property_pkt *p
 		u32 *in = pdata;
 
 		wm->video_work_mode = *in;
-		packet->shdr.hdr.size += sizeof(u32) + sizeof(*wm);
+		packet->shdr.hdr.size += sizeof(*wm);
 		break;
 	}
 	case HFI_PROPERTY_PARAM_PROFILE_LEVEL_CURRENT: {
@@ -592,7 +592,7 @@ iris_hfi_gen1_packet_session_set_property(struct hfi_session_set_property_pkt *p
 			/* Level not supported, falling back to 1 */
 			pl->level = 1;
 
-		packet->shdr.hdr.size += sizeof(u32) + sizeof(*pl);
+		packet->shdr.hdr.size += sizeof(*pl);
 		break;
 	}
 	case HFI_PROPERTY_CONFIG_VENC_SYNC_FRAME_SEQUENCE_HEADER: {
@@ -600,7 +600,7 @@ iris_hfi_gen1_packet_session_set_property(struct hfi_session_set_property_pkt *p
 		u32 *in = pdata;
 
 		en->enable = *in;
-		packet->shdr.hdr.size += sizeof(u32) + sizeof(*en);
+		packet->shdr.hdr.size += sizeof(*en);
 		break;
 	}
 	case HFI_PROPERTY_CONFIG_VENC_TARGET_BITRATE: {
@@ -608,7 +608,7 @@ iris_hfi_gen1_packet_session_set_property(struct hfi_session_set_property_pkt *p
 
 		brate->bitrate = in->bitrate;
 		brate->layer_id = in->layer_id;
-		packet->shdr.hdr.size += sizeof(u32) + sizeof(*brate);
+		packet->shdr.hdr.size += sizeof(*brate);
 		break;
 	}
 	case HFI_PROPERTY_PARAM_VENC_RATE_CONTROL: {
@@ -627,7 +627,7 @@ iris_hfi_gen1_packet_session_set_property(struct hfi_session_set_property_pkt *p
 		}
 
 		packet->data[1] = *in;
-		packet->shdr.hdr.size += sizeof(u32) * 2;
+		packet->shdr.hdr.size += sizeof(u32);
 		break;
 	}
 	case HFI_PROPERTY_PARAM_VENC_H264_ENTROPY_CONTROL: {
@@ -637,7 +637,7 @@ iris_hfi_gen1_packet_session_set_property(struct hfi_session_set_property_pkt *p
 		entropy->entropy_mode = *in;
 		if (entropy->entropy_mode == HFI_H264_ENTROPY_CABAC)
 			entropy->cabac_model = HFI_H264_CABAC_MODEL_0;
-		packet->shdr.hdr.size += sizeof(u32) + sizeof(*entropy);
+		packet->shdr.hdr.size += sizeof(*entropy);
 		break;
 	}
 	case HFI_PROPERTY_PARAM_VENC_SESSION_QP_RANGE_V2: {
@@ -662,7 +662,7 @@ iris_hfi_gen1_packet_session_set_property(struct hfi_session_set_property_pkt *p
 			((max_qp & 0xFF) << 16);
 		range->min_qp.enable = 7;
 		range->max_qp.enable = 7;
-		packet->shdr.hdr.size += sizeof(u32) + sizeof(*range);
+		packet->shdr.hdr.size += sizeof(*range);
 		break;
 	}
 	case HFI_PROPERTY_CONFIG_FRAME_RATE: {
@@ -671,7 +671,7 @@ iris_hfi_gen1_packet_session_set_property(struct hfi_session_set_property_pkt *p
 
 		frate->buffer_type = in->buffer_type;
 		frate->framerate = in->framerate;
-		packet->shdr.hdr.size += sizeof(u32) + sizeof(*frate);
+		packet->shdr.hdr.size += sizeof(*frate);
 		break;
 	}
 	case HFI_PROPERTY_PARAM_UNCOMPRESSED_PLANE_ACTUAL_INFO: {
@@ -683,7 +683,7 @@ iris_hfi_gen1_packet_session_set_property(struct hfi_session_set_property_pkt *p
 		plane_actual_info->plane_format[0] = in->plane_format[0];
 		if (in->num_planes > 1)
 			plane_actual_info->plane_format[1] = in->plane_format[1];
-		packet->shdr.hdr.size += sizeof(u32) + sizeof(*plane_actual_info);
+		packet->shdr.hdr.size += sizeof(*plane_actual_info);
 		break;
 	}
 	case HFI_PROPERTY_PARAM_VENC_INTRA_REFRESH: {
@@ -691,7 +691,7 @@ iris_hfi_gen1_packet_session_set_property(struct hfi_session_set_property_pkt *p
 
 		intra_refresh->mode = in->mode;
 		intra_refresh->mbs = in->mbs;
-		packet->shdr.hdr.size += sizeof(u32) + sizeof(*intra_refresh);
+		packet->shdr.hdr.size += sizeof(*intra_refresh);
 		break;
 	}
 	case HFI_PROPERTY_PARAM_VENC_LTRMODE: {
@@ -700,7 +700,7 @@ iris_hfi_gen1_packet_session_set_property(struct hfi_session_set_property_pkt *p
 		ltr_mode->mode = in->mode;
 		ltr_mode->count = in->count;
 		ltr_mode->trust_mode = in->trust_mode;
-		packet->shdr.hdr.size += sizeof(u32) + sizeof(*ltr_mode);
+		packet->shdr.hdr.size += sizeof(*ltr_mode);
 		break;
 	}
 	case HFI_PROPERTY_CONFIG_VENC_USELTRFRAME: {
@@ -709,14 +709,14 @@ iris_hfi_gen1_packet_session_set_property(struct hfi_session_set_property_pkt *p
 		ltr_use->frames = in->frames;
 		ltr_use->ref_ltr = in->ref_ltr;
 		ltr_use->use_constrnt = in->use_constrnt;
-		packet->shdr.hdr.size += sizeof(u32) + sizeof(*ltr_use);
+		packet->shdr.hdr.size += sizeof(*ltr_use);
 		break;
 	}
 	case HFI_PROPERTY_CONFIG_VENC_MARKLTRFRAME: {
 		struct hfi_ltr_mark *in = pdata, *ltr_mark = prop_data;
 
 		ltr_mark->mark_frame = in->mark_frame;
-		packet->shdr.hdr.size += sizeof(u32) + sizeof(*ltr_mark);
+		packet->shdr.hdr.size += sizeof(*ltr_mark);
 		break;
 	}
 	case HFI_PROPERTY_CONFIG_VENC_INTRA_PERIOD: {
@@ -724,21 +724,21 @@ iris_hfi_gen1_packet_session_set_property(struct hfi_session_set_property_pkt *p
 
 		intra_period->pframes = in->pframes;
 		intra_period->bframes = in->bframes;
-		packet->shdr.hdr.size += sizeof(u32) + sizeof(*intra_period);
+		packet->shdr.hdr.size += sizeof(*intra_period);
 		break;
 	}
 	case HFI_PROPERTY_PARAM_VENC_HIER_P_MAX_NUM_ENH_LAYER: {
 		u32 *in = pdata;
 
 		packet->data[1] = *in;
-		packet->shdr.hdr.size += sizeof(u32) + sizeof(u32);
+		packet->shdr.hdr.size += sizeof(u32);
 		break;
 	}
 	case HFI_PROPERTY_CONFIG_VENC_HIER_P_ENH_LAYER: {
 		u32 *in = pdata;
 
 		packet->data[1] = *in;
-		packet->shdr.hdr.size += sizeof(u32) + sizeof(u32);
+		packet->shdr.hdr.size += sizeof(u32);
 		break;
 	}
 	default:

-- 
2.43.0


