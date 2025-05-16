Return-Path: <linux-arm-msm+bounces-58229-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 896FBAB9F91
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 May 2025 17:14:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 092A1188D547
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 May 2025 15:09:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3FA7834CF9;
	Fri, 16 May 2025 15:09:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="drFLlU4b"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83F6A2A1AA
	for <linux-arm-msm@vger.kernel.org>; Fri, 16 May 2025 15:09:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747408176; cv=none; b=ScebWX6pQdjTY/W4xVu9L3i6GP2voY+LqE+LBlrQez0QZ/XCHxzGlubctN61uEiLbF6Xz9WRmFnwlGd7ePThbfttQ0+4GBNs+KIfYGct9kaon0k4UUrqzNVjxqSrXhORyiMNMf9NAYwFfKsLqnVfmg6mV4RQPExyrMC6PaUofuk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747408176; c=relaxed/simple;
	bh=ZIae00AOinG578eQu2PG2k2E28ThHD6l0U3I7Vc+TJw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BDVKXcSTfoC8/1EzX/z+jD0incZU8Ub/u7HTaHgDSWsfsVK8LoSNpuYcmOpWky5JMxceNbS7DSbHcQ6MWr57Z3IMqodRGh9QIN3FiBEk+4oRLmkNto1W6kpR9tPMyQc8uJS5GnhE7jITmuFXDb7+6Szsq2RgWr9RbjewVVYl5u0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=drFLlU4b; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54G6N9e3028294
	for <linux-arm-msm@vger.kernel.org>; Fri, 16 May 2025 15:09:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	raENH4kTS198feoVrJY7Mwi+J3+xevS+DdoAQLqz9+Q=; b=drFLlU4br9XNhXXk
	xdXr33jsEWM5ALkK900xJgbR9Dt4ufXBoLgBWykryPc9+ZPTAQEZfE38HKxXJaG+
	cq0sNMzHPN37Eq5Ft2MwBO22qAoTdXfFfZT1vUjh8uxdk7srrvPGhUftE48RNdrI
	yzG0wP9mOAl3fPdFYQ1zudeWnClPwt3rfuz8ZEoC5EX6nmiDseYArhFCO28kDtnO
	fEbYkOQBval2S2qejpiWo8qGw1YYXZTRytJo4z/cIp8g0VV6QXaSXUoK/R0GGXfZ
	BQJPiawMF3lRf0G1yiPV/hWzaXiufHI+aj4reqUHKyqeXSSaZ5P6JyZTJ1vCjTdu
	8BPtOw==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46p01n1chr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 16 May 2025 15:09:33 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-231e412d4c9so4823765ad.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 16 May 2025 08:09:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747408172; x=1748012972;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=raENH4kTS198feoVrJY7Mwi+J3+xevS+DdoAQLqz9+Q=;
        b=Y9vOiPbhtJf3DFBXutpEhNa1QcGvNsZ7ZsNdo6jmoAF2FcFtrXupz2aD+jr/9nhL36
         gzDFvdEGakGIHC20XAnfCaCQNrDtoUYElKppkm3qsclb4eBCvw/YSl4FJ8lF7ANRtAGK
         Wg8wub5/e1FqSsGUgLaWEmdUB4ZqecOsv0tStgK+6iTMrua9d4KD9NKxysGbYWxEw+PI
         4wHDnzMcD1WT1m7sYaW0G8unysjO4pkWItwCXdw3NZEcDeMtTPSVvXvozbZqen6X/yHX
         iht/WXhUkBzigKlG4oYUUTsINKtxt3m0Ct0f9m/7J2pUxDATyi6A3Tv3oDNKAkxPewEY
         37hQ==
X-Forwarded-Encrypted: i=1; AJvYcCXioNQQyGRBEAXeGFd7nsW7iMuD6FizjrofS+G7z/cCGlbiYvqUoEPTMxGkm4nXVc74JJzVB5eFMaTJGuMZ@vger.kernel.org
X-Gm-Message-State: AOJu0Ywkd2JpmlBALCya6xADOgHGG736I5Wc7iKi3FEUdMoi48lFC7NA
	zJr1fVDr3hlCGPbYFgwf/+ePDdflZINzDtNOFZC6LLs6UMhHl/1aImPCnzzloUiOVVXDMTwXGd9
	FkS5+IpRemTVm1V2slMRRNolwrkY3WioflhGeTvCz6hFaT9lTljdU/2Hv8l6jbNGa4Gig
X-Gm-Gg: ASbGncskGC8Wh1ipaWCP4KP59Pwfykj27lhvrzpVAuWNnJnu8aW+Id1sikGWAjSr9PB
	Gu6EncLrN1ZuhY9UnuhSZrm4TwYQ56twiPYmtanHPOU5sLWay7JN1+bSeT/L0d/+z9sLOZpTKEF
	hydheo0L4t0GQoTmppr9oylcT1dgAXZNtvmmGRXFrFrpDStu3PHWf4378yGQsVMxqwaq0Oei6b1
	aSjw94UluI4OPgaALd7lK4aGg01WKXhCEhjLqE5f/DwLiq5ZPHCzg/AyY2+4eRqGdvGdQWzSFPp
	FG0H6nKL8CJM4tB6LkN/dZ+BAd+9M4gxWga7wJmAM6sexH9vzecLk4yw4gQBRw==
X-Received: by 2002:a17:902:d4c8:b0:220:eade:d77e with SMTP id d9443c01a7336-231d452da59mr54246065ad.40.1747408171835;
        Fri, 16 May 2025 08:09:31 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHBhjIc9UTjgG/uGiPqIqdjHzIod7qOxovzGafc51g4T4wyDvPmDvk1xpjqgSrE9k/1bTmLbA==
