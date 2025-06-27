Return-Path: <linux-arm-msm+bounces-62800-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B837AEB916
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Jun 2025 15:38:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BEBF75601AF
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Jun 2025 13:37:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CC3F82C031B;
	Fri, 27 Jun 2025 13:38:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cQj35XqU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 233FF2F1FDF
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Jun 2025 13:38:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751031483; cv=none; b=r9plGWhw2/UQqVnQrgHeSMGNQ/uHK58TkYJQo0L5r+2MagMMaJOcMuZHNE+2eD1RwKuIK6ID4yR5DA3YBkOAM/xOOpCrpjSyp57GT6qubXBFkUEnKmvgagymOgmlF89cT/yiMXwXsGDy13DobbmRiu/ZNBi28tgTPP4aTr/5A0g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751031483; c=relaxed/simple;
	bh=xnDoLqofriKHpPY1ZzRiz8Isb9hYWeVDw3r07UJgEA8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=A14Vrkaf31KQeRyKErk0sgZ9hWfTmOB5cwN9hrN8eXOcu10V43rXgBljVMnPi/BGVs5ZxstIMmF20PNb8h3N2/EMsOM6j8BEPi0pPP10e7jx2xK2IWnnBrLWNNKNMfpyy5I7dmcKqfR4EAr79rHk2oFXz/Lc6YGhmcfhYNuC0Q0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cQj35XqU; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55RC3nFK028856
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Jun 2025 13:38:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2QtnvQnfluWMwHt5pv65ScEV4CUxIy5BoKzB2wk7FAQ=; b=cQj35XqUQK8xtpDy
	I8pHTQeVJQY2Vx2y2VgUuIR+nA1JnYfaqf++o1KIYpBKe2DvPMXETHXKC4s0LwOj
	q8ak1N7/MYobBNDuH2WZRB859JJ1+GXlxbPbRUSrmPGwWlkwlzPZNuqMfd4X3lNR
	NTw807OvA43MQoyXGbB2+KuubA3Hn23g/swq3BQwWXaaeh3BY9twYoDEwFBID0Ry
	kAU09bA3kPjGadbweSVR4WDvGRKtbNqc6MaWigcVbtsCvbk5CNJ4nDejZPDOPIva
	kIK7jNukqxP0OqoBFnR1IchI1Qq6SXCMDVuNJSoR2POzCc7lhB6aDON3bxR2Kf+M
	VQ89FQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47hkpbhnrx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Jun 2025 13:38:00 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7d446ce0548so90600385a.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Jun 2025 06:38:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751031480; x=1751636280;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2QtnvQnfluWMwHt5pv65ScEV4CUxIy5BoKzB2wk7FAQ=;
        b=APJ+v+tpbUEJOL+fOZptbcJmsoKlZ2PWZzw+Ajq6/h1tNr6Hw6RfLwHOZSePeEi58k
         uiXpWWaIjld+eMWkExlu4uUrEB8dd8XvNqBilQGxJTTGe5RJHjroTvzkibnruicdUqmn
         F6WTKofWW6GFB+SfOveqqczCBWNYdeP45Odi4KcPjZe3GYQm1sq7wVSXUqXujNctcyg9
         E/eAGZepah6FoU7SROUrC1Wnuv231gNK2oPcCL9p/zdoZLLRTAe5mt46F/leEfu+9sS7
         pSGZ0E4JPFdXpTrA3AU5Bc4KZgNda224WmyIBCvqfwhdUFqaIqZ+Qikfu+eq66VHdql9
         TWLw==
X-Forwarded-Encrypted: i=1; AJvYcCVCHmV+yNOQ84nJOyawHWje2RPYeSWTKKQoYCcb3iZ55HVJWo9x90ixYUYQpBTf3I2aeo7cK+KGbQEjQUAh@vger.kernel.org
X-Gm-Message-State: AOJu0YxsP1Rumc47Q9K3I6RoxSiTaaaO1HD7nakpmDSehoPlXLXjcvW0
	5YPLz0d3dSEvXnZZSngg0gZcx5OyR/k9SaseHUWFoXmcTYx4pbNZ3O7XsIg929xFSlYgBKzXbWL
	zj4LtkCgxaFazOIm5A4hnN2hzpaEBK7//9gSvWBMAnwFrq59GFHnKImuR/ZZYsbGK31pf
X-Gm-Gg: ASbGncutnvtEVLmpb1vOEy3tHPSYUvQF+IV+vL+ozrERbGv1g5eCQEKC1QXaxL/mcFb
	V5ntyPSR0grXOLQbyijp3x8r4W0TP5wwxGv/3XcOBuM0hUn4u6PZ1c5VWvhQgIEjMo9kY2Pxy3L
	pSF4vKkAJYk/RGLNYGsWDey/Se3wN2xHVJMMBbx4vmL0+NQv3tdbtjAdwSzpzo0b3ofEEgb9RwW
	jG/5aOwVsIA6MXR3xx4ArUW3r+jJem9kYorSLxuWje2nzvebFhlrTeZAEVsAzhxv9CKZp4q46mf
	Ow/OKGvWFzW+LAD06lhSUGNuFnS1jozh+BOLKMlhXg==
X-Received: by 2002:a05:620a:1904:b0:7d3:907f:7544 with SMTP id af79cd13be357-7d4439a6584mr493460485a.35.1751031480177;
        Fri, 27 Jun 2025 06:38:00 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGvL73yf4sU/gW3mguJ2q0llUda4VgDpvmnaVGMd6K090C/8Loa8JscxVRP4J8tuzbwVKrCvw==
X-Received: by 2002:a05:620a:1904:b0:7d3:907f:7544 with SMTP id af79cd13be357-7d4439a6584mr493455085a.35.1751031479671;
        Fri, 27 Jun 2025 06:37:59 -0700 (PDT)
