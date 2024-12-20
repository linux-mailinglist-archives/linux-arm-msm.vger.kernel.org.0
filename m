Return-Path: <linux-arm-msm+bounces-43018-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 926E39F9AD5
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Dec 2024 20:59:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C8BB97A40EF
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Dec 2024 19:58:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1AA00227567;
	Fri, 20 Dec 2024 19:56:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ztzmoup6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D56A227B90
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Dec 2024 19:56:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734724599; cv=none; b=Kfhu3IzxBnrV0lPgFImsyisUs96MFU0i1zH98M2MCAKSLtFSykl+tkPbWIf10VE0lW4pRWVg/oEMP9owuwP7Hw6ML612nXI/EARFifK924w+/CvqsbxsDZmVfyzv8o4JiTOrBC1bZ4ivl7wTHHH0/u4KMqq39yzGPWEBt+3G9pY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734724599; c=relaxed/simple;
	bh=xIFZ+Qn3bT9RlpOfJFPG92bjFLVmgTecZy2LyxCmRVs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NkYWv15DesCwjkzRI4BFe/5JuDXGFsOiWHTJ2rcYtwD5uCQ5/p1WHXpDlFoREzVekPNcQGGV+mvWEQY2gmzp1Llsl16nQeYtu0yNno+tSQ8QChwF3EJbqnUhxd+XcuuKnF69q6uRFI+R761RXd4SVyRN0aTSgDjkRlRLmhH9s9o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ztzmoup6; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BKDHV0L017484
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Dec 2024 19:56:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CNXi4HVvLwEnmfialNLMEUNaS0/KanL2j5mXVBCUz9w=; b=Ztzmoup6WnqTqnor
	ZvTDquigCZfl6PsIl8o3iovgSU5l7uML8oTAwRdOyJIb19Qlfri4RWhBWWYp5NXC
	ueOW43cV6jMTdDL22Ui3vDelmCgnIV/tezNcrFrNOwscRKkTO1+E6lXeiKX8DiKn
	qmIvE9aVpMjWWdhIT3buxPVTpfm1mTQo5W2uwGWhggCwU/OXEPT0SymWT23ESUYo
	BzeHj6p5vwbPYI5gTWgyV/F46xJSvKcQdB4rCvNOJzDqsutJxXuozK8lLRA8rLKr
	0RlzEJ666DNkpFKSBxdtCjNOLZfPvsiaDQGK1s3GQwZQreORLPhUkXDMKoP2YAf8
	5/lbkA==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43n9b9h239-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Dec 2024 19:56:36 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-6dd0d0e0604so4514956d6.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 20 Dec 2024 11:56:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734724595; x=1735329395;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CNXi4HVvLwEnmfialNLMEUNaS0/KanL2j5mXVBCUz9w=;
        b=rmemXt1Poew2AZ96UnQcd1uHzIH6vwqGdElnjCxCgxWXom2TEJavzwJkeVH5JopN9W
         p5qx6chEhFQb5GYEeJPly3D1xH2gc+jvlWMJCbMJieZhM9FWP97fUNJsdczUykg2BtjO
         6uSQkS1uOHU0BT5BWZYAyOQYDwlULaxOAA1PSdcvFJZ94M1T5MkakBZ0Lue8IwbtwcNc
         6yF5+tEAr84zHT34zB9nFFj3XnNoRmxnpqTzaIJsCr7oZzYUry7N4kI+Kpu7nuXpEvCj
         50JYW2/9zCYAiS6n90bPp5dL/lXSKfwGRIib4kND82wl435m3bCF8L/j1I3IRBjUPWKp
         rYFw==
X-Gm-Message-State: AOJu0YxjezAZVxHaJVi0ufrlvcBiE6y8cokKbbGvTHHwSIl23qLSQKRt
	R2p3SFNa1BG6f/DD5IRXIhCKmz7gsXJkELlB50OfwzHrl08MMgv7fFqMrEg5LUh7TD7dbBEcWHk
	RLN3P7q6bdE3nxjf/xGh4zpoWIBgEisi6urvofwnY2nvTkYp2moZmikW++Qx9kF7wYJjwmhJ7
