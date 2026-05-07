Return-Path: <linux-arm-msm+bounces-106362-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mEXhMaOO/GlhRQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106362-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 07 May 2026 15:07:47 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CF2864E8E73
	for <lists+linux-arm-msm@lfdr.de>; Thu, 07 May 2026 15:07:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 84E94303C126
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 May 2026 13:04:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D6D173F1674;
	Thu,  7 May 2026 13:03:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GBexpJWU";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AzC34zzB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F5F13ED13E
	for <linux-arm-msm@vger.kernel.org>; Thu,  7 May 2026 13:03:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778159010; cv=none; b=a+wCl5skT7VN8fAph/MjIi8zhOg6jBZMLd20nvlMxoSNvVF3UoC/bSYzcRCITgQFaDyyBPiYAGtp6O6H0uvceqmNZ3v+itvOcxjvKhbF3DhngRKfq790dShuzsDkHjxGpqO+IrazKfzaQf1SAfkDXP5vbe3Uz88SYeKafikD/7c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778159010; c=relaxed/simple;
	bh=pQcZSLClq75f0H7mdOxTbEo5DpGKFB3n0GBshQz7Fb8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=tVCvRX5Rp+HISIxpo8S+mpkWs6udG2S+4Hdw5/+UuRwa9tQ3OUYdacQseFC081vRzsv9ATgHcNpY3KDdbNx7INjRmHhEF5WRGdVZ6i988kznS1CLfB7LGybKGJg9Fp/JMpbYJB7bwat6Kcjkx9sThX+RUIjVR3QoY6gbK3uZfBQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GBexpJWU; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AzC34zzB; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6478q7fn259326
	for <linux-arm-msm@vger.kernel.org>; Thu, 7 May 2026 13:03:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KrGdZ6Bna8qkROGke7rL/1evORye3ZzPkLd+P26j6Fs=; b=GBexpJWUB7j3H2Vs
	gh0De5AnopuN2Awsfv78GrepAEtx+UtVwH6f+0BxVfE+yzc4YIRxYzS3RCVYPgpP
	zRBPy+gyQXC/Kn71FX7jDnKhm0HcibpjrGTf72eRVLylmEpNFNh3NV90NFIW7Rg2
	cUCs7ATJr7D83jIR37Hyg9GefPyZZwcdE9mJG1thdOXSQdQqhumzJ9F8U75IvDlv
	qyVmFCxfAAjAXj0bSEErYB4AmUkg/MIFmXrgDj/B2qcjdcuXoyBiLKAxCe+OQ+Cz
	tb0opRS3w7OjLnl840wJjxrDkJ7QlMzIrllI/LIro2MHTyxOdDX5omOt9V788W7T
	yh00CA==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e0hr8t7j5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 07 May 2026 13:03:28 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2b2e91add2aso10855595ad.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 07 May 2026 06:03:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778159008; x=1778763808; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KrGdZ6Bna8qkROGke7rL/1evORye3ZzPkLd+P26j6Fs=;
        b=AzC34zzBDIkrqlU9StmFf9k8Ia5b2zGA22uVHMw06qeb9Bv/gH5kNITj8ACqWKDFs0
         DU5OC+RIuYyFxUQjptkLyITGGjN8KdIs9dJ+Kuc5jShPoG0NL9J/bPRlFHozyB5lPkmS
         joW0wavWMTwbbDndxi2qfz8EMMN0+RcgeIkw17TQNCzsXst42ppMnYyYU/uNLc3xrgde
         mX4VLLiVAS4gkOsHDL1YKFCYEx5On+o2f4u4z8RceU49Ix1DbKLo7oREWQS3NF6eOHHP
         FAAoWUzRO5ybfN4EP2MkntSCc0xBDHixz6Jv3EjKWoKMwYEDSDL5jS2GI2+fQ1HuDUny
         i2KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778159008; x=1778763808;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=KrGdZ6Bna8qkROGke7rL/1evORye3ZzPkLd+P26j6Fs=;
        b=CRCRtBJO66RFCId14Omhnqah9dFRUUpccdesB2nByncbUwu222Wrwolvm3ji+bJXQy
         Sutw7Qls+vWC6l8Bimzd+0uxFlM3s9vy7nt81cxS1IUlhQ9iwnrETLSbOXe8vl6ALk3k
         tjrBoqZ5dJH7DXK4mMqAIQJ/UUdrTItEczPLU936GxjPQewuAfvrojYEgPOFjc4wh+uN
         liM6n0Z9wAfYWf833PuiYNyuC19wfZMGHIkAZy8CNi34q7Z2w2XeEx6fjWHZ6LSbMlQm
         +4ca0yNZXrl8nofaLP3VjbNPzXjeKnz9YkKhGZ+s1TCHNB/ZD86HfTTjP2ES4ItuOklk
         UJuA==
X-Gm-Message-State: AOJu0YxqPhDIbbxJ1FUpkBZEww2izrvZ6EUBpr9ZhBLZPaX9ayIu0YXW
	C3N2aR7r9ij1Yud61m6jjDRU8MzDp38CRnHVjvgPc6tCGzAyUfYL1RiiGU496ZlYk9EAiJbiecT
	DcqZvxububfCPKAEFuPt9e8CYwmYajS1pIF+LqOMiG+oEVOWl5ERnvh+Ho/h+Cn68557s
