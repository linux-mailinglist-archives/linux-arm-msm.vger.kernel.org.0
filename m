Return-Path: <linux-arm-msm+bounces-97246-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oDxSOg7BsmmvPAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-97246-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Mar 2026 14:35:10 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B45F5272B01
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Mar 2026 14:35:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 974C230648C1
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Mar 2026 13:32:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 80ADE3C7DE6;
	Thu, 12 Mar 2026 13:30:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Z1UfmdRG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZfDNVSYz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13C773C9454
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Mar 2026 13:30:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773322219; cv=none; b=S8fnu/olIq81FZVs6jHWgj1cJ50IZ7TZRu3dm79hwZsMapxGIdidtF/lav/M4+NvKjtTfRKkoMwy/VlpRDOvUDN6AnoVu5BpSfLka1NdeEvepnJysVFyfyYdPXmoFjkm9GdObq/B1K54MHKUALymyfD6eFEtgU58A3fmo6A/V4c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773322219; c=relaxed/simple;
	bh=aZePfCHlihjZhkopGUN2RVAJWZ7XbjQf2cNHz8Ha1/A=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VPRXdNqJe5RzUIfiRiGuYt526lYneSMQBLlhfpjlxiJjecFF9kOIqGCic8rqRlP4HVPPips6YRBg0sedI3XYbAF2hHB0G1J+Bby/kWrvK0p0oJ5/r0Y6OeVllcfLPUpvqaCpa/WTmD9woxfnNwYpYWZ9kJ4O7gyrmSjRKLIU2m0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Z1UfmdRG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZfDNVSYz; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62CAO2Ke1756415
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Mar 2026 13:30:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CHHWto9L3DJt77vFN3vZgjFHf3Lp2HIBccOsbhUwjkI=; b=Z1UfmdRGMMzqhXva
	WUVlTeJAXrF3kAkD8zQhGqymLE+LDJBwC2c4K5LmpCOzkF8z7ZMxmWyKJCqLZ4ON
	q4tQ7vNAHWhoasIdaDjtAFSIasYSuGh4EAKF2KYTJ9RYlVW5zkHoPwspwOcVB4+4
	Iml6agVygHUUfpQn18LSboFlsFkJrq62pHIs0F78HzC7TFzyKjNo5RkVNZfOpqrH
	wxLld6VM2hrYCBlmLBEZnUUMvnq8ml36fWQ0Wex0VckX0ps9lwvDm1OGKtmDS6s4
	Bny85nULhMFTkhUIKcDPGVLjkqqS5eqOwvG+jE0KaVNalz8zrzPpqgRIJGSVhnZ8
	cb54Zw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cuh53j6wv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Mar 2026 13:30:17 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8cd81c571a5so631612985a.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 Mar 2026 06:30:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773322216; x=1773927016; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CHHWto9L3DJt77vFN3vZgjFHf3Lp2HIBccOsbhUwjkI=;
        b=ZfDNVSYz+/dlOJ066htNtFC6JJTJcsxZHBTpZwqsS8Smg1fm91E21FFLq9TtYJXGy/
         0sjnoDcjpf7Kb1K0BmTygp59CM+6zN+pv/ZkxETsle3cFqazp8WIl+UKiKacAYaWyThc
         bLw4fGPT0Nr/B8+CvHKXajCp2ZmgO/8mIQxtTZ7xV4FI1QDu9TrC3W4W8CbP91+T4w7c
         VfLmBEMGhfyMajo1BmU4c1wBubKhd1ujPVkiUTpKRNANT6mkugOJG/sCSILA9QkgShAB
         BLT7T+pRuTfNO8WiBTMrbQ0zsR05yrS8FETGJ0NRytrb2gYK6orL+POuGXclGMG56jt5
         MeKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773322216; x=1773927016;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=CHHWto9L3DJt77vFN3vZgjFHf3Lp2HIBccOsbhUwjkI=;
        b=RoEJ6gtstF4/6XkmjireySAJW1gmIawPuzZAh4/YQn9KvhydTwNLX1Wy7FkwqOyQCl
         QaihOlC/PzBg3Q4j1F3c+X6O3ozxQ7VbrBjohdq2sqCIoRxJhVbEew6SxOc3Q5xRH/0R
         gn9r6Z/GUwSGWnmj4zR+KqEr1IETd8GQeB95J6ELaOsZRt6B1TLsqk2V8ZJTxxMyaMIr
         ZbTDSUB+87/b40RGCUbnORppMTyjy6GHx2dR+z+kh/6PPP2LUV5V1XkvNNG3ccADIPyn
         Hzl6ISOAkjRGtjdiJABnR8ssIixlHBCm9dK+sDO70rHXQ63Nv2fHwZCFejSLWuVnuUWL
         DPWg==
