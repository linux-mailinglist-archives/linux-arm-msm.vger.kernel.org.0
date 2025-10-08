Return-Path: <linux-arm-msm+bounces-76373-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 34A31BC48DE
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Oct 2025 13:26:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 38BBE4E59A7
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Oct 2025 11:26:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9DBF42F658E;
	Wed,  8 Oct 2025 11:26:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KKhtng6U"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01A182F6562
	for <linux-arm-msm@vger.kernel.org>; Wed,  8 Oct 2025 11:26:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759922785; cv=none; b=TlUzUB42w4KMEMAnB14fJ0/QNrb1hpVUfa1rbixE+vNZugC3TNibm28RwIbLThmg/RpQbNH45iL4RPE/X4obQpF4fzahAHNhjVsHbM1AOzU71aTd1mwCCsVpWCFXWeXgj9LuRw9q5RXb+AUcESAdDTiUMB8d1jDAuJLLTrnWXfA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759922785; c=relaxed/simple;
	bh=zmQqrvSLVyGIszXxsV+9QQQ1xfgpsxVe2UdDesppq8U=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=gDme3UPVc4Eg4IKk4UYbVrDg+IcyAK1FnPouOnHjAFhy9nsT2HrTDQNcPlcUUfbBIfLySjP30Q1I69x+BAJbU/bMURM22Q72Vn97vmaCWoh914Iwk5M/PLBk7LquOdCMiLCyEaU6YSHhV2VJs1W1KOSgut8OmgdUq0M6Kkog484=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KKhtng6U; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59890QKX026684
	for <linux-arm-msm@vger.kernel.org>; Wed, 8 Oct 2025 11:26:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9bAEHpLRtg7/7iLS6JiIyW6dZF5yK9pmMVgvxBMFriQ=; b=KKhtng6UJp/9yUUa
	OUR4iMwhNJmqwqxN+uSTFbU4u1SGQAdOSwBgZ1pBca9+Rkhoillod9cwkLya+y61
	jmn7NBH0Cz023FZIe5xmierHyfXLYdyzpDaxixVrp8oi8Inndq/1oR/8JtZnHXAt
	QypxdZBrdofa1t5B2/RUaWNypaxvvgwbvmGEIgjq5droyrPgvq1ASwnvMg4GoWmP
	qVMdTxSbT0J/oN3iTUh0FPSH86GztFa0D/DTYbZhDB3ymhJlbVwUNLhaRPYplO0O
	NlSJ/z1EfYHuxlfTSBT5f5k5Cuyrx75wxduacfIOlsLks9dFMKU8Sx/Ssa7LmdZb
	2bQxyw==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49n89hj066-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 08 Oct 2025 11:26:23 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-77f5e6a324fso12033887b3a.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 Oct 2025 04:26:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759922782; x=1760527582;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9bAEHpLRtg7/7iLS6JiIyW6dZF5yK9pmMVgvxBMFriQ=;
        b=QgMAIyYGX+FtASSEKv0CFWYHKSpqS0j/JfHPF84P9I5heQiKguO1OQ4DJTeRfFJGb+
         NRtNYTUZ2GlVaKBG7jLqQJYgwziJ4p/d3Z8Pts3yygBAIrEHwfYz4KcGDEy86Cgo5iTX
         S9yUd96WFKSqXcHEpwx2/zGOmy00qY6jIzwKVjFaimbBvuF6rZgkH9n2H1zypdgf7+DP
         /FvOxqQNtjgaO0U2QyLg04Q7z0MK/zl+8WyqUDJPo6UuiIAGl8lvfJBORZSnF7OHWpgR
         Pg2+ZM2q/7ndG1cCdiedDedvYUPHOTxVr/3dtSnwDEhtPbESyuezTNUr+HKMPZfMwkcj
         fWcw==
X-Forwarded-Encrypted: i=1; AJvYcCXU/Dea4vsMDfFskVhDWnwWRuW8h6VLZa/RNv1gNZnAAIwIJZilvkU7k8AcOAJDKjFdFDn+b5PZ/O69MA+T@vger.kernel.org
X-Gm-Message-State: AOJu0YxyzvoVAp2bdGfGoGHlb4OqyxYJjNGOiS2t52p2cFgAwR+Lnt2T
	Q0z1UH6mKhAVrdV0R+SmBkgB63np2zxtwF9FDv0Dw4DCf06YikwR3RIacbQcoZLP44OUtnr244o
	32BHbt7I91KDaG39cp1Qq51WDeza+s8ex9QuLKyowl3OSEFmHK+5wAPkG+M9rdKDLF9GhjXaSLn
	0r
