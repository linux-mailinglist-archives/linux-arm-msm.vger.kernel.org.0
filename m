Return-Path: <linux-arm-msm+bounces-108792-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OMbbI0nNDWr53QUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108792-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2026 17:03:37 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id E70375906BD
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2026 17:03:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 24E8C30793FD
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2026 14:52:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8E9893EFD1E;
	Wed, 20 May 2026 14:51:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="P2vaaCjk";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PG4F3D0X"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AD9E3EFD09
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 14:51:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779288697; cv=none; b=OtyB7uj1V42CE23x5bF1iLAkuDuRrxg6WvHYpaSgDgNU2iOuz+VQ5PEUTN3SohOMo3mVVtut9Cmahl66t3UG+9lGhfPPVXdDBMNoaka55IYvfyKeD7g/N4VXgE264dw00oq38FTCQXdyoSXCUwKUuWW4RnPo16QC+b5qlPl2HbE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779288697; c=relaxed/simple;
	bh=pQcZSLClq75f0H7mdOxTbEo5DpGKFB3n0GBshQz7Fb8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=a9N/mZw1S5uQfEa/9m2oVwnDEmdL5T+I9J0df2CR6Yliu0xe3Jzt3LHyika9vc+VE749YGMovjElhuJQIostTiPlVGUSKOdy5y6CvbnGPpN/Ux4uShJhCryxW1i5hnRKeWTs6DNB+WNkWIs4lFyJdsUk/s8FypRZOyP3yiRg6qs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=P2vaaCjk; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PG4F3D0X; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64KE2Kap826517
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 14:51:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KrGdZ6Bna8qkROGke7rL/1evORye3ZzPkLd+P26j6Fs=; b=P2vaaCjkU1BUJZWl
	XIZQhkEQSn5+slMBBq0wvj0JXwI5ALlArUA/q/Kvzk38Q7z0Fa8wsHaFrtMZJKVI
	nYWJf2PRBZZJ49SiTKXi+J1Rq6ohbWIWhEXDV70skg/xO1gv/Za8EORVhK/erNDd
	KykoCbbGwX2oYNJYNzFIsh9jrlTGug9BsTX4tYc+b17x7koLG1qf0+VVGZYmGaLN
	Ac3PW33z/S7J8pdTLAY1ni1l/GzU58/FsgTQnMPqJTPujxpOsN4COjZmUV2LvByF
	8NTI4GDbEes3D3kBvABVlwugiKgaQeaWlx1WgDIk9rawf3rdHUGIeKhVpTv4vKRr
	XKR80Q==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e9ecag6e3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 14:51:35 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-639389de134so2590331137.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 07:51:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779288694; x=1779893494; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KrGdZ6Bna8qkROGke7rL/1evORye3ZzPkLd+P26j6Fs=;
        b=PG4F3D0XOfxkGlSE3Cw5DTFjhr2rQt7E/5Yx9LnfV1FJqlBLJ6FUt7d60mWTMiZM0v
         SK9yQUxbkiWWiRsvn94HnnBqFsRvbdSZ9igA8MD9pHLzx0xPpj7vykRzr8l8beYcCJRA
         wjRCyNFbEINyR0PLSO0jlT6mLivKI4jyDkMM3nlNJio3chMbbLds9rpiNqi+3Cwy+Jaw
         JAv35eRF0UGBb0lDsWCBIcpxG0SwB4usEAx8+7cQMh0R7T1+qz/nVYMmIcffy38NuMNK
         pn+u7suH/ns3kP8PTOyXYSGEt5gezwW+SwwNimKlYYZEeb/sZMC42MNhDz7eTHXK155T
         +FNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779288694; x=1779893494;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=KrGdZ6Bna8qkROGke7rL/1evORye3ZzPkLd+P26j6Fs=;
        b=HAHJmM62S+EWxUmHOP67Ew9WUIx2qaPSlep0LUVtQW98IAib3SoB8UFHmVnq6OOIuB
         EZkBtvwIFyT6XKUZNkzckFEn2ZaKlpl3gAhNUe671FgGbnfsnBrKQ2daEwEmSsg0KCYr
         DGzcu8IxfegHh6ytCMDaVVG2fJhcvK7zNXRT8hxwPwl72R1T/3I988tEBHrkHyCGwWtQ
         ff/7xTQ4VxWoszLlZDBH+45Wz9qQphwqyrf/6QNZwk4q6i2n0e+oXra8/EI0RnhPUBSY
         VEAhtAYXZoL5FmtSn7DVjJ3M7nn4Eb6QKg6542i/SG56bN6Pukdw4JhwvU5ZuB3BXDKX
         Vr0g==
