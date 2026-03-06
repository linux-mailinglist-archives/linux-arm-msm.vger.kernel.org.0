Return-Path: <linux-arm-msm+bounces-95892-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qOI5J10Gq2kMZgEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-95892-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 06 Mar 2026 17:52:45 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 40F09225815
	for <lists+linux-arm-msm@lfdr.de>; Fri, 06 Mar 2026 17:52:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 25C093189CF0
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Mar 2026 16:48:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1299C42F55E;
	Fri,  6 Mar 2026 16:47:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VUFNn2O0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="g2Qk5czJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3C30423A95
	for <linux-arm-msm@vger.kernel.org>; Fri,  6 Mar 2026 16:47:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772815666; cv=none; b=kBDOi58Y40pxp6uJP8nuGF42boZS0fQSnAXuzLsqcHG53PjElv8wc7PW7fJmazNSPQ/SZXVYH79alGJ3Q4BUMcSHyWpHfX0qp8K8BNZcIXg+8FSCHK4eusx2ieenTaflG+rssO8fAyAY6951WfwK3dRBvaF1+l6G08Il3hp5K7A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772815666; c=relaxed/simple;
	bh=vwRo08OJVutBorS+YUDrF98Dwqb7dE59/dcjOq0vApo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kqoGGtOoJkh1CCkgBnQNMqsvSUqfrIz+1RFroWhPtaB+p7Xfy0WTi02Vt0d4nq4C3V8f5LezraTICvglv9IZ1zPFKckf5J7W9h1xssQajSrrdSyJpf3GUvPdUGTL7ibmMqk8wFi5HI6HvQ61tv+EWmGymIpUFBuGziNWgLk7zss=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VUFNn2O0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=g2Qk5czJ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 626FrWq82009001
	for <linux-arm-msm@vger.kernel.org>; Fri, 6 Mar 2026 16:47:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Ywz55t77MzTGeWA2SI0gC7OmSPpeiWuIVuyHjN4dOpk=; b=VUFNn2O04bSHDmBy
	sUJKq5bTCIXbmEqZV60HspAfaAUBL3M6CHYt6j9f3o6ivfVfdztqMUTsy++FxZdf
	QzSfasNBMTvOmAPkbEPgllvhJ/jcK7Yu5AplEse0GA5S3abang4uZub42jcBHx9D
	74Xr/JIfUsonMbe2R74qhiK00DQBBXmllIo1X0OvPVqLVgm0Xk731ALI5m7cEKKm
	6cG5Xt2BreFFMnumKNPaUvWmaXj4Wk4Q42LUFU7llAttQfJxZpcPZ4/oLtOyVdxq
	3+PFpuUKssO7zOFiVoYEfv3XOXf2TPpia/thGfBmlJhRMWFrlklE96i2P/AqzNiN
	ccQXlA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cqv9ahckt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 06 Mar 2026 16:47:41 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8cb3fae6f60so6040659185a.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 06 Mar 2026 08:47:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772815661; x=1773420461; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ywz55t77MzTGeWA2SI0gC7OmSPpeiWuIVuyHjN4dOpk=;
        b=g2Qk5czJSRJ4p4VADwWvIs4B4kf/sr0DDNDGl3AulLji8Kj627jxlpP7h1+aBNu5L6
         sVcU01dnUYsJl/0LyvBAhVYY48X6wqYgZBjjakAQcR7gYvjUZ8zeO7yCMEOvilSQU99a
         3OOcB0qAuXuwtSvBmK+MMEy10FZZdPM6AsVHwYHYygPzJBmMI7NUfjjmP5XTnIRsBGTb
         hl6vtpgXPjC9J+jLFFnovcfCRNBIm2Ty+EOZ1L23VImBFmT1cFgn4GiO/S5at32P4wrW
         K8I4xKMI2k37wBOpJ3O2omzHyzPbDS0JY4efmzr0YYsJGeDJnIynQ7ADMCUT+HSUQMkX
         LLRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772815661; x=1773420461;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Ywz55t77MzTGeWA2SI0gC7OmSPpeiWuIVuyHjN4dOpk=;
        b=ujcJToXl8USE98ERtlMED+ZJmHSEFlYQzt5LfXodTc/zyDeEp6e6jDiEm77nJjBulP
         CGIIFHhxFVINviDMPKqxYWs1sBoANYlHRDT6Tfcu+hG+n9wW/dICOA0WzX4rdMbdxeWa
         oQEawl1Uy7SWj4pnuUHm0KlL9bPfLkkcBrLwsUfZGzJPfVJgmYcLxS269ybFH8JWggjr
         Rl8jqhreCPvaTssNW7vZu37bWWyVDzxwT2+uUoHuhIW5hf07I/w2KyBV0yAZmSMLUYvw
         i0UEccAhZLuHDEEbCUJSwVnfi34OlCScuQ77OEPXzpYGX7o1n+iWbn1FbCoTz6BkPgvn
         easg==
