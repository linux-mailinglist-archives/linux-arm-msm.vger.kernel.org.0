Return-Path: <linux-arm-msm+bounces-99394-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uIS/A3CiwWknUQQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99394-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 21:28:32 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FDCB2FD378
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 21:28:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E62BC30B4D89
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 20:13:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DD4893DEAF4;
	Mon, 23 Mar 2026 20:13:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="V8Cd9pY4";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UBhGDInc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 930F23E1200
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 20:13:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774296819; cv=none; b=L6elxBcVqbj5WXuzkwhTQ88xqqRaATHLJEa6hH2ssXetmbXPUS3q+bi/xqjhiimo4NFWiepr1UINQLZjjiDBHbtjG6pCnjLD4No8lpTaBEbGY7ifyHmik9q4JJ/ENTC+KZd+nOVey5uATh9PPOXDXrYJMMuBE5tDYb04mkXlzEI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774296819; c=relaxed/simple;
	bh=LD258q8BiZPKjxboZZEHGa5/WJjqvZE6K1YLsrcGhkc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=C/I/ySCzwS2xLyRx6sLYzHY/TsTP4Mjk8rDcKYkQoIAft/DgRvUcjBGiC3bO8i0HaT25CgFfwLT11SIWaCj7fJHHoron7rJRLu6gjZ6sEhwm7Ue0mOBcNgZoXP5RZHEyjgKJKnUudXke3HO3nCIafb1QyWecyQlQ+CuP9clQ4K8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=V8Cd9pY4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UBhGDInc; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62NHqjQ93934869
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 20:13:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5Nx0bvZeW+J5SMSuTF/HVH8X59gK1KW+/QrWtuB3c54=; b=V8Cd9pY4PTTKTHJh
	hyt4Nv7QJjCmTsvKmac/P8ceMJdRg07YbWBu2pSVgIyUB/b/njN9F8thAAPXSUY7
	sRUv9QM1PeRB242hDzKKwkb8r9jpf39j7NMkKlALVb7zpIpM9duB/HbHVXneWmJq
	/mvXWnpwowuRA97Wr9KTkUnYx/8tTR/J1UdWTAzp4sQZBNvv+O/yhH1h3VxhZFjD
	qyDf6J1pJREjZWqXjumv68FBpz9GrXPgHZVf2EtC4UUyurn7v0SZZRcShlGFo9Vr
	BV6TlWbR/aN2+I5262Kxpn/ttgageJW/3qd7GhSiWpfmm7JyEauMcMQnMN7fQAQk
	49/6/g==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d37a0h6kc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 20:13:36 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-82a1436347eso316304b3a.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 13:13:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774296816; x=1774901616; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5Nx0bvZeW+J5SMSuTF/HVH8X59gK1KW+/QrWtuB3c54=;
        b=UBhGDIncF01/x4bLVbxZgya4qXwFqUrbKRcnjPQWxIyLlQsU+cUBEyZqgi7vkPKPhJ
         HF945XMmkeCE1gF1ipgXdcseYICTURkX2yxg4qg3gBV8UAplwWSlc4nOtcdB8NpIPZyP
         J+t5eGJPbW+/qzr3+EzOTrrOzAme0eGmJIIQsKcVgqo7I0XW00+BsIZTCLDWnTzhadV5
         lIPw7bklHxcKmPLEyoxbvU+phERElGZjPicpEP2zHXovALS4RQI5binEkEOe1cKqWq6m
         5Hj+yuOg4SK2dxeSZRyvs9n1eG9QdfNf5ci4Gxwgpod/NzxAq5kzLwCXcuEljMSRqOdH
         yJbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774296816; x=1774901616;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=5Nx0bvZeW+J5SMSuTF/HVH8X59gK1KW+/QrWtuB3c54=;
        b=i1yDvtuxr1UsEDkMORVsO2Gggt19l/bgv2XB2wVKJLhK6XZI766MjvCZAaIbMGr5z/
         RSHFSbxo02bmRO9M9/jOGOvMUHpSQSv9qFzIntg9LkHDxtP0nksxZwrXfBakamp7/6+V
         feHOUJpTBXIqQBO6V5aWH/sak7CEw04eA9S2LuXrJM1MopsPa7uXTKW1S+EbNDOUiMnl
         8lpK8hywSXENiehbsGmDiEonG/xAaQ+ZU27MITMe4v/bTXLSgz3/gdIJIKWLGqibflMi
         atJMGITelBuQ0Il0oUGZOsM8MvZblDFVVxrNp668YIiQyMDRApuwggcbvQulzo+/dgwU
         YrjA==
