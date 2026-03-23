Return-Path: <linux-arm-msm+bounces-99385-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2BR5DS2fwWmFUAQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99385-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 21:14:37 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B7FF2FD0DB
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 21:14:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 03065304EEB6
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 20:12:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 043C83E0C7D;
	Mon, 23 Mar 2026 20:12:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CsFE33tL";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IUrG0w5n"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCED83DEAF2
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 20:12:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774296769; cv=none; b=MggHQqCQiUbg1xmQ/YIhRe02K0ghjUSMSdZ1lSTDxIT1H2upAqqesqyAa3Ez2ieqOom9Xrzzep+Adb4tx4sB1ukEtWyfrS9VaZNbALNFfS+/sfTYcyAVgwxnv1Z6ITUlmvRsRJHrEHoZjGDLEPN0nGvmOTUxQSm63aDuqteLR4M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774296769; c=relaxed/simple;
	bh=fyL0L8FEEG4BJOzg7sRyFwEc/V7XoLzUNjMTow7BabM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=EPmumICb6KRdVF7YSIiSvmFrsM/N56O83PkRXjL9HTHCXX4gL451wsbW9Wrjjok7CoDXEmBbGo0ko31wtqtXj65HM7ml7ioSPrYKF2N8rLDy8dSZxcjmPP5hBxq9bzjQXoBHGbup2huaOm2z6FJ4dWqJROc+hoXwirKp4oNii1c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CsFE33tL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IUrG0w5n; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62NHqV5G943490
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 20:12:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WO2JyAUszUgTDdy1Htc6BOSwNDnhDSWgUZjYgndONWg=; b=CsFE33tLiaqHd1HK
	DB8KZMgGNpRNmMSKXDYtO3ffDHtmGt2oC/61hAW5BF1+4CcFT1W052bt/rYPY4Sb
	4fesmgyuJwLUbyKIfZgA1QdEGu8m2WjJyh67yH16fWZaoEyxSe+W54O5TOdjo1TR
	FUXTKaXcYjP6lpvQjyzzxdQOhDFCPQVV3qxT9G8SyBIQMCQgC3tLEiSM7iu+z2Cp
	jsKCc2b1WjuOt/HbkZ/bp1mVc66hQD8ULNYuUWWkBYJOa3JUaE7k1EMQKdvhadro
	X2itKnJA59LnPyKwkEQwbo4B6Bf4P6DtsL+luX74PurqbbHeGDHjyG+mHP1JNk21
	r2srVg==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d34vksryw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 20:12:45 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2adef9d486bso28146965ad.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 13:12:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774296765; x=1774901565; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WO2JyAUszUgTDdy1Htc6BOSwNDnhDSWgUZjYgndONWg=;
        b=IUrG0w5nrUtqSOSPKgoWO06+i1vSfIsPd8UwkxIakSITyHVSheF1akZFI/qtqUIRm2
         OKliRYlo6t19Z9T8qOJ9YWm/V6/ySgwFvE/eWCpAt2YJFbBHMrGxbngnEb3XmHtKer8j
         NC8OMMuvkBRQsQy5EVfBaeXyCO2SA17gehAk9RJM/mE7e32Z9P+lGjIphxxgKp618Qie
         oy0Z/sng98FWdovjAZA7i3DXb0UH4OPkvQuVURfTNKYrbA2ZMQtFPdJUXhPmL5QrUlSs
         F8J/g/A49hRCbO2kLdxpNumLqkh0q7Kp9EXD263Ph0rBJ1Eqf4o+eJHKNWjqxWuVaHRW
         zUoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774296765; x=1774901565;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=WO2JyAUszUgTDdy1Htc6BOSwNDnhDSWgUZjYgndONWg=;
        b=HjAvMtm2LrTHavxjXvTeTiqcmXQpQwQV7Zupjy+AWuQpmiSPssZ1nWW1DNRXojUyTr
         zmTWEVN0KHtsJPZfX+/vREgxu4qNbx6X8L6G1G1UvhcutXBDP78OERD0v5N6YCmLkkXR
         sHJSCC5iuruk8erGAqB9C9wLaOkA4dvOqn7S9wcK6KuuCZfmyfM7Eu0401RT0zfeg4wE
         9K5BMUtu8y1oN7wYct3xlDzGI2vo8cffEQq2WxMrIa5b5uujAcJ/m4Pzf2lnEqQfhfuF
         NEzCQNVudiJE9NL5YIpQio8YwErvXsDSkp9gH5TSXNyI0bZuo1E/TfC2bS6WSBApjZFy
         DFbA==
