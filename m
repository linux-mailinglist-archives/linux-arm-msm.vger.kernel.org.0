Return-Path: <linux-arm-msm+bounces-81067-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 67E79C48167
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Nov 2025 17:48:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id E25A34F8323
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Nov 2025 16:41:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B4696320CC3;
	Mon, 10 Nov 2025 16:38:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="X8N2pLnU";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QYl5AEA3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4B95304BB9
	for <linux-arm-msm@vger.kernel.org>; Mon, 10 Nov 2025 16:38:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762792691; cv=none; b=kMh0aA/HMvggV62v48L3Yt4XoO4Vmm9cWlxoj8z3wLegKCDozNJgBn6SccMs1xkdw6L3pzQDKXHltbmUXcZXZ3N0YDDF/YDiQrvDNgcIs4JYvsm+kPKpMWF4t/Tnhb3yiEq12QAKnwRzNGd6aJquokFpJfPNWoDQzMEDnUZHmR8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762792691; c=relaxed/simple;
	bh=e0tZjP7Qe9N4wBToPl6vw0GlMvFY4M8fG8jNcxK8i14=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Q/PJWy5x6xsy7/z6+Hf9wobIgbQGECKhyixcIwhExSzRtRROwyiuwgGDL7lK7+34PyFlS7nkpMHIxoSc6b9dtvp0xqguuO8j9PehVb01M6XTP1IQbQVEMs51Ge6eb6dolFt3FVAwa8FdL3SHvlvhYLnIi/N6Hf1WhMQU2UvJnlU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=X8N2pLnU; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QYl5AEA3; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AACNAAc3307030
	for <linux-arm-msm@vger.kernel.org>; Mon, 10 Nov 2025 16:38:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=rwQclgvLFFMg1Jy3+mU8x4
	6Ud/t9TZacyJBkgEpno+w=; b=X8N2pLnUTC9Ptbm/vLB/XQBvnei0ixlF0SPXPX
	ywzCxZOwRktZhx474x9ic3XOOwU4OExZ7zOja0aKgqsD2A5JLyy8Hwegv2L1hdd0
	7kJv9CWKmzHc346dKmSv7UG2ZBLY6AnUs5LcL9nIL+mnk8rHO75pdEvgJwO1fvVX
	lgQKq0uwbqJeQQ57EBTtSJ+gLQ4MnV/5+taFr6g68X5OwQ7NJsZV8NJjbvHhxrH8
	UU23HURK8c5c0wmNIEcc2xxzD04Fhsd0Y5ldiJ+tvBiwJnUsx2S5niTM3pf62n3T
	RIPjJQ1ymraR/EDGzkp3qBB2S82GYE7ZCLa7I9x+f9zE5p1g==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4abg0q8rrq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 10 Nov 2025 16:38:08 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-343806688cbso2265887a91.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 10 Nov 2025 08:38:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762792688; x=1763397488; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=rwQclgvLFFMg1Jy3+mU8x46Ud/t9TZacyJBkgEpno+w=;
        b=QYl5AEA3NtXHEuF3QnKNa2fEdjutDrnzRO8t6DQLKjYbYIlMB6bEMJ0T7g97kPJUjI
         pzvOqspiQkIG65kSU4vaJbn3Zfk/eNXCOZaMQDJ4kpcHcqT7xjoTQUNEyc7T03CBxDYI
         6F9FCej2fXHwiX/AxuAUm7G6UM/iJklOvb+Wt5zhes1aYwLiz8HYQl2X3c7m3JVfuFpq
         DUuNFPESvLCCM24hx4T70rZbr+7ECrgXc3MM43Wlk58ac7HezF6C+n/djCF5fBScr6wI
         Z5UQ4JETwkyV4HHHAWUbrLlNDw+ULRYDZhK5I9ETRmFmGsdKrcAsNNXuxlogwn7owzny
         XwZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762792688; x=1763397488;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rwQclgvLFFMg1Jy3+mU8x46Ud/t9TZacyJBkgEpno+w=;
        b=RqK8UmN2vOJQEvZmi/QIEsFYr1oGgHt/vtscvRrrTbcRMBtbfEMBc1ApENAzJhOQVA
         rEjIMd0jTfeGS19D7Qw6jN0ZtE8hwwwaLo2ZbAimdDHkCKde4uKrxMIDGZoJ6GzJRTLe
         E3PRI9GiEYGZL/7y7PQq/P/4AYPIdeWCd0uKHC/Tp0cvQq8XrcH9dQxhM6XXywTSHcaP
         IAl7UQJdGqTG9q1vRFKL8gee34oE15dXPTrIxKUPDJ4ri3XYytsIcTs/o3NFz363KeUZ
         aqg/xSnuN7NcDmQnXYc5tc6Ia0ESy3cm37N4pJeZfmW2ClTyEKC6Nr/j3BAGLxd0JvWJ
         gMLA==
