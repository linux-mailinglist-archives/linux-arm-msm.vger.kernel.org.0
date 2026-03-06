Return-Path: <linux-arm-msm+bounces-95877-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YALkGCkFq2nDZQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-95877-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 06 Mar 2026 17:47:37 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 043702255CC
	for <lists+linux-arm-msm@lfdr.de>; Fri, 06 Mar 2026 17:47:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C63EE3015479
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Mar 2026 16:47:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AE97D3B4EA4;
	Fri,  6 Mar 2026 16:47:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JpWZnSd3";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="P5VpHqRy"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40AAB37268E
	for <linux-arm-msm@vger.kernel.org>; Fri,  6 Mar 2026 16:47:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772815643; cv=none; b=Yd8a1xif6VLUGLK28UpSkfOrXcmXuGhtHUeGHrrhOtZBztnmI1gLwo1RmMjnOTiFsmc5O7Fte3tKJocXwW8na+mDiKvzfe+MbbgpmC6mf8L/pVF6iXYN6pLXPPWQk5jc4O0oHyejbP7y/RfVxCYcX5UHImnwKMqzTZQIfYFrRrQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772815643; c=relaxed/simple;
	bh=X/lCVaBuy9kW6TT9FJf3ZpTkOHqx73+qmE28wl58iAU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Co8nMJEkEZ6AM90tXFs+Fd7n7SDOGLVGR2zMVazHHi9ds28xjbpu8a0IrbS4jYYUQ5eriUk53fT7RVAaJWFuG0EZWjh1vZM8TexjR/hbDF04XsUuc1FhZzs7XX9OJ3YUEp+8qIeXMuhk0ogXsWiDQS66oV2fD4MRbhWX/tkGMjA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JpWZnSd3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=P5VpHqRy; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 626FqwUU549921
	for <linux-arm-msm@vger.kernel.org>; Fri, 6 Mar 2026 16:47:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	z5a8jUnPxApIBxmt4U76dukkSArjMceSh/RhKIkdDCA=; b=JpWZnSd3+YfVTzrr
	fMvF5DKn17hwQVZCKb2tu7QIUUkZf41RWGJwyQE29rAWR6Gbwtz1CyKXXWcQGHtr
	SAjh+g5wOM4YVRTDvOPNoczTquipJYBJT8GoRUi145uAtpB7LCZYFLng7e4UbA4o
	WRqYpb9OfgRsmqEB5qR1UhsptVGveXvqa4pvUBxF/C2h2PH+ZOFCYn4kd5U1HHCZ
	CLe3OXCt8uksu95qvNx8u7CTtu8KhQfSr0nwE+gVsHvXIWjgX8skFIZsuAtBmrS5
	+Wcsm3uNB0jcxZguMXyIXDpc9EdPBtqUsFsI2HKvwjRDX6aNrM+1gDa7f9tR9Qj0
	HD/bWA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cqruka663-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 06 Mar 2026 16:47:16 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8ca3ef536ddso2476014485a.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 06 Mar 2026 08:47:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772815636; x=1773420436; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=z5a8jUnPxApIBxmt4U76dukkSArjMceSh/RhKIkdDCA=;
        b=P5VpHqRylfNrzYO4F1sIzXf7wge7T+VHYYMzPpw2iRiwUrH9jxL1Si4OCG8oiwdMxf
         oFxPOg/EDluCzESW5M9divWqhxnAn5Uu1kwBD76bCFFd48sadWVHedJr8X9Ddhx3OiY+
         JSQIEq8BctNsx1a6e47blNJd7GPYlJ7FQxrp9LUYcduOVe8+wXgiiRVng0mwFdjfGce5
         ET2uOzLp+FhyAAxXCKdc8xnA/xzqcqnrZJHY0Q//cdQ+qDtsoFbNL1alZOWYwtiyfWDK
         ldHvfYTgsqTrF888jHqLpxUNKDtnoKOP1zYi44FF4n9gEM0I23ijZfRwgUTvGIWzrC4+
         1Ugw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772815636; x=1773420436;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=z5a8jUnPxApIBxmt4U76dukkSArjMceSh/RhKIkdDCA=;
        b=RB5L/3VO9nJSkIUdZibiNy9MYFzTpcjt94nlcJOUs4hGFR6fY/t+5myHSByu6HDXDR
         7HYUKrwftaAqJr0k2Y9U57kC0Ip30hVLXyJjdvaLKcg3DTu0VkWSCJyQLSLkfhF/AzO8
         d8GfpcBHYQOeTqWNYt0NrkRvKFSyoxzBapEKYIWE+o/4/uwGwr+Tus3/LG3sMMouKwPN
         IxlupTvHXUOyyK+yT95osBVlLfv0CGA+bv7wHtiiSm9RoThDjgXaCeILxd+93Js+PAW6
         fdHpI0V6bbePBZliT0nv193nL1sOMMrNCp0S4DAqkTyKrAxATWSNZ9o/qpGnIpczD7AR
         kUuA==
