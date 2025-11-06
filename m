Return-Path: <linux-arm-msm+bounces-80668-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 25130C3D661
	for <lists+linux-arm-msm@lfdr.de>; Thu, 06 Nov 2025 21:50:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B0E8C3A666D
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Nov 2025 20:50:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9D7992E173D;
	Thu,  6 Nov 2025 20:50:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="T/2HigNQ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ABhtfABo"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F24B629BDBF
	for <linux-arm-msm@vger.kernel.org>; Thu,  6 Nov 2025 20:50:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762462230; cv=none; b=d7JpP82lpNURx7CzWTTGI79Oi0JqxXSFtbSeJadEa8B3XTWTAb3ui2BxVs6ILLl1FIx8Q4lw3BN2WzbW07VB4J+rpfb5fiTMEdEvZtqCMtEQS64mFHXDjhsC5eyQBCdDcOUHl+lLqp8Xp7vqmdcdBaZWXTGPBbkgCkSuUizXgpI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762462230; c=relaxed/simple;
	bh=EYt1DO1LqTfFqHj16/ypXH3yHHgYuudVfxTIn/PI/Ts=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=fNcGZHkRlmKf+a/8EXv3IVNowm5nYz9AxhzAyXKLShP+uy97fuMF6hE6SczCEaXO02M8QVlqDchaegvqrz2XFIpJYbop0whwv+iGYjQ5Ix7tC19C1iywgpO0JHbWHa9b/LOS3vqn1imKjDRKKcPOi2Nzw23nXD1nz7xK8ZKcXYg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=T/2HigNQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ABhtfABo; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A6HUVIk642885
	for <linux-arm-msm@vger.kernel.org>; Thu, 6 Nov 2025 20:50:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=c+0CI3phAGYDyHILGmN1e2
	d0RUo7uh44/KkruqoJ1dY=; b=T/2HigNQHaN0BouYmyS5QtddKOx9hJPk/6ad0F
	PvddoEMsl2o6YwVa2KfdH2QrsTuvectw4Vb1hbHDCeDda6yJBpcUdcJaAoFPcLXa
	r3oarwSJk4HQTpwV40KX9W6kpfkGwwwF2P1FvWIZVOYoqTXiE8O2paawM5hMbADF
	ZFKVQXt28EtWdmPiz7MBxPIsELSA7YxO0W3HJIhNMSV1P6uIvy1Dqm4ubIMVnj9H
	Afocj0Z+0eGkk+klLMsj+5SDLrG4M5xZ9luB/TeLsSZnvKBgZCp5XVwUQhB7O/za
	SHyVkRv+SwQZda1+OpiNzECY+hDH/YV3r39+biVhITh9xcpg==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a904v0j5u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 06 Nov 2025 20:50:28 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2956cdcdc17so449285ad.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 06 Nov 2025 12:50:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762462227; x=1763067027; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=c+0CI3phAGYDyHILGmN1e2d0RUo7uh44/KkruqoJ1dY=;
        b=ABhtfABoRM/MFktXoV2NIeBkqzeFcXxBY5rASMEybr+Pnnu22Ugxfw+i5zfXXkHXpc
         nq5hKU3NDWd5uImUz/fd7zymbU29a75lk0EkKoAjaJWDlujUJMM1oWqxZ6if/PhWh3te
         HGMbS10D+NhA9KARB+Yo7088Nv7eoyx0hdhmK2uN5y1BM0MVry1IAl59tr7AHVNT1hm9
         BiIAACI4vrPxqO7EyOZLoLAMhVOEOSWRG+X5X3yOZmG928yymMJdhg8lWRpWnGiknkFQ
         ertW1XEAtIY3En5K0l/zN2eBUbdNdPuAlrOLN2Kups3KO+dqb9D4ZRT1nTDBPdqcG/rW
         1Fqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762462227; x=1763067027;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c+0CI3phAGYDyHILGmN1e2d0RUo7uh44/KkruqoJ1dY=;
        b=Q7XoJ2IxMvlKxNHuqL1ehP6rhV42tq731PEgS5l4JlDcNFjZLJogOWMaYIn3jzQ1TJ
         hX5N6kvakZSUdEvMdOWOAumOQzCGxhruCXCYc98K2ZUqPUHgNy7UquIBrp40tkBQORcJ
         FXv0u8tzmyelRxgYePc69g8Txhwc0Fk37MtVaFFD6aKvVqpgHHEg+1/gBTq5VAGQbBGE
         +J+2hjkLcYIGzO2QoxTUI5XWwLdGs4qajRBeFP0kg6f28KJgvKcdZaUkZ9cpjVCjv57T
         q+EaYV12nbd7wJevSu6kVmR7RUtEBtnLlnAyjJl0l/lg652Khi0OTnSMzPi9lV5bfA9I
         w56Q==
