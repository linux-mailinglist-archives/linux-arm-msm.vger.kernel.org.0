Return-Path: <linux-arm-msm+bounces-95880-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WN3jNl0Fq2nDZQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-95880-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 06 Mar 2026 17:48:29 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 668F32256F0
	for <lists+linux-arm-msm@lfdr.de>; Fri, 06 Mar 2026 17:48:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6426B3008216
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Mar 2026 16:47:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BC78141B34D;
	Fri,  6 Mar 2026 16:47:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AR/QBSVF";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="escnOiou"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 491AC411610
	for <linux-arm-msm@vger.kernel.org>; Fri,  6 Mar 2026 16:47:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772815650; cv=none; b=NZiVjAgjECuvtpPCAU7dyI4JsGRip/c/rD0/foxYg3nDo7QHPbzjVswIbcvDlRGmcLYLeSo/KDCwXQevEwTRMlYRwie9W0GcSJMGfIL330Xbv9t0x1a2v0XNYxWqoLVEIqcFTqXlOTlktYTzdzKYVTAbqEPBdOzz+anXtlQMqOg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772815650; c=relaxed/simple;
	bh=gndBRl4Z4xRh4kFQivFGZ2SUW+Ocdg1Tl9bo+8948vQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ljzRjeT1e7cDmMw2KYk+N3cYHkaY9bsZZR7v40659Wv7PHHTiYTAgKbIFLut0KNWaquTzKMWYUOR/l5njmPRyif4sCEwQ9YLbSFopvvSBeJMHSBXX1/O4yEV8Z+2VPV8bx/c6jG/4FaNGYLMaDih723RIICs1c6m90Lo2CEvTJY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AR/QBSVF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=escnOiou; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 626FrEXm3960039
	for <linux-arm-msm@vger.kernel.org>; Fri, 6 Mar 2026 16:47:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wdo2GXNLuey4il0IRDIYFRsck7+hcgeJ1IZK0URwteg=; b=AR/QBSVFwClPDB+4
	l/HAexU3pYvX4cVToD+jpZAcP8E3/Mg+NmRwxxY2Nvr0GKlDs0R4ufepixHJ3JRN
	G6sYsWtKj5nWTKySjqFexMw9N4EzMl8d9Dp5PQi+g/a4H9YGNYUa8bazgaOwLuWU
	5zWVjhOP6+xkt7mZmT19rcniO7drEKsFHUtwGrhXu3Ro/tyBPhAGlKt0MJe3iGlS
	NGlHw/oC7La/5Bgor/E0v8BYQc3CCZUGOXA0gU3U9P6iJocKbfPD/UkLexFAUK7V
	MBrlnFlaC2vHHeSglMFYLJ6NS+JWHcCZGQonpQnKWvS4LLKmFVys/SOT6giszHT0
	0/JoLA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cqv9u9c9a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 06 Mar 2026 16:47:21 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8cb706313beso1228027385a.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 06 Mar 2026 08:47:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772815641; x=1773420441; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wdo2GXNLuey4il0IRDIYFRsck7+hcgeJ1IZK0URwteg=;
        b=escnOiouLrU4TkG7p0qDXPjwkrqzAHzHl1KG4sZKxALzBhXAv5n1juONaf61/NPvF+
         Xrn1ucBUEHIpD4nCdyhJA9xI4MIDtWkuOt2inNr0HoH3YJt5haYMj5LzNSjl+CGI79Bq
         BG98QmlCpbU6jP9hTVFKYKnhYKJiRxKM6mQGbVSxk2alULxWRR+NPuMDi8klxqp/umx6
         mrIYKtUs507P6r4hDxkw4uRKPEkr1ecYYQrpA7k5sqgeox/ey6Ck6baJLWx0yC/My022
         kC6kdhAEk0f27JLpBVmu3eITI6cBjitC0R6wUCRYv3MjN5m5DnNu47UKBN5qIode0vqO
         XrLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772815641; x=1773420441;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=wdo2GXNLuey4il0IRDIYFRsck7+hcgeJ1IZK0URwteg=;
        b=aFEsOP8RH62LCKJhv24W+RMpCDWs/fbtYJ3Q7SMhVnQtIjd5wSDJZuYdPHsArhAzAP
         5ARPe3n+jlHIu+7PeL3hDoSaWonR0it3F+diOj5xeJJthKl+4shsh6TVBAiNU6qI3eqn
         PwQKHzoZhF0ZsWhOVirRy/6UM/XA64SM2Pi7mSNhW/V+Ssx+q8wUR41O+VsXpsSiV+bj
         jbGmrY6oG8eNFL8zO3D67lj7elaif83QE4UEGE+aOi9gtBj8cHULwxn1Q5VnE5iJiiW5
         nLboG7Uhe183dgD/DqdQk6yXvYB2XPN2xicCF2NQ+I8nXxMzHxQA1ZbJ2OMwu0mb6yyD
         RfEg==
