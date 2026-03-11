Return-Path: <linux-arm-msm+bounces-96836-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0BZ1NWvhsGkuoAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96836-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 04:28:43 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A9D225B950
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 04:28:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C6A323177B71
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 03:24:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F1CE5370D64;
	Wed, 11 Mar 2026 03:23:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BA4NSYO+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UtcHEjNJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 389912F6577
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Mar 2026 03:23:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773199433; cv=none; b=WRjBZc/Y2frIrtPJFLRzCyqOyN9g6Zu8dIZMPyYDq92JI1yk7ZybPswZcM7RR4nM4039LA4XnAs39CvUXBQxKxTOS0UQPE6/3GeUr1yQPu/QiwCp12kT/Db6BUfDgAe9Xzi7vPTJoLxaoC4sEw6jAy6SKmc46dd0gKYpQsygfGI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773199433; c=relaxed/simple;
	bh=K49X78cQYefYAi6H1TnQ+qasfdkGvxo87cdI/yz49d4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SY2XpkyCa7fANnk0LJ3DNIT8waIJOZ1lH+73aEnxXMfVWEbPLmAuxPEWlMWtUL+mJoDMdRnDDODNR+HH+IXi5z4l8urp4JGE1CYBEybapCWFnF1B3nePqpequ8G6PDJ7q5zjlklxJd4iZfeRVsMhsgEn0il6yc7qghaMDB+MYXY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BA4NSYO+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UtcHEjNJ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62AInbgG3417119
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Mar 2026 03:23:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bulI9HIn/5sXJBmSMBiJJ/8d6hU/vbxR8xGhgN9fpS8=; b=BA4NSYO+fKLsEm+4
	yG2PTjygZPWd0qY2zE8HE8PoE89SpGEU8osIa/cKkIDCjrownjT684LOfcDgiceK
	irJnpmbiWZbU9Y0IOKKV/URUUfWdF4cFK4Fy+yzpjoVkQAsBTmNR+KLhgv9Lw/Hq
	tmsxiRQgfXP0WNFrzhqKHyPwNs9TFWqedTKoTWhBYKIEBGbyeLfMBUmVLgObtOT+
	nxveDRxxIU9wFnHRmJXmrPJavyvLhMIiZp7CHWWtRF7PWH7V/Swwg89jDsEqLGcu
	PPBq/4Zfb4jZNACAp5GHevL3Cbog7vvzYZyODOh9pzGgEQlT+bly5HnuEa7AjELr
	hJD1Kg==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ctja2b624-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Mar 2026 03:23:47 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-5fa75a19f21so4893949137.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 20:23:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773199426; x=1773804226; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bulI9HIn/5sXJBmSMBiJJ/8d6hU/vbxR8xGhgN9fpS8=;
        b=UtcHEjNJRYuZJpZneqGzNLY8A/C9JeT8iW3stwf5WKLM3or0EiNoPCcduqM2M/vnGk
         XWaUZeBJbZCsAZWZfbORIFwKn4T3SxY1GeOZonhKy3z/jvA6yvCnnPuu7XT4H0FKsg9A
         Udg4e549IEtbZz7h4nYvyORHmj9I/WADEnUJROMudczwCr/arWQWjI+TrVUoO54ZG+Ah
         5P4yOayiZc30JXKUdKoz6PxGNHvCjcyD5MNEauOzNPRMOXddOntIV+wfV5FJ/waiUMA+
         z+OCW6j6Q/T8gNaOhen9b5o9QEWvWPtTsnXm7lGNVgYXgPO6ChPsZGU+R8ICwNFN/UWV
         PvDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773199426; x=1773804226;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=bulI9HIn/5sXJBmSMBiJJ/8d6hU/vbxR8xGhgN9fpS8=;
        b=kRaCEDzgxFXQOgSG70lsZ7jybjM4olFdfafQ4ncowMqVPauWLArz301lDWNElokNp1
         ftzfek3nj1lnzlYvZAEjzTRaYCF5gQ+AlqyA3IQlFVepOBuFAohbmiYN4k6nXrOTJudC
         FeXUhiC1UxSP6o9XXQp4xgK484s11OaByAtw5LkpOQO2ONZx5XgBgBcV05g9loBkAFUX
         zfF71YgGQ4HSYm+Uta45PwXr35X723qHqFRHoG2bvFrKHD0AFJkWvk55H2P3XyOaljA7
         l2x0UxWlHTgDDq9lkUud70uQi/kBS2k70+pwsBPQdU0XyfZ4KAlYCBS+ZKAtu5GlaOyd
         qsdw==
