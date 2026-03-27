Return-Path: <linux-arm-msm+bounces-100178-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4NE0GfLMxWm5BwUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100178-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 01:18:58 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D6CC533D812
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 01:18:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 124BE30AD4D2
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 00:16:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 947B724677B;
	Fri, 27 Mar 2026 00:16:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="clUJcUTL";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RUrv4HLV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D9E02459E1
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 00:16:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774570569; cv=none; b=M0D3F3ZvG272dZN57WQGd0ggDIlq8HNsDN85VWfzYwVt67d37dQKz4HPY34vD97z4IgdUbd6fa2byH1P6tFTG4Ycb5w5OYOdyiTlRcapltfIPRSfLqF6GruJ1NUz0scUf2QSPdByDaLe4QHj9tUpe9lfSxSu3HUaAr4DA+3DPuQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774570569; c=relaxed/simple;
	bh=xUiKo1yj6GLcQVb+vkBst3BMjf309OP8s++yQjsuSJc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=IVub8zx7idV/sDUp6aBJsjjgmv9D/Xs0td4MT4REY19GEbA9D9UGYrSgtSlaDw+MYOjM7w/9aVUQbvlcc1BhGV3GpOtZdWJMwPkw8smKhMDXgzWjkCQERibEO7Q4SdqIqyjbOnACOtOT+DErsls/fsGhk6oM0MT7mS0/+gRk71A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=clUJcUTL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RUrv4HLV; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62QI2nNZ3757386
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 00:16:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lVL5O2LZPIVIF6OfH5Vaje2elHwGIQmYJFJtw0KLdVs=; b=clUJcUTLTopvimJY
	Xbuqk1f0yrXUvhwAwNjBilwmUVju4lgaZpx044P6oAgEHZGlSKJjJQeyo/rZBBX0
	W92nCsGgS9YPMlgD18ezRg+rn+0pKA1svpwT1RXdwjeWa1ryCamUWm75ApwbVdKK
	9yy2CLcx5eceQmD0VErNgp9NdLe81xwqW2mr2/HueuC7jhnABhM7OyrWkEluWUXu
	c73XKE/t8CFuiod3U0VyNV/sBmJ/SZK9+KVKu7G6V3gvU6zcb9qFNwf+nsiqPDS2
	47EyEaW2EaCMzxbCPUPbfpZC2QJNkFnPC0Jn5iYU+TfAst37wrMq0onSm9VyuWCm
	wsgaeg==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d59r1920p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 00:16:07 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-354c44bf176so1993482a91.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Mar 2026 17:16:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774570566; x=1775175366; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lVL5O2LZPIVIF6OfH5Vaje2elHwGIQmYJFJtw0KLdVs=;
        b=RUrv4HLVbxRb1hH2d7Ws5BcczCgqX+nFaajh0yE8kxhlrhQMe+dMTEqDpJKereSYF6
         YdSlHxi4YlWIes59YYRsIVY89yRdMysIdtikm/8oCXI/JF3T4ri40s/+mZT/FcwZhy5F
         NM/U4tlLBbC3OmhFFQ1tsplRsFiDU96x6MDY9VAaJj4fl92vIlA6sCgOTUZXmr3m26Zv
         E4/BXTBG5d4rGOg6hCtEJDJG3NK8AXQTu7XA/Ku6S/Ol9A9Zp22A/TA3ac0eJzC+R6Cy
         C6rV4cvvWuBNZQnicNfDeULu5h1fVavSAmz3VVDHhRRH+U+AWqTlFmtfbJi52/vq1e9q
         2xsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774570566; x=1775175366;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=lVL5O2LZPIVIF6OfH5Vaje2elHwGIQmYJFJtw0KLdVs=;
        b=h1GEcv8PvnYjKoMfkmeWx0rHjUqlO3S8HfVJ2pILUPKWz7PWR6pHo6hvkWgYRiXkFv
         /Vat+Ce4EtjAX4NyyeY5szOlUQDV9rJe2OoHh0prr5KZtbzw9TtDbSusbYVJOflGnyQS
         8KP3SPaH1wleAOKx7uUrR608lMd6HgBbAhEuko1+N8aytkjMEh0gq8tx5k+yx3wDW0Jy
         /SMPpLUMcEP5nbL65EzWvvVJiadYRIMiClQwtvFwREOo7SXYJNtHQIaXvQXIanWh3Dcx
         mDu2ZJc0y7cqMhpvik3rK5WLU8Y31KzG8Kbsvql1HLqa4sxI33s/c5y6mVm6tFy4T+p9
         ochg==