X-Gm-Message-State: AOJu0YwFws26RTtS8Rpw3atG2ZzG08YKcHftJ2byvrkOJiOiIsGFtYkl
	qbwS/GSkADOF+GKLvakTKHSSA8PFFhzNPWeXrzbS/RM4lPjrMcgl+6itl++lqtVce74vSA6jYsf
	qGRwmcra6ixYo3GEFUMajuhqCqUeeBIQHpF/731fubBN9k7j1Inm2pznbVaOYf0lEorLs0XQYZ2
	t5
X-Gm-Gg: Acq92OH73uAV+I5ANH7KuCh7h+lDfuOnc4tYCDLsYhn9yG8DAMAc+tK5UdZoiF4qa1e
	YQ0aEmOOu0BePVnwQS1A0bfJ84WRHjglxNG+MMmP2MJGXxkTGnOVIEH9gHKhmffsWExZWBA+T/h
	YE58bHX3D+NzoUzU2fFVWJINj62y8tAjn+AtzU5cLELpGbUHXXecTqXoWVqUUDY7aEPJVUlYDZ/
	FvvOYsJ0He92Ki5bJTRgwj5wTPocWYBPFLHB6vPlW0Yge29dzSv4wOL+r62FAPG5wpFsvdWt4IP
	BByMOzqbFdFEA9hwWLIFj8oBXxgzje6PmW1nk3/6U1TPltXyWrsnIHh8lRZwLvVMsvkzP/eXT18
	f38UPdC6rfjzutRAUiae5lkS/M2CcmstvlynFgWj9Y3jIWpjAzn8saxbslyLtrcPCldnG5qkAdW
	xABwU4Jbsni4d18cCJ83E924LRLL9teyD4Efw=
X-Received: by 2002:a05:6102:1492:b0:631:d3e4:efc4 with SMTP id ada2fe7eead31-63a3d951d5dmr11748427137.11.1779288694400;
        Wed, 20 May 2026 07:51:34 -0700 (PDT)
X-Received: by 2002:a05:6102:1492:b0:631:d3e4:efc4 with SMTP id ada2fe7eead31-63a3d951d5dmr11748397137.11.1779288693853;
        Wed, 20 May 2026 07:51:33 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a90f10c78csm5128907e87.14.2026.05.20.07.51.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2026 07:51:32 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Wed, 20 May 2026 17:51:13 +0300
