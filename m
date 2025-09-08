Return-Path: <linux-arm-msm+bounces-72601-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 19F7FB49420
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Sep 2025 17:48:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D5BE14C07C3
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Sep 2025 15:46:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D8B083101BD;
	Mon,  8 Sep 2025 15:42:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mFQC/1VK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4328C30FF39
	for <linux-arm-msm@vger.kernel.org>; Mon,  8 Sep 2025 15:42:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757346178; cv=none; b=DOPVzhySCSypFBiEzZWfCY/fSt/YNRQS7cJBHiU2WeJiKoV+U0OdHm9wj5OZ2ei2HfbTOgqsr86FNnY1YeFEmkud6B3OVsgSnq53Fak6raWMPMPE5XleEMhBQOTdXT6Dkn/Vbe23l3erua+XjEPCNBbapO3a3W3uGjNKu0UtJCQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757346178; c=relaxed/simple;
	bh=6v2ThPD4H9K2VywLJvl8OBYbCrO7szneZ9n7P4JZHPg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bUpAES7nzOkDWtBxRVi1Ndef+mCrnSIpNncRzOZhBiAYc6dE/b59b0Y+d5bcDusWWybZMgax0QHiivbR8NLW6NAq+ifAhHDJccZ+HuPlpv9G2aAPM7wFahz0Dsu+yDG+SlnVBJvxXFkckFdtYoVsuHiK84GHGl6ZpThzDTIfu6E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mFQC/1VK; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 588AoM43013469
	for <linux-arm-msm@vger.kernel.org>; Mon, 8 Sep 2025 15:42:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CvtOsrkldNLB6e4LcCzuZPkp4XudNj6Q+1Ef7B/8biI=; b=mFQC/1VKAonkObBm
	s+Bzca1U1mbSDA2JqPXwebwhOfEt2ZZMV1Wa+GIHjbDWs6SLT3mm4eIRhI2Fm1uK
	H0kQ9VW1pJo6PlhQT2/pXfDUVE2Xvyg/khRp6eqAJfupIQVhpIOdX1/O08Jyhl5Z
	qk3Pau8BPFLxg+bFANDguNcq64wC4OEt6lejB+SrpcnhPGEwGOonuaoK6/fd7Pru
	w9DKR/W6FCIxkY6zeUB0TAitAm1IkT2jPKJNL2TYKpBDPTRi93ShX+p8fTQtUOkr
	wRdeequFf1yW9X/a5CGfT5qAmj14OtxJbqjVshrs33w/ZhqgGnyVTFkxmxbnnjpd
	LAlKjg==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 491qhdsvy4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 08 Sep 2025 15:42:56 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-24c8264a137so57506535ad.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 08 Sep 2025 08:42:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757346175; x=1757950975;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CvtOsrkldNLB6e4LcCzuZPkp4XudNj6Q+1Ef7B/8biI=;
        b=KSNGxbldd2h+dDXU2RNCH5ReDm3Zez1CoqQNpzbgJjdZX+yaHlKzRGF0hjfW0fGQ2k
         e1e1eXhYA5KfxYgF/JOgVKppsZvkJL2IkohG5AqjTf9CSkpUUlS/xfaHkh1u2ygSy1Fu
         FXDOe0wJeYaP+iBrpamI9Mi3jtAT2QlfPo23j0RoqlXzKLT+EE4OY9/Hd4MsItHaL172
         Sk0yka108YO0e0rsOfVg9sA9JQkQLKmIYvfu5NU78w3mJT8FUeQf2wKjfm9DAF4ub1sy
         dDNx2iT1NHZwyoGQ/9MMNyat4jJ6MAiFKuArVDdP2Xjpw4+jK6tTypLKZOX7KVKt8cVo
         2aAQ==
