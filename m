Return-Path: <linux-arm-msm+bounces-108813-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EOHxJv/TDWrA3wUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108813-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2026 17:32:15 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 13806590EDB
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2026 17:32:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 3448E321D9D4
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2026 14:56:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 045B33FC5AE;
	Wed, 20 May 2026 14:52:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HzLKe+vl";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TWBks9Hf"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 482203FC5AD
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 14:52:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779288729; cv=none; b=WFqMzlpDx3S1dCxoS7mksxd/zE0GjVo+8RFizNged6PKoKvrUjq+Z93jp6ViZ13YAyPeT99dggLTnIR9XaYF0MSWrT1trvYlHM2f8Yxzpd3kHYEhaVSVrX7ATDmPG1G1qytTLA4mdogHTk1DDDHEbMlvUJUuzBOT1Exe+LNNxcQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779288729; c=relaxed/simple;
	bh=U6uzzgGbS8qZWP3kN5JzxaiSGepe+XDiW2H9yAY88hs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=K6bRuhR8xqiiblJ8nD9KQqDyKEA58/FSe1D1CXdMP8YjG/QA17AGUchiMeRdLjvsU150N12mNV2BonnoTUmVJf4+j7jWwMGNfp1z6TpkL25QSptwgzuuh/FbZs5O3lCfryNKQq+UNzs15j0YoXG1/q9KHA9/p47cpz86zKlgp5c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HzLKe+vl; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TWBks9Hf; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64KDWu0d1725320
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 14:52:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	EeHTbSP+g4o90DbKwuWwTMbeBF1qG02mPQpIYK/H3Bs=; b=HzLKe+vlJOGdZFCb
	PsUFvUy93hCDj9crUMpbjlJd5sdNZ3Pp4WboHxbc7KXc3X5F6RGLaPiTan8Aqz7F
	hEpips7DK+NAcbYZ075BXGNz5xIzH1K8/YsueZVKCf3mBw8ySqYIx/2TN+1xK+rj
	ubFX08/gdi35SZYUlykbBrk19XhijWNVqVygiEw3RN4tHsL4rY4AQfxEdSyvPOEA
	dwggpGhmqxz5yM20HLB0zsHvzF/p9WyKLsy5c5PI5+K+S4/zZPSp5IBhcm3Oscw0
	YyfI6AwlBEBAqh6yzuT9AopqGpogJZ1b3AkDjR3PaSJ/j1PA1lF9yWvxoa/r+9Rl
	VhJcqw==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e8t3qn8y8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 14:52:07 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-6332db4182dso7832462137.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 07:52:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779288727; x=1779893527; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EeHTbSP+g4o90DbKwuWwTMbeBF1qG02mPQpIYK/H3Bs=;
        b=TWBks9Hft+RT5kC3D3NZaA09NKctD5USxCJr0D/R95v4YW2rz5c7HjDbMX5AJ4vFti
         2T/X1SEIYjfiH4IeKdG8gQIgkRE7SPAQxSwcB0plS6AAv4DExDdvEmx+TK0rSFVt5NL9
         SKmb0j6oneEnzLgnP9ZKL4x2FY268Jw/3s9zDP++Q26qkwIAwO37qkTJHnl0fPboxF5A
         fXe/lB9sXTb07Rw/9Ig7fz3uHmbXXMU9pRKds/Wg0UxXxur+QspXEme0l2QXrkt1+ogS
         AAkiPjECN8F0xsHWW7f8qOHm2MC5CB8W73wSn4f983hQR3qPUBJO/+ZuVpRfE6jVklrB
         ZQ7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779288727; x=1779893527;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=EeHTbSP+g4o90DbKwuWwTMbeBF1qG02mPQpIYK/H3Bs=;
        b=QzcfVD8nlqQ6yGBwNdq5PAqs3kP5N9OXe3R/tJtUz346l+rg62IPnwdrkPrDHyesee
         vZf9/ozAyfAZ9dShhcRTzKZKJw/d9m+pcrxRu7qwu8aDiiNH/wIQ2PJ1LVC2xr4WW6UG
         CgT2qZ2cLFSyRGPR8XJVc8wz3AFIQNx7w5AmRrfZwZp/FmoGfCDrx+BMJFk/O3Q6lV3n
         KvKq4/OU1tuIYtq9s7UfdU+qGkuv6atn1YnTa7bDr0R9WuaVnUWWs4nwz//fClDPXAxX
         jU0SPyzMgw4dtRlfOjhCdGSsoAe7tmBCRkf8kGXU8ZP5ecSXOmwUIw8iORrP9wvQUi61
         F1GA==