X-Gm-Message-State: AOJu0Yzf6tGgXELBhth+iWPWZRNZiI6pbQwp6TXfSigvXjZ3j0tsgzxE
	P1Eagx9a9omj9/csF3LFkkR3P3SAH7emRC9/7j9ttjnt7YzOi/UZhzXzOEfB9fMX8gYDyUfqYiK
	UdN4/+aO/jjAfHwEComxsPpX6PFXtM0kJPxZk0Wm1Dyayfu79+vHVhiQb7l9zArFTNMB2
X-Gm-Gg: ATEYQzxvWg2edmwFYUtXlL43B3BcGhseUUs1/m27XV+LI6hLzvEFpH3qxtEdQShTBB6
	jhJqS1O1riuHOEhSqNqLmrP7enSJrvjv/dOuarToXlYKdTJpa7YHxg7NgoFAVxS0whwIcE8OqRZ
	bNdx61wOK0QpZOiKonyuj49AMMVqmc6tQFSD6BXFBb48IFlETQnmO1+ji0UBu9iSmdLga7++nHE
	77h3+apIJ2wYunR2Qy6RhnWRxQPH8RobR++xzPUGLZKV8RZzNsZ4+/MM3PKzb8icH1Ox1VVsvZc
	VD2hKp5+GGHO7uqJg8UVwFdfcfK9cxZF6lBLwEzYuaj+GuSV/WilYMCXcSHjkd1rf3QIIkJRa/b
	teDunBRNxnY/wwexujltsoDN5QAq9kiqWDoE4H2/TqloUZaii11kQn8hGgHza/WxPooznBQECmN
	AmB9zQJO1OlnfTG0ihouFH7klA/pTGekaan10=
X-Received: by 2002:a05:620a:472a:b0:8c7:1106:1a44 with SMTP id af79cd13be357-8cd6d4b5daamr342002385a.79.1772815636121;
        Fri, 06 Mar 2026 08:47:16 -0800 (PST)
X-Received: by 2002:a05:620a:472a:b0:8c7:1106:1a44 with SMTP id af79cd13be357-8cd6d4b5daamr341998485a.79.1772815635488;
        Fri, 06 Mar 2026 08:47:15 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a13eaebd0asm213804e87.51.2026.03.06.08.47.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Mar 2026 08:47:14 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 06 Mar 2026 18:47:07 +0200
