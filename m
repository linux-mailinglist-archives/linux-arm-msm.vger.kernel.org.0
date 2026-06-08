Return-Path: <linux-arm-msm+bounces-111987-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id DD3mAzBSJ2ovuwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111987-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 09 Jun 2026 01:37:20 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9561965B312
	for <lists+linux-arm-msm@lfdr.de>; Tue, 09 Jun 2026 01:37:19 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=OcxQcO1U;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=KHAhOJDT;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111987-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111987-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 96025302817E
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Jun 2026 23:37:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 643F93403F5;
	Mon,  8 Jun 2026 23:37:07 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4971D33F594
	for <linux-arm-msm@vger.kernel.org>; Mon,  8 Jun 2026 23:37:06 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780961827; cv=none; b=XYBprkoKg6WWIkkF3qq1Y/9TF5vL3gU655yUnKy5m3cMVPUuvexpDjuNtAjCLRwEh8v5c2LNeeVr4+2rbvSpLSnbT4RbasdpppzGAeQUsTTJ4D/8HHW5fYAJ9h/QeBPHRVBFK/qaW1KKe/KTswGxCAkx+d8NKAWtKcCxTyNpyHU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780961827; c=relaxed/simple;
	bh=GJtCaUAfxOpYNaqSyjwj+ayQdmU2jUnlbzLJbpgNafQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MS/Y0PBQmbAuQtTDkm32xI0Mv7WaLmanKwwCoxO9543t5RQKuQq3FAarnQbGuZOXfeNZg4CZmRMMZu/kxiHQuTYmCmRROkXijcHoIQ9UtcBmbx+ldhVk3Xsqt/YNk06OQJzCqaAz9jGOdk8bwcX3LOYqslxJ8cv+JTTCWfXeNYg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OcxQcO1U; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KHAhOJDT; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 658NDdm3445253
	for <linux-arm-msm@vger.kernel.org>; Mon, 8 Jun 2026 23:37:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bVpi8do7RhaAMGVQUssy+84jr7LhWyRN9eNu+bS8Oao=; b=OcxQcO1Uuw4e3swz
	NlY3JZyXbDrM1/mfggOBHj3FDiN4DMkx4A+mtKP98hJneL2LOy09+wTlHkmPo1Uz
	QV1Cv+Cc1TQFBDUckHFg2teMioa/Xx4N6P/2fXtBRaFIuFVVkvbN7Y9ORR1NSyW4
	rh3fBPIszwHyLr2ss/49nhIuBwhRkqp8m7rm3rmmsZkov2JBUQgug/YKkyZAYcL3
	Y56MwwAclPQe8X51tMAwfRZgLXg6u20iKFUy4TRMzMn1SmBdhF3iXtpBk7Qu6FB1
	m8xXXKw7Je4fhYGTa5eTKuTwmbhXXJfaG/1nAoFwlRHeTVLCXVtFVJT6Xr234itB
	gEwPsw==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4enun43e4q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 08 Jun 2026 23:37:05 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2bf32259e0eso64684505ad.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 08 Jun 2026 16:37:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780961825; x=1781566625; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bVpi8do7RhaAMGVQUssy+84jr7LhWyRN9eNu+bS8Oao=;
        b=KHAhOJDT57YPme5iV+3a1AicBHWw9FznBt9iji3eBCOXOCgsnClmBrTpt+2nLfWuNV
         lHKKpWRM/TTGTvhzwPus+67LRb1JiOeR43lMSIaQmqx0fC2y/rT1XLfonNuhIUJVglyX
         cUhgmEFABHaxAzm0kcsJ0Kmv1E1PanpqguFXE8kjKdrPPhDEsmhtmPwW+Mx+SMIek/7B
         ZvqPz136htcT7+QI7/qm2XYrPYQrIGfvJth0hRR67tzJcQICBqcaS49iP4iSOIhfUnzf
         0uYVGmhHGDyXFZi8bFeUogX42QcvIsmMaUCU9grOpHz9Rx6q8jhqCrq5Fa8yzZaRwvMd
         R9CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780961825; x=1781566625;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=bVpi8do7RhaAMGVQUssy+84jr7LhWyRN9eNu+bS8Oao=;
        b=Fxb//WYiQ/5AvCsDnXggZlA28+KD2ALo3Dp5qZ0cUAs3eUH9xVzpap6+7yvD4sE3uu
         WhSAbB1e2Kk0LXD5hKVEZlbm4GinZ70jRIBJiSIVi3gIRNF1Nch8MWb1GOkp8hKfIpAe
         AQci6DtKG9BGea2E2n5K5H4LdmlO1aGHXpbk/KVLLWdcjZvDmfRqlkRvfa+wrzTOm+xC
         tuLyUcY2v332SFxwRGvaABbG23LQRADUUMNOhT/nEYGX6a+LXbcnCvNtkdSxGC4wrlw8
         yw7z3fpnUZ306hifz+lRv7Dc8kHghuMqKTHJJI6YfztbKEBlzDtt1X0icvVcCDW+o3Qu
         Kqqw==
