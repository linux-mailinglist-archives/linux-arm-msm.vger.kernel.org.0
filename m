Return-Path: <linux-arm-msm+bounces-106370-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MAWsHqyO/GmlRQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106370-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 07 May 2026 15:07:56 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 170F24E8E82
	for <lists+linux-arm-msm@lfdr.de>; Thu, 07 May 2026 15:07:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 36A81304839E
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 May 2026 13:05:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A6E62402BB9;
	Thu,  7 May 2026 13:03:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="X0UHr3AL";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NexHgKSi"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C51C402447
	for <linux-arm-msm@vger.kernel.org>; Thu,  7 May 2026 13:03:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778159034; cv=none; b=I+DeLoLaGFYhIEpckda854Phe+0F2h4iIv6axM9wmJc/MLsp+mpJXp1A2a9bO6SyrJ79Fi28Xoo28n2xz2sIrO2ezmRToHGTH2R1xmrHTnmkZX++b/9SvbAKa3aTPqC6zMWIQDyr4Do/v1g/MPFoYYQlcwerGq+u8/0i0TtcBxA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778159034; c=relaxed/simple;
	bh=6iZnedW4RBQxA96XKjwsTUc9JsPI83to3JJHc5dyQQ4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=sQp9u3haxN4DW66WBq43/anpPk+rLb81WBGjWJa3a/cd9s5bdtFyXApDZQOXJXfrpmfBNgZuZd9lwm0g3MbDgXvCvohajeZlBT4kgi2EmbWBXPehmSrnPp+7VOlj1QBKynR59mKpMpDZHyJemz/Vl/9YqJPSDnT/tHKEgGOYZOU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=X0UHr3AL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NexHgKSi; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64791wkZ3464037
	for <linux-arm-msm@vger.kernel.org>; Thu, 7 May 2026 13:03:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	uukH2Hr1fThFSWIyYnWWKO/3affNsowUSHW3Fd24TQE=; b=X0UHr3ALeJ2X85U2
	5aKqfOdFP9Ga3vs76pr9M9mcPS7945AG7Mq904XnUcBJxxNTSPTPyYSyr395OsEz
	cuoBKD4ORvFQzksB4afNRARa0HDRrsuPqm7KbHphKGERb71Fp2wYs8slZ8uoyf+V
	7NAylGFjkwxkTIwYiMMMErhx5SpNHDwp2KKmdpdbouxLb87TkteS4AADQX9+UnE1
	FUHMSUYUxaVkVp6IdtImZBWYcSv5J6BKpSgmaSbkMYZGQkhR1kJyVoufrP0g2mf4
	3/aZ0KN5yfkumFDXGy7L65Ioct2shd2t9mkImCzFd114jZOiO6q+EPUm99uLjdhL
	KD9RhA==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e0hvn25s8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 07 May 2026 13:03:52 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2b9f5ac4e36so8741705ad.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 07 May 2026 06:03:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778159032; x=1778763832; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uukH2Hr1fThFSWIyYnWWKO/3affNsowUSHW3Fd24TQE=;
        b=NexHgKSiDAYTmAsd1NhQ/wvYrFYJhYrUn6SaBN3zxJLDwNvoD3UXaeEfVeqtl48F/w
         SzIvYu6yY9f4jxA12c9UOQgsd7z1T2nF/AyWGJrIK6dq1KhvLHKafizm4bVAuLeR9SJr
         iQQLKJrUB5hq87ab5AmLWZS115BMIPLAQxjfgCOZl/ajYbYz76SbcwBR4JlYAr3CIiT2
         kSe585sxctpkYwx0haszRf8yW9GIcr1Tnq3+pizZ4e3HZeoUCMoK8PobydAT8EMziUh/
         Z/VDqT4kYWiGflxZlXpWAT02oNhrv3/fPkyHNZUcBLhoiLpd1goxbTcJkeo4nhq7vRMg
         cwXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778159032; x=1778763832;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=uukH2Hr1fThFSWIyYnWWKO/3affNsowUSHW3Fd24TQE=;
        b=ggNTRFMFOeI2VhXN37XaQjncGXrZfVW6HhsD99ybuceQXPvz5cLZdXRkMRJfqFBNyX
         eoxMUUwpTiZ4PfQdwsSrYi/H3I3x8XJZ2qHmZ/GHOv9YbJ3zZWO6DWHOQ0fPXPxk1yFw
         27br+PVwJrilLGc7MJ+5yduLOBMFai1OUGGj2OX0aECyw/cptls8ArE/CgFEUcDql1vM
         vEzt1ygQjut8HvJUrX9dkp72kVBzO3EdJDSpS6SpAVTx9EbwquyQlJcHFn7ATTUSkz4/
         zjT0M5uLJuuHk384zZOfpphrmBeG2YgFB185Y6QRdjhDkPgOoRSXHtscaBRKJhgJX8gc
         31Ig==