Subject: [PATCH 01/24] drm/msm/mdss: correct UBWC programming sequences
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260306-ubwc-rework-v1-1-9cfdff12f2bb@oss.qualcomm.com>
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
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=6916;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=X/lCVaBuy9kW6TT9FJf3ZpTkOHqx73+qmE28wl58iAU=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpqwUMJ6tLpaGWdZ4kB2K8/RV8sUbpJpzmtOl0o
 +rInaDMbpyJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaasFDAAKCRCLPIo+Aiko
 1cASB/9ZMzti9r6MplOpgi9r9VXlfLsjT0Y5z1+SJf+yK+YN47mzAP1vvpcGwqKESKujP0iQYMA
 B+N2m5uZ432UB//bQ0+TGt20hw9faBKGTsE1mqUSHH06YO2ecJu2/C393xqqS18ehaCUnRI90Av
 +tGVRSjzK6bqAvh0hq52de1oAyfumt8q0Ifo86mWRi3rs9nEGzdhOoLL4AAGvsG2ENjBEvhSlwE
 AGuI9qc3c+ydzsxCe7RH7vW6i9CrNclDTyyb+C8ag0ekDBjnBnV9xgTrReK1cE3q16qvPrtvEaH
 +wfffgvquM7cnn7TVOWWRIwMKlB9jOI7i3xniAjQSckrJ9Kp
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA2MDE1OSBTYWx0ZWRfXy5FcNrGCws5D
 bqHavS9lNtRZOeFAMvrAodjmnswJD2TmHVcRwmB78vN6nTP+w33+PyBI4WGfCi2jnmFILHdhtLu
 sBz4S4MyTMXj0bqlWIEEjzkwV93BWzlRH2+qBYcdWy++t8BMsE75HIEy8X8J+PGyThhsEk7kkBW
 Z9Fa2hOHzFTPFcu2Hhf7AlOMBcKVhSPc1v+CTnFRLSWUUgM6UTpcQdWHSbZimB/KC5zJquK96ER
 z2qSUBzUCcKbeY76IKrbT2A1NmC5ZEALT6N31t6oFJl0Oi7vCVrXygIpRT3PvcQg861L4teHiL7
 jgA4QO5B9pAXinFV8LYjVl61K2+8TMPaMVMhH2A2OS6JMHyRqTFMivqm/QJoJTWIAtEUnywO070
 7GftFvGM6IbNNfuS8bnlLp7ueK3NdQBIVgYBN8QxvqkB2nZzCFtrT3eF1evPy9joSudiogej3Eo
 4M5K1ZV5UbJ1g/mv1zA==
X-Proofpoint-ORIG-GUID: ZjFmG0S1Qns6k3Xk-EeoqpXwFv29Zt9c
X-Authority-Analysis: v=2.4 cv=DvZbOW/+ c=1 sm=1 tr=0 ts=69ab0514 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=hQCg4X1xv2bm5S_WMKMA:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: ZjFmG0S1Qns6k3Xk-EeoqpXwFv29Zt9c
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-06_05,2026-03-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 malwarescore=0 bulkscore=0 adultscore=0
 suspectscore=0 clxscore=1015 phishscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603060159
X-Rspamd-Queue-Id: 043702255CC
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-95877-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-0.932];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

The UBWC registers in the MDSS region are not dependent on the UBWC
version (it is an invalid assumption we inherited from the vendor SDE
driver). Instead they are dependent only on the MDSS core revision.

Rework UBWC programming to follow MDSS revision and to use required (aka
encoder) UBWC version instead of the ubwc_dec_version.

Fixes: d68db6069a8e ("drm/msm/mdss: convert UBWC setup to use match data")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/msm_mdss.c | 120 ++++++++++++++++-------------------------
 1 file changed, 45 insertions(+), 75 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_mdss.c b/drivers/gpu/drm/msm/msm_mdss.c
index 9047e8d9ee89..9f81f43283b9 100644
--- a/drivers/gpu/drm/msm/msm_mdss.c
+++ b/drivers/gpu/drm/msm/msm_mdss.c
@@ -166,27 +166,27 @@ static int _msm_mdss_irq_domain_add(struct msm_mdss *msm_mdss)
 	return 0;
 }
 
-static void msm_mdss_setup_ubwc_dec_20(struct msm_mdss *msm_mdss)
+static void msm_mdss_setup_ubwc_v4(struct msm_mdss *msm_mdss)
 {
 	const struct qcom_ubwc_cfg_data *data = msm_mdss->mdss_data;
-	u32 value = MDSS_UBWC_STATIC_UBWC_SWIZZLE(data->ubwc_swizzle) |
+	u32 value = MDSS_UBWC_STATIC_UBWC_SWIZZLE(data->ubwc_swizzle & 0x1) |
 		    MDSS_UBWC_STATIC_HIGHEST_BANK_BIT(data->highest_bank_bit - 13);
 
-	if (data->ubwc_bank_spread)
-		value |= MDSS_UBWC_STATIC_UBWC_BANK_SPREAD;
-
 	if (data->ubwc_enc_version == UBWC_1_0)
 		value |= MDSS_UBWC_STATIC_UBWC_MIN_ACC_LEN(1);
 
 	writel_relaxed(value, msm_mdss->mmio + REG_MDSS_UBWC_STATIC);
 }
 
