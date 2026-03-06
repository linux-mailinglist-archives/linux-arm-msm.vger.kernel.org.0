Return-Path: <linux-arm-msm+bounces-95885-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +JqIAkkFq2nDZQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-95885-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 06 Mar 2026 17:48:09 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id AF4702256D4
	for <lists+linux-arm-msm@lfdr.de>; Fri, 06 Mar 2026 17:48:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id E9B593012520
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Mar 2026 16:48:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 97DFB401484;
	Fri,  6 Mar 2026 16:47:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YT1MJ58+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AFsSOE0v"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4620C41C0BB
	for <linux-arm-msm@vger.kernel.org>; Fri,  6 Mar 2026 16:47:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772815658; cv=none; b=pPxric+fGOK93lTJpslqPlNdYwiv2Nqlh6RGlVS3Xu8KHAn2hnbWx4IRHWxnEQaHlBVkZXkw7iuacZoiMSNAMm/d8uCGC0pp1RMar8iEFWL6wDzPfq4x/HfhABS8/ZVkd4CBXO/YPHO8NqHgMSSnkxao0C79qZwsOom8Dw/DAN4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772815658; c=relaxed/simple;
	bh=2pmZHdByL6nsS8Ik/InzKdBxSCO/78Oop/N0tOJ6bIw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=uUvn+4Qixm7EJnC6zOGo9AVZ3BQMuD5n257bKnGbMEB0bceSqq3Acim6p8LM9oprzjKZAdVZASLpWlZCENV7t69RwswIjAyTWP2Eujca+BZ+Y7X+/B8xDHgLH9PTC6rTKky7gaiYiZXrbHxI6BH0FMwV8NftUZQFI6b9hYOkrx0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YT1MJ58+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AFsSOE0v; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 626FrNFS550604
	for <linux-arm-msm@vger.kernel.org>; Fri, 6 Mar 2026 16:47:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2imLQEZ3DP0uNNL0l/EieMjW7GOO6W8UDPQGg+15sw8=; b=YT1MJ58+zS/vxieL
	iQToHMG6NFJ7+kvIo5dasQKgmMzRg//1iAV+FAm+/iMgLQKJ1Uk909c/QKTzH9sN
	JhkDTO1nxVAx23B5XgGqSDvzYQZvzSZGfQ/y312ohYTjtOy654y4ww3zxaDRbhVq
	LQvLJDVeRfSnjT9OY/57cnGjdU+ZCu4tqltF0jLho9PFBzkc756zElueWOLoTmfi
	Rr73VKW5qY3qyiWOBr2CvEPMWAKhVXkb9HqgSa8moUloE589Egwpk7phuCsYomk/
	JxnUF96Of8zvS05q5ePWpVCE/3YsKURQktRR8MyTolcn/vSfZzJThJXzWIoBw2pH
	EO3LXw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cqruka67q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 06 Mar 2026 16:47:29 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8cb3b0d938dso5942709285a.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 06 Mar 2026 08:47:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772815648; x=1773420448; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2imLQEZ3DP0uNNL0l/EieMjW7GOO6W8UDPQGg+15sw8=;
        b=AFsSOE0vJmgW6nLYyaN9d9d9uIvNMZ7phuK1Q7n9efpnpdxf38UiLAiHiJ1YYhKh7k
         4Frm/b+owocS/zFa1yvWw6Z1X5l7oOmZEegahtOrIknncpaMq72oXuJbDxEUd/qiFdWt
         Ke61IkJo7e3M2YZcxxjIS6szbijzjMl3wQgrqETGJbL8++L2oxp1rTFUnjRs4WNt5D0L
         as9hd0JxwzSGZuE1npsMkNQFsHuJQ1GB/nKOpDH8vsLbLa86JkyYtvid1fIdOI9EerzA
         F1pVD0rtcobTHpISuqubH3qfA0EVBgJ2D3BkQDv8HEZMGkbvHLCN7hgMVcMe7bdPmOcw
         BdMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772815648; x=1773420448;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=2imLQEZ3DP0uNNL0l/EieMjW7GOO6W8UDPQGg+15sw8=;
        b=dZAp6wRLmOrXQjjZo9leNUx8M0sWlhWR3QF3p+33ssTtADR2nmKIxBBCEuv+nzgQ//
         W4oOAiaArH1O6axxunCfE2YQCB/bZeTJUxddSEACPyV9W7FR7aUdd5EqBymJjZRKqeLz
         RNQXwGTSDrYG5APi/NhxP2sQTwvbMrlvWeONwoVcYgTzTq2o60ImK28vPFwevz5LABJi
         RczbsXbGb7tu+ESqCyOlOVttShIUwOfDamYLru9TLGlAdu8Asr8Cb/G4xXEVExkIL8l0
         crpa83qrVuQeQvSXvx47dFtPR7MDYk1i7LDc39Wej8ZN0u9vJ1nMGs8m5lzxciqBNyZe
         ySwA==
X-Gm-Message-State: AOJu0YxDjhfsuty5i1rmsypuH4RUE8gxdIAG+ZlK/bJrchRwgPPnCYEF
	XUQCilHPRUmNitpYBdvfuX3a7crVM8Dq+U9qRB30KEPasKNKtd1lbNJbXUcd67ypp3+XFeACkfx
	iyN8wu26Ob6sb/gEKVYBA8LnhqrDfQ3zerWEUZCvhRoJ9LwCTOi7xQyMUQquPsyhy/yCa