X-Gm-Message-State: AOJu0YykIcDvnIYuNZDVZm/N2PQpr9y6Ir3U7HCmofJ0Q6QMScZ/G7FV
	zhPOumiwt3yQrrhqp1g1ruXVZaEL9spcVOHIQa9ak7hS00CzYluo1ZGFGIYBsws3KwJulYfo32j
	luHQvPMQ4Gp3ZC8Kt7kvHOgh4hHs3L8qDTCl2GMexF3Kb6V7iiZ6LyVG4oe84vmA6ttZ2jgTDDH
	kWeeU=
X-Gm-Gg: ATEYQzzysrE++kI+B2jhS+jMYNtpGQA9VvMfoIizbUa0bVdo9pQmXUU1FU4H2/GzyeI
	bX5REZpavN2upLxPo0ToYiZz9DJgIJ4avPGF7Ue2bWP7BLIXsJw/QjjGmvZRUCSZUfv/7N0Kr1L
	dRLPpR4UUcW+L5L0Mqc2UYhoxWPhTSdw6v9N6lAkfsTMKvBbSWUh4rSO9OYxtkAYTARZgbxKh7n
	4Fg9xqtTX3fD00oQl5P7xsoJ/Z4OZdiRV395KiOth5LrJfniZpKeEA2MamK2fic3MOTcuk2YrWm
	vhVzN6gqPgwCLVVtN6Ceu/qY4Lz6rFQDdEuqCr9fG5EpvBj8GAEmeozcppZbniETSvwbTK/hoOC
	kMOXq9LUJFbhO0K56LeCRJFX7vA1jzSzraJFGCoU4A8W6Kp/g2RN1Xk/hz2to0eAO2GKEaIvvjl
	Ep+0Yft3PFhCMkzY8/mAtyui4u660M2u7d/GU=
X-Received: by 2002:a05:620a:40d0:b0:8cd:8785:eff4 with SMTP id af79cd13be357-8cda1930373mr778953785a.15.1773322215712;
        Thu, 12 Mar 2026 06:30:15 -0700 (PDT)
X-Received: by 2002:a05:620a:40d0:b0:8cd:8785:eff4 with SMTP id af79cd13be357-8cda1930373mr778943785a.15.1773322214962;
        Thu, 12 Mar 2026 06:30:14 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38a67d617e1sm8646671fa.9.2026.03.12.06.30.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Mar 2026 06:30:13 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 12 Mar 2026 15:29:47 +0200