X-Forwarded-Encrypted: i=1; AJvYcCXt53GUftyscs6TsOyBeSE6kc/fzPujK9k2Ik6VS32TZurf9UfBDgeQ/915Wc2TrANzI5t1miE7s1FWO5ME@vger.kernel.org
X-Gm-Message-State: AOJu0YymCwJ9kRrAjSC7NPhhT7QwfaNacjP1sGeCEqZsldaEEPJFSGhK
	DaTdZxx4weyE2TOhGHWFohJewHTZMdopKRlUWfcoo9/enuYMGxV+LuRyneK4Vb0nB9sgsZoZ3Qz
	Ya8XwgrZARSpyA8aAqIqR47ZUDP5k+HwwjTQ+ZKhILNb1nFrt24Lg6HO7pi/prtnINW93
X-Gm-Gg: ASbGncspVUB1k4SyHR8ejnQw8OQrkF5TZ42Sxn/00GIwv7FvOLsBdWGQCvGBV4w1sA0
	3J77dUyBWDTAKj+aT825LiBgHCzj02CdmBk+nB9YXkomYKJ3YfrsBFp3c+yMwYZEnnn4IfRsblF
	GUcAYO3z3Z3yoDe5Hb/Svq58fmWUpfg1ObI0PMCbosMRtP1Q3EGZc4KjQQZbl6MYmwLbwG6uJ/t
	OpDhf5fewXH1LFzTVFH5ED5N8JqxhZTlnOPELrvnnzavuw96bu/6L5bv8Qu7a2tOI5x/mEjBdZS
	/2Meq/HIeOC1Ciave8TpOfZ0we+Q0YwOelsgWUxlRpi/djI1sk1bmwT4hafGkA==
X-Received: by 2002:a17:902:e806:b0:24c:d6c6:c656 with SMTP id d9443c01a7336-2516ce60e49mr104180835ad.4.1757346175407;
        Mon, 08 Sep 2025 08:42:55 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGr2qX28q5ZPTDoI+m/uyM3Cq/dpy6ZsOrLrboLn59YqS3/ebKm53vG9+ieiNPfzO3LHaOLuw==
X-Received: by 2002:a17:902:e806:b0:24c:d6c6:c656 with SMTP id d9443c01a7336-2516ce60e49mr104180605ad.4.1757346174893;
        Mon, 08 Sep 2025 08:42:54 -0700 (PDT)
Received: from [10.91.118.43] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-24b11833a47sm180283795ad.53.2025.09.08.08.42.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Sep 2025 08:42:54 -0700 (PDT)
Message-ID: <f8e66daa-8923-4926-86b8-c51f7f576180@oss.qualcomm.com>
Date: Mon, 8 Sep 2025 21:12:48 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] drm/msm: Fix bootup splat with separate_gpu_drm
 modparam
To: rob.clark@oss.qualcomm.com
Cc: Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Jordan Crouse <jordan@cosmicpenguin.net>,
        Jonathan Marek
 <jonathan@marek.ca>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20250902-assorted-sept-1-v1-0-f3ec9baed513@oss.qualcomm.com>
 <20250902-assorted-sept-1-v1-1-f3ec9baed513@oss.qualcomm.com>
 <CACSVV026d+FWS09VOqRfFESJjk0g1Gp4TJhcdrBcWaZ3H4f3mQ@mail.gmail.com>
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <CACSVV026d+FWS09VOqRfFESJjk0g1Gp4TJhcdrBcWaZ3H4f3mQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: SeKyPHaP3NHoGAllm6yQk0fRlWo6goDu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA4MDAzNCBTYWx0ZWRfX2881ioCCKHkM
 Mllxto6INgFMIsfLif2Hv5+pjMTDO46VHJlBgcBw+VSV2sVLuBtOnk6rUpGRpHnBnlv9lWuNyz2
 dH1gzLFlLc1ZMa4gt+Rb75W+rcBqOpQWVwTUebMUx1Hg5m3rx0Es1ijY27Rbw1Kh1uiDXUP52/i
 dYqrrdlXyvzz+5mHOdLF4teIFeu+TYgKD7CDOyxdLJ9uHyyV9cHwrulmYbqySO57an40N4SOUye
 qo70Ld57kjuPLsdWUDarD2u75xXaE+Nst2WOuJyOwX8rcP9BvADR2Y1qRkk8d5KJuY8A4Vuaola
 c3YYBuDd1WHrOeeiyZFqzoE0o//uB8iYkqKsQCOfXmvDrxJP4R3xOggbVWDw6P7/rxaZxiP4B4u
 xWV5UcfJ
