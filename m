Return-Path: <linux-arm-msm+bounces-106380-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kEjYA06P/GlhRQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106380-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 07 May 2026 15:10:38 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id A75664E8F1A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 07 May 2026 15:10:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 2E120306AAE0
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 May 2026 13:06:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9AA3F423A85;
	Thu,  7 May 2026 13:04:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UAiAfS7A";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JTUGietD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6E04423A8E
	for <linux-arm-msm@vger.kernel.org>; Thu,  7 May 2026 13:04:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778159063; cv=none; b=HQaQ5s9TvcESXZATShJGJdMy4miSd+Hj4j6CvVl1JyUMRf8sMU0DofixOuBy4Z7prqMP5Aa+HCgAzcKEoxxpayPg/RElyivwJVY/XLa2lTctQLo8HzK+VnJTuaHMvrn0x8v3Afk2v88DrCLb/eYRs+Kg35h6fVrySiXyJ3pgFRQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778159063; c=relaxed/simple;
	bh=ELfSfo30Xq2szDKMHs49lszh5EmDwoOzMcxayrSn7iI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rmv6fQ2p0qF7Gfoy082C92S00Yke9CnmGJOYuU2JhuyVcUUW+Wyt7H60eEjOhtTORshERJQTCSDOk09LcAukFyGGLOxSF7/0iTfrWU6nBYMvwx9UduS08ORBluIx/8d+aSazduiChNoAmhV2+e/eUvfM3hRnYVOkS1Hmn8nx/TE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UAiAfS7A; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JTUGietD; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 647AHZ2p151728
	for <linux-arm-msm@vger.kernel.org>; Thu, 7 May 2026 13:04:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6pPTtabF6OA9v/5Dtpi3YOgqhDzAT72mJRYat9rS4JA=; b=UAiAfS7AXSl9KxLy
	vEUpzbidgXolvBSGbVAVDiMUcywD7E8g/xelkhGobn7UC4zFD2wegrHfxtZe2Ax2
	mrE7RU6Vqn/cnr8y2lDingpzlh0Li9qzaUsGaDZN+wwX3bvsueKpnuRpeQnlHmKq
	8oTDKZgM4J+dfacJMFeQRYhVFwgCzxczhtug/FKD9VtD3Ox06Y6Xn1dOg6VIuZmZ
	z0UFNkotPAVfD5zyAUWadBfH4+whx+6kO2DedAmr+0pKz5BWduhCGiKO0O0WQggp
	2qPAyXkHUMkR/fRTcg2WptOgHI35SiE8dPIj0JRcNTce5l8od3pSZzvWtlhdTDtT
	iiKDIA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e0kctsw2w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 07 May 2026 13:04:20 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2b99f1c85cdso6743605ad.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 07 May 2026 06:04:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778159060; x=1778763860; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6pPTtabF6OA9v/5Dtpi3YOgqhDzAT72mJRYat9rS4JA=;
        b=JTUGietDSq3QsBjK7l6NAn8IJfaDgoLlV5AuFunkT9auMTaoeLyLAFlDmyDVeUz6gW
         s6sZ6seU7YQA7pl5MU3+RhxaqqibmZI2ys6KFaAL548oC39pNn3XosH4+Dj+lFMsDD7H
         F6sjIqSL1d3/fQlqxtOMSl5k0AFes11OSAlAPazjiIaMpXfQaNPAYLxxEhlMljwau+Ii
         yP7uhhlSa5yoiw99fiVS7/vLul7qQEAIbCAAYJ1Y+i3+hDRKQbvCelK3m/o9Sz5t7nZ9
         6+IeKd26XC9sDc9but7+0V9lffHoHc+yxkfKK8BLohGcRlV3lsF1LMpCBhsgcJwV9NfV
         6tkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778159060; x=1778763860;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=6pPTtabF6OA9v/5Dtpi3YOgqhDzAT72mJRYat9rS4JA=;
        b=Td781/hPZxxNuU6xRjxIkzQZOqXa7rHyJz6SJEJ8Oysu+1jhBxLj7l2tvGnjeSwrYd
         BaCjd58op45JjCz+0GUAB6ScR+9bg3e/ITEDezU3GTQv+/imlTgWZsGd5Zoe01/BmFlx
         vFcXg05W+GXPR/btwHpMVWe2WHh+GK80l51+QKP3zDMjutsNZHksun1w28TLr40URqGl
         sRIU1NbvyPvdNPlZUOT/kEr9uOFmAqS9RTf+A1RKYLkYAtBVhpoS63zT6EsCGo1cme7D
         Q8ZZJG6AxNKCTLoRZwzqj+hGAamxhJbWIdoS+0zp0C9lgqL9zgmTzoD1IzsfcVYMtVOB
         LBxw==
