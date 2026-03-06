Return-Path: <linux-arm-msm+bounces-95897-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uEeOOiEGq2kMZgEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-95897-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 06 Mar 2026 17:51:45 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E7AB32257CD
	for <lists+linux-arm-msm@lfdr.de>; Fri, 06 Mar 2026 17:51:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 80B8E304BE85
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Mar 2026 16:49:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C177B4611C6;
	Fri,  6 Mar 2026 16:47:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="J9vrYKmO";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XhWqmELI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CCDF438FE4
	for <linux-arm-msm@vger.kernel.org>; Fri,  6 Mar 2026 16:47:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772815674; cv=none; b=ZQGQffbMhzWaSb1PbWvw1bqJK+blQE++s8QWg5sfNrFAVYSmZZWNhrsYQoI/Up7wkxaLgiwii4sivqM9Nva/foeTy/G4Yc0XjOH2VAvOk9aNXjSOYjK9LEbeUjYm+kFXHRe5H37MXW2mL/vvZpuwgcEW42GcqkDvsbJrw3JVsqE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772815674; c=relaxed/simple;
	bh=v7QXktkShy+wyahjFgEkbZoSxJ/5hj9cJD9SDRJzeIA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ab9U0Zg7iVvrbdsviPuq+bJVLe93JT76J0gt5CPH1pGXP8On/bGjjNJcFauLsI+MZy3HRbp3l49i1dY8l6Psu2Ip027ITCbYFXz1dCJGFeYLl6XEFod6pZiqUYwTN65te+xDXp4jEUCR59jLB9ec3ZyUbUHNn+lCBiIBnnSVbs8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=J9vrYKmO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XhWqmELI; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 626Fr8cE080007
	for <linux-arm-msm@vger.kernel.org>; Fri, 6 Mar 2026 16:47:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qJ6Ex/AAn1uIE82cXCit/bkBSE8pPV30Id+vTgVPV2k=; b=J9vrYKmOpF8vAjb6
	rPQvnradRPJjIzoN6HQ5mybVzIeyN38qibCV8fZ4NxdzlvFgEdAieL50o3JnhlW2
	QXOjeEpI4nE9F33/BDfQlsqTlmvg+voePvZPZytd6HR/7GmUvuyxYQrvrsSKplfi
	YzebplJhuaIunDpNXUN1EgIkmcJeiYlKu/WTJ1k1Zyom90uBWRL9+RW4+5CPMlfO
	Kc5LYz9qjL36vrDGs+FkCUqzry3+O2ZLJGcsaf0z+rgWj5dIBgEhZfeBKBQKNLvg
	4WchuuexcRAL33Amt252zUgn8z+el3Ascttq0AwgVKzT9A5ZS4mXSWYKDfqd2v25
	f0QHow==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cqgp43k88-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 06 Mar 2026 16:47:49 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-899bef1ea49so485644286d6.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 06 Mar 2026 08:47:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772815669; x=1773420469; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qJ6Ex/AAn1uIE82cXCit/bkBSE8pPV30Id+vTgVPV2k=;
        b=XhWqmELI3L7zAIPWpKKiK1lwIlFwSUwEnTFNdTyV7+/DbORdRFATJoGk5+HF/Scu+O
         xgP+zM/83Hf44jqnE0zRE1PO17N8KVhINqdYz4PvVKgaOqiq5YQ+87yccf70lO2OLz3E
         Omi2LwZHcm/3T6dGri6nuWudbcdrYYSj7kdAgVDlBECT0oknT/5XCYKQyLYuExSPSVUu
         b0R+EdebCr2oLQQ9ZiJNV0vKD26Nn1QwjxQSJIXeP5GnPF3oSuKOyAQASBekMV8YUgPc
         ipjA06hVOZUqUu3TV/ni8/JowDE3xuGJJnFOB3cXQdWISLriLGFzjWeeN6R4+Xtbgi+F
         LR/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772815669; x=1773420469;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=qJ6Ex/AAn1uIE82cXCit/bkBSE8pPV30Id+vTgVPV2k=;
        b=Q31dvn4EwqQoNVkWrP84B8oclBYuB/xCJrg/WDxma16aUpGr2ZjTaj8nUdDixDTZ2E
         vG7iMoSzyz7FhGhSVujMKVA4DydVNgmDRDNvXZj9GcT9RD26UWcZVYLYlUTH/PqVw9wL
         tSH8sWWBXHpYtCLZcLTlbl4FEATggw+W9BE2Ps32WBA97cjJMD3oJskEggyDMAYe/WkZ
         BPrZ55eIjjV0cqWjJdpuVEvuOcolAEeObiXasEYNLnD8Px1jlfpneuAUR2AXsBGaSzUh
         bN9bQ0yT7+TbmwoBYnriIczOy7eI1YJotr5KjDnNK4VF8yMCETR8tt3BMhz2dCNIzsgz
         Jd5g==
