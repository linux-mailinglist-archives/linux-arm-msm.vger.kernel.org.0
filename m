Return-Path: <linux-arm-msm+bounces-100166-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wKiPL1/MxWnNBwUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100166-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 01:16:31 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 489FF33D75D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 01:16:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BEE4C30488D9
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 00:14:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6995DE571;
	Fri, 27 Mar 2026 00:14:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FRXC9saY";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TULNUqJb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EFFA1A9FAF
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 00:14:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774570499; cv=none; b=HcCJAJu/ETIrvUE22J/My4bYrxjkyUWyH44+XRU/foP5tiKzptAH13wUyX6g/pTrVZgtiXf/My/Zod+JpPES2oBetkMHVu4A3tG8XQTiFYCcnQKQk3CrVWh48gRgkj3KFXP1JRiOHztygW7K5MECKUW0mwThTkAxzPR3Xr1PEd4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774570499; c=relaxed/simple;
	bh=hO+tlaP9kUuhCPlMZ4rX5r+rbJqELgijDL/FNh3qLxI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=K1PLAMM1cGeEtTrAfkMhUQbZUZGcM/b/6lPXgVyrJ6Y2PVF4WvEPI86sRCNtPn74lsJLGcek9RrOjD4pA9XRW6K9jI0BOU5f5M4UGyMFoMIpM8b/PHK3Xbx0gSGjQn2oSbBx00TxYguLWa0h0bIL/bcINueCP65qN7HrQ3Eh2ww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FRXC9saY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TULNUqJb; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62QJul2b3076223
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 00:14:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0IHyaMl4RjylqIprsqHQxbLvzlvJXxYU0f//3lLX3fI=; b=FRXC9saYRLYoZj8J
	n9NZCUoOMUVQzHozBLTaH2Zgk9pFeKpqiXzdAanXMMitnw3LR8aTNKly623ZKozN
	oDQS9xdyZCo+Lnq1rWWQ5kCRou03wit2aEMQCbLzW1qtIp3jSoX1jOv0XtEfFFF1
	0A3YsZYYjHOmKd9HgHKFnCb2/2RuYtM7HaijPtdKgPMMYv+XKIzRNJlkldTJOJhy
	MAW6DjMhCtsryYhLMK5ZJwm2mZHPIs7b/gi2gbdM3Dnimtnwt03HBl6EzkybUu9S
	WKdmEqikaioc9CzBJ/8Y32vSFbTfpyTLf6BimpZARUv8LQ7F/xWhnD2RlhAXiywB
	LF7zmA==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d5bd8rmxx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 00:14:57 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3595485abbbso2166531a91.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Mar 2026 17:14:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774570496; x=1775175296; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0IHyaMl4RjylqIprsqHQxbLvzlvJXxYU0f//3lLX3fI=;
        b=TULNUqJbraaY6UcPsTjQHhdPEXITD/3eOUCIOWa9eR0p1NSuO599+pvuwkua9kwK0z
         sX/cbDm8vWvVpu0oGayKAzwhZr3dsTOpYzrDUJQtkXe5MbMQ5c5VEBceyb98iBxxg08n
         aA9iGDSlO7HtPw2HK88borRgJVKf2WgE8iteZZVMYKjGgc7GOlkijBGQJYGTWBLUYgFG
         MrMQ0RBW+iimksrngWUxnA0O48dDHrWA6THiCYoygXErfdfqaYTKtOpmXkvGCbpMcXZC
         C5QndUU8YyJcjB2iObeOwYVAy9j/678RgthtvAVggC5tUp/zDSxX4gD3eGYVLp4JrTwg
         D8xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774570496; x=1775175296;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=0IHyaMl4RjylqIprsqHQxbLvzlvJXxYU0f//3lLX3fI=;
        b=V7H5vHtOEYG8XcXwB188EaKbf0X6+cbuLN+O24ZwRIhNPLBsAaddLCpAEPpQn2m/3p
         +SPPllUhPGFn8rqLUjp39ZPNQZS73r0WzXJGpscENWey47YrgvvZbLcvoUPXxn6KIX1N
         BW+/p9UTwuarbpwCSLoPrSx1XgJnblWaEAVj+Tt10O67NDgreoTQFa5ssSE3yetGqvwW
         y67QYNeV1zPt8BVT9y8Ah3tl6UFYivaSwLi0aWS2W8U8Id9nHLcsieOLgGaAejgsdUoh
         u/z16fGMAOju6wqaQoicekv9cX3XgVag7SjlWN8P82vXhA6S4kRKIyypG9wBf//HZouR
         TS6w==