X-Gm-Message-State: AOJu0YzjO8szlJCn/LROtgerHXvnMsodtyHOXxrIL8xV/RrEnL9u7bx6
	/i2F+4qFBb/BKuziM8NWP5eWpxAdeVZ4IGCPUALRZTB7ZPJp08WHYog6Gu+CuXxSe25SYVLyF+h
	E3GDNMadhCwSRJrs7P0a2Ln5lXLyHekXwxkQXWz7tmjw5Wl9L8uJqIS9RkQqZJGZLE7Ah
X-Gm-Gg: Acq92OFDtrO6ncMrPlLhyj1NRa3Bz47R//w4+KltZm7lJyZcaX0N7DjHvp6rz4Wi4qx
	rTTsOhFqOG0waJj8+VB/reGvh3veQhOW7vlKZRLIHIjfHeRQsBlPOSzsU7XTgYnM4L3x/DODMlw
	uQejfyUr1ogiN94uod1ONSZsf4I54LTFM5okRTC8g5zpV+f835emtC1aY40pm49N8OHXB9PAS1i
	VzS8tvfFNvyUnbl4MkM75qTSxihEwsbyUD0JXYGtgSTtsbQsFI7iLC7cPdzRLlE+9+215N6zCFe
	U8neuxnwXRAm9NknEGUp1/1vK0y4iFeWlPvRDswdrlXWhTKNOiHhtm534IkKpP0qL/OUfof4wOy
	/d5w6yM/quZDE1rU5UhoMeHcPWVFxVPa6c9biq1EKIJiTqwhxNZkmuI4/P6BGrdeGLNMRBM9gR2
	wnsTFMblXnVmEK60r3dr0zyWrxBUzCOt9dKJM=
X-Received: by 2002:a05:6102:38cd:b0:631:ff40:22b5 with SMTP id ada2fe7eead31-63a3f38e58dmr13009420137.21.1779288726518;
        Wed, 20 May 2026 07:52:06 -0700 (PDT)
X-Received: by 2002:a05:6102:38cd:b0:631:ff40:22b5 with SMTP id ada2fe7eead31-63a3f38e58dmr13009406137.21.1779288726059;
        Wed, 20 May 2026 07:52:06 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a90f10c78csm5128907e87.14.2026.05.20.07.52.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2026 07:52:05 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Wed, 20 May 2026 17:51:34 +0300