X-Gm-Gg: AeBDieuuyUZ4rHFlRl2G1bojTBEsSPfPuAZynYLorpo2qLkDiWUu0GhDEVDtKMWjfXS
	MEBCiX+DhN4tST0umKklMjekL4LEBFkZ+UEE05SthsMM13+RU55A9bYRJn8B2Umm0UiXLG/8EQp
	TU52Ol4BWByhEYqliffZVjWHaSUUsMD2G4fOY7qG1rc12a2jh62WhSFeWX5g5/OQAUr5xyuYLDj
	WhAXDrSypzMBZ3SrnjzDq3+8idNsYDpsd6Uyqx/bLYErFgqAqN4BZk9p7U7vjjsi1LaOIRFzcv5
	9ihOnVCTg/n9CPoKa89zF7HBuGmFrWou2wyBGGV/o7Fw8DwONYBi7fNEKHS8ScwdnP7HWPpeJYX
	4DYKmdpcDvqQJL0x8Z/ax1Chv/oZejnxWErreBNVpaeHYtyepWsS0lidvD6ujXgPrZowfRBTgVW
	HnrQuhPhff9qP146Xl+cmhoW2zCbImQMOtLYk6QzQ+LYZzig==
X-Received: by 2002:a17:903:291:b0:2b2:49a7:a5bc with SMTP id d9443c01a7336-2ba799d39c8mr77213315ad.39.1778159007574;
        Thu, 07 May 2026 06:03:27 -0700 (PDT)
X-Received: by 2002:a17:903:291:b0:2b2:49a7:a5bc with SMTP id d9443c01a7336-2ba799d39c8mr77212145ad.39.1778159006887;
        Thu, 07 May 2026 06:03:26 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a85c230c68sm5595959e87.19.2026.05.07.06.03.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 May 2026 06:03:24 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 07 May 2026 16:03:03 +0300
Subject: [PATCH v4 07/29] drm/msm/mdss: use qcom_ubwc_version_tag() helper
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260507-ubwc-rework-v4-7-c19593d20c1d@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1662;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=pQcZSLClq75f0H7mdOxTbEo5DpGKFB3n0GBshQz7Fb8=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBp/I2F69Gf0+wrJZ+PAcIYbdCZBc3bLgBJpG3EJ
 0+hZRvmqt2JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCafyNhQAKCRCLPIo+Aiko
 1YrBB/oDsZ6AVPY2ZhV7yKScT8oIWVeq2n5oJtdKLpgtIMphPmRL+a82CLnLw1RhBcNnlqpCFlZ
 cNiZPg4pWyklMEENCYwQ+zezrwoKmGcgl4cTjnHxqgOIFMgCL3YKmZQFwUpi/j+l0REimJwbl3B
 8TrPkOFEwEKmz6nOB9FAfEqW2EvPQWmRTqhVdSj0cUUK/2vUYSsktZ+EtBH/iC1TGvjMO8a2bf0
 OwieVYHZIOTH1AN64R2+6rJFspKZ2wydps8vAtybEyf9eVevJAQhFvdjsx/4UaiCKTvvaIOPVKg
 YR/4+lH4qMq8FEgn8ZUkD0Kj4+G9bZZ1xBy20PwJClCsUA34
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: gLNfQLcYTg0zViC0_pMiEXiwSCY_uFPm
X-Authority-Analysis: v=2.4 cv=caHiaHDM c=1 sm=1 tr=0 ts=69fc8da0 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=qBJULKV797PGQuHHbA8A:9 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: gLNfQLcYTg0zViC0_pMiEXiwSCY_uFPm
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA3MDEzMCBTYWx0ZWRfX6KUy4TQzXsRv
 41BGy+sKC/sLnPgpYhFy3KrcEqsION19jILffBqzhqEFfgMduE6Wqz/s08FYcbAp9rh5KgoZblD
 Mf+79p+zQFikalDX0IA3PsXg9lg8eqIl/OfmD9M8knFIq4EReE+m90UU0B7OrxwFXO8qQsNy8v3
 lyf/daFsUa31VjaC9DsIPHkU1+i1vS1sflQeXjbwKSwoFjERkorOFUQTcyPZRAPsT1HMFaM5v/u
 8ZuVZOrR5hn0/WuSHY//20Q4xYZ1qoPRC4b2fKv8dojkNYOK43A/F0DgySrBzzmxxxB89qzi4j3
 EBLPBIelu7k55f9Y+ouasQcs+DFoRYMF7OmpKooGrzhpWe2dVXYvRmTzOIiQekJ4HHtgA8EZbdk
 Il4ZQ2mQkX5f0FCjpOntu/DmjzQRT8rk87RJrkiYqpXyxzchgocXeVD7E1BtxGwgK48pyjTi4MU
 zikwzk98BKcs7ZoxC0w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-07_01,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 suspectscore=0 bulkscore=0 priorityscore=1501
 adultscore=0 lowpriorityscore=0 impostorscore=0 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605070130
X-Rspamd-Queue-Id: CF2864E8E73
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-106362-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
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


