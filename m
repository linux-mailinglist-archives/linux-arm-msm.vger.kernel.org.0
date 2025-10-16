Return-Path: <linux-arm-msm+bounces-77531-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 25AE0BE217A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Oct 2025 10:10:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id B70084E0505
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Oct 2025 08:10:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 05F832FF65D;
	Thu, 16 Oct 2025 08:10:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OZXByYJ8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DBFC2FF16B
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Oct 2025 08:10:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760602205; cv=none; b=lgp3S6S5UCXwZLERgohllgGJNq81sb8rYQ6BW7Tf+u0XDTme6kDtb0cehEYGKBtI3mOLq16Fy/US0GAVN/KGtBXtDXoYEk6NNRa8g6IEpaxd4w2gWvQDJnJj/ucVAbKHIx7ifZxHAoDn9BUirXG8gFuZCNvzRIUbNDtqogVUbxQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760602205; c=relaxed/simple;
	bh=jJlPsZ0mceG6nLVbkJ/VZ6In0naj2yOA2MrxmWidNXQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VCMPVTRGKBXZZP07hhDaceYTOFLF/rGj/1hqwYlEZA1MFReuPZ9V7T9CXvfO/oNPy3ZGa0DU1A9ebP7PSfpo6VGecg2yiIpE74Vp60tERmZ73IgKs7gMgT10uvqV5f1MRBFh/ZTQTBhERL1Q7HzSvjL2mJgRS/7vi9hPmLSDn3U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OZXByYJ8; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59G7brBQ016853
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Oct 2025 08:10:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	71eTVHWK8qTFUy2Hm8BbFVjk43WuGIVBQKth2mrE6II=; b=OZXByYJ8t+2YfDHr
	7Ry9TdhdaC4AZMnQDYQ6zdRsMQtXfuVd8Su+7xP3fraYiczQfsMoHjC/u9CAJTL2
	w/wf7JoAqhZSjv/uMZuSQ5vWvihhe9MmCPD37z8LNoZ8Af3HaInoF2DfqlyAiDj4
	gaOWnlkYv0juOrUPjHRNucNjo2l+KI/M0glqRK7sPoUPQQMVP4vCVIfFbkmJXOk2
	k+0urYpVfFWj5DL0Tb7iGK6bPRhkjTqWmyi02sKBEVszXyvO9KNbA8542ZX1fRpE
	cnR7XBHOLhLg5SckJr9DBfQlVvYxR8hblnJipe3S2L2UsXMybSRaP2CnvNLcX6wQ
	SElNWw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49rtrtcfdh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Oct 2025 08:10:03 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-85bb4e88394so13395785a.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 16 Oct 2025 01:10:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760602202; x=1761207002;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=71eTVHWK8qTFUy2Hm8BbFVjk43WuGIVBQKth2mrE6II=;
        b=lm39ejfeZKNWw6Zm9yG710IEb2A6rJyBudE3GobKfnLiIEjWkPaGw4DP+q5cFSJZe9
         ia7Kx89xLZEKEnbivw3TxoRwu0k4vNTfeUW3/G4sZHKUw9ro9seCGUiaymiKl08NUGQC
         D/Mgw/OIuJuU2Vsgz9TC9VAZ9maclVYBcBbHUurtN1amm8sq99wxVq64tZxwnrns/w+R
         IcmRz+43yyFKgjtfNZYsDhrdqveMAFGnFZFDaOlFrCkH7M73SJmpNzCL8I5rtSG248E9
         bT/ZuXafXSmtleyXEGgrMAxb++QXkQ/b8R60kK1E0r5Vr3f4+UPoArE+KHEZ4mMD+lZN
         PFxw==
X-Forwarded-Encrypted: i=1; AJvYcCVB+yJkFWVTTEG6CZLO2qx/bINPUQWp60FuwOELWWZPcDWdbaWqPjwV39HdB2oOU1yzQGUSHtBgPArioVXj@vger.kernel.org
X-Gm-Message-State: AOJu0YwSB6/y+Wvl34sSWTAep1dHdSMQDxGhZpKUlGUnlQKJLaFrkQRc
	uBhywe7zZPYhLYbK15EP6+TKheSh/PG1Te4EgLKqDaOLPALskZcOnReROlc9LWgjaRXl1Vdw3kF
	32CcuWXuCuJmO4/bxil/3Dky4XznJF7btO9jjk301HkpPunF9S5sEe9fJ2GFgnU418Nr6
X-Gm-Gg: ASbGncvNc7OnlBlYapQWxi6HZ/ymxjWf9LG10xzMYDtiiIYUvJNnk20z4/wZg0LpNcm
	VL1kO3skSTyg0rhp9O0di9A6LfofVM6O/ictX/M7GzTeyBmBHW5iVe6+dXA99kZda5sLgIet4uQ
	BJ+PxBEDeuGUY0E2vr9opST8KlZPTvPVmcy2VVdMzw3URrvFz7PhQn0mUYgnT7XjDJ1vMIs95oE
	M6FY5CEuKYMVYdsRMWXsWsVYVPQeHnrmi1Y7jYg0pXDO0+rIcHRzZDiY+3w3qe2xYgC0ezAQhQi
	t6y26ELCek2VuTR0Rmo/V0sthRM04yo3Hv8KMAmsfwXgJNk4wNYebFHJArVffyvEJ9T2Nedocmi
	X9bxV/YcMUAmQnYR2uujuqcQNS6VR5iVV0icTYrwJsI4bVXzfTlbHpTZQ