-static void msm_mdss_setup_ubwc_dec_30(struct msm_mdss *msm_mdss)
+static void msm_mdss_setup_ubwc_v5(struct msm_mdss *msm_mdss)
 {
 	const struct qcom_ubwc_cfg_data *data = msm_mdss->mdss_data;
-	u32 value = MDSS_UBWC_STATIC_UBWC_SWIZZLE(data->ubwc_swizzle & 0x1) |
+	u32 value = MDSS_UBWC_STATIC_UBWC_SWIZZLE(data->ubwc_swizzle) |
 		    MDSS_UBWC_STATIC_HIGHEST_BANK_BIT(data->highest_bank_bit - 13);
 
+	if (data->ubwc_bank_spread)
+		value |= MDSS_UBWC_STATIC_UBWC_BANK_SPREAD;
+
 	if (data->macrotile_mode)
 		value |= MDSS_UBWC_STATIC_MACROTILE_MODE;
 
@@ -199,11 +199,12 @@ static void msm_mdss_setup_ubwc_dec_30(struct msm_mdss *msm_mdss)
 	writel_relaxed(value, msm_mdss->mmio + REG_MDSS_UBWC_STATIC);
 }
 
-static void msm_mdss_setup_ubwc_dec_40(struct msm_mdss *msm_mdss)
+static void msm_mdss_setup_ubwc_v6(struct msm_mdss *msm_mdss)
 {
 	const struct qcom_ubwc_cfg_data *data = msm_mdss->mdss_data;
 	u32 value = MDSS_UBWC_STATIC_UBWC_SWIZZLE(data->ubwc_swizzle) |
 		    MDSS_UBWC_STATIC_HIGHEST_BANK_BIT(data->highest_bank_bit - 13);
+	u32 ver, prediction_mode;
 
 	if (data->ubwc_bank_spread)
 		value |= MDSS_UBWC_STATIC_UBWC_BANK_SPREAD;
@@ -211,45 +212,42 @@ static void msm_mdss_setup_ubwc_dec_40(struct msm_mdss *msm_mdss)
 	if (data->macrotile_mode)
 		value |= MDSS_UBWC_STATIC_MACROTILE_MODE;
 
-	writel_relaxed(value, msm_mdss->mmio + REG_MDSS_UBWC_STATIC);
-
-	if (data->ubwc_enc_version == UBWC_3_0) {
-		writel_relaxed(1, msm_mdss->mmio + REG_MDSS_UBWC_CTRL_2);
-		writel_relaxed(0, msm_mdss->mmio + REG_MDSS_UBWC_PREDICTION_MODE);
-	} else {
-		if (data->ubwc_dec_version == UBWC_4_3)
-			writel_relaxed(3, msm_mdss->mmio + REG_MDSS_UBWC_CTRL_2);
-		else
-			writel_relaxed(2, msm_mdss->mmio + REG_MDSS_UBWC_CTRL_2);
-		writel_relaxed(1, msm_mdss->mmio + REG_MDSS_UBWC_PREDICTION_MODE);
-	}
-}
-
-static void msm_mdss_setup_ubwc_dec_50(struct msm_mdss *msm_mdss)
-{
-	const struct qcom_ubwc_cfg_data *data = msm_mdss->mdss_data;
-	u32 value = MDSS_UBWC_STATIC_UBWC_SWIZZLE(data->ubwc_swizzle) |
-		    MDSS_UBWC_STATIC_HIGHEST_BANK_BIT(data->highest_bank_bit - 13);
-
-	if (data->ubwc_bank_spread)
-		value |= MDSS_UBWC_STATIC_UBWC_BANK_SPREAD;
-
-	if (data->macrotile_mode)
-		value |= MDSS_UBWC_STATIC_MACROTILE_MODE;
+	if (data->ubwc_enc_version == UBWC_1_0)
+		value |= MDSS_UBWC_STATIC_UBWC_MIN_ACC_LEN(1);
 
 	writel_relaxed(value, msm_mdss->mmio + REG_MDSS_UBWC_STATIC);
 
-	if (data->ubwc_dec_version == UBWC_6_0)
-		writel_relaxed(5, msm_mdss->mmio + REG_MDSS_UBWC_CTRL_2);
+	if (data->ubwc_enc_version < UBWC_4_0)
+		prediction_mode = 0;
 	else
-		writel_relaxed(4, msm_mdss->mmio + REG_MDSS_UBWC_CTRL_2);
-
-	writel_relaxed(1, msm_mdss->mmio + REG_MDSS_UBWC_PREDICTION_MODE);
+		prediction_mode = 1;
+
+	if (data->ubwc_enc_version >= UBWC_6_0)
+		ver = 5;
+	else if (data->ubwc_enc_version >= UBWC_5_0)
+		ver = 4;
+	else if (data->ubwc_enc_version >= UBWC_4_3)
+		ver = 3;
+	else if (data->ubwc_enc_version >= UBWC_4_0)
+		ver = 2;
+	else if (data->ubwc_enc_version >= UBWC_3_0)
+		ver = 1;
+	else /* UBWC 1.0 and 2.0 */
+		ver = 0;
+
+	writel_relaxed(ver, msm_mdss->mmio + REG_MDSS_UBWC_CTRL_2);
+	writel_relaxed(prediction_mode, msm_mdss->mmio + REG_MDSS_UBWC_PREDICTION_MODE);
 }
 
