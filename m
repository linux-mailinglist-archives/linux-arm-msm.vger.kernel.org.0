Return-Path: <linux-arm-msm+bounces-88641-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 13207D161DD
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Jan 2026 02:14:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0E664301C943
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Jan 2026 01:14:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9CAD8258CCC;
	Tue, 13 Jan 2026 01:14:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cl3yAOyy";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fC+/+9cZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BE762AD2B
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Jan 2026 01:14:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768266854; cv=none; b=O4WfNvbHgXx+qPiTdzGc7Y144VbcfkfsHTi2oVu3SkycdymjDTWxxD7PS7Mb7sNe/GslOV/AHBdqTTHehIKMvfkB4W/g1JrQpufOYgOzEYdlpWiM2b/LrFAq4qNaaV9TKGISSzZ2fGQHsR+eW9kI9D6gHCG6HTxgHm+OyVc+JCU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768266854; c=relaxed/simple;
	bh=5e6UOVIkiXm0TsDB47bn0HCzcwZijnsfPFP3chJ/+9Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HgqU8S+J9HpN01mJitR2KrX6raGfxcSCLalNokn89QTZPoYm7ngcHeKfT2Ql+FUK5EI/F/rEw7HRKqYso84HRPBgABeShUlqN8dur36MQPh5iRwMHPAyrpA0/ZrHN2rpzjhTI0gPG1zI3w+0v5HY9KkDB2EHIt2W5CQwwAgR5FA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cl3yAOyy; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fC+/+9cZ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60CN4wwq175851
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Jan 2026 01:14:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=J/0cnCYpDBos+7nwSFiIuXvo
	+vrGW9jjlT38b0YSnCo=; b=cl3yAOyyWwhcHORodfqsQLgbb7Ch2B7xKZSnlKuR
	t4Qe0xREyUzz2t2V353PmvKDUBZNx50pMikiU0vkqS9Nz0uCvhYGQvMSL2dsW69W
	o2SbgK8ATBv18DcjEx8fa0TNtD9Nqjm8/5vOXg+313zwBbECXQRq+p59B8e+2CPI
	XymJOCYhMfPS/yGQTR/SzTYKE+J8yC6C/WAa8UZ9G3SjlSiVLciyKq0tFy5V/9/J
	SCJwJlxbGNFlDYbNo9Y3wlQh4BSRLQ7dEPasRgyjMwGeJXUKRfpIqKRE0w/VMgC3
	z522A1aWZI4o1PKN/Or9o2kgKwIb+EZPt5fRLGNwKUi/pA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bn52f17ws-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Jan 2026 01:14:11 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8b17194d321so1045633585a.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 12 Jan 2026 17:14:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768266844; x=1768871644; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=J/0cnCYpDBos+7nwSFiIuXvo+vrGW9jjlT38b0YSnCo=;
        b=fC+/+9cZ7BGDx+0RVqGqJ4BqPnlKr/3wmCUFpUbH7iH2rB8ozuqQjcPmby3OrgUbdO
         iVqcZsbEWjJwVozo1+vRncB5wr0A4MTpXhZWOgTp2PnSmTfN9rpp1wi5Mm1knMVTbBr3
         k1waJjD+mVLCrfAgkGGeslDSTXnIUnP89SkjM+eVVCOmXNrJNGQUVRgskNgbKXsvPN0i
         MtKTzfuyFdabeiC3B8TRP/Pf2i8s4kZXEiSsImAMvkaNNJtAi6ilp/PvwIC+BHEODdsM
         OMj0hhIQsDd8e0IAMRAd4VA1Iwz9yUJfRuX415V+Y9FgJWaI7oDXkpUng4YwuxEdbG0o
         8XfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768266844; x=1768871644;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=J/0cnCYpDBos+7nwSFiIuXvo+vrGW9jjlT38b0YSnCo=;
        b=YukGUWEqv1PBWty2h15NiA913wb2rLzuynotFGo1NyhLc+k64aSamyBgooHb+ZxAiP
         YODEZOL2WC7dIAE8RHzOgwiI40zcZLh1Kh+US847lG1yHnuL9Trv9D0RWPjWzCu1qtjN
         C2A55ZMCtqgFiM3gJl8xIthLy8ral/q0WjJ+ZQYiH4GO80ftE20t3Ce6DnzX7UuTdiTX
         8LTLaWQ0YWe1AsLLHvKRREKUlON/EZlAaRUqD+RIgZv6RijPxVoH5T/35l0nLCU8CL4V
         iVe8vBhrYebVRxzAqPeN03gQsrkz0zdxLfY+/d3LOyAGBqanOaJKLAGDaVqhXkdoOTXL
         GfPQ==
