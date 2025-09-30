Return-Path: <linux-arm-msm+bounces-75538-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E5F5DBAB837
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Sep 2025 07:49:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9A8573AACF9
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Sep 2025 05:49:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 32945226165;
	Tue, 30 Sep 2025 05:49:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="M/FmsapB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73A6381AA8
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Sep 2025 05:49:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759211392; cv=none; b=WNcpfwKygtP+w3/JsgBcXMNhninGN/BSiAg82ArMgvQZhLlycaJlmkHnHwE+bu/xQTNcKuatoiEGLxyP1qKSUJ2t0jxhwTdA4j7H4xOL5ZJApGnhuSbM6XIDV7YNhDmbdU6Pbf4YIjivsEFM8lSOb7eYnIDwKR5FSaRf2odgZxU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759211392; c=relaxed/simple;
	bh=Fo6yGEzkiN8eYG7gq04qwtqFSBGkYiT3ZCOWgbqhGrk=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=IMPA9PkiT42yAaD2cjyo4b/tXv6+RvPm6Ey/UatfXUkv+bl+FB5HCipUP6ubO8VUoQtoBRCcTjjtBYaHqjwYQ5CukvvXKGVoBHCvvrQbBxBrsRN9Mzdba3vHSlCMr7XwUJPjpuQn274oIzvvES3rM1m+vAZoJ+VHSc/Envghj1A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=M/FmsapB; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58U4HfBt027107
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Sep 2025 05:49:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=Pb4sLzARJd5B7XzZQvs/kr
	vXg3UPDBK/QIaQV6v0I4k=; b=M/FmsapB4tu6KqzsKB2br2TFDRoxqn5MAPxDgn
	2E5RyC5RHDCRm141Gkikocm2LwPGIs8V1eC4g2aCScNpKsiMMv9StnvPb8FsLpjy
	3UyLTk+9ZQUYJS+LcC6+rm70k6G4ZnhNQucO9FPS/1lqfH25P3/Mnb/ZA4ZAnesV
	WA9TJ90STIFC0wASMV9HcFbmUTF2+cHXidI1fAxj360YwtGdhFZpvhZihCOfKX7b
	MoW2MCuLj9ikUst/3yFE0y9dZKcm8WQDT8xHWycxZvdKaeCsa7FyYrDL+M60JC1m
	U4DnzFDjx+/Cn/aqFw6dkOp/u0evtwyOUN8Pbds9IOFXszfg==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49fyrf1c00-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Sep 2025 05:49:49 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-33428befb83so6267281a91.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 29 Sep 2025 22:49:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759211388; x=1759816188;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Pb4sLzARJd5B7XzZQvs/krvXg3UPDBK/QIaQV6v0I4k=;
        b=Blte321ufIPTSbICqq31b3NGgKAoRs08w3pHwhe7hNQZvn28MjzguteFXeewuDEAt6
         e3C5cwN6qzQSsSzr0l44LTQygbAb0WC3GFag/HnMD+E+bXLXRiR0scWEAMgAzhIYFaV6
         CJk2x+EefqLXqxD+eNwh3gHYCPd/AwXsneKjNLC62Cj8tLOH/AoewIwjpDKK5uZdWYv6
         Ywa9/lxvCwy5rJ3MrU9Cbd3gz26ak/9Q+oZJgKw0qbY1DDawqAQ+2uzD+XbDNQwHbtRs
         1CwXNzkiQj/lvNTgFUdZFlCcpiW5l+UrIsP75pPip/AOz8wGQUI2HnUZ6j9UBXpkLqKx
         LSqg==
X-Gm-Message-State: AOJu0Yyf8I9p7fbIpHi18GMyuxIvWfsrStiJOxUhOPkKgAahYmnz5epd
	YYQzJujFP0C42LfFMmYoRavKINzmDG9bst0dH2Hca8C5S5yKg252gE2aBjIM65SpAHJug5MCMfa
	/DfxFCnMQDFOD45U3pRA+vsCJcfdoXISlcMOFLKdua7iz86AYGxrbY+OAKKddw3mTKkG5
