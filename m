Return-Path: <linux-arm-msm+bounces-106937-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UJ4wO+7VAWryjwEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106937-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 May 2026 15:13:18 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DF80650EA55
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 May 2026 15:13:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 679B630074F7
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 May 2026 13:02:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 402393E8C45;
	Mon, 11 May 2026 13:01:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eeqTjDuR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="coQeKZUX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEC3E3E5595
	for <linux-arm-msm@vger.kernel.org>; Mon, 11 May 2026 13:01:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778504495; cv=none; b=UPrKqXq0JdF+yCpagBacnqRWyFqYiLK8WBDVFwq32CVDsP6ydmcOBRjTjYJGgjuKIvDhlQGIhzAzWQin1uUHeKrRE518P0XmkwCkMXbJoaMReuAdsmBHb9kO1R03bEidFvyTGsPtT7NqanolUj/7GJkKO69wxEBkoy/iviXfUQ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778504495; c=relaxed/simple;
	bh=CjOeIMd7KHhgBlYgalqgDMr3CrElSHV/LHeYqaaaD9g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=B5DNUVRcfBBOcrsRwr9sYRaobEsl/2jD+t6KgCjNRDLksoCVpJHE5WMeZItfs4XU1skxkOZ5TS6hN28XtF268esGpvJ/vpfXa0H4sDFx1z8OrO3Vk05KXuaOSOrAI4p5bdhT9DU4EGJx65KP5EmHhjS9/fuN3cVVXMR2Thkre0U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eeqTjDuR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=coQeKZUX; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64B9Jh9B654469
	for <linux-arm-msm@vger.kernel.org>; Mon, 11 May 2026 13:01:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=zVhhihIWGcW
	DVKhVXioxlxo4w1o6vj94DNJvO2XJTbI=; b=eeqTjDuRBlJtvff1iwj74lli22x
	ZOr8cSr7/ZfiKBHclS65TbGdaQBfogF0nV9RhjoRhaZJXpHOjtSgB87ennT9kOuZ
	f9to+xxw/DLbHlU957C+Q0eFTXDxSywGWs4ouAwYAxxtnG1mMaOOvH9HhjikIJfm
	JHMidatSp+YwRnSI9OTwpb/p+5ba6cUZU8xLyy/bUSXaCgqcQZpt5ePPEUxM0wII
	5btuZVzMwcaLcf873D1sgkNsG8Jd7R9p2bLVx4gojf56Dmz3xUhnluL5/FgtVNSG
	wCR976KHtpXMkn3oPErzqqSQW+Ssk2ve0qVlWOtwcDerU4TUbxxq2HCrN0g==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e37xu9sq3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 11 May 2026 13:01:31 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2babc42244aso80841575ad.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 May 2026 06:01:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778504490; x=1779109290; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zVhhihIWGcWDVKhVXioxlxo4w1o6vj94DNJvO2XJTbI=;
        b=coQeKZUXbsvEC1cli8tGQupNoPKgImPdvbugjqBFf5rRh7eb8m9P8o4YelymAReUQr
         zmgGhFbJuMM0oZ2HXysB6HY4SH0SC1aBxQSvBpyYP0DvKvTj6aslRBITOubRUwSG7eEa
         Bb/tydFw4Ruiq4L3kMh4lXbAFbrxEKW+qeiTLruqMmwg8s9040UdiWoA+ti7oj8Ripoa
         z1V/MZwStg4WBYBXK2jjrsBTgkzj7iIIf/WTP1feGV5bLkqtZf+u/PuPP1PiffjltBv9
         iV3YYba6gNPdCNsuvbe1cx7NBMSL6qjlQpeCRvp6vPKo3lY/UZ5LuIoc2aUWvdkpzQNJ
         49LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778504490; x=1779109290;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=zVhhihIWGcWDVKhVXioxlxo4w1o6vj94DNJvO2XJTbI=;
        b=r6PQPwxxS+EhLqiOmx/0QgDlT7bSf7/MGOAlMMGQdi818AwqIE/Dv0iR4tyjFhN9pC
         2AdE0k+b50hDy0p55XbpHS4boaVpLG5iwphpR5+ORRRzkYSq+8JwptSWWKrpzadCwZRY
         FissO8b6f7O7NASRG4olif9e9j24Yry+kHzQv7r8vN6XGlMW6zbL8qTu7JwVdolSUa8a
         eggzlnCH7wjhpy+0Zga5OnPO6JMPqvj0PifiK8KTzC4L6atNnUXYBHeSCM1CVQ7fAyZI
         6H0trwcHwPNXafP2eKSA63dKxp1DpMtW8sdA8Aon592SpqCC5SC+1o3S5Yy6uoGMRPFV
         B/oQ==
