Return-Path: <linux-arm-msm+bounces-114309-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 8ynnCJebO2ouaQgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114309-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Jun 2026 10:55:51 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A9E196BCB8A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Jun 2026 10:55:50 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=HQ+iWxxE;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=TCMyS09p;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114309-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114309-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 86E4930EAA4C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Jun 2026 08:52:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0726339A048;
	Wed, 24 Jun 2026 08:51:59 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B8EC397B15
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Jun 2026 08:51:57 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782291118; cv=none; b=rCQbUk9DT9dvrrpZ05UEiLM3GNOTA3ElhM1/YUHNMdI9OYkS7fokzTP2rCVRcES3gOWzch6ony6iChpBu6kqyEKPllmaW1ppOB3ljXRMqxeQTA8039LYit2JUZ6BkjZK1O8l1v1Kex8/0eVXzS0QOXZLjfnuqKSmVlaxxv+vdro=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782291118; c=relaxed/simple;
	bh=T20Hc/5VIww09a3QDg5vOTm8F29YjwiaOI4aLL9iMyk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GRGbcxhUA3WHko03avUHdYagJE7NmS0IwOvy4HxBAGxhx2aSgLxYQC6KvvASAUOxzOu1Zn1tBGvugecrtdp1yqBw2GNgsQY5thK1XznIyeUx5ghe5qny3qDDLgmx3u/Kj18FHeV59pZfv6HZnPu3PocZCpZEijek5uS+JnH0hL4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HQ+iWxxE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TCMyS09p; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65O5uN7s2460914
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Jun 2026 08:51:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	00UbssjuVOsBPXnO6ymPAgptrJrUzp+IBusclHnO1RI=; b=HQ+iWxxE7CMJgKxD
	WrKFAL5RvOgJnGwquOBTTPxOvNwy4OYJ5N1a06S6qs4Xr9RqOTVqWmuTyafoUNDE
	vr14iq9ptFMPcmLQ7j+mwja6xXxee6MfwrubueHgS4SNYtOBwCj9UK58S+Y66YAA
	21OwhLKK6/+yfwPkxpdzbmaeazrA95cgwn6BRfEepfeDKPtJufI5EPKQgPrr/qOo
	/MNHU4ie+2W6vnGTTUIYMCvUS5OC05CgLd1zZ3cW/7yYk19hC0tl48LJzzJwqOki
	kleigu9P4NKwSCVQpIxfnARkdHO4S3lDsUaxIg87DCwi8IQl9CTOjipMjTYMIznL
	2HPuOw==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eytvh40bs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Jun 2026 08:51:55 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-c88aab7c1fcso540781a12.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Jun 2026 01:51:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782291115; x=1782895915; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=00UbssjuVOsBPXnO6ymPAgptrJrUzp+IBusclHnO1RI=;
        b=TCMyS09p956QiC0DDbTFm+PraVbGTjeQ6qYN/l1HXwL5rVVbt3yAF4/ckGcSDaI175
         oFgBMjFHWsu/69lUVJr5OKRmP24dR8YEgVC2XFazFDUd2ymfYaxI7DKD/JoReXW10Roq
         4czG2o7nEaAeiu9p3yveJthE9SXLPwrbY8hwvwyXFMgK8mX99cz3FIKKVRNbnBEI23en
         gI/UDajR5Ct70SqnWaQ5yC7kDo+MqCsPJlnTS7aq7rRDR1I/oBw2syhNQNan6IvFU8ht
         xdKhPl4FqryuI38M9xiYM0GGt8A/yHEeJGGbJilrErM/co8HymtFtzBVTsQcYEMMj4FB
         t7Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782291115; x=1782895915;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=00UbssjuVOsBPXnO6ymPAgptrJrUzp+IBusclHnO1RI=;
        b=ZVxQoRuIoahbzcu/Fi698C6kPJa/OCnR8dSDkBEedezW3LKF44ap1cFfKXl3rGoRD/
         a3o//FTiZGxPJuVSrhkALz3i7HJKUUmFsrsMUI814p7o6hL1gyiXfU4ADgkulzyiewJ3
         g4Yv1iHRvA+2edc+WjrXiTy0miQo4NZOK88NMFfNkWisGXCAQqqlzESKoicFKlYqWYYh
         NBQFLU7DWTjeSC01pHFUjljK0x2EKB5RnwDjhnEHchswtgT3iM3bl3qiEz/2HqZilgdt
         WgooZ/lHosg1C6zPovoo9rnH/D808Kzhff9HDk0NXerbqOTb33g4fOV3GvKlGZf8Y1sc
         vGfQ==
X-Forwarded-Encrypted: i=1; AFNElJ9lIwVuQLzAa6QCVvATK0L/lE8b+T/kbgc+3TB6fV8xt8Kmg68Uf2LsCtZ9iNK1vHQtW3C1h/gYAEKauudD@vger.kernel.org
X-Gm-Message-State: AOJu0Yxz8YoyqBD3DoElmxS+0sAlHHrzRwnKAF/oh8jBJwN28atdktQs
	tTbUMco8uM3Tpe00ftJvw+J2MOU9/Ir4UqPn8QWF4TtagHcx/0Hy8repQIthVJdszB9MFNSFASX
	pYLADIpaakdyeUT5wj11yTgPGnC8BV1Es4MuGyDyVtEWWlCznXRTb5aW8Z0amllPWTPNP