X-Gm-Message-State: AOJu0YxVXYVDcB2iRFcoBDJ6zq/c2Zc5gcih913cY+2m7Q8P/+XUoFP2
	66unoD3sK21BSsMrrUcctTeCCYUXj6udk2xDL3bI6+hysjhG9fCbGjVYMqaKO6bb5b5TWq8TASb
	VIipzXuHob+JcZXscdA0Vvi9hP+ad89WtZYCRNPGBIo6JmwhRyzz1w7j6gjVVL7/Hsyya
X-Gm-Gg: AeBDievaUi50HmugCg3CFOukYl0jCgFPs1yxKop8pJ1XJj9DGw11LZj9nj8EFD7ISuJ
	JpqxiUHjLphYXDA5IWpY6YuHj0QvRuXzjis90BvE9lZF9lXBq/ZwXGagPvpDxKOaLh8ARTlAMKS
	O7z8/ut6G/ZJFSY8ctgvv5iIuV0JTBQG+tb8du3cx6YcBcZVvh3G5Y2iGTe/psaKtgV1YRXsexO
	UucnWSW0qcWnA8GVphaGagMt+8ldfCfhurDUPmLe8nZQSpdt/GLPoR7k/SgWAApeKiCt9QnxCOZ
	sUV6XUqvZ3iTZBAqnuOKpcMElA/xXsCYjt0iEy0K3rwZ+k+Ni7U7wI8AahuiG4kSPdmCQY6G8eG
	WsJZrBb1nky+PQyuDV4FG0/oPUs/FVS3v78/vuufKOgf2/fIPhnnz8pVmaPgk9kta06vIeVVURn
	hYn5LCj2c41FkcirtoN4RuxyMRGWS+mDMkt5eGIIYvKpWp8w==
X-Received: by 2002:a17:903:390d:b0:2ba:bfb5:9b9 with SMTP id d9443c01a7336-2babfb50f3cmr24843085ad.7.1778159059642;
        Thu, 07 May 2026 06:04:19 -0700 (PDT)
X-Received: by 2002:a17:903:390d:b0:2ba:bfb5:9b9 with SMTP id d9443c01a7336-2babfb50f3cmr24842145ad.7.1778159058842;
        Thu, 07 May 2026 06:04:18 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a85c230c68sm5595959e87.19.2026.05.07.06.04.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 May 2026 06:04:16 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 07 May 2026 16:03:21 +0300
Subject: [PATCH v4 25/29] soc: qcom: ubwc: drop ubwc_bank_spread
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260507-ubwc-rework-v4-25-c19593d20c1d@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=5607;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=ELfSfo30Xq2szDKMHs49lszh5EmDwoOzMcxayrSn7iI=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBp/I2IcTMhxTq2oUuXpm5Li7mlEyZ5Nr/PM6smi
 UoEdM5tyUyJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCafyNiAAKCRCLPIo+Aiko
 1UKzCACMTOpnFjz+6rQTWxRwHu/yhRdR8qZNoL3cqc3zSjWRqxL6EgLacUWyQymv79MkwTKn+a2
 7Mi0JH+b2XTo9wQkHQ7+7rimjiun2iAKeNQf1ez4edCbb7P8oHTfZc8kH3lmy38k0+kZWJ5vmlH
 EcHVZFV2+jqC1/Ne9b5fSGGfJgwYxzlDdT/iSbGPKWpgAPRebQ+G/8oLTQL4tyTNJ8l8ZKkGuHX
 zer9jVBe4xZ3JmtysK4QBtvCDAosCZvXvdYFgNV6C9ZTgzAvamDVerx+CZFBNq0eddTOHHfVrre
 SHz8zOkE/hEEPbQQsvEH3rnINZ/ic87tw/6NcQQsd9gP03ji
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=XsPK/1F9 c=1 sm=1 tr=0 ts=69fc8dd4 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=VGmcmSc_WkMUHOMtpCQA:9 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-GUID: iqLd92UsmLE0zdTDnFZIziwoWbXoDX9y
X-Proofpoint-ORIG-GUID: iqLd92UsmLE0zdTDnFZIziwoWbXoDX9y
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA3MDEzMCBTYWx0ZWRfX9LMYZQ1eb5B6
 gbw3icb/90qMye8QWOFdPWf/MJNLvldI3jr59mHGYgGXfcGYHbtmxwNDcUUSB/aYKVbCCP9Uy7P
 HwODeKh9JzNo3diByBrNLlrA2qsPPqlYRA6mwJj8eu3ETtcaCLRaejQW6RXW5pd4tlmWAvaQDKG
 8NrmwMUlrBwf1EBHAPQN8K1MIO+mqvpgG2XvVPwginTpXBPO3Vc10tZSIAuj+l5ZyOrzXN/W8fe
 ApHnZ/QXsGahJSDAu/7vwdxsaAS9h2RLUrvoDCA0jdv+oWc5zARZU2uJWhM6V+MC3D19NghAFOX
 QlYa0PVed3SYBuKUdIZ60SrZMkacVQwldIY94PjkCfRVMLaZsWqr6yLD08UDZ4GQAEfpjc6bYdG
 Szgu9x4NaA34H3S2tXcG7+wE3WQ6XjpWf08F1F0G6CGoBj2OxcO+91M5xbvKlbXcED+Fai6rSG4
 o3yjnzX32KMLQ+576NA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-07_01,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 adultscore=0 suspectscore=0 phishscore=0
 priorityscore=1501 malwarescore=0 bulkscore=0 spamscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605070130