X-Gm-Message-State: AOJu0Yx4dyaMFQ7Z4+Z7Cl0K0tBf4Tui5v44iLFHWFymhpBLeCK00ZnP
	scdRKaFTFL+Hdaw1ZKun9HuX5vuDZ5PEy4vdgwFEoViCOyMT/4H32sNGBEEGGYXA6+ofln5lH0r
	gsy95dm3MEEwRIk/41ghb8sMOnRUUGQ/H0JFN23gmlr+Ntje+ExTm4PXF3hNEY0K71u+l
X-Gm-Gg: AeBDievYM4Awmk638bXLzD81Rk1AeJ6WrN95GUXP0aSFiLe+LN8tP93i4rNlHhNSgVc
	R5IbnvhuVp9L1wbvZb4FRBVmdIaqW74oiuXYI+e2Sptg0QUHld2hd5CJL4j6mXSUDBaLoVxGFr2
	vgVWn3tgtfptGMO6hJkK0VNANJFzb9ftI9jFKXM8HS4Wqy3FIT3EYtj/q++H/3i+vj6GU39Sibl
	afTvGlqFTd5WCGBRseS888HOzah3DSzOiisn82QXu/yxt/OJEDyFsRGhw5j3M7k/hdYV+jRVYp7
	Rb2sROIAJCBqfEpsb57g6PKoLFOuLQtAUliwPfjK8zmX072G4qy7DeKuHCoGhHgWfbWB0bAVx4n
	WLTDaIYgM7mreN6polgVe3oTFQnlBroMzieqqPn4dR/eRVGZ1rY5tZwv076DxDLX/TC598rxPJR
	joXUEIEQBPqx7uOU2Vi+eszdBzHwENpNGppghKDmvuZUNyRA==
X-Received: by 2002:a17:903:1aa6:b0:2b2:b117:1d5d with SMTP id d9443c01a7336-2ba7a358945mr82837545ad.33.1778159031515;
        Thu, 07 May 2026 06:03:51 -0700 (PDT)
X-Received: by 2002:a17:903:1aa6:b0:2b2:b117:1d5d with SMTP id d9443c01a7336-2ba7a358945mr82836845ad.33.1778159030983;
        Thu, 07 May 2026 06:03:50 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a85c230c68sm5595959e87.19.2026.05.07.06.03.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 May 2026 06:03:48 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 07 May 2026 16:03:11 +0300
Subject: [PATCH v4 15/29] drm/msm/mdss: use new helper to set ubwc_swizzle
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260507-ubwc-rework-v4-15-c19593d20c1d@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2044;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=6iZnedW4RBQxA96XKjwsTUc9JsPI83to3JJHc5dyQQ4=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBp/I2G9ANDXPjlZexp+XhfAK0XepXdN3d9kDcOB
 kYWyWUseyKJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCafyNhgAKCRCLPIo+Aiko
 1f2eCACpC1lnsPAc81O0pYhBeuPkG7mEdw2fwShl44wnSc0uzz1Ke4np7eTGJ3sNDJfEMVbGmZA
 SDtQST7+/BolNJvvzmWooCgJowDyCLUBOH9TMs+49kZrkbx2UmNbQnPUnGi+9HDXOzJ9KAs63kh
 EE51MckhcC4/vBYQgu7hoaZ87ffFPl2iWv0UMbXJkH49yi4qean9X0bDEpmtyhjbJLquLsinVTZ
 /EH4ab6GXPAGzPhLa8AxDOP06ykclcM4iT5IRKWiPhiARDoztOSbSZtsNo877qSak3X4nT5QvDk
 qiIlNGfZsvkX48s/w/XumIMX7qn9IcM54iZe1K9JeD6xNwc/
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA3MDEzMCBTYWx0ZWRfX53rn6wShYygL
 nAiorZadgHT/vbid6OoIAb7ivkbFOhO1wW+ccwfH7cLH6bqfAoS5NeqBS/8SDg/w3qtmlXBwik/
 V0ASevs3teWf0Eketo4B8/hajRwBBErgLx5GuG6i0miqqyXr8Vb3qapKBNmlQYMJEbQ0o2/1odh
 9Qy1Z7aRP6Ji7MM61cuvu/9CKfPy6Qfbmj7coDe64+5Yw+ENmenu1vsSDQvzmUWAh9jmDGHtv1Y
 PhFeDBtxHwAgZiFPWNrTRhQDAv5njU6sxA/LXFn00dfnHfL8H1W96Jk78qtQR1XFuY7wyT9qak9
 o3jmNgH42gdRrVIXiCWKTpH+NO66a2ObN6nhpn+ltTTaJLOYnoIfdR2yVuz7SMeuqQ1YB+ctkEY
 XIP6YCD6MEQVy4p+mCeIt72Mfud4cqebBiJac7gA4Ls96Du18xQ8TDrfkOVw9ckSZJfsV25NqH0
 Rs8kvZbulaUp//vGkPw==