X-Gm-Message-State: AOJu0Yyr09gjIhG7JjvcMKJma1UqtRvcaGbU59rZ0hfjGkPI8QGmncYX
	mJCO/g29YtwsVbkSgEJxJB5/Q84qr3t+xNiy6wWd1cuSojWApYQlGFFMe4n4C6V43qP3kI8BKHq
	YQ04sZv8lIA6jaMIjzswPizhuO2qpMesiJJtTetNJChNhrt2+cY+gE0tP5q8YvPQT2S/W
X-Gm-Gg: ATEYQzw5cyhuVIcJuDNEIXrmqu00LT2gf55jFH/CgXw9z/8cpQdWIczTbjTPODgGS0z
	2udQSgoyo6Iqqsa5u6DgnkibToXszup+OzMjnlhYqa55xpE7akmlk8R010koShebBuWAO9xr6sR
	fdJNK0W3Ehj/ydvpZhXttjq3l6zieuWIgK4zJDQoIMoXHV1jFmVj14fu5OQ80nXcPeibp/a/gor
	3inEdQno9qSyt3BhqUC20SpZAQ7w7OR6HgfRD5WTgQ1Ga6p7wN4sr7H56O79IaJKyi70f2gIs5Q
	RyoDMejCuRcwooJ7ngLTFMDnQspg0e86G0AMYYP3auqELhlZ6FC8hsrj1jlB2zXeBcbYhCOuEk2
	n2rJ8NY5mdL/uxNwA8IaICvexGEeLgHfAwydTrTjN0xZrWw==
X-Received: by 2002:a17:90b:3fc7:b0:35b:92c1:8a3a with SMTP id 98e67ed59e1d1-35c2ff86566mr573952a91.14.1774570495961;
        Thu, 26 Mar 2026 17:14:55 -0700 (PDT)
X-Received: by 2002:a17:90b:3fc7:b0:35b:92c1:8a3a with SMTP id 98e67ed59e1d1-35c2ff86566mr573943a91.14.1774570495519;
        Thu, 26 Mar 2026 17:14:55 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35c2ec799eesm163155a91.10.2026.03.26.17.14.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Mar 2026 17:14:55 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Fri, 27 Mar 2026 05:43:53 +0530
Subject: [PATCH v2 04/17] drm/msm/a6xx: Correct OOB usage
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260327-a8xx-gpu-batch2-v2-4-2b53c38d2101@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774570466; l=2386;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=hO+tlaP9kUuhCPlMZ4rX5r+rbJqELgijDL/FNh3qLxI=;
 b=JCCRY+wFjZC/dv8RmXTmyHSKxHHivJNqeDPy4Afv4r9gjuOs+Xovo22uISFWIponXY/StqtNm
 nVcxRp/yh25CZn3k15pPBqmr4JskjaJp7L7xIHrdDgai8j3aCvLzxXB
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI3MDAwMCBTYWx0ZWRfX7k3Ec4xit2C7
 LRjkonGpuUepSJ2iYPV5kq2Sv4yc6Uw8GKYBWEzOoos9gRIMVXQbTdsKHZOmCont45UkjX6mYR+
 5Rhvw5slhfjlmY11FibHL+HarbSFxLerB55AC28eTlR2CEQYhg7jcEx0FcG6wnQxYhsQuEcpQcw
 fcfGzFenutR/ZsKf7YrecXqA/RxsQTgeIL+sGqyxLcmoiuDUq5s7ulrgMiXiS3TpmF2Qk2vzmsN
 zl5tWmToVDe1Dmnqi+X534wRTwnFkNhgaO5kjVghY/ospZbbQS1L5f84jZmGtkQUgfeY+r+qoDv
 5dGV53LiJS5i233zo3pGMEuyquZD7G3oj25r+tkEVxYrkeETLsGe8UqC2560iOTOa3kAQF8JQad
 LBZQ7McC2yv9vyqdZhIckqZSrbJIsegSMk74i9LgcbvIyLMD0dHuMPjnlNNvb2epkS8f64PsYJa
 NPeVUBz1gIVKtsqwWtw==