X-Gm-Gg: ASbGnctzRL3jBaBYu1+mQ0eZM+Kd5y6z9uVNgrDUM5NuhhIZeCLrmRRaLV6Izxat1O8
	zDLNOXy6IH0IM+77HeJ1tRZpoTiOBUijEzL9+aLAPJuyF2iY97mLI6dbg+hZANwPE7l8dXorarg
	B4qGYr2jdSHbK0yE3g51apEBhsp0KMWN0L1y9m461zeoiRFPF7NlhN5nepBi2yrrx/7mumHTVxb
	cnMkHsEwt1FNOcBwM9RALyMS5F7ZLm1cmVmVph5r/B8QzynwqIGtFgKklt4vq/vm4UIdYk5ZTGk
	q4NU8s3uAsgjpZf5/CphKg8nQVwETr1pSHM+RHoEF4EKXVIxOYgeU5ff6WM7felF7L3vuhZIHvd
	Rr8PNbD7YIplPU8Vaq/4by/iIDn3qWi6xqTiXR22hxO+61/WY+cQsR9SNZr5AkJg=
X-Received: by 2002:a05:6a00:2e96:b0:781:2290:e7e7 with SMTP id d2e1a72fcca58-79387146b8dmr4069702b3a.18.1759922782013;
        Wed, 08 Oct 2025 04:26:22 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHwkCALuNVCYFwP3XEP4gTbIwLjt69B5Q1k2f0+ktcAs8HwYgmPvg3v5458J4vNacVtt7Pg6A==
X-Received: by 2002:a05:6a00:2e96:b0:781:2290:e7e7 with SMTP id d2e1a72fcca58-79387146b8dmr4069667b3a.18.1759922781561;
        Wed, 08 Oct 2025 04:26:21 -0700 (PDT)
