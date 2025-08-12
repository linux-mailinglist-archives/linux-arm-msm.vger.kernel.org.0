Return-Path: <linux-arm-msm+bounces-68655-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D787DB21EBA
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Aug 2025 09:04:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 73A656867D4
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Aug 2025 07:04:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A7116270EC3;
	Tue, 12 Aug 2025 07:04:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cOKTe4tL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 287D72D6E42
	for <linux-arm-msm@vger.kernel.org>; Tue, 12 Aug 2025 07:04:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754982250; cv=none; b=F0ny7a+Oj/Rfe8oln4I61g6XPhiREPivgZCUDf3qPhyQbzwtqIJhQwFT8przDtbq7+cogWQZfZDnrfr+x456lcpYTwiJZCIMKvRXwwPl/G/YlSL0R47gtaJeA29/vmckYAKQl8cdcFQiljCaNDy68ExRdTWQvKN8C2UlmCcWFD8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754982250; c=relaxed/simple;
	bh=SeQ62bmZfam91Oav+2opoIAo/S3/fQamah6X6vhlZQY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eInvSsktJDZKpZAiJUQYHdZznZH1x+OqA1G8QAhfIYuDITH8pOjR6esahn7BxVcbjUhV209rKv37zms2PqLwCcp70wdGoD164UzHegoqdwzvRdn8FcKT+KCP8iTpO6vE35+eXYZk9QNjeavKxon7I81pC/ojG8a8E8xgc04SXR0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cOKTe4tL; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57C6oWav005641
	for <linux-arm-msm@vger.kernel.org>; Tue, 12 Aug 2025 07:04:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mV/eefy0c2LWvZ2MBX9aTUa7zNPhALNcsIQu9WG7amw=; b=cOKTe4tLh4hgEZgN
	NiFndJLjrITvDbwaOLCSJ5JW9Q+Dp0pQI29IEcPli0z1XNcoaJb9Zbchk28bgzOV
	9v+Q1fbm6BOrIkk1TCnOT/wovin01acpLFM5ldjkgnnmdVD3jXibZW6eLU0jVyQy
	UPPIu8zyvxPh9Su6u+hPa3mXRpiTZNwxZgIQH7mmBAyJQzXAk6mVfI+qaDPe1gIF
	BzvYSH8ykAXqJwES7eEafRrS7WMGyc35JGgwUim+7gV+Ud+fiptt0mJgOERvcYtD
	T48n1tYzFJtxfcv4EGpKiihMO6ORxNvlrTQFBwP+tVhGt8GzLUoL4MZJWKQhils3
	cZdCig==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48ffq6k0dg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 12 Aug 2025 07:04:08 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-b2fcbd76b61so8184671a12.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 12 Aug 2025 00:04:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754982247; x=1755587047;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mV/eefy0c2LWvZ2MBX9aTUa7zNPhALNcsIQu9WG7amw=;
        b=rXET9I2lrNXVsKvqrJyBsfRS3ck0mAN2f6BobuDhpUZB7u59PL0uf4xhMxuMKz4kXV
         myP47u5y3iY0j6Ax/NSgQe2Ga6rCnYk3Uqw/JHrwQUUO3WWcCwd11q2Se+gFpuNVBQqK
         1bZFHy0/dFZh0sGO58vcmHo83WTpB+rif1JJm8ygmkf0H3I8wcMBA0sK5dAFOPJh46s3
         JQec64Nsfh+peq34SLGz5F89sr2snqbqB3PqWq2heyBX1DSgbs2tonn+5L/RriP3LTGM
         HQYeHNCnXAzykfrpgRiMNN7n70PSLUXoylAkTu1ASKxySQ+J9zfx0i/w47V2K2l0p4bA
         Ffpg==