X-Gm-Message-State: AOJu0YySQJLBnzkfCC06WAP5z2zK9Jw6UYV6l9k0dJQcRZmuqp0/GAqy
	6N/HMo/Brjp7gaDEJ23TW3PErrh5837dP9jo+/66F5AGsDcIRqnUMQSgmezATRpftSPULUKTgiR
	RpxpQrR8dzMWdu9EUQ4u/MezwxM97itza51sO5FTRlR3rzTVNJCT49xypL7wudewD5FD6
X-Gm-Gg: ATEYQzw8Bqd8EDU7NJ3cx9q8LfWUgqWKNfaFm6Stlbr+uyo1e3sd6K/Qu+0Rqu6YDfT
	t/I0ZYE9B6UnjP7QDxvKs8P5FF84+XzFu3pHN6cSG6TW7mI0U/RAzpc9w8cDh4PU7zjy7dGITuJ
	8D9Bn3K5WQjEHA1Yiy1WtaxgBXum+Fo69Ui30xiPbJNDPbPZrg2K2c6h/qsXK1jdAT2HVdqxeBF
	NokOu1oOIHJ61akqyyJwV2W/DM2sG4fGG2Xj0OGp5IR0kaeO8hZoiewPGqr3BL9edPBPnC+ePQJ
	1M2CLOjMTn05Q2/DpSBet0KuXlOUa0lEX2kqcY1aPA6IJbQw4PKI7PKLYfHhWgKp7PSi329y/Ma
	NfsmcreTh3krT2rOc/VJLwz7tDjsVKnbmClQydSeFFFuGXVeqa4zvaUy+kXbMQM/n3YLrVnT7Cy
	QwupuFHPeFxWcabsd7j9v5f6IC2K/VCILCBVw=
X-Received: by 2002:a05:620a:4014:b0:8c7:1181:779f with SMTP id af79cd13be357-8cd63505988mr773193085a.35.1772815660658;
        Fri, 06 Mar 2026 08:47:40 -0800 (PST)
X-Received: by 2002:a05:620a:4014:b0:8c7:1181:779f with SMTP id af79cd13be357-8cd63505988mr773189285a.35.1772815660151;
        Fri, 06 Mar 2026 08:47:40 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a13eaebd0asm213804e87.51.2026.03.06.08.47.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Mar 2026 08:47:39 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 06 Mar 2026 18:47:22 +0200
