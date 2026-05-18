Return-Path: <linux-arm-msm+bounces-108279-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oAIDLUFkC2rwGwUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108279-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 May 2026 21:10:57 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 84688572AEF
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 May 2026 21:10:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 49F21303DA16
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 May 2026 19:09:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E31BC391828;
	Mon, 18 May 2026 19:08:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MATGCAfT";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PuMf9Iu4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3069A397E92
	for <linux-arm-msm@vger.kernel.org>; Mon, 18 May 2026 19:08:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779131309; cv=none; b=stydCLS5M3YBaUm/7q1Gfcwo557K23Hfxis6Ffzu92xuw7Y5d70fWZFeSNcgrWCkTnB5B8MVYHlYcz3/TA8/2O7pxvlYeO7T0O+WgvaTvcpBPJFD8f0fs4dutTWmAI7BuDlAFbYa5bXKw9xC5vYoX6Db7luzWGfEWZXkhl8+Xhg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779131309; c=relaxed/simple;
	bh=Go4EyvhlQyWzHCh2p+9M+OIk/P0VvfEAaU7NdiQe9WE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FVleGWTxeXZrzBdwPe1Yyq+cl64Kr/RxUgDqjdgY8S6Bd+0EBx7rvIla02DeQUbzAAATOuNX8ME4GQm0ablAZBK+K8VoTDKRxrtKDpmd4rCAd2hgYxcH4XsUYCTzpH0o0Zzz7/UeoXyinEQ/jrP7AXoZBjyun6UEg/eqExx5hxw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MATGCAfT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PuMf9Iu4; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64IIJM9X2482474
	for <linux-arm-msm@vger.kernel.org>; Mon, 18 May 2026 19:08:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=Rv3QXoFqyvR
	3pKOjjPZUAdbwE5pf1YjcLxou3Iv6008=; b=MATGCAfTHTjmD2SefqkP28NRyIS
	2jeDDNN6lFidk60hs8kkWyKDZsKE6GmUVyQcUHXmVvyZC8BwS+ttmyD4j6rZ1NMb
	2VcqgH4v3u2mC2+cNk0ThhD9jvOw74TvKUhrAYUeCFyBDgt2aTqeZE7x59EkOJAS
	8wDvsaWa0x52Zf90ABI0zMY5SFOrZUORbeat6pUSdi11d/CGvLU19lEUd2hM2EYv
	D4ZoZ8fNkkHhVMPUKYdukPbBvssqIm9aZz5W4fFhuGcUpxLH+wsj+qu0ScFGS00b
	Kw01RkRPFlPuwXMDM2VFcHQbL6TIR/sFr695G4CgWSImq36he+o3KtBNNDQ==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e81rvhrwp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 18 May 2026 19:08:27 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2ba838d3fa4so26817485ad.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 18 May 2026 12:08:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779131306; x=1779736106; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Rv3QXoFqyvR3pKOjjPZUAdbwE5pf1YjcLxou3Iv6008=;
        b=PuMf9Iu442LDgqhhOevZkfxneVwFg5ypym8wEr7I76CtddQD9/VDPV8fB+03fmrPJX
         HDmFgCes+KhRlRVw2IUXv7idUZslGjukaJcW3oIigiZLzTTCe0u07xG1M6gPsaYaUMah
         xzzJtkmEKyNQ8XJ1+jELcWCiE9PYqmwQz+UccAh4QwhisVrqBvo+ixljqpq2MLgiAZRQ
         zhOL9GEy+LTGAT79zA7/hi1w8pMIjyRrHcpdvmbR2GrgaWlCDzrg4T7RM/Toj7qJkXdW
         jrPVRR/DXCP95OzaroBaffhZ/nPFdugogowQPo+qJ9f4FHtTHDeoXqrgMIy6etQQ9BTq
         HpPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779131306; x=1779736106;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Rv3QXoFqyvR3pKOjjPZUAdbwE5pf1YjcLxou3Iv6008=;
        b=Eo08WNKd8+n7bz1ZMZwln6ASmg3VciIDNdhp3fmbWePEEjmNLm0B1CZVVUPvA9q6Za
         qiQx9tyQH7rlJ2c9T27EgmpFTOq3iGgD2lcEHQDulGDi7qPkYozAIkIuFpw+iz8Fbqde
         CIsx1JQyUuuyUNGbE/C4jbbsJSBkBsRgnF9sUCBa2NCBY3UgY8rH63ool6tKu/vXOiqW
         JM84mZVlPK4q8Z6jTKsTCEL/0Y+dueNn6xmMCiS2aEeQze5iq11ofmh7wivVDFdb3at3
         23zw7z7WzvDaXJJ6IFoRRA2gPSXJFJsv9BTccZuvgvrSxtsHPTAU56GbX1yeUhouK7+z
         UimQ==