Received: from [10.92.240.160] ([212.136.9.4])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae353c0100fsm125509766b.88.2025.06.27.06.37.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Jun 2025 06:37:58 -0700 (PDT)
Message-ID: <6dcf88bc-0bdf-4965-b8af-b881a564d762@oss.qualcomm.com>
Date: Fri, 27 Jun 2025 16:37:56 +0300
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 02/38] drm/msm/dp: remove dp_display's dp_mode and use
 dp_panel's instead
To: Yongxing Mou <quic_yongmou@quicinc.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
References: <20250609-msm-dp-mst-v2-0-a54d8902a23d@quicinc.com>
 <20250609-msm-dp-mst-v2-2-a54d8902a23d@quicinc.com>
 <kq6tb2wnte6v5z7uxgzc22kjwcevgvcdluzqbelvnbpbxlkotd@ltlv3u2guj4u>
 <1be2238d-7bb2-4ef9-9c7c-81dab0dcb559@quicinc.com>
 <4jrpa7iyygciuy2k4ydk7cpm5isdrddclljf6gbyvkiqc645tx@idyds4tkstkx>
 <9358a017-81ed-4db7-8e35-955922287c76@quicinc.com>
Content-Language: en-US
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
In-Reply-To: <9358a017-81ed-4db7-8e35-955922287c76@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI3MDExMyBTYWx0ZWRfX684CqLO6RjBc
 bexiP5+cNsE6gpp8ibxoHd0VyvJI/jFUpj9OahZtzTqFSrJVk54CU2OAIV7b64pGLGUgzs95amg
 DLGQNFWeWdZCXU0ny1DdctaVjNxeU/SgEWOITL1VEKESzPcbCNwyGXt2ivLEgrxr2GjZhf57bs0
 4JGLeySvfZ70628ShioM2iF9fjti5QzMkTuv23fAkynW23m2dkRB53SggxCsFmWY+tYxyvZf6sF
 tpW82UgN46SMuzw7MfbM6Uli9acHil7dBUjf8IeRJTup6HpumWpJD0NcCk8MNGP0yEbBd+fAZvv
 9PLWCVLjQYQ0P05lWokA7oP4KGXRtJFkMHaz4fOjg7Ct0jTzAcVvrL1+NkX5JRHzFHmQAfOrsOK
 jn26MQK4e29/vgvihUKCaPTcPO7CNUlGEbCB/lZpic9Kdu9DG2KlYS1/IludNQoqDFFuat6m
X-Proofpoint-GUID: yx6aXr3fB5fbqUT9ai59UutQBDxbY8Kd
X-Authority-Analysis: v=2.4 cv=AY2xH2XG c=1 sm=1 tr=0 ts=685e9eb8 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=e5mUnYsNAAAA:8 a=COk6AnOGAAAA:8
 a=QLF5U8kL1nvtC7vkCdQA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=Vxmtnl_E_bksehYqCbjh:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: yx6aXr3fB5fbqUT9ai59UutQBDxbY8Kd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-27_04,2025-06-26_05,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 mlxscore=0 mlxlogscore=999 phishscore=0
 malwarescore=0 lowpriorityscore=0 spamscore=0 adultscore=0 impostorscore=0
 clxscore=1015 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506270113

On 27/06/2025 11:40, Yongxing Mou wrote:
> 
> 
> On 2025/6/25 22:03, Dmitry Baryshkov wrote:
>> On Wed, Jun 25, 2025 at 08:34:18PM +0800, Yongxing Mou wrote:
>>>
>>>
>>> On 2025/6/9 20:48, Dmitry Baryshkov wrote:
>>>> On Mon, Jun 09, 2025 at 08:21:21PM +0800, Yongxing Mou wrote:
>>>>> From: Abhinav Kumar <quic_abhinavk@quicinc.com>
>>>>>

>>> Originally, the drm_mode would be passed in
>>> two stages: from msm_dp_display->msm_dp_mode to dp_panel- 
>>> >msm_dp_mode. Since
>>> in MST mode each stream requires its own drm_mode and stored in 
>>> dp_panel, we
>>> simplified the two-stage transfer into a single step (.mode_set() do all
>>> things and store in msm_dp_panel). Meanwhile we modified the
>>> msm_dp_display_set_mode function to accept a msm_dp_panel parameter,
>>> allowing the MST bridge funcs' mode_set() to reuse this part code.
>>>
>>> The following patches:
>>> https://patchwork.freedesktop.org/patch/657573/?series=142207&rev=2 and
>>> https://patchwork.freedesktop.org/patch/657593/?series=142207&rev=2,
>>> introduce msm_dp_display_*_helper functions to help reuse common code 
>>> across
>>> MST/SST/eDP drm_bridge_funcs.
>>>
>>> If we drop msm_dp_mode from dp_panel and use drm_display_mode, it might
>>> introduce a large number of changes that are not directly related to 
>>> MST.
>>> Actually i think the presence of msm_dp_display_mode seems to 
>>> simplify the
>>> work in msm_dp_panel_timing_cfg(), this patch series we want to focus 
>>> on MST
>>> parts, so would we consider optimizing them later?
>>
>> Sure... But then you have to change two places. If you optimize it
>> first, you have to touch only place. And it can be even submitted
>> separately.
>>
> Understood, that’s indeed the case. I just want to prioritize the MST 
> patch and have it merged first, since it involves changes to lots of 
> files. Thanks~~

I'm sorry, I hit enter too quickly. The MST will not be merged until we 
get DP HPD rework in, that's a prerequisite from my side. So, while that 
is getting sorted out, we can fix minor issues and perform minor 
cleanups, like the checksums or drm_mode refactoring.

-- 
With best wishes
Dmitry

