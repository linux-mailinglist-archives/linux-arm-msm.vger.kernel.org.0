Return-Path: <linux-arm-msm+bounces-104483-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id thD/KAmJ62klOAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104483-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Apr 2026 17:15:21 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 249FE460A72
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Apr 2026 17:15:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 70689305D4E7
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Apr 2026 15:12:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3A3493E1225;
	Fri, 24 Apr 2026 15:12:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Z58PEK1x";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CvPdxiCA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DCEC3D9035
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Apr 2026 15:12:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777043543; cv=none; b=miizDTCtDd7IrvuCMS56HTqEoTXtfA4q91kMGOymT6HSWWmd1Qx2wjkma2of58MN4JXYL9z0mXQW5g6iz0DKUcGuaaMekWMGNlMoO8GOjxfqmXgabMHbImC324uJ5SEOiD0SG+0ssJOio4DSN+1s7SQYUQHBN9KZwFC9Y11DiUY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777043543; c=relaxed/simple;
	bh=Hqdosxn2gqR1QwnvKc8ZMveHrCnVn+VGyhBa0TF4nNk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Sw15ruld/HgfACv23W31eQjZCZWL5Gwye1Rzd1+tHCKkCRdlrDggDi+MnPytBkqGp8nkAmWPkTSHcPbUK+kMFpJZizM22xGbBZl7i6HF7KWdBtos0ibmBgkm7wabADSIlDo4zIg/M1M539PvFfLVixNEFenKANcLiIN1gL8Xfx8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Z58PEK1x; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CvPdxiCA; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63O9Gd7r756723
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Apr 2026 15:12:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=GWYw+eRhUpl
	ftgFXTQLL3PdOcEwv5KNZZwwyE3cFoUk=; b=Z58PEK1xvg23g4xh7+k/b0Hqbfh
	lY04erevh8XD1vtoSvLsP1SHQuxtc7wBcdhN1H6kTS55RCzs6ZxkOHGUvusaM5BF
	MKxoljmZPnfd/4eLS+wRJMcqXNw9T6O4Vk7a3v3HbTUg6qtD//0RmRBv4b2tLu0/
	m9FwYGE3CHK9Gn62As/aX1MRcMHMTXDDS7w1fgOezub8G2EyvggK+07WqZ98AJAv
	dsnB5rfOcUsAZUySRBUo9OUoj5sa9lvX3MkZVCg4dgXUz5JthFNDoCqTsUhdZr+J
	cB2wjyC7qiX+7wrFhlNlH9Pq9keyjjDkNs7Fbv2n87B8ige5+NHpCv3rx2Q==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dqr4bmn4d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Apr 2026 15:12:20 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-82f6e6a3a76so9658694b3a.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 24 Apr 2026 08:12:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777043540; x=1777648340; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GWYw+eRhUplftgFXTQLL3PdOcEwv5KNZZwwyE3cFoUk=;
        b=CvPdxiCAr+kkfWEZ0wIxD1GP9Nc686AEYQ01aUh5t0DZqtLu/aasqRU+HUPB+i4BEE
         3Qj0j0PwBQp23Fg0qx1xoKXD1/aA4wNzITI48Vg+o+mukKUKi2aHKQaKavAtK7zZY8n7
         OxSlp/rCeMnq5zaj1fxTKCKfsQrgysRRljzkA9dODrN05A2iLtx9g11onC2r2+uaAOYp
         +uAsRNg2XLQzT7S58bcX+siWiuulFmKzhvlBZ8d5BB+OpSs2Nvlb4UEs3H7KL6IzzPGH
         RkVBY9bO0sASGkPgfsYcAYkFruxK/CRN7kDl/gD3IIbN4N4ITaXxDi3sQ7KzVrBqJtXC
         aXRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777043540; x=1777648340;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=GWYw+eRhUplftgFXTQLL3PdOcEwv5KNZZwwyE3cFoUk=;
        b=f3Q7+3DhghH89uMb/Voyd5xZCNL437dB4tSRK0qjfkz5Den2AD/lQOZQT1a+SH09vK
         6Ao/5SOGf/P6vmYsVtdCHE7+EKaRCSCr4ySOUoHV1yslIkvQ2GJTmeNPXlZrGxhSwpez
         dN5K4fbWPaz3O3FUGJjeyQtlfxj4dN1W1ler0JYncOurCMazlxo4OosMU6TFphiwSnDe
         TmjGplCdmX+B7/3Qijz4bE4hSKqI2EcPt4we2c97nYp4eh3uAv8woUCi9dwQrfVdd9ct
         kjYum26NeAEb3J06b9XwQ+4MilN2v3G9Fuvwk1YiM2F3pXF8y79vRTpwFSitFug16+y3
         nbWA==