X-Gm-Gg: AfdE7cmshzouxuAJac4DohcMOfUYG4QQ3kmo6eLMf4PgErXI9kuHYjPhpxc8cjdE7Eo
	3avW+Luy5zx9id736zNF4VyLj01Xnbw8jXdmsyGSgRKXCfKjwyV4F3jsV5LBT2fGktkYY0cxywG
	VnB4n1MwKmsYCiwTn4KZ/yt3EQizX89hBCiWPa4mj5/IXSDms+OEb7kOSeJXbKwXcozhjKWAR+0
	4Z82YQg38G11MIw2zw2VTb1bAZxdJs7MUd1kKb7y3BmJB1U76z29ETpHF9Ny+NA0K0m53wey+qa
	HuwPmk4QE5YLBszFSfgEi4J39a0FM0uVUl/B3GrX4vqG+V2DVgkORK0Grd4y0tMeAd0bLi7sl1L
	SKNSRkj9dKfp+PWX/45sGW/mopv7gDYqkvrstfJwv+FJKtpe+vCnrGXrk/Ehe9CcOOwHZKccV/T
	B8pYtAISO9oQ==
X-Received: by 2002:a05:6a20:9f96:b0:3b3:10e1:a870 with SMTP id adf61e73a8af0-3bd151fd3f5mr8323290637.32.1782291114989;
        Wed, 24 Jun 2026 01:51:54 -0700 (PDT)
X-Received: by 2002:a05:6a20:9f96:b0:3b3:10e1:a870 with SMTP id adf61e73a8af0-3bd151fd3f5mr8323262637.32.1782291114551;
        Wed, 24 Jun 2026 01:51:54 -0700 (PDT)
Received: from WANGAOW-LAB01.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c8bc563c406sm11926464a12.19.2026.06.24.01.51.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Jun 2026 01:51:53 -0700 (PDT)
From: Wangao Wang <wangao.wang@oss.qualcomm.com>
Date: Wed, 24 Jun 2026 16:51:44 +0800
Subject: [PATCH v3 1/2] media: qcom: iris: improve gop size support for
 gen1 encoder
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260624-dynamic_encode-v3-1-f2a2db0ac2af@oss.qualcomm.com>
References: <20260624-dynamic_encode-v3-0-f2a2db0ac2af@oss.qualcomm.com>
In-Reply-To: <20260624-dynamic_encode-v3-0-f2a2db0ac2af@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: quic_qiweil@quicinc.com, Renjiang Han <renjiang.han@oss.qualcomm.com>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Wangao Wang <wangao.wang@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782291107; l=3333;
 i=wangao.wang@oss.qualcomm.com; s=20251021; h=from:subject:message-id;
 bh=T20Hc/5VIww09a3QDg5vOTm8F29YjwiaOI4aLL9iMyk=;
 b=vKMyrWAfFzt/0DREubdOPRHels2Hv+N5DUfck7CbGyIU/tsXH7osPkUfBdssaPnNIvbt3M+C9
 Gnov/9QGuzWD9ay8PrMy9uW0AfJ33MdCf/0JigNeOMXxWLv37yrPih5
X-Developer-Key: i=wangao.wang@oss.qualcomm.com; a=ed25519;
 pk=bUPgYblBUAsoPyGfssbNR7ZXUSGF8v1VF4FJzSO6/aA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI0MDA3MiBTYWx0ZWRfX9NCoRap5azRi
 t19ytm+QKQW2QvNZKTFuJbuZ7idtGHUv2g8khLVHYPX/UUb3wPK57sH8+yOvbAVp3/g9ZT+jyED
 uX8WPiPgGNem8Knv9e4BxH0RbBA72oxE6e9k5eZCmK2v4h4VTWGifS27QFI/IplvJGT4ManF6Vo
 Pcj+hC5GQTr6JaGTWyzX3JA5LGNvS8t8gflXnWrmSydOQ/16d+GZy8Vo/TiTNdJ8aSincKR7ePN
 V/veOOYd1i9TkviKTjeEukzaVZTYX580dUn8sdZ1FUB+WWFYpCLd7Ui0kypSsQrTwjCQwaVFyXw
 Og+GKEnG+TYBwTHY89GVJX3pBzHiYmwp5ANS9uDil4dkoGHSniyLlbq10OQBTQLkt5yNbnxG8p2
 LFRCxD62dTkm2L+9ALKs5MkskEGNt368xmFXyPN71jmN6YD6Ia67WCGixwNKlFdkur2zhFyEs5d
 0Qbbk1oR7VlKGeeAc0Q==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI0MDA3MiBTYWx0ZWRfX87n9oRruv2+2
 /HE2KCC7aXJS2+KAkFLI2ghEAStsteNWP9lQhXFjDq3APQAk1iGELKkqx+pAZtlfQ4SDnn2A2gy
 8Y8brzVyhKZ/8qrebzDa9ExfxhhBBSs=
