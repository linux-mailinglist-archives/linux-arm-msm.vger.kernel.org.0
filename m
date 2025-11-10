Return-Path: <linux-arm-msm+bounces-81069-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EF0BC482CF
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Nov 2025 18:03:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EAE6F4A3624
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Nov 2025 16:43:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 825E93271F6;
	Mon, 10 Nov 2025 16:38:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pefX5QbF";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZVe87HFd"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47F9E326D6F
	for <linux-arm-msm@vger.kernel.org>; Mon, 10 Nov 2025 16:38:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762792708; cv=none; b=bVNVbxZFxYFzKFpbAGD3gOwgB+nNpuHhceJdQWSu78+LRzoxFvhlbEabBaTsZsK0WL0kb+zFqTkdhk2e0FfJd61xshGRCUHiCsq3PRLiAGkMg4d5PTqY59Eqofuz8hRLM4iwDV1IvvRNhA9rkFxbNkh1XzzLJCwx9SAoCCf8OKg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762792708; c=relaxed/simple;
	bh=B0t21POhzhnkPllkO0aJhsfTVayUVxYvYda/rajz62U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dmINwx5QEGJVFd8k0MQ2/JrtBjlPLhPcJ6ofL/MwZvH02AwAdWMN1bRXOhjpqsCuZ2bOusGsncQox6yKf6/oxou8YxZSHoyCf6QMBWUrld3vNNn9rKr2BqHQNVoKBSE22a+vj+50pUOvyjPftCvHJ6sigp9omcxKakwDYeAId7A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pefX5QbF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZVe87HFd; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AAGYLUk4070667
	for <linux-arm-msm@vger.kernel.org>; Mon, 10 Nov 2025 16:38:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	U76nAoGUFZhSMgN3LNNB9B5figDIPjE3gLJdeoHmGms=; b=pefX5QbFhFPxMWvq
	WEqX56c2bZF/NoxpQmnZAWt+Lkl02FkvcTAAD9ENCMOl+gw+syWgArhpcatRaVhz
	OsLx3+5UGGqGP6R4HIkcKSErnvRAi9C70jhwOWWFmsthUI6n+4BodjkgylCjZWjg
	JV2sBIsricxd2Jzi/iKtTEPxeq3fLTh2m7UYRvGVEyntoCWkYNiqJ/T/9J7nS7l+
	NUBP0qlH0EIDVg1pCVWKs5ZgD7c+WZGYCqgLV0kjXGXC/JJJRdLN2fI1ybHHiJKd
	cnTnG14zAxscCkqswdUccF4fNv5g9EUmqg49u8aCIgtxvTM4IQKoxvcbuAiVodIc
	JbU6lA==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4abkpj80hy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 10 Nov 2025 16:38:25 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3437f0760daso4372651a91.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 10 Nov 2025 08:38:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762792704; x=1763397504; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=U76nAoGUFZhSMgN3LNNB9B5figDIPjE3gLJdeoHmGms=;
        b=ZVe87HFdOKTZFTpyj2G0i79FOffBDiqFy1hso6WP14PmkvieBCCB55cmZSIohjwcgf
         QFDMhRMt+FerBxqdMaKxJwtD7g5V6EY/Y+ysI84RkokBHWBxRG3xCjT5QidKQrlfM6oW
         I3Uye7S+9c9dvp+x3o5HVUFcsjrDEA8FDiQTLuZ2khhRi25EUO3fNQ8BQFjEaS2imZoa
         KRWiyiAiZBSTCOeKoYBqbqHq3+moAHgwOtSop29jHVyGed+nixJVZAaIU6LpYf3hdxUU
         WmcaYr/8DjH6QkndDmLH5HuhhptXnChkIPQtIVTQMTmp23V0+/gvx9pMOhewixDPLnbr
         7+mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762792704; x=1763397504;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=U76nAoGUFZhSMgN3LNNB9B5figDIPjE3gLJdeoHmGms=;
        b=N1wfka4O6VxffSkJediWoEoxy2KhluH8yQn1nRUmklAuQDnNp8AQfHbcdhLHeTSxjs
         ZjDrhudd9igwEdOoPZIvzJLNiYFtchdNQ6l3kWpbOU+hfif1plp1h+fvcNAVFYLOBNLv
         Ru7dP4fs+k1Cx43Q38eCwwi6mHtDpgpil8uVywuCCLYveXRp7oMCqnKhdwOvrODdT5LX
         DntB3c8y69X057B7pBje75XH6zJInZhY4UkviAHVwQmjzLbYYwkvJBK2n/p7LjViPblH
         9tErV1Ko7l7xL7phDx2cMx86NfgSjZSzT2Vni1cSp0ImFrovIj8APvbyXvFvauPqJZxk
         1i+Q==