X-Gm-Message-State: AOJu0Yzlcy4Zq+F5uNj95E8YR52kLBb2bPSEhoxBWJpO9c7rzwfLiKat
	rpr+/8c0AuLHu82UUfWtHnkx1vODW5RchtENPcLgn6g0VjpiuibZgYqPmay0V0qkU86rEPOe+It
	GgFyBoNnjNbLcK7ybO5X6BKRFlgoBY2VIisW7P5XlgZl6oVI6UvHkxCsbvlWmRQ0D/H8/
X-Gm-Gg: ASbGncu8KE83Ifwmo8hKCP5ln/yDV1DFvi+FTbLzZWS3DRpFbM+0t58eCXV4hKGH8Rr
	RWog+0OsHrzR74vfjJkw3kYEmBaNJBkgz5NH8LQEufACOrV33Ngv4RPUdqfu1j2HOuCpe0a8SYF
	WLCW0p7ExgdP0fO36ChH/KH3cGvOGpLqdYs0QvKN+K9ieETfAPkYfrjvLOr+EFZYGp4GcbKt37m
	UM1NAa+7d9T5lSoIVFvlfuH+Fw7PDV6LElHoX3mehZeGmPdZgEjnPbRg6kYtTJA/FMWeSMk27gg
	HF9U8ahHxydPe9PLheYbLPtnxeWXx2oUaYzZjvHWBxUxaiKnRIk29f68KD5IXW6BZr3eXdfSBWr
	E3XMySoIEI/BwO2aTkCxNks0=
X-Received: by 2002:a17:90b:2709:b0:341:8ac6:2244 with SMTP id 98e67ed59e1d1-3436cb8a1aamr11833534a91.9.1762792688196;
        Mon, 10 Nov 2025 08:38:08 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF9IR983tQ7jp/h61keZWyTMidbuW/Wa4ZsFytaus/HLT/avC1cbjo9J24JLLOBJbusejEWtg==
X-Received: by 2002:a17:90b:2709:b0:341:8ac6:2244 with SMTP id 98e67ed59e1d1-3436cb8a1aamr11833481a91.9.1762792687642;
        Mon, 10 Nov 2025 08:38:07 -0800 (PST)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3434c337b20sm11468922a91.13.2025.11.10.08.37.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Nov 2025 08:38:07 -0800 (PST)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Subject: [PATCH v2 00/21] drm/msm/adreno: Introduce Adreno 8xx family
 support
Date: Mon, 10 Nov 2025 22:07:06 +0530
Message-Id: <20251110-kaana-gpu-support-v2-0-bef18acd5e94@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIALIUEmkC/22OQQ6CMBBFr0Jm7ZiZEoOw8h6GRYVBGoVCWwjGc
 HcLbN1M8n/y35sveHFGPBTJF5zMxhvbx6BOCVSt7p+Cpo4ZFKkL5SrHl9a9xucwoZ+GwbqAzLX
 i6tporiuIu8FJY5adeS+P7GScIjocJTy0F6xs15lQJL0sATc8MxNsg9b4YN1n/2nmfXHoU/qjn
 xkJs/SS0oMyIqlv1vvzOOn3ZjjHA+W6rj//TXMz6gAAAA==
