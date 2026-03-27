Return-Path: <linux-arm-msm+bounces-100167-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0P5hJIXMxWm5BwUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100167-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 01:17:09 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EDFB333D772
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 01:17:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CC03030AAC76
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 00:15:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A8BD620C463;
	Fri, 27 Mar 2026 00:15:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="c5MQ0Kuv";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Z5n25bA1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51D801F9F7A
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 00:15:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774570506; cv=none; b=iFRZ23VkwsKkdDNa+T6kWJfY22ttfZRSM47V/SxThh2xlu2QQI6lvBIBvcsfnfMh/RGQO7kWU/1qj16JWqAtxT5PzYz4RVcrXp/EED7MdHpo+nhz6wUSVK2TaWUrutkVEPXkPmJ5mm547ansgG4D9FCsxwPHK6xxKYHy6fqRQF4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774570506; c=relaxed/simple;
	bh=8MXC4uVCZYnSPq+0j/p0Zim3j2cYP4dyn83VnAxglXQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=IK9w89KHLeIoUPl/J6K8yJjZVhclY6YooiOz9OFSYwKfebGlQKKoMVF2AEKEziDdkbGF4HhHngKksoEHMFQHvE73C2D9NRhswTrCCYoxaT0z3stHMLLV/BN7N/w9+ngzJuvRsw6w+wWPlR8RMurNq7ZPqApoNj6oLIITsGxB/OI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=c5MQ0Kuv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Z5n25bA1; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62QMCmeg2583764
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 00:15:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	I6qiQZAeAHkMfZaS5U+lM8ZNG+un35OXAMScVQwU+LI=; b=c5MQ0KuvwCOS3yC9
	pPUHgBSDQa8F/ATSZSEp+GZWsMBfzQ3Ob4NFGJN+sEoxvbTXE7r9cYKCqEZw2mNu
	ofYUxpVLEY8oWD2cFAlHdj9P1sB/Dj6rfeM8Xbb6MaFTghMwFZzybV7m0dnGiQt5
	nSGegGpjpWShBZZFcVwsLaCTUZXPYTjbgWQwC2FV/HNQoBi/FJhJDPmVIcXDNmpS
	QRiBV7tWbYOCHl6VCNdvF1KXPSzUkAmg9z8kzbDByj6lK+8F9IGP54ED1NFxuUqT
	LtKNt0lNVl/CFMEYHprOhxbOElDIci+QySZlp5sVSdwJkg0cQFS1xkPwkyDQnOX4
	33PeWA==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d5dd6g92d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 00:15:03 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-35641c14663so2045412a91.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Mar 2026 17:15:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774570502; x=1775175302; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=I6qiQZAeAHkMfZaS5U+lM8ZNG+un35OXAMScVQwU+LI=;
        b=Z5n25bA1mOh9YZd0dyMIMz1wVpaBW0wfLUf7ax9eOPprFAMUOOwlAGilAVye0OzjSL
         CYBbhLd8Bmc8sIPOuZ+lZK429PkqxN/mPiIsnZGwcxV/wioWnUrnHBF1AKMtxlOgLXjR
         ppii16+9s6Wl5fkoKOvBZb8ZZbkSYHRFMiYPRIXmiCyw5LqkhPPHfh0cMdu1OwHtVKrT
         W3FVsMvkb2hGKcq3yWtS0aOEPrxA9TSylajeqdEiP3iOQajMRkDjp0Cc89Io8ts38YFC
         XKki2D5NmrXe2chrGBtmP45wHcoUHJMcN2aaIHsPIvekMdPA5+drN+7kDRkGW23gBLDY
         CKPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774570502; x=1775175302;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=I6qiQZAeAHkMfZaS5U+lM8ZNG+un35OXAMScVQwU+LI=;
        b=KAlbKVnYzWinOYORUuJa70HuezE8dm22Xxaw6RWuhWnla7djmIdoCgQVmddv3AZrFM
         H9YnO05gDgHNUprYaTIA6zSTReFkBPf6S6J1l26/UVm/tR2SjuyMwcSwl7K5j+RzEccU
         HAqQuqCPiBvrnl+WCwcFkNofcVU2hp1K5/g4sQwlLMK1ikHytLDmevY5LSQGA5oObzZN
         CtW6Pg5fQV8EyTLSPqIHR3l1VtgialuxZD7Y+DYBR4h67OX0GYoCawdAlMdgdWghN5gQ
         T5bCpP7te0xtUzUQGQ3ldX4ZBBW3ysN4nHdBoM7FBD8/O5lPnq0otb+6M4R9Z5BrW/1e
         VL+w==
