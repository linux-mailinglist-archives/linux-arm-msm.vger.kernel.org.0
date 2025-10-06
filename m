Return-Path: <linux-arm-msm+bounces-76089-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 63BD2BBE810
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Oct 2025 17:36:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 0890A4E23B0
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Oct 2025 15:35:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6E0F82D8370;
	Mon,  6 Oct 2025 15:35:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MZ/hNgGu"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF6A52905
	for <linux-arm-msm@vger.kernel.org>; Mon,  6 Oct 2025 15:35:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759764950; cv=none; b=tzFdx24htUe74yU/BdFJDEA79rXLES6iQVnyJBqtQyGemIGuLNJPwpeEVVRRQkeoFjjsUUTcbAjV117LVSKC9mCm0owFp6+sFBS8sdr/CZZCFX3D+60YjD2nKzK2lPd8Us8xUtZtooG1UHDfQx5tQqNVeSbzStWQiRJH5rposYg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759764950; c=relaxed/simple;
	bh=2zHUZb0oOu1EtVAupMZcIMYVJX6plN+kJzbBci+UlA8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=egFDkWwXdoh+SpqgU32RTz2Eab0RHXECu1MHmgw9vRFmCwip25yInowVDJV+siQLgmDQMBdkQz10y++5PP8O7yD03ya3wOMZtNikF+CniPIW7i5wAmq16h4hxzBcH0PTawjX1K2Enn5VsYniBDjGZeKmNF0gSl/+v1dIG7H0iVM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MZ/hNgGu; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 596FObkG029291
	for <linux-arm-msm@vger.kernel.org>; Mon, 6 Oct 2025 15:35:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=1EGpWpK4NHoJ9Tg1BF0bu7jI+O+eiskVCiC
	Ipw0qu/w=; b=MZ/hNgGunh6bHTf0Fp9ezMvGOkK0z3W4BmpROUoCg8lmD76ym8i
	32hv+G1tcYsEqMT639HEA++hpXmPGonYCBgppEbdLMCxtTrgAhFhvT27oL6pJ+Aj
	abP17olIipzpXgnu/UxShXO4ldwiJhmYSlF796bK3P82aDY04qbMjB7wgOsXymVv
	2vxfXpkpsA7RG4G3TeZRpn15iWqojcYjeMJNaNrctew5Xh2jBGpJZEIdQYpafFEM
	e7U0CZfQjpJQgOnHz1YYjFJ1/DOlYvB2LxPwpKHvWlUXlFaWAmTgcvbRCl/M1HuV
	3Uy2R4Wi3uHxuIRtsF1yKZUVPfngHmkx7AQ==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49js9dvgnr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 06 Oct 2025 15:35:47 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-77f5e6a324fso7758850b3a.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Oct 2025 08:35:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759764947; x=1760369747;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1EGpWpK4NHoJ9Tg1BF0bu7jI+O+eiskVCiCIpw0qu/w=;
        b=eG7XIkAjO6NIQZH/qVCdAow9m/OOsO9NaK6BRovKZh1QcHMWn5eXXWw9SDDBCge9Mu
         2udqNRlFLI8oNx4QkyCjdQZrtuXX8a1bXUrL7+rzGcGHSXoVvUjKJB1Uaa4WnaC/9hpt
         fEw+PBfOGLKQGtFMkGTNQiN4wElGTWUsSu4k91cMRDls7jagksthITiI4ZTF50skFW1z
         iUm6q2YvFxIOh5rfR2tA4FGBSOv1DYAwoCV35ucMI6DscE9/6pu5Q3a3+8kt4B1HqIqm
         e3jXn4o67jtmR1bc8Lh8y75n/PjuigIWT4HWku9LM8J+11d2RERh0NiMHbbZ2eEBvEhT
         wW2A==
X-Forwarded-Encrypted: i=1; AJvYcCVH9t9RR5H/BUxXWuwkPT6bcMqqn5X2CWpcegQeUf3grlF3dCcYkoNcRfs4cykkwLMmvXolv54/WPcYGZzR@vger.kernel.org
X-Gm-Message-State: AOJu0Yy9HeiQH1NGHFuTWrHc0zfF6GqEdc0YbWtmyqHFARMB+Oeu7DEa
	CU9OBw+44Y9rF8mktnxukIsx2OaeyXnjPSjckrtEXBpLhgBDsFEKWGutfZvTE/FkjLirLAklKxF
	taFedBjrv6UU7sKQw6hYN1iiCCxsmV107KOoiOx/9sONox4RyzNoViQw/RZRvDIsx9d4Sn4Jlpu
	jU
