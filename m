Return-Path: <linux-arm-msm+bounces-100170-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CNkPGc7MxWm5BwUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100170-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 01:18:22 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C03F933D7DE
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 01:18:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9BD013051AB5
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 00:15:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 04E6B23ABB0;
	Fri, 27 Mar 2026 00:15:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BkQKI2eP";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ch8yI/Lm"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1646234964
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 00:15:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774570522; cv=none; b=hk5o6DUsuwLaVTuRH+0LerEgU2mh2G6hI+TXDLtYovAbhqSNnEK2ZRP6NTxinZCq2w8CWTGoasM5p7+JjbliHXnYWZXnxAXaE8Tw5DdHfUCmoGkypLV76ndunCGFvcz43CH3MCaYaQQ4pDMtIHweuPx5w/UufBTZLKtHCkKG2RA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774570522; c=relaxed/simple;
	bh=cDGl0uZ6i5pv8Z8hV4IeFJXQL2XOvg9/tRM5E6JrofE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Zd47sGFLfQvH21koyDGb8yBkEuAyS9YQD9DDQMZcIC5yrYwR0A0AbYb0sckMewu5G1qCZ2ur1btffLKDNGD8mP9Ck6+8gtlMJ659xtwteREe0YIxruR00F1en0KwnWjjjIZ/Nbl1U03av/36AKiP0K6UfJ2Dccb9DmEfS5iWz28=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BkQKI2eP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ch8yI/Lm; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62QIed8Q3341414
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 00:15:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4kDtSY8iHEY7m3Ukm8JBULMqvnEiIsXdddnR6CXPwVU=; b=BkQKI2ePX9jkrdJq
	cS2DPjvKBTTHTet6Viw3M8o04tvFXXrZDFubkakug5j9N7HLvIfnVIttXR0gHh/y
	l3ZhGVcazY2khpjVvwGR4uoiAEreWW+VwlgwHg9+xZi77615yn2fiDKRm9n+z4cp
	HpMwmbLTS1T4dV8hAwCwR8fe7C/xSEmodwgmwuZz4TivAbPWGMEBrA4bO4PjpjGo
	1uIi2pJeyixZRhdaqZQIAY/H6VptI4RfnoUroKLyS3izkuNKjD2qvFZe6lOcuCJL
	P9Rkg1iOxWFa7SHQxGFMZLMBbHamYrzNwLKsPmINvK3jli2sSlfmyPZ2ACYJqK8k
	Afq4+A==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d5a9q0vxc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 00:15:21 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-35ba4bf54beso1513045a91.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Mar 2026 17:15:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774570520; x=1775175320; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4kDtSY8iHEY7m3Ukm8JBULMqvnEiIsXdddnR6CXPwVU=;
        b=Ch8yI/LmoNewIOmW650i0fFsSDaho6SkoxLC7YScVyKYe6DsRDW9gqcCYKs9882o9g
         rjgmdDi6yW2u+UaeCV6IHvZUcQI1/e8wZkWY5E2I2/ExRlqiiTXRpPszfs8HQQwJerAe
         O0kyaSp/WbFPfxu7BuiDppGz3Xby6o72dxktms1CZbmPsvgqNuuG9qTGOOnFZ5LduBMp
         KcwFFPTNiX/1grPOttOlxVTbELLVJ/94E6O4rOBs6FAZXIRI+JOnLKKBh6HKURULZazW
         4l1o8LMWK8mg+6Haa0OKnfWEirT5iDqcVToutFdPGjl1KM/BPNSgZNEt229JPKav8+as
         JzSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774570520; x=1775175320;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=4kDtSY8iHEY7m3Ukm8JBULMqvnEiIsXdddnR6CXPwVU=;
        b=Pv194pz5vjzJmLoQp7Q7ua9uKctvzIcXPCgiPXH8MVbq1ib06b6JgFZB9i4yvWqlOj
         LJdmML2VO+TfzlfipVUh8MPrpUQkqj1xpyZrsgt/9MYeoY+YB/wlwdQQ1MolyOlaYD/K
         u8WBhBRO8PV223f4YfrVGKlaxWoXXOQAlGTIHTetHs7wy2lV14+2oq1wTXGO4zlLpw/3
         D3pI1pP/m/e1DbS6NSyFanvbv4/qfs7o6gCIlp5YxDRxiTEjbbSIunAzz8rRZQIOeXpX
         0mRJA9wz5faiquTb4LUUAc+56VCab+WVeb30nJKckP4B0IZxWnFbkLDLcm/PIdCsuXil
         9BCg==
X-Gm-Message-State: AOJu0YzapN7tFU8RiHwZYxnJa15/8e6518Tjyx3AVXsiS8ScA2JGCGfv
	Zck0REkMGZc3+qLkuFiu4KRLrgoHlRlVIXP+CMC1y/BH09PTG/7fGpB2J0bZ5KnWbmS9wt8QOIx
	l9XQU2dyyGNQdLp3NKOZ/k/ZbjFng8sIBSSL4JGhBBiIM7NPFwZmBuhROp4rgVa60Qm7l