X-Change-ID: 20250929-kaana-gpu-support-11d21c8fa1dc
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
        devicetree@vger.kernel.org, Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1762792679; l=7012;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=e0tZjP7Qe9N4wBToPl6vw0GlMvFY4M8fG8jNcxK8i14=;
 b=ilcPLfSac+bNgXXBl9ND3EE9MqO4taFpOdgLspJm2dJRHhG6w1+8UJbKjba5daSTwh4bWbowD
 KgDJEXKrrXCDjgQZtHYnvEGotJleuyw7ZFUZJINGSN2j54Y/ZzBODgW
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Authority-Analysis: v=2.4 cv=D6JK6/Rj c=1 sm=1 tr=0 ts=691214f1 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=qC_FGOx9AAAA:8 a=VwQbUJbxAAAA:8
 a=3aah4hanITsq5OUIlK8A:9 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22
 a=fsdK_YakeE02zTmptMdW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTEwMDE0MCBTYWx0ZWRfXx7E+YQkuJI5T
 FOeWnsiTugBnTPY/Mu6UbLETyijg2J3I9IkZEnZU+SyW0BcIvyT/s60xQOVoZHG5ZuHJcGRE0Ch
 gGXLWUfBrOQdlA0DHqWzu02GF8SbFJkcJC0NnTwmYtc52vAkgwn52mlFjiUUBFaYKxw3yGetzSH
 YBV2mAyhN6lY0bBSoXjTpeE9mtW0fBX+fMACz2+m1NvRJzBA71Mn181UtVDfzKykAuW+7dTV/zy
 agRVqkO+RO5BJ6WmJcZAG04ejfGv8CXgaLwPU/IPM/kO+yhaOnQmY2lpywYu3/WYh5kHoJu5Q7c
 V5uFMf/cHjXmjfPUoEVwHscDj2IYsJ9O46PvDMwgZiwxkvyKMgbMLhbWpr8pkSS8vzpL2HxEuKt
 EAq2s1mi3Ol13Lu3oUQjBWTGxACG+w==
X-Proofpoint-GUID: ekZ6vU1Z5Ps8uATrTkaFkt_JAthr5YH4
X-Proofpoint-ORIG-GUID: ekZ6vU1Z5Ps8uATrTkaFkt_JAthr5YH4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-10_06,2025-11-10_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 bulkscore=0 malwarescore=0 phishscore=0
 lowpriorityscore=0 suspectscore=0 clxscore=1015 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511100140

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

Adreno X2-85 GPU present in Glymur chipset is very similar to A840
architecturally. So adding initial support for it requires just an
additional entry in the catalog with the necessary register lists.

This series adds only the driver side support along with a few dt bindings
updates. Devicetree patches will be sent separately, but those who
are interested can take look at it from the Qualcomm's public tree [2].
Features like coredump, gmu power features, ifpc, preemption etc will be
added in a future series.

Initial few patches are for improving code sharing between a6xx/a7xx and
a8x routines. Then there is a patch to rebase GMU register offsets from
GPU's base. Rest of the patches add A8x HWL and Adreno 840/X2-85 GPU
support.

Mesa support for A8x/A840 GPU is WIP and will be posted in the near
future.

[1] https://www.qualcomm.com/products/mobile/snapdragon/smartphones/snapdragon-8-series-mobile-platforms/snapdragon-8-elite-gen-5
[2] https://git.codelinaro.org/clo/linux-kernel/kernel-qcom/-/commit/5fb72c27909d56660db6afe8e3e08a09bd83a284

Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
Changes in v2:
- Rebase on top of next-20251110 tag
- Include support for Glymur chipset
- Drop the ubwc_config driver patch as it is picked up
- Sync the latest a6xx register definitions from Rob's tree
- New patch to do LRZ flush to fix pagefaults
- Reuse a7xx_cx_mem_init(). Dropped related patch (Connor)
- Few changes around cp protect configuration to align it with downstream
- Fix the incorrect register usage at few places
- Updates to non-ctxt register list
- Serialize aperture updates (Rob)
- More helpful cp error irq logging
- Split A8x GMU support patch (Dmitry)
- Use devm_platform_get_and_ioremap_resource in GMU init (Konrad)
- Link to v1: https://lore.kernel.org/r/20250930-kaana-gpu-support-v1-0-73530b0700ed@oss.qualcomm.com