Subject: [PATCH v5 06/28] drm/msm/mdss: use qcom_ubwc_version_tag() helper
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260520-ubwc-rework-v5-6-72f2749bc807@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1662;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=pQcZSLClq75f0H7mdOxTbEo5DpGKFB3n0GBshQz7Fb8=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqDcpmxwfkqlssMuazJ+ZnFSAY5SwQV8SGP2rxc
 OLxiVEELr+JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCag3KZgAKCRCLPIo+Aiko
 1RtVB/9jLWGlQhSV8Z4vXHYlDNi3b4AohzUIwBfvDF2UuVqGjP4wAJvNTIxAO9+Xx7ShPDskRfP
 sGxAF9JqvTllksEWZJ3RL+Cs6pxtBLUcmcXxbXOtsms57sH+L3yvTc4oLpuwXXQ6yhlkxiAySPr
 mEHrqxmxcVVjYTBa5hScgIiCtucXxp+GDJb+H0TUb+dUESvyz+K3R+iuuZq3WzIntwSeOB1+7AH
 rXYQGPTt8RDQ7qcRcnbzoulM7w1u5olKt011cNdiRidfk2nHCQWfeYpI78zZAF0lsRBzzKguljz
 vgM1ZqhZXnlBoKr8g3a0u8NaxmvhQbeopvlPxFXJbGXA3eHU
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: 2z15MuPih5t1_Q2H7GOsI89N7YZl1TlP
X-Authority-Analysis: v=2.4 cv=WqMb99fv c=1 sm=1 tr=0 ts=6a0dca77 cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=qBJULKV797PGQuHHbA8A:9 a=QEXdDO2ut3YA:10 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIwMDE0NSBTYWx0ZWRfX8Djc9ZEvAPA7
 QQTITqs2Jct+47MqS4xI2TUAmB3h1V4iQqYfs3A/qjxyuoTmbSdWHUfYOZGKu6ZxIWz98HVSPTF
 WoTHbmKVDuL2nx7yn88s7kNBUWVBxlJbi/0m9QyGw4EzNxOlP6uGz9dTgsnl3g0EvDWWnlDWFfe
 yRzTuoJe3KYl9xDqmIqM/CWor8TzTxmQKIWTdkjv4vydtA4jswX0atbHfrXhnTswhbn8Cx7Cers
 9CGnoWasBDZkuitG011ehyIhiRIF+8Ir/KMho39/D1lusknzxKsrT0B4qUSAI4JSQLTUva3jJty
 XALHZq9vyKy8V7kRpKtP6ueLngqQWU5GXUS7CgNahwGG/ie2QwKi/kA6+amf0V3FOPdaGdAfqS7
 NCo66qGg6iIH3zkxP6DPYkVPmXbmnEwYm/sOrPRHFNxRXnMDFCnEFfsSPb2I94I0x0zUakAdGEa
 L3fvT6+HcxANsM6U4fA==
X-Proofpoint-ORIG-GUID: 2z15MuPih5t1_Q2H7GOsI89N7YZl1TlP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-20_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 clxscore=1015 spamscore=0 lowpriorityscore=0
 adultscore=0 malwarescore=0 phishscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605200145
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-108792-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: E70375906BD
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Use new helper defined to program UBWC version to the hardware.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/msm_mdss.c | 18 +++---------------
 1 file changed, 3 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_mdss.c b/drivers/gpu/drm/msm/msm_mdss.c
index 4a6acd468bc8..229b47415f29 100644
--- a/drivers/gpu/drm/msm/msm_mdss.c
+++ b/drivers/gpu/drm/msm/msm_mdss.c
@@ -201,7 +201,7 @@ static void msm_mdss_6x_setup_ubwc(struct msm_mdss *msm_mdss)
 	const struct qcom_ubwc_cfg_data *data = msm_mdss->mdss_data;
 	u32 value = MDSS_UBWC_STATIC_UBWC_SWIZZLE(data->ubwc_swizzle) |
 		    MDSS_UBWC_STATIC_HIGHEST_BANK_BIT(data->highest_bank_bit - 13);
-	u32 ver, prediction_mode;
+	u32 prediction_mode;
 
 	if (data->ubwc_bank_spread)
 		value |= MDSS_UBWC_STATIC_UBWC_BANK_SPREAD;
@@ -219,20 +219,8 @@ static void msm_mdss_6x_setup_ubwc(struct msm_mdss *msm_mdss)
 	else
 		prediction_mode = 1;
 
-	if (data->ubwc_enc_version >= UBWC_6_0)
-		ver = 5;
-	else if (data->ubwc_enc_version >= UBWC_5_0)
-		ver = 4;
-	else if (data->ubwc_enc_version >= UBWC_4_3)
-		ver = 3;
-	else if (data->ubwc_enc_version >= UBWC_4_0)
-		ver = 2;
-	else if (data->ubwc_enc_version >= UBWC_3_0)
-		ver = 1;
-	else /* UBWC 1.0 and 2.0 */
-		ver = 0;
-
-	writel_relaxed(ver, msm_mdss->mmio + REG_MDSS_UBWC_CTRL_2);
+	writel_relaxed(qcom_ubwc_version_tag(data),
+		       msm_mdss->mmio + REG_MDSS_UBWC_CTRL_2);
 	writel_relaxed(prediction_mode, msm_mdss->mmio + REG_MDSS_UBWC_PREDICTION_MODE);
 }
 

-- 
2.47.3


