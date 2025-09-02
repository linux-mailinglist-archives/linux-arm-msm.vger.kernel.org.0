Return-Path: <linux-arm-msm+bounces-71556-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 68564B3FEBD
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Sep 2025 13:56:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5EF7C188F78D
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Sep 2025 11:56:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B62A62FC012;
	Tue,  2 Sep 2025 11:50:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="N6zyRUPj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 159392FC00B
	for <linux-arm-msm@vger.kernel.org>; Tue,  2 Sep 2025 11:50:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756813850; cv=none; b=MgPEfu9Zsie63Vc0P/dFXMHwKy9AGRvaWVfOELIbV385XS5L7BhL2PB9dJlwSxkZOTB7kEcaE42EQCUoS62E28oMW0sYFUDFQe/0unwUiswK/pfYbype9YHRam6e5YzXrvisJ8dPD6mf7+xDgJg09/1zBfVWqRdiEEBjdeCszOU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756813850; c=relaxed/simple;
	bh=qPgkL7fQFaE6QyN7pM6ijtnceZa332Ylsl3h67JWyzs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ouiEuAl16vOpt+GH8DKtztgY7YwZKM0URpg6EqVuJSCxz0EEAEhOMUsfVIKNRHZgG3rnnyJKveBEvdz5izWExnM4gHY/iAnIzLhAINDiCgBz4kBQaXu/LYn3L6UopKoA7E2IfGwfZaetuVLxceN8A6DoAkfIGbUL9HPSCJtQDmc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=N6zyRUPj; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 582AOgah030313
	for <linux-arm-msm@vger.kernel.org>; Tue, 2 Sep 2025 11:50:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	o4Hflc+daQ6IuFv2HVvc4nbRfQYOBNM9H/xWVC9Qnhs=; b=N6zyRUPjVnq1G9ja
	KcPaq2mtNJM+ZmdKazy0ExicjtvOg/3YKgRUp46jxoqtI6aOeRrVRL1cxGkjpP9h
	4FoM4QAM2a82XD8u58ZP6jqXU7pyiq7yG3jiEHMFKEUAgNFh7tYpQkEKByFbivKy
	XWK1UehNwAqR0tUhFSrI1sqIWyPJ2l+Kh7+vAe/GJzjy4KPBf7OhUpstas/jJeFy
	ICozRQEoMsmK3zYrr0fwDPqIYECSN2xF/aTrColJQwSYhX2bSGhmLmAf9rexBpLJ
	nir6kkQeM9dqAy8XvUBHhm7VGXkSceqClia25KR41dNUeDFfGAB5R9Ye9mtMKuxF
	iqUoMQ==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48w8wy3fve-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 02 Sep 2025 11:50:47 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-324e4c3af5fso5668283a91.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 02 Sep 2025 04:50:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756813846; x=1757418646;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=o4Hflc+daQ6IuFv2HVvc4nbRfQYOBNM9H/xWVC9Qnhs=;
        b=BVEaAZUExB8WeTK9NjrTCFRSu8MUTmJksARAs5Qp6FeXJTsInSuPRsMWmHktVNFSO5
         R/5qYMYQDq32zP6js8/OR8VZedGC25L3v5h1y7f4htC+7i8okrYm1Kla8zrVgdkkb61r
         xb+OJ+wU++mD/+pH1mFjUSduDmTWY3/R1z3UVYUznO+kxNEiziog3bH6jJe9CO15RZ7e
         F5Dt0/tu8g3tc6TMHWe1pw3xoClcT+vRR4ERqJTSOnqYEAnZEVoFeHY364TraJ2QI2Ra
         9ig1rIEpHvIraaO4SsdcYSSR7sSvne88pXrIYUSQubFsudv6JwEL1bDvR16+spu6+srf
         +EQQ==
X-Forwarded-Encrypted: i=1; AJvYcCX1fKZe2339OEvU2gAgd9IgmTzIuMMA/oLFlFHv37Nuxy6m7ac9bePS384PH7Z2LpqfZLs4GlMPgYapj0KZ@vger.kernel.org
X-Gm-Message-State: AOJu0YxgXzyBaah4yvlY0TXWvTzNTnIBpOYoq8Sq58dGTWro4rKCvHdh
	af3G8I+6RlMW/VfXkbIc86yBkheGRJz6iWhI0l5wImbpaXTwI6Ctf6RHdqa8JvUOm2j4wzxsJp4
	KY214rwa9E6UI64nH1x9afqipevShaugU+hYVoXkcb4FFpsGyeKiAOO2xkUuP9rAKPjDhoNM8QK
	XW
X-Gm-Gg: ASbGncuhiW6z5K1zMCdRiqbMh0BPjA9hjgWfDVYgbyUnpXOVtEr7PGvUFO0DvPH3zmY
	ezvYkOp1OjJPtwgwH2deFKRv20Q7kA9+DiCfev6nsu7n9PT5hUB5y6Er+mtwxy4Aj3NIjoSIMBl
	/fgORUVTabrut9kZnOhjDj5Id0FIgqhtZHmO0XDzULqY3haV7rwlR1V9zzAQ6A/c9mu0SEILrSq
	6kSrGAXi6ge7ApLqBUHlvoTKhmJ0T3lybvnJYbHaBahUxS8utGevKLMh54lgImUvzVZ0uhvhofO
	E7eipeJOsc/0WRFjrJJqfA3H22VWNVhtRHaPwOFMmerTkHbfdXFEd/xsT0AQ1KJ9