Subject: [PATCH v5 27/28] soc: qcom: ubwc: sort out the rest of the UBWC
 swizzle settings
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260520-ubwc-rework-v5-27-72f2749bc807@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4424;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=U6uzzgGbS8qZWP3kN5JzxaiSGepe+XDiW2H9yAY88hs=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqDcpqm9uACE6Obeqjp7N+IiijUm9UF0rYlM7Og
 kL3bWw+u/qJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCag3KagAKCRCLPIo+Aiko
 1ZMgCAChjWiZb+ZWT89KSax71gE7IS+zhHDqNg2IFQHu3tGtb7ho93TAWmauYXh4ZBykYhPJZ+F
 HQ75JL/YdzvD2KRT0/nBZmLRI9SR/4yTetmbqNFshgjVv+oCtmKz9ICnVyIedeb438Fvm2XjwJX
 i3Ocz7kbB3A4pzMyFzLflInl3gX768nK7vgQTfn25FqxXL86kuOGn1u5TgkMd1IucIveAqwheDM
 fhVZGCiVGhCgdOl8+7AeYw1sqhdt/J2wQYuoor+c11U+yTQMHxh2GywwO/B3DKUvNgX/EkI8gxz
 UTxtzEmD2bwf3Ypo4B0gPr3LDpqpqrsOB0QaaTaRsSQm5ecP
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIwMDE0NSBTYWx0ZWRfX81CHXwjc0Q8D
 f3xlfM3vF4RBFoCopLsheW+XO5veuCteFhLXcIzQjK9Y3F4CjWV7BBf0drwmSd9UgKzRFQrA2yW
 OgvFUpGqNFVjvEl0CJgbJZdwvUxmhS8UUGLBxJ/f3rAQGvkrKFWnt6mEcvS1znpx3hPC7fx7G/G
 7V4jr70TukyZGANA5OCdh0k9umvQsvrrEc1DFIMZhonaw3UH7f9AWW6+Q5dzWc7mh3vMm+tTXPS
 F5v46w4NckShpHuaesrH/cPmuQYtOMzBASqIAp18Dmju+aF3LqD+P37E6jEXCWnjB+Tff1SuQXF
 SVA/+SibOUrB0IFhN17EqHNQFW0C3vbjUG0G2u6rbOZ8JVuClWiisTJWXSE0bc+GIMx2qKnvOm1
 CZYbxqocl4tWrouZByQC8apXfPzwAA8egYdedFUcq3RTswXl2yrl4cGVmVrz8OOE6YvgQH4vgJF
 M7vLl+ODKoVGb14bJng==
X-Authority-Analysis: v=2.4 cv=N9cZ0W9B c=1 sm=1 tr=0 ts=6a0dca97 cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=3htL6sknLGLhwEng4zIA:9 a=QEXdDO2ut3YA:10 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-GUID: eP0X60QinwzSMYZe4xDXQiEXsVUerahF
X-Proofpoint-ORIG-GUID: eP0X60QinwzSMYZe4xDXQiEXsVUerahF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-20_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 adultscore=0 lowpriorityscore=0
 suspectscore=0 malwarescore=0 spamscore=0 phishscore=0 clxscore=1015
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605200145
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-108813-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 13806590EDB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Sort out the remaining UBWC swizzle values, using flags to control
whether level 2 and level 3 swizzling are enabled or not.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/soc/qcom/ubwc_config.c | 16 +++-------------
 include/linux/soc/qcom/ubwc.h  | 26 +++++++++++++-------------
 2 files changed, 16 insertions(+), 26 deletions(-)

diff --git a/drivers/soc/qcom/ubwc_config.c b/drivers/soc/qcom/ubwc_config.c
index 7e321389a399..f27440d5c06f 100644
--- a/drivers/soc/qcom/ubwc_config.c
+++ b/drivers/soc/qcom/ubwc_config.c
@@ -18,16 +18,12 @@ static const struct qcom_ubwc_cfg_data no_ubwc_data = {
 
 static const struct qcom_ubwc_cfg_data eliza_data = {
 	.ubwc_enc_version = UBWC_5_0,
-	.ubwc_swizzle = UBWC_SWIZZLE_ENABLE_LVL2 |
-			UBWC_SWIZZLE_ENABLE_LVL3,
 	/* TODO: highest_bank_bit = 14 for LP_DDR4 */
 	.highest_bank_bit = 15,
 };
 
 static const struct qcom_ubwc_cfg_data kaanapali_data = {
 	.ubwc_enc_version = UBWC_6_0,
-	.ubwc_swizzle = UBWC_SWIZZLE_ENABLE_LVL2 |
-			UBWC_SWIZZLE_ENABLE_LVL3,
 	.highest_bank_bit = 16,
 };
 
@@ -48,7 +44,7 @@ static const struct qcom_ubwc_cfg_data qcm2290_data = {
 
 static const struct qcom_ubwc_cfg_data sa8775p_data = {
 	.ubwc_enc_version = UBWC_4_0,
-	.ubwc_swizzle = UBWC_SWIZZLE_ENABLE_LVL3,
+	.flags = UBWC_FLAG_DISABLE_SWIZZLE_LVL2,
 	.highest_bank_bit = 13,
 };
 
@@ -119,38 +115,32 @@ static const struct qcom_ubwc_cfg_data sm8150_data = {
 
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


