Return-Path: <linux-arm-msm+bounces-84934-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 99BD0CB3DC6
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Dec 2025 20:30:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 4C1C7300E81D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Dec 2025 19:30:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 18C962E7BDD;
	Wed, 10 Dec 2025 19:30:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aV5d3nWP";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="falAe0c4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60F7C2135AD
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Dec 2025 19:30:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765395028; cv=none; b=IF/hyyLJjkn/rcKGT3T6SpL9JwujhpzxvITZP5Psvd7KzAMq2TDFmzfu6iKGPMGJlF5HjqHx+IztwMUwJo+EoblYcw8tHwABpuK7tEB3kiYzpq0tAsliEkt+otVBM0gpsePtfnfNas7Diso6NyNypFCMsOg8OA9KghZdQrKtvT4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765395028; c=relaxed/simple;
	bh=SxvrDRY6coEHp5ujfRhxT6Hum2Jp564Ba2eVHCxM20o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZN8LL4a2wvPtRT587GeQkL3nw3r+OWwpvbfMDnzKVMfJamX0AjVCuB43pYvxFqncwrMTnNO96QC0dxQRtnO2ctEYuFnJYfk//XtuE0aYl+bPD3GbAp0jlu3QmkO3KY1fqbNlgrFjKIkfAMn+UZNKhsQWhZDDqiQrZ5q3sV+8Vwg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aV5d3nWP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=falAe0c4; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BAIRw2Q3760052
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Dec 2025 19:30:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=9L2O7qJqRbBAsKFfERh2S4V0
	Wy8js6umUKBBvCO1IHI=; b=aV5d3nWP0NZz5NVW956uSMu1vOm6uViY8SswRNIY
	dUmIYz/Q9NruXYQJ+PuBKXx++iHE0Sf9vYLKAyRG2sb6FHwqqVi1AlaCcnIj0vR0
	KphyUnJlub++oawy6tN5+KemHHv3G62af9Kag8WhCz7VmOUcLAUWstwhzkN5VBiI
	s6xgQ1ScIpeDt5sX8c2KDnWpOIA634YNHNaXg9E9ndppIqw/dP6KKpHV4v0XJ2Fu
	tMja0Pw4wMIGHmHa+Yw7ZwZNiqwZdp1e3qCgzTmjYP+620ZUmmBxSsMT6AElzTPP
	RBmujI9ierM84poNXbwfrYs6AynDDGLlgzh33H2v52aP0A==
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com [209.85.222.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4aybhp8xh9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Dec 2025 19:30:25 +0000 (GMT)
Received: by mail-ua1-f69.google.com with SMTP id a1e0cc1a2514c-93f550cdb2dso154430241.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 Dec 2025 11:30:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765395024; x=1765999824; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=9L2O7qJqRbBAsKFfERh2S4V0Wy8js6umUKBBvCO1IHI=;
        b=falAe0c4bHrSMbZgMAjI9xS2h2no0lg878bN3FboO44lZUJCV2aGvzQL2l4Z0dXSgv
         AF7lfzrCBCcVHVasypE5PvtVlSob7qfEwMj0SPXwdzx5aI/FSmzoVRY+NBCRM22qhEwG
         GrPjempFH5k5Bx6BYVNXWxaLMT6A1xqGsE+fMYSHEhBEfc+/MPY7zRCmxiJvPyO3wo9l
         OqheaOLrlufGU5s0pLhiSDJAOgHb+xesfrhjCJKDMFDzrMslnyw+ov9ubAEvXjnUvKit
         Cw4MbX9WcO/dblV+iCS7XlnXGTD99lSvPmLdehiru03X+WnX4dH7gKXM2RU+DH7PEdfb
         r03g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765395024; x=1765999824;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9L2O7qJqRbBAsKFfERh2S4V0Wy8js6umUKBBvCO1IHI=;
        b=Vq7p2cYP9M4BH6HU1yKYoEscM6l4gUvsDLzY8RVp0Ur1K+Kwr6J89E2sDXkLucsQsR
         txjQFKNTVgQQNXm1ikeikwmRPF+urkUXTTOBLWcllhMcHiD9feOL03hl73TQC3rjVlpk
         PJvHrUrIC+9q4XhYrU9T6SIqS4iTbHbLjU60SHSztxwn9z8oAgWAa7ZgnyjT+f3TvCaL
         eVoMWjP2l4UgPXM6t/5l7FfIQCnKjLyCmfSyvSoWM/pQ0ZeC24npsCc6XLjXk5okPdOy
         eteSq2GuHsihn+SL/N1qW83CQEWFm5EEUgebnOa/azO1fe0DO1trsMpDxWXY32UYHtM/
         y3Sw==
X-Forwarded-Encrypted: i=1; AJvYcCWm4tOYj/eNSKawJgdEUa/37rKRRoan5Kr+BOrlqBfD1ELOABBCiJNOPeOVsveJuf7DU8dBSX+1l3QDycjl@vger.kernel.org
X-Gm-Message-State: AOJu0YxL0P+A++QnMbTRH4Yzv/FeNG1YOtGwJHoZvawSG2pZsbsTksWL
	7C9pPqqpzRVZ8WY5+s1g8T4mrfqVHePfyykFY383YOicHugq7J4NF0C4rPH8wwV/NvATsTF7LEW
	kdM12YVWx5ZsJTXvZFu8R87uRXSsYdVxXBGD+nDl6m6RIn7gPfP70dTvUHasRCF4Ug2k6
X-Gm-Gg: AY/fxX5wD+vA9P5u6CrjWKRjwswh1A/YWTUZmdwj30bRG7wS4u1cL/4qnCRYweq8gxe
	NEjhklSvyJNDJ1riNoGKAthHQS5hUOxO/GBs+g/mo3a9wP0Fh+2hwUskKfobJGez+Q35y/7JV6Z
	JK3w+/uqdXCKHWACD1t1yT2Ku9CVKbQFMcxMwUTecZwsiddEN1IrT1AefNJRejqcAUVvlYsTcBW
	9agcY/rSsL0mRsHGOkpQo0TSpmd2kfWZ+5wgKdjVfg9D/0gAOttfUqktSCwt6FTZGz1D6c1IZgw
	t3wXz2oOqdYk+HYIJyL6lRn5iwkHssgLdKoqvX/fwfkSm0f3romTxTJRaz3a6dYWPhtOfGv4Caq
	H09rj42VMekHw8SU6I/oqTCY98mCIpwct4DGn8AOr2jgFejTs7ybhPsK6+9IAIA6zl6lGHs4wLO
	2QBprquSh8UjMN1Sy1jKe3O+c=
X-Received: by 2002:a05:6102:548b:b0:5e5:63e3:ebb9 with SMTP id ada2fe7eead31-5e571f1cc97mr1085458137.40.1765395024456;
        Wed, 10 Dec 2025 11:30:24 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFvnyaHmfXL7ujjLA1dO0Btd+zC3t/+63/Dvuqr+u4Uhc50grJlKCdJAW0WeT54bdVE1IylmQ==
X-Received: by 2002:a05:6102:548b:b0:5e5:63e3:ebb9 with SMTP id ada2fe7eead31-5e571f1cc97mr1085445137.40.1765395023973;
        Wed, 10 Dec 2025 11:30:23 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-37fbca8cd3asm832211fa.39.2025.12.10.11.30.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Dec 2025 11:30:23 -0800 (PST)
Date: Wed, 10 Dec 2025 21:30:20 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Marijn Suijten <marijn.suijten@somainline.org>
Cc: Jun Nie <jun.nie@linaro.org>, Abhinav Kumar <abhinav.kumar@linux.dev>,
        Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Jessica Zhang <quic_jesszhan@quicinc.com>
Subject: Re: [PATCH v16 10/10] drm/msm/dpu: Enable quad-pipe for DSC and
 dual-DSI case
Message-ID: <i234zyh7ajsxdvbkzindyk5h6wilds226jqmh32kml4aweesav@frlk2l7zgmg4>
References: <20250918-v6-16-rc2-quad-pipe-upstream-4-v16-0-ff6232e3472f@linaro.org>
 <20250918-v6-16-rc2-quad-pipe-upstream-4-v16-10-ff6232e3472f@linaro.org>
 <tjakx64c25gyakblncsvuoj2iquoknx4ngwujt2uf2clhhfvfl@lbvhrimf6gwp>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <tjakx64c25gyakblncsvuoj2iquoknx4ngwujt2uf2clhhfvfl@lbvhrimf6gwp>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjEwMDE1OSBTYWx0ZWRfX/MM462TEGdG7
 KHHNjDzO80GSJpgQT2cv+OnRR3jcBfY4YLfIzvpwdeVSfwAvxwGu9hEqUeKYKxwpYc+Lah8V7Do
 CC72h5dbgIUJOFCusG0i/Nv/B+9dT2LkzQpvhXVy8fUIexElz1gxFh4gjXeQ/cUzETnmJtp33hJ
 0rxybLdb8a+TYXCv71pWbkEmntX4GgzGYPi+cwc5EloehlcgMLTX6OsFCTnG/PWENUdVMPYQ0KG
 DGy/SmEDCuA40E3E5mIfiiL4HfOIz9ib2PQgrh/i5hTcDFyrr9nkCP+B5hCcRlB90Qm5qt97wUo
 OZof5aZAgkMaSw6rFf2a+MnsrS4lZ1EZmdB9k3cbParEA0axZmyCeWR5ZRtVCHPEJN9gOrjq4+z
 6UULQ7+cG6Tq6/Kf2VNrhO39TyMEyg==
X-Proofpoint-ORIG-GUID: iP26jBBPU-7gie22SAZ4BLG7oyM6dotz
X-Proofpoint-GUID: iP26jBBPU-7gie22SAZ4BLG7oyM6dotz
X-Authority-Analysis: v=2.4 cv=LJ9rgZW9 c=1 sm=1 tr=0 ts=6939ca51 cx=c_pps
 a=UbhLPJ621ZpgOD2l3yZY1w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=KKAkSRfTAAAA:8 a=COk6AnOGAAAA:8 a=AkOOjSqQI7qdMes6WA0A:9 a=CjuIK1q_8ugA:10
 a=TOPH6uDL9cOC6tEoww4z:22 a=cvBusfyB2V15izCimMoJ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-10_02,2025-12-09_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 clxscore=1015 priorityscore=1501 suspectscore=0
 lowpriorityscore=0 bulkscore=0 malwarescore=0 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512100159

On Sat, Nov 29, 2025 at 05:37:43PM +0100, Marijn Suijten wrote:
> On 2025-09-18 21:29:02, Jun Nie wrote:
> > To support high-resolution cases that exceed the width limitation of
> > a pair of SSPPs, or scenarios that surpass the maximum MDP clock rate,
> > additional pipes are necessary to enable parallel data processing
> > within the SSPP width constraints and MDP clock rate.
> > 
> > Request 4 mixers and 4 DSCs for high-resolution cases where both DSC
> > and dual interfaces are enabled. More use cases can be incorporated
> > later if quad-pipe capabilities are required.
> > 
> > Signed-off-by: Jun Nie <jun.nie@linaro.org>
> > Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > Reviewed-by: Jessica Zhang <quic_jesszhan@quicinc.com>
> > ---
> >  drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c         | 27 +++++++++++++++++------
> >  drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h         |  6 ++---
> >  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c      | 28 ++++++++----------------
> >  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h |  2 +-
> >  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h   |  2 +-
> >  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h      |  2 +-
> >  6 files changed, 35 insertions(+), 32 deletions(-)
> 
> With this patch applied, I get the following crash on the Sony Xperia 1 III, a
> dual-DSI dual-DSC device:
> 
> 	Unable to handle kernel NULL pointer dereference at virtual address 0000000000000020
> 	Mem abort info:
> 	  ESR = 0x0000000096000004
> 	  EC = 0x25: DABT (current EL), IL = 32 bits
> 	  SET = 0, FnV = 0
> 	  EA = 0, S1PTW = 0
> 	  FSC = 0x04: level 0 translation fault
> 	Data abort info:
> 	  ISV = 0, ISS = 0x00000004, ISS2 = 0x00000000
> 	  CM = 0, WnR = 0, TnD = 0, TagAccess = 0
> 	  GCS = 0, Overlay = 0, DirtyBit = 0, Xs = 0
> 	user pgtable: 4k pages, 48-bit VAs, pgdp=000000012d4e1000
> 	[0000000000000020] pgd=0000000000000000, p4d=0000000000000000
> 	Internal error: Oops: 0000000096000004 [#1]  SMP
> 	Modules linked in: msm drm_client_lib ubwc_config drm_dp_aux_bus gpu_sched drm_gpuvm drm_exec
> 	CPU: 5 UID: 0 PID: 3081 Comm: (sd-close) Tainted: G     U              6.18.0-rc7-next-20251127-SoMainline-12422-g10b6db5b056d-dirty #21 NONE
> 	Tainted: [U]=USER
> 	Hardware name: Sony Xperia 1 III (DT)
> 	pstate: 60400005 (nZCv daif +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
> 	pc : dpu_plane_atomic_check_sspp.isra.0+0x88/0x3f4 [msm]
> 	lr : dpu_plane_atomic_check_sspp.isra.0+0x84/0x3f4 [msm]
> 	sp : ffff800081e23940
> 	x29: ffff800081e23950 x28: ffff0000bf2700d0 x27: 0000000000000a00
> 	x26: ffff0000bf270000 x25: 0000000000000a00 x24: ffff0000bd0e5c18
> 	x23: ffff000087a6c080 x22: 0000000000000224 x21: ffff00008ce88080
> 	x20: 0000000000000002 x19: ffff0000bf270138 x18: ffff8000818350b0
> 	x17: 000000040044ffff x16: ffffc488ae2e37e0 x15: 0000000000000005
> 	x14: 0000000000000a00 x13: 0000000000000000 x12: 0000000000000138
> 	x11: 0000000000000000 x10: 0000000000000012 x9 : 0000000000000000
> 	x8 : 0000000000000a00 x7 : 0000000000000000 x6 : 0000000000000000
> 	x5 : 0000000000000002 x4 : 0000000000000000 x3 : ffffc48897741db0
> 	x2 : 0000000000000000 x1 : 0000000000000000 x0 : 0000000000000000
> 	Call trace:
> 	 dpu_plane_atomic_check_sspp.isra.0+0x88/0x3f4 [msm] (P)
> 	 dpu_plane_atomic_check+0x100/0x1a0 [msm]
> 	 drm_atomic_helper_check_planes+0xd8/0x224
> 	 drm_atomic_helper_check+0x50/0xb4
> 	 msm_atomic_check+0xd0/0xe0 [msm]
> 	 drm_atomic_check_only+0x4e0/0x928
> 	 drm_atomic_commit+0x50/0xd4
> 	 drm_client_modeset_commit_atomic+0x200/0x260
> 	 drm_client_modeset_commit_locked+0x64/0x180
> 	 drm_client_modeset_commit+0x30/0x60
> 	 drm_fb_helper_lastclose+0x60/0xb0
> 	 drm_fbdev_client_restore+0x18/0x38 [drm_client_lib]
> 	 drm_client_dev_restore+0xac/0xf8
> 	 drm_release+0x124/0x158
> 	 __fput+0xd4/0x2e4
> 	 fput_close_sync+0x3c/0xe0
> 	 __arm64_sys_close+0x3c/0x84
> 	 invoke_syscall.constprop.0+0x44/0x100
> 	 el0_svc_common.constprop.0+0x3c/0xe4
> 	 do_el0_svc+0x20/0x3c
> 	 el0_svc+0x38/0x110
> 	 el0t_64_sync_handler+0xa8/0xec
> 	 el0t_64_sync+0x1a0/0x1a4
> 	Code: 2a1403e5 52800082 94008e28 f9400380 (f940101b)
> 	---[ end trace 0000000000000000 ]---
> 	pstore: backend (ramoops) writing error (-28)
> 	[drm:dpu_encoder_frame_done_timeout:2726] [dpu error]enc33 frame done timeout
> 
> I don't see any thought given to it in the extremely terse patch description,
> but this patch seems to unconditionally select 4 DSCs and 4 LMs on this device
> because the underlying SM8350 SoC has 4 available in its catalog - while it
> was previously affixed to 2:2:2 matching the downstream and known-working
> configuration of this device - and I can only imagine things are rolling
> downhill from there.
> 
> faddr2line seems to be failing for me, but this is the line
> `dpu_plane_atomic_check_sspp.isra.0+0x88` seems to be referring to:
> 
> 	aarch64-linux-gnu-objdump .output/drivers/gpu/drm/msm/msm.ko -dS | grep dpu_plane_atomic_check_sspp.isra.0\> -A80
> 	00000000000671ac <dpu_plane_atomic_check_sspp.isra.0>:
> 	static int dpu_plane_atomic_check_sspp(struct drm_plane *plane,
> 	...
> 	   67234:	f940101b 	ldr	x27, [x0, #32]
> 		if (!(sblk->scaler_blk.len && pipe->sspp->ops.setup_scaler) &&

I think it is:

        pipe_hw_caps = pipe->sspp->cap;
    14bc:       f9401018        ldr     x24, [x0, #32]


So, please check why pipe->sspp becomes NULL (or where do we miss the
NULL check for pipe->sspp).


-- 
With best wishes
Dmitry

