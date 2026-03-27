Return-Path: <linux-arm-msm+bounces-100168-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KMirE5bMxWm5BwUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100168-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 01:17:26 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id B9F9A33D782
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 01:17:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2F66A30BD985
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 00:15:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0E55F221F39;
	Fri, 27 Mar 2026 00:15:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YCd9dkAp";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jcfLB3KI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DB3C19C542
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 00:15:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774570510; cv=none; b=n5LCTFayFkWAuw8fR0n1gIg4ed/6y0JKRKLaThQ2fvFlgq8c0deL3a/lk+w2/3b0VrbUsuYbs0fa8QsFkXPNypPf429dlYGDHfAWmaZi4Bdf8J6LCDMXwl/E+NTHzq6rxjtkL53r2i1JT9PZ/Cae8+y0R3S9WZ3RPpwgQsbkQHk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774570510; c=relaxed/simple;
	bh=M9qFPBPHvOVkzFgb15PLQYpEYj0jbBPh3xPS4yjPqmw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BIm8eIydAlc3Vemu3BhC+qTLXyURD/fVdWQZhvU3MMCh412DNEqG7xJS0Ltq6tB133Jsuwre+1sSrr+mSMhkK6lpgJMnVuFBnpAeREpXnKuJot6Pwk5WINthlVD7ofnZx3stoba9I5OXl4Cowd7d5tepknPV7Ax/w2pUEcqRrCo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YCd9dkAp; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jcfLB3KI; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62QKY0Jq366433
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 00:15:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xXqAWNz0JnVqrMWKQ5HyyfU+1Bz5ahMZW6TXdTM85Uc=; b=YCd9dkApvJLtvNnP
	e35VRUe12AqIjkWdybT71XzaTa4iV5WbDm47ihqQocIWoMVg6HEO7WGDXqv6BEPw
	6qlg+6tMZbtBrrGugopvE2e6UWXMQ24/Qlfx6flrnbnwypcrqLdoddrQR/CbMxi+
	1NzU+EtbxRi9HgqUncrxPAJ8GkTEL7a7t8YZIZr93j791i514cMlQYVMFF63rODO
	aZygboPYGYOzIqJSSKUCpbcf8N10oE8mVcugsHKaxzFM2DBIbRbbfSvg6LQEflOp
	/RSaLJzLSUrGl8wGLgHgrlrnVRs8WL5/biwOYCV+F2nLsMFs8eE+sjJZI97NFDmK
	5uRA4Q==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d5bxvghpt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 00:15:08 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-35a032cdd78so3241172a91.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Mar 2026 17:15:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774570508; x=1775175308; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xXqAWNz0JnVqrMWKQ5HyyfU+1Bz5ahMZW6TXdTM85Uc=;
        b=jcfLB3KIxoGsRXS1Nbhg9osNsaIlEp/5n7kHnPAFficIjxEF3C7LiJqH0XwRVDYCFv
         GTX6qQnTfzLdf8xn3hc/4lSyWMpmXkgOj/NJT0pQioB1wjhj+hwtXv8MXpK40iJaf0li
         9BVbUL19nxHSA6q6B2Jd4Su2ui1A0P1Xz5d9NHOZM6Dk2tewEJzWsP0aX4SRkDbrlmoq
         fFdMZYCQ2L+ts/+at/Kb2dldSNiUVBgKnuP3NJtUhwsFL4pa+jSu78urg2zzmSlVLrJB
         7WU5ah3HZDuXONzvW56MHEvQdINhJHa2964sT0vA+jMov7hsnGFTVYAlkLUXotFtZCmg
         6HzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774570508; x=1775175308;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=xXqAWNz0JnVqrMWKQ5HyyfU+1Bz5ahMZW6TXdTM85Uc=;
        b=TPEC8bhWlcgE+NLLH0L8iZsUJj9YtCVnKjTuvRQafo23dqbRXx1j4yTc7EhSNvzCzC
         pkKI2/Qck+qPjxoy5Zl535s9d3wI0ZYq/yLiMSoJWGkcjx0v/qRxJWG+PvOS4i4KnDH/
         0uybEqcFt4HxAcXAPwPgWssEqcah1e3OnT6fZAPgA+WlFDhOq9B4CDOj+ARYj8U+0Pek
         v2WRwIxY4m1SoLGvFmmvLGQvvzQ7SnpgD4DKVmvVwfsdTcp9UFq0zUGZ9ls0Yf0Ysc7F
         1XuP1gefGsN/1CFYZfDOlJ+eSp8c06ZI+mMEq2DNBM50yDVbBFAlnpI5EKrFoo/HnvTP
         h49w==
