Return-Path: <linux-arm-msm+bounces-36142-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A683F9B2D0B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 28 Oct 2024 11:39:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 320BE1F2277B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 28 Oct 2024 10:39:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 316901D5AC2;
	Mon, 28 Oct 2024 10:39:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kUlXvH7R"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5D441D47BC
	for <linux-arm-msm@vger.kernel.org>; Mon, 28 Oct 2024 10:39:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730111965; cv=none; b=kHy6ImsUghe7426LL8dlSjQJLvRngTwlgMasNO33hmpy0w7IwH5bFH8MxkYpZmKf6uTw6MiKNDPHohzTwwRsOGZMVyUPCGCfGlXpwtrOo67Z9rbk2PyLhAGq8fgep7UmkWx0P1kWjjDVAVTR9GJe8c9QGBgDsDNKsx0AYdxS/n4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730111965; c=relaxed/simple;
	bh=nSz0guemikdekqt0RMoFTmvkQyVY2aQZtZMMxnEVi2o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=a1/MZIGKJeIvumEmtzK9M4BngEm0cFBbg4yf1HxqBUWEXZKUsgzRdh0LE8YjXcI1q0HCsszLx7aprq7c/x9ODGPPrfbOLhiiPemyato3E9rS6VHkeyZWASwC43ZPUCJTfrMBXvYaFNh2913SzezFQY/lJumMw9dKt7GDnnQ6uu0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=fail smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kUlXvH7R; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49S9hwe4007059
	for <linux-arm-msm@vger.kernel.org>; Mon, 28 Oct 2024 10:39:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IvU7ZlrjHkB3EzPLVjXtJ5AQLhmlFJL/Cm51xZ+jJsU=; b=kUlXvH7ROgF8wWpO
	BLdgBIYYnFUd5HTp+kThsGnuyDXxXxavDPKSyGEh9/btwaKgZEOyw3GTHsGsMIrE
	qzumdr8gDR5BdMZqg39AiF4gaz7mkJmJ7xvck4zxltVHmIaktSSmgvRoQs10YqsR
	ikOt5aOBMYoc+hIqATR9RJZMNcd5IG/5KuNmUqYbw6Mp4jgn/hUlRsz3caQ2WjHT
	D7sRKonzvDJaTCKjRVtoFrCqB6Oh+ixRlZH1oi2nO3v0NmNuPEkAjFEKq5SK7GVa
	vnHGRHvxUqVTEsdJzZ3f2gsBFW4kLnVKjba+/uDzpqd2cMneRkY5Js2wUiA6sQVZ
	EdefOg==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42gr0x4gjp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 28 Oct 2024 10:39:20 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-6cbccc4fa08so10609056d6.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 28 Oct 2024 03:39:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730111959; x=1730716759;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IvU7ZlrjHkB3EzPLVjXtJ5AQLhmlFJL/Cm51xZ+jJsU=;
        b=GvMnulvX6YYWU7goSlJtoKW/nKDnKp5XLkOtakNv4OJkZIbYYAOb8X32e41j0mr/8k
         5N7vN+DQQ2TQ3pl2Wf/nQKXjebPtldDfyb/onhhkv9C+FR2iCh2zKb5SSxXzYxoUHswl
         DmOWgHVPNZmkHiGyZ+UNh7N0x7DffIOnDOBjfVa30jvEA/lNn1LIJsLmh5I+Dwqp0Qv/
         N2AKIrAm9tgclpP9Iv5IhUwjR0z5Oislo/sBpQypan9lMAn0yinaSMelEcwQZHnG5jSG
         4bQUCGi2Ry1fpjAYzpCEfg9kx2eBZ5HLzI9SMda/aWx0XqAHF5Csm7wKqykba1CfFBnb
         uGNQ==
X-Gm-Message-State: AOJu0YzQeOCioHbYgnNXzmFs/ivGYbrCqo+RI1IRkIv+NRsbYWI2bYez
	FCz3JFoBuBkAI0YufrlNfjw8NOcu6/IomY/ueCNndcA+8QuEFrKWLHrze1u/LRN7aZbuk1k69ZX
	Dx7pGJtH1yqPrREr2wDZwYDXNVVud46EuvdQ28EK731EgXSuft4hEdebBYqqeFMO3