X-Gm-Gg: ASbGncv7F9RML3gTqX1OyrXJorEJnLgeYTGvYtoOgakdW1d25P+zesbCtmXtiaL7jsT
	xXJMKZtm3G5McYLzPNm08EgBeC/rJmAv2pxCUhAWzTTV5wX0SGvoo3pNcAnoIA6Zbij/oXl+dbN
	vWD9hqHRR91lLmJwkezWYJyi8fv1o4O0WOctYygQo0xUcnadGaLD1DpreGQujAUq36m2UPF/cEf
	PNqOw4J+/P0aig/rApEoKu6nDR+h3q6kn/zsuOdx1amWBc4KosQ/4LRxmZS6DHSSpcZXn9tzAyB
	ycaAwRPsivAHLpWwHWJuU18qTkX2uIyNBkRVhCSLPuDIRGRnZTPR+vwX
X-Received: by 2002:aa7:88c1:0:b0:77f:2de7:eef3 with SMTP id d2e1a72fcca58-78c98a40b0dmr14020290b3a.5.1759764946764;
        Mon, 06 Oct 2025 08:35:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG2uImXaxQz/qoRT3/4bU9hASthLMeIP5Ir06Ggb/UDMzwCkpwyXD/nyPc4F87ERjDvfW7ycQ==
X-Received: by 2002:aa7:88c1:0:b0:77f:2de7:eef3 with SMTP id d2e1a72fcca58-78c98a40b0dmr14020258b3a.5.1759764946322;
        Mon, 06 Oct 2025 08:35:46 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:89fa:e299:1a34:c1f5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-78b01f9daffsm12910829b3a.17.2025.10.06.08.35.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Oct 2025 08:35:45 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Connor Abbott <cwabbott0@gmail.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] drm/msm: Fix pgtable prealloc error path
Date: Mon,  6 Oct 2025 08:35:41 -0700
Message-ID: <20251006153542.419998-1-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=Hrl72kTS c=1 sm=1 tr=0 ts=68e3e1d4 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=xqWC_Br6kY4A:10 a=x6icFKpwvdMA:10
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=3gNcQKlXg_cTF-Q75aoA:9
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-GUID: DeiioQ0wnhd21IeyZMOHuhz2Odvwqa-U
X-Proofpoint-ORIG-GUID: DeiioQ0wnhd21IeyZMOHuhz2Odvwqa-U
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA0MDAwNCBTYWx0ZWRfXzdkMQG0/Doae
 8v4vlVYTYbX6EkvI3R7MGvKEZg7JBigLuQ/xp4L22ZrDlxEYHh2iUfgq9mqUCYEGAqPRFjRo60y
 uoud+3OMNdcesuZFdQ+kpGr/oBuj8260X9mq6i+Rv1ENi0h4OdvPQOvgNYjGQwZBl9ksXwjUk9r
 UxIoBmTLNlzUGp9jaexfne5JI6hzJhTwemrN3TIMVEfIqwJuuiRY59R0JNUFklJPrsW7soPeGfl
 HbhGd4DixrCSNNESmnKhvo211EJhDKBw56qx5kNPh7Eq5GDEAv9EK26J5Bwvr4emG3A30BQZhov
 wrIxXwzxMGWJR1fT1KPE1xYC6m8KB+nWoj1tZWmtULjqBBcu228vGNZ4hksgDm02s9d7agfJMOK
 g54ldx5cDLBR2QMcUeXonEGLHWY+GQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-06_05,2025-10-02_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 spamscore=0 adultscore=0 lowpriorityscore=0
 bulkscore=0 priorityscore=1501 malwarescore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2510040004