X-Gm-Gg: ATEYQzxeY8thp1diSk99Uyzcp70HHBSKhXN/58KXhnT0g7XOLc/4W2S47YIWT0N2ldC
	37jr6sU3OXj02KeHtnkoiyKd165yjwtLBazYXuFiFLR5ZvG4Iiq7pN0LQrmHq1yc+WkG3AjJ2uF
	qXSj80Z8T09k5TZczrvzaLslNgaETxP3s6puzLAXS1S2aBvIXPrpKz17eXD8kFTitdkTpR68KC5
	T1iyyaJOGcmLfc+HZ1IigowpnIZJVxt12rcwAROHqCNFFgQ/U3ubMzeT2xWhZ5h7E/VwvQm+5if
	FD3uasE/S61BMrUzvFmuzLzdvnQ3aj322tlT6IjFEy2+uXwBqh62fr/fSsCvcNOISUKL+BQaSIy
	h5ME84/Fh04gj04W5XpKK6G3O/Be3ydz9I+TWRJqp3AAByQoKZU1sauZayPfNo3lrkKRjIcDgaO
	+hzeBCUTRXVuo57WGuBzoPGd8X1ZSsH7uN9YA=
X-Received: by 2002:a05:620a:1a9b:b0:8cb:4c23:3de2 with SMTP id af79cd13be357-8cd6d4fc41amr337643385a.76.1772815648332;
        Fri, 06 Mar 2026 08:47:28 -0800 (PST)
X-Received: by 2002:a05:620a:1a9b:b0:8cb:4c23:3de2 with SMTP id af79cd13be357-8cd6d4fc41amr337638085a.76.1772815647750;
        Fri, 06 Mar 2026 08:47:27 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a13eaebd0asm213804e87.51.2026.03.06.08.47.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Mar 2026 08:47:26 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 06 Mar 2026 18:47:14 +0200
Subject: [PATCH 08/24] drm/msm/adreno: use new helper to set macrotile_mode
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260306-ubwc-rework-v1-8-9cfdff12f2bb@oss.qualcomm.com>
References: <20260306-ubwc-rework-v1-0-9cfdff12f2bb@oss.qualcomm.com>
In-Reply-To: <20260306-ubwc-rework-v1-0-9cfdff12f2bb@oss.qualcomm.com>
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
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpqwUN3jF8qXyArrCcHGzumnoU/rLkRvcjzIeeW
 u3qt/YDcJKJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaasFDQAKCRCLPIo+Aiko
 1Y7oB/kBzsVGYGRPO8u6SXF9W5IddIs+b2Kkr6+hZ2mQBAry76g7CM7RK16IvDydZ5Oz0QWS2co
 F4m6FvQpl9umm6E5jdlKnyWijC6NERW46twWfyKw5Za7W14lI/dvgJEtUJzni/tVTfoBAFj79lb
 0/tbqV9/co5GDj9wmVKJXOPOPgezW7ZqPWsAC84yIfifeoXnm2s6MtO1iCIK62ai2Fhbo0oeeke
 rwJz2JaxIe5xch9IztaFL7uo6SXBkoHQcqiDol+v9AThjfxel1nZcoqUos+8nuV3CU1IRRETm1M
 OSy0rXgqC6Kn5y6PfOuSaswu34+aYvBWPDJam3SpRRs8yslg
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA2MDE1OSBTYWx0ZWRfX/LdPTMpjgSCK
 rPCBzkXGdU/JJG1ynsYgF6uyu5CoZlYXzV9v1SgqL0T8VChsLbzfjh7oX4JQ5rXBGRAKncUSOOp
 iGAwa0LBHJPMkh5lkanKf3ThP2cJMEGm7lYMeacDkFWhy7JE9sr3oS0i5RgLSCvQhmBP4e6yGW6
 qW6LCLTYheBRgSA6GWNrpJpBivdDZOue0KAXseYGbGlXaZdOkNgHWw0McPk/NoAaYlMKm6vbm/F
 O0XTXeLdf9JeyrOUevNYQ+Y8RuaaYGMOzuiqYnkqdAxniRKBxowoMO2o+KEdqy5OwZxsA2oHbRH
 pEq68S0ME/oNi6KHqfPE7e3b5M/sCVkBU1Qu7jBV/Fqh/s/wEFSn+Qh6r2V6ovlWtqEi3bKV+bX
 S4l6gJOD5t9bjPAWk/uDm8e0fl9JLgRmBwmdm1O4FTkDhF2fYPqokh+eIcWZAgFhU5mvjR2KSMo
 ZbSfqjvS2MuqoX/sALQ==
X-Proofpoint-ORIG-GUID: rIv0muxzjP1_Vykk8o7JqQb2NtosckIi
X-Authority-Analysis: v=2.4 cv=DvZbOW/+ c=1 sm=1 tr=0 ts=69ab0521 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=8BxV0iZMnHvn5dZpj2MA:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: rIv0muxzjP1_Vykk8o7JqQb2NtosckIi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-06_05,2026-03-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 malwarescore=0 bulkscore=0 adultscore=0
 suspectscore=0 clxscore=1015 phishscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603060159
X-Rspamd-Queue-Id: AF4702256D4
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-95885-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	NEURAL_HAM(-0.00)[-0.920];
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