X-Forwarded-Encrypted: i=1; AJvYcCWwltwaTB+3K/FkniKM0qRQAyxH1UfBG8TDEk4XkiQhn7B//N1bWaTZ25o5kmtrcb4hqmwB9u/m9/aCPBRx@vger.kernel.org
X-Gm-Message-State: AOJu0Yxk171qDWrIWY78xuttoaKBJe0D13oQ5Dv/1At8Lca5uRo3Xjf5
	0PF8YHBr66lkR4r5OCYsSuhhnfc4OFzlG+AYub1zkHPi1LZ2wGUMsU41OEf3FgMD3sqbbbS9ufd
	gwL3bSyuosAmV0/pgY7WbecjvL30xX35NGHli/sdUOGP52X6loW/7ORzIf6Hc28JcFZY6
X-Gm-Gg: ASbGncuLzRpX+fRQ0T48+HXxoqphuk/PGsz6RZvNKL9acIlGq5XaYdNndfuUjwsaXrf
	qRpmbTZlOhcWWf3Os0p+9gbqsgmxCj2bEVlWflAJ87LAA/dd9Uw/9cRwJQxFDuYzVmdUGi2cKUo
	pZuRMyz2EQwu289ZmJ/pE2BHKZEGTcDO2okggZsJYHDZfj4ph5dyYJUZWI1SjZHZysJWulGGrSH
	04JkCxksWFNUKtT2ZzY8mxjHB1u0UitzIDnnEOQGQUEW7rXkOkQpmxnnZsr0g2uhIRHLsrKHM2x
	Gm94BM26jYn7Rn4FHwmsZHYN6687++qHe1WHGVJlYJoMudrfE1EXUNTUH2ijkNl8muCl
X-Received: by 2002:a17:902:ecc1:b0:23e:22dc:665c with SMTP id d9443c01a7336-242c21ff9ffmr231135535ad.33.1754982247340;
        Tue, 12 Aug 2025 00:04:07 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGO/1UIN7L4sGlkN3jDrUIwqP0FYBWbFECG0kM5UiwqQaO9PrVZPlbyIJ4bCydXasYvkxNGSQ==
X-Received: by 2002:a17:902:ecc1:b0:23e:22dc:665c with SMTP id d9443c01a7336-242c21ff9ffmr231135295ad.33.1754982246875;
        Tue, 12 Aug 2025 00:04:06 -0700 (PDT)
Received: from [10.217.217.159] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-242b0934d33sm127719215ad.46.2025.08.12.00.04.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 Aug 2025 00:04:06 -0700 (PDT)
Message-ID: <adcdeaf8-a3ba-46c2-af7d-e37bbc5341dd@oss.qualcomm.com>
Date: Tue, 12 Aug 2025 12:34:02 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] clk: qcom: gcc-qcs615: Fix gcc_sdcc2_apps_clk_src
To: Bjorn Andersson <andersson@kernel.org>
Cc: Richa Bharti <Richa.Bharti@siemens.com>, mturquette@baylibre.com,
        sboyd@kernel.org, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        srikanth.krishnakar@siemens.com, cedric.hombourger@siemens.com
References: <20250729094943.863392-1-Richa.Bharti@siemens.com>
 <81a1bd2c-ad4b-4042-9116-c1604e4f0d98@oss.qualcomm.com>
 <e54l6omqbop5tlithm7cseldtbcz47sde6fo6wcoxvbordoa6w@l63sxertlypq>
Content-Language: en-US
From: Taniya Das <taniya.das@oss.qualcomm.com>
In-Reply-To: <e54l6omqbop5tlithm7cseldtbcz47sde6fo6wcoxvbordoa6w@l63sxertlypq>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODExMDA3NSBTYWx0ZWRfX/ezY6czu1d24
 WnyYSkCRgudMuwpGSvUDKNfOZD543G15viSqvToZxQBtuhIZs9vp/NkN1nh/Zc1bpHQWqIkFIHE
 jiRU31RoFiWfkm4bnUicce/Amvh4QOmqNKFJnEsRvqqgOc6dlSQzTsvjwWpwwvfbsXdDPpzTcEQ
 jYhCe2bGOheOg4q6/nE7QH273Q3XG0Y4nyA8tbdoZDxr+rI439FmT+NuwzTibZugexMQxiTO4za
 GxbCRnxkB8xSiEriNyDEQpI13Os1GdOOApCFaPgI7xrv/BzgbbNF8IQ3OdlA3WKTCRjD3SibIfo
 dc7D5rQ8UU796VVDaBHgrsHpcmTuPpU20WSvAZc3kHWtA1u2o+h4sLttMxlwZl9ATz+Ye4lOCbw
 +hJCz7wu