X-Gm-Message-State: AOJu0YxVL3Q+94wi9A3hTNgsiQaBH9mrkSnn0tKpYe7uonNr81CMZX4h
	dRrdNjqj0iXXonXuidVo1Vk3RwFOklrolBsVbQJCFAFZAlOt2EAfG4izRgfStEArKHCMBVsFp1Y
	UEd6turVsWkrH+WQ14LX6drO6yaL/uyl25s8A7YwEoF/pgVcenSwPjLPtIGqenMiurmEZ
X-Gm-Gg: ATEYQzztRmPrSDpylhJlzsbQY9XFhhcMmcWYVXXZcq+iVr1bGpwRR04aUrlAgZ+KK5g
	/vq/bs2/LBOjnffnvIVn7KgGJPpfI+kH4f/Uo1+BZ1I16Bc4n/wlooZ7yP1Fd6Y8r5n7A2s80JN
	1jsS6pr7eqxpDa/zLpzA1QEEvNCHxsBcC3LqiTYxGzJhlRSvHgpZTWB+HTm54dn3snEcQ0dd9Yu
	a9IbrMbhEF1VRr6GjRiAPmoFqOub1kSBxKXLpm0H1igDD0kJEP/+STzKvpi9tkoauzzNm+nzwNF
	y9m+bvJXf24/av7Uj/1ao2dF9LslfEVaM8Nkj3Vo578Sic/Xwj5YjRf1OYGuP1x9ViqsbKzaDag
	bA1lkMH6cpXrJ+gGZ5oshqFvU23Pn0q6Mo4osoHa6ruBJeg==
X-Received: by 2002:a17:90b:4e88:b0:35b:a7be:ae47 with SMTP id 98e67ed59e1d1-35c30056d6dmr521785a91.21.1774570566132;
        Thu, 26 Mar 2026 17:16:06 -0700 (PDT)
X-Received: by 2002:a17:90b:4e88:b0:35b:a7be:ae47 with SMTP id 98e67ed59e1d1-35c30056d6dmr521763a91.21.1774570565662;
        Thu, 26 Mar 2026 17:16:05 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35c2ec799eesm163155a91.10.2026.03.26.17.16.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Mar 2026 17:16:05 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Fri, 27 Mar 2026 05:44:05 +0530
Subject: [PATCH v2 16/17] drm/msm/a6xx: Enable Preemption on X2-85
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260327-a8xx-gpu-batch2-v2-16-2b53c38d2101@oss.qualcomm.com>
References: <20260327-a8xx-gpu-batch2-v2-0-2b53c38d2101@oss.qualcomm.com>
In-Reply-To: <20260327-a8xx-gpu-batch2-v2-0-2b53c38d2101@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Antonino Maniscalco <antomani103@gmail.com>,
        Connor Abbott <cwabbott0@gmail.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774570466; l=3858;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=xUiKo1yj6GLcQVb+vkBst3BMjf309OP8s++yQjsuSJc=;
 b=VGy3ovjLVxccFdwgAKShQlB70TPJ3faffqhe/O4EVAuzQXrS+/wdXj5Qom5AcgEa5rUPWaX38
 +4BX/07VUtdDlDBAYFKTGFAhrn9s7RX25l8fbllD2NK/DW0Dmzbxmz2
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI3MDAwMCBTYWx0ZWRfX9yab1yEVgy+J
 V4XCVjGGuBeIlHOt8KRaA7XLX9qPJL1unMlnFy1iOhQ9L67moywtezETmvB0hnOBzUN1XwrhRZO
 Spxs+8JlCBsGpgJ1BzYSCKVvLSWlmOGk5QTqYrfrDUMOaL3wy4k178xbloXh2POrseT/Y0Dwx+6
 VXFeiKJnUhuKciaq2yezTvSQWWNQcN7DirpcyoNmkfghdorQh/I11wTOv2CTcH9efSUhtjnpDiY
 GUwNL0RfIE3W4XkUr1CAYHuVINrU35pGIFtnGY7Fi5ZNOA6PuoftJ4GW7oRiStVI3PCjp38CUwX
 6ofQbxeqeDs+iDdFWqjCNsWnN8AxFHwfymr5VUcR1hKwGr+sM1aXHfGYAx7usRLDWT9T90wGRYx
 Qql6ors2xk8vVCVBIsrBkFuYdFkilDDnweWLk30Isl7nO7bOKM8KfnGzHAIgRpmX2mRayAzKT/R
 Msd2Z/mGrEtUxDSB9YQ==
