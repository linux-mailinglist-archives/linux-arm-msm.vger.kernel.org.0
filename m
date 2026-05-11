Return-Path: <linux-arm-msm+bounces-107000-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yMHqF9Y3AmrmpAEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107000-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 May 2026 22:11:02 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id B3CA85158C7
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 May 2026 22:11:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6A6F6308B997
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 May 2026 20:07:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4706C379EFE;
	Mon, 11 May 2026 20:07:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CKyYQtGB";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="c4/52IBx"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE46137B02B
	for <linux-arm-msm@vger.kernel.org>; Mon, 11 May 2026 20:07:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778530054; cv=none; b=r3R3voA2r1XmnOqGQF4fb4Wvtve//M1OFiKxTX4W1k1z8zD7ie88N/Y7djIdGeamu65PT8SwHN2PO1ZwI9MRutITCtWMXnT9gZDw4ph6ZcezeBUAy6cepy/EE2k+EMLO1JD65Wf6/vGo0K5YImCZAyze7jjYGtnscrsw8ew/XwQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778530054; c=relaxed/simple;
	bh=FpnL0ZPLEVfOL/cMC4YLbx3ytUnBQe7qykC1VIfe0qk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KHSgsYFV4JBJgqw+OEE1XYDQx3Hmh70PQ8yIS4Fz408QJ9fj8Nw2x9Z+eLTfn5eN9kJ60JPigU/UH3jBGkZPaTs8ekY2e4hmERcpi0Q9YGjiwXrL67bKn8OIjAEXfkZ15GsoCx+7BigNm9/yZqOKKKZglg+oSM+QjSTPqICEyLI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CKyYQtGB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=c4/52IBx; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64BK6NUb1183918
	for <linux-arm-msm@vger.kernel.org>; Mon, 11 May 2026 20:07:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JSlJpF3zqQ6EX6MthcusBte5cTy2JBqQ6FB62ENsUYA=; b=CKyYQtGBrNpBzHbB
	Pr1tDg3r8W+ukfZnUCifZXZwPodmwGIxQzCu9kFm7cLttT+DEb2ndHFmadt6oSXG
	2nqMCeAo6yHGIG4exNchmrUlUsfniH0YAVU8HJdjiD7Ac5HnvEJxzS895qme+NDM
	xrs0zWhNu2PsEHDa6m3kCfQcA1zmfZIZ+Qc953sq0iBylPXRXFhkMT0f7kC0Cskr
	QNo4iwcY/MXDqESYFr5ToC/wtoz/7nQMLqFoRHbOLqkbfgTmbKrqzQgdRyApVO9v
	Re2xGnehXeSl4pTP+nJOPOz8XsjWyQ3tiZSe64cf/738yhFREf3kndHcxx6hQ57T
	QH7l4g==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e3nuy8042-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 11 May 2026 20:07:32 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-36641fe4aedso6774747a91.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 May 2026 13:07:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778530052; x=1779134852; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JSlJpF3zqQ6EX6MthcusBte5cTy2JBqQ6FB62ENsUYA=;
        b=c4/52IBxDEq6FA4ZrdTP/B1blN3aA1fXhu26jjaBEmJNYkLhmQTB2Mpg4iNwANz5vA
         P6HG+JVUzEEgwVZEdUElJ0QtbX7DNMFt+h/YzJ/vygNU3naBp/rOc4lnWMqr7dUg6gwe
         5R4q32XHrKRt9QTuK9PfJ4miISG90cz1A5AFhCAKosA/dLBy0PY3O8JsrUq7YgB3cCRI
         QdF6ArWSaSDiqDoQbu+BZGp+KGgEsKHdZCHJl9FBPpbmWIezkbemVqi1dB0N1utQYH/u
         ukmNj7qxMrrLdzH89TVa0ao+ThyzG3Mvt2VoasdA2SYMbPUBX9TW5/jDWS1bbNbEN57/
         bj7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778530052; x=1779134852;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=JSlJpF3zqQ6EX6MthcusBte5cTy2JBqQ6FB62ENsUYA=;
        b=QjaTF53ufazigx5Qr4gIH7+XKYBaxlw6ZFPuIASvrB49JzuTE9VEr7c0545QchOFIi
         28DgllW4h/PKsbzOnGG/CV+IcyMjhyswfXyIlJmI3AQjr7q7nazElfDbubPSRmAwxt+/
         FsgDktT6IwHRnxZgjlsUdyk1uBg87F59BFBuqTI9JpKZg5iHk4sf908i94jjz3eARRll
         4W0hSBDmDi9J50Vp8HtzAZBj8pSfgMvynyVDU4sWkoVfzV95EyHAkwc/hbEq2lH34ydv
         YjRfdxL3VF7VrAK3AAyThfG0plQ1Nzx9GKINV1gbZabznhDQVs26UVANd+DXjMaWrLUj
         CFSw==
X-Gm-Message-State: AOJu0YzrujpiVrfUpqGS1WooR1UxcfKXBRV2Cqm35bNnpoxb2XiOYgsp
	iQ7mGkNOLbAKeCEsJnBpYR+L5OaY9V0x6KnKeVkqn4nHIoE06Kf39qH0/kkkJ4KPQIVO4JpghIu
	3UhJRHDw9bJ0+9uo89AnL8Bgvsv8dmPcA12wv9MDlGr9PJ+zWeLTChpqZMl97SdZmMNpI