X-Gm-Message-State: AOJu0YyFD6Oe5tE87RS7GIDINvIVrGjQZY43Xjbh7CeM/I5qJvEHeZIr
	OC3JXp8mBO86Ph7XQHYXPezt2dLNBtrkYWGUfLBS6AzLlamergDphlyqDX+3PHHknXZmreOd0w+
	3yLcdTqLSGOiE74OHbNI6Ia0gMhb1Z1Rf4qG2Qv/HDy5TVS7fn6fms/R3XFhSmuXo7Cr1
X-Gm-Gg: ATEYQzyHtQIm3T6u4ghI37/PCmZQmXv8cwMq6k2eCJlNDDovHdvqbKH/LtA08FP45au
	TcSMI7FhT1FjM7xlQP65zyDpL+Z/bRQTYQAkSaxAFoSYFvoHuTCFhhhXD7a2wrh+Ir7DRjSAYWg
	8jjHgGr1BuXoUll6zjzH0fUWIjLRH1XIBK1b+Iq+y8RHwlcZ7jeLUSTo17F/SboTC6x2/qgZaZX
	9JgLPOJ3lxnIi4AKTmBm912eOGKV9Ef1kKQeOtxDVf6yNRStLUKxKPc/bnMDYjKcbJCES8uGJ+9
	nkApm8RT/G48/gBRbi3AILwQpzauQiT9Y0G85R0illYv36U1ySnzqxEaGTEaWkmfLNFDGbJkOqm
	yIYDb4JJqWW8OpryBQC9RiMGt9PEaVwMg25RF9locC0RzBA==
X-Received: by 2002:a17:90b:380d:b0:35c:d98:d684 with SMTP id 98e67ed59e1d1-35c2ff07d39mr491412a91.6.1774570507886;
        Thu, 26 Mar 2026 17:15:07 -0700 (PDT)
X-Received: by 2002:a17:90b:380d:b0:35c:d98:d684 with SMTP id 98e67ed59e1d1-35c2ff07d39mr491362a91.6.1774570507239;
        Thu, 26 Mar 2026 17:15:07 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35c2ec799eesm163155a91.10.2026.03.26.17.15.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Mar 2026 17:15:06 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Fri, 27 Mar 2026 05:43:55 +0530
Subject: [PATCH v2 06/17] drm/msm/a6xx: Fix gpu init from secure world
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260327-a8xx-gpu-batch2-v2-6-2b53c38d2101@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774570466; l=8051;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=M9qFPBPHvOVkzFgb15PLQYpEYj0jbBPh3xPS4yjPqmw=;
 b=QpWl3tj4DUArud0yv+weIy4uWXcGZXZ1GwP1HTdHRcJEBFK548SJIEqz2Cx/OfHB8A4aAYN5+
 H7DD88YxRzJCRpERzZXYJBtL9XIpJ+IQuBSCRXMHiMAZVkmzHaJh6do
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-GUID: LF0S-H5qj8OaR9IKp3MPho-nQ9-sFz2W
X-Proofpoint-ORIG-GUID: LF0S-H5qj8OaR9IKp3MPho-nQ9-sFz2W
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI3MDAwMCBTYWx0ZWRfXzRMGFh5a8ZVV
 JT8z+NJXmJNtGTBfpxzK4KZHxEayWyA2Jo5myyavrseQcWLNxw/eJoOK7AuRrkSmXPJyQZSkHj7
 KBkqXYKoyUPLZ4sHpaVX8j1W6awHMg60HmO7XB9byKrXockQniQalQldP99FaXTQKMIbw8/sz5P
 xEaQ85BrqFm98psrpERXQjOSa/MfzaGmKZorS51Jm8gycCtH6WZlzDTAQcUnO5F/D1uwvjpwJwD
 3UW5uFytF0M6VakoLZD/jyEqiioXQvQjx9rI/dfp5AEmHInjSC6tdmyhMYWAV2Dh7apNw48TqXU
 OO/HTAbyl2Bydvh/Jz6GZHaQQrb2HGRHKZTNncWh5QzP3TSr5nRY+NhZ30K8DnRBrLsBvAIwOvd
 K9rOjQYaPIxVIC4X8KDe6U0YV4mdKt/wVdba9bJGMTdyuRfCm0iKatnnVW1FlL+n099GMvAA1A8
 Rfv0OHw9FvGJHd+1X0g==