Subject: [PATCH 16/24] drm/msm/mdss: adapt for UBWC 3.1 support
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260306-ubwc-rework-v1-16-9cfdff12f2bb@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=949;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=vwRo08OJVutBorS+YUDrF98Dwqb7dE59/dcjOq0vApo=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpqwUPwUEnRX71NuA9Gi5WebRwDt6TiTaRrUNAv
 nUWm6hl8LmJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaasFDwAKCRCLPIo+Aiko
 1bStB/9BcXAxIUP2RtzC7dV//W9EtFmgN7NbJA5eNFvekMnqAPi6UQnD4/9sXCZrEq9f2vgbELS
 3fxYn5T9j/rTXhtfElX4KaIkOioOpy0IUwGHDgUOraMjrQUOOiyEW447wUgkdnI5y6jY+pc4WlP
 EHUbIIcHHtDTKStyGC+dGOam5DV8tU6iSS6AYtRVSsqAzry5xtrjAZUJMz+jpHeuJSRh8VUvE5S
 hapj1m0OL/RUg96fiRTvhrTcCiOB3LWWK7JQv4DstQw63Q4tbTGpEA59/x7Z029T/tBwObOIs83
 VojDx08SvHL8z82LStmPD6OjDDMCdmCO3W03OE4JUgEJvJSp
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: -PY6RIewnJp8TAEXf8J8UmnLX6KHdhwa
X-Proofpoint-ORIG-GUID: -PY6RIewnJp8TAEXf8J8UmnLX6KHdhwa
X-Authority-Analysis: v=2.4 cv=G4wR0tk5 c=1 sm=1 tr=0 ts=69ab052d cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=ou6ODICaiX18ouMgCewA:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA2MDE1OSBTYWx0ZWRfXya+hQQDRkIoR
 Uf4bji1z7uHIarTl+lBjHUpac7enyhsRVL8KaDa76rksNxNSMg24OBQGsxlhY9vyoX+HT8wKQSe
 7C7rj7aCJ/Eb+UPtSu/42zaJzIBoK0SCiPibRFudM2xsKpKuEY7l66tMF6x39J3XoWawd1DFgpJ
 P29vO18j7bq5jTrArq+G6OXEp9RwdBLj9Ca3kqPPciU1vZkAEku3AmiRJhSK9ze1kMjZj5rEDCW
 RVuW3GV+tNllqfp1RZuF8JjS/FJZPOBgVEbgN9ASB2mjhmD0zgy6Cc4a6lNKF8rA3z1NxRosmBL
 YMBxP2UYb2I6GPDQlm3qPEwrM6rgqM7vHfYiZ4I2TZLSytuFwabkoDr176anWjN0a7os9WDLLQ4
 sJiZf/XF5d4/rpRDm8+KzoG70jAgsdDFNwNVF88qLD0UJtCdTmNZTD1CUp3zujY8+1ZBbz6vM9b
 k18BG5IbhB/uy0SOX+g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-06_05,2026-03-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 phishscore=0 bulkscore=0 impostorscore=0
 adultscore=0 malwarescore=0 lowpriorityscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603060159
X-Rspamd-Queue-Id: 40F09225815
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-95892-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-0.928];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

Extend the driver to handle UBWC 3.1 (in the same way as we handle UBWC
3.0).

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/msm_mdss.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/msm_mdss.c b/drivers/gpu/drm/msm/msm_mdss.c
index 2c2cfefe9b9a..a63a3545929d 100644
--- a/drivers/gpu/drm/msm/msm_mdss.c
+++ b/drivers/gpu/drm/msm/msm_mdss.c
@@ -190,7 +190,8 @@ static void msm_mdss_setup_ubwc_v5(struct msm_mdss *msm_mdss)
 	if (qcom_ubwc_macrotile_mode(data))
 		value |= MDSS_UBWC_STATIC_MACROTILE_MODE;
 
-	if (data->ubwc_enc_version == UBWC_3_0)
+	if (data->ubwc_enc_version == UBWC_3_0 ||
+	    data->ubwc_enc_version == UBWC_3_1)
 		value |= MDSS_UBWC_STATIC_UBWC_AMSBC;
 
 	value |= MDSS_UBWC_STATIC_UBWC_MIN_ACC_LEN(qcom_ubwc_min_acc_length_64b(data));

-- 
2.47.3