X-Proofpoint-ORIG-GUID: vmS_Y5a9kl6GqOJAzG1um5YcSosC_Ies
X-Proofpoint-GUID: vmS_Y5a9kl6GqOJAzG1um5YcSosC_Ies
X-Authority-Analysis: v=2.4 cv=ZZ4t8MVA c=1 sm=1 tr=0 ts=69fc8db8 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=crYPmtHWi7n-_IQ59sQA:9 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-07_01,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 spamscore=0 priorityscore=1501 bulkscore=0
 phishscore=0 clxscore=1015 impostorscore=0 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605070130
X-Rspamd-Queue-Id: 170F24E8E82
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-106370-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
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
 drivers/gpu/drm/msm/msm_mdss.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_mdss.c b/drivers/gpu/drm/msm/msm_mdss.c
index bf106d849dea..3c1f04f12c3d 100644
--- a/drivers/gpu/drm/msm/msm_mdss.c
+++ b/drivers/gpu/drm/msm/msm_mdss.c
@@ -169,7 +169,8 @@ static int _msm_mdss_irq_domain_add(struct msm_mdss *msm_mdss)
 static void msm_mdss_4x_setup_ubwc(struct msm_mdss *msm_mdss)
 {
 	const struct qcom_ubwc_cfg_data *data = msm_mdss->mdss_data;
-	u32 value = MDSS_UBWC_STATIC_UBWC_SWIZZLE(data->ubwc_swizzle & 0x1) |
+	u32 value = MDSS_UBWC_STATIC_UBWC_SWIZZLE(qcom_ubwc_swizzle(data) &
+						  UBWC_SWIZZLE_ENABLE_LVL1) |
 		    MDSS_UBWC_STATIC_HIGHEST_BANK_BIT(data->highest_bank_bit - 13);
 
 	value |= MDSS_UBWC_STATIC_UBWC_MIN_ACC_LEN(qcom_ubwc_min_acc_length_64b(data));
@@ -180,7 +181,8 @@ static void msm_mdss_4x_setup_ubwc(struct msm_mdss *msm_mdss)
 static void msm_mdss_5x_setup_ubwc(struct msm_mdss *msm_mdss)
 {
 	const struct qcom_ubwc_cfg_data *data = msm_mdss->mdss_data;
-	u32 value = MDSS_UBWC_STATIC_UBWC_SWIZZLE(data->ubwc_swizzle & 0x1) |
+	u32 value = MDSS_UBWC_STATIC_UBWC_SWIZZLE(qcom_ubwc_swizzle(data) &
+						  UBWC_SWIZZLE_ENABLE_LVL1) |
 		    MDSS_UBWC_STATIC_HIGHEST_BANK_BIT(data->highest_bank_bit - 13);
 
 	if (qcom_ubwc_macrotile_mode(data))
@@ -197,7 +199,7 @@ static void msm_mdss_5x_setup_ubwc(struct msm_mdss *msm_mdss)
 static void msm_mdss_6x_setup_ubwc(struct msm_mdss *msm_mdss)
 {
 	const struct qcom_ubwc_cfg_data *data = msm_mdss->mdss_data;
-	u32 value = MDSS_UBWC_STATIC_UBWC_SWIZZLE(data->ubwc_swizzle) |
+	u32 value = MDSS_UBWC_STATIC_UBWC_SWIZZLE(qcom_ubwc_swizzle(data)) |
 		    MDSS_UBWC_STATIC_HIGHEST_BANK_BIT(data->highest_bank_bit - 13);
 	u32 prediction_mode;
 

-- 
2.47.3