X-Gm-Message-State: AOJu0YxN7RrNSsq22z3PF+HpCKqAO61WfzfWMLOoJHkxHcR8CAb0UQPF
	pKxg8KKkTYpuPMtF3/YtTFLWtf+RMLOge1DdrUrf2uahzLSDdeKaUswqA4mdE7EAWeqZhrOUcVI
	RhMpHa1Z/DRGmUcWaA4ZKZR3KIOAFGEwT6XioyFu0Y7y1bxcIQ0zYsSsgATEUBrl1dyWt
X-Gm-Gg: ATEYQzyYLf6VzW9nXRirsJ6JbnNQYGIC7RZUZ8r7Gf1nQnJ6Wt/UYZlJi988BmEiqiu
	wJysvFepKkD8Vf6Bni8v/hJi+bMrhVXklbKOnEoFAuUXXOxbxXEV1EQy8Jz9OSloHxCn2yekY+f
	ZjPHGabgDomO4yISw/soy4V+kF4oDKRKyxEvWZazWLNymQ3Wf5gXu2lWFNOkFWcuqZbtI7tQ4jl
	3LU6oPOhKl6BsS/Zea28WkCD3HsH/tRQCRRDl1a7Sp/WWkbSrvbM9RkU0ifco+jrthmoBrcKTdf
	UnJL/kMRPsBL5/+SjO15818PdTnl3u9TLBdNmVIKT8778k0vxAvMex0q9FvPOZ51pbPyucUl99n
	PJE90ogCy+7STmmmNzd4YN3m0ApUneongoI3Ir68XTsgBbvf/wS8SArL2q/k2TDJDytcTy53eDW
	XJIaVZ4Tr+HGQ7sFp8nok0x6Aw8HXg4xBtI4c=
X-Received: by 2002:a05:620a:254b:b0:80e:3af7:7a0c with SMTP id af79cd13be357-8cd6d427f57mr320733185a.43.1772815641145;
        Fri, 06 Mar 2026 08:47:21 -0800 (PST)
X-Received: by 2002:a05:620a:254b:b0:80e:3af7:7a0c with SMTP id af79cd13be357-8cd6d427f57mr320729785a.43.1772815640568;
        Fri, 06 Mar 2026 08:47:20 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a13eaebd0asm213804e87.51.2026.03.06.08.47.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Mar 2026 08:47:19 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 06 Mar 2026 18:47:10 +0200
Subject: [PATCH 04/24] drm/msm/adreno: Trust the SSoT UBWC config
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260306-ubwc-rework-v1-4-9cfdff12f2bb@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=5880;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=E5AQkqpaNuM1RXBAxJ/mn1wbVur7sOZpcfQb1l6t7DE=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpqwUNcrd3Clb2VbkETRm3VJ329lWcfofTbuf+R
 8sNyI+pXsOJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaasFDQAKCRCLPIo+Aiko
 1epOCACPBE/Ez45bG59m+rxF+b7Y+dB+iiT1mwMky3RRe9bKHf+QAjNjEQgUpYb19T/GX2Q5v6W
 /E2LxY41xBx9FsTo8wfrPEEWJAYO6k9oNY7Te5BQStmhWBjARC5LiiBx4je2u5tV2R8WDYvymeZ
 0idyRf3YdUvqHz//58i1PeeLLruv24bwZa2b9wzC4vEWNHtPVEdMkS+zxhHtNLHgd9lsASJG4O2
 MvpWYQoUXvCwkZJtGpEhSNJqUupfGc/QVhXhFbhP7nWRfGQKvzo2YpZ1vCVEuHC17Yqr8NzJaqN
 SQ5llqmoB7a5fTZYVldyzMRYgW3nqKnAiCRCzRmQ2IyyrBL/
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA2MDE1OSBTYWx0ZWRfX47GDbpHRLbHf
 1GUuF1Nf9/IkF5tEVlZzDQOR7pZXRYdDXiYdRw9Ex6DdEf6NeByqn2f3k2yEf3g31ZAr2AfGtd7
 +LLaZc3T5240RVPZzjAnFFeur5wGCjwMpsn9fDuA4KSBRdc4ZbKjeEN87IsTX8vMEnmKmRPVXbk
 +QAqWxI/zzav7nmS818hBifnNhGZ47tS7ZLqEXd8Qx1dBq2lq+HDZl89CX6LRyK4ZX4YFFxK0c6
 x53hKxxQK1Eh5XXBdANWeb2fQ4vUOjeMUFzf1ukLUcPvI/91M9lLeTRcoAh0gvFZf/MMdvsFGs4
 vHQJY3diuutk0ll9e2TWtmHusG+fNcPy2RRgEqQuMuKNGgIE4pJ1MuAUMKKYoVS6hDu0RnQ272A
 oeUNRB1TIN9aLcptYAXXmF25qkKX0mm9RQzmXM/KlHDVGAAkNZxP7/v9/8AkzvaCnFZ11WHwUU/
 SWAGW8KVwD5cmZciEtQ==