X-Received: by 2002:a17:90b:3dcf:b0:327:7220:f579 with SMTP id 98e67ed59e1d1-32815412d5fmr10872184a91.1.1756813846405;
        Tue, 02 Sep 2025 04:50:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGW99TwUZWxEy45yoetqpbaSq5lJC3JPeKamGQotr5IZQ5SoSdER5YO+EmZCPCjeK1GGCyBuA==
X-Received: by 2002:a17:90b:3dcf:b0:327:7220:f579 with SMTP id 98e67ed59e1d1-32815412d5fmr10872157a91.1.1756813845739;
        Tue, 02 Sep 2025 04:50:45 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-329d089395esm3175428a91.1.2025.09.02.04.50.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Sep 2025 04:50:45 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Tue, 02 Sep 2025 17:20:00 +0530
Subject: [PATCH 1/4] drm/msm: Fix bootup splat with separate_gpu_drm
 modparam
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250902-assorted-sept-1-v1-1-f3ec9baed513@oss.qualcomm.com>
References: <20250902-assorted-sept-1-v1-0-f3ec9baed513@oss.qualcomm.com>
In-Reply-To: <20250902-assorted-sept-1-v1-0-f3ec9baed513@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Jordan Crouse <jordan@cosmicpenguin.net>,
        Jonathan Marek <jonathan@marek.ca>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1756813835; l=4562;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=qPgkL7fQFaE6QyN7pM6ijtnceZa332Ylsl3h67JWyzs=;
 b=KpwHPv5jbU1wG0upN69QN4TU9tLv75znfaMNG/wW/Vr6JMKnE72nr9y8RUcFJA0uol8NLt7B+
 0SEFpVmHcU3An78DGT319SckSxtIIrGYV3cpjSsb3jEmR64RaxyjTRg
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Authority-Analysis: v=2.4 cv=Ycq95xRf c=1 sm=1 tr=0 ts=68b6da17 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=7L6S3vPEwiY8THHMc4kA:9
 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-GUID: hAITLNCjR-Fv8WvjWHScShI2tuZDxHrR
X-Proofpoint-ORIG-GUID: hAITLNCjR-Fv8WvjWHScShI2tuZDxHrR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTAxMDEwMSBTYWx0ZWRfX+w2LKT08uOue
 BJuPyuBKQ/OxEbh7//dHX4VnPjRbsfCDDRYXETLao33DdAfb2t2W4KLLNU911S32FKYn2xD5NPL
 ThDev7wVduA/orIgp4MzZMl35HE3W9Ig1uvFhOs7HbIXeo46tTBQdqdJwCQGhkL5edz1lNGUpJD
 l8i+pr3SamWhGxH71BrtAfPLfaseghUsbqWBoDFEueguErnrALwX0JmLcTOq+raKeq54rNzsAlr
 quIi6aPZhsOa7ljX24d9GyWDKSo1OVgcI7XfZ1tlpHGIdAwFmqAwftLzPB+/nGwyJfbUmAOGQhF
 pbuzvQD5wspHMccRYb/UeOdKyLcZxsUnbsFCGbsY8CrhRYZ/k79JZ0XqKP3wB4UcmKU4bO06Eka
 yaMNcIUF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-02_03,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 adultscore=0 phishscore=0 malwarescore=0
 bulkscore=0 suspectscore=0 impostorscore=0 spamscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509010101

The drm_gem_for_each_gpuvm_bo() call from lookup_vma() accesses
drm_gem_obj.gpuva.list, which is not initialized when the drm driver
does not support DRIVER_GEM_GPUVA feature. Enable it for msm_kms
drm driver to fix the splat seen when msm.separate_gpu_drm=1 modparam
is set:

[    9.506020] Unable to handle kernel paging request at virtual address fffffffffffffff0
[    9.523160] Mem abort info:
[    9.523161]   ESR = 0x0000000096000006
[    9.523163]   EC = 0x25: DABT (current EL), IL = 32 bits
[    9.523165]   SET = 0, FnV = 0
[    9.523166]   EA = 0, S1PTW = 0
[    9.523167]   FSC = 0x06: level 2 translation fault
[    9.523169] Data abort info:
[    9.523170]   ISV = 0, ISS = 0x00000006, ISS2 = 0x00000000
[    9.523171]   CM = 0, WnR = 0, TnD = 0, TagAccess = 0
[    9.523172]   GCS = 0, Overlay = 0, DirtyBit = 0, Xs = 0
[    9.523174] swapper pgtable: 4k pages, 48-bit VAs, pgdp=0000000ad370f000
[    9.523176] [fffffffffffffff0] pgd=0000000000000000, p4d=0000000ad4787403, pud=0000000ad4788403, pmd=0000000000000000
[    9.523184] Internal error: Oops: 0000000096000006 [#1]  SMP
[    9.592968] CPU: 9 UID: 0 PID: 448 Comm: (udev-worker) Not tainted 6.17.0-rc4-assorted-fix-00005-g0e9bb53a2282-dirty #3 PREEMPT
[    9.592970] Hardware name: Qualcomm CRD, BIOS 6.0.240718.BOOT.MXF.2.4-00515-HAMOA-1 07/18/2024
[    9.592971] pstate: a1400005 (NzCv daif +PAN -UAO -TCO +DIT -SSBS BTYPE=--)
[    9.592973] pc : lookup_vma+0x28/0xe0 [msm]
[    9.592996] lr : get_vma_locked+0x2c/0x128 [msm]
[    9.763632] sp : ffff800082dab460
[    9.763666] Call trace:
[    9.763668]  lookup_vma+0x28/0xe0 [msm] (P)
[    9.763688]  get_vma_locked+0x2c/0x128 [msm]
[    9.763706]  msm_gem_get_and_pin_iova_range+0x68/0x11c [msm]
[    9.763723]  msm_gem_get_and_pin_iova+0x18/0x24 [msm]
[    9.763740]  msm_fbdev_driver_fbdev_probe+0xd0/0x258 [msm]
[    9.763760]  __drm_fb_helper_initial_config_and_unlock+0x288/0x528 [drm_kms_helper]
[    9.763771]  drm_fb_helper_initial_config+0x44/0x54 [drm_kms_helper]
[    9.763779]  drm_fbdev_client_hotplug+0x84/0xd4 [drm_client_lib]
[    9.763782]  drm_client_register+0x58/0x9c [drm]
[    9.763806]  drm_fbdev_client_setup+0xe8/0xcf0 [drm_client_lib]
[    9.763809]  drm_client_setup+0xb4/0xd8 [drm_client_lib]
[    9.763811]  msm_drm_kms_post_init+0x2c/0x3c [msm]
[    9.763830]  msm_drm_init+0x1a8/0x22c [msm]
[    9.763848]  msm_drm_bind+0x30/0x3c [msm]
[    9.919273]  try_to_bring_up_aggregate_device+0x168/0x1d4
[    9.919283]  __component_add+0xa4/0x170
[    9.919286]  component_add+0x14/0x20
[    9.919288]  msm_dp_display_probe_tail+0x4c/0xac [msm]
[    9.919315]  msm_dp_auxbus_done_probe+0x14/0x20 [msm]
[    9.919335]  dp_aux_ep_probe+0x4c/0xf0 [drm_dp_aux_bus]
[    9.919341]  really_probe+0xbc/0x298
[    9.919345]  __driver_probe_device+0x78/0x12c
[    9.919348]  driver_probe_device+0x40/0x160
[    9.919350]  __driver_attach+0x94/0x19c
[    9.919353]  bus_for_each_dev+0x74/0xd4
[    9.919355]  driver_attach+0x24/0x30
[    9.919358]  bus_add_driver+0xe4/0x208
[    9.919360]  driver_register+0x60/0x128
[    9.919363]  __dp_aux_dp_driver_register+0x24/0x30 [drm_dp_aux_bus]
[    9.919365]  atana33xc20_init+0x20/0x1000 [panel_samsung_atna33xc20]
[    9.919370]  do_one_initcall+0x6c/0x1b0
[    9.919374]  do_init_module+0x58/0x234
[    9.919377]  load_module+0x19cc/0x1bd4
[    9.919380]  init_module_from_file+0x84/0xc4
[    9.919382]  __arm64_sys_finit_module+0x1b8/0x2cc
[    9.919384]  invoke_syscall+0x48/0x110
[    9.919389]  el0_svc_common.constprop.0+0xc8/0xe8
[    9.919393]  do_el0_svc+0x20/0x2c
[    9.919396]  el0_svc+0x34/0xf0
[    9.919401]  el0t_64_sync_handler+0xa0/0xe4
[    9.919403]  el0t_64_sync+0x198/0x19c
[    9.919407] Code: eb0000bf 54000480 d100a003 aa0303e2 (f8418c44)
[    9.919410] ---[ end trace 0000000000000000 ]---

Fixes: 217ed15bd399 ("drm/msm: enable separate binding of GPU and display devices")
Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/msm_drv.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
index 9dcc7a596a11d9342a515dab694bac93dc2805cb..7e977fec4100792394dccf59097a01c2b2556608 100644
--- a/drivers/gpu/drm/msm/msm_drv.c
+++ b/drivers/gpu/drm/msm/msm_drv.c
@@ -826,6 +826,7 @@ static const struct file_operations fops = {
 
 #define DRIVER_FEATURES_KMS ( \
 		DRIVER_GEM | \
+		DRIVER_GEM_GPUVA | \
 		DRIVER_ATOMIC | \
 		DRIVER_MODESET | \
 		0 )

-- 
2.50.1