X-Gm-Message-State: AOJu0YxgIytHqnAX/wAhO35chkHlpO7WKvQcOcru5uTnZrhA5ULuLt7Q
	ts6M05rldtSHdOFodFx4F/HiV71QswGKyt/F62VX4ceFY5tX97Sat4vx/rIuZhVIX/98xxLwtR2
	hI4h4CKbYQ5tI7vB5zNkJRwa6i4CqgvY/y6suaccPcY6rWv1QYIoyBKwxPG9pbXV04yS4
X-Gm-Gg: ASbGncvafGvqRFIbCxrivHM2I0C2VLEE/mkRWRvasUfviCCtI769Cm6BSgnwh0XpjLn
	0WEJa5svXXNasE6oUre+sKZDBwhgPl7VxJFh3lyK6hZYW+GAb1ePV9aLxEpPo03ordFbx1GHDJI
	vs5geBMvZu6qF9dnQWYLptH3HM9i0ye0r3peYpEEPd3eyY9+iK4he63vBXPpv5CMQn++N59IniJ
	ngkJVXukqrNwLC01f8Ubv/4EfgyXNknnyzGxXIkqOgczGhZsFCRwhblViIlVcVtt0ZjSFd5qTDN
	yWRo6IGKTsD5Nsljg9NglBwAzc88eqxW9T9TDWKSVxfki7w3Ll0XbG2gtI6/9AQPQ95UNzPoftD
	5S+ooWHdfhJx/C9DwFRGGGAM=
X-Received: by 2002:a17:90a:ec84:b0:340:b86b:39c7 with SMTP id 98e67ed59e1d1-3436cb91cdbmr12379095a91.11.1762792704042;
        Mon, 10 Nov 2025 08:38:24 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFoVMuhMcPsQUnqMT/Oy8cOyzF5h70KIN3Q83LoJcFWHaGhmdTuOn6UcLQhDffxl/Uu5uGmCQ==
X-Received: by 2002:a17:90a:ec84:b0:340:b86b:39c7 with SMTP id 98e67ed59e1d1-3436cb91cdbmr12379065a91.11.1762792703541;
        Mon, 10 Nov 2025 08:38:23 -0800 (PST)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3434c337b20sm11468922a91.13.2025.11.10.08.38.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Nov 2025 08:38:23 -0800 (PST)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Mon, 10 Nov 2025 22:07:08 +0530