Received: from [10.79.195.127] (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-78b01f9dadbsm18532948b3a.18.2025.10.08.04.26.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Oct 2025 04:26:21 -0700 (PDT)
Message-ID: <d7125f03-ae6e-4907-a739-840b68593804@oss.qualcomm.com>
Date: Wed, 8 Oct 2025 16:56:17 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
Subject: Re: [PATCH 02/24] arm64: defconfig: Enable Glymur configs for boot to
 shell
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250925-v3_glymur_introduction-v1-0-24b601bbecc0@oss.qualcomm.com>
 <20250925-v3_glymur_introduction-v1-2-24b601bbecc0@oss.qualcomm.com>
 <wzhfv4v5urehjjlldsdznrnv244pdzpuolofalvj3cerscipch@7gkb5dvjwl4i>
Content-Language: en-US
In-Reply-To: <wzhfv4v5urehjjlldsdznrnv244pdzpuolofalvj3cerscipch@7gkb5dvjwl4i>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA3MDE0NiBTYWx0ZWRfX2iQKjWDSBYiP
 STjTobcZAJw8brmENdTAryVqci+n+dB2Ycg/4kR8lUNSdwRo4bTBFDVf+06wjVFmfLqhF7nRBoJ
 /emZe0NnPCWBmfDS0gUvDJVSMarEIZmY1grQ7Fpin7YjlLDFrWDhliJLvCENTuRR3+HXa9Y/SJ8
 56qUVuQWmhG0UOAdkilmJ+ntkfYzAO3wqOR0qKNELs/m+KizMS+dyUbAcuBLxXT6sIgK1NHN8St
 DXbrmpnzgsgYv7aPpmtX/cSBTdxhx6tEeTXRavWvWHnbCkJiaSx9NjBGYeyyCoW1z6PHEYngCEP
 3ZiQdmSBzI029wV0cAhWZuVUv/GLSfGo5R1zsl2zMdhdvllY3tW3UhfiBcdu8zXM/3a/du4Ljje
 KyckrbcKezgb7UWDtafx0xZNatyvbw==
X-Proofpoint-ORIG-GUID: gdcEYemFIKY0izU7qBhxsSUkn5c0u8lz
X-Proofpoint-GUID: gdcEYemFIKY0izU7qBhxsSUkn5c0u8lz
X-Authority-Analysis: v=2.4 cv=cKbtc1eN c=1 sm=1 tr=0 ts=68e64a5f cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=EUspDBNiAAAA:8 a=oJttokzAQODEBWIVO_QA:9
 a=QEXdDO2ut3YA:10 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-08_03,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 malwarescore=0 spamscore=0 priorityscore=1501
 adultscore=0 impostorscore=0 lowpriorityscore=0 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2510070146

On 9/25/2025 11:01 PM, Dmitry Baryshkov wrote:
> On Thu, Sep 25, 2025 at 12:02:10PM +0530, Pankaj Patil wrote:
>> The serial engine must be properly setup before kernel reaches
>> "init",so UART driver and its dependencies needs to be built in.
>> Enable its dependency clocks,interconnect and pinctrl as built-in
>> to boot Glymur CRD board to UART console with full USB support.
>>
>> Signed-off-by: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
>> ---
>>  arch/arm64/configs/defconfig | 6 ++++++
>>  1 file changed, 6 insertions(+)
>>
>> diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
>> index e3a2d37bd10423b028f59dc40d6e8ee1c610d6b8..9dfec01d347b57b4eae1621a69dc06bb8ecbdff1 100644
>> --- a/arch/arm64/configs/defconfig
>> +++ b/arch/arm64/configs/defconfig
>> @@ -616,6 +616,7 @@ CONFIG_PINCTRL_IMX8ULP=y
>>  CONFIG_PINCTRL_IMX91=y
>>  CONFIG_PINCTRL_IMX93=y
>>  CONFIG_PINCTRL_MSM=y
>> +CONFIG_PINCTRL_GLYMUR=y
>>  CONFIG_PINCTRL_IPQ5018=y
>>  CONFIG_PINCTRL_IPQ5332=y
>>  CONFIG_PINCTRL_IPQ5424=y
>> @@ -1363,6 +1364,9 @@ CONFIG_COMMON_CLK_MT8192_SCP_ADSP=y
>>  CONFIG_COMMON_CLK_MT8192_VDECSYS=y
>>  CONFIG_COMMON_CLK_MT8192_VENCSYS=y
>>  CONFIG_COMMON_CLK_QCOM=y
>> +CONFIG_CLK_GLYMUR_DISPCC=y
> DISPCC should not be required for the UART, it can go to =m

Sure, will mark it as =m

>> +CONFIG_CLK_GLYMUR_GCC=y
>> +CONFIG_CLK_GLYMUR_TCSRCC=y
>>  CONFIG_CLK_X1E80100_CAMCC=m
>>  CONFIG_CLK_X1E80100_DISPCC=m
>>  CONFIG_CLK_X1E80100_GCC=y
>> @@ -1641,6 +1645,7 @@ CONFIG_PHY_QCOM_QMP=m
>>  CONFIG_PHY_QCOM_QUSB2=m
>>  CONFIG_PHY_QCOM_EUSB2_REPEATER=m
>>  CONFIG_PHY_QCOM_M31_USB=m
>> +CONFIG_PHY_QCOM_M31_EUSB=m
> Is this also a dependency for UART?

No, it's a dependency for USB, commit message mentions
full USB support being enabled

>>  CONFIG_PHY_QCOM_USB_HS=m
>>  CONFIG_PHY_QCOM_USB_SNPS_FEMTO_V2=m
>>  CONFIG_PHY_QCOM_USB_HS_28NM=m
>> @@ -1718,6 +1723,7 @@ CONFIG_INTERCONNECT_IMX8MN=m
>>  CONFIG_INTERCONNECT_IMX8MQ=m
>>  CONFIG_INTERCONNECT_IMX8MP=y
>>  CONFIG_INTERCONNECT_QCOM=y
>> +CONFIG_INTERCONNECT_QCOM_GLYMUR=y
>>  CONFIG_INTERCONNECT_QCOM_MSM8916=m
>>  CONFIG_INTERCONNECT_QCOM_MSM8996=y
>>  CONFIG_INTERCONNECT_QCOM_OSM_L3=m
>>
>> -- 
>> 2.34.1
>>