X-Received: by 2002:a17:902:d4c8:b0:220:eade:d77e with SMTP id d9443c01a7336-231d452da59mr54245595ad.40.1747408171341;
        Fri, 16 May 2025 08:09:31 -0700 (PDT)
Received: from [10.226.59.182] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-231d4ebad0bsm15505515ad.196.2025.05.16.08.09.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 May 2025 08:09:30 -0700 (PDT)
Message-ID: <ea1336e9-768d-4393-bf88-d4c3f19db1b8@oss.qualcomm.com>
Date: Fri, 16 May 2025 09:09:29 -0600
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] bus: mhi: host: Allocate entire MHI control config
 once
To: Baochen Qiang <quic_bqiang@quicinc.com>, quic_carlv@quicinc.com,
        quic_thanson@quicinc.com, manivannan.sadhasivam@linaro.org
Cc: mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org,
        ath11k@lists.infradead.org, jjohnson@kernel.org,
        Pranjal Ramajor Asha Kanojiya <quic_pkanojiy@quicinc.com>
References: <20250425170431.921656-1-jeff.hugo@oss.qualcomm.com>
 <1f2a8c11-214b-43c6-8b3a-9e44094f949a@quicinc.com>
 <d97c900d-c899-4f2c-821b-53991ecfd86e@oss.qualcomm.com>
 <5a90a869-8bc6-4fc5-a02a-58579f24dac5@quicinc.com>
Content-Language: en-US
From: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
In-Reply-To: <5a90a869-8bc6-4fc5-a02a-58579f24dac5@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=M4lNKzws c=1 sm=1 tr=0 ts=6827552d cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=COk6AnOGAAAA:8 a=JLD3Kezu06QqUefcltEA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE2MDE0NyBTYWx0ZWRfXyA9AlrTsrp28
 2flQhlw2gOiq7U+rqHCZcPBHj6G0wg/riiySJCmilAUy2InqmEB0p5DlfOwHFMkf25M5daCUtbZ
 4tfwiUh7SFdbNbFzpL6Ioc4v5PFyrMWLkUgw7ytAYNkJR/3bzw1PDzz3j75si2DedCxawVF8LpF
 FXs2n69YQRUOpxTkicaKWBcnG+9nqlCO8vLnDcnB2LFNyVMo7ZhJ0NMUsUw1JPukuWL1aTHg7MV
 ETIHaDy6BtgWbaQVG30wDCKAvg0bdlgQg5f/V5Alm/utFpu3F47zu7dpYEv/yXGPiFRg4JWUMta
 I6CmsEPQ1yvKjjo0TKuC4/em+hqaRdpkYM1C9IEOqmOR6M3xI/7Psh8biGSF3p7bjNgD/wUL1B1
 DzFVOLisRVFKjQ8ZfbCw1pF4GOH+TjmoMXnaP5gBwYKiNK84dL2Xe4JVv/V36uhSgEjSovN8
X-Proofpoint-ORIG-GUID: sGXxf_BarOeEDPCMiB4clPcwnbnLAJxz
X-Proofpoint-GUID: sGXxf_BarOeEDPCMiB4clPcwnbnLAJxz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-16_05,2025-05-16_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 impostorscore=0 malwarescore=0 mlxlogscore=999
 mlxscore=0 lowpriorityscore=0 phishscore=0 bulkscore=0 adultscore=0
 priorityscore=1501 suspectscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505070000 definitions=main-2505160147

On 5/12/2025 7:43 PM, Baochen Qiang wrote:
> 
> 
> On 5/13/2025 2:31 AM, Jeff Hugo wrote:
>> On 4/27/2025 7:57 PM, Baochen Qiang wrote:
>>>
>>>
>>> On 4/26/2025 1:04 AM, Jeff Hugo wrote:
>>>> From: Pranjal Ramajor Asha Kanojiya <quic_pkanojiy@quicinc.com>
>>>>    int mhi_init_mmio(struct mhi_controller *mhi_cntrl)
>>>> @@ -475,6 +497,7 @@ int mhi_init_mmio(struct mhi_controller *mhi_cntrl)
>>>>        struct mhi_event *mhi_event;
>>>>        void __iomem *base = mhi_cntrl->regs;
>>>>        struct device *dev = &mhi_cntrl->mhi_dev->dev;
>>>> +    dma_addr_t mhi_ctrl_limit = mhi_cntrl->ctrl_config_dma + mhi_cntrl-
>>>>> ctrl_config_size - 1;
>>>
>>> but the range [ctrl_config_dma, mhi_ctrl_limit] could still be possbile to cross the 4GB
>>> boundary, no?
>>
>> Its possible, yes.  From a practical standpoint, that seems to be unlikely as the control
>> area is not terribly large on supported platforms.
> 
> although unlikely, we need to handle it, right?
> 
> IMO a possible solution is that you allocate (2 * ctrl_config_size  - 1) bytes and take
> either the former half or the latter half, depending on which one does not cross the boundary.
> 

Ick. That is going to double the memory consumption for the lifetime of 
the device, and these are dma_alloc_coherent() allocations which usually 
pulls from a special pool, making it a limited resource in my view. qaic 
has usecases for 128 devices in a system, meaning 128 allocations are 
now doubled. That feels excessive.

Trying to allocate again may introduce fragmentation, which is also 
something I'd like to avoid.

I'm working to get the spec updated to remove this restriction, which 
would then mean only "legacy" devices are a concern. As far as I know, 
the number of MHI devices that actually require this handling are low 
compared to the set of all MHI devices.  Therefore I am hoping for a 
balance.

-Jeff

