Return-Path: <linux-arm-msm+bounces-106358-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GMz6FuKN/GlhRQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106358-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 07 May 2026 15:04:34 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id F382C4E8D91
	for <lists+linux-arm-msm@lfdr.de>; Thu, 07 May 2026 15:04:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id D2A6C301477D
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 May 2026 13:03:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3807B3F7890;
	Thu,  7 May 2026 13:03:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="n9b3PVLS";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PdmVfjIR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 792C93F54DF
	for <linux-arm-msm@vger.kernel.org>; Thu,  7 May 2026 13:03:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778159004; cv=none; b=GRAuf24QYEX6FJbVw9jX4Q1bP1oLWSNzoedZk1ZiPQytGGZazCzTCZFPcQCiOzsLCnod02doIHUY4oUJG9aQaJ19DJllIrJao4d5LbjU6tS81Fd+MeX9MYb+z9KVB2t0Y74+l/DAmQ/BZqjUFT9roczuMQ6YXlxy9/Bcyj2EqIc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778159004; c=relaxed/simple;
	bh=DVzUVHYL1LwQyydsa5bse8Qdux0+ATejKvt7PdcnILs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=r7CD5IhdaIhttiJAEzx8mjDzq4vAFp7OCy9hiW4N8irBcyreD30dhYC9aIwZs2K/6zLtpzini4m5BNUIGVGmfgyvFhWm0tTsjYS1jlh+0d2H59o7C1XNcVAeTezrNpShemCppjSvlVbtq/HzdO14lOfqBkrVXpLMGmbT9uJR9fw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=n9b3PVLS; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PdmVfjIR; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 647AcNwR879618
	for <linux-arm-msm@vger.kernel.org>; Thu, 7 May 2026 13:03:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	l4shwfMjGLnh2T+SL6QX2H/uv+6YZBYhzZVvBdIDpp0=; b=n9b3PVLShnKv6Sub
	2va3HJAJ8W+6JqjBAfRI7bUiojgvER9zWnItOdTuGEhmedATYSmIYiqLXN74gdWl
	yBF8CEtycNSR9BUc5LKL12sI9MYE4eNLJWBG7DtzL6JjCI6qWAsLT6qeDzIyF5vu
	+D3q1bwtC2isCguhQChFZAQpvmkcH6sIKBu1klQ9VPhMVgrmgOFoQ2DmmS0OCPas
	3lYh5TXkK3D7fUdMBkt7aNBqWfICI9ZmWE7aLRLiKc+321Ruysg2/2EznDAr2Tja
	NKuwbSV3ahAMMhqW4ZnsUo2AgpChEbDSYOVITkDTvRX2mdmh2DQAtTUavwdNuj0u
	mmSWnA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e0kdq1v8s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 07 May 2026 13:03:21 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2adc527eaf5so7567775ad.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 07 May 2026 06:03:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778159000; x=1778763800; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=l4shwfMjGLnh2T+SL6QX2H/uv+6YZBYhzZVvBdIDpp0=;
        b=PdmVfjIRsXT6YMtJbPYMGEycLBWgLDv0lpB6MSj9oGx3+S4ib9IMpO7lrC2Brg/v5G
         Eg8b9VNpCQdMH8mLgEpIWmjwI8jgT40Gb/bFNryj5iPVG1zGnXoSahDYag1+rXV11tYb
         6+E14aKFfdf72wnBSedxt1yTzAbM3XaVqQ8YDMoNUe1XRCZS87Q43sR/kOjIIkFkyND6
         axK5FfI03YTK+JRrbFv6xEA7Y+DCQy4rJ8DevmfJ4z17jACTmvwPXsy/ZpufAS6k+eUW
         DxqcHunbM08ya8rkLvfjNmQfdCukDV6NGYpHcPOeZMJaIrR07BV7egZjAaGFtWqls5Q6
         wrwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778159000; x=1778763800;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=l4shwfMjGLnh2T+SL6QX2H/uv+6YZBYhzZVvBdIDpp0=;
        b=IIVcDr7vw2udOOzkUqWkgcmhXSNQFY25lejA5/BV+QEWQf3pgmRNpsRrWZIRW5OfgU
         ljtWGmEa6/4POVJ/MrUs3RIRSoXUC0RRa0gfjtF47z45tfvhRuaYlZ/B+6ywkSvPtjpA
         5Bgq8GhBn5R6RT/uqMJKCbhCRVXFpG94ENtjxYruaxqlmFv9Ihx806ik3HORb3DzGpaA
         /uAgaIIkFGkm70JrBFZ5R1/wuQtoRXxHwEA0MG83Rjo/bFrdNr8ry2T9UnV5g0dJbALu
         2ERui3t3BhIWvstP4aV4yUZtUrWWQ3clIOiZJ8/I1aOYODMlqMiXtbMeZTzokEmeroR/
         ySgg==
X-Gm-Message-State: AOJu0Yzi7Gbvz+49L+2zcarfiu9l2V2tYzYLHKTilgAx5z7HXWDMw60h
	qO7H3ClzndxQxTSC2RoYedRVCBYBcHdVhS2GPIn9f2CncXkuKqErLuSO54p8gDfP8M/7NZObSqU
	Q/sBWk1Pnyd/2ClcIC5K+RRuek8+GnVg+Sx4Sc3zBAbROlfOjj8nM3YHXqzM3Ju+VGzav
