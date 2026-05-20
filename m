Return-Path: <linux-arm-msm+bounces-108795-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MD5pMr7MDWqq3QUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108795-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2026 17:01:18 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CA585905ED
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2026 17:01:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 49AE730A722E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2026 14:53:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 62D623F1AC8;
	Wed, 20 May 2026 14:51:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PrchZeNn";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PWZ8Po9s"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02ED73033C6
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 14:51:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779288703; cv=none; b=Cttsa/QYEQLDlTTSwUDqjlGsX6/JziqPcDh+BG43Y/sAKE4uWEevpPEtLg5iM0h/RbTP9J1BCfLimzSPjpvGSMXLF+PWbcAShgWG0MyWdS8HPxLXO+w9DUavDHkVwA4vwzj43oX496MkVRm7xoeLiaV1OEf99gLDnE68GQKuI/4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779288703; c=relaxed/simple;
	bh=YFsDO3JoZHZoGFeDfQhOfrhr6lwbEX34GrHVmQ8WqWA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=a47cp+epxt1A1zkhV+ozLyuHE3GkbcX6eA6vJogKBddqQ9sNf++WErIELhX4MtkVh2PfsxDYH3ZoR/IsXn9qx6IVZEQSsn8E4D4OFBFf9cHkicicWpvH2habZLhO5XvQz4VEA5UTATtc4kqcq7g8Uedrlf7LwP4pgumPkb3jhv4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PrchZeNn; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PWZ8Po9s; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64KDY5001798819
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 14:51:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Eeo9ei59HVM192M/bjlrRrRCHN6RB/mEIWbOlSQQvRA=; b=PrchZeNn4t63qFdf
	hI9nUi+N2zDsKLFEmdhmBk6+coqYiT3hDhl+HbWzIUcZGgS/1Dx1tzzEO7ODOgZT
	HE7CYaree5WiCxFSyayaTyeC85DLnnroH1BUSmsBg6L+pfUtIJJygzI2/H8cfgO/
	o9A+mSUP9CY244jqyHZNMtQgz5lQOXmhvL9hKTdKvERCWNxyukx3cyapv55CfAsJ
	bL6vJS5HU4/0LsX5CtaW9d+eDWL8KLRGAhymEIBwQKfLao9H3hUldX6rv27IXJHP
	HdjXOb4L+pnjvLowcLnYX3nmAya/r74lIBY809Be3SNyxcAJHAkHrh5HvzuT9eeV
	iTcmTA==
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com [209.85.222.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e9dxu0a0s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 14:51:41 +0000 (GMT)
Received: by mail-ua1-f71.google.com with SMTP id a1e0cc1a2514c-956732444ffso9367876241.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 07:51:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779288700; x=1779893500; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Eeo9ei59HVM192M/bjlrRrRCHN6RB/mEIWbOlSQQvRA=;
        b=PWZ8Po9svRMQKDK/EW67zq3Q9y6/Cfyk1eZTAiSxKeZJ1ibZEuZ+nvB3ZNdt56b7wL
         XHLop1DLvj/9IMkafGlQpa4f3QjrraERSrUJAoVIKaVsJRO40M4vOVdJ3l+faPkZJKSw
         4+5C3Of5M/TB6W5YwnUT5BaDdP3WYqo5OBeCCY7v9hGEOJUgzOB/N9Jh7P8JTf8sPPqn
         seEnk23tSoVNlPHcfsqqGHGoARYLMh6WX05GUPw4dlgLUVP4d8sdZ08p/ApWzewv1iNf
         sWKJrEiAJ8vCHdc4pIBapA44cdCRMj5TRDRjm2tFhti96SfwljleT+BmCC2BIWCB66VB
         GomA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779288700; x=1779893500;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Eeo9ei59HVM192M/bjlrRrRCHN6RB/mEIWbOlSQQvRA=;
        b=tA+QJgwTDcHKRWSXARweMYNEQ/oIsLD/hzaQReOsoljEWeVAKqthEVAkTIB4Nl7+Z8
         aKOmWKdj7rA7eJFcVQR930B5oymWMmKxboisi9CCCJGJ0n9LJ2RVQ9zhHH3WzCxWsZfY
         ShMT4Ppgf9goIewNCwC173F7VLNDo5BWMbEjnYWbRicaC0o9MoTluvuwQI7/kz3P/RoX
         jvG8vfjJEbzVpBm9VQDeVNEm0L6xBolBNB0p7pJdhw07kH2eKKV9mCvAgwtnhVZ6jzjH
         iRXRNk4cLPzXvQpHqvqjQQ7DQMM8321F9ts+wjBEQ+KfImsZaaw72IX2kTYf7vvjzMjo
         3b+w==
X-Gm-Message-State: AOJu0Yyva09dQrLmjahyb6IpC7zCs/6Mj1owwihxWOak0k1/iKPX4eaV
	m3GdXRD1qLLH0596neFg5iqn207H72t6JyPTPMyUVIowAoPY2hDerfU/5Ejn8TiJ9xErg2FdSDq
	iHq1yHRQv+FQo6drpYo/Fy+mrBE00lN0CP+XFfIgJqhTr7pLOl3wv2RE5CLnqCY4ES4Ex
X-Gm-Gg: Acq92OF0zSTV/hHGql48Asxg126LdlKKG1IPlnzjgfxiGUMqW7uCAN4zTI6WDkhU6Y6
	iwQOT7F3pzNd59uspMjgGRrj4m6A+2Dq42uCYaUBKnGKdZ/74KwM6sV9UhnIKOfmmAHgXQmr3+q
	P/+c1bcrycR7EWH/WiL71uQFoqhRthJMlUh+1lNCwwEPgOFUAnWZwZjv4PZU/wKzHaTrgA2RON/
	Y/GN3e+8i6DxFRaZ3C3AL/MD15uQCZoV2fEfRBp3/MHkM4SIt5ajIn85DJ1cTrpJrgpocmhWgQk
	cS3A+285gseEpNTwz5zh43euH5sagVEnLP46co7cmG53lkpahwEWEW/psCWH6MIecIdliLqaLJ5
	olEgrpFOmM9ZfZayG2Rs2/WALX/I2nmPMVciIWj7vZjKOeNT0ssZjpjvCP/TroiG3JA9hU3TMcu
	e+FTBZWaJ7PRUuyNDvttLOWd/+nvNEK7oa7OA=
X-Received: by 2002:a05:6123:4201:20b0:576:1a8d:8989 with SMTP id 71dfb90a1353d-5761a8d8c59mr8715743e0c.0.1779288700172;
        Wed, 20 May 2026 07:51:40 -0700 (PDT)
X-Received: by 2002:a05:6123:4201:20b0:576:1a8d:8989 with SMTP id 71dfb90a1353d-5761a8d8c59mr8715554e0c.0.1779288698506;
        Wed, 20 May 2026 07:51:38 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a90f10c78csm5128907e87.14.2026.05.20.07.51.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2026 07:51:37 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Wed, 20 May 2026 17:51:16 +0300
Subject: [PATCH v5 09/28] drm/msm/adreno: use new helper to set
 macrotile_mode
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260520-ubwc-rework-v5-9-72f2749bc807@oss.qualcomm.com>
References: <20260520-ubwc-rework-v5-0-72f2749bc807@oss.qualcomm.com>
In-Reply-To: <20260520-ubwc-rework-v5-0-72f2749bc807@oss.qualcomm.com>
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
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1616;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=YFsDO3JoZHZoGFeDfQhOfrhr6lwbEX34GrHVmQ8WqWA=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqDcpnptHF0cvSg3htcJq2qUXfc7rPQgOHPfOdq
 mBQUOPEJEuJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCag3KZwAKCRCLPIo+Aiko
 1XOeCACgNFmMquQqVD64f6D97uj9j4yaAvvnVe7hHODyf6xs4Tht7rToBtBXI5vtut61hXLdZtt
 pUPIIpKjZC5IefW2CW7cZbapGVw52IX7S0gZMWdzssgJ1zofLqw/l7L31dhnOsRErb+xw6vLFXD
 oq2f1rKKdsNyAEGhYvAdWqLE/vAW1f+YUtELLLAfKUWUABnuqOwhxTkMGB1dBcNg+FpLE+vgLgH
 vTlaJbl9Ue0RKvnA+bNQUi6QrzaeIsbDM6X1n9HCwEngjVZ2/O6E2XlpTJz2UluZL7yCORc/lbK
 GIILktH4y1Ehl4SGViyL3BmgOLIbv8sWAxZ97EoEQH4LPG9u
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIwMDE0NSBTYWx0ZWRfX+s9cNCD43DuU
 PQjP9p69wEd/962VsYd0dFVyOcnwy5kisY7izo2ZSN1OyJhTV4p0GG8Tk5N/l8GohtZ3C5l62Sj
 hPwQD4UxCr11B+csEOEAGY3y7yq2x2zYgI6fuSrSyHiovpucUIb5SNQPr0Kbh8tv2zbLPeJ05DQ
 yElILJAJ67GRQt0weMM377OVxe0hXFgWMwKAW8CoJXyoEMRCHaR9RfntcvpkA4nEkMAwNdeuDCB
 0smC8mUNqYAhA23xRVtrU1NdEetKZwFpqa6X63/NcCrPs3lCGdzP/cKaajXlYoOoPjEYkFCLesf
 e9YlKSEGCf95fx30JPUqUjeQBtBDFk1O1JUQ+8oMlBOEAKCq7LW9JuDDqyFLFKz2A0g0PSOqvkP
 yvmMOvMDXFRJ+6bJ2xZbtQ4ml3lFt4jBdXUq1dnzZkBTIUXmRpXPDRIRlWgxvHQs2rfS9fpePnJ
 VlD+bQk8XOAswu+mPHQ==
X-Authority-Analysis: v=2.4 cv=Zckt8MVA c=1 sm=1 tr=0 ts=6a0dca7d cx=c_pps
 a=KB4UBwrhAZV1kjiGHFQexw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=AuD0-tKUimmDNzgPTmIA:9 a=QEXdDO2ut3YA:10 a=o1xkdb1NAhiiM49bd1HK:22
X-Proofpoint-GUID: HXSX6fbkRpe-760DpcGo90gGZiJx5DB9
X-Proofpoint-ORIG-GUID: HXSX6fbkRpe-760DpcGo90gGZiJx5DB9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-20_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 priorityscore=1501 malwarescore=0 clxscore=1015
 phishscore=0 bulkscore=0 lowpriorityscore=0 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605200145
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-108795-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 5CA585905ED
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Use freshly defined helper instead of using the raw value from the
database.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c   | 2 +-
 drivers/gpu/drm/msm/adreno/adreno_gpu.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index 45c966610511..43818d1907ab 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -791,7 +791,7 @@ static void a6xx_set_ubwc_config(struct msm_gpu *gpu)
 		  min_acc_len_64b << 23 | hbb_lo << 21);
 
 	gpu_write(gpu, REG_A6XX_RBBM_NC_MODE_CNTL,
-		  cfg->macrotile_mode);
+		  qcom_ubwc_macrotile_mode(cfg));
 }
 
 static void a7xx_patch_pwrup_reglist(struct msm_gpu *gpu)
diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
index 03f96a1154e1..78d7ac3fd8c7 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
@@ -439,7 +439,7 @@ int adreno_get_param(struct msm_gpu *gpu, struct msm_context *ctx,
 	case MSM_PARAM_MACROTILE_MODE:
 		if (!adreno_gpu->ubwc_config)
 			return UERR(ENOENT, drm, "no UBWC on this platform");
-		*value = adreno_gpu->ubwc_config->macrotile_mode;
+		*value = qcom_ubwc_macrotile_mode(adreno_gpu->ubwc_config);
 		return 0;
 	case MSM_PARAM_UCHE_TRAP_BASE:
 		*value = adreno_gpu->uche_trap_base;

-- 
2.47.3