X-Received: by 2002:ad4:5c6f:0:b0:6cb:f0f2:f56c with SMTP id 6a1803df08f44-6d1856943c8mr65408916d6.6.1730111959502;
        Mon, 28 Oct 2024 03:39:19 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGuXnJ9QctQQKnrr1B9d6Pnh3CdOC3tp1NlBtHDTDJwYz+DKoHJwok6hm3fQ7kNKdJ+ruWTuQ==
X-Received: by 2002:ad4:5c6f:0:b0:6cb:f0f2:f56c with SMTP id 6a1803df08f44-6d1856943c8mr65408636d6.6.1730111959225;
        Mon, 28 Oct 2024 03:39:19 -0700 (PDT)
Received: from [192.168.212.120] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9b3099ddb9sm369502766b.173.2024.10.28.03.39.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Oct 2024 03:39:18 -0700 (PDT)
Message-ID: <55ca17a3-8ea6-450e-8ec6-9bda97808164@oss.qualcomm.com>
Date: Mon, 28 Oct 2024 11:39:16 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/msm/a6xx: Fix excessive stack usage
To: Akhil P Oommen <quic_akhilpo@quicinc.com>,
        Arnd Bergmann
 <arnd@kernel.org>, Rob Clark <robdclark@gmail.com>,
        Sean Paul <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Dave Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Bill Wendling
 <morbo@google.com>,
        Justin Stitt <justinstitt@google.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        llvm@lists.linux.dev
References: <20241027-stack-size-fix-v1-1-764e2e3566cb@quicinc.com>
 <3fb376b3-2db7-4730-a2e1-958f1ddd9f5c@app.fastmail.com>
 <6b7c2ae7-3210-4d57-a7b0-2efea594b2b9@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <6b7c2ae7-3210-4d57-a7b0-2efea594b2b9@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: D5rIRAgcOG5Q5GcY3IUM3sq3iJ4KYkdG
X-Proofpoint-GUID: D5rIRAgcOG5Q5GcY3IUM3sq3iJ4KYkdG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 suspectscore=0
 clxscore=1015 bulkscore=0 adultscore=0 impostorscore=0 mlxscore=0
 malwarescore=0 mlxlogscore=999 priorityscore=1501 spamscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410280086

On 28.10.2024 10:52 AM, Akhil P Oommen wrote:
> On 10/28/2024 12:13 AM, Arnd Bergmann wrote:
>> On Sun, Oct 27, 2024, at 18:05, Akhil P Oommen wrote:
>>> Clang-19 and above sometimes end up with multiple copies of the large
>>> a6xx_hfi_msg_bw_table structure on the stack. The problem is that
>>> a6xx_hfi_send_bw_table() calls a number of device specific functions to
>>> fill the structure, but these create another copy of the structure on
>>> the stack which gets copied to the first.
>>>
>>> If the functions get inlined, that busts the warning limit:
>>>
>>> drivers/gpu/drm/msm/adreno/a6xx_hfi.c:631:12: error: stack frame size 
>>> (1032) exceeds limit (1024) in 'a6xx_hfi_send_bw_table' 
>>> [-Werror,-Wframe-larger-than]
>>>
>>> Fix this by kmalloc-ating struct a6xx_hfi_msg_bw_table instead of using
>>> the stack. Also, use this opportunity to skip re-initializing this table
>>> to optimize gpu wake up latency.
>>>
>>> Cc: Arnd Bergmann <arnd@kernel.org>
>>
>> Please change this to "Reported-by:"
> 
> Sure.
> 
>>
>> The patch looks correct to me, just one idea for improvement.
>>
>>> b/drivers/gpu/drm/msm/adreno/a6xx_gmu.h
>>> index 94b6c5cab6f4..b4a79f88ccf4 100644
>>> --- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.h
>>> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.h
>>> @@ -99,6 +99,7 @@ struct a6xx_gmu {
>>>  	struct completion pd_gate;
>>>
>>>  	struct qmp *qmp;
>>> +	struct a6xx_hfi_msg_bw_table *bw_table;
>>>  };
>>
>> I think the bw_table is better just embedded
>> in here rather than referenced as a pointer:
>>
> There are some low tier chipsets with relatively lower RAM size that
> doesn't require this table. So, dynamically allocating this here helps
> to save 640 bytes (minus the overhead of tracking).

I'd second this, said chipsets often ship with 1-2 GiB of RAM (which
is still a lot in comparison, but you know.. every little bit counts)

Konrad