X-Gm-Gg: ASbGncvMUt23+NAixDmEoSe7Pcy7dCMKSvk+x8ccCAA1sWFT+cnpbZYrNAdHdaTFy/v
	fPiZ+Au3IXm0qLiobRNQn2dglJySgfTYAsJSokcm+bQ6eOUYnykNvkFkU1AtVjGN+p+EPXkPwZP
	jECl4ZdolfS1YVilb5/PwkbKBYv73fgDYgNnT45rtO4pjB1k/SoYZhsttS7NbGwy/TG8WNA2fq+
	tyuj9znGgS+KB580yoKOPy44n6VxF9wrVoNTLaUCPjuFulRngRJspvBOpSwIVLDxhkxBsoctLqG
	vGSRV9GouGSe3WjSvUKVoZzT/YHq8gl4ujs0uROst0T6LRc8uCEfyAZGciSCiDY5xiIvtQ==
X-Received: by 2002:a17:90a:dfd0:b0:32e:18fb:f05f with SMTP id 98e67ed59e1d1-3342a2bed85mr22004242a91.20.1759211388104;
        Mon, 29 Sep 2025 22:49:48 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE94h1e81GyuUho3hOpRoy66Of2Qjfb8fh6V3evXvP94fDjZdRApWnY55kzGb2iOYaWRqSQRg==
X-Received: by 2002:a17:90a:dfd0:b0:32e:18fb:f05f with SMTP id 98e67ed59e1d1-3342a2bed85mr22004194a91.20.1759211387608;
        Mon, 29 Sep 2025 22:49:47 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3341be23412sm19029779a91.20.2025.09.29.22.49.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Sep 2025 22:49:47 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Subject: [PATCH 00/17] drm/msm/adreno: Introduce Adreno 8xx family support
Date: Tue, 30 Sep 2025 11:18:05 +0530
Message-Id: <20250930-kaana-gpu-support-v1-0-73530b0700ed@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIABZv22gC/yWNywrDIBBFf0Vm3QEVCjW/UrKwOkml+KijJRDy7
 7XN8hy45+7AVAMxTGKHSp/AIacB6iLAPW1aCYMfDFrqqzTa4MvaZHEtHbmXkmtDpbxW7rZY5R2
 MXam0hO3fvM8nV3r3kW6nhIdlQpdjDG0SvkaMHDHR1vB3g9Kg0jAfxxcgGqa9ngAAAA==
X-Change-ID: 20250929-kaana-gpu-support-11d21c8fa1dc
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Sean Paul <sean@poorly.run>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
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
        Thomas Zimmermann <tzimmermann@suse.de>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
        devicetree@vger.kernel.org, Akhil P Oommen <akhilpo@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1759211380; l=5672;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=Fo6yGEzkiN8eYG7gq04qwtqFSBGkYiT3ZCOWgbqhGrk=;
 b=Jtl6CTtd0UHf6SsKad5aFW2GIGUoFJZUEncA4YV9colT9zAhd5q3JTFVkeq99abCsD55G4UEp
 aoljmlBZ6I/CfOOelsWr4T++9S3FSoCjiZrDiQR0qvbUiVc0N9pUkdM
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-ORIG-GUID: Z22RH9LTqKZK8ixrVQLsVWIvfvgeqaY_
X-Proofpoint-GUID: Z22RH9LTqKZK8ixrVQLsVWIvfvgeqaY_
X-Authority-Analysis: v=2.4 cv=etzSD4pX c=1 sm=1 tr=0 ts=68db6f7d cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=qC_FGOx9AAAA:8
 a=o6C-eYizE2q8LWGfbNMA:9 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22
 a=fsdK_YakeE02zTmptMdW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI5MDE3NSBTYWx0ZWRfX1yR8tgtwpktk
 Q+k62HeZYfPJ91aP17E2M/KMeDHB+pE+esa62nYj1q8apBR1MPLAHOT1yTJ3z4z3a7wHrfI642O
 JgUmQudbcuoq7q3Sn082B5BXLANDzfiI+/4Kr1GEnNbQzD/gP995HEaNMXaoubOgEqeqIdQj+pN
 rEvMJp7R9FFVsmqmcfY1VmxJ8QZsxyVPevj/LrQT+lDPj6i/z9naRa8jn8q5rOn4ju3FUS/i2bK
 bwvrja/AFTweiYI0OkDFiCARTHScEFRXWulBg/v6SqDbcVcDOVFIzwBfzKDxDqmcjs1LnIPbeNp
 DoPwHiYq7Lk4Y34tov5mQuvfpTSTZns2WP2j9hm2FblcsNjn7RmMVczVG59VUdwO3mSSRXjQ4Re
 qHwVU2SvfgZc8T08tsdL21VoAm8/Mw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-30_01,2025-09-29_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 clxscore=1015 suspectscore=0 malwarescore=0
 priorityscore=1501 spamscore=0 impostorscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2509290175