X-Gm-Message-State: AOJu0YyNjggdN0dfmWAM+Rr2sNXwts08azUdBJetzUWDnH0GZbVIG5II
	PMwhT8E6LsFwYqQP9X1lDBAo8JWejVg3D781c+xi1mtoGBgPqVUMhQ2HyeDGlCmyxgKnABBEvGk
	+Q5ZIk41y2PRURkTs8FC0UtUiaO6ew+ZSVQwOesBtEEl6Qx5NCgtluo0KuS+S1UPB9KED
X-Gm-Gg: ATEYQzzjFuJhuGzs9k9puHiv8wUoWui2dzHXz90kT5ecw56R21vLGqQKO9OKu02djIA
	8KY4iRlviah50lyIvxKZpg4GMeDroiIlF5gDHWeOkPyDLMQvSrDvUMDgYVhMHUXBhiWhaMOPJi8
	dfcI1GCJmSOft7+dp2E15e8idYcaANjloEvcGMFvaPo0IEZmHNuOt0tbyff/AOJGngIwXVAG3Rk
	tteYw6OzE2bBY9nG1d5UpLMxFQ9LTrl7tb1hmy3rFw9OZSDSulA9BUgP0YRCtHX6w1Ld8oVPuOm
	HklKMPm8sQFHu4jmdHXJv5OEM1b5Mhvuew6WZkPixNpgsVL9AUS/DsSgwJYU8mew4mLSRWdUjAY
	9laS8OKxLKcg6VTH6iXtuOIZP/otNEhKARk8NPGZeslscoA==
X-Received: by 2002:a17:90b:2d92:b0:359:ff8a:ee47 with SMTP id 98e67ed59e1d1-35c2ffa8018mr458296a91.6.1774570502038;
        Thu, 26 Mar 2026 17:15:02 -0700 (PDT)
X-Received: by 2002:a17:90b:2d92:b0:359:ff8a:ee47 with SMTP id 98e67ed59e1d1-35c2ffa8018mr458268a91.6.1774570501521;
        Thu, 26 Mar 2026 17:15:01 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35c2ec799eesm163155a91.10.2026.03.26.17.14.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Mar 2026 17:15:01 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Fri, 27 Mar 2026 05:43:54 +0530
Subject: [PATCH v2 05/17] drm/msm/adreno: Implement gx_is_on() for A8x
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260327-a8xx-gpu-batch2-v2-5-2b53c38d2101@oss.qualcomm.com>
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
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774570466; l=7113;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=8MXC4uVCZYnSPq+0j/p0Zim3j2cYP4dyn83VnAxglXQ=;
 b=PLqC5LbjwsHG7PtWfu2tcdz27kHyPiJHa6XfLKmpSc9/EDHmEEtHg6g+ZpzdfwOtvay0sCtA1
 EFZR8DwsCAeABB4+uB3Mr6J6yBvPQejCkRL5fQlmM0xlskJ4Zd5cKBO
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Authority-Analysis: v=2.4 cv=NenrFmD4 c=1 sm=1 tr=0 ts=69c5cc07 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=wYauUFJWvglRPmXws0gA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-GUID: Hea0UICr89-0q2DSBl6DaZwUC1d_gazJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI3MDAwMCBTYWx0ZWRfXyo21O9ahBQsc
 RRf18CycZuMKjIkJeCTEHzE64KH2dNRRX42OgrNUTgxgoB/+1NtEdvBHbzfadmj2PsLrhb7SYH2
 ZYdSsq6j1rDyNg4QEssxsY7wWukrLKehKSo5i1XRF6ES4plX2XHzcoLcuh8tG7TD/2z04TWM3oB
 siA9MRUgZQJwqPVHFs8Olk7dqS6cU56PQAcsl2BruqsOhgge0P6aF5oCyV4/JQqK42F6+lKuO14
 gw3xEbEKcQdp5XPV94Bb4NlfJRGwhZcsct0mRWFRZRTWSxZZ6cNeYcyGna3wANAUmgk8V8dLuIS
 9z1BsyMKUG5fsRL9oM/RPUZ4yPHnboGGi6Q1AA+8lVvHfOA2nGmRPxGsTZZxXF6B+8ZG2enmBFb
 jh5bnF31Bt7lir/jOYR5FSutEhANCSftxLhTAedsjX3klqkRvYZxD0k+gA+fwy8XiDpv9CD0NB9
 D7nEAqNtet2D08nkXmA==