X-Forwarded-Encrypted: i=1; AJvYcCXHZiqngnrMwQZLTqJzHkd1PhzXLnHfQjTYW65JB0R7TjhoIJ/Q/hQ4iKk40ZR48bM8oc3EqA+7os6LfdU1@vger.kernel.org
X-Gm-Message-State: AOJu0Yzp/B3s+QlV6Jgu7ln9F2oivr3C/apO9QcH03+sVsA5ja1ut3N6
	eHWQbmaBAerEtqNBmyTgFYn7b1T5rpJZmwjVa23ySCk9xDExjadzxggw4Jzas9ZzTtoGyNCo4Tb
	R6FVeqp04A8m4Dcg6rSFnGXt/0B6LO1RG2ha8D9kp8uUNzGL1XWqwWmDcRqrYocOtHFZY
X-Gm-Gg: ASbGncupHdSFj5FvEpytxaHPuCglQ3sWBqhwEZcmeYUhytcBb5oVrktbbkGEAImEvBP
	vZ2fX4Rrpyws1qbt3c7ZPVnQKNeAaDm/E89kkNjPJg3E3HsYfOfW4VKv/pZ+EVTOj5HuuUZ77Mv
	CDlnf0ASjb/OCGOy6j/sU5A1th/LgqDgEMXIaqoLLN6FXvi6waDMWMQv3KtyjDMdbn/duees9h7
	ztnBaNArQp0I64wAcQclKw161t6tCtXITTAnuy3DwF/VI+DGdjSxJufLwrUszW2jD/z1crQ6VM9
	wJosXSlTE8t5S3TOTYHbCzjzXL0nAIqchedJB58RBCbI/bIVQeK4B64RqP8n7IsczN8ICE17jpl
	v5EcwkpLXd4nPb+iBQL5ldvI=
X-Received: by 2002:a17:902:c942:b0:295:9e4e:4090 with SMTP id d9443c01a7336-297c048e1aamr9267825ad.52.1762462227046;
        Thu, 06 Nov 2025 12:50:27 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFkVL9sBwSB/OhF4GGfbkM9glVzBtBg9nKvK1YYv7yR04xbzRA1HMup/agqqeQtSQa4DhZ1vA==
X-Received: by 2002:a17:902:c942:b0:295:9e4e:4090 with SMTP id d9443c01a7336-297c048e1aamr9267445ad.52.1762462226464;
        Thu, 06 Nov 2025 12:50:26 -0800 (PST)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29651042c24sm37408815ad.50.2025.11.06.12.50.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Nov 2025 12:50:26 -0800 (PST)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Subject: [PATCH v2 0/6] Support for Adreno 612 GPU - Respin
Date: Fri, 07 Nov 2025 02:20:05 +0530
Message-Id: <20251107-qcs615-spin-2-v2-0-a2d7c4fbf6e6@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAP0JDWkC/12OSw6DMAwFr4K8rlESkRa66j0qFgFMiVR+cUBUi
 Ls3QFfd2BpLb55XYHKWGO7RCo5my7bvAqhLBGVjuhehrQKDEkpLITWOJV/D4sF2qJCqRBeioiL
 LUgiZwVFtl8P3zE92NE5B688jFIYJy75trb9HHS0eD7UUGvZAY9n37nP8M8sj8au+/VXPEgWKw
 pgkqVORCf3omeNxMu/dHocB+bZtX5rPe2riAAAA
X-Change-ID: 20251015-qcs615-spin-2-ed45b0deb998
To: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Jessica Zhang <jesszhan0024@gmail.com>
Cc: Dan Carpenter <dan.carpenter@linaro.org>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Jie Zhang <quic_jiezh@quicinc.com>,
        Jie Zhang <jie.zhang@oss.qualcomm.com>,
        Qingqing Zhou <quic_qqzhou@quicinc.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1762462219; l=3492;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=EYt1DO1LqTfFqHj16/ypXH3yHHgYuudVfxTIn/PI/Ts=;
 b=QRE7PA3UltZ/UcjZenH28Rd68rTh2wo2ssJfBfKhgw2eKzacmjm4dKSrkedIYMUuaqQCDC4Sj
 zTAHQ7Fd8ccAmb14wyxpPBWg5/A2tNJ5kFxFc3O+ef8h2KfKeL/v39U
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Authority-Analysis: v=2.4 cv=RMK+3oi+ c=1 sm=1 tr=0 ts=690d0a14 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=vemyJuc05ARF21wryp8A:9 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: Ygos9I4TFz-RHGWB03G2Clqrag3Pmfnb
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTA2MDE2OSBTYWx0ZWRfX0HPzLZqSSvVM
 qJyDqD0sQCQw5LU6S+vwAg3kuIQq+V7ZSYtaaB4II2fnyZS5ScDb9M+vSioyJ0vSL7++37SEZUB
 mZj83TMqE4uqYcjSkYHO1YKawkokQne0XRNeU+6mWYYg/LlsEM5GBR3kEklqysPaUEbTZSVLNp+
 b4SaYZCv/2cTPDSHQqgmYaEQZUhAgXQ21dbuSq26o/SQkQrym3vOGXMsQMk4R2A08wDvmU1EeIL
 Sq2iYPF6Jp2rFSrkf1qXJ3nwQXMb1qrZKe3DJy4stNNqesvvtpFOwG+3F/GufYHzzT3vdkSrHIm
 itzUO1epDYwDKZJFK8uPYmIAcqzaGOyFIIIitlcB3ISPv8D5j+Tv+3gLrZNj4iz7QyOXPwZ5o3H
 1RBa89ZpPssMkGTPwXEF+bsiW4Byuw==
