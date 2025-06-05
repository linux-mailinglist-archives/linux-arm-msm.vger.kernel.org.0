Return-Path: <linux-arm-msm+bounces-60373-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 21D7DACF699
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Jun 2025 20:32:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8550A3ADB3A
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Jun 2025 18:31:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C95F41F2C45;
	Thu,  5 Jun 2025 18:32:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HuFgLxs4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE2882AF19
	for <linux-arm-msm@vger.kernel.org>; Thu,  5 Jun 2025 18:32:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749148331; cv=none; b=Wq+urJ4LsxX5PBkFj2U6TlQ/F0fyVBMpXI1UZxefceUkr6av0CZfAS7wG4bDvKwYrMd4ujEDT+e0g0WKZacgtBvjeVTp9qxOssPwb9/6v8Z2HbfPA8CHKJXuuf4yIwJMBOI+vy3zKrL2yjQ262JLNRbS8SMeaRlN7U4MjNdTbtY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749148331; c=relaxed/simple;
	bh=819nSBPoIuWMydruyeOciA20s0lPu+TSZhECeNKmWZA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=nvYTTtR1RhyKaH/UytacKwgEDoKxWRz19BHOCD/uFYFASqG9yDf6fGb95Ld0dg68UQ5Js3x7aCmG3xHNZ2qzwLkR4BIPsGsg+tNQ+eXcZsU9ok8q7wQL8vNYxia4VE2nihUU9vd3bGN0u1CKDOJFIET7r7PBJSdM0CP7kmL/YgU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HuFgLxs4; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 555H1BvV027543
	for <linux-arm-msm@vger.kernel.org>; Thu, 5 Jun 2025 18:32:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=EbkEQB58Ld4nL18JV6VryQl6iNajcUl8L84
	E7nzQctY=; b=HuFgLxs45bFXN3TASiM9MayDYeBJFMD7eulzvKG59uiguFE40JL
	MhXF/4ZIC6N/cni+NUmuZJhkLglT/+HBz0Ze9oY7cFfT7oEvOLdFrFGx+dHfA4qC
	Bb5fnlk7ab15bsDpIzWzMeSFliDQNfa4yQk5cEeoU6kmUqXHsLxGvU147LDqe6Vl
	PHyZiZh7agujSbk3uO3bxKHM7uezWPBwJxtbmB6Qq9WaxMfWwdkXes/pETisIxTu
	jnwONT7KI+d01Hy+zFGf4LwbqFIZNlfOtk8zLvRNA01FA2z+EfVq3cnlMZrkh39f
	cAuxx6hILAe2jY1rVajzZfDJs19zxlWaa/Q==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 471g8ta9fk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 05 Jun 2025 18:32:08 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2355651d204so11988395ad.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 05 Jun 2025 11:32:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749148328; x=1749753128;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EbkEQB58Ld4nL18JV6VryQl6iNajcUl8L84E7nzQctY=;
        b=Pts3HdrAkie4QcJMlFN68I9NFUNQv30HnL9ZaFT9Q2QUX9pt6sxS1ZfpWz+xySyT35
         hUBjtpYSQaYEZLCmo4J6e3qOeSWohpfEaMcEv4VJoBUJifbnOY1X+HP719BqQvqT6ENa
         SoX+jb9Okj4Qc9h9KeCPMQt3wpjh6Ms49egZFfA7uKPJrHQTJJJm+IRdr+LWzpW46FVt
         FRWJZzSaP73XSPSH0E3A62Z4TscITQ42h7a8rad87cmj+0GnyfYMON7hT7IW9DjuknvH
         WWT+bgZEMo4fKB+Os+q6hrFz/oVNsy+HaC3bylGFCv1MNTRQbTqYRTJsPP/6atOQAF16
         ZEkA==
X-Forwarded-Encrypted: i=1; AJvYcCUoFO2cEvsJQ3xsr8vtaYWZ2GYbd1fwJSfIOfYg+zjYrsicWTEchxK157qL9eXxRK0eQq7eTrLjXx38cP9i@vger.kernel.org
X-Gm-Message-State: AOJu0YxyWsTM76NaxfS1pvC1B+Tlr2U9FDrDsLocs+6aweIm5zX7k3la
	lcFfFeLttt3Zx2SqF8RkLfMw7d7iDcfpN+ZoRubnpwlRdnjndhpj+nz0QJPjLiqWYYn57eH7TpU
	fuUkQD+1VI55QR6XyWlZhBfSajsrPqOakRR97o1hJ1/0E0/DqSMZgmEn7zgj38e/JHKUd