X-Gm-Message-State: AOJu0YyvBRklki9QOywaQov0d7oD7LJGPXWTA9V4J44kwqVM+ehXb/fp
	va7jdFJKpK3ftQuUW+/41YAgIMjGtFvq1PdjIUFJTu7Pz+Lbb+vUzTVlLwqnHhN/7hsnHNg1Kbq
	CACfYgeOf5AgRXROhzdILhXxqM9YhBH2Gk4O/YOXHclvYgOIh3zjU5gZMHzOX5FEilPyK
X-Gm-Gg: ATEYQzzeGxHk2JBKA8Vq0hrpnjop1EpdRCoKCTFd43ZBCEj0v6R7HkHw4h/Y5YnYhx1
	yv/bgwCeWkSf+1C5F2beRJBxqpc5EpXDnRyGWx6sxW7k3aCRGvRqTKNIjp+iSkt9kh14hBsMKNT
	SqnUbRNerv+Cb+RXRUH7PXY9SVsrklcBaTP4MsRHV8xEzZk4DRHAqEURY0ch7rCB/RTMCBq5FxQ
	WIEL9/W+JDV4GdibBDR0KefTsj88KdpjokTsWp7Q9V2MvBzCPSW04N17PXZJ7LTgoaPHqXXq4/L
	lJGNCJKvok0U7ubJOj/gS3AuoZ+MPy1ZTDA42xS4OVBMxd2meF3LH0EjaR9gjSB1/p07JJJa8uX
	yYrj9hYo3JExyPC0mESKBhLsgAKnZjJCI1/mS0HwP4T8FLA==
X-Received: by 2002:a05:6a20:2448:b0:39b:ff0b:8aee with SMTP id adf61e73a8af0-39bff0b9fa2mr5896621637.14.1774296764820;
        Mon, 23 Mar 2026 13:12:44 -0700 (PDT)
X-Received: by 2002:a05:6a20:2448:b0:39b:ff0b:8aee with SMTP id adf61e73a8af0-39bff0b9fa2mr5896586637.14.1774296764273;
        Mon, 23 Mar 2026 13:12:44 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82b0409d148sm9510738b3a.29.2026.03.23.13.12.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 13:12:43 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Tue, 24 Mar 2026 01:42:13 +0530
Subject: [PATCH 01/16] drm/msm/a8xx: Fix the ticks used in submit traces
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260324-a8xx-gpu-batch2-v1-1-fc95b8d9c017@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774296753; l=9030;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=fyL0L8FEEG4BJOzg7sRyFwEc/V7XoLzUNjMTow7BabM=;
 b=WoVnh+xAwdmgIsxoc5bnSMg4stSJg0DQtUvfoxU39imw6AQA1PFGFTB8+vm9WY4F7LpERgo3q
 6hKl2kE7XquCW84IoeGDu5hLPM469V8P4RhAhaTdmy0lzsGpC6Vgrfh
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIzMDE0OSBTYWx0ZWRfX/abe/tV/YDr0
 qBOHLgvRqDjyuJjsa4g5zniovX6HpnsXQVNk2bBPc0lbjXplvddpAk0ePuRUiuTx1XHmoR+sIju
 eWxN5LGbtrg9GAp0g2/xLBd9W31KKaih/V4NzTSBH1BeMingZU2km+XmjfCR8noMfLud7qsXhcV
 7YP2XR+QGBBlriaii2awafuANmMaVtG5f5ojdlq1sJ9enwGbTHO7xMPfEffFsFsOAsoUHotwW/X
 Xk4LFVIB3YQu6DONgO2t+gZ0/xxJz+tfgn+XjZJDGsYf5yoUTvA/Uu71qMWno44hucCw5eYCXE1
 p/HNirWlnp55M5ozkPfMKkWkzMKK/If8HbNC7HMukjrtF0RBapb0zxctkaLSEp8+Y6dr67KI5ql
 j2XoC8JKvr2o2Og0BcwLZDX8Iuk+R2FBM08SKifzuEe7u8oET8JuPDrbdRBZCfCtpF+SJBzbpwC
 sDeuwAghuklFIJ8YXbg==