X-Forwarded-Encrypted: i=1; AJvYcCXDWJUyNDHfps2Fl36QDoayrHVVSZylmG3Z9P4hZwnp/kGeKp5yf6sPGaWrgF3iTC8XVFgR6gm9lWqC+BLp@vger.kernel.org
X-Gm-Message-State: AOJu0Yz9TBpSb+ddUXsWwgMTOgPFE+7F5lDmf4xNQysO06mv/3Tx3jJz
	cxJ293gFEth0z2hoir9QdGA7w6t0MS9vxDn4H/EM71mkFgDIZrzO6U3dizOSAFSNJSu/iut4czS
	Q9A6EqshPOmO/aDSdGi4iJgoXAveAx0HQZaoce/sR5qGgeJXhiuMGQ5ZYPoW0WAy4w3Rp
X-Gm-Gg: AY/fxX55XelBHWk5uAA7+agxRmalF2SQZFJZgJ5XW4IK9oKpV8EQRMVZYYsG/jJkBS+
	Gg0ujfKI1ubmwLpQfDGYyqLUyTRRyB3vXcD8BrfCz8nG6PCFmRO4H26D5PFa7u3AclB80vc8p6E
	/GXpHeNcEaay5OvLipUB5pUtDNjcLn11oxGSGHKxyMWBg12yJyFBx1E9t632c1UFutPD6Ke+QcF
	5GvVfUNffCLyYtfwJjACyTd6qvUb49bN2GNcM0BlPv07R+SLnITFZx+dr+2d/iuH6BnWejp0cQr
	TeAEtmO6OEyAvSivQ+2YHGPTkM6c4ByvHzlq5N/vie2jDqDMSCb6n88oUYKFizAdyxrXQIq4pQo
	K3A+IFR/6+UE8XG1Y0gdio4U9dLBXdSVDwTrFe5gZ73N31SWe1MGMNetKR+VVejYdFZ8icHYq1w
	U4LRgHSvKCGsaaUsEVgKUnn84=
X-Received: by 2002:a05:620a:2a07:b0:8b2:271e:a560 with SMTP id af79cd13be357-8c3893e7e2bmr2315927185a.72.1768266844327;
        Mon, 12 Jan 2026 17:14:04 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF4WlkP4sNqdgzyvpCMNJE4qaOKFUaJCa4aduSzPBbjzyb10EW/oKcBiBwhOQ9DebVVAgpZZg==
X-Received: by 2002:a05:620a:2a07:b0:8b2:271e:a560 with SMTP id af79cd13be357-8c3893e7e2bmr2315923785a.72.1768266843790;
        Mon, 12 Jan 2026 17:14:03 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59b6a2b8330sm4926075e87.10.2026.01.12.17.14.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jan 2026 17:14:03 -0800 (PST)
Date: Tue, 13 Jan 2026 03:14:01 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Alexey Minnekhanov <alexeymin@minlexx.ru>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Alexey Minnekhanov <alexeymin@postmarketos.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 0/3] drm/msm: drop DPU 3.x support from the MDP5 driver
Message-ID: <yxp6k6bjscuxwm5mz2ev2647ewe7mycus7dszehtrfr7qhxx25@nptailaparnc>
References: <20251228-mdp5-drop-dpu3-v4-0-7497c3d39179@oss.qualcomm.com>
 <bb889140-5ddb-485a-bb50-739f68297838@minlexx.ru>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bb889140-5ddb-485a-bb50-739f68297838@minlexx.ru>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTEzMDAwOCBTYWx0ZWRfX0KOK6TaFBl5K
 B5mN7UE225u9oYzlH99dnhtXjU3GTsLJxcocdkHP7U5sL7m+MdgJ5ZZhwCxgA3N3k75Cx0YQ7W6
 FwbI5u3NuCnT9T1Mqvrh/jXa1IvWqqXzqnzpHkCmxPaCYzF5A4aTPo3kMZvSfsmjKCxmWo39W0E
 +vhNK31Bm0m7QyhnxvMebGdM/vTTV9/1Vr51+7XYPvmnYH6razq9BBfmJMCAYYbYNLkEYaa6cwD
 dbgzJaeQ+e3ppfZq5BGe29cgY2acR4vq4yrSkX8QJWwed+Jep2wN2T4WaxRmO8i68UW9VQXdl7b
 egNVcjbIuTAYJmMPpMDQBuoTKTFQkIXiS1gLXRm1EtO28Ely/wTRd81rJPENlNjUDijcRTOM9VZ
 IUXX+2RFHT9FxiNOqJyrXcQpPYt6EXdmIcPlHv+hefv/FP5LvgU3pbgF83VjqiT728I+g1PTNH3
 8wBowpeO1s+NHnZneMw==
