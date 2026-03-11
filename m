Return-Path: <linux-arm-msm+bounces-96835-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kIUpG7bgsGkuoAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96835-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 04:25:42 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C12425B89E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 04:25:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 1BFFA3043E09
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 03:23:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB7C736EA82;
	Wed, 11 Mar 2026 03:23:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bi+uN3hA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZfOgZwAl"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 538FF36F427
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Mar 2026 03:23:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773199426; cv=none; b=iMTunw+z6uYrVZLSqPBIPNAMOzQdCzU1sfiYY/fcw0QTnllnGsLampmWdqKcXQE3Zh26JDeFCDR19QdmrKMTx++zLKg7jW8LadQlcLUzDHyj7JFyO1IxalbGFSvWFOybRU8CaR/2Q26hodXt4UV9vUr7b4MhpU5+ZcCNrq42X2c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773199426; c=relaxed/simple;
	bh=2pmZHdByL6nsS8Ik/InzKdBxSCO/78Oop/N0tOJ6bIw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=E5c6DDzRg2goNLd5TGFgn06Umo7VkwvzLr80Z9EbJyVr1xnpFl6tShVn9n5n90eCp3HAwG5w1NOzciGOTAuGKVW0lXrlJhv/AVs5N0tVmPBUkoUFhIZkdTqZfMVQxP2cswy2ZzhhYANbKrIXOrPTWMYnk4fnaiLMNflJAi58gxA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bi+uN3hA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZfOgZwAl; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62B2vuuQ1574238
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Mar 2026 03:23:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2imLQEZ3DP0uNNL0l/EieMjW7GOO6W8UDPQGg+15sw8=; b=bi+uN3hAWT64qvot
	eOcetLiARrcyKxacyWz2TvMFQwS135aPvpmnm+JOxCuU08leJ9Ts+zk+hU0Of5LQ
	EyGjjCAvOxC91iMJtI+f5ZbzCpVSU+8mhUcTjyQjAEtmMpb5ClSL5iif1TkcOPxq
	4T0bqKiksAojNlmS5zhiE8bDjeg3/JChKjdDAfpECq61ep+H022rLhoeeUhko6Je
	gHyW3BCKAq5HPaDvn5oMrnVu4WGgoGMOs07iE3gTG0vUmSZ1JMbRbPglMKjewQT4
	f2+KCsrFkfJOW7n/22XCJRIKxLieZzD8lM6VhMJ0FI4LPoAzKqMUqIxnJD2AKAwq
	jEE0Ng==
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com [209.85.222.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ctqgk9ra9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Mar 2026 03:23:41 +0000 (GMT)
Received: by mail-ua1-f72.google.com with SMTP id a1e0cc1a2514c-948df60cec6so19447405241.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 20:23:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773199421; x=1773804221; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2imLQEZ3DP0uNNL0l/EieMjW7GOO6W8UDPQGg+15sw8=;
        b=ZfOgZwAlEx7KclAZr4d/qxbICcSxQOE080caJG910wXZk9tbZ5SydoOzJE/lWuVHxB
         M8/aK/eyq3ISt28+PGZNNOYAHHR90VIps3tSd7aq+O6m1E3cDimcVMHsOvZqD5hK++uC
         zVSplGDBBJ/fialQtRPvcmosjhkvvFo0NaGIFhhlAJiUnlK3tSjqCDko1hMgRCS1j2Dp
         Q2F3SHnFU8q16Uhl1aFg+70c8wuM5Bc4fzVqg9hLB38c4ZWQF8ul/2AdV76VXIHa4jcD
         4yawbQXXTdr3wgtQNCfvRPBzUtiz8xORgEmuNCS1zScCkIpF1owi5vpd4SWn1sOWE+tp
         hUog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773199421; x=1773804221;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=2imLQEZ3DP0uNNL0l/EieMjW7GOO6W8UDPQGg+15sw8=;
        b=LKKaP0womgOIse/8iHHLcVxF7miDxtiskJNimJA8Eyx/lsldwrJDMnuKcAcl7sO0pF
         EWdUf9HI0szK6hWhJhjlVselTGbNxdUD1puic41xIp+pfJ6zN1T5Se0oVH4x3YJUwCRq
         6orptj9TM5V1Va1JugbLyNZ15B7xDsb3Zix5PZio2u3Y9Kts5hIcydzRHNmt8FI0BmxV
         9VXeMlxgONEgGPbki5hY376Cdr7X4+PLOhBJg5oybl6xZVJpy6NlrsSPk/y8nXiU/mGM
         lP9OGjbsFnmjpmnSlI95ig16bnjCfRrmgC5Xiu5/j3PyFfiGco/SCY2RXAzPHFj0l5PP
         rs0Q==
X-Gm-Message-State: AOJu0YypVaqM/keet2VQOLuWCCSwpXiFQ9bq4yEmvAT+k0olP7Y19Vvi
	Ulo6mYSMPtPpvyFFvl/nZC+eeXm7sb1AnVV46Wn/G85jiAW6kKz/xRQzZs9vKGVTONqcdyj4FVs
	lmjajGJrv95XdRJqx944SYTZzIjc2h0i0bKnR0GW28lb5e58iGwhY+9UeHAsktxHYBuA+
X-Gm-Gg: ATEYQzz4Ue0vXxilGDO7+sxeG88GtOqR1TquO4Lv8LZOyk5Ur+WN4eO9I1PcawQSzIX
	fSILawPUgwIr2ylh55fcevfX3s01dlIenleOxqwGE8I6m1HMvbbyktaQJv5KInxFlGE03DN2GHn
	zpI9zUGJjNJ2dv8HkVKJyNQqjqMNMlYn9kchtEzOX15EQTTOMfXtBiKMycT0FKAEIK6XrLHeC8R
	UTLaWlSVuVWiUd4PzrpyAgC3fmTvpe27VCBOKgs3zq+UshqYaoOcZSr5qEluqGKsPzPgxMTm9y8
	2dy1cRAjIrgiHxQlj4sdHW9MFxhsc8SIjcQxwKTX9gIiierFC/fwHKXVyIQDsn9EgXI5KqcZrhT
	Zt+nWy9Q7g3i1L1ArsIPO7EVfLqzXhk+JdawpGugWVupd4EFp7UIehaHMBM069bpqvyiIRH720G
	KeMAMSB5E+cLZ2M7h6scxJ5z/v+vVVRQFkO8M=
X-Received: by 2002:a05:6102:c0b:b0:5ff:dd9f:3ea1 with SMTP id ada2fe7eead31-601df08a60amr335105137.39.1773199420650;
        Tue, 10 Mar 2026 20:23:40 -0700 (PDT)
X-Received: by 2002:a05:6102:c0b:b0:5ff:dd9f:3ea1 with SMTP id ada2fe7eead31-601df08a60amr335102137.39.1773199420280;
        Tue, 10 Mar 2026 20:23:40 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38a67e5ed41sm1422721fa.25.2026.03.10.20.23.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Mar 2026 20:23:39 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Wed, 11 Mar 2026 05:23:03 +0200
Subject: [PATCH v2 09/25] drm/msm/adreno: use new helper to set
 macrotile_mode
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260311-ubwc-rework-v2-9-69f718f2a1c9@oss.qualcomm.com>
References: <20260311-ubwc-rework-v2-0-69f718f2a1c9@oss.qualcomm.com>
In-Reply-To: <20260311-ubwc-rework-v2-0-69f718f2a1c9@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1533;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=2pmZHdByL6nsS8Ik/InzKdBxSCO/78Oop/N0tOJ6bIw=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpsOAechTZ9XoAK7n5aLj/5yAMGhW3pYNcBz9gI
 Rxy20WvghSJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCabDgHgAKCRCLPIo+Aiko
 1cVlB/914twfY2YCfjzpjaUgBmoWPZo6OmU6kpXruh6VZB6E/hMqaUg6dGhJYhlihvuO0SYBWlm
 jQiT9TvIPmEPd+CqCwd0wYr53qzzTzXLpWxuiUl7KJw81kAVFD4wf/0hJcwBC7d/2A+2b0Cmt/m
 MIVG9t+S2MDebnyx6BIwgRkcTewT4CM7EccnMwNhwjlgbplTCwwUtG1jivv/FFrHqvTRzHweb+I
 89nEbY8I4CrdEFLoX3rd+hye9bVV5KcXWeiZrRXlP28tJSZUNrTJzXlIELB6iWU5h8/Z0TgthjV
 CR8IyU77NPVvbOiZyis2JUu2lQ+55lbAVhzcBTOR81RoInaH
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: NhogKp9eQBhrihAuKIojH3NRklcul1Yw
X-Proofpoint-ORIG-GUID: NhogKp9eQBhrihAuKIojH3NRklcul1Yw
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzExMDAyNiBTYWx0ZWRfX+daiEd6VyCZg
 DJSuCrw4kP6yE8IAZi55Lo1IPYOsN1fcgjlk6oCFozXCOGePuiiA/z1MKr5BFzRwhC7dXBDejP9
 sk0QB0rxz/XsDCSGmByMLVcvFDmi0UEimF31ocMqWdCvEDa4snl40X/LZCmK0riWmLrSSyis1fb
 F1FIfa3JvITbzCluwHICH5DuI59wZdDcVU0d6y2Gts9S71M/D7zhC5LrgoQw1W/LETvof5wGKFM
 d9/igExv//hlnRlISOV8Zgr2MVWpmALt6MEe26ihqCSIAi4yo4Bs1uvvvwfvanLYKP1uN0TrUq5
 Fzh081N3pTXZYN0SX2WG+DMlcwrlunXUgIl4P81q12EGkK2arHBUvA6gmjUJJ2Y5m/oF2IK6DUh
 M3mtuH21mZUGXzEyC8m36YdSVxo3H6z0lnQ6RzVo1Teno5SG+4XPxIGuJcTj0j8T9Bfv3qtONyR
 rgNF7VFboYK2uUSF4uA==
X-Authority-Analysis: v=2.4 cv=M4JA6iws c=1 sm=1 tr=0 ts=69b0e03d cx=c_pps
 a=ULNsgckmlI/WJG3HAyAuOQ==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=8BxV0iZMnHvn5dZpj2MA:9 a=QEXdDO2ut3YA:10 a=1WsBpfsz9X-RYQiigVTh:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-10_05,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 adultscore=0 lowpriorityscore=0 phishscore=0
 impostorscore=0 spamscore=0 suspectscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603110026
X-Rspamd-Queue-Id: 6C12425B89E
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-96835-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

Use freshly defined helper instead of using the raw value from the
database.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c   | 2 +-
 drivers/gpu/drm/msm/adreno/adreno_gpu.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index 2027e479d5b1..56a820ffa613 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -787,7 +787,7 @@ static void a6xx_set_ubwc_config(struct msm_gpu *gpu)
 		  min_acc_len_64b << 23 | hbb_lo << 21);
 
 	gpu_write(gpu, REG_A6XX_RBBM_NC_MODE_CNTL,
-		  cfg->macrotile_mode);
+		  qcom_ubwc_macrotile_mode(cfg));
 }
 
 static void a7xx_patch_pwrup_reglist(struct msm_gpu *gpu)
diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
index d5fe6f6f0dec..4814233d8dba 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
@@ -435,7 +435,7 @@ int adreno_get_param(struct msm_gpu *gpu, struct msm_context *ctx,
 		*value = adreno_gpu->ubwc_config->ubwc_swizzle;
 		return 0;
 	case MSM_PARAM_MACROTILE_MODE:
-		*value = adreno_gpu->ubwc_config->macrotile_mode;
+		*value = qcom_ubwc_macrotile_mode(adreno_gpu->ubwc_config);
 		return 0;
 	case MSM_PARAM_UCHE_TRAP_BASE:
 		*value = adreno_gpu->uche_trap_base;

-- 
2.47.3


