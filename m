Return-Path: <linux-arm-msm+bounces-106381-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UO0gOKSQ/Gn3RQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106381-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 07 May 2026 15:16:20 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AB2B4E911C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 07 May 2026 15:16:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C529D30E784C
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 May 2026 13:06:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E4B5A423A8A;
	Thu,  7 May 2026 13:04:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QIJsswsB";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bqeGiPAX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 187593FBED0
	for <linux-arm-msm@vger.kernel.org>; Thu,  7 May 2026 13:04:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778159066; cv=none; b=YyG7AQX5y4idZbvhhisQo5SH3lqF0xl8ZM+ip8FWbY3aoqx25OFCpreBH+RgCDkNQW4CQXYT/ZMYPH4qJU5ZnAqyKm4e2d5tRMXY10m6CMA9UxG+5E1JWGzqAnW1dlJ/H000pFhHlTzq6QFJomr7hIvpWSlzMbLY8rxg9+e44yk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778159066; c=relaxed/simple;
	bh=TQBWqrbntLsRW914iL/lLCPXeMzB5PW4D9i0dro5eT8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=a98RVAFzTrw9EGnQK686d/HMDO6KKdJW9QjLwh1c++BsMIFzBjWYVmrW460Nn0hKi3IVLXgX7O96ATXtoIPaQVvpNbUCFeAfHRnsYZJCM0Zwx6SwkS/BmKH22bqrYhCtVlnVbKznU5ZfQvbFqTKwIeL+KgaQW69rUdCqB8vvu8Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QIJsswsB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bqeGiPAX; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 647A6XLj151066
	for <linux-arm-msm@vger.kernel.org>; Thu, 7 May 2026 13:04:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UU2YSeVXfhEBEmAAjyzhaY7cQ/RaczZjSEOGJBsk4fE=; b=QIJsswsBaV3cBfW/
	wFS1zBHwJEBVpTasN9vDxtqYb6Fz8RjpRCvUY45wJ/Nsossf8KytS5GBbvxegyx/
	5fMtsliXxtosSV/v+OE+mToh7uyEW1WaXo6IYyE1/l6bi2+s+KLWabor7eiQ7JSM
	oE37hHejYb54RDBBjgof2XHmAtAAnLZqMBG6+6dC3vQGJ674vUxfU2Le00UaZ3Q8
	WJtPVKjfl/o3VnN1gfjn3NO4jaY2OxtCsZ2+1+mJoosnRiP2XpO4KErm7lAzcEVq
	AzXpszgyj2RNaYqcQLiBXUQVC+FRaXcTsXwWO0+PDLW3vulHnhrTccGMKy2v23E9
	GNh1/Q==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e0kctsw35-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 07 May 2026 13:04:23 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2b79f4b35b7so8686185ad.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 07 May 2026 06:04:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778159063; x=1778763863; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UU2YSeVXfhEBEmAAjyzhaY7cQ/RaczZjSEOGJBsk4fE=;
        b=bqeGiPAX/spADEvHR7WSyP0KleTPBn0zrd0GD1bOutUaVVuQOMnqVTTkQvAQwPPTNc
         W18xKNZAqI3VzEYgN9lm9kCoWf0naj/AV214UOFxpZIFvdGg79/m2oNqYu5kdGXuA+eS
         6BR5GAziRV/Z+Ef4cArrPDEx0lSSbg24Y2SBlieym5SdWJmhexHsuOVeDkNVSdi7CzMC
         6z3qK1n4jx7sI2stk77jt2QDThdvJ9XGkBHfQULnKTRQOtUSj7Al/UhPbgtu/rg0GpAq
         RlX+oQo7QAwGc9PVoXs+3eOkZWKBLP+kEGe14OyUGdRauVEXQBsEmPkEQv1J//Z1BDLZ
         BEZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778159063; x=1778763863;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=UU2YSeVXfhEBEmAAjyzhaY7cQ/RaczZjSEOGJBsk4fE=;
        b=h1wyHJevozyVFJpsrzGT3YybcdxTYoTTpeO1eIrCVyKQhpk/FGKAhPgNjHN3lDXM3y
         WocOOH1mYaby9uGBAvMiGa059XaMzv6gAEFQolKjQiLk3B/pDr1oKMGDmsaGUZa/fj6a
         oktMecVSryCmAp33yaQgO1MFlxDhBUqYn8l3lkquEZ9xQLuC8H6SYCXnyfjQiO8+uL+z
         tUJBQ43OJnEAF8ZvX8GslV2munkO6a2z0GQwpNLPMP7FlG6qrLPdbNVHkZj38BSFjyYh
         yqcW+yNxrIpDujrhKq3PYO0zWdcMRKcZtummcyJTFLUx/uf3/9ecyqcZUY1+RXaXsMgA
         u2fg==
