Return-Path: <linux-arm-msm+bounces-106364-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KIKCAMSO/GlhRQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106364-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 07 May 2026 15:08:20 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C5024E8EAE
	for <lists+linux-arm-msm@lfdr.de>; Thu, 07 May 2026 15:08:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id F2DFD303F06E
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 May 2026 13:04:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A3A9C3FB06E;
	Thu,  7 May 2026 13:03:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JZVRG5Qw";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Bv2Pom5J"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 535C53F23D7
	for <linux-arm-msm@vger.kernel.org>; Thu,  7 May 2026 13:03:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778159016; cv=none; b=ARkocu8Dg91veiUcupL6YfRxsPZMujum/DqdfmhC5E6+SrDv8cZHSMH8PPgtmFboLy4R42C/op1OHMnOleUsTjAvPuM8Upfx+Y999jSuGXYPNfH3oL/WnLPIklvYPXfI4ZkEeoqDPYAknP39VIwdBjnWL2YlN0pJQJsydkJv8LM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778159016; c=relaxed/simple;
	bh=2ZvEjuy2Z2pk8ChjGlcTOYKmEPN6QT5mYQGegDBtU+w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=U9bqTUGZQfzt8nUNSw/y8S9L0U8Ap/wpm73hE9/N5wzUo0kUGZraOv2d46L3+5Y4RKQ3akVuG1qSBD7zr47+kc/PNbHRiDbayD3CchZKruKwhaFSwN0GBv/72ABGvnys2Q8G24F3d3EpXIbMbYKigXw0LDPYtthDH0XM+k5IV+E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JZVRG5Qw; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Bv2Pom5J; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 647Bxaje2734190
	for <linux-arm-msm@vger.kernel.org>; Thu, 7 May 2026 13:03:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xeqmVqS4sWTzNC5Ka5lPWcTosbNT5mxXRMsZpQCt8rc=; b=JZVRG5QwiU9Dzm5O
	zlNRK4EJF5AftHsH0MYq3rY+eHwv1Xkq3LF+lGhsDgdknTccP3eEVkIoSl9DbGCy
	DxdHyWjoGbbnpfHYaNKIKdOaZPVdlA+PRwgJgs7X1fAKDNFLE3+y7WiNX5ESGv2p
	mk82kfphqV0EDjkxu68lAjJ4a+vXHTadso/jh/T/owkCUagEhVvy8IxJxyetSqyp
	SwH/RotGMOzhlHy6aXO3+CBXRO+bVw08fYc29BvnHgrMdb0xIqwllHAfR/DkG3Y3
	l8zELjnAQ+GcaoVRIci9HHlIJxZ1hA59qExdaOZHoD4+c1/JsBQ3fduPcOb9/GMx
	c76Lvg==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e0tbqr708-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 07 May 2026 13:03:34 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2b9a3c3c4eeso9509595ad.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 07 May 2026 06:03:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778159014; x=1778763814; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xeqmVqS4sWTzNC5Ka5lPWcTosbNT5mxXRMsZpQCt8rc=;
        b=Bv2Pom5J4qxt2XZsDkXaO5NFQ0RMgWPFKvPJEEm0+yboyovHc6h8AgQMS+NG5O/Ew3
         BMr05+YMJW4TWvbgb88xSmdEqZADR4s0TbiJHXqnjcP6/GSW5ObvO26YDkj0YOf0rGyH
         db6apSSwP/BlC6KMM4BNjIMXJ7B4eTl5Rcd0av6tvAXzcihwfeKoyv93G7zp2yDTYjBl
         jgNDOsTpUZEjstXFZdBCAJd5lq/RMb+AEvOc/89WTMQB1W1ijz1qkWpxk/VM1ellr8n5
         HqKukcr3kAX2PnqVypJGMwOetfuZyt8QEb+kMn3AdxPSVhNyUMy9pBxrzJUJbjWH2kmf
         FLsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778159014; x=1778763814;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=xeqmVqS4sWTzNC5Ka5lPWcTosbNT5mxXRMsZpQCt8rc=;
        b=DJ7zrtrszuUYOhV8RiXHUKPz8PdZ0siAt4Pz0dLy4m4UVHN0/J0024ngVQZFrmN22N
         7w90PCQWmbLtPQF8+UHbxWalNJedrtDvloCym5Bd5qYm2hLNbppPvuvPODHv8wLhcTg2
         MN2RV9h8SsgMAnmqbnyoVnVyprEvwMJD2WqOFQHqp/hu+mk02l9AHog9R3sQX8pmf9Tz
         gpsmcKxoATp9PgLfmXhZG8baVfflcQM/4sBikZ3/LmOQXopq8QgxQdapwyb4eX5UYaFW
         oeJ/YubwMnVQu7ObmzvvXUykziEGmx/nubJMy6fBYPWTVTQ0FxbHScgICmZ3pdEb1mDm
         QN6g==
