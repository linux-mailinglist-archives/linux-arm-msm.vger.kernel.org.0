Return-Path: <linux-arm-msm+bounces-72613-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E183CB49517
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Sep 2025 18:22:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A6ED4189441E
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Sep 2025 16:22:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2134130FC03;
	Mon,  8 Sep 2025 16:19:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="P+6bv3Md"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D97F30F7EF
	for <linux-arm-msm@vger.kernel.org>; Mon,  8 Sep 2025 16:19:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757348386; cv=none; b=ROMCckXERouQuNvx5gCn+Yo8ew6Lbnm7edqd3ogEIc6uYIidfPy4oNV0G9IrClRbqplrvcbWVsUcdZqesvnobtnWQu95t4ZIsC6zMyKo3J6loYbDPFjUraTTco8rw16JUAVgRnCzmYHkc8hEvP1fCo1Pld9y62oUdjlwtYvYeoc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757348386; c=relaxed/simple;
	bh=Ybah7AR1kGtEAO8WrL18Bl7ZzAxxHu1yBNmvGsLxKsQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=X2Ore41jQm4qeUN1D7QDGiqHDOaKSfMTJZix9mfS18+z2zg34tCg++WnInfcDOLnxBS6qcssNIzq3BfEh4grGw7NoDKy3NYHHcEgKxPkd2Kt1Jb8iYmazk2POiM3ekNdeLhEamaOQl6KEGic4cM0GUHBAYdqOoR3gTNq7NtTv3o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=P+6bv3Md; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5889J8Gb003713
	for <linux-arm-msm@vger.kernel.org>; Mon, 8 Sep 2025 16:19:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:reply-to:subject:to; s=
	qcppdkim1; bh=L0QJ30gg81Oxrd9I78h8iuZ14JR4Sp6YRKTgsTLCosI=; b=P+
	6bv3MdJzNARmUTI4Z1d07u8noEOB3iTx6JKs21+TDUYHfNJY0a3LrAg4cdeRDDM6
	3SvYYqACI+NLtyvCrZFRQQOmJ0itHKevelelMwyMbuXjfahcON621+Nf4loyuFVK
	+9HqY1TWNJ6JMK9VL1eOJgR5xlS68cfWysRWsxzwhB/gRw5OjzlRg232SPQ0Jx8T
	22pY4LlPot/YkcQwY4FwlYJ22J+uTP+EwSM6C1e6uxz0VGvDuSSgeJcr07G4Fh1z
	ePsEUfHvTgZhH9aLeljel6x6Uja5iue6TmZfNEyF0NXV0NMxNE34wlcVEdOSSfm5
	EPssOCDEN8cjR4bfLwgg==