X-Gm-Gg: ASbGncsxwkks3i95FAz/oUqRQn5EqhY/9elcuOf6pJUxnLuXu0t+fCJK0lEv/bEuw9N
	4AkkvhDu0+F6OMJM7Q5u7rocu0MicO7bFms4fDSw9CaAf18BYjiqGZ2hfFH0xIV4TwxHPotCn/u
	LCIxOIK4i8/uF7wwL0yetJanbibFG4Mye8REcO451pyozblzTaOQebARNnvjOV0YvCzRo7EYWfk
	AQ8M0EcnITjSGrQneLIZ9yEKKAOeqpS+MKAafCIjqrAZP3NoXQ3FLRcM00YctBo3rL+sxqVNmBt
	M/yDidNXHWtlZkg5gYrQ1g==
X-Received: by 2002:a17:902:d54e:b0:235:6aa:1675 with SMTP id d9443c01a7336-23601ee0108mr4448765ad.52.1749148327891;
        Thu, 05 Jun 2025 11:32:07 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE8anFpbUiAtQTPh5i+Y3L4P6zV7H6CR2FiWWEvnWMcwq9/7jX7gsE9Cmpi8vb0MAgBmCT3fw==
X-Received: by 2002:a17:902:d54e:b0:235:6aa:1675 with SMTP id d9443c01a7336-23601ee0108mr4448185ad.52.1749148327473;
        Thu, 05 Jun 2025 11:32:07 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:89fa:e299:1a34:c1f5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23506cd75e1sm122853425ad.112.2025.06.05.11.32.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Jun 2025 11:32:07 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        Connor Abbott <cwabbott0@gmail.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Arnd Bergmann <arnd@arndb.de>,
        =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
        David Airlie <airlied@gmail.com>, Dmitry Baryshkov <lumag@kernel.org>,
        Eugene Lepshy <fekz115@gmail.com>,
        Jessica Zhang <quic_jesszhan@quicinc.com>,
        Jonathan Marek <jonathan@marek.ca>, Jun Nie <jun.nie@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        linaro-mm-sig@lists.linaro.org (moderated list:DMA BUFFER SHARING FRAMEWORK:Keyword:\bdma_(?:buf|fence|resv)\b),
        linux-kernel@vger.kernel.org (open list),
        linux-media@vger.kernel.org (open list:DMA BUFFER SHARING FRAMEWORK:Keyword:\bdma_(?:buf|fence|resv)\b),
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Maxime Ripard <mripard@kernel.org>, Rob Clark <robdclark@gmail.com>,
        Sean Paul <sean@poorly.run>, Simona Vetter <simona@ffwll.ch>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v6 00/40] drm/msm: sparse / "VM_BIND" support
Date: Thu,  5 Jun 2025 11:28:45 -0700
Message-ID: <20250605183111.163594-1-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=eJQTjGp1 c=1 sm=1 tr=0 ts=6841e2a8 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10
 a=e5mUnYsNAAAA:8 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=zBYVM8QCAAAA:8
 a=ajksXRGWIgAGF9WJ9h0A:9 a=eVM1_HBmYRkA:10 a=YgSuLXRpIuYA:10
 a=te1wHPZ5H10A:10 a=GvdueXVYPmCkWapjIL-Q:22 a=Vxmtnl_E_bksehYqCbjh:22
 a=ArXkYGXkE6hBHcUMFODu:22