X-Proofpoint-ORIG-GUID: x1crEbPJJMZ9RCwCDf5AHMu69_5ZlcYc
X-Authority-Analysis: v=2.4 cv=BZrVE7t2 c=1 sm=1 tr=0 ts=69c5cc01 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=pGJFX0Yo-_9-baE-uFMA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-GUID: x1crEbPJJMZ9RCwCDf5AHMu69_5ZlcYc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-26_04,2026-03-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 adultscore=0 priorityscore=1501 bulkscore=0
 phishscore=0 clxscore=1015 impostorscore=0 spamscore=0 malwarescore=0
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
	TAGGED_FROM(0.00)[bounces-100166-lists,linux-arm-msm=lfdr.de];
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
X-Rspamd-Queue-Id: 489FF33D75D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

During the GMU resume sequence, using another OOB other than OOB_GPU may
confuse the internal state of GMU firmware. To align more strictly with
the downstream sequence, move the sysprof related OOB setup after the
OOB_GPU is cleared.

Fixes: 62cd0fa6990b ("drm/msm/adreno: Disable IFPC when sysprof is active")
Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c | 5 -----
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 6 ++++++
 drivers/gpu/drm/msm/adreno/a8xx_gpu.c | 6 ++++++
 3 files changed, 12 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
index 9662201cd2e9..690d3e53e273 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
@@ -1236,11 +1236,6 @@ int a6xx_gmu_resume(struct a6xx_gpu *a6xx_gpu)
 	/* Set the GPU to the current freq */
 	a6xx_gmu_set_initial_freq(gpu, gmu);
 
-	if (refcount_read(&gpu->sysprof_active) > 1) {
-		ret = a6xx_gmu_set_oob(gmu, GMU_OOB_PERFCOUNTER_SET);
-		if (!ret)
-			set_bit(GMU_STATUS_OOB_PERF_SET, &gmu->status);
-	}
 out:
 	/* On failure, shut down the GMU to leave it in a good state */
 	if (ret) {
diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index f8cb8b578661..f4b7fc28b677 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -1605,6 +1605,12 @@ static int hw_init(struct msm_gpu *gpu)
 		a6xx_gmu_clear_oob(&a6xx_gpu->gmu, GMU_OOB_BOOT_SLUMBER);
 	}
 
+	if (!ret && (refcount_read(&gpu->sysprof_active) > 1)) {
+		ret = a6xx_gmu_set_oob(gmu, GMU_OOB_PERFCOUNTER_SET);
+		if (!ret)
+			set_bit(GMU_STATUS_OOB_PERF_SET, &gmu->status);
+	}
+
 	return ret;
 }
 
diff --git a/drivers/gpu/drm/msm/adreno/a8xx_gpu.c b/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
index 840af9c4d718..fafeac62aebf 100644
--- a/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
@@ -711,6 +711,12 @@ static int hw_init(struct msm_gpu *gpu)
 	 */
 	a6xx_gmu_clear_oob(&a6xx_gpu->gmu, GMU_OOB_GPU_SET);
 
+	if (!ret && (refcount_read(&gpu->sysprof_active) > 1)) {
+		ret = a6xx_gmu_set_oob(gmu, GMU_OOB_PERFCOUNTER_SET);
+		if (!ret)
+			set_bit(GMU_STATUS_OOB_PERF_SET, &gmu->status);
+	}
+
 	return ret;
 }
 

-- 
2.51.0