Received: from mail-oa1-f69.google.com (mail-oa1-f69.google.com [209.85.160.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490dqfw36q-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 08 Sep 2025 16:19:43 +0000 (GMT)
Received: by mail-oa1-f69.google.com with SMTP id 586e51a60fabf-30ccebc5babso1983648fac.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 08 Sep 2025 09:19:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757348382; x=1757953182;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=L0QJ30gg81Oxrd9I78h8iuZ14JR4Sp6YRKTgsTLCosI=;
        b=fF2z173gvK5rWM/MY0Oo3ehQIA30kHHL+5m4cQ4TPBQJsSGd+ZbTBkjGp0Ve8U+t+C
         f7XZF8jXZJeymBDx22+TQWjYLeAYJiSCRNuBZDLzALixUXWnlrR3gNeJANTovIc/iwAV
         Bro8BmRC7gE12tUiVZBWxfY2g8ALK/qNQd5yLGlXNQDoHKzNB7AHUWYiK9Pbl2AY2T4h
         /qTJYXR3pwcTvH8gbN1iqXv2w+Cw0J7q4Z8q4SMa1fNyJUAGTU6CttYFh5tmTz630CSK
         a0etNz46kiQQVkgwwhVxo4EL6TMkcp7mdWKy8cphjs+aRqkH/4qz6yf4wa1A/7oXhdKf
         jhzg==
X-Forwarded-Encrypted: i=1; AJvYcCWB7B5vZWzxmSf9RDPIK3CkKeihMvufr9cm1RXVTDcE7U3B2tqOCuu0ZVHdOhzh0coIDlCdJRBdHDr5RXh5@vger.kernel.org
X-Gm-Message-State: AOJu0Yw9X+tkPkS6TcnLKHkNI4dkOt7u3J+DjgJ5Kr01qsmN7SWXJv9z
	ijvSI/KkdwFXLw6LeLW9W6cwlRa7DgzXC9LwddHTvRW8b6fCa3XUu0nnIQPz1Sst90HphZVLKAR
	VNIrpG2dIGhGDyg53bNvXYlDyVdd1xTegI61GI9bqC8L45SRyxML4eMRhOYJrBTeWQvRnSiajqW
	nIuXIps001FAghonp6oSFtazvIqyvSeNekXrHuzkmvoi0=
X-Gm-Gg: ASbGncvwkVbxED3AcDy7Lw/u78IOCCUzWZk9kPpzyqgq02mNwQe3eu2Wsr03+fctjTd
	VWWzHt0AG1OzbSnM/vQXNTDpq2texMltzVR0ZXFR/8XTInYHeofXUacxx8WNVL4P6EwIBM00f8I
	Xc3Xe2/FohOtETA0Wa9IEogFG1Hxr0pOyY5YvEKZQqV/qrdVsJ64Mi
X-Received: by 2002:a05:6871:520c:b0:322:52d5:bbf6 with SMTP id 586e51a60fabf-3226460b716mr3990737fac.25.1757348382184;
        Mon, 08 Sep 2025 09:19:42 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFjaoaeutro7I9dSBIuzBUghkd2VjlPQvUa7v0CxHYnos6nhxtZKLQUrnxGN93WkhNg2QgLj2eWDObKEiic80E=
X-Received: by 2002:a05:6871:520c:b0:322:52d5:bbf6 with SMTP id
 586e51a60fabf-3226460b716mr3990708fac.25.1757348381622; Mon, 08 Sep 2025
 09:19:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250902-assorted-sept-1-v1-0-f3ec9baed513@oss.qualcomm.com>
 <20250902-assorted-sept-1-v1-1-f3ec9baed513@oss.qualcomm.com>
 <CACSVV026d+FWS09VOqRfFESJjk0g1Gp4TJhcdrBcWaZ3H4f3mQ@mail.gmail.com> <f8e66daa-8923-4926-86b8-c51f7f576180@oss.qualcomm.com>
In-Reply-To: <f8e66daa-8923-4926-86b8-c51f7f576180@oss.qualcomm.com>
Reply-To: rob.clark@oss.qualcomm.com
From: Rob Clark <rob.clark@oss.qualcomm.com>
Date: Mon, 8 Sep 2025 09:19:30 -0700
X-Gm-Features: Ac12FXxuZyq79yD5-k_K4YYyr5q7ZutJE2Sqc8bORaT7hd9fzlKHDPFSAxTcfo0
Message-ID: <CACSVV025zH-T82jp7xfgjKH=UoiJDDDq6xgyVjyrDhSH1=pQ4w@mail.gmail.com>
Subject: Re: [PATCH 1/4] drm/msm: Fix bootup splat with separate_gpu_drm modparam
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Cc: Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Jordan Crouse <jordan@cosmicpenguin.net>,
        Jonathan Marek <jonathan@marek.ca>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-ORIG-GUID: qAXrcRVBAe48h2NTYvlEmQE65kxfM79u
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAzNSBTYWx0ZWRfX4nb3n+48JNKZ
 03GStalJcPcrsbju2VcPlL1Wqm5eaK/HkYA4D1rUmXFTIbN89I1bSG5YABnohjYPW2DcM5JKvic
 Wf9j8a22m4CO/Qyb4g9Kg6g6VpR6cNdNpJ2dtdPsUEpTOnCSy7bHGuOAEVbeyuSlpiOzGkXPDlK
 FlzJwr/iPCstGOaDrIzta3iHNEXK/e4qdE03hocJuAvzNDPxU1lbGo5akFfNBlv5CcpJYEaWkaM
 WvAmZggW9KX3jTRZIy/6HMTnm8foUc9sJOKas/aLyKknaG+cv1TeZ3e5ghZ1jhXQ4EOJ4aG3g11
 sMuBGDnM4xz2PjT5PbwD7N1f2fBsBUcrVtUzMpQWlHjDxUvaYrZfLkOWpI0FSIhYyFhPeLLXyJ6
 U3s68IYP
X-Proofpoint-GUID: qAXrcRVBAe48h2NTYvlEmQE65kxfM79u
X-Authority-Analysis: v=2.4 cv=N8UpF39B c=1 sm=1 tr=0 ts=68bf021f cx=c_pps
 a=zPxD6eHSjdtQ/OcAcrOFGw==:117 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10
 a=EUspDBNiAAAA:8 a=MaXCzO5kt653ReTLQ1AA:9 a=QEXdDO2ut3YA:10
 a=y8BKWJGFn5sdPF1Y92-H:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-08_06,2025-09-08_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 malwarescore=0 clxscore=1015 bulkscore=0
 suspectscore=0 priorityscore=1501 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509060035

On Mon, Sep 8, 2025 at 8:42=E2=80=AFAM Akhil P Oommen <akhilpo@oss.qualcomm=
.com> wrote:
>
> On 9/2/2025 9:25 PM, Rob Clark wrote:
> > On Tue, Sep 2, 2025 at 4:50=E2=80=AFAM Akhil P Oommen <akhilpo@oss.qual=
comm.com> wrote:
> >>
> >> The drm_gem_for_each_gpuvm_bo() call from lookup_vma() accesses
> >> drm_gem_obj.gpuva.list, which is not initialized when the drm driver
> >> does not support DRIVER_GEM_GPUVA feature. Enable it for msm_kms
> >> drm driver to fix the splat seen when msm.separate_gpu_drm=3D1 modpara=
m
> >> is set:
> >>
> >> [    9.506020] Unable to handle kernel paging request at virtual addre=
ss fffffffffffffff0
> >> [    9.523160] Mem abort info:
> >> [    9.523161]   ESR =3D 0x0000000096000006
> >> [    9.523163]   EC =3D 0x25: DABT (current EL), IL =3D 32 bits
> >> [    9.523165]   SET =3D 0, FnV =3D 0
> >> [    9.523166]   EA =3D 0, S1PTW =3D 0
> >> [    9.523167]   FSC =3D 0x06: level 2 translation fault
> >> [    9.523169] Data abort info:
> >> [    9.523170]   ISV =3D 0, ISS =3D 0x00000006, ISS2 =3D 0x00000000
> >> [    9.523171]   CM =3D 0, WnR =3D 0, TnD =3D 0, TagAccess =3D 0
> >> [    9.523172]   GCS =3D 0, Overlay =3D 0, DirtyBit =3D 0, Xs =3D 0
> >> [    9.523174] swapper pgtable: 4k pages, 48-bit VAs, pgdp=3D0000000ad=
370f000
> >> [    9.523176] [fffffffffffffff0] pgd=3D0000000000000000, p4d=3D000000=
0ad4787403, pud=3D0000000ad4788403, pmd=3D0000000000000000
> >> [    9.523184] Internal error: Oops: 0000000096000006 [#1]  SMP
> >> [    9.592968] CPU: 9 UID: 0 PID: 448 Comm: (udev-worker) Not tainted =
6.17.0-rc4-assorted-fix-00005-g0e9bb53a2282-dirty #3 PREEMPT
> >> [    9.592970] Hardware name: Qualcomm CRD, BIOS 6.0.240718.BOOT.MXF.2=
.4-00515-HAMOA-1 07/18/2024
> >> [    9.592971] pstate: a1400005 (NzCv daif +PAN -UAO -TCO +DIT -SSBS B=
TYPE=3D--)
> >> [    9.592973] pc : lookup_vma+0x28/0xe0 [msm]
> >> [    9.592996] lr : get_vma_locked+0x2c/0x128 [msm]
> >> [    9.763632] sp : ffff800082dab460
> >> [    9.763666] Call trace:
> >> [    9.763668]  lookup_vma+0x28/0xe0 [msm] (P)
> >> [    9.763688]  get_vma_locked+0x2c/0x128 [msm]
> >> [    9.763706]  msm_gem_get_and_pin_iova_range+0x68/0x11c [msm]
> >> [    9.763723]  msm_gem_get_and_pin_iova+0x18/0x24 [msm]
> >> [    9.763740]  msm_fbdev_driver_fbdev_probe+0xd0/0x258 [msm]
> >> [    9.763760]  __drm_fb_helper_initial_config_and_unlock+0x288/0x528 =
[drm_kms_helper]
> >> [    9.763771]  drm_fb_helper_initial_config+0x44/0x54 [drm_kms_helper=
]
> >> [    9.763779]  drm_fbdev_client_hotplug+0x84/0xd4 [drm_client_lib]
> >> [    9.763782]  drm_client_register+0x58/0x9c [drm]
> >> [    9.763806]  drm_fbdev_client_setup+0xe8/0xcf0 [drm_client_lib]
> >> [    9.763809]  drm_client_setup+0xb4/0xd8 [drm_client_lib]
> >> [    9.763811]  msm_drm_kms_post_init+0x2c/0x3c [msm]
> >> [    9.763830]  msm_drm_init+0x1a8/0x22c [msm]
> >> [    9.763848]  msm_drm_bind+0x30/0x3c [msm]
> >> [    9.919273]  try_to_bring_up_aggregate_device+0x168/0x1d4
> >> [    9.919283]  __component_add+0xa4/0x170
> >> [    9.919286]  component_add+0x14/0x20
> >> [    9.919288]  msm_dp_display_probe_tail+0x4c/0xac [msm]
> >> [    9.919315]  msm_dp_auxbus_done_probe+0x14/0x20 [msm]
> >> [    9.919335]  dp_aux_ep_probe+0x4c/0xf0 [drm_dp_aux_bus]
> >> [    9.919341]  really_probe+0xbc/0x298
> >> [    9.919345]  __driver_probe_device+0x78/0x12c
> >> [    9.919348]  driver_probe_device+0x40/0x160
> >> [    9.919350]  __driver_attach+0x94/0x19c
> >> [    9.919353]  bus_for_each_dev+0x74/0xd4
> >> [    9.919355]  driver_attach+0x24/0x30
> >> [    9.919358]  bus_add_driver+0xe4/0x208
> >> [    9.919360]  driver_register+0x60/0x128
> >> [    9.919363]  __dp_aux_dp_driver_register+0x24/0x30 [drm_dp_aux_bus]
> >> [    9.919365]  atana33xc20_init+0x20/0x1000 [panel_samsung_atna33xc20=
]
> >> [    9.919370]  do_one_initcall+0x6c/0x1b0
> >> [    9.919374]  do_init_module+0x58/0x234
> >> [    9.919377]  load_module+0x19cc/0x1bd4
> >> [    9.919380]  init_module_from_file+0x84/0xc4
> >> [    9.919382]  __arm64_sys_finit_module+0x1b8/0x2cc
> >> [    9.919384]  invoke_syscall+0x48/0x110
> >> [    9.919389]  el0_svc_common.constprop.0+0xc8/0xe8
> >> [    9.919393]  do_el0_svc+0x20/0x2c
> >> [    9.919396]  el0_svc+0x34/0xf0
> >> [    9.919401]  el0t_64_sync_handler+0xa0/0xe4
> >> [    9.919403]  el0t_64_sync+0x198/0x19c
> >> [    9.919407] Code: eb0000bf 54000480 d100a003 aa0303e2 (f8418c44)
> >> [    9.919410] ---[ end trace 0000000000000000 ]---
> >>
> >> Fixes: 217ed15bd399 ("drm/msm: enable separate binding of GPU and disp=
lay devices")
> >> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> >> ---
> >>  drivers/gpu/drm/msm/msm_drv.c | 1 +
> >>  1 file changed, 1 insertion(+)
> >>
> >> diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_d=
rv.c
> >> index 9dcc7a596a11d9342a515dab694bac93dc2805cb..7e977fec4100792394dccf=
59097a01c2b2556608 100644
> >> --- a/drivers/gpu/drm/msm/msm_drv.c
> >> +++ b/drivers/gpu/drm/msm/msm_drv.c
> >> @@ -826,6 +826,7 @@ static const struct file_operations fops =3D {
> >>
> >>  #define DRIVER_FEATURES_KMS ( \
> >>                 DRIVER_GEM | \
> >> +               DRIVER_GEM_GPUVA | \
> >
> > Hmm, the description of DRIVER_GEM_GPUVA is that "Driver supports user
> > defined GPU VA bindings for GEM objects", which isn't really true.
> > Fortunately the only thing that it actually seems to control currently
> > is the list head initialization.
> >
> > Idk if it would be better to make the list head init unconditional, or
> > just add a comment here?
>
> But the KMS-only drm driver do use symbols related to gpuva. "struct
> gpuva" for eg:. From that perspective, shouldn't we select this feature
> here?

Based on how DRIVER_GEM_GPUVA is currently used (ie. not exposed to
userspace, etc) this is fine.  Maybe the comment describing
DRIVER_GEM_GPUVA should be updated to something along the lines of
"Driver uses the drm_gpuvm infrastructure" instead of "Driver supports
user defined GPU VA bindings for GEM object"

BR,
-R

> -Akhil
>
> >
> > BR,
> > -R
> >
> >>                 DRIVER_ATOMIC | \
> >>                 DRIVER_MODESET | \
> >>                 0 )
> >>
> >> --
> >> 2.50.1
> >>
>

