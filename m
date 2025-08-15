Return-Path: <linux-arm-msm+bounces-69417-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AA961B28837
	for <lists+linux-arm-msm@lfdr.de>; Sat, 16 Aug 2025 00:15:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BBF9B1CC7633
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 Aug 2025 22:15:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5F5D583CD1;
	Fri, 15 Aug 2025 22:15:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZYORBlw2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6A051A9B58
	for <linux-arm-msm@vger.kernel.org>; Fri, 15 Aug 2025 22:15:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755296130; cv=none; b=Js+hNay8sgEeZEftWUAzyr45XfLPQEVI6zH0OA0cMuC9FHIowunmW2dC5xuGK/A+x+rEL+JrFgbRv1TPWYb/N2oWbEBqqroBzW7zefLbCDMUDpXGy0w2v5ot2pmvqGWOdu+Fvk3YFFilXq5bDGYoj++MPPjs+8mf5mk/6q7ZXKI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755296130; c=relaxed/simple;
	bh=nUr5qFrjfTS8YbLDUJC+wXeA3Df2CTjn/ZgcuYA7T3c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HytZyCxRb7KotI/TQlfrjNY7hkETw8CR54v9yE5JG5QEMvKyVkQzaB0m1pVCYhcvq651pDUiBlVPmdsqQRh6jjoc4Job/Jpd2kW8MVnWes2Ix936Bn5PfZxyWFqAwoxfhcpeLpAhf+yS/fxvausPITx7ioKdrCxoTqRMBEVrhWQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZYORBlw2; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57FEJHRt032108
	for <linux-arm-msm@vger.kernel.org>; Fri, 15 Aug 2025 22:15:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vLwoZ01402e5OUdx+YObu7+diNTS+/oRxZLwC4jp6ok=; b=ZYORBlw2Y0wJA99p
	ZFQw/o9vfPMrDngZv/ZJrpowjeNtqjCvXoPnz8dwFhXQMh0hnRNlXrMyZ7OxaWQU
	2GrkL9yVwR22+jBq1SA2HN9k3vcRN8Zg9hY4rWLL4sO/VFkEjHZ0J6IjbOBKYhUZ
	2BIGXaeqjD7iN7mbiwO0wrvNv/6SBiXzY8GJ18sMTQbLE34ub381+H0PWg1/1ZKD
	Bd/ciQtTPW4pNNf+09k3IZ6mIb5jjk6Aro/Yv0ShHBGdpLSZGpCC9pHFKZ6UzQz/
	zURKTzyASfE5/CQ+uIqc7BzDHtNVJX5GGmcdh4QZYCxu1ykctE+D6vSycS+7MENN
	Z7trfw==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48g9qa3c8q-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 15 Aug 2025 22:15:27 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-70a94f3bbdbso48823016d6.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 15 Aug 2025 15:15:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755296126; x=1755900926;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vLwoZ01402e5OUdx+YObu7+diNTS+/oRxZLwC4jp6ok=;
        b=u/ICbyqewQhBPFJgQZRfLc/1KGh1rmU6wkAqFu32bASlM6xwvvJ3rCn7jOglkhLBub
         y23TUy6xAStW7aLkhaS+cAuJknzmA8kszSCQUPS7NbkctuHAp4m8eoY7HnegrfiJAkqB
         sKKVRUcKbG1mkjAJqTsJtS+iFVrgqWkCraPWF2h9ywwnqZhxm3zCHymQaQxO2DdbQi1+
         hQmWBvVnXM4txPvrKTGvUF0vr3JtqsK+BYx+UPlwflgQBAzoXRulOoKX5Py0ccn13+r5
         QpoXSt//81GGk1hbFL0P+3cNUi8qxshLsS3gnZPuw7hIn7CWiXK3L7vmTXxOjzBu7b+7
         gFWw==