X-Gm-Message-State: AOJu0YzVQayIFjwoJx6IPyz8ZM349EkqVVCmsKQplAuvqWbYmjLbFx6U
	z1+9G+6iejNcKOWwcjE7w1eoC7PuW0LQlqbJi7xexwFJZrA97IkG2f2T7E7NToGylIwJ+XQ+Ow0
	dx5RZsEaGqv4s1/N84iecYmxLhRmaicERJ9mUUIy7MC4ui5j+1OPk1Yls9MTT1yqnnMgj
X-Gm-Gg: AeBDiesYcipclhdeFnz4sRoHzTLSkXMfd0aEXikb7GNY4wqMuxkkYyQB273z5g5w4Ou
	fyPAkHZaZbn3Kx8SF+LiAyTF5j8gabiZB6MrlpwW+OP3gwBGXIDZaNAO1sk2UoCksO+JmOhdNcH
	lDUYoFjEkJwFfg0l6iT9iQgD9DmgJsntqz9fdlQi29fyWDL8oLLjRknOSlqk47zYvY7Mwo4pJbj
	42u15XGsSkiT1isuNfBzPOe/Rnb+Pc8mzkloSw3obMphSdQIhj88ApVag/jabN7xSzU1Wyj1gHZ
	0oXWhf5dRZjG7SEQtSKmi5HPqw4mYMU/pfbVjp91vUa/V7IuL2pAT9+reccW+v0nhV3i1J0BreX
	Bws/cQ77YROO3qi8Rt04HN2bcW3M5BUoPuSI91KT04p4=
X-Received: by 2002:a05:6a00:116:b0:82f:9d21:d352 with SMTP id d2e1a72fcca58-82f9d21d516mr22394126b3a.9.1777043539497;
        Fri, 24 Apr 2026 08:12:19 -0700 (PDT)
X-Received: by 2002:a05:6a00:116:b0:82f:9d21:d352 with SMTP id d2e1a72fcca58-82f9d21d516mr22394074b3a.9.1777043538897;
        Fri, 24 Apr 2026 08:12:18 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:4ec8:83f5:8254:6891])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f8ebe68ebsm26965701b3a.47.2026.04.24.08.12.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Apr 2026 08:12:18 -0700 (PDT)
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
Subject: [PATCH v2 12/16] drm/msm/a8xx: Add perfcntr flush sequence
Date: Fri, 24 Apr 2026 08:10:47 -0700
Message-ID: <20260424151140.104093-13-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260424151140.104093-1-robin.clark@oss.qualcomm.com>
References: <20260424151140.104093-1-robin.clark@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI0MDE0NyBTYWx0ZWRfX6Fn1hE9HX7De
 8Pzw6EYxzUzaybpy6FafFQQlfEFb0BkwJGCbKZNMs69cw/BHo8mPz4TdD7Z14gMq+OCSygqyjTb
 VXv+hkqqhXlR+LWE88S0xkaSykGbrUa125EVN0hSxWhrXAVDUVYktufgzrbYqDQeEQFeEGGYiYg
 nxCr5lY4WvstnnLLzUYY9Fd51susu67fSe9Mn6xe0t4XyCHJVmBpeMJOn/N12hWfcq+IyTrmfkd
 sOd7p8843uM9D5HzXNA+RMPkhkjjKgjJW9bfGAqkbEnM+cAfjd534HJ4ZGaTlLnZeB9oRkqbiLU
 bgzwj+JjkaM8QeP4/9UJiRCKbKY1tcggmJTbed8EWZ2dgKo9lu5JaLJxg3Isul+VGPLdLXnzBod
 yO9q0wYBozR7vpFwvXj70dzwipBNzslF8QmubYpAdKRYJtXiNja4U6IrDtB0cdSVqhyOePkrZ7u
 5mvNQ3Q7t+yskOacggg==
X-Authority-Analysis: v=2.4 cv=TtnWQjXh c=1 sm=1 tr=0 ts=69eb8854 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=xqWC_Br6kY4A:10 a=A5OVakUREuEA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8 a=W-43u8CF5Pkpiqpb4b0A:9
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-ORIG-GUID: kh39m79MggMcDifCrdF773JLpxUBZoJz
X-Proofpoint-GUID: kh39m79MggMcDifCrdF773JLpxUBZoJz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-24_01,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 malwarescore=0 clxscore=1015 adultscore=0
 spamscore=0 bulkscore=0 suspectscore=0 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604240147
X-Rspamd-Queue-Id: 249FE460A72
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.freedesktop.org,oss.qualcomm.com,poorly.run,kernel.org,linux.dev,gmail.com,somainline.org,ffwll.ch];
	TAGGED_FROM(0.00)[bounces-104483-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[robin.clark@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]

With the slice architecture, we need to flush the slice and unslice
counters to perf RAM before reading counters.

Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c |  1 +
 drivers/gpu/drm/msm/adreno/a6xx_gpu.h |  1 +
 drivers/gpu/drm/msm/adreno/a8xx_gpu.c | 20 ++++++++++++++++++++
 3 files changed, 22 insertions(+)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index 8b9dcca8e051..6d0f8dcbe9b4 100644
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
2.53.0


