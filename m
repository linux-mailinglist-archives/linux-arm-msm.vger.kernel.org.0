Return-Path: <linux-arm-msm+bounces-58108-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 608B8AB8D4C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 May 2025 19:13:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0D87B1BC32CB
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 May 2025 17:13:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7453D254AFE;
	Thu, 15 May 2025 17:13:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Y5GcOq9j"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58EBD21C16A
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 May 2025 17:13:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747329205; cv=none; b=OszGeMqmfIGlsJ7D9Ij9G1riW6Vnl4/j537W06TLQvK8PvAODDtdiItIZiDgeCpAgFd7+28Ooxfeyia/zyMetsus964rmBx0sLaCIxdKvj7tt4CtecM+5YwpZWaT8jPNQoT/q3PHgntLH8ESNvb1fmCPZgqe6U/YXOBnxBJFDGc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747329205; c=relaxed/simple;
	bh=O63cXBs+Xx3OU/kGfCocj7yS4CxizcWT/oxTtnSxx3A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RdL7c2mI0nYMom+6jcVtWrThlUJdSfdcv/moKiU75JysGxSpW2mQEVPy9ujw11T6TnzE4ImDtoRHfRdw9mKdrRBaqPoBUoGERlgI5nME7JiemJIGzRVz//JRFzo3BLrZ4c0CZKYB8l9gYSZRIDFvebDG3HtSdHFtYVBJPYTIvQQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Y5GcOq9j; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54FEFkdE001154
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 May 2025 17:13:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yYY5LgPRLIrcdKBo4sFGaqpoE0nGNKtVE2RVccwfFlg=; b=Y5GcOq9jFeWOZVDD
	Wp0cXL7yUw4LnTspT78KA03rujBHrF7cXUO/6KD3mzlgkEHiicB0Ytq2lQtoQad8
	4N1SAwIhxX3Aa/Gc1l6xPR1ZVa6Vp8idrnEOYmgSDkv3HAWUZYbnuNF5z4voWMAP
	hd1ei+t35uiJmG9EHY5U8Mqds8UbUKC6b7oGUpGjU8Kld0SbCP/qna4vc4jsApIP
	vc85l6eaNVSYhHGxJcl3qDn5/lkIpNwKx8Op+w696lD4gX5ihJd+t4LKP4CjnwXm
	oK20wWCxR7rVJgqVnKKMzTPBNC5eJ0hv3LGC205kIEfZTh1TjBjuQjiCePRfru+/
	nAn7Lg==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46mbcnxyjs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 May 2025 17:13:21 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-30ac9abbd4bso2325064a91.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 15 May 2025 10:13:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747329200; x=1747934000;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yYY5LgPRLIrcdKBo4sFGaqpoE0nGNKtVE2RVccwfFlg=;
        b=DWGk+6zAayks7kUzlFC27KF9ytiIm3ohvbiq6QgBl0v/X44rFK7vjutylt5HrGM1ho
         7aUjCiit8jQip9wvgujRko5lvs5ewpEpG5599zZDDZSsJpfEWjCN8KFQQdWxIqBBcPaV
         mVUB320Z3QMOr33hVuEwA+FjYtdrr+9RbtKLquCrHsDVoEf17sb3owrQbyTmINMOtXoj
         HsNb+U39Z32jvrbFhoy3wZgpUBIS+kj5BBaZES7nt6CvhSMA2VsDvRbB6VNw0pcZfepb
         KSuQw9RuEBu1ub7LhiSDaStIZr4JaMA/HwaBdhAUVeoo6kLGK7XXs6LrQrJfKXB5xPpY
         8zRA==
X-Forwarded-Encrypted: i=1; AJvYcCUzmKn6EoSQdkhSUI1VlQqlj+9+/bTU/gFpLnCIYUTymOyMpXHgxRWuH94anjlRO1gduli97wc9ENDEV4ax@vger.kernel.org
X-Gm-Message-State: AOJu0YwJA+WiMUJ+kLbVnpfdhkS3lC7u+DJ5CCGav92gmUykt+NY3Mma
	NlL5kqwXLuanrjZWF0zQoSWNVHU5ItjqDiSWNmQ6/AfSEhUj4p20u87uPQ5pIUD9rtoRv11bZ8U
	W+MEpTDvBhBQb1wifVOYMqojtwxQiAmvMuoftsgr1h6Awqp4gXzt2rGwzwrMjxnzU1srj
X-Gm-Gg: ASbGncuH1m3okX7xbjn+/GtQ3NelXRws+hwyqjp2uFyoEda9QgtSpNo4NZcfwbsVzM/
	Dm1M0/mnR+0qoynJr9oXTD7cvZRVqY2goCXSNvCWRsmZp0C0oEYh01oubP9G8ZX44+NxR4U8wdB
	EKRjUtaXqbcmaUwwJwyMQ55UgRBO+IhKp6ix4PMm+NY/5CWkbbAICOJhWEd6LcInldNJTmNUvVP
	yTc1fgNymqjlQ74hJ8WxaQWoDnW7EYlb2FTZxCW54aGiAJt2kPmsa/eoYSSIIEtP2ax62d8U949
	3+RmgRfEp+Gsc6VFUJikq7qfUGWQzgum366qfDsB5V4JL3BLI1O7DJC43w7WhG8t/J3aoA==