This series adds the A8xx HWL along with Adreno 840 GPU support to the
drm-msm driver. A8x is the next generation in the Adreno family,
featuring a significant hardware design change. A major update to the
design is the introduction of 'Slice' architecture. Slices are sort of
mini-GPUs within the GPU which are more independent in processing Graphics
and compute workloads. Also, in addition to the BV and BR pipe we saw in
A7x, CP has more concurrency with additional pipes.

From KMD-HW SWI perspective, there is significant register shuffling in
some of the blocks. For slice or aperture related registers which are
virtualized now, KMD/crashdumper has to configure an aperture register
to access them. On the GMU front, there are some shuffling in register
offsets, but it is manageable as of now. There is a new HFI message to
transfer data tables and new power related features to support higher
peak currents and thermal mitigations.

Adreno 840 GPU is the second generation architecture in the A8x family
present in Kaanapali (a.k.a Snapdragon 8 Elite Gen 5) chipset [1]. It
has a maximum of 3 slices with 2 SPs per slice. Along with the 3-slice
configuration, there is also another 2-slice SKU (Partial Slice SKU).
A840 GPU has a bigger 18MB of GMEM which can be utilized for graphics
and compute workload. It also features improved Concurrent binning
support, UBWC v6 etc.

This series adds only the driver side support along with a few dt bindings
updates. Devicetree patches will be sent separately, but those who
are interested can take look at it from the Qualcomm's public tree [2].
Features like coredump, gmu power features, ifpc, preemption etc will be
added in a future series.

Initial few patches are for improving code sharing between a6xx/a7xx and
a8x routines. Then there is a patch to rebase GMU register offsets from
GPU's base. Rest of the patches add A8x HWL and Adreno 840 GPU support.

Mesa support for A8x/A840 GPU is WIP and will be posted in the near
future.