X-Gm-Message-State: AOJu0YygwBamv6loJn0jxr5btiTfVNOqw89v+pBTGPO16+Yo50Vr36ih
	4G/hZgj5TOe5YhLrz/e7EkyiVgWcQT9Oih4cibFcZAGmaez/KLBXPfbrTiKAfwla+CicfsFkz7y
	tYo1ooUY9/cjda5U/yJeIkp+D//Ub30hhw9BRSeOpMxp/3TrZUyDJ4bo9dRPw8S43KIPW
X-Gm-Gg: Acq92OFMZ+bIUtkdOWHdZ+QbcGOIo7diW6DCbCxMa2VLtFtaM1zFADVwhGXt4yAyw6O
	8PuvwxgUVEyAKNvvUnrVpyc082p272IuKuufPUQGM1+Kf+K/r9t4STtxiID1LTV2B2LFAroCbCP
	7VQAVeIO1lbIHhqz3+Ueo01TznWsiQQcTRXsoz+d5HwDgAh4t/G8IiMLy+agOgyTnUBAM7pXZmv
	u0yBknnPM/2nyk2URVmDZg6wZRZ4v9Pr4xwVQ4rv6hE0+5UVW/v/xgV4491xQKuSQspormJh74i
	7Ob8J7p48/ivUh3Df8ikGKI10fYjl7Z+MReZTplp7542pH1G3/fEJToFLmlicSAQheVL7kLOrgz
	edmTkKPXj+6aLBMz67MW3m6f17Tnscw7a9e/tmaQUNezMX/Y3FLTRzwkb
X-Received: by 2002:a17:903:228b:b0:2c0:d4a8:85d0 with SMTP id d9443c01a7336-2c1e85ac3e2mr205206855ad.32.1780961824864;
        Mon, 08 Jun 2026 16:37:04 -0700 (PDT)
X-Received: by 2002:a17:903:228b:b0:2c0:d4a8:85d0 with SMTP id d9443c01a7336-2c1e85ac3e2mr205206635ad.32.1780961824482;
        Mon, 08 Jun 2026 16:37:04 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c24edc8ad7sm66206975ad.42.2026.06.08.16.36.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2026 16:37:04 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Tue, 09 Jun 2026 05:06:30 +0530