X-Authority-Analysis: v=2.4 cv=ToXrRTXh c=1 sm=1 tr=0 ts=69c5cc0c cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=_DJ2r0yCx7h-TLoshVgA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-26_04,2026-03-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 malwarescore=0 spamscore=0 adultscore=0
 bulkscore=0 suspectscore=0 clxscore=1015 impostorscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603270000
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-100168-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,poorly.run,kernel.org,linux.dev,gmail.com,somainline.org,ffwll.ch,linux.intel.com,suse.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[19];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[akhilpo@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: B9F9A33D782
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

A7XX_GEN2 and newer GPUs requires initialization of few configurations
related to features/power from secure world. The SCM call to do this
should be triggered after GDSC and clocks are enabled. So, keep this
sequence to a6xx_gmu_resume instead of the probe.

Also, simplify the error handling in a6xx_gmu_resume() using 'goto'
labels.

Fixes: 14b27d5df3ea ("drm/msm/a7xx: Initialize a750 "software fuse"")
Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c | 93 +++++++++++++++++++++++++++++------
 drivers/gpu/drm/msm/adreno/a6xx_gmu.h |  2 +
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 59 ----------------------
 3 files changed, 80 insertions(+), 74 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
index b41dbca1ebc6..1b44b9e21ad8 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
@@ -3,6 +3,7 @@
 
 #include <linux/bitfield.h>
 #include <linux/clk.h>
+#include <linux/firmware/qcom/qcom_scm.h>
 #include <linux/interconnect.h>
 #include <linux/of_platform.h>
 #include <linux/platform_device.h>
@@ -1191,6 +1192,65 @@ static void a6xx_gmu_set_initial_bw(struct msm_gpu *gpu, struct a6xx_gmu *gmu)
 	dev_pm_opp_put(gpu_opp);
 }
 
