Return-Path: <linux-arm-msm+bounces-62511-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B2ADAE8CFA
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Jun 2025 20:50:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A43A47AA317
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Jun 2025 18:46:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ACB242690F9;
	Wed, 25 Jun 2025 18:47:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Jrqk5bPR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EDBF1DE2DC
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Jun 2025 18:47:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750877238; cv=none; b=R60wxV44W30v+Zvj4/mecHBm1fay1pj1Khp2FY5MUILQUWc+QLFFv1kAMnRmBWZhd5cbZteumBmtRg0uzJx7+xPch0XFmeMd+kgyYBAW5wGWqcsB8KlLv7DHEK/mgfHaSmPm6RZBCNRNgr+LfCdmy9lpJOr3QYHOJCif77j6EOE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750877238; c=relaxed/simple;
	bh=zqSdjhSHpkblNmAx7Jv96M9CGYrcB2GAf4tTYELbQ04=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=PlxeiCOCgsJGC8Gw8RT8Jfi51w5xTRFmqIDl/c1UroxsC6Fry0HxKqybZNP5XqJwrSDePGlNbx7OUrf/KPzvOO4X5sgRGehp/2Gj3r2FiXhaG8gi9eVERpJ3rMAG/f9eSf78JeTb/SCf2lCZ17ZWOyqbVVOrbbNIhyuef04wj7k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Jrqk5bPR; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55PAfEMM000685
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Jun 2025 18:47:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=DDaKfWa9JkLEfvmGdiVO0NnfewQC+zJ/d5O
	OZRnAs2E=; b=Jrqk5bPRhg+uWmjXVoyvmGvv+TrFjvM0RqvqV6tNHszsQgd5nKA
	VGUPdtuYEJvkEVtfzSR9rgs+isOAbIijjL2/EIG1Bc1MZSEKpEzTltW+0wcFUguX
	O7vgweEXb6+Mi3tXPcqA+KkOYhcP5M7f0XQ3XX/qgZzO9ZwyBw3T/alKbAcX3YdJ
	Nn3Z+2Th8faP754oQw1YAHIt5cyXs05tuO8cGKznMTNZq4SVBH3+rO25qENJ7HaT
	m9P56zUH1aB05668FSUh8t1s2Tb6AolaaJvAucQpWy7+R3PjxjIngFtJIn9DLr0i
	4ZNjzwzMkd+at2Xwkwn0hp+OXRE624UhV+A==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47g7tdarxf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Jun 2025 18:47:14 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-235e1d70d67so1854945ad.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Jun 2025 11:47:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750877233; x=1751482033;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DDaKfWa9JkLEfvmGdiVO0NnfewQC+zJ/d5OOZRnAs2E=;
        b=OoXZw4LJ8f83IXOjbAE6LiceGS+wHYykYEq8EhKv7aFWAbH6nBOOyj9nJa8PS7RlYr
         FQr3iB9nHbNZJN5EGHJwocJB2bbS2ROyDQBauE1trhvVt2iLZOjgg+7g1Gv/J0BddiAP
         IVr8Y1+61yi1tYxhYbTz3r7rJ9T4ZkxW/WSGwnfghyhyhvlOuXMYHgRLf1705MpccrdH
         uioPqpaOnauT77R8W8fZFwjKAZfkflF+ioDdbnPm5auZ+ApMZCKCFbfhrxoPIT7u4mnD
         cpAvfHVKQpvxeTBGdq/tRlrm6iUUn9WtT4sHtuDLFBM5xRno81fmwxE8fP9CjIMRIAdZ
         IGjA==
X-Gm-Message-State: AOJu0YwV6TpUhzAjs69xUadYyvcT7Ahbu+mNDhJAlFBC4aNA8RuJ4okE
	qG7nB2QjuRL8fJIKC5hvh5PTm7TPVdYctmdaSQf/pZRGRVrM49YTVqismswABdG/YfGS0HyjAMI
	/BRhmeUP93a4vxSyeS2Viyoezy5400ojKiHauoyv2CDRnSQv1n4Cg4Z8z4OVq09M4uzIa
X-Gm-Gg: ASbGnct818ns+J8eIffd9upTtKCH/oYhqhJjBWcKaiuwgo78GAn1TTh84L2ZhI7njwh
	4c66927Vk8itRRzi6W5Imii4B5EN0Es5zu1XNYCiRYVSny2HLS9VcABZ4NNP0g9RaFqnIQHC5Nn
	LhAMnAaSW/yO1G74ZMQIaFGYpHdGLWb61cctoS4nUUto2IpjgDZLzWDoc2H4mRp6yociMgbBLzW
	yOyomRa9uEhKywu3Qax2mK0A+TrnNmypsEmBZcNq4Xr3lftFe8FiqYY2Cxp7auRSaDNGeqP7hBV
	UX8zAmCUuPY5TmVC7slH+5C7mF2/iQnH
X-Received: by 2002:a17:903:32d1:b0:235:eb71:a37b with SMTP id d9443c01a7336-2382408724cmr67572195ad.46.1750877233356;
        Wed, 25 Jun 2025 11:47:13 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEO53w3/nxfU9/dU412HEHtZUfe3tlcLkprB8bg0D246WxziCps93Fy6VhABVFhqj4E8rvtKQ==