X-Received: by 2002:a05:620a:26f4:b0:88f:561:d952 with SMTP id af79cd13be357-88f0561db13mr249391785a.12.1760602202355;
        Thu, 16 Oct 2025 01:10:02 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG8Qx7DNi7TWeBh4m+fWu7ED1KdauIgTL7hZB0jOsVg2aUKvUTLde6ZeWAgS3jkNEUDwPMQhA==
X-Received: by 2002:a05:620a:26f4:b0:88f:561:d952 with SMTP id af79cd13be357-88f0561db13mr249390285a.12.1760602201901;
        Thu, 16 Oct 2025 01:10:01 -0700 (PDT)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b5cba06b7f6sm465031066b.30.2025.10.16.01.09.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Oct 2025 01:10:01 -0700 (PDT)
Message-ID: <38c3bf97-4b69-4450-9e23-32ece07e38dc@oss.qualcomm.com>
Date: Thu, 16 Oct 2025 10:09:58 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] dt-bindings: iommu: qcom_iommu: Allow 'tbu' clock
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Robin Murphy <robin.murphy@arm.com>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Joerg Roedel <joro@8bytes.org>,
        Will Deacon <will@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        iommu@lists.linux.dev, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Konrad Dybcio <konrad.dybcio@linaro.org>
References: <20251015-topic-qciommu_bindings_fix-v2-1-a0f3c705d0f3@oss.qualcomm.com>
 <8e7a145e-6871-4974-ae19-40699747803b@arm.com>
 <56fcl2ip6ecu4inig7ecpjt7qrsdt6sehkrzrk6joysbp6tea7@4xdgxhhe3aso>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <56fcl2ip6ecu4inig7ecpjt7qrsdt6sehkrzrk6joysbp6tea7@4xdgxhhe3aso>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: ktKSYsuBoNs-RwF66va4J-ikLeI4_j_t
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDEzMDAyMiBTYWx0ZWRfXwZzbJlAcv4YA
 eQqe1Vms1SncEr5RYKIVJsF9zp8BXBoA7ILje5kQuX+J+lTfJY+DiW+0V09S0HHXFthnf/dTpRJ
 TRDPvl16SVMR67dzo3PbYUV+YwL+1Kg9RRA1ZxfqOVPvGxzLU3EmfJy2/d76bgnSlgDCUv3xTrI
 i2g12pcUeOdOGfAsmAp5T0CJ7oIOaZkFknVZv6KXSkxnYVYrYdoxeReKlIZ0fdFA3bEGda4u1jQ
 allZFvhkSwGXrwtDUMWkOr/IA29wBOMBe+Yr3SCamy1l3u3Rl2V3Yletx2fgLZPQo949uHi2psN
 1Vv3Dw/z+qwt4/JNSWjbq9Say9tDNOVLMdjQnEgcqU3vv7xsHGeQEFGEK217STDN7tkPk2MJ2aT
 sUL6+RwyK/mLc73dbpvJCmEmzg7rvQ==
X-Authority-Analysis: v=2.4 cv=SfD6t/Ru c=1 sm=1 tr=0 ts=68f0a85b cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=KKAkSRfTAAAA:8 a=bEtsd_hQwJtcpMEHxR8A:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: ktKSYsuBoNs-RwF66va4J-ikLeI4_j_t
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-16_01,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 adultscore=0 phishscore=0 lowpriorityscore=0
 bulkscore=0 impostorscore=0 priorityscore=1501 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510130022

On 10/15/25 10:10 PM, Dmitry Baryshkov wrote:
> On Wed, Oct 15, 2025 at 05:48:05PM +0100, Robin Murphy wrote:
>> On 2025-10-15 5:41 pm, Konrad Dybcio wrote:
>>> From: Konrad Dybcio <konrad.dybcio@linaro.org>
>>>
>>> Some IOMMUs on some platforms (there doesn't seem to be a good denominator
> 
> It would be nice to provide some examples here.
> 
>>> for this) require the presence of a third clock, specifically for
>>> accessing the IOMMU's Translation Buffer Unit (TBU). Allow it.
>>
>> Hmmm, but isn't the only thing that accesses TBUs the consumer of the
>> qcom,tbu binding, which already has its own clock?
> 
> qcom,tbu is only defined for normal arm,mmu-500 platforms. Here Konrad
> is fixing the older and more obscure Qualcomm virtual MMU device.

(for context: this touches upon 2014-ish platforms)

I checked the address map of the physical MMU500 that lies underneath
this virtual impl and it doesn't fully expose the same registers that
the modern ones do, I only see PWR_STATUS.

The BSP kernels for those oldies don't seem to have a notion of a TBU
either, except for toggling clocks that contain "_TBU" in their name
at both the IOMMU device and some DMA-capable multimedia blocks, which
I suppose makes some sense..

Konrad