X-Gm-Gg: AeBDies+f9/ErRAf0XI95qaIQnbJmYPGCuieWxmB6U0+27gVLHwpOhnPq3OrKgx/kTF
	ZBQujjJ/LYGW3U7F4VI4mXZFxIZ0PlzhZ6Bg3yus/hHzpHX04pvbHuWulLURp7wtRBAG6MQe7qy
	F5vPBf3CyeuxWL1/aPs3wuq98RJdpYymWpDFPnldjv0X2bPEJwi5KcW8u3hkux5H/4zB803oB87
	b9E88FfSWDhAiuPCsTMDasD4gTxg5NDAisWCpWRWEv+OAs/XtzljGF7qeGxwBsxVK/JVRtmd2xR
	4oXCzZC8N3m6hiJKh6/tnJK9A1ZvUwARr9ZNs0iv07rk0umg8FYUD81J5rFjzKoJxJqaLt6/2pn
	gBETgG3Hed7DUA9YU4YKxeD65HZAc5GFWWa2wOXYvg/IHZZ4WBfiRKvuJD5nXue/V0iEIJRlm33
	AWXBsYfUu6o9epKQJBqv0s6LnMSbv5EldlWWeXgNylmNXyjw==
X-Received: by 2002:a17:903:24f:b0:2b4:5f67:5914 with SMTP id d9443c01a7336-2ba79becc18mr81503885ad.33.1778158998347;
        Thu, 07 May 2026 06:03:18 -0700 (PDT)
X-Received: by 2002:a17:903:24f:b0:2b4:5f67:5914 with SMTP id d9443c01a7336-2ba79becc18mr81502835ad.33.1778158997623;
        Thu, 07 May 2026 06:03:17 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a85c230c68sm5595959e87.19.2026.05.07.06.03.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 May 2026 06:03:15 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 07 May 2026 16:03:00 +0300
Subject: [PATCH v4 04/29] soc: qcom: ubwc: add helper controlling AMSBC
 enablement
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260507-ubwc-rework-v4-4-c19593d20c1d@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=758;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=DVzUVHYL1LwQyydsa5bse8Qdux0+ATejKvt7PdcnILs=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBp/I2EKmwuR6fxUI++RhBWUv+l2sKNuJCq0IGpr
 K6Db76TRTeJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCafyNhAAKCRCLPIo+Aiko
 1UwfB/4i4Cv+HSxLkStTNKa/XWbofh+QJ0Gqz3qoZKw6T7FhwdmpiiOolnFkFF5AEE41sAPxg0T
 i0vsFUSQ2ntnpMeKVF0bXJnJC5h2fNCpEWYBbVO2b5ASRno9xQz8K309j/bfAYdJtrHRhVQMqbq
 48VSEj68PZAIzKKdCUkFwVaxpIT++76uST4OLalKIOUzAqplAk19wQcRjGfCTL+J3o+SnhcDeUy
 uVjDyT3q36qtKOyVk6dVcGf6yuwomuHe+54wfgDePNlm7kOCgXU5AiG9EJMI0aVKOJ7teOmKe1i
 y06GqyY1qb9ah2mnoXoKkR5NWDmrm9tJ4ZMvWi2KnKcRcIJ+
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=P6IKQCAu c=1 sm=1 tr=0 ts=69fc8d99 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=WuC1ZyUpIfxNvbBu5HYA:9 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-ORIG-GUID: FR4uNmm4Bl1rQnPcfkz2DAMJ9yr0FIK5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA3MDEzMCBTYWx0ZWRfXwgvei/vIvWU5
 2QKa+p9aIGKA2h30dZ0Cdj58pfA3rnH322anSjcQUjfaPnnHhe30tRaWD1AK7RHcc5a9LMqxqG0
 aQiSbDwjcEeEK6u5eF7CgAfxM5/s5Ijknd3UoamABnxKAkMSeZaV7Ckno3X41xfvSejfXTM0AyP
 d9oK5TRvcdibo+Q1/MEGD9oeoBEIDZW+C9g8AKSevz6dqGveYxH5aJ/OUbpWCLdF6FaLwJZIkR+
 jnY+kqzpV5Ne6/VE/zWkMMgAo+8Tao28nhd7Iw79VrVpZGmbuhkIp1Rp19e/ZjWh+KWGOUZRdji
 SpYlI4kjpXrCPUeKNwYpA3LY5qLuUoSo2F9RMfVEs2h39EfFAtKlOwa4MhgxY34N56TSSI2k5HE
 PRn7oRpqGplqPC00ndMs2wlAgYFI15/r5zBA/xUll1oNGFtvmjqsu8HEoWYZETK/4BiJL22Qx4O
 tyHdI+1cvdvRqaAJl0A==
X-Proofpoint-GUID: FR4uNmm4Bl1rQnPcfkz2DAMJ9yr0FIK5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-07_01,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 clxscore=1015 bulkscore=0 spamscore=0
 lowpriorityscore=0 malwarescore=0 adultscore=0 priorityscore=1501
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2605070130
X-Rspamd-Queue-Id: F382C4E8D91
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
	TAGGED_FROM(0.00)[bounces-106358-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
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

Adreno and MDSS drivers need to know whether to enable AMSBC. Add
separate helper, describing that feature.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 include/linux/soc/qcom/ubwc.h | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/include/linux/soc/qcom/ubwc.h b/include/linux/soc/qcom/ubwc.h
index 8355ffe40f88..83d2c2a7116c 100644
--- a/include/linux/soc/qcom/ubwc.h
+++ b/include/linux/soc/qcom/ubwc.h
@@ -116,4 +116,9 @@ static inline u32 qcom_ubwc_version_tag(const struct qcom_ubwc_cfg_data *cfg)
 	return 0;
 }
 
+static inline bool qcom_ubwc_enable_amsbc(const struct qcom_ubwc_cfg_data *cfg)
+{
+	return cfg->ubwc_enc_version >= UBWC_3_0;
+}
+
 #endif /* __QCOM_UBWC_H__ */

-- 
2.47.3