X-Proofpoint-ORIG-GUID: Hea0UICr89-0q2DSBl6DaZwUC1d_gazJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-26_04,2026-03-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 priorityscore=1501 phishscore=0 lowpriorityscore=0
 clxscore=1015 suspectscore=0 adultscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603270000
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-100167-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,poorly.run,kernel.org,linux.dev,gmail.com,somainline.org,ffwll.ch,linux.intel.com,suse.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[20];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[akhilpo@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: EDFB333D772
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

A8x has a diverged enough for a separate implementation of gx_is_on()
check. Add that and move them to the adreno func table.

Fixes: 288a93200892 ("drm/msm/adreno: Introduce A8x GPU Support")
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c       | 42 ++++++++++++++++++++++++++---
 drivers/gpu/drm/msm/adreno/a6xx_gmu.h       |  5 +++-
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c       |  6 ++++-
 drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c |  4 +--
 drivers/gpu/drm/msm/adreno/adreno_gpu.h     |  1 +
 5 files changed, 50 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
index 690d3e53e273..b41dbca1ebc6 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
@@ -91,10 +91,10 @@ bool a6xx_gmu_sptprac_is_on(struct a6xx_gmu *gmu)
 }
 
 /* Check to see if the GX rail is still powered */
-bool a6xx_gmu_gx_is_on(struct a6xx_gmu *gmu)
+bool a6xx_gmu_gx_is_on(struct adreno_gpu *adreno_gpu)
 {
-	struct a6xx_gpu *a6xx_gpu = container_of(gmu, struct a6xx_gpu, gmu);
-	struct adreno_gpu *adreno_gpu = &a6xx_gpu->base;
+	struct a6xx_gpu *a6xx_gpu = to_a6xx_gpu(adreno_gpu);
+	struct a6xx_gmu *gmu = &a6xx_gpu->gmu;
 	u32 val;
 
 	/* This can be called from gpu state code so make sure GMU is valid */
@@ -117,6 +117,40 @@ bool a6xx_gmu_gx_is_on(struct a6xx_gmu *gmu)
 		A6XX_GMU_SPTPRAC_PWR_CLK_STATUS_GX_HM_CLK_OFF));
 }
 
+bool a7xx_gmu_gx_is_on(struct adreno_gpu *adreno_gpu)
+{
+	struct a6xx_gpu *a6xx_gpu = to_a6xx_gpu(adreno_gpu);
+	struct a6xx_gmu *gmu = &a6xx_gpu->gmu;
+	u32 val;
+
+	/* This can be called from gpu state code so make sure GMU is valid */
+	if (!gmu->initialized)
+		return false;
+
+	val = gmu_read(gmu, REG_A6XX_GMU_SPTPRAC_PWR_CLK_STATUS);
+
+	return !(val &
+		(A7XX_GMU_SPTPRAC_PWR_CLK_STATUS_GX_HM_GDSC_POWER_OFF |
+		A7XX_GMU_SPTPRAC_PWR_CLK_STATUS_GX_HM_CLK_OFF));
+}
+
+bool a8xx_gmu_gx_is_on(struct adreno_gpu *adreno_gpu)
+{
+	struct a6xx_gpu *a6xx_gpu = to_a6xx_gpu(adreno_gpu);
+	struct a6xx_gmu *gmu = &a6xx_gpu->gmu;
+	u32 val;
+
+	/* This can be called from gpu state code so make sure GMU is valid */
+	if (!gmu->initialized)
+		return false;
+
+	val = gmu_read(gmu, REG_A8XX_GMU_PWR_CLK_STATUS);
+
+	return !(val &
+		(A8XX_GMU_PWR_CLK_STATUS_GX_HM_GDSC_POWER_OFF |
+		 A8XX_GMU_PWR_CLK_STATUS_GX_HM_CLK_OFF));
+}
+
 void a6xx_gmu_set_freq(struct msm_gpu *gpu, struct dev_pm_opp *opp,
 		       bool suspended)
 {
@@ -240,7 +274,7 @@ static bool a6xx_gmu_check_idle_level(struct a6xx_gmu *gmu)
 
 	if (val == local) {
 		if (gmu->idle_level != GMU_IDLE_STATE_IFPC ||
-			!a6xx_gmu_gx_is_on(gmu))
+			!adreno_gpu->funcs->gx_is_on(adreno_gpu))
 			return true;
 	}
 
diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.h b/drivers/gpu/drm/msm/adreno/a6xx_gmu.h
index 2af074c8e8cf..9f09daf45ab2 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.h
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.h
@@ -10,6 +10,7 @@
 #include <linux/notifier.h>
 #include <linux/soc/qcom/qcom_aoss.h>
 #include "msm_drv.h"
