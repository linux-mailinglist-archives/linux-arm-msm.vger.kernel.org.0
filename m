Return-Path: <linux-arm-msm+bounces-54723-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id CD3AEA93595
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Apr 2025 11:51:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 45F607AA147
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Apr 2025 09:50:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E7CA820CCFF;
	Fri, 18 Apr 2025 09:51:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HwwhoVLE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44B7B204F6F
	for <linux-arm-msm@vger.kernel.org>; Fri, 18 Apr 2025 09:51:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744969885; cv=none; b=bXu0201SnDdPF2xIcsqmHGvflhQkmm/G4eFypWooO+SJ4ZiGgJ26nwU+pwKKns4JaWoyscN4OlRrTsAU8+lMT4BQk3LiTBlvK2xJiBhQj+ERQ8IEoeLij2iQoTsln8EfAFgfOIbC901sIBzGAzpdVFaMFsyjc1jtOgVp9sI11GY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744969885; c=relaxed/simple;
	bh=LSv2LPESZn+oRo8x96FVTGHst4ynm5FV4i+s/CjsLEo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AnNlSwDJCuZ6Hxvdv98dMIObLfDhDOiRWle37X470F5Es5H3TF/NFsGzFTcOdqB+v5gJXn6C0jE6Vc5wljzWncuHWlCfhuhWs0rej4i2y/eaMOz2Hq6dxO9ya3TwhuYsOjI3mIho2J8/iS03TivvzLrY+QluFiWV6fRHPQKEBII=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HwwhoVLE; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53I2YKv1008910
	for <linux-arm-msm@vger.kernel.org>; Fri, 18 Apr 2025 09:51:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rA3sdyVQ16H8kPttRg91Jt1G7uDSj/gcw6eTTAKQB5c=; b=HwwhoVLEu9m/84c/
	izpixz+E1FYpZpSYEhwGskeFb8/7o9N2GWSo62T5C4Diwsr/dxEMUQzCUklx4rg3
	jnksSTFHQQo+UPXubMSkt914vvoRX317E3k/+WTh1V469h5y3QBBQnAkdMi6GALQ
	avc036Vf/bnYej3fUw8Wjkc2piUyI75EhILfq4XKjRJ1kvnJX4b2X3TSDsxj35Rh
	Du8dvHU4r+6wdK37romVDqsSMpbgUDAXLo9jGTg8owSAaAR4vjF/uLGi5N/EcC6d
	1wL6M8Vqyp6wKUJCN67m88CLdrSCHb+PDt7d163csMLgtI0ccEQy1OaV/d6cN6Bc
	vIiapw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45ygxk9fvn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 18 Apr 2025 09:51:23 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7c54be4b03aso31753485a.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 18 Apr 2025 02:51:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744969882; x=1745574682;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rA3sdyVQ16H8kPttRg91Jt1G7uDSj/gcw6eTTAKQB5c=;
        b=fdBGZAlfBORJAM6fxt5MFH9CuMdvNx9DpKQ4HCmJ0ezV8ADurrTtjVKhRgaN/EKMVF
         Jd606cV2rtnUQc2t528CxG7yVVW//XIzf6wOuxji149IBGLeZog62JbXuM++U8ctRW2k
         7rSc60Ocb9mtHB3IMtp3pIwVPPqq9XW1iJdYzS2V5Izr6nRLO87USTiyhyBBESCUYVpe
         dlBFqJlFiv50d0cby4biKKtbn7zDMKyF3KT7PA4TF/pbKx7zjyJFErQPIv06RZdZb1Wj
         pkxH9vWpmrs+DSqR4DOBWCsZnfBZRVRfaB7uiXu8ZpTyCUlYHwvGVr+QdM529BVFMkno
         yI6w==
X-Forwarded-Encrypted: i=1; AJvYcCXnsffe/J5V5VGmxEIEYHzNpvxweJ2Q1xj/RVi1XLiF/uZuoTCe/BXL/yVhraDJEd+VZEgokwCKWZkY/j+i@vger.kernel.org
X-Gm-Message-State: AOJu0YxxikjIHlStM7Ecqgq182pC3wa7NfceZ/KMRmKRodU5km6udo2D
	zFBhf110Bcrgoq6KoITkJpO2Kzyp6W7EeVDurSMRSct4KZWwb4fkb/U81VnrQqOzOuTeG5KFLgM
	qwHdSvA4b8wF7Gmj0jxmS02ieJTCUKgoYGs/orjf7So7k6X0Pl598iYubXwksJDTB
X-Gm-Gg: ASbGnctnSZD8fLUWdzg5Vtludd0dHR5t8AbFotAbW/RSN7Vs8Sd5282tsirAS2L5V/p
	ZKDfHxg03biFp1Ya2X7fLRjCE1DOGnoPXcFsLvhkvhRyPi1M014je411hwZxR361eAzkoO2UJyV
	PW7q2T94lBiholl/bBjDeWyedDHg+tJX0l9loEp7oRQnSfae3VCTdjipyXvoEeAkvDWH3P/RiFX
	9uUwciRdT75fUfGixADZdWdE26TTgFgrthxuv3qgAmuOO4eYib0GYkzS19KSzVnaYrK8Wk13zwh
	uu5Zl2bBDimsGnOKq+p3FJHFsoYVG13x1pDnTwo3e8TCSEvdGKFvhQ2+X8M2r8KgyA==