X-Gm-Message-State: AOJu0YzepgjUMmgiYXmqZZo7A6m/WD8u9XuYdSYOzIX3tUsMrIyShU8D
	dfvUR3uxcHwmSWghx1b1RXUxxrRpZ3biJrCcLxrYhEnD0u4jRh+osjTFR2Wt1RgE1u9TAyeUb4S
	SPzYF2EM2tYjZzp1VXbZ3TGLPBKiI8xqnGcJLHYrt3qNHPrzO+S8zqPc8VJ6vRJrS3hVO
X-Gm-Gg: Acq92OGnDgzMrXbzMmjBLajN3NzvQqGlP254uB/+NYUmMbv9nLkmOh1+53+ruxqBYj9
	SpvpflF3cSYiuBbhBHijeQZiJRqsxN6luKHMX4wAz4lufdlBxWcMamtFmnKLIkXK7JZf/DrQIff
	CoDOw7acqmYH6FqF1u4t2CGGpnuMrD1cVnidIsMdVedClPgtvEH+fiGgkZvSj/5I3/gOjz0nIwF
	APU5DTNS+yTb+ZQ7Pcu2B7dj/y98lq+6aKuP26NVbDco2eFNnCnNyhjFD5ecvLkTl+Kv4Ix/eKy
	OLAziCQrSnPbuVi2VEhDulBi2h7AAQ2wA5CML35YshSLgJA5+XyrKzC0g+g1qpYXC5ejylo+FkM
	z8YksokHB3Uadvwa4rPyBuA4i0nJzxhTF
X-Received: by 2002:a17:903:280e:b0:2b2:50e1:f104 with SMTP id d9443c01a7336-2ba78f63defmr184146605ad.3.1778504489591;
        Mon, 11 May 2026 06:01:29 -0700 (PDT)
X-Received: by 2002:a17:903:280e:b0:2b2:50e1:f104 with SMTP id d9443c01a7336-2ba78f63defmr184145755ad.3.1778504488598;
        Mon, 11 May 2026 06:01:28 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:4ec8:83f5:8254:6891])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2baf1d2700dsm107146375ad.2.2026.05.11.06.01.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 06:01:27 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v5 12/16] drm/msm/a8xx: Add perfcntr flush sequence
Date: Mon, 11 May 2026 05:59:25 -0700
Message-ID: <20260511130017.96867-13-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260511130017.96867-1-robin.clark@oss.qualcomm.com>
References: <20260511130017.96867-1-robin.clark@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=EcL4hvmC c=1 sm=1 tr=0 ts=6a01d32b cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=xqWC_Br6kY4A:10 a=NGcC8JguVDcA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8 a=W-43u8CF5Pkpiqpb4b0A:9
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTExMDE0NCBTYWx0ZWRfXzi2B0gcUDWpS
 2hsPQhapoo7Z+hMyWbBdwjmIGrTGn9zpsFo4x17ZkpMN1r9Uazq7eNvwH9Omq4mWJG96xUbuFYu
 DCuPqdB58spbr48VKE1r8q+kI5jQjTN4VEjb4wAg/Eg6XE7XRU476PcsJIKfOE43p+yj+vzEuUd
 vRgU3dyZvRIemiMy5TwEAl3ZcUQ1JKNo5m6LYBG7WigbUzVbQS8Wjd5bm4GbJ/8o/cKTRFYbk6u
 DrjI5H54bBHbSOSPv/tkB9DNpSBABCo9/+3uwl47eTLX8mE0xHsCgzJ7cQyh8XqU9wGnyrg43xG
 1hO4WdEf+YAw12oumDeonoKjftAgeqcBRmdf5tKgm88kaA8UlDlFn/SW0Sefqe2for3P+K4JjW3
 6wEh1zsjPXP4UMKZM/Ks5yjRUAPK32T9E0etPj643TkhTxto6gpD6TUxlSPe+XnF2BCFrqQzIvi
 6PTz8uWZQz4jmd+HwJw==