X-Gm-Message-State: AOJu0YwXZ/QLwC1xyv6gUKh5cFYBAVu4NaRGcoNnH7h9Zioy37azA+Yd
	WxnMe/pESa3S36yLTTXwsJN5HeWY8SHXujRLQr4Mfe5tijozzoqmgFzyNM8DhY2Khg3rYmcL6Lm
	UeSq74pP804U4t7T/hAQxOKMhbY/jcDGzSP82AGkd913gni08LvaZmMLFy3G5UB11b8U7
X-Gm-Gg: Acq92OFXnkkE9WLlWuziwH51nEl9P/nePVuXdAmvWlFP6jh1IcNUnHIJm0cmu7bQxAV
	zdud6X5n6juTqVSS3k8rfZiphRp9iCgQzT25kKDzDzhLqVXz/wjX0FqqHxwG6s/zWs7Asits04q
	+0jXO8QjVTWNUpKnKWe/TwhxUwzr2xpqE9dgbD1QjCYZpl7+hmfPYTG9CBtxf/3UA4I+zs6RNwe
	zhT8PtkjKjmIqPeakDHYHFUWAcl/dbmo0nYZSA7syQ+kJ5Q2c0Y0DO8TncYHhvW3xR9bobE/E1+
	FoV7mI25qZdU0NwPzfFQeKCpIU/brCvX0yHMhyTurXidEesXKbCPbtKCi/aKiobCESo8OXWIUQA
	8YvtGiCXGfqzIBVxw5McRb9joZ1nrNsfB
X-Received: by 2002:a17:903:1a8f:b0:2b7:86be:7673 with SMTP id d9443c01a7336-2bd7e85fce5mr174141045ad.6.1779131306226;
        Mon, 18 May 2026 12:08:26 -0700 (PDT)
X-Received: by 2002:a17:903:1a8f:b0:2b7:86be:7673 with SMTP id d9443c01a7336-2bd7e85fce5mr174140625ad.6.1779131305705;
        Mon, 18 May 2026 12:08:25 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:4ec8:83f5:8254:6891])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bd5bd5f2dcsm157769815ad.13.2026.05.18.12.08.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2026 12:08:25 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Anna Maniscalco <anna.maniscalco2000@gmail.com>,
        Sean Paul <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v7 12/16] drm/msm/a8xx: Add perfcntr flush sequence
Date: Mon, 18 May 2026 12:06:39 -0700
Message-ID: <20260518190735.16236-13-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260518190735.16236-1-robin.clark@oss.qualcomm.com>
References: <20260518190735.16236-1-robin.clark@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE4MDE4OCBTYWx0ZWRfX2u8LOxMroy2B
 9F+3vDw24zlu869GquktXxR7tcjbiR/MdBC0jRgjwOKEDmoxCtZVQ+pLH9Zl7/TN4FrdEAORfrd
 5EwGMtD9agy5vLNXL4ocRBK34CA8oVw59yRfyX4OsNc2dNZ1oSyUCq7h91TE3w6zjeUQ34PvBkT
 rYs5Al9YHa/JsAxioLcbdaKpe2ddG3bCTF+c9Q4HLf2MdSHMB4Et5kt6107Fdlm+sY7Lo4OyF29
 oSaFRjw9VQmR9CDQyGHYdRKShAjP1X5ojEA9sgZRKV9C2WGLrgCr8qki3dGYxbKRErSyDQQDDFU
 /pe/d3L7/kPWzcMuhVrYp9UxzwNJEOPEAsI/ApXKIEzR8TOcCNcMlV3tLwQleNeAcEGU3EuxE7y
 zX3UUqfcAPjmxeSG/OMWRfj18v3XlGp0Pp7mQwVacbqv1PcB9C5q6uy0eXppT8OZDrwmW/IBcpC
 XNjr62AJcPz4fFfEwYg==
X-Proofpoint-GUID: kHcDHorfI8EPHpVLd4C48wKtSqH9dASN
X-Proofpoint-ORIG-GUID: kHcDHorfI8EPHpVLd4C48wKtSqH9dASN
X-Authority-Analysis: v=2.4 cv=Lf0MLDfi c=1 sm=1 tr=0 ts=6a0b63ab cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=xqWC_Br6kY4A:10 a=NGcC8JguVDcA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8
 a=W-43u8CF5Pkpiqpb4b0A:9 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-18_03,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 priorityscore=1501 lowpriorityscore=0 bulkscore=0
 adultscore=0 clxscore=1015 impostorscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605180188
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-108279-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.freedesktop.org,oss.qualcomm.com,gmail.com,poorly.run,kernel.org,linux.dev,somainline.org,ffwll.ch];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[robin.clark@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 84688572AEF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

With the slice architecture, we need to flush the slice and unslice
counters to perf RAM before reading counters.

Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
Reviewed-by: Anna Maniscalco <anna.maniscalco2000@gmail.com>
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