Subject: [PATCH v3 26/27] soc: qcom: ubwc: sort out the rest of the UBWC
 swizzle settings
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260312-ubwc-rework-v3-26-b7e8f800176a@oss.qualcomm.com>
References: <20260312-ubwc-rework-v3-0-b7e8f800176a@oss.qualcomm.com>
In-Reply-To: <20260312-ubwc-rework-v3-0-b7e8f800176a@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4170;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=aZePfCHlihjZhkopGUN2RVAJWZ7XbjQf2cNHz8Ha1/A=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpsr+4QsRN/zWuciV6Odv4RrrOuSOvS94vKiH4B
 itDI/Uu0EqJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCabK/uAAKCRCLPIo+Aiko
 1VgRB/0W6lSJU7HgKg4riZddJ3HxFtJne7/DCfuauUegKe3lB2NlBQxcWy17xZMdkYFiBGeUVHD
 fXJVf8VKdPU2yzJJGs3eL3fUepzF+fxvvuCI23nYJCpXhUOj2SqWba9OvmAfFIimqqoA5FQZYbc
 04s6Ph7rrcaHo3mKhawoSbbhdw9U5M4+3XzfdgMX8hXOH0ljaoO5na2i8s3vNek+ln9DuQdaf3X
 SRSWE1AD4Qvt1GCV7SroHBYT9mR86wxHAKG2ZYfPgbNifAga3wmYph9r2pQvmLKTvShntY0euk1
 046NHQ9lmD6BC90Iwwa72lJEqZMvkgfUkQD8xJ5iGsrC0owG
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=ZN/aWH7b c=1 sm=1 tr=0 ts=69b2bfe9 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=3htL6sknLGLhwEng4zIA:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEyMDEwNyBTYWx0ZWRfX6T+wswEabkoC
 Dy6Mitptz5jWUhIfVXFd2tga02lqbNgZIx0JTfRErzdq5yoRpntrSXGTtdVM5DGRaqZrjmJtKIJ
 8VqUHyJECjB+IuIOAyD+oNaiwo97om7JpluzrV6UAZL4f3ML1YzyVgHa+mWW3Ku0zXgH3S0FI8o
 KxwmMpNfH0obj1QdSTfkN+Mi5KJjNYGCAhb7IYsDpSjA5CTyU05wlAeJx4SGFjFwQ6CeDIMNRHI
 FGJ332l5k5etktOR0cJNMvRgB5tNxkmtMsVTCfOQcgt4IA1VNQ7IWDOEJXZlTOScuoYgsqB/aZV
 UT+NSMC/TBakmj8zYQRYpGZfs8YcHEQ2tmyzsqYmW5fXjqmgh7VdTlWc0K9hlvOJsXEhiICmruy
 /sslFcW0UiQK2rtsOAa9i7aSM6w+RGsHYqwi8HLz4eLfiB77ZvnNwPhdgGqrPGiebfJe/em3cnV
 3FK9KKs68dDS9tpwDaQ==
X-Proofpoint-GUID: KLszVHjf33vG8ZOwFs4Zz_TiaX5zibPg
X-Proofpoint-ORIG-GUID: KLszVHjf33vG8ZOwFs4Zz_TiaX5zibPg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-12_01,2026-03-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 phishscore=0 adultscore=0 malwarescore=0
 bulkscore=0 suspectscore=0 clxscore=1015 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603120107
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-97246-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email];
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
X-Rspamd-Queue-Id: B45F5272B01
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Sort out the remaining UBWC swizzle values, using flags to control
whether level 2 and level 3 swizzling are enabled or not.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/soc/qcom/ubwc_config.c | 14 +++-----------
 include/linux/soc/qcom/ubwc.h  | 26 +++++++++++++-------------
 2 files changed, 16 insertions(+), 24 deletions(-)