X-Gm-Message-State: AOJu0YwPdk/U86/bkHWRNVe/J5h1WrCrdUVl6k4kcJ/dIsuSMd9ty/t2
	E+3V3+BGXn1CGjIAhSodlZvrOIVtwe2I7a9HtIjeaMQG964tjnuGnKMc96hwmFbRBlnHOXKTfFt
	If5Y+6F1gMlOT6rfiHeh4wCG8079eRCt/jlThTKUtGK73Fr2w/7RXxSzi2/5E2B0KRNNd
X-Gm-Gg: AeBDiesX0t5hE8gm6RerMWCdZDeCF1mOxE3DbpRFy49RyjWH3tCz9xuzTJXhnGwS6cM
	FBnMTJIgyBwco57g8LmOs0tvXElSMvW/QOsGpRH6q83Ec3f4yMZDPukA8ilGG9Z/mTS9zPT/ja5
	Bp+zP4Zv0oZHHH7ZQmz5ma5+PfDgDQWP3VNANlAXCagGE2ahZgDKjnkkHMQKsFef6XULynLM/J9
	J4MlQifV1uT3JHuUPKL3GK8dB0r24pKGUiAzOBcFqTFXotT8AB6Licnmk+Bhpkhf4TDGG/cxHlM
	I+4imnFQzc6S953PFn10/J1L4gnW0lf+dfyNIMmePBz74Sxg+/oYg+NG9FRHaAJjj1WSf+/l68s
	00bmLX559I3Bp59GxkCeVegguyi7DFf3zKV7oW/aAsW7+z6rzGOBmDyqbthU4byB/hfLSfchP8r
	5pPBCaD8Wkujen84VaSe7yV9bxV5BsnLwH9ShPqBHeKHJogw==
X-Received: by 2002:a17:902:e790:b0:2ba:bfc:76b5 with SMTP id d9443c01a7336-2ba78b40166mr83469905ad.4.1778159013524;
        Thu, 07 May 2026 06:03:33 -0700 (PDT)
X-Received: by 2002:a17:902:e790:b0:2ba:bfc:76b5 with SMTP id d9443c01a7336-2ba78b40166mr83469255ad.4.1778159012871;
        Thu, 07 May 2026 06:03:32 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a85c230c68sm5595959e87.19.2026.05.07.06.03.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 May 2026 06:03:31 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 07 May 2026 16:03:05 +0300