X-Authority-Analysis: v=2.4 cv=TLZFS0la c=1 sm=1 tr=0 ts=689ae768 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=a_U1oVfrAAAA:8 a=bt-eykdaRR2Tth2JHncA:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-GUID: piDDMWj5Tc72xt_q93IpwJEQC4vETLnh
X-Proofpoint-ORIG-GUID: piDDMWj5Tc72xt_q93IpwJEQC4vETLnh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-12_02,2025-08-11_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 malwarescore=0 spamscore=0 priorityscore=1501
 bulkscore=0 adultscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508110075



On 8/12/2025 9:20 AM, Bjorn Andersson wrote:
> On Tue, Jul 29, 2025 at 04:08:21PM +0530, Taniya Das wrote:
>>
>>
>> On 7/29/2025 3:19 PM, Richa Bharti wrote:
>>> On QCS615, we see the same issue as reported on SM8250 and SM6350:
>>> "gcc_sdcc2_apps_clk_src: rcg didn't update its configuration" during boot.
>>> This is due to GPLL7 not being enabled by default as a parent clock.
>>>
>>> Setting `.flags = CLK_OPS_PARENT_ENABLE` ensures that the parent (GPLL7)
>>> gets prepared and enabled when switching to it, fixing the warning.
>>>
>>> Fixes: 39d6dcf67fe9 ("clk: qcom: gcc: Add support for QCS615 GCC clocks")
>>> Signed-off-by: Richa Bharti <Richa.Bharti@siemens.com>
> 
> Thank you Richa for your patch!
> 
>>> ---
>>> This change is similar to upstream commits:
>>> - SM8250: 783cb693828c ("clk: qcom: gcc-sm8250: Fix
>>>   gcc_sdcc2_apps_clk_src")
>>> - SM6350: df04d166d1f3 ("clk: qcom: gcc-sm6350: Fix
>>>   gcc_sdcc2_apps_clk_src")
>>> ---
>>>  drivers/clk/qcom/gcc-qcs615.c | 1 +
>>>  1 file changed, 1 insertion(+)
>>>
>>> diff --git a/drivers/clk/qcom/gcc-qcs615.c b/drivers/clk/qcom/gcc-qcs615.c
>>> index 9695446bc2a3..b281f0dfe165 100644
>>> --- a/drivers/clk/qcom/gcc-qcs615.c
>>> +++ b/drivers/clk/qcom/gcc-qcs615.c
>>> @@ -830,6 +830,7 @@ static struct clk_rcg2 gcc_sdcc2_apps_clk_src = {
>>>  		.name = "gcc_sdcc2_apps_clk_src",
>>>  		.parent_data = gcc_parent_data_8,
>>>  		.num_parents = ARRAY_SIZE(gcc_parent_data_8),
>>> +		.flags = CLK_OPS_PARENT_ENABLE,
>>
>> This is not the correct way to fix it just because SM8250 and SM6350
>> uses this ops.
>>
>> We are testing the right fix internally and will be posting.
>>
> 
> Please use such opportunities to educate us, rather than just tell us to
> blindly wait for something (at least share your thoughts/hypothesis).
> 

Sure, Bjorn.

https://patchwork.kernel.org/project/linux-clk/patch/20250804-sdcc_rcg2_shared_ops-v1-1-41f989e8cbb1@oss.qualcomm.com/

The RCG configuration goes to a bad state because the current floor_ops
tries to update the rcg configuration even if the clock is not enabled.

The correct fix is to ensure we do that when the clock is actually
enabled which is brought it by the shared_floor_ops.

Please let me know if you still have any queries.

> Regards,
> Bjorn
> 
>>>  		.ops = &clk_rcg2_floor_ops,
>>>  	},
>>>  };
>>
>> -- 
>> Thanks,
>> Taniya Das
>>

-- 
Thanks,
Taniya Das