X-Proofpoint-GUID: bsmS9gXTawCy9xZTdaGXA2-QUOCSKaMd
X-Authority-Analysis: v=2.4 cv=AJDhMgPs c=1 sm=1 tr=0 ts=6a3b9aab cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=pGpWkYCgaWylbXxf8R4A:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-ORIG-GUID: bsmS9gXTawCy9xZTdaGXA2-QUOCSKaMd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-24_02,2026-06-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 impostorscore=0 clxscore=1015 phishscore=0
 malwarescore=0 suspectscore=0 bulkscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606240072
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-114309-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[wangao.wang@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:vikash.garodia@oss.qualcomm.com,m:dikshita.agarwal@oss.qualcomm.com,m:abhinav.kumar@linux.dev,m:bod@kernel.org,m:mchehab@kernel.org,m:quic_qiweil@quicinc.com,m:renjiang.han@oss.qualcomm.com,m:linux-media@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:wangao.wang@oss.qualcomm.com,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wangao.wang@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: A9E196BCB8A

The GOP_SIZE cap was missing an hfi_id, so it would not interact with the
firmware but could still save the parameter passed by the client.
INTRA_PERIOD was acting as GOP_SIZE here. The code was redundant, so the
two caps have been merged.

Signed-off-by: Wangao Wang <wangao.wang@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_ctrls.c           |  2 +-
 drivers/media/platform/qcom/iris/iris_hfi_gen1.c        | 16 ++++------------
 drivers/media/platform/qcom/iris/iris_platform_common.h |  1 -
 3 files changed, 5 insertions(+), 14 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_ctrls.c b/drivers/media/platform/qcom/iris/iris_ctrls.c
index 10e33b8a73f60759c4f1cb17b5c95897f0e1468f..391e1fc5f6e2ec8e9cf5ba4e0f76b2d1da3e2a35 100644
--- a/drivers/media/platform/qcom/iris/iris_ctrls.c
+++ b/drivers/media/platform/qcom/iris/iris_ctrls.c
@@ -1293,7 +1293,7 @@ int iris_set_use_and_mark_ltr(struct iris_inst *inst, enum platform_inst_fw_cap_
 int iris_set_intra_period(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id)
 {
 	const struct iris_hfi_session_ops *hfi_ops = inst->hfi_session_ops;
-	u32 gop_size = inst->fw_caps[GOP_SIZE].value;
+	u32 gop_size = inst->fw_caps[cap_id].value;
 	u32 b_frame = inst->fw_caps[B_FRAME].value;
 	u32 hfi_id = inst->fw_caps[cap_id].hfi_id;
 	struct hfi_intra_period intra_period;
diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen1.c b/drivers/media/platform/qcom/iris/iris_hfi_gen1.c
index ca1545d28b5310d8c45a905287dcb69f6184d9cc..eff9216bb50143c0d752051a6400605bbaf3803e 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen1.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen1.c
@@ -171,7 +171,9 @@ static const struct platform_inst_fw_cap inst_fw_cap_sm8250_enc[] = {
 		.max = (1 << 16) - 1,
 		.step_or_mask = 1,
 		.value = 30,
-		.set = iris_set_u32
+		.hfi_id = HFI_PROPERTY_CONFIG_VENC_INTRA_PERIOD,
+		.flags = CAP_FLAG_OUTPUT_PORT,
+		.set = iris_set_intra_period,
 	},
 	{
 		.cap_id = ENTROPY_MODE,
@@ -240,7 +242,7 @@ static const struct platform_inst_fw_cap inst_fw_cap_sm8250_enc[] = {
 		.step_or_mask = 1,
 		.value = 0,
 		.hfi_id = HFI_PROPERTY_PARAM_VENC_INTRA_REFRESH,
-		.flags = CAP_FLAG_OUTPUT_PORT,
+		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_DYNAMIC_ALLOWED,
 		.set = iris_set_ir_period_gen1,
 	},
 	{
@@ -281,16 +283,6 @@ static const struct platform_inst_fw_cap inst_fw_cap_sm8250_enc[] = {
 		.value = 0,
 		.flags = CAP_FLAG_OUTPUT_PORT,
 	},
-	{
-		.cap_id = INTRA_PERIOD,
-		.min = 0,
-		.max = 1,
-		.step_or_mask = 1,
-		.value = 0,
-		.hfi_id = HFI_PROPERTY_CONFIG_VENC_INTRA_PERIOD,
-		.flags = CAP_FLAG_OUTPUT_PORT,
-		.set = iris_set_intra_period,
-	},
 	{
 		.cap_id = LAYER_ENABLE,
 		.min = 0,
diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
index c9256f2323dc4521f9eacaeffb0fc08a180de3ff..ff48333ad089894c3393e8ad45903c2603288eb9 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_common.h
+++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
@@ -165,7 +165,6 @@ enum platform_inst_fw_cap_type {
 	USE_LTR,
 	MARK_LTR,
 	B_FRAME,
-	INTRA_PERIOD,
 	LAYER_ENABLE,
 	LAYER_TYPE_H264,
 	LAYER_TYPE_HEVC,

-- 
2.43.0