X-Gm-Message-State: AOJu0Yyww9W4iQnYd/Pd6kgFEj3zamfCm8QMZu9WllXrLKajUNpanwj2
	joHxzzmXlbAv8rEAnreWwVRlynniHBgVSKbMFj6fkg6N+KqcfPAcnmVhWnB1PN0S+DI46Yqe8Uq
	4OmiLO2bKWf9et4c36M4KU2fXwA0SfX2S2x95FZJW+9LN7M8YN21DZUdE/BZXBuNjKM3k
X-Gm-Gg: ATEYQzxu/60oc1RJFGy7bui1cWFIRo/TgotuCWoxHDI4G1DMSlDiHHweqCKLblHa1cM
	Qwmxg4iFShgWWcUezjCUG6Xi6lPJjQ3IgW7wGYLqd91QWAZkj5H4eS5Va+99WmeujpL1F0XceGM
	Ql81lJlbqMphTwsMzJ2+3pzvpn4fFW7eIy4pfEjtU/mQIo1Mrz5oJvpmOQFB+Vpcwhr3pvSOG+I
	5+Tnf1jdjWmOhKrcicfdyEeOCfLSJKa0sz387Bm08Ls8XaTKK8GvRQLkqmC0PBGlQCVyvmAxOHt
	JvFdbxlDLCFfIO2Vn8y+FxEh0ACpQcpECpwDSUNjeraC3WAEIH1JYxG2ow1R6pNuQRRSYqzH5N1
	ZIjU+oSSR0JA7yvRG/Uh4jG9Pvsskix+vGr4QxRSl8ABtIg==
X-Received: by 2002:a05:6a00:3a20:b0:82a:75be:d371 with SMTP id d2e1a72fcca58-82a8c346991mr12354219b3a.29.1774296815947;
        Mon, 23 Mar 2026 13:13:35 -0700 (PDT)
X-Received: by 2002:a05:6a00:3a20:b0:82a:75be:d371 with SMTP id d2e1a72fcca58-82a8c346991mr12354184b3a.29.1774296815364;
        Mon, 23 Mar 2026 13:13:35 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82b0409d148sm9510738b3a.29.2026.03.23.13.13.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 13:13:35 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Tue, 24 Mar 2026 01:42:22 +0530
Subject: [PATCH 10/16] drm/msm/a6xx: Fix gpu init from secure world
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260324-a8xx-gpu-batch2-v1-10-fc95b8d9c017@oss.qualcomm.com>
References: <20260324-a8xx-gpu-batch2-v1-0-fc95b8d9c017@oss.qualcomm.com>
In-Reply-To: <20260324-a8xx-gpu-batch2-v1-0-fc95b8d9c017@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774296753; l=6048;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=LD258q8BiZPKjxboZZEHGa5/WJjqvZE6K1YLsrcGhkc=;
 b=6KkTxybuGhFG4MhRzfOXNucn9U+wGV8/nNzkWUSQhiMxHGniBVMxN4cnk3SHxU9/uhPL0PuvO
 A1QiAsvhfIWANIqqU1fgKZX/XHBSPPkejkcoW/V9X1MMP1LWR2YWQxD
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Authority-Analysis: v=2.4 cv=GIIF0+NK c=1 sm=1 tr=0 ts=69c19ef0 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=BkmLZa_BGXOvOyRCPiUA:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIzMDE0OSBTYWx0ZWRfX1qhwKzaB7OmJ
 ePWrtZvgANeatkTe2JIwpygnQSaoonUmExqGAJjwyiACrrtpn89TlnfKivXAxI9kmdHVryCPcVd
 8kUN4+IrYAuD1LoffZfN+cnuVi1LjDo6aGe5eaZP+RbKw8xvD3tQXe9C6SZPJpKlvuAHZs5+ZOu
 b65Mn/YL1K5j08axt2blq91Nv/vk3+1i+MAcL4KJlj1ZxNw819t2pDHK6F418k29mdsst3zWcDK
 nzdlQJ7SIFm0DN7/BSOF3DuxfXeIAQFSDcTd7lKzEgD3oWdrmtnvuBJD6poWS8RorbuP2sCq7gY
 B4C2TyZqizVDhI4uGXd9RlgZbSxq7JNh/1c4nv/Cg2a/PBeWE9LJ/dDJFCCjDCTJVGYXciNRaKL
 91hyz5rD5OCrZuh2tWZGpDvVYH371N42cxPK2R3zDIpTPNMPXBnQ4iF5kVNStWHSTpLX1SR7a+Q
 yuDbepMbC0h/2SkE7WQ==