X-Gm-Message-State: AOJu0YyrOVn6NthPBK5I7wWSGMrBwBYXJ2p3F0KuxeFMSyaEIc8Qajig
	VAwmJ/mg7YxoS5//K065+ys/NFcszh3aLLOjezKKlETRFKWFmGXiG1SSCiNIf48//6uTOGdIrC6
	sY5IPBarQ+X1bRjHlZ+0Pme3sXtlJG3OHVSarsKHSiIzbWhnZom93QzUNn47xcJmDhh9I
X-Gm-Gg: ATEYQzw4PhR1o/GHP+Xuy+bkH7w/I46xBCS8fRFFLjDI7etknLs/jBjvX1gqscfuBpQ
	pZmmaMYfpZyGe4079vxZ8UObMqhDJe4BXDCIT/aLdDdUTwPuVR4vWsk36XrqMwQxWOCNle3R4LS
	nW4N2F7J9Rh+/uCqW7CfBaHJMvCxxjO5AWXLyKnBaqKF+lZT0gVBhleopz+cOsHlXcMAa2MepfL
	PHqLwViAAlPQqdgUsdxfO7UZrJWM3PYGXr7/iqIbY10NF+eXzIHKN5QxsRIJLQ1AbEBzMVMkbN0
	/YqI6pAymw31Pi7cyKWNRzTOLt6UGOVWSFONblINzkq5zlsszaPCbzPdyzGNq0POaDhpc1Si2S5
	ziXEwiAKsVIzGkK36lZF+yRrmzWZgBVYWtGh9HS2vnYakgg7N6wK5n1F9c+TI2M52xwk31uWZt2
	9FOd2GIdJ9rHlTJWY6Jc+6QJtIrmPVFWgIGqU=
X-Received: by 2002:a05:620a:29c1:b0:8cb:55cc:6245 with SMTP id af79cd13be357-8cd6d3ed360mr340183985a.12.1772815668556;
        Fri, 06 Mar 2026 08:47:48 -0800 (PST)
X-Received: by 2002:a05:620a:29c1:b0:8cb:55cc:6245 with SMTP id af79cd13be357-8cd6d3ed360mr340178785a.12.1772815668030;
        Fri, 06 Mar 2026 08:47:48 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a13eaebd0asm213804e87.51.2026.03.06.08.47.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Mar 2026 08:47:46 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 06 Mar 2026 18:47:27 +0200
Subject: [PATCH 21/24] soc: qcom: ubwc: drop macrotile_mode from the
 database
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260306-ubwc-rework-v1-21-9cfdff12f2bb@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=5167;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=v7QXktkShy+wyahjFgEkbZoSxJ/5hj9cJD9SDRJzeIA=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpqwUPRKAvBaKiSIudQZ6xcRbzFB5Ni1CIbhtqf
 LAVbZ5TkD+JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaasFDwAKCRCLPIo+Aiko
 1duWB/9x/MZJSqKyKCvfl+tFrH5M2zgQzGC5zoXk01bxR5/XZp1OqdW6dAkklTyaVff+nePOaZk
 ZvV9hZnsPlfBZvPs0pPseyE69Hn83m0sL4a9Pj3NJITfWfMM7T1QDGHU9jF+A5lt6Oi0iXJiJMC
 PhzPdMROuMJ4ESsMZO7HPohhGAViLefRSlQnI0/htVQF7JaVnb6U324uAu4vInd8Rq0/+UNjheu
 BVANPv2Qdgds1ErPS7t4qZ9EnkQeq5goawF+DLORk52IBPdJGzTkxVdiTbeEgc4RAeTGNumI+aw
 g2WI6UsKDZrdvxuyuk9sww+UT8Q3ujOcI5uoPlxBB8ldn8xF
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: WPAEwWEztjKjw3i0uBivWHomKMvYocX_
X-Authority-Analysis: v=2.4 cv=LegxKzfi c=1 sm=1 tr=0 ts=69ab0535 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=lOjMx_-Oxa8n0LcNG1gA:9 a=QEXdDO2ut3YA:10 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA2MDE1OSBTYWx0ZWRfX4Q0Xini44sra
 fJbEWp4d2P2OBhbIi4lnUYGVtii6LwMH8KIDfDFP00aNUX8QMgjlrXIj8b3XV7bQ1L9xtUGXnhC
 vsnJeTfZoHPyYuNUiuVfEhrR0ZaM7zgUMvgprergXeDC/Zyex9BeQriOzWAWs7Vd/USCuTWPofp
 LhzDeK67mMRYFlaGQU0zq+U7Krln9OcJFwKz6d0dqLzeSRx2zY7LKJnPWpFMEO8O4EtMzz54vKR
 +27/2vTsryeCtLyPCPgUeeDhKrMf84cTK5uAE4C42y6fvYFC8KZT35nRnW/neeeyRKWDvNkq651
 bp8+qkZd98Xy2NTKG0NpWNQ0OYQhXaLLbc+JunT2+T5/Hqrxde1jU4z+Ji6eo157ZtEvQbWpaUR
 0lUjOU1H8LvbmrQ3Qad+oSr+SBTV0tLJp2T2OaBZaDVXq7L9RIcL0P9FAPW+Fygzd/H3ffv5+ti
 XHnYD5CFBNOPoxDl8dQ==