X-Gm-Message-State: AOJu0YzwcbBESdTL0rxeHtcS+SVKMH8AIjXHdRCNARDJVJC2519xqkr8
	khjpcVwtKuhLl7446h4Y5LfMYhspc8HikGt4+HuidHUJ4cS3De+jHRyQskIvwLZwHadi9RAF3wJ
	44qa/SqVYnHYWjXN/+Xie3WVSf7PhUhT7bE0EXor9GZkjf+zIepemRx8ClGjdeB4DielC
X-Gm-Gg: ATEYQzyDUGmmiO0rV9mIRkMR8B8XNyVGKovq1IJ8/xi3IvtbBDWMyuZIOUofoXeKbeR
	l1pNx6mQMrEyU13QLtx5GaMYaHG7sqiqlYot6DsPiWAJqUIiGTImar1VYaU4ag0dWyV+af7KlWi
	nL4PxSEjSkDhqcrreMLb/3AOLjV5GGcxvqXShrqWVnG3YEBqqG83v/jEBC7y2UfJCpA1x3IAwyy
	WdU6deXg3RkZtjX/HI2orl4gm6XsesgPC5db6y+3vjqvljqfOCjqJT0YeUHUppChtWinxNRgvXg
	9Ow+1n8f2vXG6oH54ZuuKFBUZAnX2050YB3fuN98Aj9kkT3Wfhegv544yJCjZcvGnK5AaeTgK/V
	d8lMUR/eb/QvgQ5HpsK2tSRgsDJErEfQjz6GWAl2S1jWHNxz99pRox0Ka/mMhHg1XWjeShnioEB
	4skz9/XeeT5h3gFZvx33g0aLudVEB9tjlXbOw=
X-Received: by 2002:a05:6102:3a12:b0:5f5:3739:100d with SMTP id ada2fe7eead31-60039fd081bmr2271250137.0.1773199426354;
        Tue, 10 Mar 2026 20:23:46 -0700 (PDT)
X-Received: by 2002:a05:6102:3a12:b0:5f5:3739:100d with SMTP id ada2fe7eead31-60039fd081bmr2271230137.0.1773199425939;
        Tue, 10 Mar 2026 20:23:45 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38a67e5ed41sm1422721fa.25.2026.03.10.20.23.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Mar 2026 20:23:44 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Wed, 11 Mar 2026 05:23:05 +0200
