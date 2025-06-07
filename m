Return-Path: <linux-arm-msm+bounces-60514-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B503AD0DDD
	for <lists+linux-arm-msm@lfdr.de>; Sat,  7 Jun 2025 16:16:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 602463A4B59
	for <lists+linux-arm-msm@lfdr.de>; Sat,  7 Jun 2025 14:15:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 263951C84B6;
	Sat,  7 Jun 2025 14:15:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="B/bvI6Xi"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 987221B87E8
	for <linux-arm-msm@vger.kernel.org>; Sat,  7 Jun 2025 14:15:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749305759; cv=none; b=UdrX651u8pW6qFig3pzz1Iri2QDNuHgo2HENFVkOBy07V9yisvq40apZ3c75aORHntnhH+/Xwzj3FG60iuQ6QHhtYDtsO1EfGmVZRijTO6ArdQImSzuKC4MThvBw7rD1KweEnQg4KudZOb5nreF7rPV4Q/LKqG7ZitToZl5SEBk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749305759; c=relaxed/simple;
	bh=oPf1vrGDHAcwS0lnY7K2yLQPMKwWkbyxLNEz+EtlmqQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TSeHBaB5LC9XieZaMDyn56oK1yW6/JB0xFAHfhulfLxeP7QBUmFks6QgUjexWMkxSmxWUzYJ2BrnA1m2h8e5/n9Xy14yqPXq9LHP4o0P1miNchZDvr5QtKFej+JhUPtSq9KNuD0njwJB0mg8e+WyeQSvsSPXmKDJJ+raRjJmaQk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=B/bvI6Xi; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5574Zvk3007581
	for <linux-arm-msm@vger.kernel.org>; Sat, 7 Jun 2025 14:15:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RoPAj24rANcl5QX1l3xvSVHABOET41gWukC6+LZv+Rk=; b=B/bvI6XiIRUGJm8E
	1KEoSC5e66CpGY+6d174bfC1hO/7oWyqxPk/cxVwAwwABoC/vIa9ZqPFvHUXSylU
	kp7W4Crwn8eC5JuMvMo5nzZsz/bwE/cqy9Ql/lBk1STFjLpSnVeneg91RfUigKEU
	qFfFfNSmTNkDFlj3pYMSSdByz4ciL3dDDj0aM3p0zL0fobgcAhW33E75NqPhz+Nj
	7vBZdl3cEkUTdW9YzvnJOUq8Xni08WDXJdOXaDzgbNy7S4wnu0alPB5wmo4yxVFf
	udTXlcHGeAxfTzQv/1IiLiF9hBDiYIUkTnj+QZoG0K9SHnCU8EtaFfaiPQh1K+HR
	el/T0A==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 474ccv0rnc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 07 Jun 2025 14:15:56 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-311d670ad35so2828165a91.3
        for <linux-arm-msm@vger.kernel.org>; Sat, 07 Jun 2025 07:15:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749305756; x=1749910556;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RoPAj24rANcl5QX1l3xvSVHABOET41gWukC6+LZv+Rk=;
        b=w9yFjyK6bbd7qPkFtVMUOYd0iKfFCCHBaxwaiqMCrlqOC6HsGm0dvh1hDHt2l/lEs2
         HSHgvIpwie5uRy+35gOo3xRYTPQAlijY1YePqmFr/A/TKepW6FNQ8DeniI/IGJTpw+pJ
         DFdEGcuOaNZlBHaSmTlOK/p1BtC+77eDDmfFiXBt89iNSxTttGkNo5dz2MjBSXYlpd5m
         midgZUQg52431o/gmVipKjyS6OUxac4Y5sYsSQv79yGDSVKLu80RzurUOK8yfPoDE6+u
         Ll27ucCaMFU4aJnShcYtMtFiGp5LjASbUEohWQR5a4oT244Z0WvZDgRulnTng8wIZHBj
         yLtg==
X-Forwarded-Encrypted: i=1; AJvYcCVDJY7VF0FPxBu9osOTRFM3rGD2ag2RCg0NNpByuFeDSRxt1uSFx06tDok4jm5MRUzoJQB8X8NlaxM7StYx@vger.kernel.org
X-Gm-Message-State: AOJu0YzOZ0lBwc2u4rxVy37Roq0HISWvrgJZg8VZJ5Rns2dSs0Um+pTl
	aTfKpJ0W3Esn2LG2HuzxIDjrMSm5Na2XMm/IVmyPuJdUCBHfhj7Fn8jNqeLLHwECUIsklzvRgx8
	P9yxUt+3r+AGli/DPSw409Mb8jSvke2EAt5bG/P3kUW+C2XJ/8CmWVUUZqdMKJ1sifkQ7
