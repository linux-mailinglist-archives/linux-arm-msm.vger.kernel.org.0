Return-Path: <linux-arm-msm+bounces-62088-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 19C52AE4699
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Jun 2025 16:24:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8B6FE4A0940
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Jun 2025 14:16:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7EEA3255F27;
	Mon, 23 Jun 2025 14:14:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Qr0/5Lmn"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED0AF23ABBB
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Jun 2025 14:14:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750688077; cv=none; b=LTzJkjH+wxLJX8UoXV6RLe8HhO0SBYojEAkJBHncUjwt5gz7isnry+5e95ZFUShPqABESBxkD09PtJuNw0ze5tvP1ygPwgcvislqhZQsgfYxAF7GCuCJo9XM5P+9xc2ecp5wIz7p2G8CwCyikD5QoVfiq7QiZfoTCijLgHNI0HU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750688077; c=relaxed/simple;
	bh=xKZ9Xj4qiPD/2Zmj4aELMu3Uy4uODXqfzQQwFPTWu3E=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=OZsaeOb7Or+dRSgxo2ONQBE2WblAUYqjdE0xVeN3Hi6ahfzAtul+QwTyvJiWlLCy3k8up0gIqGe68V0RnOgywk9xcJQkbgQ4FOqlEu5mCXotRIb+DCkYwq3ehbX2F6qxRn/68OfGLyn3n7oSk5viFRZ2UbCYlIekc/88+TH7+r0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Qr0/5Lmn; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55N7fI86021398
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Jun 2025 14:14:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IDdT8GmCmZBkVRDlqMB/TVH3NvJZR5f0rOeZUeSRtHg=; b=Qr0/5LmndzZH7Vy0
	9zK1b+MKQSOhlFsqy/SIVY2SW8wRk3lCJJPoRedx8FZgxUr9nRT9mRUdal33qRpD
	SDPDSp74oKrjJfRHJO3BoSK1Js292xtn1hZQ4mAtC5mJ8LuF/9OFKax3y2kPjC4h
	t6QZf0UYD2JkojDiq2Ao7RYqWkiX41bTauRD2ImU/LFnD5w0JZzry+IQH7L/pOxe
	0Zr+kE1jJeWEGnW/OQaEhU/JjSJ29RSzWfaWfTk/bB41Nitf07qf1Ge2k5/cEXZ8
	QbNnFZm0mTCPILf43q4qVNf2vE5ePBMEUrQOjHHq27WwFKEV5HM5HTpsbkMQ92tI
	7MBqIw==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47f2rps2ce-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Jun 2025 14:14:34 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-313c3915345so6586770a91.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Jun 2025 07:14:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750688073; x=1751292873;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IDdT8GmCmZBkVRDlqMB/TVH3NvJZR5f0rOeZUeSRtHg=;
        b=JZH5y8rllsS6LG/xkRWol6MpT6nyFDecBLEx7bCFONsQeegCNL+SPzh+j2DqhNP9+f
         8/r4wKjko86jdHGcwxyI8n3mno0Gxd6SFH5R0setdLB5g3yff2Bxhme21SnOY9ez06DR
         M65gBqEYShhQ5twYVuSDZK62BUrx18fz12vHzolpoypIgtjIcmsn7JyzsWsTXeiyRjW/
         3nPpuDiaGIDjd+nXDJK/JdF/dYPjPu6nIgddzkndhYEqtXBzsIYHO+fnr8SmNYu/+bu/
         UsbSNJZFN9TOt33l/dJP7eOhoOiERGlvzVV6IRYtH1pIodh29OjdKUArK/pPKyUUPxe8
         C6IQ==