Subject: [PATCH v2 11/25] drm/msm/mdss: use new helper to set UBWC bank
 spreading
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260311-ubwc-rework-v2-11-69f718f2a1c9@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1239;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=K49X78cQYefYAi6H1TnQ+qasfdkGvxo87cdI/yz49d4=;
 b=owEBbAGT/pANAwAKAYs8ij4CKSjVAcsmYgBpsOAekzSl8ucJxfHFB/1y9bmW9AvxMnyjYAtJ/
 juCRqIJGC+JATIEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCabDgHgAKCRCLPIo+Aiko
 1aKMB/iF2RG2U7HbuM3hjiAc5u94xg8Cy+xW+3Cx++8+byu1nxDmnlHD4WXYIqFfmUOa5LXf59a
 pNo9GOTwAKRo0gkwc9fy6gRi7pYx10kR/qXsTEt0UDbXq7YwUV/i54hiV5h4zZLyPV5wsbKr5Xy
 aG8MB1HTx3Tgy7izw4/VAmr8FjuQavnAd5EGRdTctWyFV9ESp/MpHt5sUJW7WCpEWQTtl9XvVmJ
 7mGK7TErBaS6zY9hwBNIe2NRmS36Lo5aSd01pYPAq/Ckq11e8+xozG5oYcM2Pydwe5eNwBG6CLI
 AP3tsAwXfJ2ldMVXi9sXY1RhUqQC9B8j3LE2186XXW2V2yg=
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=c9WmgB9l c=1 sm=1 tr=0 ts=69b0e043 cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=ujCctoy6CNRHcyqwK_8A:9 a=QEXdDO2ut3YA:10 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-ORIG-GUID: UnFK2ErhVNqt9gw3mVGgSx_u0dxNQBHY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzExMDAyNiBTYWx0ZWRfX12A1OMTppifg
 A56i4O/NoFkoZ/0aOrlgypc6JuO6iLipyuxTvWBaf92vz26v2xDXiAFewCcGKkSOKCHLSONrF9j
 BYGVFawRezm1VSqsncEBFoDtxRsc1yltd2U2sPDvexansABiW4U0gSHPz+cMoKpoCsfyJsqhfcl
 1L9bWl86tBFTHgQDFFMmN94leij/DCBrvc+/tgCABVZUoIzGAP6dSKDbMPIKMmApOUhbA3q/PyX
 O0b0+hNJmiuRXGk7DG02DMhjx7p40/zkA3uoYa2pEhONwE3H0GVFIIz5bekD9kPr9m1mlVb5aHn
 NXKNT09gjJiUi0TGLCNpr4ouUAtBXKPXxZvlrg1gHxl47OTf8ZEGQOtsSYpgK0p4JpPCKiyn7xG
 LOYHgiK1y8ZzztgVtJMJdFSLzRK5/WXiETAVabyBgMJPeTMZea7jG+2y9X9KCnlQ2yUx/h833SW
 4I6zGjUtjdP3L0HIbHw==
X-Proofpoint-GUID: UnFK2ErhVNqt9gw3mVGgSx_u0dxNQBHY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-10_05,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 lowpriorityscore=0 suspectscore=0 spamscore=0
 clxscore=1015 impostorscore=0 phishscore=0 bulkscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603110026
X-Rspamd-Queue-Id: 3A9D225B950
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-96836-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
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
 drivers/gpu/drm/msm/msm_mdss.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_mdss.c b/drivers/gpu/drm/msm/msm_mdss.c
index 49e7a6a4e5f0..c28bdc21fb1e 100644
--- a/drivers/gpu/drm/msm/msm_mdss.c
+++ b/drivers/gpu/drm/msm/msm_mdss.c
@@ -183,7 +183,7 @@ static void msm_mdss_5x_setup_ubwc(struct msm_mdss *msm_mdss)
 	u32 value = MDSS_UBWC_STATIC_UBWC_SWIZZLE(data->ubwc_swizzle) |
 		    MDSS_UBWC_STATIC_HIGHEST_BANK_BIT(data->highest_bank_bit - 13);
 
-	if (data->ubwc_bank_spread)
+	if (qcom_ubwc_bank_spread(data))
 		value |= MDSS_UBWC_STATIC_UBWC_BANK_SPREAD;
 
 	if (qcom_ubwc_macrotile_mode(data))
@@ -204,7 +204,7 @@ static void msm_mdss_6x_setup_ubwc(struct msm_mdss *msm_mdss)
 		    MDSS_UBWC_STATIC_HIGHEST_BANK_BIT(data->highest_bank_bit - 13);
 	u32 prediction_mode;
 
-	if (data->ubwc_bank_spread)
+	if (qcom_ubwc_bank_spread(data))
 		value |= MDSS_UBWC_STATIC_UBWC_BANK_SPREAD;
 
 	if (qcom_ubwc_macrotile_mode(data))

-- 
2.47.3


