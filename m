Return-Path: <linux-arm-msm+bounces-108791-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0EECBUnMDWqq3QUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108791-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2026 16:59:21 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id B3509590562
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2026 16:59:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 2376F3088507
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2026 14:52:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B89BB3EF66A;
	Wed, 20 May 2026 14:51:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Sr7amdMm";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BggvypG8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B2063EF677
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 14:51:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779288696; cv=none; b=BB6ojttBq4mLpSMspdbvz0QzIX/Y1NkrL7QjPszrjV8ef0El1Q3trzGaKNs0PjMmMuHcHdHxi5SdomMFabmcZcmeVYG7ienfVA5YKJdAgUL5tP6BQRUYzCRVQimlacucV0M4s3d1mavLDKHMahbM1PrQ7yVVbfuK/QaK93HQ2hM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779288696; c=relaxed/simple;
	bh=ExWr1JY9whNXUKFY5t0L4RzJXMMulXiTflbhGuiaHZI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=n5jjsw9ks98R5MXlLlqi9nuaGYM9isNvQR1OLx6dBg1XJB83/B0SpE4DhwUZetZeOHX6lZyuSsmsv2+VVhbp5vt7RLuN7BtXbKaNtbYyvYlrLBiMRpt0th/8QAKihmrsem2wk+Mu5NL75Yuf58+VPTOsf1WBb7wCoFK7dSLZeqw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Sr7amdMm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BggvypG8; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64KDMNMe1725548
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 14:51:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UrwG1S/O3qAkBaF791AYRGLqRUMhO7W/iLd53FJSriU=; b=Sr7amdMmfYdMr+Zc
	VWcjkcLGyThlQ8ycj8LrvSrNHd+eJI8+TIO5+OERDI5sxeWr104+c783A3+0ARFB
	aMu6AxPef7T/xpQcTtKU/m8l3dWbPQVw+iPCThTZ3+0c+q7moL657Ihuh080CfZL
	zsFkqM3QWIrTBW8+/mfHtLD0YQLBD5Tz3DFLa5gOhaw8JC40xPDg9GlqH6P3sXmu
	tRrCrbZb0YGdm0ghmrPxrqHSG0m9WtdCK7ezHyALetH8s2+K52dvKCXdYNqMIp7h
	J7EewccH7oxtCid2TDWWQwPzNUBC+LsqRkEpYJKazVyMns1Xnw+dO04zUsylQ6uf
	+t8XlQ==
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com [209.85.222.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e8t3qn8uq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 14:51:34 +0000 (GMT)
Received: by mail-ua1-f71.google.com with SMTP id a1e0cc1a2514c-95d434f3356so1827643241.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 07:51:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779288694; x=1779893494; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UrwG1S/O3qAkBaF791AYRGLqRUMhO7W/iLd53FJSriU=;
        b=BggvypG8ePJ0mnrHllPWbjQJrpaXTO+XK1h+omZ/zOSc0e7d+E5jUtSjwwCFoSdcRu
         Ndr+xSF9LcXCGBdMjPI2evrBb5G2owU5eRSzF0VgN4PvznQr4VwcjrEQtyu3oizZOKBk
         Q82fYOjA75pL5mgynElCyJpWNs+BJTwQMa3zppb7cxuvLbDKaHRSo/05srWw/DsSjTpR
         FeePYAwhtE6Dcsv29xJzHTgz+aT0UvcYGsHe0R/sVLStedNrlrfWuQQTp6p/FajrAT5+
         JKKqZRDbCqFoP5w32yOPtmpBTs/RfKQUm21b99rAsItAxXJrAVY7jiVQeG6wtwt516jP
         wAvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779288694; x=1779893494;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=UrwG1S/O3qAkBaF791AYRGLqRUMhO7W/iLd53FJSriU=;
        b=paGO+tw3a0w9omAy4w6AFcFCSgMo4w1IPrSaJGe9WH3Xz/1QL5vXVC3PBpO43p76/N
         gJRWUhvfQcytmPqljlPNxPpdl66FLvLBCx0UUtiMEDO9fjNqlcJDnUP3vIwLbP15+msH
         g3amdjWslFYWIdU2q8EkWWIXvJH+JGJEh+0CKEvj/VqMDJM1YYfubHnByEBG/Zla7cSR
         0Aay7T+KQXcStZBew3wGyrBdsvJeSJEzpDMsWPoR1iUUjMoEJQ27aLaugxdaAxIMDe9h
         O5NmTHTRZZLsqv8muTdK1y9R3RbG+XAZbUiMrpXndoU+5cMrA8n7a/SOjnplKHs1UlmV
         pQKQ==
X-Gm-Message-State: AOJu0Yx8dk3U+ewBZjz7yXfnOz1pUq8O9wcq3wq4rkuALm+1BiK5mv4c
	zWAngdADh03gcLwBX6zgM8L2/TrxcuQCvMFNcmlMeTeskqPiZ/pbe+3VAd7FFrQ5poh6hc3QYQ9
	I1VfGnow3+jq2CksfgKvgZndvUaTBkevkYLG0zVi9HeCxEcpQKUaGeWdgLrg2VeModR4g
X-Gm-Gg: Acq92OHvBRcObQLcmoGOeJYXRg67cC5xdJT5MLeoEc5fnW5jveVD+aKoQqkz0KPt95c
	jtYvortu8VeucOzNiKRqwmrLZXq0C4SEddI7+tTYFbehIc3TWr5EDMeOApTmyy20Z3+fsVL+F1M
	n/vz1tN0exb0+4CopjRDm8jh1fn4pB7f7fKHmWKAaTBAHZfQ8LBjTIuBiHLFN664t9HBpnO5OrT
	FKuPfiDmYGKDPISI12e8jJEiHFGwu/CCMrHruETQLWuRWNKTkekdfU1EYmRVFBZQF7+0aoa/BK/
	Qi5cClEtjIOVpVCmSs0+XCloquRv7ApfeehMtUEg2dbPQeNr0fSbb9/ZVk2kK/ZjcqY/8oG5R/m
	LLSO6i96lCCKnPmGdHRWAmYuQH6tNvWqgQ1fqGj+1RF/L+s/3sCAB+KtPDij/8sFfwkOOQrC1gX
	2aFaE/6Ologgfdab2uIbIzvTmZnhGWz7/8xUE=
X-Received: by 2002:a05:6122:2988:b0:56f:a3e2:66a4 with SMTP id 71dfb90a1353d-5760be39af3mr12943646e0c.1.1779288693735;
        Wed, 20 May 2026 07:51:33 -0700 (PDT)
X-Received: by 2002:a05:6122:2988:b0:56f:a3e2:66a4 with SMTP id 71dfb90a1353d-5760be39af3mr12942975e0c.1.1779288688306;
        Wed, 20 May 2026 07:51:28 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a90f10c78csm5128907e87.14.2026.05.20.07.51.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2026 07:51:27 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Wed, 20 May 2026 17:51:10 +0300
Subject: [PATCH v5 03/28] soc: qcom: ubwc: add helper controlling AMSBC
 enablement
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260520-ubwc-rework-v5-3-72f2749bc807@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=819;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=ExWr1JY9whNXUKFY5t0L4RzJXMMulXiTflbhGuiaHZI=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqDcpm7L98NiVy2c2G3dWVoragMCzQMvvnfaS3B
 rjM1n57BTCJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCag3KZgAKCRCLPIo+Aiko
 1QSPCACCKpLUBk3NUYdB90kskEN18nV0MDp5L9vyeofmX/kuMqKVnnQtsrBNVeMUJ1cjSl7TX0G
 pr2GTtlNGfEAVhw+MI0axWiTiG0IQkgFl1X0vSvvXBu5Zod4D5SCgY6ggBJpLY3eDPlvYpT+qrS
 cVYtenD7qxrRndKv/Nkgd2gsGdAL1u2eMq8mDMiKXihAYz9pJLbcbBeSxY3uEtDT2yZK1a30w+O
 v5nak+iIo+62vUHowH7ST3EkEUc8QyMoFx6DOrWEXxmfKYRKwKe/yzzQXeecSI9z8cNPhyTXKXR
 wIJGgqw0IA62dIbrc/MGHHBOPHaEkUADxL4OA/rfKKBwRNgl
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIwMDE0NSBTYWx0ZWRfX9xdgDT9IeA1m
 ystNRDoFBrS/qq2lgWaJcNKiAsjgbLQsMLL/nzV5gIMLpzsLTCLyVfNb7+OCsw9RSMtdhbUkrGQ
 3pP7eatQ9LKfFX5kymCgf6e9toczRDxpAsfYtaPqjgH6aecqyyvf2tcXP6i/HHLE0/oo3GJV+Uq
 CqccU9fLtjX/bVw1OpuReIISA/FYuN0qivlq5pvRwxh+UzShQDRdFlmMd5uGtR9Fd6mklTV238E
 6z9W6tbQ1gXy5zJu9ElF1EXnklYfsC2PgvbZyL8qKZF7N/G8thQRjNocVlZQqLfzJjEkI09F7LA
 RLbo6uHPqtbqDFacLhGSPqcBVT9Q5qBpd4w9WqBHNooIeVT4RAsuU/AYfQ/SINfy/tPAl7xOYab
 sBVeS9zKxgQ9z6RBWReDHblsE+DTK1QrA5Rm4PnpI2ZImsxSYzLuSExMSRNmZk9GsgHdm8L8J2Y
 +73KPVwMWgo511JNaQg==
X-Authority-Analysis: v=2.4 cv=N9cZ0W9B c=1 sm=1 tr=0 ts=6a0dca76 cx=c_pps
 a=KB4UBwrhAZV1kjiGHFQexw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=WuC1ZyUpIfxNvbBu5HYA:9 a=QEXdDO2ut3YA:10 a=o1xkdb1NAhiiM49bd1HK:22
X-Proofpoint-GUID: sLOddeRGHThUX0pS8GQ0rlWvRm6gXvQ6
X-Proofpoint-ORIG-GUID: sLOddeRGHThUX0pS8GQ0rlWvRm6gXvQ6
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
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-108791-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: B3509590562
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Adreno and MDSS drivers need to know whether to enable AMSBC. Add
separate helper, describing that feature.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
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