X-Gm-Gg: ATEYQzxAzQETF4tJmHl+UJmiLH+RARIeU3myNBtY9W72bh/qTKtZ16tRpbAVYBgKp5Z
	Za8Q2T68qkcrftSbHReELG7O5wym+u6CVc6L0Xz2cS70Mb9cBxp5KJuudzibE/IPaa/dy/BXHlj
	o8/7YB1wp79DPlxvUkIncG/3nAXWI4ZKuYijFAPEmdsI3fyN1YNIeE7pWuRxIDfuAsvvOx1wY76
	1j8OHEzkjzgWd4+yg5hQYTbj1n803ruhnXvMW3+P7d0Q54djA5Cgde3Q7F6184cwYoSg8fWjkCx
	GdWuChZgxMkK00pyx6nKNXRNPwfrUhXyr47uXMi0c2fGxGYxNsz4mm7QZmb0TER2xRv6u0D3J2F
	ULrV1CHVolYtMx5Sw7wMRQVf2Kl0g6MIecBqdewzclOZkgA==
X-Received: by 2002:a17:90b:4c8b:b0:354:c593:b1a8 with SMTP id 98e67ed59e1d1-35c2ffa93e7mr556485a91.13.1774570519584;
        Thu, 26 Mar 2026 17:15:19 -0700 (PDT)
X-Received: by 2002:a17:90b:4c8b:b0:354:c593:b1a8 with SMTP id 98e67ed59e1d1-35c2ffa93e7mr556422a91.13.1774570518865;
        Thu, 26 Mar 2026 17:15:18 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35c2ec799eesm163155a91.10.2026.03.26.17.15.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Mar 2026 17:15:18 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Fri, 27 Mar 2026 05:43:57 +0530
Subject: [PATCH v2 08/17] drm/msm/adreno: Coredump on GPU/GMU init failures
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260327-a8xx-gpu-batch2-v2-8-2b53c38d2101@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774570466; l=4176;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=cDGl0uZ6i5pv8Z8hV4IeFJXQL2XOvg9/tRM5E6JrofE=;
 b=KuwoFLu8wFJBzBvS5WU+a3ua508Y1HlGEvylT+oTxL8oSjs2seOL0RsQs2vvZVmZCs8OMEuwH
 c5qpp9fSiY6DYgovCfhkpMyIYU7YedArZTHe6XQYMlniAHtntGpDC3P
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-GUID: _OGxMOWcIhLAc3oMimfuM3h2WuJBFz77
X-Proofpoint-ORIG-GUID: _OGxMOWcIhLAc3oMimfuM3h2WuJBFz77
X-Authority-Analysis: v=2.4 cv=J4GnLQnS c=1 sm=1 tr=0 ts=69c5cc19 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=yqx-ntKogz8YgV0l4v8A:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI3MDAwMCBTYWx0ZWRfX5Gm08BfuU9ui
 UquKTUSBcofYkeXZGReUNv71qmDn0JOXQjyn/EZC/92vUAdZz/kRMb5HTbwoAH0GndIMjMpRIFg
 Gw1/2s6nXVYTkoIBfrnYkKbP1gawo0M9/dAY9c+wyGO/KMmOi+hrBYNiRbwrKWauRfnTCB1jxUT
 XF6i/zIeb5Ch6fhqUj4NPKo+cvI4/A/U30LV8o8ztSbw1GzlCRTlMayuxYs5/ODBpDTPUCc/ov9
 7A+oj67MDJ3DYLQuGy8tbQ0VtcVZ4rQfU+8uZyOvwja9Qpy8QpDGxwLyHpkzF4Jcr6WUqNeltn7
 fBR04Oo0pxJE0s1VDdqUBBXdqmpWxxvU69AwB1B7gc1yFiQzKymRSLoQCsRle0ykNly6nAQ3Ecj
 hVpKZqTTSFiAOALFc0icMOJaPldyjiqZC3o2qAprbg/xVdnfv1DFXomve+nvSNmAtUYoI1LugiB
 l9UYIMRW0YQd+P6mkKA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-26_04,2026-03-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 phishscore=0 impostorscore=0 bulkscore=0
 suspectscore=0 malwarescore=0 priorityscore=1501 lowpriorityscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603270000
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-100170-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,poorly.run,kernel.org,linux.dev,gmail.com,somainline.org,ffwll.ch,linux.intel.com,suse.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[19];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email];
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
X-Rspamd-Queue-Id: C03F933D7DE
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Capture coredump on GPU or GMU errors during initialization to help in
debugging the issues. To be consistent with the locks while calling
msm_gpu_crashstate_capture(), call pm_runtime_get(gpu) always with
msm_gpu->lock.

Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c      | 1 +
 drivers/gpu/drm/msm/adreno/adreno_device.c | 5 +++--
 drivers/gpu/drm/msm/adreno/adreno_gpu.c    | 5 ++++-
 drivers/gpu/drm/msm/msm_gpu.c              | 5 +++--
 drivers/gpu/drm/msm/msm_gpu.h              | 2 ++
 5 files changed, 13 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