X-Gm-Gg: Acq92OEJXCqlErWu4s9t06r07yJxnozmLVFtvWbkdOk7J9z7zzTe1tG3P5xyLwYitoH
	c+AFibY3QH0FPP9LphNYqYsAdx+YoZaYUwTqMgCZOFpZaO9eTcXYQeTpChuGvO0vK6vV6y6DCTx
	aFyynjDCo0WMCRdr7cLNzioWNM96QHfuygGbBzgaeptMdI4z/Xva+uVLMslXv7HuJi4ttb60z9a
	2YC+m7dw7HxUM7rqvdVsbBkdVQS3BrLIKKohPurt7ypqr59W8Dtw+bI/26FcfPtPRXMG9vsYzgp
	AzDastCRTJEoqQZNBO5ayaVlatJGqQBFkB9DPXzYFV7c50CazU6Z8ikwb470hVAqPUThbmD70Y7
	tnevYokPmICeW38cLWO9femWyM0PbasR/nNyCQbrqZiqNcg==
X-Received: by 2002:a17:90b:38d2:b0:35f:b987:4dac with SMTP id 98e67ed59e1d1-368b24e8313mr139601a91.12.1778530051594;
        Mon, 11 May 2026 13:07:31 -0700 (PDT)
X-Received: by 2002:a17:90b:38d2:b0:35f:b987:4dac with SMTP id 98e67ed59e1d1-368b24e8313mr139568a91.12.1778530051161;
        Mon, 11 May 2026 13:07:31 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-368b01ef884sm64911a91.5.2026.05.11.13.07.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 13:07:30 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Tue, 12 May 2026 01:36:59 +0530
Subject: [PATCH v3 1/5] drm/msm/a8xx: Fix RSCC offset
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260512-glymur-gpu-dt-v3-1-84232dc21c03@oss.qualcomm.com>
References: <20260512-glymur-gpu-dt-v3-0-84232dc21c03@oss.qualcomm.com>
In-Reply-To: <20260512-glymur-gpu-dt-v3-0-84232dc21c03@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778530037; l=989;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=FpnL0ZPLEVfOL/cMC4YLbx3ytUnBQe7qykC1VIfe0qk=;
 b=QdSbnekUBS/LNdQNaOhTFAvnz8CUychpp7TsnPVbnU3E0tAx7xrKbjAw1q3LZguhQu2xQv+So
 jJ5MPnbbq6nAVhE15oQs+lqCPXeZGEKr/bgRN+W719SvQaNhxZiHVW9
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-ORIG-GUID: XQCFYVoFXb3XUH-kBkmdmKK5XsGg_768
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTExMDIxMyBTYWx0ZWRfX0j3KtXk+M0Hl
 j69+L6FoEllTizPuK/qQl4f3p+cO/Xgn9kG8hEgseqOiRfFIAfnu7H4znVFCZT3QKwjgCzL85cT
 h/WrcosSpSl6+6tTIfHjvopfs4JmR/w2NuWMSdlNl0lMgEGnTy9Hk9WD+ZDkqsRM8wYrr8yMkme
 Cz7bKvH3YURqUyPwoPPyNCgEnoGXzP8AM+B9SO+NDGqYgux6dSPpGPTbWbCbRlubRIhOjwosl3c
 HEMtYjGV4otchqAxl0k6eAXhl3RvrlY65apqqRDC344iDmxC2FLVKdSpNFTTEbvkg+LjRNJw2tB
 RkNbQD0qp9Ec0bXWnd3Sn5lHaZEF8oOflXLRyAshx/e7dmRZFZ9N4C/sSK1ia10UEYOm1Zc+n+H
 LyhsmSmCV3DE29iH0T7xDrfGZtlK15yyvaNk6UEe2HNVhuTOM9TfATcARHxMuFCTJXnTmt13lDW
 8MHPvaNcKLsbiZfZOIw==
X-Authority-Analysis: v=2.4 cv=UZ5hjqSN c=1 sm=1 tr=0 ts=6a023704 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=MejHOrmRh8FCsYeZqM0A:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-GUID: XQCFYVoFXb3XUH-kBkmdmKK5XsGg_768
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_05,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 phishscore=0 adultscore=0 clxscore=1015
 lowpriorityscore=0 suspectscore=0 bulkscore=0 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605110213
X-Rspamd-Queue-Id: B3CA85158C7
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-107000-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim];
	FREEMAIL_TO(0.00)[kernel.org,oss.qualcomm.com,poorly.run,linux.dev,gmail.com,somainline.org,ffwll.ch,linux.intel.com,suse.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[22];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[akhilpo@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

In A8xx, the RSCC block is part of GPU's register space. Update the
virtual base address of rscc to point to the correct address.

Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
index 1b44b9e21ad8..cab4c46c6cf2 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
@@ -2357,7 +2357,12 @@ int a6xx_gmu_init(struct a6xx_gpu *a6xx_gpu, struct device_node *node)
 			goto err_mmio;
 		}
 	} else if (adreno_is_a8xx(adreno_gpu)) {
-		gmu->rscc = gmu->mmio + 0x19000;
+		/*
+		 * On a8xx , RSCC lives at GPU base + 0x50000, which falls
+		 * inside the GPU's kgsl_3d0_reg_memory range rather than the
+		 * GMU's.
+		 */
+		gmu->rscc = gpu->mmio + 0x50000;
 	} else {
 		gmu->rscc = gmu->mmio + 0x23000;
 	}

-- 
2.51.0