X-Forwarded-Encrypted: i=1; AJvYcCXpTNC+tn4/gCLpTCnhVcuyXDJ2PQLB4+t/tRLTH4yJe+DooB0uABsU+zpdxEnELpqxKSb2GYc0roNhjKTR@vger.kernel.org
X-Gm-Message-State: AOJu0YxscZK3PpQH43XBKTSSbQxf65gmCLsYxj1CxJNGapcPi2DLVvzg
	9DDN3wuuSwkfo8qr8iF2DF5dkKZQ18v5lZyJtNSaugaybLxpEPcx0RQeR0VEqal5/8rmaGKmQOT
	z/xXjYqgt5Y7E5VA9WAoKrKcbiQ+PDK4OkhyGxFGdJCzU/hHd4iwq/HcPT2N/4tzEyD3Z
X-Gm-Gg: ASbGnctQqFfsOqvsgR6Oa4/459OI2x4C4uM5gC4/JXkR1jHv/+Z3CXD4Y3G9QHWkqcz
	nOBULz2QlcZ4EUVU57Ncjn1YY9iiaGlhrPk7uoiEYkD3d8egDxIK0Cfqzs0gIXc3JxOBbg7ysZv
	0YNR2CL1IPx0vi1as0jLPhoEWkXWU6eB6OllfNrf/MrwrUQ4L9JXj5gHnnGoUekGT4MpvSXDidK
	eDAaxZ9T29d+n/LM7658FAqDId/c/15NKyfqWF+eU8KoWLpezWI/plkCch7XfH+6TRxVuKM1kKL
	hJtBgVUP0WPq7CINjYOTYtuZH4DvDbst
X-Received: by 2002:a17:90b:2651:b0:311:ad7f:329c with SMTP id 98e67ed59e1d1-3159d7c8f9cmr24187379a91.18.1750688072964;
        Mon, 23 Jun 2025 07:14:32 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFohlIbDHPnzGFzoVo8IyUWv275ozTxbFgCP3ruQsyFrF9oyTg/DjA45LUYjJ+1geRNvBXBeA==
X-Received: by 2002:a17:90b:2651:b0:311:ad7f:329c with SMTP id 98e67ed59e1d1-3159d7c8f9cmr24187313a91.18.1750688072479;
        Mon, 23 Jun 2025 07:14:32 -0700 (PDT)
Received: from [10.213.111.143] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3159df71c4bsm8112049a91.2.2025.06.23.07.14.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Jun 2025 07:14:32 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Mon, 23 Jun 2025 19:42:08 +0530
Subject: [PATCH v4 3/4] drm/msm/adreno: Add Adreno X1-45 support
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250623-x1p-adreno-v4-3-d2575c839cbb@oss.qualcomm.com>
References: <20250623-x1p-adreno-v4-0-d2575c839cbb@oss.qualcomm.com>
In-Reply-To: <20250623-x1p-adreno-v4-0-d2575c839cbb@oss.qualcomm.com>
To: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Viresh Kumar <vireshk@kernel.org>,
        Nishanth Menon <nm@ti.com>, Stephen Boyd <sboyd@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-pm@vger.kernel.org, Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Jens Glathe <jens.glathe@oldschoolsolutions.biz>,
        Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1750688040; l=2172;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=xKZ9Xj4qiPD/2Zmj4aELMu3Uy4uODXqfzQQwFPTWu3E=;
 b=nyiUEqvVCW+25SYZKCQtGlM9mIdhtcEW0YGblasDdcsi9vA0hNbTrMnvW29/s2M5+bGhB9XUq
 aFcV0xh4x86AEvTj2u6wD9wWN3yobWDJ/JNXPBpIQzwfyk7yvN++lw5
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Authority-Analysis: v=2.4 cv=NdDm13D4 c=1 sm=1 tr=0 ts=6859614a cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=gxl3bz0cAAAA:8
 a=pGLkceISAAAA:8 a=xcvD53-FQScLkYWh0o0A:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22 a=kiRiLd-pWN9FGgpmzFdl:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjIzMDA4NCBTYWx0ZWRfX+LZbNV6l9Pwb
 tij2WQEPVM0ZrfwT/ImWZ/G34Ahv9nLKw3WZNoLGKnucwvnXyKVY0eT6yIwXzd6s7uBm2CTqJVo
 wanusowME4RPKBKVVNlJeAL2l+7uMq2AINs7zTJVu/muBPjXDzsAY1AhlG7e563gAPZY7yceV7V
 u3IOoyuBsjvp6O+2bgnKGLiYOsGnB6JwHNobEaaMXc2ABdG+XwV420WJf3QcgNrKZ1ZUYYRjYvs
 f8uWjqI1jEBh4eJaRp/ww/C6xTDUDX0g5y1lUONLUxNJS+KYPUirR1vQPSJiV9Y4BjT4wBIHBuu
 9UkcmQNk/IVAOmRtiLwievqtqZMoFMJbKI5J2YkVWWNm7+ScK21kedeVmlp7/r3PoYlSsJwNVA2
 LERdOWDcTFcauV/TWOX+QUf74ezRzmb0cCEi7l2s8x6ZParpnxyTju8/jz3wr+X6rqjyFCgT