X-Proofpoint-ORIG-GUID: sdPwLtfrwU2QjRnYBMB6imG0ugusnGvp
X-Proofpoint-GUID: sdPwLtfrwU2QjRnYBMB6imG0ugusnGvp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_03,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 adultscore=0 spamscore=0 impostorscore=0
 lowpriorityscore=0 clxscore=1015 malwarescore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605110144
X-Rspamd-Queue-Id: DF80650EA55
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.freedesktop.org,oss.qualcomm.com,poorly.run,kernel.org,linux.dev,gmail.com,somainline.org,ffwll.ch];
	TAGGED_FROM(0.00)[bounces-106937-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[robin.clark@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

With the slice architecture, we need to flush the slice and unslice
counters to perf RAM before reading counters.

Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c |  1 +
 drivers/gpu/drm/msm/adreno/a6xx_gpu.h |  1 +
 drivers/gpu/drm/msm/adreno/a8xx_gpu.c | 20 ++++++++++++++++++++
 3 files changed, 22 insertions(+)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index 30df9bfa9ef8..a329d20033d7 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -2921,6 +2921,7 @@ const struct adreno_gpu_funcs a8xx_gpu_funcs = {
 		.progress = a8xx_progress,
 		.sysprof_setup = a6xx_gmu_sysprof_setup,
 		.perfcntr_configure = a6xx_perfcntr_configure,
+		.perfcntr_flush = a8xx_perfcntr_flush,
 	},
 	.init = a6xx_gpu_init,
 	.get_timestamp = a8xx_gmu_get_timestamp,
diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.h b/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
index 99c3e55f5ca8..3491a24a9320 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
@@ -334,5 +334,6 @@ void a8xx_preempt_hw_init(struct msm_gpu *gpu);
 void a8xx_preempt_trigger(struct msm_gpu *gpu);
 void a8xx_preempt_irq(struct msm_gpu *gpu);
 bool a8xx_progress(struct msm_gpu *gpu, struct msm_ringbuffer *ring);
+void a8xx_perfcntr_flush(struct msm_gpu *gpu);
 void a8xx_recover(struct msm_gpu *gpu);
 #endif /* __A6XX_GPU_H__ */
diff --git a/drivers/gpu/drm/msm/adreno/a8xx_gpu.c b/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
index 124d315b2469..6c040f718176 100644
--- a/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
@@ -1345,3 +1345,23 @@ bool a8xx_progress(struct msm_gpu *gpu, struct msm_ringbuffer *ring)
 {
 	return true;
 }
+
+void a8xx_perfcntr_flush(struct msm_gpu *gpu)
+{
+	u32 val;
+
+	/*
+	 * Flush delta counters (both perf counters and pipe stats) present in
+	 * RBBM_S and RBBM_US to perf RAM logic to get the latest data.
+	 */
+	gpu_write(gpu, REG_A8XX_RBBM_PERFCTR_FLUSH_HOST_CMD, BIT(0));
+	gpu_write(gpu, REG_A8XX_RBBM_SLICE_PERFCTR_FLUSH_HOST_CMD, BIT(0));
+
+	/* Ensure all writes are posted before polling status register */
+	wmb();
+
+	if (gpu_poll_timeout(gpu, REG_A8XX_RBBM_PERFCTR_FLUSH_HOST_STATUS, val,
+			     val & BIT(0), 100, 100 * 1000)) {
+		dev_err(&gpu->pdev->dev, "Perfcounter flush timed out: status=0x%08x\n", val);
+	}
+}
-- 
2.54.0