X-Proofpoint-GUID: kbQ_qw0YMWpZWP7JSY9mCsv9j3NvRtlJ
X-Proofpoint-ORIG-GUID: kbQ_qw0YMWpZWP7JSY9mCsv9j3NvRtlJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-23_05,2026-03-23_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 malwarescore=0 priorityscore=1501 phishscore=0
 impostorscore=0 lowpriorityscore=0 clxscore=1015 suspectscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603230149
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-99394-lists,linux-arm-msm=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 9FDCB2FD378
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

A7XX_GEN2 and newer GPUs requires initialization of few configurations
related to features/power from secure world. The SCM call to do this
should be triggered after GDSC and clocks are enabled. So, keep this
sequence to a6xx_gmu_resume instead of the probe.

Fixes: 14b27d5df3ea ("drm/msm/a7xx: Initialize a750 "software fuse"")
Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c | 58 ++++++++++++++++++++++++++++++++++
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 59 -----------------------------------
 2 files changed, 58 insertions(+), 59 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
index cd6609bb66fe..61af3b212ba4 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
@@ -3,6 +3,7 @@
 
 #include <linux/bitfield.h>
 #include <linux/clk.h>
+#include <linux/firmware/qcom/qcom_scm.h>
 #include <linux/interconnect.h>
 #include <linux/of_platform.h>
 #include <linux/platform_device.h>
@@ -1174,6 +1175,59 @@ static void a6xx_gmu_set_initial_bw(struct msm_gpu *gpu, struct a6xx_gmu *gmu)
 	dev_pm_opp_put(gpu_opp);
 }
 
+static int a6xx_gmu_secure_init(struct a6xx_gpu *a6xx_gpu)
+{
+	struct adreno_gpu *adreno_gpu = &a6xx_gpu->base;
+	struct msm_gpu *gpu = &adreno_gpu->base;
+	u32 fuse_val;
+	int ret;
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
+			return 0;
+		}
+
+		ret = qcom_scm_gpu_init_regs(QCOM_SCM_GPU_ALWAYS_EN_REQ |
+					     QCOM_SCM_GPU_TSENSE_EN_REQ);
+		if (ret) {
+			dev_warn_once(gpu->dev->dev,
+				"SCM  call failed\n");
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
+	return 0;
+}
+
+
 int a6xx_gmu_resume(struct a6xx_gpu *a6xx_gpu)
 {
 	struct adreno_gpu *adreno_gpu = &a6xx_gpu->base;
@@ -1208,6 +1262,10 @@ int a6xx_gmu_resume(struct a6xx_gpu *a6xx_gpu)
 		return ret;
 	}
 
+	ret = a6xx_gmu_secure_init(a6xx_gpu);
+	if (ret)
+		return ret;
+
 	/* Read the slice info on A8x GPUs */
 	a8xx_gpu_get_slice_info(gpu);
 
diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index cdecd91094c6..cbc803d90673 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -10,7 +10,6 @@
 
 #include <linux/bitfield.h>
 #include <linux/devfreq.h>
-#include <linux/firmware/qcom/qcom_scm.h>
 #include <linux/pm_domain.h>
 #include <linux/soc/qcom/llcc-qcom.h>
 
@@ -2158,56 +2157,6 @@ static void a6xx_llc_slices_init(struct platform_device *pdev,
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
@@ -2711,14 +2660,6 @@ static struct msm_gpu *a6xx_gpu_init(struct drm_device *dev)
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