diff --git a/drivers/soc/qcom/ubwc_config.c b/drivers/soc/qcom/ubwc_config.c
index 49edfabb5e18..ccee20913115 100644
--- a/drivers/soc/qcom/ubwc_config.c
+++ b/drivers/soc/qcom/ubwc_config.c
@@ -18,8 +18,6 @@ static const struct qcom_ubwc_cfg_data no_ubwc_data = {
 
 static const struct qcom_ubwc_cfg_data kaanapali_data = {
 	.ubwc_enc_version = UBWC_6_0,
-	.ubwc_swizzle = UBWC_SWIZZLE_ENABLE_LVL2 |
-			UBWC_SWIZZLE_ENABLE_LVL3,
 	.highest_bank_bit = 16,
 };
 
@@ -40,7 +38,7 @@ static const struct qcom_ubwc_cfg_data qcm2290_data = {
 
 static const struct qcom_ubwc_cfg_data sa8775p_data = {
 	.ubwc_enc_version = UBWC_4_0,
-	.ubwc_swizzle = UBWC_SWIZZLE_ENABLE_LVL3,
+	.flags = UBWC_FLAG_DISABLE_SWIZZLE_LVL2,
 	.highest_bank_bit = 13,
 };
 
@@ -111,38 +109,32 @@ static const struct qcom_ubwc_cfg_data sm8150_data = {
 
 static const struct qcom_ubwc_cfg_data sm8250_data = {
 	.ubwc_enc_version = UBWC_4_0,
-	.ubwc_swizzle = UBWC_SWIZZLE_ENABLE_LVL2 |
-			UBWC_SWIZZLE_ENABLE_LVL3,
 	/* TODO: highest_bank_bit = 15 for LP_DDR4 */
 	.highest_bank_bit = 16,
 };
 
 static const struct qcom_ubwc_cfg_data sm8350_data = {
 	.ubwc_enc_version = UBWC_4_0,
-	.ubwc_swizzle = UBWC_SWIZZLE_ENABLE_LVL2 |
-			UBWC_SWIZZLE_ENABLE_LVL3,
 	/* TODO: highest_bank_bit = 15 for LP_DDR4 */
 	.highest_bank_bit = 16,
 };
 
 static const struct qcom_ubwc_cfg_data sm8550_data = {
 	.ubwc_enc_version = UBWC_4_0,
-	.ubwc_swizzle = UBWC_SWIZZLE_ENABLE_LVL2 |
-			UBWC_SWIZZLE_ENABLE_LVL3,
 	/* TODO: highest_bank_bit = 15 for LP_DDR4 */
 	.highest_bank_bit = 16,
 };
 
 static const struct qcom_ubwc_cfg_data sm8750_data = {
 	.ubwc_enc_version = UBWC_5_0,
-	.ubwc_swizzle = 6,
 	/* TODO: highest_bank_bit = 15 for LP_DDR4 */
 	.highest_bank_bit = 16,
 };
 
 static const struct qcom_ubwc_cfg_data glymur_data = {
 	.ubwc_enc_version = UBWC_5_0,
-	.ubwc_swizzle = 0,
+	.flags = UBWC_FLAG_DISABLE_SWIZZLE_LVL2 |
+		 UBWC_FLAG_DISABLE_SWIZZLE_LVL3,
 	/* TODO: highest_bank_bit = 15 for LP_DDR4 */
 	.highest_bank_bit = 16,
 };
diff --git a/include/linux/soc/qcom/ubwc.h b/include/linux/soc/qcom/ubwc.h
index 7c9506741001..a7372d9c25fb 100644
--- a/include/linux/soc/qcom/ubwc.h
+++ b/include/linux/soc/qcom/ubwc.h
@@ -14,15 +14,6 @@
 struct qcom_ubwc_cfg_data {
 	u32 ubwc_enc_version;
 
-	/**
-	 * @ubwc_swizzle: Whether to enable level 1, 2 & 3 bank swizzling.
-	 *
-	 * UBWC 1.0 always enables all three levels.
-	 * UBWC 2.0 removes level 1 bank swizzling, leaving levels 2 & 3.
-	 * UBWC 4.0 adds the optional ability to disable levels 2 & 3.
-	 */
-	u32 ubwc_swizzle;
-
 	/**
 	 * @highest_bank_bit: Highest Bank Bit
 	 *
@@ -30,6 +21,10 @@ struct qcom_ubwc_cfg_data {
 	 * DDR bank.  This should ideally use DRAM type detection.
 	 */
 	int highest_bank_bit;
+
+	unsigned int flags;
+#define UBWC_FLAG_DISABLE_SWIZZLE_LVL2	BIT(0)
+#define UBWC_FLAG_DISABLE_SWIZZLE_LVL3	BIT(1)
 };
 
 #define UBWC_1_0 0x10000000
@@ -98,11 +93,16 @@ static inline u32 qcom_ubwc_swizzle(const struct qcom_ubwc_cfg_data *cfg)
 		       UBWC_SWIZZLE_ENABLE_LVL2 |
 		       UBWC_SWIZZLE_ENABLE_LVL3;
 
-	if (cfg->ubwc_enc_version < UBWC_4_0)
-		return UBWC_SWIZZLE_ENABLE_LVL2 |
-		       UBWC_SWIZZLE_ENABLE_LVL3;
+	u32 ubwc_swizzle = UBWC_SWIZZLE_ENABLE_LVL2 |
+			   UBWC_SWIZZLE_ENABLE_LVL3;
+
+	if (cfg->flags & UBWC_FLAG_DISABLE_SWIZZLE_LVL2)
+		ubwc_swizzle &= ~UBWC_SWIZZLE_ENABLE_LVL2;
+
+	if (cfg->flags & UBWC_FLAG_DISABLE_SWIZZLE_LVL3)
+		ubwc_swizzle &= ~UBWC_SWIZZLE_ENABLE_LVL3;
 
-	return cfg->ubwc_swizzle;
+	return ubwc_swizzle;
 }
 
 static inline u32 qcom_ubwc_version_tag(const struct qcom_ubwc_cfg_data *cfg)

-- 
2.47.3


