Return-Path: <linux-arm-msm+bounces-71648-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DC07B40846
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Sep 2025 17:00:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8A3A15E67BA
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Sep 2025 14:57:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2CC132DAFB8;
	Tue,  2 Sep 2025 14:57:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eu3j3OhN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 749D7208CA
	for <linux-arm-msm@vger.kernel.org>; Tue,  2 Sep 2025 14:57:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756825037; cv=none; b=gO6DAvNRDN3OlJ4mPHc7hriJmDoP6o7FeAbWHkLa4X2JNH6xlRHvHUiOMux3VTMRmQcPYojJ31DQvZoSJ7ZVUtWN+oVrS//UcvukoG716NOzk6bv5PiizOSk+jVLcarhzXxuUUEHmZ2WtxaQpIJfLhA3oxJ+0nfijMkGxckVj2A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756825037; c=relaxed/simple;
	bh=NtBGlMRAqA+UkZeDcrg4wYdlDrWg/u//wUHsrC5a6JA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rCv4QyywoLGPEuWfrRF/YkjZMcCAJIRUNEFXyo1HvskwjZdW8Cgob4NIpjiS29MuXN3sXxQWoScSDjKHHzKegZQ3fZBdggrq6aPx6Sa8i0NWf1OS2poXL1ZkHKDh/mZIGywtbC0zquCFtha6NHaC84YSUtow7L6SmpESRamiank=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eu3j3OhN; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 582EqMmm019818
	for <linux-arm-msm@vger.kernel.org>; Tue, 2 Sep 2025 14:57:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=TsmfkgMBnp9SJQN3L5y7Bh9L
	sMiuyaGhK5Ns/kSaNZc=; b=eu3j3OhN8NE52GVbTnYhN5bolGpchquaY6Oo8k/l
	ZIq1js7kPg4ehpJhc5KyjfsJFAH4PuF77ImvKVVyLchpgfZVrYhzELTaL3Z9voCb
	omQZTL90PlEPBphxQuuykkCUPnLUzlNvsjDl5vSrGvOVrnwZMkmMk/5QU6a2iggr
	O/SzQYmNFf7PoYqZaaVSCk6DFHVh2V0r+iG6vvAfQ1Tq3KW/sCIrEe3hU5UTWcuL
	obseSgjLOqRVhF5dHpbiQuqVGnqB/No/IgASByuaos+JmEB5Ygs56lGJtSKKqoKB
	4uCxCvZP7OT+Ir/3FozajGUA06obmmqQ2nmw3djLIVI/5g==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48urw0077x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 02 Sep 2025 14:57:14 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4b32a58c3f9so56322991cf.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 02 Sep 2025 07:57:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756825033; x=1757429833;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TsmfkgMBnp9SJQN3L5y7Bh9LsMiuyaGhK5Ns/kSaNZc=;
        b=oeAZ03bDfnz9PQmVwlynCeOM2Qn6N+tPYzBvl4JHvyDilkuNKNYrz76aydBTHH0GCk
         X2GzkIz9+omRJT6n7vrg39At7jPkfGZ4Gq3h5EVyPfPJcrrC1/og6sXrDXbfg10TDulo
         S9umRsfEy1WXadVeHMFjuqONoJDCtgz+XVbOf14YLvqSP8CvFtDhApiruq/vkYkyyxOD
         UcKjZOXSylucWFHHoNKMcTvLk1DnCPKoKAC3xGVuvn/ZguczXomqZUPNrlZpKRC0Qjzk
         UG9mcKDH6jVyoRzcRAVKKHFHofX/NGmHbCZOSsTlvs+UfAZBMHLsB2yL5wWbiwLVhlQC
         cQPQ==
X-Forwarded-Encrypted: i=1; AJvYcCVWmX6o1IWdhB19aiVcUM4Jw4muVDb0rdC52p3uHOTUhx/8FeZRHgUVpfRkaClDaBt1yFWeV1vk4ZlKetZr@vger.kernel.org
X-Gm-Message-State: AOJu0YzwFGBycguo5LZf7CdNZABnkG84IVy9sgcYHV8htAkAdCiaNvsT
	BpLRi6bfc9ypVoEPtTabzw1DMz+mkdJbDLpeos0tZBtwrvbGHRXZHcjOYakogwiZEgXz0URoyWp
	aYWGDdkjG7O052RXDjGDxAf2hokowuKEn3U5yQ5i8/iUkcmde0hYNIj3x+FlmTF7DaDrD
X-Gm-Gg: ASbGncvyxNk6F/WmPszsaOvHWghEdn80ywKjYzLCGboL3kjTF5YUApeZohGYkEnUO3q
	yl7Rat/pN4yoctIWVhOddBi9w2qHK2HJrTPXcUZhg3/O7eTdTsZm1hZhbid5rwYtJ2XYy8TT7Hu
	qZDEzeUwyP7VMVCVxBLDBRrNNsWR8JEbkgBgkCnyRzYO30uJr8dWjzcFPgAs48cXMS690ufRJSl
	yMRKZcqJAOILtrZef2gTQ41XWKrQH5cxhfy4rPmMGVBVkJ1N5RwvOM+0Z8BKmHrijRSbQm/YVrx
	Km+pwb0BnpU7rp8Lv6ntHLRK/ozhnWnWD96rrk02O3vEKjgPTz6CG4SofpZwAS4CqkJTs3aigsl
	73zeEP8SniWXmFSUH0lxbPZq0xEDxmsUb44yv/VpZv3azyVmNAwCy