X-Proofpoint-GUID: WPAEwWEztjKjw3i0uBivWHomKMvYocX_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-06_05,2026-03-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0
 priorityscore=1501 phishscore=0 bulkscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603060159
X-Rspamd-Queue-Id: E7AB32257CD
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-95897-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.933];
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
 drivers/soc/qcom/ubwc_config.c | 15 ++-------------
 include/linux/soc/qcom/ubwc.h  | 18 ++++++++----------
 2 files changed, 10 insertions(+), 23 deletions(-)

diff --git a/drivers/soc/qcom/ubwc_config.c b/drivers/soc/qcom/ubwc_config.c
index 070bf97e134e..51de36f5f40b 100644
--- a/drivers/soc/qcom/ubwc_config.c
+++ b/drivers/soc/qcom/ubwc_config.c
@@ -21,7 +21,6 @@ static const struct qcom_ubwc_cfg_data kaanapali_data = {
 	.ubwc_swizzle = UBWC_SWIZZLE_ENABLE_LVL2 |
 			UBWC_SWIZZLE_ENABLE_LVL3,
 	.highest_bank_bit = 16,
-	.macrotile_mode = true,
 };
 
 static const struct qcom_ubwc_cfg_data msm8937_data = {
@@ -49,15 +48,13 @@ static const struct qcom_ubwc_cfg_data sa8775p_data = {
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
@@ -68,11 +65,10 @@ static const struct qcom_ubwc_cfg_data sc7180_data = {
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
@@ -80,7 +76,6 @@ static const struct qcom_ubwc_cfg_data sc8180x_data = {
 	.ubwc_swizzle = UBWC_SWIZZLE_ENABLE_LVL2 |
 			UBWC_SWIZZLE_ENABLE_LVL3,
 	.highest_bank_bit = 16,
-	.macrotile_mode = true,
 };
 
 static const struct qcom_ubwc_cfg_data sc8280xp_data = {
@@ -88,7 +83,6 @@ static const struct qcom_ubwc_cfg_data sc8280xp_data = {
 	.ubwc_swizzle = UBWC_SWIZZLE_ENABLE_LVL2 |
 			UBWC_SWIZZLE_ENABLE_LVL3,
 	.highest_bank_bit = 16,
-	.macrotile_mode = true,
 };
 
 static const struct qcom_ubwc_cfg_data sdm670_data = {
@@ -155,7 +149,6 @@ static const struct qcom_ubwc_cfg_data sm8250_data = {
 			UBWC_SWIZZLE_ENABLE_LVL3,
 	/* TODO: highest_bank_bit = 15 for LP_DDR4 */
 	.highest_bank_bit = 16,
-	.macrotile_mode = true,
 };
 
 static const struct qcom_ubwc_cfg_data sm8350_data = {
@@ -164,7 +157,6 @@ static const struct qcom_ubwc_cfg_data sm8350_data = {
 			UBWC_SWIZZLE_ENABLE_LVL3,
 	/* TODO: highest_bank_bit = 15 for LP_DDR4 */
 	.highest_bank_bit = 16,
-	.macrotile_mode = true,
 };
 
 static const struct qcom_ubwc_cfg_data sm8550_data = {
@@ -173,7 +165,6 @@ static const struct qcom_ubwc_cfg_data sm8550_data = {
 			UBWC_SWIZZLE_ENABLE_LVL3,
 	/* TODO: highest_bank_bit = 15 for LP_DDR4 */
 	.highest_bank_bit = 16,
-	.macrotile_mode = true,
 };
 
 static const struct qcom_ubwc_cfg_data sm8750_data = {
@@ -181,7 +172,6 @@ static const struct qcom_ubwc_cfg_data sm8750_data = {
 	.ubwc_swizzle = 6,
 	/* TODO: highest_bank_bit = 15 for LP_DDR4 */
 	.highest_bank_bit = 16,
-	.macrotile_mode = true,
 };
 
 static const struct qcom_ubwc_cfg_data glymur_data = {
@@ -189,7 +179,6 @@ static const struct qcom_ubwc_cfg_data glymur_data = {
 	.ubwc_swizzle = 0,
 	/* TODO: highest_bank_bit = 15 for LP_DDR4 */
 	.highest_bank_bit = 16,
-	.macrotile_mode = true,
 };
 
 static const struct of_device_id qcom_ubwc_configs[] __maybe_unused = {
diff --git a/include/linux/soc/qcom/ubwc.h b/include/linux/soc/qcom/ubwc.h
index 405d83f8d95b..d4a0cfb133fa 100644
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
@@ -80,9 +71,16 @@ static inline bool qcom_ubwc_min_acc_length_64b(const struct qcom_ubwc_cfg_data
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