X-Gm-Message-State: AOJu0YzNoyWupZMCslkfFvCGXab6q4lbAtQuom2m3IJobDCwOHiokI5o
	20mmbEHY/na0R11ZZ/pviClAXePK2sHnAZg8E8SggakAUvHYGJdu5LhmnFNbLXmqvLVptkW/Pao
	iBw4I1AYHkYvtyBV4GTskGzu5YdPOF0ZuPfhRhfNgmEFI+zaSoYVqSV7xoziNQVSQOwzO
X-Gm-Gg: AeBDieupDTdYAbXpYN91MBoNnbScmhX4a706FONWqdhRRXMOQlEDGjwVqyfGAhldugt
	KIvyawuLnwZYr9Oaj1W8i97OW2Em5MP5/7xnhF5DiDbwCFDRcAiAxBnzJkwj9iGDoJHbF84X5xP
	EmbEI8wq2kWbmZEzE+V5YlrysYY2gpr6nj9zmXqkL9g5WnaYcusNQ9R8oz+kyXbmFxdfSeZROUg
	lVfP2+FFcdB3rVjo9WbXZrebxluTFUc8Iu9YdBl37ON+E5FmHnIhNZ9lewBWYfZSElY0iXv81Gf
	5YrcHleWrYEqhTpHHPmDRGK+cQn5fBAYZ0Y7RUvlnWRF2Owb5+HL0NaDsgwTP/HdksT+H2hXJnQ
	FjZ8Qd4rT0JISr4OX9ovIwBtsweZkWzgmRBmJU9hL57HWO8PQJgWNJrYRgTQ2DOq7AO8uCQlK+v
	Nx+UaF8RlFWNIPbnYEs+oxa7Dr2bsKdURiUV6Bewv3n9fjEg==
X-Received: by 2002:a17:903:28c6:b0:2b9:4eaa:7153 with SMTP id d9443c01a7336-2ba79c0b87cmr53539735ad.19.1778159062645;
        Thu, 07 May 2026 06:04:22 -0700 (PDT)
X-Received: by 2002:a17:903:28c6:b0:2b9:4eaa:7153 with SMTP id d9443c01a7336-2ba79c0b87cmr53539355ad.19.1778159062100;
        Thu, 07 May 2026 06:04:22 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a85c230c68sm5595959e87.19.2026.05.07.06.04.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 May 2026 06:04:19 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 07 May 2026 16:03:22 +0300
Subject: [PATCH v4 26/29] soc: qcom: ubwc: drop macrotile_mode from the
 database
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260507-ubwc-rework-v4-26-c19593d20c1d@oss.qualcomm.com>
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
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=5443;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=TQBWqrbntLsRW914iL/lLCPXeMzB5PW4D9i0dro5eT8=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBp/I2IKQUemAYDaPbwp1eqn8buNyK99WTaDiAH8
 4q0ilCMSAmJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCafyNiAAKCRCLPIo+Aiko
 1V3+B/40zgyEk7XYIfbq4254GX5YzwNV1vsUQnEbtkeRa/pkexia3wvROYWvcD6/jRxgec5nEGD
 yfwjI5gl//YTheq6oIpzNVT/2JXzb61Lsh6/whA1jBMMLLTHCcfQBz37iMcfCI8sn9DtBYMfXGe
 Omej7tZdlj/AsrJQfE0HrD69xAUH5KK6yVlfBlzqcBG7wUv47amF+M9Pn9xLtPndCwc3ys9TsKe
 LWMJTGnMjK6Q6RGZkTbMv06ZUGs1chhTGwFdcIU+NUSA3w69/8F3JW6cTP2qsrFpiAHfsTtbwjl
 Yj80EPQ8yf6h5QO7NWffBuOm5iVw9icYtnniujQWAoYcYEEx
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=XsPK/1F9 c=1 sm=1 tr=0 ts=69fc8dd7 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=lOjMx_-Oxa8n0LcNG1gA:9 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-GUID: rFr6Htl85j85qG1bHu3Mjww8iuDKe0od
X-Proofpoint-ORIG-GUID: rFr6Htl85j85qG1bHu3Mjww8iuDKe0od
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA3MDEzMCBTYWx0ZWRfX/sQYiuKHoLR/
 mAT1p1Iu9EqeYszBgbsfXVtB8DjXkMzDumRkn6T5RwMLTfm5OV45hNyrGMEe9ai/hAZAtf1TJFD
 oQ1mhVR+ii3v2XnCSFYZbqiNL01GBRiMBUmIsg8EVq32u9OEl97BgEn+a1dkVZSNKbTpI6xZyEU
 8XqHWLtVXHfcoc6WD0TJTR8CmxtiDiirjr4rncEJaXUP060bLA+ta9GqDx91GNip1O+QzEudofb
 z3EsSGMJT93AtKdE30x3E9pdMpeEUCBL3SKELCzNNv+IjnmS5mvfKYFsSXgDGZbexjSlVE9aB8k
 ixfgy7wEIIYf05PelCD5r6lV7V/P0sOuA9jr4uOM58shTbWWuNqqn6q9YgHRZbtXcGYmi+thpg7
 6KFK2SHz4WBOkXUn7THX++FHMx/tpEHUH0QnkyEz4nYWdZ0s6A8jAftiFbOY4oskcbxP25xTzKm
 SmGKL9mq/zjoUOVhNGw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-07_01,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 adultscore=0 suspectscore=0 phishscore=0
 priorityscore=1501 malwarescore=0 bulkscore=0 spamscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605070130