X-Proofpoint-GUID: 65gbmr7HXi3C4LQfMswQma6KMk-bAM9f
X-Proofpoint-ORIG-GUID: 65gbmr7HXi3C4LQfMswQma6KMk-bAM9f
X-Authority-Analysis: v=2.4 cv=JaCxbEKV c=1 sm=1 tr=0 ts=69c5cc47 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=PN0yGgm3WGXANvjD27MA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-26_04,2026-03-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 phishscore=0 bulkscore=0 malwarescore=0
 lowpriorityscore=0 spamscore=0 impostorscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603270000
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-100178-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,poorly.run,kernel.org,linux.dev,gmail.com,somainline.org,ffwll.ch,linux.intel.com,suse.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[19];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[akhilpo@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: D6CC533D812
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add the save-restore register lists and set the necessary quirk flags
in the catalog to enable the Preemption feature on Adreno X2-85 GPU.

Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_catalog.c | 42 +++++++++++++++++++++++++++++++
 1 file changed, 42 insertions(+)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
index 21f5a685196b..550ff3a9b82e 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
@@ -1761,6 +1761,44 @@ static const u32 x285_protect_regs[] = {
 
 DECLARE_ADRENO_PROTECT(x285_protect, 15);
 
+static const struct adreno_reglist_pipe x285_dyn_pwrup_reglist_regs[] = {
+	{ REG_A8XX_GRAS_TSEFE_DBG_ECO_CNTL, 0, BIT(PIPE_BV) | BIT(PIPE_BR) },
+	{ REG_A8XX_GRAS_NC_MODE_CNTL, 0, BIT(PIPE_BV) | BIT(PIPE_BR) },
+	{ REG_A8XX_GRAS_DBG_ECO_CNTL, 0, BIT(PIPE_BV) | BIT(PIPE_BR) },
+	{ REG_A6XX_PC_AUTO_VERTEX_STRIDE, 0, BIT(PIPE_BV) | BIT(PIPE_BR) },
+	{ REG_A8XX_PC_CHICKEN_BITS_1, 0, BIT(PIPE_BV) | BIT(PIPE_BR) },
+	{ REG_A8XX_PC_CHICKEN_BITS_2, 0, BIT(PIPE_BV) | BIT(PIPE_BR) },
+	{ REG_A8XX_PC_CHICKEN_BITS_3, 0, BIT(PIPE_BV) | BIT(PIPE_BR) },
+	{ REG_A8XX_PC_CHICKEN_BITS_4, 0, BIT(PIPE_BV) | BIT(PIPE_BR) },
+	{ REG_A8XX_PC_CONTEXT_SWITCH_STABILIZE_CNTL_1, 0, BIT(PIPE_BV) | BIT(PIPE_BR) },
+	{ REG_A8XX_PC_VIS_STREAM_CNTL, 0, BIT(PIPE_BV) | BIT(PIPE_BR) },
+	{ REG_A7XX_RB_CCU_CNTL, 0, BIT(PIPE_BR) },
+	{ REG_A7XX_RB_CCU_DBG_ECO_CNTL, 0, BIT(PIPE_BR)},
+	{ REG_A8XX_RB_CCU_NC_MODE_CNTL, 0, BIT(PIPE_BR) },
+	{ REG_A8XX_RB_CMP_NC_MODE_CNTL, 0, BIT(PIPE_BR) },
+	{ REG_A6XX_RB_RBP_CNTL, 0, BIT(PIPE_BR) },
+	{ REG_A8XX_RB_RESOLVE_PREFETCH_CNTL, 0, BIT(PIPE_BR) },
+	{ REG_A8XX_RB_CMP_DBG_ECO_CNTL, 0, BIT(PIPE_BR) },
+	{ REG_A7XX_VFD_DBG_ECO_CNTL, 0, BIT(PIPE_BV) | BIT(PIPE_BR) },
+	{ REG_A8XX_VFD_CB_BV_THRESHOLD, 0, BIT(PIPE_BV) | BIT(PIPE_BR) },
+	{ REG_A8XX_VFD_CB_BR_THRESHOLD, 0, BIT(PIPE_BV) | BIT(PIPE_BR) },
+	{ REG_A8XX_VFD_CB_BUSY_REQ_CNT, 0, BIT(PIPE_BV) | BIT(PIPE_BR) },
+	{ REG_A8XX_VFD_CB_LP_REQ_CNT, 0, BIT(PIPE_BV) | BIT(PIPE_BR) },
+	{ REG_A8XX_VPC_FLATSHADE_MODE_CNTL, 0, BIT(PIPE_BV) | BIT(PIPE_BR) },
+	{ REG_A8XX_CP_HW_FAULT_STATUS_MASK_PIPE, 0, BIT(PIPE_BR) |
+		BIT(PIPE_BV) | BIT(PIPE_LPAC) | BIT(PIPE_AQE0) |
+		BIT(PIPE_AQE1) | BIT(PIPE_DDE_BR) | BIT(PIPE_DDE_BV) },
+	{ REG_A8XX_CP_INTERRUPT_STATUS_MASK_PIPE, 0, BIT(PIPE_BR) |
+		BIT(PIPE_BV) | BIT(PIPE_LPAC) | BIT(PIPE_AQE0) |
+		BIT(PIPE_AQE1) | BIT(PIPE_DDE_BR) | BIT(PIPE_DDE_BV) },
+	{ REG_A8XX_CP_PROTECT_CNTL_PIPE, 0, BIT(PIPE_BR) | BIT(PIPE_BV) | BIT(PIPE_LPAC)},
+	{ REG_A8XX_CP_PROTECT_PIPE(15), 0, BIT(PIPE_BR) | BIT(PIPE_BV) | BIT(PIPE_LPAC) },
+	{ REG_A8XX_RB_GC_GMEM_PROTECT, 0, BIT(PIPE_BR) },
+	{ REG_A8XX_RB_LPAC_GMEM_PROTECT, 0, BIT(PIPE_BR) },
+	{ REG_A6XX_RB_CONTEXT_SWITCH_GMEM_SAVE_RESTORE_ENABLE, 0, BIT(PIPE_BR) },
+};
+DECLARE_ADRENO_REGLIST_PIPE_LIST(x285_dyn_pwrup_reglist);
+
 static const struct adreno_reglist_pipe a840_nonctxt_regs[] = {
 	{ REG_A8XX_CP_SMMU_STREAM_ID_LPAC, 0x00000101, BIT(PIPE_NONE) },
 	{ REG_A8XX_GRAS_DBG_ECO_CNTL, 0x00000800, BIT(PIPE_BV) | BIT(PIPE_BR) },
@@ -2082,11 +2120,15 @@ static const struct adreno_info a8xx_gpus[] = {
 		.inactive_period = DRM_MSM_INACTIVE_PERIOD,
 		.quirks = ADRENO_QUIRK_HAS_CACHED_COHERENT |
 			  ADRENO_QUIRK_HAS_HW_APRIV |
+			  ADRENO_QUIRK_PREEMPTION |
 			  ADRENO_QUIRK_SOFTFUSE,
 		.funcs = &a8xx_gpu_funcs,
 		.a6xx = &(const struct a6xx_info) {
 			.protect = &x285_protect,
 			.nonctxt_reglist = x285_nonctxt_regs,
+			.pwrup_reglist = &a840_pwrup_reglist,
+			.dyn_pwrup_reglist = &x285_dyn_pwrup_reglist,
+			.ifpc_reglist = &a840_ifpc_reglist,
 			.gbif_cx = a840_gbif,
 			.max_slices = 4,
 			.gmu_chipid = 0x8010100,

-- 
2.51.0