X-Received: by 2002:a05:620a:2592:b0:7c5:8ece:8b56 with SMTP id af79cd13be357-7c927f9a9f9mr101648285a.4.1744969882145;
        Fri, 18 Apr 2025 02:51:22 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGqDwroTCof2h7lnX1zVhtLN5ZBbsfi9HNceZCvlYWCbV0282LNM0+SsV1JAE41A/dMk5vamA==
X-Received: by 2002:a05:620a:2592:b0:7c5:8ece:8b56 with SMTP id af79cd13be357-7c927f9a9f9mr101647585a.4.1744969881711;
        Fri, 18 Apr 2025 02:51:21 -0700 (PDT)
Received: from [192.168.65.58] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acb6ec0c64csm102377266b.13.2025.04.18.02.51.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Apr 2025 02:51:21 -0700 (PDT)
Message-ID: <5e6a3c7e-4e58-4e42-ac31-3666f49d07f6@oss.qualcomm.com>
Date: Fri, 18 Apr 2025 11:51:17 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 2/2] arm64: dts: qcom: sa8775p: Add support for camss
To: Vikram Sharma <quic_vikramsa@quicinc.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, rfoss@kernel.org,
        todor.too@gmail.com, bryan.odonoghue@linaro.org, mchehab@kernel.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        andersson@kernel.org, konradybcio@kernel.org, hverkuil-cisco@xs4all.nl,
        cros-qcom-dts-watchers@chromium.org, catalin.marinas@arm.com,
        will@kernel.org
Cc: linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Suresh Vankadara <quic_svankada@quicinc.com>
References: <20250210155605.575367-1-quic_vikramsa@quicinc.com>
 <20250210155605.575367-3-quic_vikramsa@quicinc.com>
 <65663927-cc11-4810-8714-7600786f299b@oss.qualcomm.com>
 <7fd92093-3efc-4f24-967d-7e267162b26d@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <7fd92093-3efc-4f24-967d-7e267162b26d@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=WecMa1hX c=1 sm=1 tr=0 ts=6802209b cx=c_pps a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=COk6AnOGAAAA:8 a=-5tugLDAGQjhnTpWTo4A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: dR6Nk3Xs2FtqtIrB9QYAAsP0sWpHYqwp
X-Proofpoint-ORIG-GUID: dR6Nk3Xs2FtqtIrB9QYAAsP0sWpHYqwp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-18_02,2025-04-17_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 suspectscore=0
 adultscore=0 clxscore=1015 lowpriorityscore=0 phishscore=0 mlxscore=0
 impostorscore=0 mlxlogscore=999 spamscore=0 malwarescore=0
 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504180072

On 4/18/25 9:28 AM, Vikram Sharma wrote:
> 
> On 4/14/2025 7:18 PM, Konrad Dybcio wrote:
>> On 2/10/25 4:56 PM, Vikram Sharma wrote:
>>> Add changes to support the camera subsystem on the SA8775P.
>>>
>>> Co-developed-by: Suresh Vankadara <quic_svankada@quicinc.com>
>>> Signed-off-by: Suresh Vankadara <quic_svankada@quicinc.com>
>>> Signed-off-by: Vikram Sharma <quic_vikramsa@quicinc.com>
>>> ---
>> [...]
>>
>>> +            interrupts = <GIC_SPI 565 IRQ_TYPE_EDGE_RISING>,
>>> +                     <GIC_SPI 564 IRQ_TYPE_EDGE_RISING>,
>>> +                     <GIC_SPI 468 IRQ_TYPE_EDGE_RISING>,
>>> +                     <GIC_SPI 359 IRQ_TYPE_EDGE_RISING>,
>>> +                     <GIC_SPI 759 IRQ_TYPE_EDGE_RISING>,
>> 760> +                     <GIC_SPI 758 IRQ_TYPE_EDGE_RISING>,
> 
> Hi Konrad,
> 
> We cross checked internal documents to confirm IRQ number for csid_lite2/3 and vfe_lite2/3
> Calculation for IRQ number is done with respect to vector number as
> irq_num = (vector - 32).
> csid_lite2 vector -> 791
> csid_lite3 vector -> 790
> vfe_lite2  vector -> 793
> vfe_lite3  vector -> 792
> 
> thus irqs are as
> csid_lite2 -> 759
> csid_lite3 -> 758
> vfe_lite2  -> 761
> vfe_lite3  -> 760
> 
> Please let me know if this looks fine to you?

We had a similar issue with qcs8300 - the reported vector id skipped a
number at some point. In that case the SPI ports indices alongside
them were advised to be used. Please check with the HW team, but I
suppose this would be the case for this one too.

Konrad