Subject: [PATCH 2/2] drm/msm/adreno: Add support for A704 GPU
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260609-shikra-gpu-v1-2-9d0e09cab115@oss.qualcomm.com>
References: <20260609-shikra-gpu-v1-0-9d0e09cab115@oss.qualcomm.com>
In-Reply-To: <20260609-shikra-gpu-v1-0-9d0e09cab115@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Aditya Sherawat <asherawa@qti.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780961805; l=1082;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=o+EGLlf37sh89ugeHzfYo4ynac3l8aLtWkmBK6mfyPY=;
 b=WAHARlB/kFp7nJ5bwD9czp03Zj5uOELfpNZuGTQLexVSi0AyrJ8BSNj0HlgSyeHUAjYdqC+yH
 xd/nwL+m396AraiuLibFrrrja0zVM2Gu1nklO/BKVSCdEm7p7eTraOI
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA4MDIxNyBTYWx0ZWRfX+T/H+hWMDmxu
 dAvcwZ8wGwzxYpXVPOGJAzY66vj3p8+m/igENf5zX1oNVvGqwA7/oPWb5ZflB0aFHVqA4pWVuRP
 kU4QmWKQfnBlcKwicECll144UafqcmSI4785imipLv0buktXIpUplv6hvmJB73fmKjhqL/LY11x
 4w0Fnsq4BlUkraXB5irjkVTOUjg0lQel25RC42b0LV0Vzfm95nV/6UKhq8iJyStw5DUZKZm01L5
 W3HYVpIQScTgnfM5hEpE6GyHLAo6NopIFlVhyuhB/4uvJVnOYxqsvRDNluioUUMhaEReO37XIHF
 oq3vCAGlfRwVNXN564I6rHXQq6XqfjdPymWE+rTjPkasM03KWqWyC1vR/XMgXJo0QxbFBGLroTV
 XQHm04t5UBB4dAMYYLtwQYUG14/z9UG4tp3FKlOJLD9RaHhzb6SIw428RyIgatutrORc8+qGP+K
 4QZqV2fG1fBdd2JkCVw==
X-Proofpoint-ORIG-GUID: FHQwv_VZNxRcCDkJOw7MHKNJg6h61WbQ
X-Authority-Analysis: v=2.4 cv=ZY4t8MVA c=1 sm=1 tr=0 ts=6a275221 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=XFVbiEAxaSnpWCc0n_YA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-GUID: FHQwv_VZNxRcCDkJOw7MHKNJg6h61WbQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-08_06,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 adultscore=0 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 spamscore=0 malwarescore=0 bulkscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606080217
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-111987-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[22];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,poorly.run,kernel.org,linux.dev,gmail.com,somainline.org,ffwll.ch,linux.intel.com,suse.de];
	FORGED_RECIPIENTS(0.00)[m:robin.clark@oss.qualcomm.com,m:sean@poorly.run,m:konradybcio@kernel.org,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:jesszhan0024@gmail.com,m:marijn.suijten@somainline.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:freedreno@lists.freedesktop.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:akhilpo@oss.qualcomm.com,m:asherawa@qti.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[akhilpo@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,vger.kernel.org:from_smtp,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[akhilpo@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 9561965B312

From: Aditya Sherawat <asherawa@qti.qualcomm.com>

Adreno A704 GPU found in Shikra is an IP reuse of A702 GPU with very
minimal changes. The only KMD facing difference is the chipid and the
zap firmware which is specified via devicetree.

Just add the new chipid to enable support for A704 GPU in Shikra.

Signed-off-by: Aditya Sherawat <asherawa@qti.qualcomm.com>
Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_catalog.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
index 3e6f409d13a2..2de3ab010135 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
@@ -1454,7 +1454,7 @@ DECLARE_ADRENO_REGLIST_PIPE_LIST(a7xx_dyn_pwrup_reglist);
 
 static const struct adreno_info a7xx_gpus[] = {
 	{
-		.chip_ids = ADRENO_CHIP_IDS(0x07000200),
+		.chip_ids = ADRENO_CHIP_IDS(0x07000200, 0x07000400),
 		.family = ADRENO_6XX_GEN1, /* NOT a mistake! */
 		.fw = {
 			[ADRENO_FW_SQE] = "a702_sqe.fw",

-- 
2.51.0