X-Authority-Analysis: v=2.4 cv=eMoeTXp1 c=1 sm=1 tr=0 ts=69c19ebd cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=e5mUnYsNAAAA:8 a=EUspDBNiAAAA:8 a=KCeLXEH0ftFH6332X0AA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-GUID: abDKxgiKfMdHgxRc8laeQ7fjwgYrmdO4
X-Proofpoint-ORIG-GUID: abDKxgiKfMdHgxRc8laeQ7fjwgYrmdO4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-23_05,2026-03-23_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 adultscore=0 lowpriorityscore=0 impostorscore=0
 bulkscore=0 phishscore=0 spamscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603230149
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-99385-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,poorly.run,kernel.org,linux.dev,gmail.com,somainline.org,ffwll.ch,linux.intel.com,suse.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[19];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,gitlab.freedesktop.org:url,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[akhilpo@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 9B7FF2FD0DB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

GMU_ALWAYS_ON_COUNTER_* registers got moved in A8x, but currently, A6x
register offsets are used in the submit traces instead of A8x offsets.
To fix this, refactor a bit and use adreno_gpu->funcs->get_timestamp()
everywhere.

While we are at it, update a8xx_gmu_get_timestamp() to use the GMU AO
counter.

Fixes: 288a93200892 ("drm/msm/adreno: Introduce A8x GPU Support")
Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/a4xx_gpu.c             |  6 ++----
 drivers/gpu/drm/msm/adreno/a5xx_gpu.c             |  6 ++----
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c             | 15 ++++++-------
 drivers/gpu/drm/msm/adreno/a6xx_gpu.h             |  2 +-
 drivers/gpu/drm/msm/adreno/a8xx_gpu.c             | 26 ++++++++++++-----------
 drivers/gpu/drm/msm/adreno/adreno_gpu.c           |  6 ++----
 drivers/gpu/drm/msm/adreno/adreno_gpu.h           |  2 +-
 drivers/gpu/drm/msm/registers/adreno/a6xx_gmu.xml |  6 ++++--
 8 files changed, 32 insertions(+), 37 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a4xx_gpu.c b/drivers/gpu/drm/msm/adreno/a4xx_gpu.c
index db06c06067ae..0ed8bf2b5dd5 100644
--- a/drivers/gpu/drm/msm/adreno/a4xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a4xx_gpu.c
@@ -604,11 +604,9 @@ static int a4xx_pm_suspend(struct msm_gpu *gpu) {
 	return 0;
 }
 
-static int a4xx_get_timestamp(struct msm_gpu *gpu, uint64_t *value)
+static u64 a4xx_get_timestamp(struct msm_gpu *gpu)
 {
-	*value = gpu_read64(gpu, REG_A4XX_RBBM_PERFCTR_CP_0_LO);
-
-	return 0;
+	return gpu_read64(gpu, REG_A4XX_RBBM_PERFCTR_CP_0_LO);
 }
 
 static u64 a4xx_gpu_busy(struct msm_gpu *gpu, unsigned long *out_sample_rate)
diff --git a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c b/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
index 56eaff2ee4e4..79a441e91fa1 100644
--- a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
@@ -1435,11 +1435,9 @@ static int a5xx_pm_suspend(struct msm_gpu *gpu)
 	return 0;
 }
 
-static int a5xx_get_timestamp(struct msm_gpu *gpu, uint64_t *value)
+static u64 a5xx_get_timestamp(struct msm_gpu *gpu)
 {
-	*value = gpu_read64(gpu, REG_A5XX_RBBM_ALWAYSON_COUNTER_LO);
-
-	return 0;
+	return gpu_read64(gpu, REG_A5XX_RBBM_ALWAYSON_COUNTER_LO);
 }
 
 struct a5xx_crashdumper {
diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index 2129d230a92b..14d5b5e266f7 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -404,7 +404,7 @@ static void a6xx_submit(struct msm_gpu *gpu, struct msm_gem_submit *submit)
 	OUT_RING(ring, upper_32_bits(rbmemptr(ring, fence)));
 	OUT_RING(ring, submit->seqno);
 
-	trace_msm_gpu_submit_flush(submit, read_gmu_ao_counter(a6xx_gpu));
+	trace_msm_gpu_submit_flush(submit, adreno_gpu->funcs->get_timestamp(gpu));
 
 	a6xx_flush(gpu, ring);
 }