X-Proofpoint-ORIG-GUID: rF-fsdwZjiVcGi-SeORb0SFjjsVxLPFN
X-Proofpoint-GUID: rF-fsdwZjiVcGi-SeORb0SFjjsVxLPFN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA1MDE2MyBTYWx0ZWRfX/9Z7R+6l0h9M
 UEMrPR4QIxvEJPoaw2u/wVP/wYFkAHWlHvv4DkMX3MmaBJDN4admbIJzU/z7uH2abxFz7K3iqDk
 gXXmzM0b6QMkHZjzzWNp7x9OOr45Q0zb+1gKVShPMZ9Zy7J0ygkMsNBy9XtmxeeZRYTJ7xgR6Cz
 JtVU7HJKFn+Zin1mNzVyUGNHem3r2PIrkNq8zQ34WGf+0IeF64OUtKlAW33/FSgC180T9XsBaOy
 sVlxsHBDShY98KZjqrKXZMbQhTAPmT30nRmquXl3v1M9RtQpg/Ay3D9xOBKqabBiperogOS7AFF
 5nHn4cL67BkpvCFzuFQKU8m2T8brBgsIuSfqto23H3Hzmi6XnWG+Z74wo5Px0ogKFgPsbZ6VpVh
 PoCDPEy2CYZDh+9A0t3z2EPz1JlOPBqQt1F/GTmdjVt6eFf8z6h5uaD2IWfH4ZqI7rwBNvHq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-05_05,2025-06-05_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 lowpriorityscore=0 clxscore=1015
 priorityscore=1501 bulkscore=0 mlxlogscore=999 impostorscore=0 spamscore=0
 phishscore=0 mlxscore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506050163

Conversion to DRM GPU VA Manager[1], and adding support for Vulkan Sparse
Memory[2] in the form of:

1. A new VM_BIND submitqueue type for executing VM MSM_SUBMIT_BO_OP_MAP/
   MAP_NULL/UNMAP commands

2. A new VM_BIND ioctl to allow submitting batches of one or more
   MAP/MAP_NULL/UNMAP commands to a VM_BIND submitqueue

I did not implement support for synchronous VM_BIND commands.  Since
userspace could just immediately wait for the `SUBMIT` to complete, I don't
think we need this extra complexity in the kernel.  Synchronous/immediate
VM_BIND operations could be implemented with a 2nd VM_BIND submitqueue.

The corresponding mesa MR: https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/32533

Changes in v6:
- Drop io-pgtable-arm patch as it has already been picked up in the
  iommu tree.
- Rework to drop gpuvm changes.  To mitigate the limitation of gpuvm
  when it comes to lazy unmap (and to avoid ~5ms of unmap per pageflip!)
  a vma_ref refcount is added.  This refcount is incremented when a BO
  is pinned for scanout, and for userspace handles and dma-bufs.  The
  VMA is torn down when this count drops to zero, breaking the reference
  loop between the VM_BO and BO.  But as long as a pin or userspace
  handle is keeping a reference to the BO live, we allow the harmless
  reference loop to live.  (This is only for kernel managed VMs, which
  includes the kms VM.)  If no userspace process has some sort of
  handle to the BO, it is unlikely to be reused again.  (The exception
  is GET_FB, but in that case the vma_ref >= 1 due to pin for scan-
  out.)
- Drop gpu sched changes for throttling and move this into the driver.
  We can re-visit a more generic solution when some other driver
  realizes they need the same thing.
- Link to v5: https://lore.kernel.org/all/20250519175348.11924-1-robdclark@gmail.com/

Changes in v5:
- Improved drm/sched enqueue_credit comments, and better define the
  return from drm_sched_entity_push_job()
- Improve DRM_GPUVM_VA_WEAK_REF comments, and additional WARN_ON()s to
  make it clear that some of the gpuvm functionality is not available
  in this mode.
- Link to v4: https://lore.kernel.org/all/20250514175527.42488-1-robdclark@gmail.com/

Changes in v4:
- Various locking/etc fixes
- Optimize the pgtable preallocation.  If userspace sorts the VM_BIND ops
  then the kernel detects ops that fall into the same 2MB last level PTD
  to avoid duplicate page preallocation.
- Add way to throttle pushing jobs to the scheduler, to cap the amount of
  potentially temporary prealloc'd pgtable pages.
- Add vm_log to devcoredump for debugging.  If the vm_log_shift module
  param is set, keep a log of the last 1<<vm_log_shift VM updates for
  easier debugging of faults/crashes.
- Link to v3: https://lore.kernel.org/all/20250428205619.227835-1-robdclark@gmail.com/