X-Proofpoint-GUID: Ygos9I4TFz-RHGWB03G2Clqrag3Pmfnb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-06_04,2025-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 spamscore=0 phishscore=0 impostorscore=0
 clxscore=1015 adultscore=0 bulkscore=0 priorityscore=1501 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511060169

This is a respin of an old series [1] that aimed to add support for
Adreno 612 GPU found in SM6150/QCS615 chipsets. In this version, we
have consolidated the previously separate series for DT and driver
support, along with some significant rework.

Regarding A612 GPU, it falls under ADRENO_6XX_GEN1 family and is a cut
down version of A615 GPU. A612 has a new IP called Reduced Graphics
Management Unit or RGMU, a small state machine which helps to toggle
GX GDSC (connected to CX rail) to implement the IFPC feature. Unlike a
full-fledged GMU, the RGMU does not support features such as clock
control, resource voting via RPMh, HFI etc. Therefore, we require linux
clock driver support similar to gmu-wrapper implementations to control
gpu core clock and GX GDSC.

In this series, the description of RGMU hardware in devicetree is more
complete than in previous version. However, the RGMU core is not
initialized from the driver as there is currently no need for it. We do
perform a dummy load of RGMU firmware (now available in linux-firmware)
to ensure that enabling RGMU core in the future won't break backward
compatibility for users.

Due to significant changes compared to the old series, all R-b tags have
been dropped. Please review with fresh eyes.

Last 3 patches are for Bjorn and the rest are for Rob Clark for pick up.

[1] Driver: https://lore.kernel.org/lkml/20241213-a612-gpu-support-v3-1-0e9b25570a69@quicinc.com/
    Devicetree: https://lore.kernel.org/lkml/fu4rayftf3i4arf6l6bzqyzsctomglhpiniljkeuj74ftvzlpo@vklca2giwjlw/

Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
Changes in v2:
- Rebased on next-20251105
- Fix hwcg configuration (Dan)
- Reuse a few gmu-wrapper routines (Konrad)
- Split out rgmu dt schema (Krzysztof/Dmitry)
- Fixes for GPU dt binding doc (Krzysztof)
- Removed VDD_CX from rgmu dt node. Will post a separate series to
address the gpucc changes (Konrad)
- Fix the reg range size for adreno smmu node and reorder the properties (Konrad)
- Link to v1: https://lore.kernel.org/r/20251017-qcs615-spin-2-v1-0-0baa44f80905@oss.qualcomm.com

---
Akhil P Oommen (1):
      dt-bindings: display/msm: gpu: Document A612 GPU

Jie Zhang (4):
      drm/msm/a6xx: Add support for Adreno 612
      dt-bindings: display/msm/rgmu: Document A612 RGMU
      arm64: dts: qcom: sm6150: Add gpu and rgmu nodes
      arm64: dts: qcom: qcs615-ride: Enable Adreno 612 GPU

Qingqing Zhou (1):
      arm64: dts: qcom: sm6150: add the GPU SMMU node

 .../devicetree/bindings/display/msm/gpu.yaml       |  32 ++++-
 .../devicetree/bindings/display/msm/rgmu.yaml      | 131 +++++++++++++++++++
 MAINTAINERS                                        |   1 +
 arch/arm64/boot/dts/qcom/qcs615-ride.dts           |   8 ++
 arch/arm64/boot/dts/qcom/talos.dtsi                | 138 +++++++++++++++++++++
 drivers/gpu/drm/msm/adreno/a6xx_catalog.c          |  16 +++
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c              |  23 +++-
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c              |  45 +++++--
 drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c        |   3 +-
 drivers/gpu/drm/msm/adreno/adreno_gpu.c            |   1 +
 drivers/gpu/drm/msm/adreno/adreno_gpu.h            |  16 ++-
 11 files changed, 398 insertions(+), 16 deletions(-)
---
base-commit: 185cd3dc1a12b97194a62eba9d217d280ef74135
change-id: 20251015-qcs615-spin-2-ed45b0deb998

Best regards,
-- 
Akhil P Oommen <akhilpo@oss.qualcomm.com>