X-Received: by 2002:a17:90b:33c2:b0:2ff:6608:78cd with SMTP id 98e67ed59e1d1-30e7d544fd4mr288090a91.9.1747329199744;
        Thu, 15 May 2025 10:13:19 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFNDu7NvHwl9BxUYwJis4ASPQgBchI/AV8+LYPCkrCV2kofbKQRnSnmom5F9mPfzufGWwElaA==
X-Received: by 2002:a17:90b:33c2:b0:2ff:6608:78cd with SMTP id 98e67ed59e1d1-30e7d544fd4mr288065a91.9.1747329199310;
        Thu, 15 May 2025 10:13:19 -0700 (PDT)
Received: from [10.134.71.99] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30e7d5918aesm64070a91.49.2025.05.15.10.13.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 May 2025 10:13:19 -0700 (PDT)
Message-ID: <abc767ff-acb9-47c3-8b6e-6c6150f7b19e@oss.qualcomm.com>
Date: Thu, 15 May 2025 10:13:17 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/5] drm/msm/dpu: Add max pingpong and dsc width to HW
 catalog
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Abhinav Kumar <abhinav.kumar@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20250514-max-mixer-width-v1-0-c8ba0d9bb858@oss.qualcomm.com>
 <20250514-max-mixer-width-v1-2-c8ba0d9bb858@oss.qualcomm.com>
 <txn2anohfbrymaseeo55slmzimstietsrmhx3mhigw4fcx3ow4@b42b3n53et6l>
Content-Language: en-US
From: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
In-Reply-To: <txn2anohfbrymaseeo55slmzimstietsrmhx3mhigw4fcx3ow4@b42b3n53et6l>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: rDj8LW4bMW8ccYhMI740MIaQxP5WsnEf
X-Proofpoint-ORIG-GUID: rDj8LW4bMW8ccYhMI740MIaQxP5WsnEf
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE1MDE3MCBTYWx0ZWRfX2cGluoo260FO
 o9SpZ6PPYe7i5TBdzITXlG4HMQNGF2pB11CduLBt4nDx1ZbwR9iK5DDDjxPDHyEXNcmOoQp1wXu
 blbBJpAyqRGT3RW6qbJVmH1Zlo4E2CcxCyR3Vc8rvvXKRktWjarGVcocUYAlWdoelachjNUstg1
 yzJw8lhMS6owpRpqC5lAmci8jjggt/Z3Qxzh0I7490azrXI9H0+PqH4lXfEspxNc/I2Fil8B8ch
 7AGw0MuQQDqLxh5S04IjDBV93jM+1ODSE1uXxA4712meX9Osnz0lNH2ixU/XHso13jM0LkzoSir
 86RuLudi6CqlQE5OmJCNegVapL0WQBzFhZnDt9sNgzwQ7ZiHsgZiShfb3Z8tTlKQXLSIfRJZgwh
 vlV/YyaYqEO19+OLGjrNol1jXElWWW9vhm586w4mVwTPK7i/3z1lRoqj8up1kzUFpzQcMk5A
X-Authority-Analysis: v=2.4 cv=Gp9C+l1C c=1 sm=1 tr=0 ts=682620b1 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=_YleJFLcT2wxSgV-J2oA:9
 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-15_07,2025-05-15_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 spamscore=0 lowpriorityscore=0 impostorscore=0
 bulkscore=0 adultscore=0 suspectscore=0 priorityscore=1501 mlxscore=0
 malwarescore=0 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505070000
 definitions=main-2505150170



On 5/14/2025 5:21 PM, Dmitry Baryshkov wrote:
> On Wed, May 14, 2025 at 04:52:30PM -0700, Jessica Zhang wrote:
>> Add max_dsc_encoder_width to dpu_caps struct and max_linewidth to
>> dpu_pingpong_cfg for all chipsets within the HW catalog.
>>
>> Note: The max supported PINGPONG width was 4096 but increased to 5120
>> after DPU 6.x. In addition, DPU 8.x+ increases the max supported width
>> of PINGPONG_0 specifically to 8960.
>>
>> Signed-off-by: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
>> ---
>>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_10_0_sm8650.h  | 11 +++++++++++
>>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_14_msm8937.h |  2 ++
>>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_15_msm8917.h |  1 +
>>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_16_msm8953.h |  2 ++
>>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_7_msm8996.h  |  4 ++++
>>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h  |  4 ++++
>>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_2_sdm660.h   |  4 ++++
>>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_3_sdm630.h   |  2 ++
>>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h   |  4 ++++
>>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h   |  6 ++++++
>>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h  |  6 ++++++
>>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_2_sm7150.h   |  4 ++++
>>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_3_sm6150.h   |  3 +++
>>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_4_sm6125.h   |  2 ++
>>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h   |  6 ++++++
>>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h   |  2 ++
>>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_3_sm6115.h   |  1 +
>>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_4_sm6350.h   |  2 ++
>>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h  |  1 +
>>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_9_sm6375.h   |  1 +
>>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h   |  7 +++++++
>>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h   |  5 +++++
>>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h |  7 +++++++
>>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h   |  9 +++++++++
>>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_4_sa8775p.h  |  9 +++++++++
>>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h   |  9 +++++++++
>>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_2_x1e80100.h |  9 +++++++++
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h           | 10 ++++++++++
> 
> This needs to be rebased on top of linux-next, otherwise you've missed
> dpu_9_1_sar2130p.h .

Ah yes, forgot to update my local working branch.

Thanks,

Jessica Zhang

> 