+#define MDSS_HW_VER(major, minor, step)	\
+	((((major) & 0xf) << 28) |	\
+	 (((minor) & 0xfff) << 16) |	\
+	 ((step) & 0xffff))
+
 static int msm_mdss_enable(struct msm_mdss *msm_mdss)
 {
 	int ret, i;
+	u32 hw_rev;
 
 	/*
 	 * Several components have AXI clocks that can only be turned on if
@@ -275,43 +273,15 @@ static int msm_mdss_enable(struct msm_mdss *msm_mdss)
 	if (msm_mdss->is_mdp5 || !msm_mdss->mdss_data)
 		return 0;
 
-	/*
-	 * ubwc config is part of the "mdss" region which is not accessible
-	 * from the rest of the driver. hardcode known configurations here
-	 *
-	 * Decoder version can be read from the UBWC_DEC_HW_VERSION reg,
-	 * UBWC_n and the rest of params comes from hw data.
-	 */
-	switch (msm_mdss->mdss_data->ubwc_dec_version) {
-	case 0: /* no UBWC */
-	case UBWC_1_0:
-		/* do nothing */
-		break;
-	case UBWC_2_0:
-		msm_mdss_setup_ubwc_dec_20(msm_mdss);
-		break;
-	case UBWC_3_0:
-		msm_mdss_setup_ubwc_dec_30(msm_mdss);
-		break;
-	case UBWC_4_0:
-	case UBWC_4_3:
-		msm_mdss_setup_ubwc_dec_40(msm_mdss);
-		break;
-	case UBWC_5_0:
-		msm_mdss_setup_ubwc_dec_50(msm_mdss);
-		break;
-	case UBWC_6_0:
-		msm_mdss_setup_ubwc_dec_50(msm_mdss);
-		break;
-	default:
-		dev_err(msm_mdss->dev, "Unsupported UBWC decoder version %x\n",
-			msm_mdss->mdss_data->ubwc_dec_version);
-		dev_err(msm_mdss->dev, "HW_REV: 0x%x\n",
-			readl_relaxed(msm_mdss->mmio + REG_MDSS_HW_VERSION));
-		dev_err(msm_mdss->dev, "UBWC_DEC_HW_VERSION: 0x%x\n",
-			readl_relaxed(msm_mdss->mmio + REG_MDSS_UBWC_DEC_HW_VERSION));
-		break;
-	}
+	hw_rev = readl_relaxed(msm_mdss->mmio + REG_MDSS_HW_VERSION);
+
+	if (hw_rev >= MDSS_HW_VER(6, 0, 0))
+		msm_mdss_setup_ubwc_v6(msm_mdss);
+	else if (hw_rev >= MDSS_HW_VER(5, 0, 0))
+		msm_mdss_setup_ubwc_v5(msm_mdss);
+	else if (hw_rev >= MDSS_HW_VER(4, 0, 0))
+		msm_mdss_setup_ubwc_v4(msm_mdss);
+	/* else UBWC 1.0 or none, no params to program */
 
 	return ret;
 }

-- 
2.47.3


