Return-Path: <linux-arm-msm+bounces-106366-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eMySGTSP/GlhRQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106366-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 07 May 2026 15:10:12 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B8B894E8EF4
	for <lists+linux-arm-msm@lfdr.de>; Thu, 07 May 2026 15:10:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 917D630A8D55
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 May 2026 13:04:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 680883FE35F;
	Thu,  7 May 2026 13:03:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WG97G3mC";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SVgN0PAc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D44A3FD150
	for <linux-arm-msm@vger.kernel.org>; Thu,  7 May 2026 13:03:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778159023; cv=none; b=ObvMsyZ30XhxPwKo6timdPc0qTXX83NescZU+NtGhx/QOXtRo+vwSmddzWas8odkA9QD0AttLebsqzBve45holmv6q2EQZHQV3/tub62cmjftF1haHZcaFNN3gEUxM6uzznKCzNTksYB32lPHMAggJMxQS9M1UK6Mhuzw5nR1+k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778159023; c=relaxed/simple;
	bh=gBDFjN7fs9zNZK1OT0Rge6uEp5iYTQNKw6PU4vljOxU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DrXNSOR6d9OLitOrxqxAT9aCNlxc04COtcZQH+sDljiyH6yheQLfbBqbZy9s+9v+zX2AXR6kbMoNsoI69gRXSGWPa5lo0HKw5QaOJAP8w56Key6S9TPGv8cyZ8hVigoM7A7z7sAqvpBF+s4DmD7FZqBooZXsejcofsjOZgDg0G8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WG97G3mC; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SVgN0PAc; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64795pQQ3463973
	for <linux-arm-msm@vger.kernel.org>; Thu, 7 May 2026 13:03:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SHppxJbIcnxAbn5e5BxkZY1HBroOaNwMncF5FMMJzNI=; b=WG97G3mChs0n7L+C
	uYBGbXBnuMYE+vX3krc/qcdPiptP+zAHzZeZ05GGSAf8F6sLNG+qdnzu/DbxIuCK
	WNBs8i6/BFfw3wMlJ2gW2N+08V4JLLGyhqKvN7N4nr4d0LUSFR515S551IpZk0NC
	cxtDT7xfStbQmxINu02RRfN9YcdNAxghMLa81xyTcnOqsW1zDfxuFjowbU4x7glS
	K0imK5pxzJuo7dSWHoyTGvIpN0pcTiIU5/nCFYB0oiIO4QMYOkOA1ZcRTmep29Br
	OPcsmipSaNmM5oLFApsfBOOWdCRo59YGw/ZSm4vB6bQyIngX+Yfd4WaspUayfxXr
	RdJuHw==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e0hvn25r7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 07 May 2026 13:03:41 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2b2d83e7461so15763985ad.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 07 May 2026 06:03:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778159021; x=1778763821; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SHppxJbIcnxAbn5e5BxkZY1HBroOaNwMncF5FMMJzNI=;
        b=SVgN0PAcgCxeEio+cYRD3gTIw6r+Ab5SGq4+EpZgZd1SOe1tfNA7EqJ3envCXYYGRN
         q9DVt37O8cUZq9ymYYNpVKodBpwaAcC19ovhA3yTxDT3wpy8TEGSHsCo5X04ejPfxwHl
         Km9aYFTzPTuaUfir1hXjha73nilsKjJzlH3UbkuWuYJINffUFr8dDMYI+hMh8Jmr7uho
         K/pWDjBRxpQclMGNi+vEeBE9ODh5u1Fc0pK8dmBPRQQa7qeBxMPPFALfyLn4HfwL14Lm
         +w9GDmIR++WSvVGHEQfoyCiizfyNMLOLnjU54i9Tfgg2kCQRzcBANjMgN4fRcabAsh+m
         GpMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778159021; x=1778763821;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=SHppxJbIcnxAbn5e5BxkZY1HBroOaNwMncF5FMMJzNI=;
        b=ivbXzIVGRClIHPm5YWciO09p6L3VjJf/zEcyz64CaJmhGdbHkv6FyfO/0nGsZGZLhf
         sxZ7cmC9Ro1ioPkYeh8G323bz4pJuYxHF3ORm03ciqtYm1yj07lt5UZgfS90dauIa4UT
         6ga0kIJYoz0WYbIYAo8Glv0LcW470J7kuCVi8yYDHtUTAKbDblzJMi5vMAIYumBlidaa
         IiiIXJ9SS+qvgRIyVjcP4HrLX67dNYI20P7xld3cnXEqQBybAE2u7yq30UZo5IyEeYU6
         tT7Ua569ivZZOV5pSRvCFgSslrWyYV7KILD4P8TyBVLBRhHaH58dwUBX/bVNbdJNipVy
         bAdw==