X-Received: by 2002:a05:622a:1103:b0:4b3:9f3:8f86 with SMTP id d75a77b69052e-4b31da25423mr131231381cf.43.1756825033233;
        Tue, 02 Sep 2025 07:57:13 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEZq3/yRV8lo2PEycPVb24whKPiXTRJq33EprBVrpg4tMMnhbq/xhljHZVKKCnnnAke8vRMXw==
X-Received: by 2002:a05:622a:1103:b0:4b3:9f3:8f86 with SMTP id d75a77b69052e-4b31da25423mr131230811cf.43.1756825032575;
        Tue, 02 Sep 2025 07:57:12 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-560827b3ac5sm751954e87.147.2025.09.02.07.57.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Sep 2025 07:57:11 -0700 (PDT)
Date: Tue, 2 Sep 2025 17:57:09 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Jun Nie <jun.nie@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Jessica Zhang <quic_jesszhan@quicinc.com>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v15 00/13] drm/msm/dpu: Support quad pipe with
 dual-interface
Message-ID: <53z5v73r4ixmecpo6z3a6rnsmkgjjftbrwke24bf7mkr5ffh64@2viglv4lnows>
References: <20250819-v6-16-rc2-quad-pipe-upstream-v15-0-2c7a85089db8@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250819-v6-16-rc2-quad-pipe-upstream-v15-0-2c7a85089db8@linaro.org>
X-Proofpoint-GUID: pl3eCVHtkUjOQwWI6d5Xtg3UX-PJyjyA
X-Proofpoint-ORIG-GUID: pl3eCVHtkUjOQwWI6d5Xtg3UX-PJyjyA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAyNyBTYWx0ZWRfX3x2mXYSPxv9d
 1apn436C/VJYv9G/tlFXPGFcnB3jKlBBo0fLkmxieSmlGCsKB3fs+Er0KaWhJJ74Wqwmf6Xk9WO
 HPIgmQNXV8YN4Oer2hTQ72xBvkFo71azs6djrFaOCqpK70/kIMO/WDXeRacZed+apqIY+YgqNq/
 cZpTX3jCy3gsk6xMkVBdyzRcoeARs7aHY/NcqlBdcSm72UXc4sN6bY+82C++fj9DOBvPO+KyHl8
 U0LgDgKCSp1xdcVHARU5EcWUKO3Mo3dPAfVfjsv8HtxXEAD9SchmNw3Mii9Ar/+JDJuLrCVarJ7
 tvggE4EEXbthRwtiZbJUUkdccA4Wj5DcDyGJU7qvyXkARBpgx0hEWrtBXl/uC4JowMzGTqE5QdU
 UEcwqidg
X-Authority-Analysis: v=2.4 cv=NrDRc9dJ c=1 sm=1 tr=0 ts=68b705ca cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=e5mUnYsNAAAA:8
 a=NuLzGU6fH5aT33uQb0QA:9 a=CjuIK1q_8ugA:10 a=a_PwQJl-kcHnX1M80qC6:22
 a=cvBusfyB2V15izCimMoJ:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-02_05,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 malwarescore=0 priorityscore=1501 phishscore=0
 impostorscore=0 spamscore=0 bulkscore=0 adultscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508300027

On Tue, Aug 19, 2025 at 09:30:54AM +0800, Jun Nie wrote:
> 2 or more SSPPs and dual-DSI interface are need for super wide panel.
> And 4 DSC are preferred for power optimal in this case due to width
> limitation of SSPP and MDP clock rate constrain. This patch set
> extends number of pipes to 4 and revise related mixer blending logic
> to support quad pipe. All these changes depends on the virtual plane
> feature to split a super wide drm plane horizontally into 2 or more sub
> clip. Thus DMA of multiple SSPPs can share the effort of fetching the
> whole drm plane.
> 
> The first pipe pair co-work with the first mixer pair to cover the left
> half of screen and 2nd pair of pipes and mixers are for the right half
> of screen. If a plane is only for the right half of screen, only one
> or two of pipes in the 2nd pipe pair are valid, and no SSPP or mixer is
> assinged for invalid pipe.
> 
> For those panel that does not require quad-pipe, only 1 or 2 pipes in
> the 1st pipe pair will be used. There is no concept of right half of
> screen.
> 
> For legacy non virtual plane mode, the first 1 or 2 pipes are used for
> the single SSPP and its multi-rect mode.
> 
> Changes in v15:
> - Polish logic in sspp check and assignment.
> - Link to v14: https://lore.kernel.org/r/20250801-v6-16-rc2-quad-pipe-upstream-v14-0-b626236f4c31@linaro.org

I tried picking up these patches into the msm-next-lumag, however they
seem to trigger a lot of IGT test failures. See [1]. Could you please
take a look at those failures? Note, virtual planes are still disabled
by default.

[1] https://gitlab.freedesktop.org/drm/msm/-/pipelines/1502582


-- 
With best wishes
Dmitry