Subject: [PATCH v2 02/21] drm/msm/a6xx: Fix the gemnoc workaround
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251110-kaana-gpu-support-v2-2-bef18acd5e94@oss.qualcomm.com>
References: <20251110-kaana-gpu-support-v2-0-bef18acd5e94@oss.qualcomm.com>
In-Reply-To: <20251110-kaana-gpu-support-v2-0-bef18acd5e94@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Sean Paul <sean@poorly.run>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Jonathan Marek <jonathan@marek.ca>,
        Jordan Crouse <jordan@cosmicpenguin.net>,
        Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Connor Abbott <cwabbott0@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
        devicetree@vger.kernel.org, Akhil P Oommen <akhilpo@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1762792679; l=1529;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=B0t21POhzhnkPllkO0aJhsfTVayUVxYvYda/rajz62U=;
 b=5LGxm8q7C7nTAl599JSjm02h9F6JnfyOhlzuY9M+RH/QtTw4F1E31ZgmBsJOxt67zTsOJpNGK
 U43gtcuNh5UCTjwVDvswqSwaglhNGbvuhplr6cbwINEpI7UGgZnf/qy
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-ORIG-GUID: gU0JOQksKFB8zU17jT5AkwAyCJHYjlI1
X-Authority-Analysis: v=2.4 cv=GZoaXAXL c=1 sm=1 tr=0 ts=69121501 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=gggc3m2WwWe7Cuz57AEA:9
 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-GUID: gU0JOQksKFB8zU17jT5AkwAyCJHYjlI1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTEwMDEzOSBTYWx0ZWRfXxbNsavIdn+aE
 7Tcbx2eU9Rru2TEJwfSArsqWReZdBElVy+cSXIy9RmqiLeml27ZSTX1Dhkto7fOnRRh9AuDPWbB
 fsU1YfJmxcpQk9qwTcQCvjYg1UjksUHKu/7Vbm3vy35h3WixI3yRSuc9rybHFCjLoRfJa2GhMaC
 gP2towsNs+QiYjvnxliV3Cq8iAq5XUXX4bq4spS3Nc8wJH1n4SFVTo0fHFcg+c2h4KmLwWAbu/W
 hgejkLnQhpNJZnknA82JxT3SdPwLROqJtGee4g3JpKASVfn8rT6txCPQq8GruZEtYr5BNe+Vnks
 oaTp+p+YaBnF3pDcoqKOziyzgjBYRA3lU9E2onIq51RPaoS8lYRE916QS5Lx6VZznTKFdpHACIQ
 QA1vaSig//Dpxd9xRHX8bBeRio7iUQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-10_06,2025-11-10_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 clxscore=1015 malwarescore=0 lowpriorityscore=0
 priorityscore=1501 bulkscore=0 spamscore=0 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511100139

Correct the register offset and enable this workaround for all A7x
and newer GPUs to match the recommendation. Also, downstream does this
w/a after moving the fence to allow mode. So do the same.

Fixes: dbfbb376b50c ("drm/msm/a6xx: Add A621 support")
Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
index 4e6dc16e4a4c..605bb55de8d5 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
@@ -485,8 +485,9 @@ static void a6xx_gemnoc_workaround(struct a6xx_gmu *gmu)
 	 * in the power down sequence not being fully executed. That in turn can
 	 * prevent CX_GDSC from collapsing. Assert Qactive to avoid this.
 	 */
-	if (adreno_is_a621(adreno_gpu) || adreno_is_7c3(adreno_gpu))
-		gmu_write(gmu, REG_A6XX_GMU_AO_AHB_FENCE_CTRL, BIT(0));
+	if (adreno_is_a7xx(adreno_gpu) || (adreno_is_a621(adreno_gpu) ||
+				adreno_is_7c3(adreno_gpu)))
+		gmu_write(gmu, REG_A6XX_GPU_GMU_CX_GMU_CX_FALNEXT_INTF, BIT(0));
 }
 
 /* Let the GMU know that we are about to go into slumber */
@@ -522,10 +523,9 @@ static int a6xx_gmu_notify_slumber(struct a6xx_gmu *gmu)
 	}
 
 out:
-	a6xx_gemnoc_workaround(gmu);
-
 	/* Put fence into allow mode */
 	gmu_write(gmu, REG_A6XX_GMU_AO_AHB_FENCE_CTRL, 0);
+	a6xx_gemnoc_workaround(gmu);
 	return ret;
 }
 

-- 
2.51.0


