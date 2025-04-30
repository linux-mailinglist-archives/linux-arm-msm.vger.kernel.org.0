Return-Path: <linux-arm-msm+bounces-56230-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 03BD3AA48DC
	for <lists+linux-arm-msm@lfdr.de>; Wed, 30 Apr 2025 12:42:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C8B884C5DF6
	for <lists+linux-arm-msm@lfdr.de>; Wed, 30 Apr 2025 10:40:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4E51123507A;
	Wed, 30 Apr 2025 10:39:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="j5+fx0Jo"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6A841CD15
	for <linux-arm-msm@vger.kernel.org>; Wed, 30 Apr 2025 10:39:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746009545; cv=none; b=bfSDSL3gD8vg0ysfORrDKBKG8Mrsf20qGtaoCCSyt240gCwwm0dDigk/8KIqt7w6QIUcYvDa9YK8Sk+hgsUYGf9YWU1wgZh8AUOcHm7xAR+vOGj/tYjR0698fnIc4t5b1t9hHZc8csuq/JrB8g6P43Y+7mdZQ3DsINbfom4mxVU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746009545; c=relaxed/simple;
	bh=QYmTOn6Mr4dhC9mWN8gmhtBbHfTTI51Y1NKpL1+fT5k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cAE84vzhi9oM6Rj8IBe+QOhknQ0gZwWWlqVMLO9ZNk7fAsnw1A1zmgeOSa/GFp6DIlgVp4jPo2Oxie83mqbw5I4PNV0sthQKtZwQaU4TPXhdy/UNmlwgsbKILJ11aRMLmvh+IWjQg/jutQ03U3nRukW+k9h4hqQxGz7u02aUwks=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=j5+fx0Jo; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53U9VTtt002823
	for <linux-arm-msm@vger.kernel.org>; Wed, 30 Apr 2025 10:39:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tTiniXOe50bWwoWCn68Sn+g32IeeFnNdfbw7A7ZGjr4=; b=j5+fx0Jo0PfTfwae
	r4fJXEQZm7/q/1U8/tiHRK7oFGTDIbCLsIw4diFG3EPx/nPJw6RosXpIEO1kFDvj
	dNOPul2XKiH2+UXo30R/a0AuwlkV6R/JzWXqT+V3zIBSdyvCd34cMA6QF/EEdBpU
	BJm7a0KRj5Y+wOPgmSMQNcEY6KnDHQOp6SN+0s18tvDmBYDcZi86Yp0FxldsgvoX
	iCt6JXcqZr+I4cWX21ySOxWsN6F6EFD0kSNhkBK8V1HevDPxdu2UvSeBD6TCqkzK
	e/4n7BcReNGPwxYPBUY3oURRuG2++kP0IA7afSu1nW4xwKJtdMazGUGoOnIxh08A
	wfRiOQ==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46b6u9ss24-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 30 Apr 2025 10:39:02 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-6ece15fd50fso19781386d6.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 30 Apr 2025 03:39:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746009541; x=1746614341;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tTiniXOe50bWwoWCn68Sn+g32IeeFnNdfbw7A7ZGjr4=;
        b=nkqQfnAPrInToE8wJNOTYBArAKliBoU4Ft/vyGeCANUuzXW/XbYJHWbYM5Dfp64FaQ
         i3k4ZGbyQjs4Zd83msh9i0bBOiF9XJLgO3Lb2L7uwK74H3qwWVkBPgS8f4g5XB0KZwXt
         l7J58dLD+mf2nLP2KMKUehHj9Zk+KSbsjwGm07A3C+JV3/bz56bv24VBqikgnhHCgclm
         DKlbS+CZ/83I7yI34aBX795CFLj1qxXKOBe2puT8jYN8B2N9Zio35r80aOoSmZSjHRNP
         GEPWSlXdhRl/acuIBa5CK4aZZUoQQ+c1I2nQuKc0O3FIzE+JbZqW3ge4KxbbGk9wTbUz
         iUiA==
X-Forwarded-Encrypted: i=1; AJvYcCWYD6kaa1NJVilE1EEThVl9jqoMIm7RxRhj95XkgopcW3KMDQpwktSnKDav81OA5AACNSM7HE3A4Qo4mjnV@vger.kernel.org
X-Gm-Message-State: AOJu0YwDYuLLOukfQ2U7YskF+W1VRdWIJ/Qg0ZVGPG7E0IGVr8pwZhFs
	PX5MRd92AlKVDFchHh6TDvLMdcQQBAU72KhfOBvi1qBv0asAa+X7uyeFNj57kiTTNPMDandsR6Y
	EGrD2fXlcKC6YysuVtO9gnruPWzRdgeaSlXbE4y6gcrBp5b+56MAwkl357P7ICJDI
X-Gm-Gg: ASbGncs5uYrXzwG7E+wTB1Q4g3tM7gvTG3g6USF0lTH63mYs2bTevI0bNePvpJMGlQm
	PxdLMTuG/ARyKNVbv1ExCvOikBZckOtC5QILyGPmtjkav7sn7fcDEHYCiPIWHyEQiQbN1lyP+wG
	XPkAcbEArdyTsu/zzLtWrF+RMzpbJTjMZJkx6HxbBNY0UptzLl2hFD2dpzfAh7bHWigl81jOd2j
	CFshs1VXYkk9hYvpZFQCWcL9cBNyV/O22QkSTb7lNnxYkf55c8srOTb89OokN5BqiaRFptaxCdC
	nTpprfu+8O54jrH2AaSNvg5odkzfEEYykmY+a0Fkkvhh6BFrNDkjn6pl/TeRHLK/+OU=