X-Proofpoint-ORIG-GUID: vrAD26cy13tRRpR8fGuuAzV52kfn7ahp
X-Proofpoint-GUID: vrAD26cy13tRRpR8fGuuAzV52kfn7ahp
X-Authority-Analysis: v=2.4 cv=eJoeTXp1 c=1 sm=1 tr=0 ts=69ab0519 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=IhcC-CrlSmvFA89tYH4A:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-06_05,2026-03-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 adultscore=0 lowpriorityscore=0 suspectscore=0
 priorityscore=1501 malwarescore=0 impostorscore=0 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603060159
X-Rspamd-Queue-Id: 668F32256F0
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-95880-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.922];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Now that the highest_bank_bit value is retrieved from the running
system and the global config has been part of the tree for a couple
of releases, there is no reason to keep any hardcoded values inside
the GPU driver.

Get rid of them.

Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Rob Clark <robin.clark@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/a5xx_gpu.c   | 11 ++---
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c   | 82 ++-------------------------------
 drivers/gpu/drm/msm/adreno/adreno_gpu.h |  5 --
 3 files changed, 6 insertions(+), 92 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c b/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
index ef9fd6171af7..513557741677 100644
--- a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
@@ -1727,7 +1727,6 @@ static struct msm_gpu *a5xx_gpu_init(struct drm_device *dev)
 	struct msm_drm_private *priv = dev->dev_private;
 	struct platform_device *pdev = priv->gpu_pdev;
 	struct adreno_platform_config *config = pdev->dev.platform_data;
-	const struct qcom_ubwc_cfg_data *common_cfg;
 	struct a5xx_gpu *a5xx_gpu = NULL;
 	struct adreno_gpu *adreno_gpu;
 	struct msm_gpu *gpu;
@@ -1765,13 +1764,9 @@ static struct msm_gpu *a5xx_gpu_init(struct drm_device *dev)
 	a5xx_preempt_init(gpu);
 
 	/* Inherit the common config and make some necessary fixups */
-	common_cfg = qcom_ubwc_config_get_data();
-	if (IS_ERR(common_cfg))
-		return ERR_CAST(common_cfg);
-
-	/* Copy the data into the internal struct to drop the const qualifier (temporarily) */
-	adreno_gpu->_ubwc_config = *common_cfg;
-	adreno_gpu->ubwc_config = &adreno_gpu->_ubwc_config;
+	adreno_gpu->ubwc_config = qcom_ubwc_config_get_data();
+	if (IS_ERR(adreno_gpu->ubwc_config))
+		return ERR_CAST(adreno_gpu->ubwc_config);
 
 	adreno_gpu->uche_trap_base = 0x0001ffffffff0000ull;
 
diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index d6dfe6337bc3..6eca7888013b 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -729,82 +729,6 @@ static void a6xx_set_cp_protect(struct msm_gpu *gpu)
 	gpu_write(gpu, REG_A6XX_CP_PROTECT(protect->count_max - 1), protect->regs[i]);
 }
 