X-Rspamd-Queue-Id: 3AB2B4E911C
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-106381-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

All the users have been migrated to using qcom_ubwc_macrotile_mode()
instead of reading the raw value from the config structure. Drop the
field from struct qcom_ubwc_cfg_data and replace it with the calculated
value. Split single UBWC_3_0 into UBWC_3_0 (no macrotile mode) and
UBWC_3_1 (with macrotile mode).

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/soc/qcom/ubwc_config.c | 16 ++--------------
 include/linux/soc/qcom/ubwc.h  | 18 ++++++++----------
 2 files changed, 10 insertions(+), 24 deletions(-)

diff --git a/drivers/soc/qcom/ubwc_config.c b/drivers/soc/qcom/ubwc_config.c
index 35cde4e9a238..b880f77f448c 100644
--- a/drivers/soc/qcom/ubwc_config.c
+++ b/drivers/soc/qcom/ubwc_config.c
@@ -22,7 +22,6 @@ static const struct qcom_ubwc_cfg_data eliza_data = {
 			UBWC_SWIZZLE_ENABLE_LVL3,
 	/* TODO: highest_bank_bit = 14 for LP_DDR4 */
 	.highest_bank_bit = 15,
-	.macrotile_mode = true,
 };
 
 static const struct qcom_ubwc_cfg_data kaanapali_data = {
@@ -30,7 +29,6 @@ static const struct qcom_ubwc_cfg_data kaanapali_data = {
 	.ubwc_swizzle = UBWC_SWIZZLE_ENABLE_LVL2 |
 			UBWC_SWIZZLE_ENABLE_LVL3,
 	.highest_bank_bit = 16,
-	.macrotile_mode = true,
 };
 
 static const struct qcom_ubwc_cfg_data msm8937_data = {
@@ -58,15 +56,13 @@ static const struct qcom_ubwc_cfg_data sa8775p_data = {
 	.ubwc_enc_version = UBWC_4_0,
 	.ubwc_swizzle = UBWC_SWIZZLE_ENABLE_LVL3,
 	.highest_bank_bit = 13,
-	.macrotile_mode = true,
 };
 
 static const struct qcom_ubwc_cfg_data sar2130p_data = {
-	.ubwc_enc_version = UBWC_3_0, /* 4.0.2 in hw */
+	.ubwc_enc_version = UBWC_3_1,
 	.ubwc_swizzle = UBWC_SWIZZLE_ENABLE_LVL2 |
 			UBWC_SWIZZLE_ENABLE_LVL3,
 	.highest_bank_bit = 13,
-	.macrotile_mode = true,
 };
 
 static const struct qcom_ubwc_cfg_data sc7180_data = {
@@ -77,11 +73,10 @@ static const struct qcom_ubwc_cfg_data sc7180_data = {
 };
 
 static const struct qcom_ubwc_cfg_data sc7280_data = {
-	.ubwc_enc_version = UBWC_3_0,
+	.ubwc_enc_version = UBWC_3_1,
 	.ubwc_swizzle = UBWC_SWIZZLE_ENABLE_LVL2 |
 			UBWC_SWIZZLE_ENABLE_LVL3,
 	.highest_bank_bit = 14,
-	.macrotile_mode = true,
 };
 
 static const struct qcom_ubwc_cfg_data sc8180x_data = {
@@ -89,7 +84,6 @@ static const struct qcom_ubwc_cfg_data sc8180x_data = {
 	.ubwc_swizzle = UBWC_SWIZZLE_ENABLE_LVL2 |
 			UBWC_SWIZZLE_ENABLE_LVL3,
 	.highest_bank_bit = 16,
-	.macrotile_mode = true,
 };
 
 static const struct qcom_ubwc_cfg_data sc8280xp_data = {
@@ -97,7 +91,6 @@ static const struct qcom_ubwc_cfg_data sc8280xp_data = {
 	.ubwc_swizzle = UBWC_SWIZZLE_ENABLE_LVL2 |
 			UBWC_SWIZZLE_ENABLE_LVL3,
 	.highest_bank_bit = 16,
-	.macrotile_mode = true,
 };
 
 static const struct qcom_ubwc_cfg_data sdm670_data = {
@@ -164,7 +157,6 @@ static const struct qcom_ubwc_cfg_data sm8250_data = {
 			UBWC_SWIZZLE_ENABLE_LVL3,
 	/* TODO: highest_bank_bit = 15 for LP_DDR4 */
 	.highest_bank_bit = 16,
-	.macrotile_mode = true,
 };
 
 static const struct qcom_ubwc_cfg_data sm8350_data = {
@@ -173,7 +165,6 @@ static const struct qcom_ubwc_cfg_data sm8350_data = {
 			UBWC_SWIZZLE_ENABLE_LVL3,
 	/* TODO: highest_bank_bit = 15 for LP_DDR4 */
 	.highest_bank_bit = 16,
-	.macrotile_mode = true,
 };
 
 static const struct qcom_ubwc_cfg_data sm8550_data = {
@@ -182,7 +173,6 @@ static const struct qcom_ubwc_cfg_data sm8550_data = {
 			UBWC_SWIZZLE_ENABLE_LVL3,
 	/* TODO: highest_bank_bit = 15 for LP_DDR4 */
 	.highest_bank_bit = 16,
-	.macrotile_mode = true,
 };
 
 static const struct qcom_ubwc_cfg_data sm8750_data = {
@@ -190,7 +180,6 @@ static const struct qcom_ubwc_cfg_data sm8750_data = {
 	.ubwc_swizzle = 6,
 	/* TODO: highest_bank_bit = 15 for LP_DDR4 */
 	.highest_bank_bit = 16,
-	.macrotile_mode = true,
 };
 
 static const struct qcom_ubwc_cfg_data glymur_data = {
@@ -198,7 +187,6 @@ static const struct qcom_ubwc_cfg_data glymur_data = {
 	.ubwc_swizzle = 0,
 	/* TODO: highest_bank_bit = 15 for LP_DDR4 */
 	.highest_bank_bit = 16,
-	.macrotile_mode = true,
 };
 
 static const struct of_device_id qcom_ubwc_configs[] __maybe_unused = {
diff --git a/include/linux/soc/qcom/ubwc.h b/include/linux/soc/qcom/ubwc.h
index 254721f5ea3c..fee778360ac2 100644
--- a/include/linux/soc/qcom/ubwc.h
+++ b/include/linux/soc/qcom/ubwc.h
@@ -33,15 +33,6 @@ struct qcom_ubwc_cfg_data {
 	 * DDR bank.  This should ideally use DRAM type detection.
 	 */
 	int highest_bank_bit;
-
-	/**
-	 * @macrotile_mode: Macrotile Mode
-	 *
-	 * Whether to use 4-channel macrotiling mode or the newer
-	 * 8-channel macrotiling mode introduced in UBWC 3.1. 0 is
-	 * 4-channel and 1 is 8-channel.
-	 */
-	bool macrotile_mode;
 };
 
 #define UBWC_1_0 0x10000000
@@ -77,9 +68,16 @@ static inline bool qcom_ubwc_min_acc_length_64b(const struct qcom_ubwc_cfg_data
 	return cfg->ubwc_enc_version == UBWC_1_0;
 }
 
+/*
+ * @qcom_ubwc_macrotile_mode: whether to use 4-channel or 8-channel macrotiling
+ *
+ * The 8-channel macrotiling mode was introduced in UBWC 3.1.
+ *
+ * Returns: false for the 4-channel and true for 8-channel.
+ */
 static inline bool qcom_ubwc_macrotile_mode(const struct qcom_ubwc_cfg_data *cfg)
 {
-	return cfg->macrotile_mode;
+	return cfg->ubwc_enc_version >= UBWC_3_1;
 }
 
 static inline bool qcom_ubwc_bank_spread(const struct qcom_ubwc_cfg_data *cfg)

-- 
2.47.3


