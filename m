Return-Path: <linux-arm-msm+bounces-98636-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cCKVFICRu2mYlgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-98636-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Mar 2026 07:02:40 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 606422C679D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Mar 2026 07:02:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 5F7D33037D8A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Mar 2026 06:00:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 62E61346E5A;
	Thu, 19 Mar 2026 06:00:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZLvzmMDm";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MV1AzmeA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82F6C322A1F
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Mar 2026 06:00:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773900018; cv=none; b=e0E+x4Qce8Cd639fpaY0fV38w+yOV8e/c9qBd1cqylH/YlmXdVE0h5LJopV9c/Q5U0wr2HOLP1JkRkQOrp7eEEizbEgGh/jaMRK+Q+vzcIN6GYnzRr80Hlp4lAC5hRig9Mnnty5MF6GWv3rEMdxmy+tI+w/JGAwVsLezTj9kUIM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773900018; c=relaxed/simple;
	bh=4aoxx1fP4chm37ZEt9fNlCeGqbvbUox4z5NZsa9woZQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rgNKbFTwTtF4SXXdEGv3WuRSFYBpMyFgQS0M1gSvj9cdeRpexklr6AX1SdBQKKMchcsYXlp2k7YNvjSdHf46HV5/RUqAxAbRHFzCKlJiPawQpuJoHUqMfPPh5vGL7KD5R/AbJGhdTzTMne37j+BW1K6EsVvuNctDHzm+d/v4qjs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZLvzmMDm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MV1AzmeA; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62J5XqPL3732518
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Mar 2026 06:00:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JuEIJo+d4oizJgAZbWxI05x+ea+KqPWOtAOdMUPV5/o=; b=ZLvzmMDms0B1uGol
	fXvJ3oGOsqJ6/LFZvTUNlB8oTKmjcU64vpYakJ1QVaDqF4nNjeYn0aBVCRyxoBf8
	Y/hh7aUIXlNSU3YMl8OM+f4nBZuNA10Hp4KR1MLntYuMVTdOi/HOald9jg7eEjos
	DNM0iKZAH5hjYSHeX8FILT77bh291zRSMxfywxM5XbVHo8phAZ9YG1UCirTfqLtt
	Nov5I8DTowy1Cj9taXZzJueWo/t87FNUuJlF+gQiGo7qZTMIaIVhJyRnKcUFpfbA
	NJKowdSvDTRtWuVz28r7wRF5A3evH+uxkyNYCZYwBnXdKw3B9OMWMGuGzbR854xL
	axqpsw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cyut1b80j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Mar 2026 06:00:15 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-509114d7418so7225911cf.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 18 Mar 2026 23:00:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773900014; x=1774504814; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JuEIJo+d4oizJgAZbWxI05x+ea+KqPWOtAOdMUPV5/o=;
        b=MV1AzmeAMGgPfi6Lp1iUKrWXSt2H4nHMogYV4HeX499PVXcoh4dZploKbgU00eqVs/
         uCQQnprXUOk44fydonAe+usK3Coivm4wv1EdwJ0vcDWxUM7YWVDBAbq2GSz9M9f6lELs
         qNsnpwmw1W8lVt/RozjTkDZW1IZsTHjo984OEBHsWmcKC8XVp2xqYGSUWuKEgLQAkQ5f
         SIst58YNjN8+xEQ21uSjjA/5tEcn16mhr1pqs0t974X/cIsx2Wgg0AV1K1qSw8a41t78
         KxKEMcsQDBd8T9pAkX8piCm8C/45ZBtG672hWVjaAQDdfBPD1zgqrNXmRvzNF/lLXsAE
         IEVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773900014; x=1774504814;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=JuEIJo+d4oizJgAZbWxI05x+ea+KqPWOtAOdMUPV5/o=;
        b=kdpzlBbYOAaa6PXYpmLw9dm2B5Jn8UJnCgilI4PTX59WPdEtRsbJews3pjTB8TRdBS
         XZs4VcmtlwJGP6D7nfK7ORpAe2Y2ZYI+4+zUG19s3O89B28WBg/5Mqt7woFcFgW0l5VD
         Sq3AyQ2Y3PKmetSgjR1b7pO4VJ+Xv9f+mzabuhcMaN3O7EJnBAQF7go6b2DZfquTlMxe
         pfU9qUqW7Oz0GF8Q4Mg8sXQt/TtXYQ6UvC6us6/o8wO7yy8z4JdR9u3nZvUgmmC1hVTS
         nsHUxKHNhchx8v/HKdvp7Ovu5mi/64YunkXDxh8sfU+RZXcv29x3gdK/aJWMKFdpiu93
         pPSw==