X-Received: by 2002:a05:6214:3012:b0:6f0:e2d4:226e with SMTP id 6a1803df08f44-6f4fcf8da52mr14601246d6.8.1746009541611;
        Wed, 30 Apr 2025 03:39:01 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFZlDZ7fgacYzToVTLAIqF1SbHulHpm3F3MMH+wjGvrRzv5uoIFNvo0UB+Ri+k9t28tLdOxCA==
X-Received: by 2002:a05:6214:3012:b0:6f0:e2d4:226e with SMTP id 6a1803df08f44-6f4fcf8da52mr14601096d6.8.1746009541285;
        Wed, 30 Apr 2025 03:39:01 -0700 (PDT)
Received: from [192.168.65.132] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5f7035462c2sm8439702a12.58.2025.04.30.03.38.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Apr 2025 03:39:00 -0700 (PDT)
Message-ID: <f1fcf9fb-3be2-4097-a372-a76bfba6043e@oss.qualcomm.com>
Date: Wed, 30 Apr 2025 12:38:57 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/6] arm64: dts: qcom: qcs8300: Add gpu and gmu nodes
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Akhil P Oommen <quic_akhilpo@quicinc.com>,
        Rob Clark
 <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Jie Zhang <quic_jiezh@quicinc.com>
References: <20250228-a623-gpu-support-v2-0-aea654ecc1d3@quicinc.com>
 <20250228-a623-gpu-support-v2-5-aea654ecc1d3@quicinc.com>
 <e22daaae-57fc-4523-b594-87d202d255f3@oss.qualcomm.com>
 <aa8ebd50-683b-4043-9494-5675a2d9a01e@quicinc.com>
 <41df5398-79f6-484a-8ad3-f3488eb1b71c@oss.qualcomm.com>
 <hpfqpvkex3dtj6ieosce4phukodnoidh55vxpujyekoehhotqn@l434nae5gzdi>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <hpfqpvkex3dtj6ieosce4phukodnoidh55vxpujyekoehhotqn@l434nae5gzdi>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: -Y34bruKRBv2eCIg_QYGMc5AXVs7XW-d
X-Proofpoint-ORIG-GUID: -Y34bruKRBv2eCIg_QYGMc5AXVs7XW-d
X-Authority-Analysis: v=2.4 cv=UZZRSLSN c=1 sm=1 tr=0 ts=6811fdc6 cx=c_pps a=UgVkIMxJMSkC9lv97toC5g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=COk6AnOGAAAA:8 a=Y1ZdfsrSitFJjnkYTe0A:9 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDMwMDA3NSBTYWx0ZWRfX0aUzAGrG7E8a 1VsqF/WtB7r90SKfg9k0gUp1rLr1WIpG/bT7YA3zbvh/d+G6/6gULIVhZBEaKWVGrdl4MyMAaSz fPX4S7MsJ6R1Ku0CyL7CO4ocKWzg/xIqIPWNVyWjnQQ1jmEC0hiPlYZTiIRlkQBT8zC5g2/TglR
 BbNa/nE7NbLZ3HgPZIALHoKZezno5WlXANRfgKtWZjX2CGZPWam3vUimKcog7TjWGOotyoC3LxL 1U2u7Jbm3i8/vKWzq+EnDpv2iMBrK1a0pn8vCyWMKQJxAkvSfZukPVa4Q/zpsr9cpTus/7VccJF trAX9QZBOb/4ZnVL7igD7e6uloi4lk6LKziFYR8XpZCSmJaeUr3tkrHT4eR4F75Q2MP0My8c2QP
 0xbeNSXzmZtpeZZKtspR06zS1v4yYJTXImuBSP6P/rYjBjJxjR2mZSUgiUXl1fdT/OyjF6gC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-30_03,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 adultscore=0
 mlxlogscore=759 spamscore=0 priorityscore=1501 impostorscore=0 mlxscore=0
 malwarescore=0 suspectscore=0 bulkscore=0 lowpriorityscore=0 phishscore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504300075

On 4/29/25 2:17 PM, Dmitry Baryshkov wrote:
> On Mon, Apr 28, 2025 at 11:19:32PM +0200, Konrad Dybcio wrote:
>> On 4/28/25 12:44 PM, Akhil P Oommen wrote:
>>> On 4/14/2025 4:31 PM, Konrad Dybcio wrote:
>>>> On 2/27/25 9:07 PM, Akhil P Oommen wrote:
>>>>> From: Jie Zhang <quic_jiezh@quicinc.com>
>>>>>
>>>>> Add gpu and gmu nodes for qcs8300 chipset.
>>>>>
>>>>> Signed-off-by: Jie Zhang <quic_jiezh@quicinc.com>
>>>>> Signed-off-by: Akhil P Oommen <quic_akhilpo@quicinc.com>
>>>>> ---
>>>>
>>>> [...]
>>>>
>>>>> +		gmu: gmu@3d6a000 {
>>>>> +			compatible = "qcom,adreno-gmu-623.0", "qcom,adreno-gmu";
>>>>> +			reg = <0x0 0x03d6a000 0x0 0x34000>,
>>>>
>>>> size = 0x26000 so that it doesn't leak into GPU_CC
>>>
>>> We dump GPUCC regs into snapshot!
>>
>> Right, that's bad.. the dt heuristics are such that each region
>> is mapped by a single device that it belongs to, with some rare
>> exceptions..
> 
> It has been like this for most (all?) GMU / GPUCC generations.

Eeeeh fine, let's keep it here and fix it the next time (tm)

Konrad