X-Forwarded-Encrypted: i=1; AJvYcCXg19rv70IWgF4Kc6+c0bLu4M1lzzprNwW0lXHgHXHWFluzTdlS1usgfb1E1AKSoHvHXeQM1aW85n08Oi6l@vger.kernel.org
X-Gm-Message-State: AOJu0YzpoBZlNqoEnSwu2P0NndjodNaFGFOpB3uI7UiVPov6soeKGgQy
	sp/KR16LSUe6NUNlJbxCaUJzxEie8WVHx7igYHD42bFQqRsDub8epLKTWlojkJGW3sGyQWldMhu
	ZCLAsncqv+vvYio22Van6zCTGm2gT6lVf40BfaaIRILF1bGYwNZU1y9T36Wp2x8HqLORT
X-Gm-Gg: ASbGncsjDIICT2K7YFU5jjJS070Mk1ZNRpMhm2uwuv8JNMO5AJxNEQd1t45MWwEoVlT
	QWL9JuuZwRVE4RafJN6VL7KycLDlWIXiSfbQn/g2LHIb68VrZckfyB7j6GB+YHdCaghZNQgeHjT
	SzJcfHNimEGpkm7hIXI8+WbVkRPKUCSdl9P4DD5gVYkemKl0WCAe3XJW3VfqenILZtadzWoOi5O
	XcTeodvjDyvaY7/6lZQuNnhnjllZRK+g94pr04HldCo3lZ7WFpdIo7xHSTqlhaiLX6R9MVDO2qQ
	3qin5qNRKF/BEl/+LSiv8/FqLuqVkhVFC9FNwHhAHpVSMNiK7y9HKmo/9A6EUmetKYbDyUNqbu/
	+GGcyVodSZOZ25Zmdoc2HWOh6KfjJTnLDZGQhEQgGk+CaKVrGx8Ix
X-Received: by 2002:a05:6214:1c47:b0:709:b94b:a6ad with SMTP id 6a1803df08f44-70bb060c40bmr6445266d6.29.1755296126532;
        Fri, 15 Aug 2025 15:15:26 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHetHJNt5dVNj424oIDhrEYTzfBXQUTAzwS+BLLxQUPTiMlfCIGu7YxB8m6v/QsySngCnMZ7A==
X-Received: by 2002:a05:6214:1c47:b0:709:b94b:a6ad with SMTP id 6a1803df08f44-70bb060c40bmr6444836d6.29.1755296125981;
        Fri, 15 Aug 2025 15:15:25 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3340a41d5a0sm5871491fa.2.2025.08.15.15.15.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Aug 2025 15:15:25 -0700 (PDT)
Date: Sat, 16 Aug 2025 01:15:21 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] drm/msm: adreno: a6xx: enable GMU bandwidth voting
 for x1e80100 GPU
Message-ID: <ihpfgzrl4xizlhpm2w53oesmdhc63cwbjwq43ano7avbrd6emb@qjdgnzxsoo35>
References: <20250725-topic-x1e80100-gpu-bwvote-v2-1-58d2fbb6a127@linaro.org>
 <e7ddfe18-d2c7-4201-a271-81be7c814011@oss.qualcomm.com>
 <33442cc4-a205-46a8-a2b8-5c85c236c8d4@oss.qualcomm.com>
 <b4f283ce-5be1-4d2f-82e2-e9c3be22a37f@oss.qualcomm.com>
 <269506b6-f51b-45cc-b7cc-7ad0e5ceea47@linaro.org>
 <1727374d-0461-4442-ab35-9acb8ef7f666@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1727374d-0461-4442-ab35-9acb8ef7f666@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=CNMqXQrD c=1 sm=1 tr=0 ts=689fb180 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=2OwXVqhp2XgA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8
 a=2EPmbxBH5dp_UOPDRz4A:9 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: HUVbEWPPtpCe5UNxfbhvkHIfx22y50mW