X-Gm-Gg: ASbGncvcfYPyBuB/0b6y87jODGD9lRUBwn/SmUpSzVm3F9ECw8nDfGRDZ/02Uh4ymdk
	HMFErmIbelB8GITKnawCGGCtPOw682hoTdPs4NwUj8GXR/UYortQg9tdACvrS4qPRf2v0caqGEA
	1yoXqeoAhmiuDSHrTelSYe+cElSyffoxXz6vwZJudDkiJm4JPFXCpEEOExTqTdoIxMrkG8+Ckq0
	Tu1h5AY4wARruLwrtqackyaORvfPpSOYbkDtegunyuJ9ALaJYL9W/kc9hiwjdtKgeQ72b/NLdht
	jFSBERuhuO7VzAQ5I+rfIsoqqxxUmlCJqAk=
X-Received: by 2002:ad4:5de1:0:b0:6d8:e634:203a with SMTP id 6a1803df08f44-6dd23327990mr24024356d6.4.1734724594916;
        Fri, 20 Dec 2024 11:56:34 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH6O7L0eT7hcle0d+mEEQSfXKZLRu3gm/NoMZrAmdKcF5OuBOOm4hLGodWNUXrXW8QaaUU7+g==
X-Received: by 2002:ad4:5de1:0:b0:6d8:e634:203a with SMTP id 6a1803df08f44-6dd23327990mr24024226d6.4.1734724594596;
        Fri, 20 Dec 2024 11:56:34 -0800 (PST)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aac0efe4653sm210771066b.122.2024.12.20.11.56.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Dec 2024 11:56:34 -0800 (PST)
Message-ID: <df25ffe5-b20c-41a7-b178-b191d332cb19@oss.qualcomm.com>
Date: Fri, 20 Dec 2024 20:56:31 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] drm/msm/a6xx: Add support for Adreno 612
To: Akhil P Oommen <quic_akhilpo@quicinc.com>,
        Rob Clark
 <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Jie Zhang <quic_jiezh@quicinc.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20241213-a612-gpu-support-v3-1-0e9b25570a69@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20241213-a612-gpu-support-v3-1-0e9b25570a69@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 7Il0gUOObNVlYmwJujzlkJ4nZUt3QHiw
X-Proofpoint-GUID: 7Il0gUOObNVlYmwJujzlkJ4nZUt3QHiw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 malwarescore=0 impostorscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 bulkscore=0 adultscore=0 mlxlogscore=999 phishscore=0
 suspectscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412200160

On 13.12.2024 12:46 PM, Akhil P Oommen wrote:
> From: Jie Zhang <quic_jiezh@quicinc.com>
> 
> Add support for Adreno 612 GPU found in SM6150/QCS615 chipsets.
> A612 falls under ADRENO_6XX_GEN1 family and is a cut down version
> of A615 GPU.
> 
> A612 has a new IP called Reduced Graphics Management Unit or RGMU
> which is a small state machine which helps to toggle GX GDSC
> (connected to CX rail) to implement IFPC feature. It doesn't support
> any other features of a full fledged GMU like clock control, resource
> voting to rpmh etc. So we need linux clock driver support like other
> gmu-wrapper implementations to control gpu core clock and gpu GX gdsc.
> Since there is no benefit with enabling RGMU at the moment, RGMU is
> entirely skipped in this patch.
> 
> Signed-off-by: Jie Zhang <quic_jiezh@quicinc.com>
> Signed-off-by: Akhil P Oommen <quic_akhilpo@quicinc.com>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---

So we talked offline a bit, and the RGMU requires a piece of firmware.

We concluded it's best to describe that from the get-go, so that the
user doesn't get surprised when a new kernel update brings new firmware
requirements for previously-working hardware.

Please wait for the new revision.

Konrad