---
Akhil P Oommen (21):
      drm/msm/a6xx: Flush LRZ cache before PT switch
      drm/msm/a6xx: Fix the gemnoc workaround
      drm/msm/adreno: Common-ize PIPE definitions
      drm/msm/adreno: Create adreno_func->submit_flush()
      drm/msm/adreno: Move adreno_gpu_func to catalogue
      drm/msm/adreno: Move gbif_halt() to adreno_gpu_func
      drm/msm/adreno: Add MMU fault handler to adreno_gpu_func
      drm/msm/a6xx: Sync latest register definitions
      drm/msm/a6xx: Rebase GMU register offsets
      drm/msm/a8xx: Add support for A8x GMU
      drm/msm/a6xx: Improve MX rail fallback in RPMH vote init
      drm/msm/a6xx: Share dependency vote table with GMU
      drm/msm/adreno: Introduce A8x GPU Support
      drm/msm/adreno: Support AQE engine
      drm/msm/a8xx: Add support for Adreno 840 GPU
      drm/msm/adreno: Do CX GBIF config before GMU start
      drm/msm/a8xx: Add support for Adreno X2-85 GPU
      dt-bindings: arm-smmu: Add Kaanapali GPU SMMU
      dt-bindings: display/msm/gmu: Add Adreno 840 GMU
      dt-bindings: display/msm/gmu: Add Adreno X2-85 GMU
      dt-bindings: arm-smmu: Add Glymur GPU SMMU

 .../devicetree/bindings/display/msm/gmu.yaml       |   60 +-
 .../devicetree/bindings/iommu/arm,smmu.yaml        |    2 +
 drivers/gpu/drm/msm/Makefile                       |    2 +
 drivers/gpu/drm/msm/adreno/a2xx_catalog.c          |    7 +-
 drivers/gpu/drm/msm/adreno/a2xx_gpu.c              |   50 +-
 drivers/gpu/drm/msm/adreno/a2xx_gpu.h              |    2 +
 drivers/gpu/drm/msm/adreno/a3xx_catalog.c          |   13 +-
 drivers/gpu/drm/msm/adreno/a3xx_gpu.c              |   52 +-
 drivers/gpu/drm/msm/adreno/a3xx_gpu.h              |    2 +
 drivers/gpu/drm/msm/adreno/a4xx_catalog.c          |    7 +-
 drivers/gpu/drm/msm/adreno/a4xx_gpu.c              |   54 +-
 drivers/gpu/drm/msm/adreno/a4xx_gpu.h              |    2 +
 drivers/gpu/drm/msm/adreno/a5xx_catalog.c          |   17 +-
 drivers/gpu/drm/msm/adreno/a5xx_gpu.c              |   61 +-
 drivers/gpu/drm/msm/adreno/a5xx_gpu.h              |    1 +
 drivers/gpu/drm/msm/adreno/a6xx_catalog.c          |  411 ++++-
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c              |  286 ++-
 drivers/gpu/drm/msm/adreno/a6xx_gmu.h              |   25 +-
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c              |  410 ++--
 drivers/gpu/drm/msm/adreno/a6xx_gpu.h              |   32 +-
 drivers/gpu/drm/msm/adreno/a6xx_gpu_state.h        |   18 +-
 drivers/gpu/drm/msm/adreno/a6xx_hfi.c              |   53 +
 drivers/gpu/drm/msm/adreno/a6xx_hfi.h              |   17 +
 drivers/gpu/drm/msm/adreno/a8xx_gpu.c              | 1198 ++++++++++++
 drivers/gpu/drm/msm/adreno/adreno_device.c         |    4 +-
 .../gpu/drm/msm/adreno/adreno_gen7_0_0_snapshot.h  |  420 ++---
 .../gpu/drm/msm/adreno/adreno_gen7_2_0_snapshot.h  |  332 ++--
 .../gpu/drm/msm/adreno/adreno_gen7_9_0_snapshot.h  |  470 ++---
 drivers/gpu/drm/msm/adreno/adreno_gpu.h            |   39 +-
 drivers/gpu/drm/msm/registers/adreno/a6xx.xml      | 1951 +++++++++++++++-----
 .../gpu/drm/msm/registers/adreno/a6xx_enums.xml    |    2 +-
 drivers/gpu/drm/msm/registers/adreno/a6xx_gmu.xml  |  283 +--
 .../gpu/drm/msm/registers/adreno/a7xx_enums.xml    |    7 -
 .../drm/msm/registers/adreno/a8xx_descriptors.xml  |  120 ++
 .../gpu/drm/msm/registers/adreno/a8xx_enums.xml    |  289 +++
 .../gpu/drm/msm/registers/adreno/adreno_common.xml |   12 +
 36 files changed, 5056 insertions(+), 1655 deletions(-)
---
base-commit: edf57d8dafc63f9298a209e518ea6a2e0df78ed0
change-id: 20250929-kaana-gpu-support-11d21c8fa1dc

Best regards,
-- 
Akhil P Oommen <akhilpo@oss.qualcomm.com>