+#include "adreno_gpu.h"
 #include "a6xx_hfi.h"
 
 struct a6xx_gmu_bo {
@@ -231,7 +232,9 @@ void a6xx_hfi_stop(struct a6xx_gmu *gmu);
 int a6xx_hfi_send_prep_slumber(struct a6xx_gmu *gmu);
 int a6xx_hfi_set_freq(struct a6xx_gmu *gmu, u32 perf_index, u32 bw_index);
 
-bool a6xx_gmu_gx_is_on(struct a6xx_gmu *gmu);
+bool a6xx_gmu_gx_is_on(struct adreno_gpu *adreno_gpu);
+bool a7xx_gmu_gx_is_on(struct adreno_gpu *adreno_gpu);
+bool a8xx_gmu_gx_is_on(struct adreno_gpu *adreno_gpu);
 bool a6xx_gmu_sptprac_is_on(struct a6xx_gmu *gmu);
 void a6xx_sptprac_disable(struct a6xx_gmu *gmu);
 int a6xx_sptprac_enable(struct a6xx_gmu *gmu);
diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index f4b7fc28b677..8718919c7e19 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -1643,7 +1643,7 @@ static void a6xx_recover(struct msm_gpu *gpu)
 
 	adreno_dump_info(gpu);
 
-	if (a6xx_gmu_gx_is_on(&a6xx_gpu->gmu)) {
+	if (adreno_gpu->funcs->gx_is_on(adreno_gpu)) {
 		/* Sometimes crashstate capture is skipped, so SQE should be halted here again */
 		gpu_write(gpu, REG_A6XX_CP_SQE_CNTL, 3);
 
@@ -2762,6 +2762,7 @@ const struct adreno_gpu_funcs a6xx_gpu_funcs = {
 	.get_timestamp = a6xx_gmu_get_timestamp,
 	.bus_halt = a6xx_bus_clear_pending_transactions,
 	.mmu_fault_handler = a6xx_fault_handler,
+	.gx_is_on = a6xx_gmu_gx_is_on,
 };
 
 const struct adreno_gpu_funcs a6xx_gmuwrapper_funcs = {
@@ -2794,6 +2795,7 @@ const struct adreno_gpu_funcs a6xx_gmuwrapper_funcs = {
 	.get_timestamp = a6xx_get_timestamp,
 	.bus_halt = a6xx_bus_clear_pending_transactions,
 	.mmu_fault_handler = a6xx_fault_handler,
+	.gx_is_on = a6xx_gmu_gx_is_on,
 };
 
 const struct adreno_gpu_funcs a7xx_gpu_funcs = {
@@ -2828,6 +2830,7 @@ const struct adreno_gpu_funcs a7xx_gpu_funcs = {
 	.get_timestamp = a6xx_gmu_get_timestamp,
 	.bus_halt = a6xx_bus_clear_pending_transactions,
 	.mmu_fault_handler = a6xx_fault_handler,
+	.gx_is_on = a7xx_gmu_gx_is_on,
 };
 
 const struct adreno_gpu_funcs a8xx_gpu_funcs = {
@@ -2855,4 +2858,5 @@ const struct adreno_gpu_funcs a8xx_gpu_funcs = {
 	.get_timestamp = a8xx_gmu_get_timestamp,
 	.bus_halt = a8xx_bus_clear_pending_transactions,
 	.mmu_fault_handler = a8xx_fault_handler,
+	.gx_is_on = a8xx_gmu_gx_is_on,
 };
diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c
index d2d6b2fd3cba..7bec4e509d2c 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c
@@ -1251,7 +1251,7 @@ static void a6xx_get_gmu_registers(struct msm_gpu *gpu,
 		_a6xx_get_gmu_registers(gpu, a6xx_state, &a6xx_gpucc_reg,
 			&a6xx_state->gmu_registers[2], false);
 
-	if (!a6xx_gmu_gx_is_on(&a6xx_gpu->gmu))
+	if (!adreno_gpu->funcs->gx_is_on(adreno_gpu))
 		return;
 
 	/* Set the fence to ALLOW mode so we can access the registers */
@@ -1608,7 +1608,7 @@ struct msm_gpu_state *a6xx_gpu_state_get(struct msm_gpu *gpu)
 	}
 
 	/* If GX isn't on the rest of the data isn't going to be accessible */
-	if (!a6xx_gmu_gx_is_on(&a6xx_gpu->gmu))
+	if (!adreno_gpu->funcs->gx_is_on(adreno_gpu))
 		return &a6xx_state->base;
 
 	/* Halt SQE first */
diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.h b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
index c08725ed54c4..29097e6b4253 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.h
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
@@ -82,6 +82,7 @@ struct adreno_gpu_funcs {
 	u64 (*get_timestamp)(struct msm_gpu *gpu);
 	void (*bus_halt)(struct adreno_gpu *adreno_gpu, bool gx_off);
 	int (*mmu_fault_handler)(void *arg, unsigned long iova, int flags, void *data);
+	bool (*gx_is_on)(struct adreno_gpu *adreno_gpu);
 };
 
 struct adreno_reglist {

-- 
2.51.0