X-Forwarded-Encrypted: i=1; AJvYcCWpCooqXxr2NoQFmjbORVfAZ7B0DoSMZQupGAEmoq+wTR8Ygt1Qv9tNCSqXDTVLFSEW7faumJwBMHPWirjz@vger.kernel.org
X-Gm-Message-State: AOJu0YwRha1rqQGuTpx2PNS0eOnqANl+DyZK2QE7SI0GiZw6RKmFWAyH
	j5Bn+W6gEjj5sCL0ssRrcvrON8dxP8MISBJZVg6MqAITERchUo31D0UesEdLgQSpRyqriyNVE5Y
	2khz/wqTbhHmkoIG92zkxMBHhBRahCzqeYehZaf8NNkh23Ss3NdA8/4vjm8biWC6uaL9l
X-Gm-Gg: ATEYQzzVq0P8fOlUecR+9z1sGUY+zFoDD0UgqFH4fxWZ1Of1orQBfs8LjJFSwWzYetq
	jdSgkZRYXDyEiB2NHpy6RHEz5WZxkUnWimq9YH87F4gY74VsfvbgjKLcQlHiH6q3DcA7kbFL6vu
	tEz17O/qz81eGAF48ewxUuJKQ6xXPwtr9kqTx3+SQz1QL2KQIHXcMNppeZzlS78uWIqQoHE4sPo
	+4KJXu1pk6cixy0KkDW6QhXOc7Mq01NuPoB9UUjhh9dlrByc1TMm+zbwfNSV2qlDx4AiBSpjfp0
	+jpuOTLJxhTbnbjD3RFPjXkvP8M+Id16ULGt7C86AZd3fo5hAm6lRYosE5Ajt5F5FDDa033oCbt
	yLA8i5r+F4glCpFbJcZz6CuGp7oPfhFCnh1OG1TzXu3GY+9G2NRSMnQT6tR02ivg9eit8bO6i9x
	lXOYrocTjU8CL2yjB1fxsPnUxtaxCM29Faq2s=
X-Received: by 2002:ac8:580c:0:b0:509:116c:8e05 with SMTP id d75a77b69052e-50b14858355mr80447941cf.43.1773900014461;
        Wed, 18 Mar 2026 23:00:14 -0700 (PDT)
X-Received: by 2002:ac8:580c:0:b0:509:116c:8e05 with SMTP id d75a77b69052e-50b14858355mr80447071cf.43.1773900013795;
        Wed, 18 Mar 2026 23:00:13 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a279c7415asm993174e87.56.2026.03.18.23.00.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Mar 2026 23:00:12 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 19 Mar 2026 07:59:54 +0200