The following splat was reported:

    Unable to handle kernel NULL pointer dereference at virtual address 0000000000000010
    Mem abort info:
      ESR = 0x0000000096000004
      EC = 0x25: DABT (current EL), IL = 32 bits
      SET = 0, FnV = 0
      EA = 0, S1PTW = 0
      FSC = 0x04: level 0 translation fault
    Data abort info:
      ISV = 0, ISS = 0x00000004, ISS2 = 0x00000000
      CM = 0, WnR = 0, TnD = 0, TagAccess = 0
      GCS = 0, Overlay = 0, DirtyBit = 0, Xs = 0
    user pgtable: 4k pages, 48-bit VAs, pgdp=00000008d0fd8000
    [0000000000000010] pgd=0000000000000000, p4d=0000000000000000
    Internal error: Oops: 0000000096000004 [#1]  SMP
    CPU: 5 UID: 1000 PID: 149076 Comm: Xwayland Tainted: G S                  6.16.0-rc2-00809-g0b6974bb4134-dirty #367 PREEMPT
    Tainted: [S]=CPU_OUT_OF_SPEC
    Hardware name: Qualcomm Technologies, Inc. SM8650 HDK (DT)
    pstate: 83400005 (Nzcv daif +PAN -UAO +TCO +DIT -SSBS BTYPE=--)
    pc : build_detached_freelist+0x28/0x224
    lr : kmem_cache_free_bulk.part.0+0x38/0x244
    sp : ffff000a508c7a20
    x29: ffff000a508c7a20 x28: ffff000a508c7d50 x27: ffffc4e49d16f350
    x26: 0000000000000058 x25: 00000000fffffffc x24: 0000000000000000
    x23: ffff00098c4e1450 x22: 00000000fffffffc x21: 0000000000000000
    x20: ffff000a508c7af8 x19: 0000000000000002 x18: 00000000000003e8
    x17: ffff000809523850 x16: ffff000809523820 x15: 0000000000401640
    x14: ffff000809371140 x13: 0000000000000130 x12: ffff0008b5711e30
    x11: 00000000001058fa x10: 0000000000000a80 x9 : ffff000a508c7940
    x8 : ffff000809371ba0 x7 : 781fffe033087fff x6 : 0000000000000000
    x5 : ffff0008003cd000 x4 : 781fffe033083fff x3 : ffff000a508c7af8
    x2 : fffffdffc0000000 x1 : 0001000000000000 x0 : ffff0008001a6a00
    Call trace:
     build_detached_freelist+0x28/0x224 (P)
     kmem_cache_free_bulk.part.0+0x38/0x244
     kmem_cache_free_bulk+0x10/0x1c
     msm_iommu_pagetable_prealloc_cleanup+0x3c/0xd0
     msm_vma_job_free+0x30/0x240
     msm_ioctl_vm_bind+0x1d0/0x9a0
     drm_ioctl_kernel+0x84/0x104
     drm_ioctl+0x358/0x4d4
     __arm64_sys_ioctl+0x8c/0xe0
     invoke_syscall+0x44/0x100
     el0_svc_common.constprop.0+0x3c/0xe0
     do_el0_svc+0x18/0x20
     el0_svc+0x30/0x100
     el0t_64_sync_handler+0x104/0x130
     el0t_64_sync+0x170/0x174
    Code: aa0203f5 b26287e2 f2dfbfe2 aa0303f4 (f8737ab6)
    ---[ end trace 0000000000000000 ]---

Since msm_vma_job_free() is called directly from the ioctl, this looks
like an error path cleanup issue.  Which I think results from
prealloc_cleanup() called without a preceding successful
prealloc_allocate() call.  So handle that case better.

Reported-by: Connor Abbott <cwabbott0@gmail.com>
Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/msm_iommu.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/gpu/drm/msm/msm_iommu.c b/drivers/gpu/drm/msm/msm_iommu.c
index 76cdd5ea06a0..10ef47ffb787 100644
--- a/drivers/gpu/drm/msm/msm_iommu.c
+++ b/drivers/gpu/drm/msm/msm_iommu.c
@@ -338,6 +338,8 @@ msm_iommu_pagetable_prealloc_allocate(struct msm_mmu *mmu, struct msm_mmu_preall
 
 	ret = kmem_cache_alloc_bulk(pt_cache, GFP_KERNEL, p->count, p->pages);
 	if (ret != p->count) {
+		kfree(p->pages);
+		p->pages = NULL;
 		p->count = ret;
 		return -ENOMEM;
 	}
@@ -351,6 +353,9 @@ msm_iommu_pagetable_prealloc_cleanup(struct msm_mmu *mmu, struct msm_mmu_preallo
 	struct kmem_cache *pt_cache = get_pt_cache(mmu);
 	uint32_t remaining_pt_count = p->count - p->ptr;
 
+	if (!p->pages)
+		return;
+
 	if (p->count > 0)
 		trace_msm_mmu_prealloc_cleanup(p->count, remaining_pt_count);
 
-- 
2.51.0