X-Proofpoint-ORIG-GUID: HUVbEWPPtpCe5UNxfbhvkHIfx22y50mW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODEyMDE2NCBTYWx0ZWRfX88rmgq3vzUiP
 BGlDE1tbbD6m/NsReYdaZ5FPjVcFGKc5EjZC20y0uNHQ58NI7SsHeTiTXTTUON8dvT/NcINeRqa
 cFckh/dt9OV9CHuB8+VZ1ZOtESGoVfnWaHnRtyu+HjGNOyGXBC2HtfcFGhzcZU3i6YpjDEnJDsF
 9VHbuQ1xHx69l7TGuxoiC+lUsbweFR3Z08qmWPU3uwadgCID0JbnLtfes1t8Rhjk6msrFMjgfjU
 0EcdHuj2Mzgf+pS5ruvrN83HNHo50FQwj3JoEgxpi1uKAicM+G6xHwRVUfSW1ZXiEKtBCKttQGH
 iPQDaRZrwMpI5TTIcpP7AYhUKWpIexOvrux9przNbNR3fDNWRUsTR5k2KfWkVnD0VBcK+BS9wC0
 hbtIOzFK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-15_08,2025-08-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 phishscore=0 bulkscore=0 clxscore=1015
 malwarescore=0 impostorscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508120164

On Thu, Aug 14, 2025 at 10:08:26PM +0530, Akhil P Oommen wrote:
> On 8/14/2025 7:56 PM, Neil Armstrong wrote:
> > Hi,
> > 
> > On 14/08/2025 13:22, Konrad Dybcio wrote:
> >> On 8/14/25 1:21 PM, Konrad Dybcio wrote:
> >>> On 7/31/25 12:19 PM, Konrad Dybcio wrote:
> >>>> On 7/25/25 10:35 AM, Neil Armstrong wrote:
> >>>>> The Adreno GPU Management Unit (GMU) can also scale DDR Bandwidth
> >>>>> along
> >>>>> the Frequency and Power Domain level, but by default we leave the
> >>>>> OPP core scale the interconnect ddr path.
> >>>>>
> >>>>> Declare the Bus Control Modules (BCMs) and the corresponding
> >>>>> parameters
> >>>>> in the GPU info struct to allow the GMU to vote for the bandwidth.
> >>>>>
> >>>>> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> >>>>> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> >>>>> ---
> >>>>> Changes in v2:
> >>>>> - Used proper ACV perfmode bit/freq
> >>>>> - Link to v1: https://lore.kernel.org/r/20250721-topic-x1e80100-
> >>>>> gpu-bwvote-v1-1-946619b0f73a@linaro.org
> >>>>> ---
> >>>>>   drivers/gpu/drm/msm/adreno/a6xx_catalog.c | 11 +++++++++++
> >>>>>   1 file changed, 11 insertions(+)
> >>>>>
> >>>>> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c b/drivers/
> >>>>> gpu/drm/msm/adreno/a6xx_catalog.c
> >>>>> index
> >>>>> 00e1afd46b81546eec03e22cda9e9a604f6f3b60..892f98b1f2ae582268adebd758437ff60456cdd5 100644
> >>>>> --- a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
> >>>>> +++ b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
> >>>>> @@ -1440,6 +1440,17 @@ static const struct adreno_info a7xx_gpus[] = {
> >>>>>               .pwrup_reglist = &a7xx_pwrup_reglist,
> >>>>>               .gmu_chipid = 0x7050001,
> >>>>>               .gmu_cgc_mode = 0x00020202,
> >>>>> +            .bcms = (const struct a6xx_bcm[]) {
> >>>>> +                { .name = "SH0", .buswidth = 16 },
> >>>>> +                { .name = "MC0", .buswidth = 4 },
> >>>>> +                {
> >>>>> +                    .name = "ACV",
> >>>>> +                    .fixed = true,
> >>>>> +                    .perfmode = BIT(3),
> >>>>> +                    .perfmode_bw = 16500000,
> >>>>
> >>>> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> >>>
> >>> Actually no, BIT(3) is for the CPU (OS), GPU should use BIT(2)
> 
> You are right that BIT(2) is GPU specific, but that support was
> commercialized from A7XX_GEN3. Anyway, the Win KMD uses BIT(2), so lets
> use that in Linux too.
> 
> I know some docs show BIT(2) support, but lets not bring in untested
> configurations.
> 

I'd say, I can't parse the comment. Should we use BIT(2) or BIT(3) here?

> -Akhil.
> 
> >>
> >> This is *very* platform-dependent, goes without saying..
> >>
> >> I see BIT(2) is also valid for X1P4
> > 
> > 
> > I'm confused, Akhil can you confirm ?
> > 
> > Neil>
> >>
> >> Konrad
> > 
> 

-- 
With best wishes
Dmitry