Subject: [PATCH v8 10/11] media: qcom: iris: use new firmware name for
 SM8250
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260319-iris-platform-data-v8-10-55a9566ebf60@oss.qualcomm.com>
References: <20260319-iris-platform-data-v8-0-55a9566ebf60@oss.qualcomm.com>
In-Reply-To: <20260319-iris-platform-data-v8-0-55a9566ebf60@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1089;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=4aoxx1fP4chm37ZEt9fNlCeGqbvbUox4z5NZsa9woZQ=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpu5DXjp6mcgPxYUZaUZGJb6w4H/rK0HtVezjUg
 d9MHf71q1aJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCabuQ1wAKCRCLPIo+Aiko
 1Q0eB/9eNiUPtigO+hB/uNkBXR4tDu2ASM2HmjUUC68MRW0DnS0IP5QcY1Ape9pSObrOo9Nm5l+
 w6vPU64NYJRwwul68ye8z4rNlWKMSMUUiSMN+7LXmfXSMfNXYgdd8D3IzVx3d7mOEO2so4eClqA
 z/4zrLai2xEVfyXedajX3kNKZOj75rUvqN/F76hvsIEtBubnDSuiY6NMESQscL8gjzIyQtM+Kj9
 uwhycuXskjijtmVB6lVajNeDWF6L3UIAgI+9vn+h8TXe1HRfeC0S45aleIY+Kah/mHom9F4mkuQ
 OgVbVSVy9u2RcQ6a8IF38pxmhDaAqM7KIWRb6n5OSuPs2cSu
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: 7v9XGgxvfY9-YGxDMEUozHOJS-w3uTMO
X-Authority-Analysis: v=2.4 cv=ModfKmae c=1 sm=1 tr=0 ts=69bb90ef cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=nz9G3-SO7wN5dIpBwN0A:9 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: 7v9XGgxvfY9-YGxDMEUozHOJS-w3uTMO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE5MDA0NSBTYWx0ZWRfX8hAxbiSMnGtq
 LegYedzbN6R6PMut2/EICZ1jUwDnZ/i1F37YAvqR+kyy+MkyWTribdX35kp16CeQqpQgVoapvJp
 PyJTkAcTrIQk1IummoJJkK9PvUcXO4LNct/1RjL414IYm8y98W0fRKUG8rpkWF/8WnFMe5qa+Ak
 Dsec5UvsSCtm6V5Mu12KqaXfB6vmpz7JGmQu4c0prewA75FCxEj7T1YaYuMEDrThUq3bzcnpUfM
 Tv9AtksjCSYBMR/+PWa3rzTiTSgXTOyl7pbAsqZKX+K5hbxKhHSizwD65hOcEk0sRr0PT62jJwC
 59MSfedci5axiiWuwwO2bBsC8VHqzNs4wEkwYglELV64RQoF9cQw0nobE3uAngCMQ/o6V7o37x8
 VFNKjsBIq5ogYLFTCIsSXkc6TvCDuLnLIRvDN0sxXK7D2urO06pCYB7a7zCjMaCkPhTqjDzNzaU
 anx7gbx+d76hT6FKspQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-19_01,2026-03-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 impostorscore=0 priorityscore=1501
 lowpriorityscore=0 bulkscore=0 clxscore=1015 adultscore=0 spamscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603190045
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-98636-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 606422C679D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The linux-firmware is providing the vpuNN_pM.mbn firmware for SM8250
since August of 2024. Stop using the legacy firmware name
(vpu-1.0/venus.mbn) and switch to the standard firmware name schema.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_platform_vpu2.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/iris/iris_platform_vpu2.c b/drivers/media/platform/qcom/iris/iris_platform_vpu2.c
index ab2a19aa9c36..692fbc2aab56 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_vpu2.c
+++ b/drivers/media/platform/qcom/iris/iris_platform_vpu2.c
@@ -111,7 +111,7 @@ const struct iris_platform_data sm8250_data = {
 	.opp_clk_tbl = sm8250_opp_clk_table,
 	/* Upper bound of DMA address range */
 	.dma_mask = 0xe0000000 - 1,
-	.fwname = "qcom/vpu-1.0/venus.mbn",
+	.fwname = "qcom/vpu/vpu20_p4.mbn",
 	.inst_iris_fmts = iris_fmts_vpu2_dec,
 	.inst_iris_fmts_size = ARRAY_SIZE(iris_fmts_vpu2_dec),
 	.inst_caps = &platform_inst_cap_vpu2,

-- 
2.47.3