[1] https://www.qualcomm.com/products/mobile/snapdragon/smartphones/snapdragon-8-series-mobile-platforms/snapdragon-8-elite-gen-5
[2] https://git.codelinaro.org/clo/linux-kernel/kernel-qcom/-/commit/5fb72c27909d56660db6afe8e3e08a09bd83a284

Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
Akhil P Oommen (17):
      soc: qcom: ubwc: Add config for Kaanapali
      drm/msm/a6xx: Fix the gemnoc workaround
      drm/msm/adreno: Common-ize PIPE definitions
      drm/msm/adreno: Create adreno_func->submit_flush()
      drm/msm/a6xx: Rename and move a7xx_cx_mem_init()
      drm/msm/adreno: Move adreno_gpu_func to catalogue
      drm/msm/adreno: Move gbif_halt() to adreno_gpu_func
      drm/msm/adreno: Add MMU fault handler to adreno_gpu_func
      drm/msm/a6xx: Sync latest register definitions
      drm/msm/a6xx: Rebase GMU register offsets
      drm/msm/a8xx: Add support for A8x GMU
      drm/msm/adreno: Introduce A8x GPU Support
      drm/msm/adreno: Support AQE engine
      drm/msm/a8xx: Add support for Adreno 840 GPU
      drm/msm/adreno: Do CX GBIF config before GMU start
      dt-bindings: arm-smmu: Add Kaanapali GPU SMMU
      dt-bindings: display/msm/gmu: Add Adreno 840 GMU

 .../devicetree/bindings/display/msm/gmu.yaml       |   30 +-
 .../devicetree/bindings/iommu/arm,smmu.yaml        |    1 +
 drivers/gpu/drm/msm/Makefile                       |    2 +
 drivers/gpu/drm/msm/adreno/a2xx_catalog.c          |    8 +-
 drivers/gpu/drm/msm/adreno/a2xx_gpu.c              |   50 +-
 drivers/gpu/drm/msm/adreno/a3xx_catalog.c          |   14 +-
 drivers/gpu/drm/msm/adreno/a3xx_gpu.c              |   52 +-
 drivers/gpu/drm/msm/adreno/a4xx_catalog.c          |    8 +-
 drivers/gpu/drm/msm/adreno/a4xx_gpu.c              |   54 +-
 drivers/gpu/drm/msm/adreno/a5xx_catalog.c          |   18 +-
 drivers/gpu/drm/msm/adreno/a5xx_gpu.c              |   61 +-
 drivers/gpu/drm/msm/adreno/a6xx_catalog.c          |  284 ++-
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c              |  233 ++-
 drivers/gpu/drm/msm/adreno/a6xx_gmu.h              |   25 +-
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c              |  389 ++--
 drivers/gpu/drm/msm/adreno/a6xx_gpu.h              |   24 +
 drivers/gpu/drm/msm/adreno/a6xx_gpu_state.h        |   18 +-
 drivers/gpu/drm/msm/adreno/a6xx_hfi.c              |   53 +
 drivers/gpu/drm/msm/adreno/a6xx_hfi.h              |   17 +
 drivers/gpu/drm/msm/adreno/a8xx_gpu.c              | 1237 +++++++++++++
 drivers/gpu/drm/msm/adreno/adreno_device.c         |    4 +-
 .../gpu/drm/msm/adreno/adreno_gen7_0_0_snapshot.h  |  420 ++---
 .../gpu/drm/msm/adreno/adreno_gen7_2_0_snapshot.h  |  332 ++--
 .../gpu/drm/msm/adreno/adreno_gen7_9_0_snapshot.h  |  470 ++---
 drivers/gpu/drm/msm/adreno/adreno_gpu.h            |   35 +-
 drivers/gpu/drm/msm/registers/adreno/a6xx.xml      | 1942 +++++++++++++++-----
 .../gpu/drm/msm/registers/adreno/a6xx_enums.xml    |    2 +-
 drivers/gpu/drm/msm/registers/adreno/a6xx_gmu.xml  |  283 +--
 .../gpu/drm/msm/registers/adreno/a7xx_enums.xml    |    7 -
 .../drm/msm/registers/adreno/a8xx_descriptors.xml  |  120 ++
 .../gpu/drm/msm/registers/adreno/a8xx_enums.xml    |  289 +++
 .../gpu/drm/msm/registers/adreno/adreno_common.xml |   12 +
 drivers/soc/qcom/ubwc_config.c                     |   11 +
 include/linux/soc/qcom/ubwc.h                      |    1 +
 34 files changed, 4890 insertions(+), 1616 deletions(-)
---
base-commit: 09c49a960070d0cdf79a593f3cccb830884f4c76
change-id: 20250929-kaana-gpu-support-11d21c8fa1dc

Best regards,
-- 
Akhil P Oommen <akhilpo@oss.qualcomm.com>