Subject: [PATCH v4 09/29] drm/msm/mdss: use new helper to set min_acc
 length
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260507-ubwc-rework-v4-9-c19593d20c1d@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1832;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=2ZvEjuy2Z2pk8ChjGlcTOYKmEPN6QT5mYQGegDBtU+w=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBp/I2Fs8iuCFnWQNAir5YldLxUHTFAidnver1rD
 e3RzpY84X+JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCafyNhQAKCRCLPIo+Aiko
 1SuOB/0V4A6AKf4Xq2JLN3dEzauZcdbsVigA1P2G7rcn1wTRmUUzfJy1MLCmkAbB9E6LbKtTU3i
 0pp5ghS+oEnMckPZJhS/lG1YKeCe3+ACmvMpre6XWsO2C4kjOGFXwgMvqvCOCe+yQIpOvhQuL7N
 Ot1m/S2VoBCIoyF3DdfALknGheSQykaImIi2LZKD47+1J8oogx20Jm1iz8NvipIBuDyOY910R4g
 fMMo6hyZoOaceSVmLV/eap6xFqMwkDxegpVQibLc3Sdul8fCb8s8Df/JyRikyR5dcqJCTe7exgk
 kTjIS5/zJN7Q3IWcCZjBahmww/eNWC16TNQCKATExwxY+SS3
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: yNaS2QMQBpX-6RVyYwSXH3bGJ0Fh8B7n
X-Authority-Analysis: v=2.4 cv=SJVykuvH c=1 sm=1 tr=0 ts=69fc8da6 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=X-e67srwgh_QgMMAbO4A:9 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-GUID: yNaS2QMQBpX-6RVyYwSXH3bGJ0Fh8B7n
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA3MDEzMCBTYWx0ZWRfX6vAIuN5cuYsK
 1rion+jy1OfeqEPeVF3lWGRGBdgB4Ye0hYsJJRBAFGHW64WGBklWIUcDVvoHOu0RGvwXKoWoamd
 lOzDzQRJgZc4IRBAcAa31rMttIytfn31Yefin0n/Ft+qmVzY+f7Dr6LG/d38z7UZxng//e0u+aB
 ZlaKhMcxs4L3qXx4gwS/fkHbj92B9UMfdy5k7Np+SmjaVkCqT0rRV4mo1PHqgg2PPZML9AJcs9B
 Su5brthzIcO0AiIV5ISi0ZE6d0LoGg/TmYHFtoBy2IeiDn/lFP1R0j9zodpXYynjO2f4GEgwZlf
 ZMAOzx7+IIyFteLX6nXKoj+i5jwO8MvcJxhLwSJkiPgudzAu1gcg+8K2Fj9yUlqkD7lFLL2NuM5
 fKxvwpcXfUZxoRXut0gnVK7fpPYKcGJu9E3FYNaoyqUXvEW168PmiMQxTzn7uqyQU9azW01UD5f
 Wh6L4hApoRmH+psPlfw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-07_01,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 suspectscore=0 lowpriorityscore=0
 impostorscore=0 bulkscore=0 adultscore=0 malwarescore=0 spamscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2605070130
X-Rspamd-Queue-Id: 0C5024E8EAE
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-106364-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
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

Use freshly defined helper instead of hardcoding the checks in the
driver.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/msm_mdss.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_mdss.c b/drivers/gpu/drm/msm/msm_mdss.c
index 229b47415f29..9f2b366d45fc 100644
--- a/drivers/gpu/drm/msm/msm_mdss.c
+++ b/drivers/gpu/drm/msm/msm_mdss.c
@@ -172,8 +172,7 @@ static void msm_mdss_4x_setup_ubwc(struct msm_mdss *msm_mdss)
 	u32 value = MDSS_UBWC_STATIC_UBWC_SWIZZLE(data->ubwc_swizzle & 0x1) |
 		    MDSS_UBWC_STATIC_HIGHEST_BANK_BIT(data->highest_bank_bit - 13);
 
-	if (data->ubwc_enc_version == UBWC_1_0)
-		value |= MDSS_UBWC_STATIC_UBWC_MIN_ACC_LEN(1);
+	value |= MDSS_UBWC_STATIC_UBWC_MIN_ACC_LEN(qcom_ubwc_min_acc_length_64b(data));
 
 	writel_relaxed(value, msm_mdss->mmio + REG_MDSS_UBWC_STATIC);
 }
@@ -190,8 +189,7 @@ static void msm_mdss_5x_setup_ubwc(struct msm_mdss *msm_mdss)
 	if (data->ubwc_enc_version == UBWC_3_0)
 		value |= MDSS_UBWC_STATIC_UBWC_AMSBC;
 
-	if (data->ubwc_enc_version == UBWC_1_0)
-		value |= MDSS_UBWC_STATIC_UBWC_MIN_ACC_LEN(1);
+	value |= MDSS_UBWC_STATIC_UBWC_MIN_ACC_LEN(qcom_ubwc_min_acc_length_64b(data));
 
 	writel_relaxed(value, msm_mdss->mmio + REG_MDSS_UBWC_STATIC);
 }
@@ -209,8 +207,7 @@ static void msm_mdss_6x_setup_ubwc(struct msm_mdss *msm_mdss)
 	if (data->macrotile_mode)
 		value |= MDSS_UBWC_STATIC_MACROTILE_MODE;
 
-	if (data->ubwc_enc_version == UBWC_1_0)
-		value |= MDSS_UBWC_STATIC_UBWC_MIN_ACC_LEN(1);
+	value |= MDSS_UBWC_STATIC_UBWC_MIN_ACC_LEN(qcom_ubwc_min_acc_length_64b(data));
 
 	writel_relaxed(value, msm_mdss->mmio + REG_MDSS_UBWC_STATIC);
 

-- 
2.47.3