@@ -614,7 +614,7 @@ static void a7xx_submit(struct msm_gpu *gpu, struct msm_gem_submit *submit)
 	}
 
 
-	trace_msm_gpu_submit_flush(submit, read_gmu_ao_counter(a6xx_gpu));
+	trace_msm_gpu_submit_flush(submit, adreno_gpu->funcs->get_timestamp(gpu));
 
 	a6xx_flush(gpu, ring);
 
@@ -2414,20 +2414,17 @@ static int a6xx_pm_suspend(struct msm_gpu *gpu)
 	return 0;
 }
 
-static int a6xx_gmu_get_timestamp(struct msm_gpu *gpu, uint64_t *value)
+static u64 a6xx_gmu_get_timestamp(struct msm_gpu *gpu)
 {
 	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
 	struct a6xx_gpu *a6xx_gpu = to_a6xx_gpu(adreno_gpu);
 
-	*value = read_gmu_ao_counter(a6xx_gpu);
-
-	return 0;
+	return read_gmu_ao_counter(a6xx_gpu);
 }
 
-static int a6xx_get_timestamp(struct msm_gpu *gpu, uint64_t *value)
+static u64 a6xx_get_timestamp(struct msm_gpu *gpu)
 {
-	*value = gpu_read64(gpu, REG_A6XX_CP_ALWAYS_ON_COUNTER);
-	return 0;
+	return gpu_read64(gpu, REG_A6XX_CP_ALWAYS_ON_COUNTER);
 }
 
 static struct msm_ringbuffer *a6xx_active_ring(struct msm_gpu *gpu)
diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.h b/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
index 4eaa04711246..a4434a6a56dd 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
@@ -320,7 +320,7 @@ int a6xx_zap_shader_init(struct msm_gpu *gpu);
 void a8xx_bus_clear_pending_transactions(struct adreno_gpu *adreno_gpu, bool gx_off);
 int a8xx_fault_handler(void *arg, unsigned long iova, int flags, void *data);
 void a8xx_flush(struct msm_gpu *gpu, struct msm_ringbuffer *ring);
-int a8xx_gmu_get_timestamp(struct msm_gpu *gpu, uint64_t *value);
+u64 a8xx_gmu_get_timestamp(struct msm_gpu *gpu);
 u64 a8xx_gpu_busy(struct msm_gpu *gpu, unsigned long *out_sample_rate);
 int a8xx_gpu_feature_probe(struct msm_gpu *gpu);
 void a8xx_gpu_get_slice_info(struct msm_gpu *gpu);
diff --git a/drivers/gpu/drm/msm/adreno/a8xx_gpu.c b/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
index b1887e0cf698..987c99097d40 100644
--- a/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
@@ -1174,23 +1174,25 @@ void a8xx_bus_clear_pending_transactions(struct adreno_gpu *adreno_gpu, bool gx_
 	gpu_write(gpu, REG_A6XX_GBIF_HALT, 0x0);
 }
 
-int a8xx_gmu_get_timestamp(struct msm_gpu *gpu, uint64_t *value)
+static u64 read_gmu_ao_counter(struct a6xx_gpu *a6xx_gpu)
 {
-	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
-	struct a6xx_gpu *a6xx_gpu = to_a6xx_gpu(adreno_gpu);
-
-	mutex_lock(&a6xx_gpu->gmu.lock);
-
-	/* Force the GPU power on so we can read this register */
-	a6xx_gmu_set_oob(&a6xx_gpu->gmu, GMU_OOB_PERFCOUNTER_SET);
+	u64 count_hi, count_lo, temp;
 
-	*value = gpu_read64(gpu, REG_A8XX_CP_ALWAYS_ON_COUNTER);
+	do {
+		count_hi = gmu_read(&a6xx_gpu->gmu, REG_A8XX_GMU_ALWAYS_ON_COUNTER_H);
+		count_lo = gmu_read(&a6xx_gpu->gmu, REG_A8XX_GMU_ALWAYS_ON_COUNTER_L);
+		temp = gmu_read(&a6xx_gpu->gmu, REG_A8XX_GMU_ALWAYS_ON_COUNTER_H);
+	} while (unlikely(count_hi != temp));
 
-	a6xx_gmu_clear_oob(&a6xx_gpu->gmu, GMU_OOB_PERFCOUNTER_SET);
+	return (count_hi << 32) | count_lo;
+}
 