X-Rspamd-Queue-Id: A75664E8F1A
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-106380-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
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

According to the documentation, UBWC bank spreading should be enabled
for all targets. It's just not all targets have separate bit to control
it. Drop the bit from the database and make the helper always return
true. If we need to change it later, the helper can be adjusted
according to the programming guides.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/soc/qcom/ubwc_config.c | 14 --------------
 include/linux/soc/qcom/ubwc.h  |  3 +--
 2 files changed, 1 insertion(+), 16 deletions(-)

diff --git a/drivers/soc/qcom/ubwc_config.c b/drivers/soc/qcom/ubwc_config.c
index 1344cda0fb75..35cde4e9a238 100644
--- a/drivers/soc/qcom/ubwc_config.c
+++ b/drivers/soc/qcom/ubwc_config.c
@@ -20,7 +20,6 @@ static const struct qcom_ubwc_cfg_data eliza_data = {
 	.ubwc_enc_version = UBWC_5_0,
 	.ubwc_swizzle = UBWC_SWIZZLE_ENABLE_LVL2 |
 			UBWC_SWIZZLE_ENABLE_LVL3,
-	.ubwc_bank_spread = true,
 	/* TODO: highest_bank_bit = 14 for LP_DDR4 */
 	.highest_bank_bit = 15,
 	.macrotile_mode = true,
@@ -30,7 +29,6 @@ static const struct qcom_ubwc_cfg_data kaanapali_data = {
 	.ubwc_enc_version = UBWC_6_0,
 	.ubwc_swizzle = UBWC_SWIZZLE_ENABLE_LVL2 |
 			UBWC_SWIZZLE_ENABLE_LVL3,
-	.ubwc_bank_spread = true,
 	.highest_bank_bit = 16,
 	.macrotile_mode = true,
 };
@@ -59,7 +57,6 @@ static const struct qcom_ubwc_cfg_data qcm2290_data = {
 static const struct qcom_ubwc_cfg_data sa8775p_data = {
 	.ubwc_enc_version = UBWC_4_0,
 	.ubwc_swizzle = UBWC_SWIZZLE_ENABLE_LVL3,
-	.ubwc_bank_spread = true,
 	.highest_bank_bit = 13,
 	.macrotile_mode = true,
 };
@@ -68,7 +65,6 @@ static const struct qcom_ubwc_cfg_data sar2130p_data = {
 	.ubwc_enc_version = UBWC_3_0, /* 4.0.2 in hw */
 	.ubwc_swizzle = UBWC_SWIZZLE_ENABLE_LVL2 |
 			UBWC_SWIZZLE_ENABLE_LVL3,
-	.ubwc_bank_spread = true,
 	.highest_bank_bit = 13,
 	.macrotile_mode = true,
 };
@@ -77,7 +73,6 @@ static const struct qcom_ubwc_cfg_data sc7180_data = {
 	.ubwc_enc_version = UBWC_2_0,
 	.ubwc_swizzle = UBWC_SWIZZLE_ENABLE_LVL2 |
 			UBWC_SWIZZLE_ENABLE_LVL3,
-	.ubwc_bank_spread = true,
 	.highest_bank_bit = 14,
 };
 
@@ -85,7 +80,6 @@ static const struct qcom_ubwc_cfg_data sc7280_data = {
 	.ubwc_enc_version = UBWC_3_0,
 	.ubwc_swizzle = UBWC_SWIZZLE_ENABLE_LVL2 |
 			UBWC_SWIZZLE_ENABLE_LVL3,
-	.ubwc_bank_spread = true,
 	.highest_bank_bit = 14,
 	.macrotile_mode = true,
 };
@@ -102,7 +96,6 @@ static const struct qcom_ubwc_cfg_data sc8280xp_data = {
 	.ubwc_enc_version = UBWC_4_0,
 	.ubwc_swizzle = UBWC_SWIZZLE_ENABLE_LVL2 |
 			UBWC_SWIZZLE_ENABLE_LVL3,
-	.ubwc_bank_spread = true,
 	.highest_bank_bit = 16,
 	.macrotile_mode = true,
 };
@@ -126,7 +119,6 @@ static const struct qcom_ubwc_cfg_data sm6115_data = {
 	.ubwc_swizzle = UBWC_SWIZZLE_ENABLE_LVL1 |
 			UBWC_SWIZZLE_ENABLE_LVL2 |
 			UBWC_SWIZZLE_ENABLE_LVL3,
-	.ubwc_bank_spread = true,
 	.highest_bank_bit = 14,
 };
 
@@ -149,7 +141,6 @@ static const struct qcom_ubwc_cfg_data sm6350_data = {
 	.ubwc_enc_version = UBWC_2_0,
 	.ubwc_swizzle = UBWC_SWIZZLE_ENABLE_LVL2 |
 			UBWC_SWIZZLE_ENABLE_LVL3,
-	.ubwc_bank_spread = true,
 	.highest_bank_bit = 14,
 };
 
@@ -171,7 +162,6 @@ static const struct qcom_ubwc_cfg_data sm8250_data = {
 	.ubwc_enc_version = UBWC_4_0,
 	.ubwc_swizzle = UBWC_SWIZZLE_ENABLE_LVL2 |
 			UBWC_SWIZZLE_ENABLE_LVL3,
-	.ubwc_bank_spread = true,
 	/* TODO: highest_bank_bit = 15 for LP_DDR4 */
 	.highest_bank_bit = 16,
 	.macrotile_mode = true,
@@ -181,7 +171,6 @@ static const struct qcom_ubwc_cfg_data sm8350_data = {
 	.ubwc_enc_version = UBWC_4_0,
 	.ubwc_swizzle = UBWC_SWIZZLE_ENABLE_LVL2 |
 			UBWC_SWIZZLE_ENABLE_LVL3,
-	.ubwc_bank_spread = true,
 	/* TODO: highest_bank_bit = 15 for LP_DDR4 */
 	.highest_bank_bit = 16,
 	.macrotile_mode = true,
@@ -191,7 +180,6 @@ static const struct qcom_ubwc_cfg_data sm8550_data = {
 	.ubwc_enc_version = UBWC_4_0,
 	.ubwc_swizzle = UBWC_SWIZZLE_ENABLE_LVL2 |
 			UBWC_SWIZZLE_ENABLE_LVL3,
-	.ubwc_bank_spread = true,
 	/* TODO: highest_bank_bit = 15 for LP_DDR4 */
 	.highest_bank_bit = 16,
 	.macrotile_mode = true,
@@ -200,7 +188,6 @@ static const struct qcom_ubwc_cfg_data sm8550_data = {
 static const struct qcom_ubwc_cfg_data sm8750_data = {
 	.ubwc_enc_version = UBWC_5_0,
 	.ubwc_swizzle = 6,
-	.ubwc_bank_spread = true,
 	/* TODO: highest_bank_bit = 15 for LP_DDR4 */
 	.highest_bank_bit = 16,
 	.macrotile_mode = true,
@@ -209,7 +196,6 @@ static const struct qcom_ubwc_cfg_data sm8750_data = {
 static const struct qcom_ubwc_cfg_data glymur_data = {
 	.ubwc_enc_version = UBWC_5_0,
 	.ubwc_swizzle = 0,
-	.ubwc_bank_spread = true,
 	/* TODO: highest_bank_bit = 15 for LP_DDR4 */
 	.highest_bank_bit = 16,
 	.macrotile_mode = true,
diff --git a/include/linux/soc/qcom/ubwc.h b/include/linux/soc/qcom/ubwc.h
index c3f9efae5db8..254721f5ea3c 100644
--- a/include/linux/soc/qcom/ubwc.h
+++ b/include/linux/soc/qcom/ubwc.h
@@ -33,7 +33,6 @@ struct qcom_ubwc_cfg_data {
 	 * DDR bank.  This should ideally use DRAM type detection.
 	 */
 	int highest_bank_bit;
-	bool ubwc_bank_spread;
 
 	/**
 	 * @macrotile_mode: Macrotile Mode
@@ -85,7 +84,7 @@ static inline bool qcom_ubwc_macrotile_mode(const struct qcom_ubwc_cfg_data *cfg
 
 static inline bool qcom_ubwc_bank_spread(const struct qcom_ubwc_cfg_data *cfg)
 {
-	return cfg->ubwc_bank_spread;
+	return true;
 }
 
 static inline u32 qcom_ubwc_swizzle(const struct qcom_ubwc_cfg_data *cfg)

-- 
2.47.3