-static int a6xx_calc_ubwc_config(struct adreno_gpu *gpu)
-{
-	const struct qcom_ubwc_cfg_data *common_cfg;
-	struct qcom_ubwc_cfg_data *cfg = &gpu->_ubwc_config;
-
-	/* Inherit the common config and make some necessary fixups */
-	common_cfg = qcom_ubwc_config_get_data();
-	if (IS_ERR(common_cfg))
-		return PTR_ERR(common_cfg);
-
-	/* Copy the data into the internal struct to drop the const qualifier (temporarily) */
-	*cfg = *common_cfg;
-
-	/* Use common config as is for A8x */
-	if (!adreno_is_a8xx(gpu)) {
-		cfg->ubwc_swizzle = 0x6;
-		cfg->highest_bank_bit = 15;
-	}
-
-	if (adreno_is_a610(gpu)) {
-		cfg->highest_bank_bit = 13;
-		cfg->ubwc_swizzle = 0x7;
-	}
-
-	if (adreno_is_a612(gpu))
-		cfg->highest_bank_bit = 14;
-
-	if (adreno_is_a618(gpu))
-		cfg->highest_bank_bit = 14;
-
-	if (adreno_is_a619(gpu))
-		/* TODO: Should be 14 but causes corruption at e.g. 1920x1200 on DP */
-		cfg->highest_bank_bit = 13;
-
-	if (adreno_is_a619_holi(gpu))
-		cfg->highest_bank_bit = 13;
-
-	if (adreno_is_a621(gpu))
-		cfg->highest_bank_bit = 13;
-
-	if (adreno_is_a623(gpu))
-		cfg->highest_bank_bit = 16;
-
-	if (adreno_is_a650(gpu) ||
-	    adreno_is_a660(gpu) ||
-	    adreno_is_a690(gpu) ||
-	    adreno_is_a730(gpu) ||
-	    adreno_is_a740_family(gpu)) {
-		/* TODO: get ddr type from bootloader and use 15 for LPDDR4 */
-		cfg->highest_bank_bit = 16;
-	}
-
-	if (adreno_is_a663(gpu)) {
-		cfg->highest_bank_bit = 13;
-		cfg->ubwc_swizzle = 0x4;
-	}
-
-	if (adreno_is_7c3(gpu))
-		cfg->highest_bank_bit = 14;
-
-	if (adreno_is_a702(gpu))
-		cfg->highest_bank_bit = 14;
-
-	if (cfg->highest_bank_bit != common_cfg->highest_bank_bit)
-		DRM_WARN_ONCE("Inconclusive highest_bank_bit value: %u (GPU) vs %u (UBWC_CFG)\n",
-			      cfg->highest_bank_bit, common_cfg->highest_bank_bit);
-
-	if (cfg->ubwc_swizzle != common_cfg->ubwc_swizzle)
-		DRM_WARN_ONCE("Inconclusive ubwc_swizzle value: %u (GPU) vs %u (UBWC_CFG)\n",
-			      cfg->ubwc_swizzle, common_cfg->ubwc_swizzle);
-
-	gpu->ubwc_config = &gpu->_ubwc_config;
-
-	return 0;
-}
-
 static void a6xx_set_ubwc_config(struct msm_gpu *gpu)
 {
 	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
@@ -2721,10 +2645,10 @@ static struct msm_gpu *a6xx_gpu_init(struct drm_device *dev)
 	msm_mmu_set_fault_handler(to_msm_vm(gpu->vm)->mmu, gpu,
 				  adreno_gpu->funcs->mmu_fault_handler);
 
-	ret = a6xx_calc_ubwc_config(adreno_gpu);
-	if (ret) {
+	adreno_gpu->ubwc_config = qcom_ubwc_config_get_data();
+	if (IS_ERR(adreno_gpu->ubwc_config)) {
 		a6xx_destroy(&(a6xx_gpu->base.base));
-		return ERR_PTR(ret);
+		return ERR_CAST(adreno_gpu->ubwc_config);
 	}
 
 	/* Set up the preemption specific bits and pieces for each ringbuffer */
diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.h b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
index 1d0145f8b3ec..da9a6da7c108 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.h
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
@@ -237,12 +237,7 @@ struct adreno_gpu {
 	/* firmware: */
 	const struct firmware *fw[ADRENO_FW_MAX];
 
-	/*
-	 * The migration to the central UBWC config db is still in flight - keep
-	 * a copy containing some local fixups until that's done.
-	 */
 	const struct qcom_ubwc_cfg_data *ubwc_config;
-	struct qcom_ubwc_cfg_data _ubwc_config;
 
 	/*
 	 * Register offsets are different between some GPUs.

-- 
2.47.3