+static int a6xx_gmu_secure_init(struct a6xx_gpu *a6xx_gpu)
+{
+	struct adreno_gpu *adreno_gpu = &a6xx_gpu->base;
+	struct msm_gpu *gpu = &adreno_gpu->base;
+	struct a6xx_gmu *gmu = &a6xx_gpu->gmu;
+	u32 fuse_val;
+	int ret;
+
+	if (test_bit(GMU_STATUS_SECURE_INIT, &gmu->status))
+		return 0;
+
+	if (adreno_is_a750(adreno_gpu) || adreno_is_a8xx(adreno_gpu)) {
+		/*
+		 * Assume that if qcom scm isn't available, that whatever
+		 * replacement allows writing the fuse register ourselves.
+		 * Users of alternative firmware need to make sure this
+		 * register is writeable or indicate that it's not somehow.
+		 * Print a warning because if you mess this up you're about to
+		 * crash horribly.
+		 */
+		if (!qcom_scm_is_available()) {
+			dev_warn_once(gpu->dev->dev,
+				"SCM is not available, poking fuse register\n");
+			a6xx_llc_write(a6xx_gpu, REG_A7XX_CX_MISC_SW_FUSE_VALUE,
+				A7XX_CX_MISC_SW_FUSE_VALUE_RAYTRACING |
+				A7XX_CX_MISC_SW_FUSE_VALUE_FASTBLEND |
+				A7XX_CX_MISC_SW_FUSE_VALUE_LPAC);
+			adreno_gpu->has_ray_tracing = true;
+			goto done;
+		}
+
+		ret = qcom_scm_gpu_init_regs(QCOM_SCM_GPU_ALWAYS_EN_REQ |
+					     QCOM_SCM_GPU_TSENSE_EN_REQ);
+		if (ret) {
+			dev_warn_once(gpu->dev->dev,
+				"SCM call failed\n");
+			return ret;
+		}
+
+		/*
+		 * On A7XX_GEN3 and newer, raytracing may be disabled by the
+		 * firmware, find out whether that's the case. The scm call
+		 * above sets the fuse register.
+		 */
+		fuse_val = a6xx_llc_read(a6xx_gpu,
+					 REG_A7XX_CX_MISC_SW_FUSE_VALUE);
+		adreno_gpu->has_ray_tracing =
+			!!(fuse_val & A7XX_CX_MISC_SW_FUSE_VALUE_RAYTRACING);
+	} else if (adreno_is_a740(adreno_gpu)) {
+		/* Raytracing is always enabled on a740 */
+		adreno_gpu->has_ray_tracing = true;
+	}
+
+done:
+	set_bit(GMU_STATUS_SECURE_INIT, &gmu->status);
+	return 0;
+}
+
+
 int a6xx_gmu_resume(struct a6xx_gpu *a6xx_gpu)
 {
 	struct adreno_gpu *adreno_gpu = &a6xx_gpu->base;
@@ -1219,11 +1279,12 @@ int a6xx_gmu_resume(struct a6xx_gpu *a6xx_gpu)
 	clk_set_rate(gmu->hub_clk, adreno_is_a740_family(adreno_gpu) ?
 		     200000000 : 150000000);
 	ret = clk_bulk_prepare_enable(gmu->nr_clocks, gmu->clocks);
-	if (ret) {
-		pm_runtime_put(gmu->gxpd);
-		pm_runtime_put(gmu->dev);
-		return ret;
-	}
+	if (ret)
+		goto rpm_put;
+
+	ret = a6xx_gmu_secure_init(a6xx_gpu);
+	if (ret)
+		goto disable_clk;
 
 	/* Read the slice info on A8x GPUs */
 	a8xx_gpu_get_slice_info(gpu);
@@ -1253,11 +1314,11 @@ int a6xx_gmu_resume(struct a6xx_gpu *a6xx_gpu)
 
 	ret = a6xx_gmu_fw_start(gmu, status);
 	if (ret)
-		goto out;
+		goto disable_irq;
 
 	ret = a6xx_hfi_start(gmu, status);
 	if (ret)
-		goto out;
+		goto disable_irq;
 
 	/*
 	 * Turn on the GMU firmware fault interrupt after we know the boot
@@ -1270,14 +1331,16 @@ int a6xx_gmu_resume(struct a6xx_gpu *a6xx_gpu)
 	/* Set the GPU to the current freq */
 	a6xx_gmu_set_initial_freq(gpu, gmu);
 
-out:
-	/* On failure, shut down the GMU to leave it in a good state */
-	if (ret) {
-		disable_irq(gmu->gmu_irq);
-		a6xx_rpmh_stop(gmu);
-		pm_runtime_put(gmu->gxpd);
-		pm_runtime_put(gmu->dev);
-	}
+	return 0;
+
+disable_irq:
+	disable_irq(gmu->gmu_irq);
+	a6xx_rpmh_stop(gmu);
+disable_clk:
+	clk_bulk_disable_unprepare(gmu->nr_clocks, gmu->clocks);
+rpm_put:
+	pm_runtime_put(gmu->gxpd);
+	pm_runtime_put(gmu->dev);
 
 	return ret;
 }
diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.h b/drivers/gpu/drm/msm/adreno/a6xx_gmu.h
index 9f09daf45ab2..0cd8ae1b4f5c 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.h
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.h
@@ -130,6 +130,8 @@ struct a6xx_gmu {
 #define GMU_STATUS_PDC_SLEEP	1
 /* To track Perfcounter OOB set status */
 #define GMU_STATUS_OOB_PERF_SET 2
+/* To track whether secure world init was done */
+#define GMU_STATUS_SECURE_INIT	3
 	unsigned long status;
 };
 
diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index 8718919c7e19..5cddfc03828f 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -10,7 +10,6 @@
 
 #include <linux/bitfield.h>
 #include <linux/devfreq.h>
-#include <linux/firmware/qcom/qcom_scm.h>
 #include <linux/pm_domain.h>
 #include <linux/soc/qcom/llcc-qcom.h>
 
@@ -2160,56 +2159,6 @@ static void a6xx_llc_slices_init(struct platform_device *pdev,
 		a6xx_gpu->llc_mmio = ERR_PTR(-EINVAL);
 }
 
-static int a7xx_cx_mem_init(struct a6xx_gpu *a6xx_gpu)
-{
-	struct adreno_gpu *adreno_gpu = &a6xx_gpu->base;
-	struct msm_gpu *gpu = &adreno_gpu->base;
-	u32 fuse_val;
-	int ret;
-
-	if (adreno_is_a750(adreno_gpu) || adreno_is_a8xx(adreno_gpu)) {
-		/*
-		 * Assume that if qcom scm isn't available, that whatever
-		 * replacement allows writing the fuse register ourselves.
-		 * Users of alternative firmware need to make sure this
-		 * register is writeable or indicate that it's not somehow.
-		 * Print a warning because if you mess this up you're about to
-		 * crash horribly.
-		 */
-		if (!qcom_scm_is_available()) {
-			dev_warn_once(gpu->dev->dev,
-				"SCM is not available, poking fuse register\n");
-			a6xx_llc_write(a6xx_gpu, REG_A7XX_CX_MISC_SW_FUSE_VALUE,
-				A7XX_CX_MISC_SW_FUSE_VALUE_RAYTRACING |
-				A7XX_CX_MISC_SW_FUSE_VALUE_FASTBLEND |
-				A7XX_CX_MISC_SW_FUSE_VALUE_LPAC);
-			adreno_gpu->has_ray_tracing = true;
-			return 0;
-		}
-
-		ret = qcom_scm_gpu_init_regs(QCOM_SCM_GPU_ALWAYS_EN_REQ |
-					     QCOM_SCM_GPU_TSENSE_EN_REQ);
-		if (ret)
-			return ret;
-
-		/*
-		 * On A7XX_GEN3 and newer, raytracing may be disabled by the
-		 * firmware, find out whether that's the case. The scm call
-		 * above sets the fuse register.
-		 */
-		fuse_val = a6xx_llc_read(a6xx_gpu,
-					 REG_A7XX_CX_MISC_SW_FUSE_VALUE);
-		adreno_gpu->has_ray_tracing =
-			!!(fuse_val & A7XX_CX_MISC_SW_FUSE_VALUE_RAYTRACING);
-	} else if (adreno_is_a740(adreno_gpu)) {
-		/* Raytracing is always enabled on a740 */
-		adreno_gpu->has_ray_tracing = true;
-	}
-
-	return 0;
-}
-
-
 #define GBIF_CLIENT_HALT_MASK		BIT(0)
 #define GBIF_ARB_HALT_MASK		BIT(1)
 #define VBIF_XIN_HALT_CTRL0_MASK	GENMASK(3, 0)
@@ -2705,14 +2654,6 @@ static struct msm_gpu *a6xx_gpu_init(struct drm_device *dev)
 		return ERR_PTR(ret);
 	}
 
-	if (adreno_is_a7xx(adreno_gpu) || adreno_is_a8xx(adreno_gpu)) {
-		ret = a7xx_cx_mem_init(a6xx_gpu);
-		if (ret) {
-			a6xx_destroy(&(a6xx_gpu->base.base));
-			return ERR_PTR(ret);
-		}
-	}
-
 	adreno_gpu->uche_trap_base = 0x1fffffffff000ull;
 
 	msm_mmu_set_fault_handler(to_msm_vm(gpu->vm)->mmu, gpu,

-- 
2.51.0