X-Gm-Gg: ASbGnctHvDKWtwUogzsBGRz4kgtsFbJ46RsOgX9/tRPvpl9J43aG9B2O+Nn8VB/GF8H
	MASpERYCPNYkU8fNx0MkHSazFnPc3eaJn0+hc0qyBic7lUAa3LfZuVbBTBL19Tjwu+f3iVJtPCy
	lCkKptQPJbjHBSO5q+khDgtebPvJMY32ZbJ0zgFrX2sia31ykVxJ04YgnBbac5MZs+XD1lF5i0h
	KF5tYxzap5IG0X6cskNNwJ0MrVcOKyQZRPoqFlfQIhEq23UyJG0prVMOlQhY7wqNxyQltdEzhk+
	jVvYG+Rw3vvqH5dkrbgH1w==
X-Received: by 2002:a17:90b:3506:b0:311:f2bd:dc23 with SMTP id 98e67ed59e1d1-3134740ab57mr10429751a91.15.1749305755806;
        Sat, 07 Jun 2025 07:15:55 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHkvgNxf4i7eaFV8gciSY1TEWEqZHtGfJkioV1I3JEgDycgT9Fb002tmr5zfEQLdgdl6qQZiQ==
X-Received: by 2002:a17:90b:3506:b0:311:f2bd:dc23 with SMTP id 98e67ed59e1d1-3134740ab57mr10429661a91.15.1749305755008;
        Sat, 07 Jun 2025 07:15:55 -0700 (PDT)
Received: from [10.213.111.143] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23603405732sm27500435ad.155.2025.06.07.07.15.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Jun 2025 07:15:54 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Sat, 07 Jun 2025 19:45:00 +0530
Subject: [PATCH 2/3] drm/msm/adreno: Add Adreno X1-45 support
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250607-x1p-adreno-v1-2-a8ea80f3b18b@oss.qualcomm.com>
References: <20250607-x1p-adreno-v1-0-a8ea80f3b18b@oss.qualcomm.com>
In-Reply-To: <20250607-x1p-adreno-v1-0-a8ea80f3b18b@oss.qualcomm.com>
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
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1749305735; l=1894;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=oPf1vrGDHAcwS0lnY7K2yLQPMKwWkbyxLNEz+EtlmqQ=;
 b=Rtb+J/Uc9KqX4zEqOybb0NgOAX9BBtfxOnJaOBVeaq7UwfCOezjPAEZDGKLncFvUa2/eVR+KO
 IxqmpR9hO/1CczmdmW9aD4svEJuZXtzcb7Jc/JC3rqY8bAM0iYniba4
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-ORIG-GUID: 7e9SSlEA8FHVowOccVoo5fIPiXRyA_-s
X-Authority-Analysis: v=2.4 cv=TsLmhCXh c=1 sm=1 tr=0 ts=6844499c cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=25T8ekUwwafyqMypFLMA:9
 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-GUID: 7e9SSlEA8FHVowOccVoo5fIPiXRyA_-s
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA3MDEwMiBTYWx0ZWRfX58341mQcRtf+
 UJm1Vi6lbeN5yc1Reu217Jviarg0vUf2dm5/mbjheZJ0/y/hzYUIymZKT4VcQA4KwW3lC6drnah
 bzVltBuU+oD+SpR5DvKEAECf3bHhYxtnmjZGfaJ4wF+ybvUOCXvUKC2oUveOUmzAjpIyfkGG5N/
 y587QkxlR/XTzLv1LER/UPKxLTURLPfwnmJNtRkvf5m95B2WX8941dHoKvWwfvBY1h/20vcSsoH
 jOIsLweWBAPSqoiimTpQPvBLMv1IYETzku4q846LexTLfMYn42HjCuKpsV2U6dY71S6YoU/wgKy
 Nzn/fzN8ACrZD+3kJf1LYwkDGTgSug7F6AvYnJGrpNQSzw4k4g32T1eh+XJCpPNpvS8uRsb1WBD
 JkhGJDTME7uC9UhR0hLDPuWsY/CFjfpMVsY/40mCdspK57hB7OpY0c44JfFcXGtefImrvbcc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-07_06,2025-06-05_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 spamscore=0 mlxlogscore=923 impostorscore=0
 priorityscore=1501 bulkscore=0 adultscore=0 clxscore=1011 mlxscore=0
 malwarescore=0 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506070102

Add support for Adreno X1-45 GPU present Snapdragon X1P42100
series of compute chipsets. This GPU is a smaller version of
X1-85 GPU with lower core count and smaller internal memories.

Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_catalog.c | 38 +++++++++++++++++++++++++++++++
 1 file changed, 38 insertions(+)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
index 70f7ad806c34076352d84f32d62c2833422b6e5e..2db748ce7df57a9151ed1e7f1b025a537bb5f653 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
@@ -1474,6 +1474,44 @@ static const struct adreno_info a7xx_gpus[] = {
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
+			{ 141, 3 },
+		),
 	}
 };
 DECLARE_ADRENO_GPULIST(a7xx);

-- 
2.48.1