X-Authority-Analysis: v=2.4 cv=TcCbdBQh c=1 sm=1 tr=0 ts=69659c63 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=ZEkBDfZtAAAA:8 a=vlXmtpXO02sfSNYNR6MA:9
 a=CjuIK1q_8ugA:10 a=bTQJ7kPSJx9SKPbeHEYW:22 a=IqjDwHP2KxQYjTbYCZGP:22
X-Proofpoint-GUID: Kdc1qqqY2hKO2C9tyWLL8NNzpj2KKYQJ
X-Proofpoint-ORIG-GUID: Kdc1qqqY2hKO2C9tyWLL8NNzpj2KKYQJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-12_07,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 adultscore=0 bulkscore=0 suspectscore=0
 lowpriorityscore=0 phishscore=0 spamscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601130008

On Tue, Jan 13, 2026 at 03:02:33AM +0300, Alexey Minnekhanov wrote:
> On 12/28/25 7:02 AM, Dmitry Baryshkov wrote:
> > Fix commands pannels support on DPU 3.x platforms and drop support for
> > those platforms (MSM8998, SDM660 / SDM636, SDM630) from the MDP5 driver.
> > 
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> > ---
> > Changes in v4:
> > - Inverted logic in dpu_encoder_phys_cmd_wait_for_commit_done(), check
> >    for the feature rather than the lack of it.
> > - Link to v3: https://lore.kernel.org/r/20251224-mdp5-drop-dpu3-v3-0-fd7bb8546c30@oss.qualcomm.com
> > 
> > Changes in v3:
> > - Fixed commit message (Marijn)
> > - Reordered CTL_START checks to be more logical (Marijn)
> > - Link to v2: https://lore.kernel.org/r/20251218-mdp5-drop-dpu3-v2-0-11299f1999d2@oss.qualcomm.com
> > 
> > Changes in v2:
> > - Fixed CTL_START interrupt handling on DPU 3.x
> > - Link to v1: https://lore.kernel.org/r/20251211-mdp5-drop-dpu3-v1-1-0a0186d92757@oss.qualcomm.com
> > 
> > ---
> > Dmitry Baryshkov (3):
> >        drm/msm/dpu: drop intr_start from DPU 3.x catalog files
> >        drm/msm/dpu: fix CMD panels on DPU 1.x - 3.x
> >        drm/msm/mdp5: drop support for MSM8998, SDM630 and SDM660
> > 
> >   .../drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h    |   5 -
> >   .../gpu/drm/msm/disp/dpu1/catalog/dpu_3_2_sdm660.h |   5 -
> >   .../gpu/drm/msm/disp/dpu1/catalog/dpu_3_3_sdm630.h |   5 -
> >   .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c   |   7 +-
> >   drivers/gpu/drm/msm/disp/mdp5/mdp5_cfg.c           | 314 ---------------------
> >   drivers/gpu/drm/msm/msm_drv.c                      |  16 +-
> >   6 files changed, 17 insertions(+), 335 deletions(-)
> > ---
> > base-commit: 4ba14a6add891fe9b2564e3049b7447de3256399
> > change-id: 20250926-mdp5-drop-dpu3-38bc04d44103
> > 
> > Best regards,
> 
> Thanks!
> 
> This fixes DPU with command mode panel on Sony Xperia XA2
> (sdm630-sony-nile-pioneer) and still works on video mode panels on
> whole bunch of sdm660/636-xiaomi phones and tablet. The whole series
> 
> Tested-by: Alexey Minnekhanov <alexeymin@minlexx.ru>

Thanks!

-- 
With best wishes
Dmitry