X-Received: by 2002:a17:903:32d1:b0:235:eb71:a37b with SMTP id d9443c01a7336-2382408724cmr67571615ad.46.1750877232839;
        Wed, 25 Jun 2025 11:47:12 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:5b3e:de60:4fda:e7b1])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-237d874fe39sm138244315ad.251.2025.06.25.11.47.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jun 2025 11:47:12 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Connor Abbott <cwabbott0@gmail.com>,
        Antonino Maniscalco <antomani103@gmail.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Arnd Bergmann <arnd@arndb.de>,
        =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
        David Airlie <airlied@gmail.com>, Dmitry Baryshkov <lumag@kernel.org>,
        Eugene Lepshy <fekz115@gmail.com>,
        Haoxiang Li <haoxiang_li2024@163.com>,
        Jessica Zhang <quic_jesszhan@quicinc.com>,
        Jun Nie <jun.nie@linaro.org>, Konrad Dybcio <konradybcio@kernel.org>,
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
Subject: [PATCH v7 00/42] drm/msm: sparse / "VM_BIND" support
Date: Wed, 25 Jun 2025 11:45:33 -0700
Message-ID: <20250625184641.124103-1-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=CPYqXQrD c=1 sm=1 tr=0 ts=685c4432 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10
 a=e5mUnYsNAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8
 a=zBYVM8QCAAAA:8 a=PoX65QKItS7eaLYJ0vsA:9 a=eVM1_HBmYRkA:10 a=YgSuLXRpIuYA:10
 a=te1wHPZ5H10A:10 a=324X-CrmTo6CU4MGRt3R:22 a=Vxmtnl_E_bksehYqCbjh:22
 a=ArXkYGXkE6hBHcUMFODu:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI1MDE0MSBTYWx0ZWRfX8Gc+NcgHnSIP
 /MZj3MbbVJuPfn9ZCxIvWfjPtUcPXAFM8VGexBmio26cVFV/9VU6tmLVew79xE3OUjRpNXPrVhN
 x1cvge+GCwbm7S7ICoUm8T8sCvFet5yNbrdICb2bC7pkn++khi2i1x23wMTslHJaPP2UASSwif6
 rFWIwsFaYQd+HKvpDWk5GtSoQynJyFGw4Qxf5/N7jd1vpQ1G64Lp4DpbVXf9tGrOX9RE+AUaZiA
 M9POjycwaZ1FxlQWPijPV6sWcFgLCpAAE/xHWxbDjo9EcDKzgWeuqquFBOqRyMyO1odp8Qc8y3E
 8qcF+ahOMCLk+Fer/RZyyLElq8fhZFOqXqYSYahmutnJwMBxTUQ9t/JqET6rKnK5tdRr03dY0f/
 YIrzPn754gpcDWn69bDkIPxEtxsj5wB+qNsPppMxMveZDUGd1izdqZQL2gcv7Cd3TIrijlWh
X-Proofpoint-GUID: cNaAg1aSFaaWYYaCn2MCjbGBFG-nQJsF
X-Proofpoint-ORIG-GUID: cNaAg1aSFaaWYYaCn2MCjbGBFG-nQJsF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-25_06,2025-06-25_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 mlxlogscore=999 lowpriorityscore=0 malwarescore=0
 impostorscore=0 suspectscore=0 clxscore=1015 spamscore=0 priorityscore=1501
 adultscore=0 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506250141

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

Changes in v7:
- Rebase on, and use, gpuvm locking helpers[4], included in this
  series.
- Various small fixes
- Link to v6: https://lore.kernel.org/all/20250605183111.163594-1-robin.clark@oss.qualcomm.com/

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
[4] https://lore.kernel.org/all/20250620154537.89514-1-robin.clark@oss.qualcomm.com/

Rob Clark (42):
  drm/gpuvm: Fix doc comments
  drm/gpuvm: Add locking helpers
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
 drivers/gpu/drm/drm_gpuvm.c                   |  132 +-
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
 drivers/gpu/drm/msm/msm_drv.c                 |  185 +-
 drivers/gpu/drm/msm/msm_drv.h                 |   30 +-
 drivers/gpu/drm/msm/msm_fb.c                  |   33 +-
 drivers/gpu/drm/msm/msm_fbdev.c               |    2 +-
 drivers/gpu/drm/msm/msm_gem.c                 |  537 +++---
 drivers/gpu/drm/msm/msm_gem.h                 |  276 ++-
 drivers/gpu/drm/msm/msm_gem_prime.c           |   66 +
 drivers/gpu/drm/msm/msm_gem_shrinker.c        |  104 +-
 drivers/gpu/drm/msm/msm_gem_submit.c          |  300 ++--
 drivers/gpu/drm/msm/msm_gem_vma.c             | 1508 ++++++++++++++++-
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
 include/drm/drm_gpuvm.h                       |    8 +
 include/uapi/drm/msm_drm.h                    |  149 +-
 58 files changed, 3712 insertions(+), 1263 deletions(-)
 create mode 100644 drivers/gpu/drm/msm/msm_syncobj.c
 create mode 100644 drivers/gpu/drm/msm/msm_syncobj.h

-- 
2.49.0