Changes in v3:
- Switched to seperate VM_BIND ioctl.  This makes the UABI a bit
  cleaner, but OTOH the userspace code was cleaner when the end result
  of either type of VkQueue lead to the same ioctl.  So I'm a bit on
  the fence.
- Switched to doing the gpuvm bookkeeping synchronously, and only
  deferring the pgtable updates.  This avoids needing to hold any resv
  locks in the fence signaling path, resolving the last shrinker related
  lockdep complaints.  OTOH it means userspace can trigger invalid
  pgtable updates with multiple VM_BIND queues.  In this case, we ensure
  that unmaps happen completely (to prevent userspace from using this to
  access free'd pages), mark the context as unusable, and move on with
  life.
- Link to v2: https://lore.kernel.org/all/20250319145425.51935-1-robdclark@gmail.com/

Changes in v2:
- Dropped Bibek Kumar Patro's arm-smmu patches[3], which have since been
  merged.
- Pre-allocate all the things, and drop HACK patch which disabled shrinker.
  This includes ensuring that vm_bo objects are allocated up front, pre-
  allocating VMA objects, and pre-allocating pages used for pgtable updates.
  The latter utilizes io_pgtable_cfg callbacks for pgtable alloc/free, that
  were initially added for panthor.
- Add back support for BO dumping for devcoredump.
- Link to v1 (RFC): https://lore.kernel.org/dri-devel/20241207161651.410556-1-robdclark@gmail.com/T/#t

[1] https://www.kernel.org/doc/html/next/gpu/drm-mm.html#drm-gpuvm
[2] https://docs.vulkan.org/spec/latest/chapters/sparsemem.html
[3] https://patchwork.kernel.org/project/linux-arm-kernel/list/?series=909700

Rob Clark (40):
  drm/gem: Add ww_acquire_ctx support to drm_gem_lru_scan()
  drm/msm: Rename msm_file_private -> msm_context
  drm/msm: Improve msm_context comments
  drm/msm: Rename msm_gem_address_space -> msm_gem_vm
  drm/msm: Remove vram carveout support
  drm/msm: Collapse vma allocation and initialization
  drm/msm: Collapse vma close and delete
  drm/msm: Don't close VMAs on purge
  drm/msm: Stop passing vm to msm_framebuffer
  drm/msm: Refcount framebuffer pins
  drm/msm: drm_gpuvm conversion
  drm/msm: Convert vm locking
  drm/msm: Use drm_gpuvm types more
  drm/msm: Split out helper to get iommu prot flags
  drm/msm: Add mmu support for non-zero offset
  drm/msm: Add PRR support
  drm/msm: Rename msm_gem_vma_purge() -> _unmap()
  drm/msm: Drop queued submits on lastclose()
  drm/msm: Lazily create context VM
  drm/msm: Add opt-in for VM_BIND
  drm/msm: Mark VM as unusable on GPU hangs
  drm/msm: Add _NO_SHARE flag
  drm/msm: Crashdump prep for sparse mappings
  drm/msm: rd dumping prep for sparse mappings
  drm/msm: Crashdump support for sparse
  drm/msm: rd dumping support for sparse
  drm/msm: Extract out syncobj helpers
  drm/msm: Use DMA_RESV_USAGE_BOOKKEEP/KERNEL
  drm/msm: Add VM_BIND submitqueue
  drm/msm: Support IO_PGTABLE_QUIRK_NO_WARN_ON
  drm/msm: Support pgtable preallocation
  drm/msm: Split out map/unmap ops
  drm/msm: Add VM_BIND ioctl
  drm/msm: Add VM logging for VM_BIND updates
  drm/msm: Add VMA unmap reason
  drm/msm: Add mmu prealloc tracepoint
  drm/msm: use trylock for debugfs
  drm/msm: Bump UAPI version
  drm/msm: Defer VMA unmap for fb unpins
  drm/msm: Add VM_BIND throttling

 drivers/gpu/drm/drm_gem.c                     |   14 +-
 drivers/gpu/drm/msm/Kconfig                   |    1 +
 drivers/gpu/drm/msm/Makefile                  |    1 +
 drivers/gpu/drm/msm/adreno/a2xx_gpu.c         |   25 +-
 drivers/gpu/drm/msm/adreno/a2xx_gpummu.c      |    5 +-
 drivers/gpu/drm/msm/adreno/a3xx_gpu.c         |   17 +-
 drivers/gpu/drm/msm/adreno/a4xx_gpu.c         |   17 +-
 drivers/gpu/drm/msm/adreno/a5xx_debugfs.c     |    4 +-
 drivers/gpu/drm/msm/adreno/a5xx_gpu.c         |   22 +-
 drivers/gpu/drm/msm/adreno/a5xx_power.c       |    2 +-
 drivers/gpu/drm/msm/adreno/a5xx_preempt.c     |   10 +-
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c         |   32 +-
 drivers/gpu/drm/msm/adreno/a6xx_gmu.h         |    2 +-
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c         |   49 +-
 drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c   |    6 +-
 drivers/gpu/drm/msm/adreno/a6xx_preempt.c     |   10 +-
 drivers/gpu/drm/msm/adreno/adreno_device.c    |    4 -
 drivers/gpu/drm/msm/adreno/adreno_gpu.c       |   99 +-
 drivers/gpu/drm/msm/adreno/adreno_gpu.h       |   23 +-
 .../drm/msm/disp/dpu1/dpu_encoder_phys_wb.c   |   11 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c   |   20 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_formats.h   |    3 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c       |   18 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c     |   22 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h     |    2 -
 drivers/gpu/drm/msm/disp/mdp4/mdp4_crtc.c     |    6 +-
 drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c      |   28 +-
 drivers/gpu/drm/msm/disp/mdp4/mdp4_plane.c    |   18 +-
 drivers/gpu/drm/msm/disp/mdp5/mdp5_crtc.c     |    4 +-
 drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c      |   19 +-
 drivers/gpu/drm/msm/disp/mdp5/mdp5_plane.c    |   18 +-
 drivers/gpu/drm/msm/dsi/dsi_host.c            |   14 +-
 drivers/gpu/drm/msm/msm_drv.c                 |  184 +-
 drivers/gpu/drm/msm/msm_drv.h                 |   29 +-
 drivers/gpu/drm/msm/msm_fb.c                  |   30 +-
 drivers/gpu/drm/msm/msm_fbdev.c               |    2 +-
 drivers/gpu/drm/msm/msm_gem.c                 |  553 +++---
 drivers/gpu/drm/msm/msm_gem.h                 |  277 ++-
 drivers/gpu/drm/msm/msm_gem_prime.c           |   48 +
 drivers/gpu/drm/msm/msm_gem_shrinker.c        |  104 +-
 drivers/gpu/drm/msm/msm_gem_submit.c          |  306 ++--
 drivers/gpu/drm/msm/msm_gem_vma.c             | 1486 ++++++++++++++++-
 drivers/gpu/drm/msm/msm_gpu.c                 |  211 ++-
 drivers/gpu/drm/msm/msm_gpu.h                 |  147 +-
 drivers/gpu/drm/msm/msm_gpu_trace.h           |   14 +
 drivers/gpu/drm/msm/msm_iommu.c               |  302 +++-
 drivers/gpu/drm/msm/msm_kms.c                 |   18 +-
 drivers/gpu/drm/msm/msm_kms.h                 |    2 +-
 drivers/gpu/drm/msm/msm_mmu.h                 |   38 +-
 drivers/gpu/drm/msm/msm_rd.c                  |   62 +-
 drivers/gpu/drm/msm/msm_ringbuffer.c          |   10 +-
 drivers/gpu/drm/msm/msm_submitqueue.c         |   96 +-
 drivers/gpu/drm/msm/msm_syncobj.c             |  172 ++
 drivers/gpu/drm/msm/msm_syncobj.h             |   37 +
 include/drm/drm_gem.h                         |   10 +-
 include/uapi/drm/msm_drm.h                    |  149 +-
 56 files changed, 3553 insertions(+), 1260 deletions(-)
 create mode 100644 drivers/gpu/drm/msm/msm_syncobj.c
 create mode 100644 drivers/gpu/drm/msm/msm_syncobj.h

-- 
2.49.0