X-Proofpoint-ORIG-GUID: ZBp2InIu9ODjsxUolZIFsn3AjqebhXEu
X-Proofpoint-GUID: ZBp2InIu9ODjsxUolZIFsn3AjqebhXEu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-23_04,2025-06-23_05,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 mlxscore=0 spamscore=0 malwarescore=0 lowpriorityscore=0
 phishscore=0 priorityscore=1501 suspectscore=0 mlxlogscore=999 adultscore=0
 clxscore=1015 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506230084

Add support for Adreno X1-45 GPU present Snapdragon X1P42100
series of compute chipsets. This GPU is a smaller version of
X1-85 GPU with lower core count and smaller internal memories.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Tested-by: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
Tested-by: Aleksandrs Vinarskis <alex.vinarskis@gmail.com> # x1-26-100
Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_catalog.c | 39 +++++++++++++++++++++++++++++++
 1 file changed, 39 insertions(+)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
index 70f7ad806c34076352d84f32d62c2833422b6e5e..7748f92919b883bbcea839a61158ab52e6e4e79d 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
@@ -1474,6 +1474,45 @@ static const struct adreno_info a7xx_gpus[] = {
 			},
 		},
 		.preempt_record_size = 3572 * SZ_1K,
+	}, {
+		.chip_ids = ADRENO_CHIP_IDS(0x43030c00),
+		.family = ADRENO_7XX_GEN2,
+		.fw = {
+			[ADRENO_FW_SQE] = "gen71500_sqe.fw",
+			[ADRENO_FW_GMU] = "gen71500_gmu.bin",
+		},
+		.gmem = SZ_1M + SZ_512K,
+		.inactive_period = DRM_MSM_INACTIVE_PERIOD,
+		.quirks = ADRENO_QUIRK_HAS_CACHED_COHERENT |
+			  ADRENO_QUIRK_HAS_HW_APRIV |
+			  ADRENO_QUIRK_PREEMPTION,
+		.init = a6xx_gpu_init,
+		.a6xx = &(const struct a6xx_info) {
+			.hwcg = a740_hwcg,
+			.protect = &a730_protect,
+			.pwrup_reglist = &a7xx_pwrup_reglist,
+			.gmu_chipid = 0x70f0000,
+			.gmu_cgc_mode = 0x00020222,
+			.bcms = (const struct a6xx_bcm[]) {
+				{ .name = "SH0", .buswidth = 16 },
+				{ .name = "MC0", .buswidth = 4 },
+				{
+					.name = "ACV",
+					.fixed = true,
+					.perfmode = BIT(3),
+					.perfmode_bw = 16500000,
+				},
+				{ /* sentinel */ },
+			},
+		},
+		.preempt_record_size = 4192 * SZ_1K,
+		.speedbins = ADRENO_SPEEDBINS(
+			{ 0,   0 },
+			{ 294, 1 },
+			{ 263, 2 },
+			{ 233, 3 },
+			{ 141, 4 },
+		),
 	}
 };
 DECLARE_ADRENO_GPULIST(a7xx);

-- 
2.48.1