X-Authority-Analysis: v=2.4 cv=YOCfyQGx c=1 sm=1 tr=0 ts=68bef980 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=hDdxQT28d3n03to_f2kA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-ORIG-GUID: SeKyPHaP3NHoGAllm6yQk0fRlWo6goDu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-08_05,2025-09-08_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 clxscore=1015 adultscore=0 impostorscore=0
 suspectscore=0 priorityscore=1501 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509080034

On 9/2/2025 9:25 PM, Rob Clark wrote:
> On Tue, Sep 2, 2025 at 4:50 AM Akhil P Oommen <akhilpo@oss.qualcomm.com> wrote:
>>
>> The drm_gem_for_each_gpuvm_bo() call from lookup_vma() accesses
>> drm_gem_obj.gpuva.list, which is not initialized when the drm driver
>> does not support DRIVER_GEM_GPUVA feature. Enable it for msm_kms
>> drm driver to fix the splat seen when msm.separate_gpu_drm=1 modparam
>> is set:
>>
>> [    9.506020] Unable to handle kernel paging request at virtual address fffffffffffffff0
>> [    9.523160] Mem abort info:
>> [    9.523161]   ESR = 0x0000000096000006
>> [    9.523163]   EC = 0x25: DABT (current EL), IL = 32 bits
>> [    9.523165]   SET = 0, FnV = 0
>> [    9.523166]   EA = 0, S1PTW = 0
>> [    9.523167]   FSC = 0x06: level 2 translation fault
>> [    9.523169] Data abort info:
>> [    9.523170]   ISV = 0, ISS = 0x00000006, ISS2 = 0x00000000
>> [    9.523171]   CM = 0, WnR = 0, TnD = 0, TagAccess = 0
>> [    9.523172]   GCS = 0, Overlay = 0, DirtyBit = 0, Xs = 0
>> [    9.523174] swapper pgtable: 4k pages, 48-bit VAs, pgdp=0000000ad370f000
>> [    9.523176] [fffffffffffffff0] pgd=0000000000000000, p4d=0000000ad4787403, pud=0000000ad4788403, pmd=0000000000000000
>> [    9.523184] Internal error: Oops: 0000000096000006 [#1]  SMP
>> [    9.592968] CPU: 9 UID: 0 PID: 448 Comm: (udev-worker) Not tainted 6.17.0-rc4-assorted-fix-00005-g0e9bb53a2282-dirty #3 PREEMPT
>> [    9.592970] Hardware name: Qualcomm CRD, BIOS 6.0.240718.BOOT.MXF.2.4-00515-HAMOA-1 07/18/2024
>> [    9.592971] pstate: a1400005 (NzCv daif +PAN -UAO -TCO +DIT -SSBS BTYPE=--)
>> [    9.592973] pc : lookup_vma+0x28/0xe0 [msm]
>> [    9.592996] lr : get_vma_locked+0x2c/0x128 [msm]
>> [    9.763632] sp : ffff800082dab460
>> [    9.763666] Call trace:
>> [    9.763668]  lookup_vma+0x28/0xe0 [msm] (P)
>> [    9.763688]  get_vma_locked+0x2c/0x128 [msm]
>> [    9.763706]  msm_gem_get_and_pin_iova_range+0x68/0x11c [msm]
>> [    9.763723]  msm_gem_get_and_pin_iova+0x18/0x24 [msm]
>> [    9.763740]  msm_fbdev_driver_fbdev_probe+0xd0/0x258 [msm]
>> [    9.763760]  __drm_fb_helper_initial_config_and_unlock+0x288/0x528 [drm_kms_helper]
>> [    9.763771]  drm_fb_helper_initial_config+0x44/0x54 [drm_kms_helper]
>> [    9.763779]  drm_fbdev_client_hotplug+0x84/0xd4 [drm_client_lib]
>> [    9.763782]  drm_client_register+0x58/0x9c [drm]
>> [    9.763806]  drm_fbdev_client_setup+0xe8/0xcf0 [drm_client_lib]
>> [    9.763809]  drm_client_setup+0xb4/0xd8 [drm_client_lib]
>> [    9.763811]  msm_drm_kms_post_init+0x2c/0x3c [msm]
>> [    9.763830]  msm_drm_init+0x1a8/0x22c [msm]
>> [    9.763848]  msm_drm_bind+0x30/0x3c [msm]
>> [    9.919273]  try_to_bring_up_aggregate_device+0x168/0x1d4
>> [    9.919283]  __component_add+0xa4/0x170
>> [    9.919286]  component_add+0x14/0x20
>> [    9.919288]  msm_dp_display_probe_tail+0x4c/0xac [msm]
>> [    9.919315]  msm_dp_auxbus_done_probe+0x14/0x20 [msm]
>> [    9.919335]  dp_aux_ep_probe+0x4c/0xf0 [drm_dp_aux_bus]
>> [    9.919341]  really_probe+0xbc/0x298
>> [    9.919345]  __driver_probe_device+0x78/0x12c
>> [    9.919348]  driver_probe_device+0x40/0x160
>> [    9.919350]  __driver_attach+0x94/0x19c
>> [    9.919353]  bus_for_each_dev+0x74/0xd4
>> [    9.919355]  driver_attach+0x24/0x30
>> [    9.919358]  bus_add_driver+0xe4/0x208
>> [    9.919360]  driver_register+0x60/0x128
>> [    9.919363]  __dp_aux_dp_driver_register+0x24/0x30 [drm_dp_aux_bus]
>> [    9.919365]  atana33xc20_init+0x20/0x1000 [panel_samsung_atna33xc20]
>> [    9.919370]  do_one_initcall+0x6c/0x1b0
>> [    9.919374]  do_init_module+0x58/0x234
>> [    9.919377]  load_module+0x19cc/0x1bd4
>> [    9.919380]  init_module_from_file+0x84/0xc4
>> [    9.919382]  __arm64_sys_finit_module+0x1b8/0x2cc
>> [    9.919384]  invoke_syscall+0x48/0x110
>> [    9.919389]  el0_svc_common.constprop.0+0xc8/0xe8
>> [    9.919393]  do_el0_svc+0x20/0x2c
>> [    9.919396]  el0_svc+0x34/0xf0
>> [    9.919401]  el0t_64_sync_handler+0xa0/0xe4
>> [    9.919403]  el0t_64_sync+0x198/0x19c
>> [    9.919407] Code: eb0000bf 54000480 d100a003 aa0303e2 (f8418c44)
>> [    9.919410] ---[ end trace 0000000000000000 ]---
>>
>> Fixes: 217ed15bd399 ("drm/msm: enable separate binding of GPU and display devices")
>> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
>> ---
>>  drivers/gpu/drm/msm/msm_drv.c | 1 +
>>  1 file changed, 1 insertion(+)
>>
>> diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
>> index 9dcc7a596a11d9342a515dab694bac93dc2805cb..7e977fec4100792394dccf59097a01c2b2556608 100644
>> --- a/drivers/gpu/drm/msm/msm_drv.c
>> +++ b/drivers/gpu/drm/msm/msm_drv.c
>> @@ -826,6 +826,7 @@ static const struct file_operations fops = {
>>
>>  #define DRIVER_FEATURES_KMS ( \
>>                 DRIVER_GEM | \
>> +               DRIVER_GEM_GPUVA | \
> 
> Hmm, the description of DRIVER_GEM_GPUVA is that "Driver supports user
> defined GPU VA bindings for GEM objects", which isn't really true.
> Fortunately the only thing that it actually seems to control currently
> is the list head initialization.
> 
> Idk if it would be better to make the list head init unconditional, or
> just add a comment here?

But the KMS-only drm driver do use symbols related to gpuva. "struct
gpuva" for eg:. From that perspective, shouldn't we select this feature
here?

-Akhil

> 
> BR,
> -R
> 
>>                 DRIVER_ATOMIC | \
>>                 DRIVER_MODESET | \
>>                 0 )
>>
>> --
>> 2.50.1
>>