X-Gm-Message-State: AOJu0YysApCygVOfLr38U5oSLd0DsrEhU/uQg+ZOye9E075JZAuyCXQN
	sGIqh4JvzwTF0yM8Ubf6+bXdoKFv320HLrRtvKyODVyCK6U/23FphvXKW9bBhREjU5/vT4ja7dL
	5kaFHJmroiwtW9XvfvFNp7meIBBwKyKJKDWSZgVFiMi744ZvAjm9cSZg0mBbNsWgYuYxr
X-Gm-Gg: AeBDies7iWhNRo6urdBOqHETva+hjkd9AhUx4kOgCLwLo5+Jalr8+iKkwmnY+7QpuJy
	rEk2/6KtBWVcyNqrRyvtBGfv5Lfytq/am0BT4qH7DoQVIIZWLBsFXsgWG15Uzan+KiNjfcnnDKk
	KVbCMt4Ezl+ykm6nYuf+ppmiCX+ZIQlwosJsv2iv3Kr0lfiN2LGw1Q4s/M2uDii0AcVzVD8SX2R
	mg4zKpQB3PxdqKvt1pNQko9zBsyh19REuzm3SPAb3k1r3ayIbU3cQXmQhsly8ldtQ8z6I611i8P
	GSHWRdFfDItke+rGaaX0AdAQwAc4WvEQMV4rpKRXx6Hg/Ce412lrWgDTMuDrx67PGCmUVhQw4qV
	ttnbL0PQ455x+doH7MmwNb3B1SnjaGePbcZ3DirVWAoQky8uDfQlCFXSV9NRcTU7ye0a5HdXnzt
	4U4y9x0nqD+w8+CgW6D7Gu+FPTC426pilMhVK98DKY45cNVg==
X-Received: by 2002:a17:903:13c8:b0:2b9:8d39:5e87 with SMTP id d9443c01a7336-2ba78f4589bmr83668085ad.10.1778159020320;
        Thu, 07 May 2026 06:03:40 -0700 (PDT)
X-Received: by 2002:a17:903:13c8:b0:2b9:8d39:5e87 with SMTP id d9443c01a7336-2ba78f4589bmr83667265ad.10.1778159019676;
        Thu, 07 May 2026 06:03:39 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a85c230c68sm5595959e87.19.2026.05.07.06.03.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 May 2026 06:03:36 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 07 May 2026 16:03:07 +0300