-	mutex_unlock(&a6xx_gpu->gmu.lock);
+u64 a8xx_gmu_get_timestamp(struct msm_gpu *gpu)
+{
+	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
+	struct a6xx_gpu *a6xx_gpu = to_a6xx_gpu(adreno_gpu);
 
-	return 0;
+	return read_gmu_ao_counter(a6xx_gpu);
 }
 
 u64 a8xx_gpu_busy(struct msm_gpu *gpu, unsigned long *out_sample_rate)
diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
index d5fe6f6f0dec..1bc0e570bd12 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
@@ -391,13 +391,11 @@ int adreno_get_param(struct msm_gpu *gpu, struct msm_context *ctx,
 		return 0;
 	case MSM_PARAM_TIMESTAMP:
 		if (adreno_gpu->funcs->get_timestamp) {
-			int ret;
-
 			pm_runtime_get_sync(&gpu->pdev->dev);
-			ret = adreno_gpu->funcs->get_timestamp(gpu, value);
+			*value = (uint64_t) adreno_gpu->funcs->get_timestamp(gpu);
 			pm_runtime_put_autosuspend(&gpu->pdev->dev);
 
-			return ret;
+			return 0;
 		}
 		return -EINVAL;
 	case MSM_PARAM_PRIORITIES:
diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.h b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
index 1d0145f8b3ec..c08725ed54c4 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.h
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
@@ -79,7 +79,7 @@ struct adreno_gpu;
 struct adreno_gpu_funcs {
 	struct msm_gpu_funcs base;
 	struct msm_gpu *(*init)(struct drm_device *dev);
-	int (*get_timestamp)(struct msm_gpu *gpu, uint64_t *value);
+	u64 (*get_timestamp)(struct msm_gpu *gpu);
 	void (*bus_halt)(struct adreno_gpu *adreno_gpu, bool gx_off);
 	int (*mmu_fault_handler)(void *arg, unsigned long iova, int flags, void *data);
 };
diff --git a/drivers/gpu/drm/msm/registers/adreno/a6xx_gmu.xml b/drivers/gpu/drm/msm/registers/adreno/a6xx_gmu.xml
index c4e00b1263cd..33404eb18fd0 100644
--- a/drivers/gpu/drm/msm/registers/adreno/a6xx_gmu.xml
+++ b/drivers/gpu/drm/msm/registers/adreno/a6xx_gmu.xml
@@ -141,8 +141,10 @@ xsi:schemaLocation="https://gitlab.freedesktop.org/freedreno/ rules-fd.xsd">
 	<reg32 offset="0x1f9f0" name="GMU_BOOT_KMD_LM_HANDSHAKE"/>
 	<reg32 offset="0x1f957" name="GMU_LLM_GLM_SLEEP_CTRL"/>
 	<reg32 offset="0x1f958" name="GMU_LLM_GLM_SLEEP_STATUS"/>
-	<reg32 offset="0x1f888" name="GMU_ALWAYS_ON_COUNTER_L"/>
-	<reg32 offset="0x1f889" name="GMU_ALWAYS_ON_COUNTER_H"/>
+	<reg32 offset="0x1f888" name="GMU_ALWAYS_ON_COUNTER_L" variants="A6XX-A7XX"/>
+	<reg32 offset="0x1f840" name="GMU_ALWAYS_ON_COUNTER_L" variants="A8XX-"/>
+	<reg32 offset="0x1f889" name="GMU_ALWAYS_ON_COUNTER_H" variants="A6XX-A7XX"/>
+	<reg32 offset="0x1f841" name="GMU_ALWAYS_ON_COUNTER_H" variants="A8XX-"/>
 	<reg32 offset="0x1f8c3" name="GMU_GMU_PWR_COL_KEEPALIVE" variants="A6XX-A7XX"/>
 	<reg32 offset="0x1f7e4" name="GMU_GMU_PWR_COL_KEEPALIVE" variants="A8XX-"/>
 	<reg32 offset="0x1f8c4" name="GMU_PWR_COL_PREEMPT_KEEPALIVE" variants="A6XX-A7XX"/>

-- 
2.51.0


