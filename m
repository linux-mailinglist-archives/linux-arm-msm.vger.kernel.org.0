Return-Path: <linux-arm-msm+bounces-71546-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C0912B3FC14
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Sep 2025 12:19:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6569C2C27F3
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Sep 2025 10:19:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9519F28031D;
	Tue,  2 Sep 2025 10:19:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iJa1aZtN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D419F27FD7D
	for <linux-arm-msm@vger.kernel.org>; Tue,  2 Sep 2025 10:19:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756808366; cv=none; b=hPmPATwl6/OHP6cBFazoHMCXv3zJ2NeSnKTZPbisyWLFnc/ZcAlkLBjiXNm722IQa7Bv47Z7ZVkGN35wL+IGa+Fo0Oovqew/BjLONii0qrK21Z3UjkJfvdBmMABpGdigrs17TYBgVtGxELhaWjoN3KGuAXgHVevG3XqxJ3qd9tE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756808366; c=relaxed/simple;
	bh=FSegoTi0JyiRxfOzc/dPsCA4YdptcJJvDsAwo9nEghg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Jw5v/yXWWV0Ah5IVqZVw80ryCJHSQRvPspGYx63fHOJ5FF9Up8ve1q2QPZj47SBz71+/2UzRdtpH8gggn/Mh51ITckHnJCPIkVNYTXYEqKGuQ4S4px94XxK5H0n+6Nsz/M3H2+aQLUDZtVG6Xp7uGrhczVmWLkdp4KRK1SC7xJA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iJa1aZtN; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5822RlQS015031
	for <linux-arm-msm@vger.kernel.org>; Tue, 2 Sep 2025 10:19:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	br24zZfPUMh2y5hphW6eSZrx2KUZEQPgg53oVJYo2X8=; b=iJa1aZtNGpYUsLtH
	m1ASUdi9WGVZUi0Z49LkP+EvwspangHxNaWLIMdnNHvetGnlp4ED/YlZPhZRziSE
	ZwHP2SWGpvO5791IK5bvAGBDV2yr6OPvPIiFQ+mTOaBT7xDmhxLEryuErswaUDGr
	BcZ/QGtbAu8UnRYzUZqwJ71NT66l682265rzx9lPYlkC9aOUvX39Geexba7Z0l/L
	GhzZy02uYiaqenl8frn7LcCDeflWRQtQR602svxMh/JV1ASRE3rNaixMVqsDg4SR
	C6d0yZqMpy2R3wrQXQFyiCcxwYJMZDjP+4BjoTnAmtNhp6Vtye8PaAque6jQ63v3
	xVTv5A==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48urvyyekm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 02 Sep 2025 10:19:19 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-24458274406so100708665ad.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 02 Sep 2025 03:19:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756808358; x=1757413158;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=br24zZfPUMh2y5hphW6eSZrx2KUZEQPgg53oVJYo2X8=;
        b=f7I2Z8GoA1PLGhEbZ88LJL91nAj/4EF7EWtPKKZRwgHIXiAlYxlc3rbV9ugjf0Q5/O
         RvG16DWavUebiIpRVkOKghZHlSA+byXM0vYTL8cMAHZGIxC96jIifWprNk6hsTBrug9L
         lV4y7dMDk12P3i53d2WLM4japM8MN75v30vua9UQlDK/QpcKefuEKfF6tdXZ6SjimvGL
         MPZdAM1ONRDhPSTQdSElfbAW+1v8PW38ZjktlHTovoCVGwvjosAdpuhbNNXfFbMp53b9
         VQT8+0ZP9pp87A56BzZUZ+7boMkFEBHg6t6JiSujaKHM2/DsHnvV76LcdpTv4010VIg7
         nVkQ==
X-Forwarded-Encrypted: i=1; AJvYcCXkStESec6efiRbBqkPmpWi2CtLQgiP6tFEE/PuJlCmg0eWjehtLO9YpVr8IUj7iqL+jsp6k/YuEMuRIBNH@vger.kernel.org
X-Gm-Message-State: AOJu0Yxc2c+9F/30p24yScy6MvuwYWi/LXtCP5JL93lohIoEB1aWuDaS
	WSb9unE5v0aklMCEqqA/FfigWfXqI8n0xXqtgn8JFZTxEgZvWTGBGRgtDLjC2wPBVrPQhQdjUKo
	eooePFbe8HBz7U29LhghbPhj85AULgCQAc932ushzSdy1tXGf93rs9cFtvNUaZvCpw3lz
X-Gm-Gg: ASbGncu3eqOgAKGuGnJL2nweggED0q/0Nhm4c0tKvYl7R1fUZPUdMbCDie47aT2W3TW
	h0lqvahroVkx/OOJRn9f2VixlYex5+f11NaDTVvhAoN1Nv1mcQ+T9rgK5YcbmG6wER+YFlaDUjf
	yDirR/gIgEi37QRAZuQxuVIFrSUpLRY/TTeDzyB0PVw4PtjPllJQOPfJTvQmPpnERvB6EqZWq2y
	np4hfhCpygPy9ylaJetNEBCnMufYSe0T5dvbYDHa1fvICGyOFzNlgoTYUqP3vzg9zgqCNk/1Ap6
	08E8sFT9XBwcYpjmbvWhHJSqFg6YxddQ6fBi5Byz2Pw1WFLDH+8DnrNj2Cv3AbtiAutvWiOxdUa
	TqjIUzm+7DtXJYtZeeuhbTYcyYLYV9Q==