Subject: [PATCH v4 11/29] drm/msm/mdss: use new helper to set
 macrotile_mode
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260507-ubwc-rework-v4-11-c19593d20c1d@oss.qualcomm.com>
References: <20260507-ubwc-rework-v4-0-c19593d20c1d@oss.qualcomm.com>
In-Reply-To: <20260507-ubwc-rework-v4-0-c19593d20c1d@oss.qualcomm.com>
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
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1276;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=gBDFjN7fs9zNZK1OT0Rge6uEp5iYTQNKw6PU4vljOxU=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBp/I2FDjnXbOAYSF90E+svp/o2+lKtGcJoJmH00
 LRHRwi/y4KJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCafyNhQAKCRCLPIo+Aiko
 1U7hB/4i8c2pLL/nU9G0mLQ7DZ4dWx9a4EZUS1RvCPKfdbug8mvb57g/dFuRVTTHpaSNEj+DTgK
 zOu4qIDormIXsdrNMG7fzPcZLodw+eYU5eGdH+sZHxw6cS1V41KxATtpk+BCLk8LB/nrfgVVVjL
 517NcV/E2zf3ty6TNPoZ2Gxr6Bn0GOUX8cdKDUS8Bc0K4Oe8s44bU2vO4m6euxFwSAXhOqq8orR
 0SUZ/wUoWLnIUBM4BHtYJ/YKUjhc0rmKfY0pUa9/+5dSplJxpHedAVSxvSy0RmIs0ul/cYT4e49
 p6SdltpAfOF1V2Q3+Isc5Uws7rE4wgT4F0fSaxnE4uF61x3d
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA3MDEzMCBTYWx0ZWRfX8Dyy81Af2yT1
 NkYPB1auxRShyl4MhUrMsp/J326l+H3rBwo9Zd2qYoGy4dOPkXzWo14DxzMHhcFe51BFEzY/uW0
 wayONfNs92OU4ii6l/VczR/bTlLUgtNG/2XllWOD72DN3WVth3JIQFh/eSkWtZDyE6H+9mMoLx/
 fHy7KBOKHi7l7EsVzje32iK3mKJrOw6ua1aNFGdIok3qWf6c9BKyFmVfUZ/mIxaynfqAMkzg0QB
 eJD5OoQ/5Wzf7GBUYDWjCE3nJ90Tow+vs23vEAqfPP0T9z5tAJ/zG9DI/Ia/Be43z03f1M4WEgy
 hXtZ7hS2UvHSSkp6Aux/LvnUle7Sx7e7L0kNN4+SUMIlGHbpGaNuM4x56XzgXNHq36OgNqlZ6sc
 YhovHN53qT5ppO5m/I6LnDs7FiMbeBi3CIBcepmxGRIZgP9OWjmLni2jRQhlW/Am0LpguPgtsdu
 1euoRzLBo1aEEXAiDFw==
X-Proofpoint-ORIG-GUID: HCx0RJV16ED7vz1yRSDmSp-MYByGtMj9
X-Proofpoint-GUID: HCx0RJV16ED7vz1yRSDmSp-MYByGtMj9
X-Authority-Analysis: v=2.4 cv=ZZ4t8MVA c=1 sm=1 tr=0 ts=69fc8dad cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=ujCctoy6CNRHcyqwK_8A:9 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-07_01,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 spamscore=0 priorityscore=1501 bulkscore=0
 phishscore=0 clxscore=1015 impostorscore=0 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605070130
X-Rspamd-Queue-Id: B8B894E8EF4
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-106366-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
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
 drivers/gpu/drm/msm/msm_mdss.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_mdss.c b/drivers/gpu/drm/msm/msm_mdss.c
index 9f2b366d45fc..2742d4bb2a4d 100644
--- a/drivers/gpu/drm/msm/msm_mdss.c
+++ b/drivers/gpu/drm/msm/msm_mdss.c
@@ -183,7 +183,7 @@ static void msm_mdss_5x_setup_ubwc(struct msm_mdss *msm_mdss)
 	u32 value = MDSS_UBWC_STATIC_UBWC_SWIZZLE(data->ubwc_swizzle & 0x1) |
 		    MDSS_UBWC_STATIC_HIGHEST_BANK_BIT(data->highest_bank_bit - 13);
 
-	if (data->macrotile_mode)
+	if (qcom_ubwc_macrotile_mode(data))
 		value |= MDSS_UBWC_STATIC_MACROTILE_MODE;
 
 	if (data->ubwc_enc_version == UBWC_3_0)
@@ -204,7 +204,7 @@ static void msm_mdss_6x_setup_ubwc(struct msm_mdss *msm_mdss)
 	if (data->ubwc_bank_spread)
 		value |= MDSS_UBWC_STATIC_UBWC_BANK_SPREAD;
 
-	if (data->macrotile_mode)
+	if (qcom_ubwc_macrotile_mode(data))
 		value |= MDSS_UBWC_STATIC_MACROTILE_MODE;
 
 	value |= MDSS_UBWC_STATIC_UBWC_MIN_ACC_LEN(qcom_ubwc_min_acc_length_64b(data));

-- 
2.47.3