index 1b44b9e21ad8..916c5d99c4d1 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
@@ -1335,6 +1335,7 @@ int a6xx_gmu_resume(struct a6xx_gpu *a6xx_gpu)
 
 disable_irq:
 	disable_irq(gmu->gmu_irq);
+	msm_gpu_crashstate_capture(gpu, NULL, NULL, NULL, NULL);
 	a6xx_rpmh_stop(gmu);
 disable_clk:
 	clk_bulk_disable_unprepare(gmu->nr_clocks, gmu->clocks);
diff --git a/drivers/gpu/drm/msm/adreno/adreno_device.c b/drivers/gpu/drm/msm/adreno/adreno_device.c
index 4edfe80c5be7..ca5f96e16870 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_device.c
+++ b/drivers/gpu/drm/msm/adreno/adreno_device.c
@@ -105,6 +105,8 @@ struct msm_gpu *adreno_load_gpu(struct drm_device *dev)
 	 */
 	pm_runtime_enable(&pdev->dev);
 
+	guard(mutex)(&gpu->lock);
+
 	ret = pm_runtime_get_sync(&pdev->dev);
 	if (ret < 0) {
 		pm_runtime_put_noidle(&pdev->dev);
@@ -112,10 +114,9 @@ struct msm_gpu *adreno_load_gpu(struct drm_device *dev)
 		goto err_disable_rpm;
 	}
 
-	mutex_lock(&gpu->lock);
 	ret = msm_gpu_hw_init(gpu);
-	mutex_unlock(&gpu->lock);
 	if (ret) {
+		msm_gpu_crashstate_capture(gpu, NULL, NULL, NULL, NULL);
 		DRM_DEV_ERROR(dev->dev, "gpu hw init failed: %d\n", ret);
 		goto err_put_rpm;
 	}
diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
index 785e99fb5bd5..8475802fdde2 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
@@ -391,10 +391,13 @@ int adreno_get_param(struct msm_gpu *gpu, struct msm_context *ctx,
 		return 0;
 	case MSM_PARAM_TIMESTAMP:
 		if (adreno_gpu->funcs->get_timestamp) {
+			mutex_lock(&gpu->lock);
 			pm_runtime_get_sync(&gpu->pdev->dev);
+
 			*value = adreno_gpu->funcs->get_timestamp(gpu);
-			pm_runtime_put_autosuspend(&gpu->pdev->dev);
 
+			pm_runtime_put_autosuspend(&gpu->pdev->dev);
+			mutex_unlock(&gpu->lock);
 			return 0;
 		}
 		return -EINVAL;
diff --git a/drivers/gpu/drm/msm/msm_gpu.c b/drivers/gpu/drm/msm/msm_gpu.c
index 995549d0bbbc..472db2c916f9 100644
--- a/drivers/gpu/drm/msm/msm_gpu.c
+++ b/drivers/gpu/drm/msm/msm_gpu.c
@@ -361,7 +361,7 @@ static void crashstate_get_vm_logs(struct msm_gpu_state *state, struct msm_gem_v
 	mutex_unlock(&vm->mmu_lock);
 }
 
-static void msm_gpu_crashstate_capture(struct msm_gpu *gpu,
+void msm_gpu_crashstate_capture(struct msm_gpu *gpu,
 		struct msm_gem_submit *submit, struct msm_gpu_fault_info *fault_info,
 		char *comm, char *cmd)
 {
@@ -886,7 +886,8 @@ void msm_gpu_submit(struct msm_gpu *gpu, struct msm_gem_submit *submit)
 
 	pm_runtime_get_sync(&gpu->pdev->dev);
 
-	msm_gpu_hw_init(gpu);
+	if (msm_gpu_hw_init(gpu))
+		msm_gpu_crashstate_capture(gpu, NULL, NULL, NULL, NULL);
 
 	submit->seqno = submit->hw_fence->seqno;
 
diff --git a/drivers/gpu/drm/msm/msm_gpu.h b/drivers/gpu/drm/msm/msm_gpu.h
index 666cf499b7ec..eb5b3a7b81f9 100644
--- a/drivers/gpu/drm/msm/msm_gpu.h
+++ b/drivers/gpu/drm/msm/msm_gpu.h
@@ -747,6 +747,8 @@ static inline void msm_gpu_crashstate_put(struct msm_gpu *gpu)
 }
 
 void msm_gpu_fault_crashstate_capture(struct msm_gpu *gpu, struct msm_gpu_fault_info *fault_info);
+void msm_gpu_crashstate_capture(struct msm_gpu *gpu, struct msm_gem_submit *submit,
+		struct msm_gpu_fault_info *fault_info, char *comm, char *cmd);
 
 /*
  * Simple macro to semi-cleanly add the MAP_PRIV flag for targets that can

-- 
2.51.0