X-Received: by 2002:a17:903:2ca:b0:246:2afa:4cc with SMTP id d9443c01a7336-24944accdccmr125618885ad.42.1756808357936;
        Tue, 02 Sep 2025 03:19:17 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IExZaQpujI+DBeEgb+OY+oIAOGhyp2Ov4L53Do99REhENCXH8YvVx3wL9zFdzC8VQf9tej07A==
X-Received: by 2002:a17:903:2ca:b0:246:2afa:4cc with SMTP id d9443c01a7336-24944accdccmr125618675ad.42.1756808357534;
        Tue, 02 Sep 2025 03:19:17 -0700 (PDT)
Received: from [10.133.33.25] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-249065899f3sm125975505ad.113.2025.09.02.03.19.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 Sep 2025 03:19:17 -0700 (PDT)
Message-ID: <d7141b57-fa3c-49ce-9830-8310a58b9581@oss.qualcomm.com>
Date: Tue, 2 Sep 2025 18:19:11 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 01/38] drm/msm/dp: remove cached drm_edid from panel
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar
 <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20250825-msm-dp-mst-v3-0-01faacfcdedd@oss.qualcomm.com>
 <20250825-msm-dp-mst-v3-1-01faacfcdedd@oss.qualcomm.com>
 <otmy4kttxflsxkvacwdsqynck4nqeww7jsxaq2xwjtlooxnhvx@gmpezdliskck>
 <5b142910-81e7-462d-8933-70705334ef0a@oss.qualcomm.com>
 <yarnaujunszlfrbduakodv7n63wjgh6og3t4qowhu3n6tz6fmn@4kb4crd5rqq7>
Content-Language: en-US
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
In-Reply-To: <yarnaujunszlfrbduakodv7n63wjgh6og3t4qowhu3n6tz6fmn@4kb4crd5rqq7>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: D9dFKS4B0WetadaJWPZSReVva01WpCZQ
X-Proofpoint-ORIG-GUID: D9dFKS4B0WetadaJWPZSReVva01WpCZQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAyNyBTYWx0ZWRfX7GouRMDzbVsO
 aTY5AWDQcAoF4FMvAR/4I1Ssg40bij+u5VJEizJ2KW0txulg+njE4txzrh/PlsUucUWUHcgFSjK
 Z7Z5YXNHMjWsSzT6++tVrmUbHqjaSZLMgArJUV/dKGrZ4o2Z7qUhZw5YgN0/hMms5irmCEJ/ikT
 0T6W/qC0x9wWqZQohDprSMu5qLkJZPYD3adJ1RVnVARtwdcITBBY+0yMHqGuJovXEqWNvb2DenL
 JH4Okrajb8KoidUxel+OExVK1T5F0B5A5Qzq+LOvMK1OpRwBPHzE7kgxd0nzPmu/Hyyb0O/L6fx
 k9to/3Te+el22zoKk4kGHlEXq/expsqk0+AGV8SfYw/yw5+7NkyArdnSU5G6NxWxT+BLz2a8dEh
 xoaTIewp
X-Authority-Analysis: v=2.4 cv=NrDRc9dJ c=1 sm=1 tr=0 ts=68b6c4a7 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=PD6ve5_SbK8zx8cgC-cA:9
 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-02_03,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 malwarescore=0 priorityscore=1501 phishscore=0
 impostorscore=0 spamscore=0 bulkscore=0 adultscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508300027



On 9/2/2025 5:36 PM, Dmitry Baryshkov wrote:
> On Tue, Sep 02, 2025 at 04:42:18PM +0800, Yongxing Mou wrote:
>>
>>
>> On 8/26/2025 12:41 AM, Dmitry Baryshkov wrote:
>>> On Mon, Aug 25, 2025 at 10:15:47PM +0800, Yongxing Mou wrote:
>>>> The cached drm_edid in msm_dp_panel was redundant and led to unnecessary
>>>> state management complexity. This change removes the drm_edid member from
>>>
>>> Please see Documentation/process/submitting-patches.rst on how to write
>>> commit messages. Please use imperative language instead of describing
>>> the changes.
>>>
>>> THe patch LGTM.
>>>
>> Thanks, will update it in next version. Since the HPD refactor series are
>> unlikely to be merged soon. Can I separate out some patches from the MST
>> series that don't have dependencies and send them individually to make it
>> get applied? This would help reduce the number of the MST series.
> 
> Yes, of course. Please keep version number monothonic for those patches
> (e.g. by telling b4 that it should start from v4).
> 
Sure. Thanks,  I want to confirm whether the patches should be sent 
individually or grouped into a series? They seem to be logically 
unrelated. I was originally planning to send each one separately.>>
>>>> the panel structure and refactors related functions to use locally read
>>>> EDID data instead.
>>>>
>>>> - Replaces msm_dp_panel_read_sink_caps() with msm_dp_panel_read_link_caps()
>>>> - Updates msm_dp_panel_handle_sink_request() to accept drm_edid as input
>>>> - Removes msm_dp_panel_get_modes() and drm_edid caching logic
>>>> - Cleans up unused drm_edid_free() calls
>>>>
>>>> This simplifies EDID handling and avoids stale data issues.
>>>>
>>>> Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
>>>> ---
>>>>    drivers/gpu/drm/msm/dp/dp_display.c | 28 +++++++++++++++-------
>>>>    drivers/gpu/drm/msm/dp/dp_panel.c   | 47 ++++---------------------------------
>>>>    drivers/gpu/drm/msm/dp/dp_panel.h   |  9 +++----
>>>>    3 files changed, 26 insertions(+), 58 deletions(-)
>>>>
>>>
>>
>>
> 


