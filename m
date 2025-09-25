Return-Path: <linux-arm-msm+bounces-75048-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B920DB9E7D9
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Sep 2025 11:48:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CA44718838A8
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Sep 2025 09:49:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C8D91265CDD;
	Thu, 25 Sep 2025 09:48:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="m7eaxLLd"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B58A1805E
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 09:48:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758793722; cv=none; b=V3s7SPNV5PN35xCG/vYu7mfCBfj5MaJgS5KYSAA4MlNh7rtm0iPDOzbrd/T24rpGS/y8Q18xI1rOPd/UAX5fGhzBAK8ZBK6qKtRoFTNX3ecZwWjgWJtxyjJtvdOKbjcfDx95mA1mIIngqg1HSfDwlA3eNFk5qjEFnZtBSQ8fuyk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758793722; c=relaxed/simple;
	bh=fwqz9ukGkSB7nQ6RVe6CRYI/1cDROkzR8BkzCK6xgws=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tfEYBBxmXsEyQoE5D33ux70ZL1ZSuHLyAYsaMXhOFniVGG7JrVnIsPKfxjd6MC+j9tIyipTwLJpQ5DcRiA8xhmtsm+pvhsJhl+GXAy3/xNDH2nw7W8ejHq55c516+H9mM6kPD8Cj6UWbMB4bUrYwKtsekKTmbvT99PZme6+DA6M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=m7eaxLLd; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58P0XAgR027477
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 09:48:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GR4aDHZmhZBwmaG12GtJDL8oCuro3wUhp6sGrSaguaI=; b=m7eaxLLdH1g46xFg
	urwnknI2nzrjPOU3i6E8gVZkG0nasuC09LhubfNqUUJ+mHaEkX//gcFJyHIbI1Mk
	mZy80NDu/Z8HDb38x9bmmdZKjtna8AzNFr/ZYb/pz5YwwcpPKmZzqIPlxU+LjOM2
	HLb5Jragn4FDyQ9FloYcEDFG8UZAwVmc1RWn+vHKG00aALvpIC78bifXOtJIc4TV
	K87KAtgPp3x2pB//y++UN2XJ6N3gjc/jmU/QiU/rqoUbdSlu3OVOddTuFWY7klgl
	fjArjnHzq70UCbqqtnJquEE2+VZUPiSsBg0q/QVMCDASLH5YTAyM/7v/8s97EqGH
	uSqxMw==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 499kv17n0u-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 09:48:40 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-798925d8e2eso1228896d6.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 02:48:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758793719; x=1759398519;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GR4aDHZmhZBwmaG12GtJDL8oCuro3wUhp6sGrSaguaI=;
        b=CzWCS3cUQnepyZE+gLh/5A3VYfzg9Mkro2RvxrXfWe13ys7vjUmGz40Z8m7G6G7H0E
         AJP12kbSdP3HnTWWYhkjL//sbSdgxGgiH5pc7bIcu8RJC3oP0arFf5kQXMmLy3uV+ehn
         NabvPtKLv7pDdYeNhcoTEUk/m91P4R7MPMjg8pngXj2aehLZ0VFMq33ejPngraF85taL
         NaVYi8UIIid+7jBz8/xOwOrI4OTJM5HhE0zOEZpAuZQfA3lIpWdNpOmCcJmaU8j1bU96
         UjJvF2eNxriWGzdz9KpAXScjNSa382mK5m1TD+f3xCxQYx+V1sw+dCo3AlJ0WdDRUAgI
         Y9ZQ==
X-Forwarded-Encrypted: i=1; AJvYcCU6z8omV/bAVTpzeFgqkKY0J7oWKkTjmtP70qNsOPRFroguEVy7JsWXPGv6GWEGFvP5wMDZL0qTEpjXRO02@vger.kernel.org
X-Gm-Message-State: AOJu0YwTskfjCL42WBXFpCos/sRATp4gOvd91IftGO2zm5SUWzEPuGTo
	XqUqhRSnL0ZnLp/MRAqPsnSgMImKVFJbZbjiKTbAi3QhgK4x2B8LjtbkT/X5y8BhdOLZyvOSMC7
	Sp0Dac3KOy8nP1wglTQxvhPDx9uI8QWARqd+jUgBPWaKdGcXKGV4ePgpAM7CruTOQYiqH
X-Gm-Gg: ASbGncvkmrrryv+wjmnI8CxGqxnV+rEq4IJ0A6FHMPvx+f5OlB2T0h2n6zTQhDoL//T
	nAoxaAaCRW3/XYSAkE/qx6AAPIus1PPU34u24MpP6P1k52OZH1pg8aspiSOmlpV/NpqAZ8EOU0I
	Z4to7N6DneWBhAibk/0pdQ8urxEFVwMTQXQxszbSWVczoffEFUk3tluaUBk5juM5GBFSho2HWcw
	RbA/p6vsCRObd2CjnW/EFElzXqHEi4EgTpHhjLPWmpckN+RC6jNCu4RQ9Bd2LubGVeih4G7meDi
	crAqU7cfhhWHeCprIpTvObjks8HHDtQVn2e+cWy0tl5IFHyhnwcdl1UOga8oO49ETRcylvAxacH
	W2B80tts4VkhTev/a3+uEUw==
X-Received: by 2002:a05:6214:f2a:b0:70d:e7e1:840f with SMTP id 6a1803df08f44-7fc39460be1mr21832776d6.3.1758793719143;
        Thu, 25 Sep 2025 02:48:39 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IENwkiAkwLrvqAp2PIFN0hMMx4wQy6rf7aMEP/NqMglaCPy/Vd/ggqXiqJ+HQHH8XZj9B8+Yg==
X-Received: by 2002:a05:6214:f2a:b0:70d:e7e1:840f with SMTP id 6a1803df08f44-7fc39460be1mr21832636d6.3.1758793718628;
        Thu, 25 Sep 2025 02:48:38 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-634a3af5483sm910511a12.42.2025.09.25.02.48.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 Sep 2025 02:48:38 -0700 (PDT)
Message-ID: <26467336-3322-40fc-8dcb-efc06934162e@oss.qualcomm.com>
Date: Thu, 25 Sep 2025 11:48:36 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 14/20] arm64: dts: qcom: kaanapali-mtp: Enable more
 features
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        aiqun.yu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
        trilok.soni@oss.qualcomm.com, yijie.yang@oss.qualcomm.com
References: <20250924-knp-dts-v1-0-3fdbc4b9e1b1@oss.qualcomm.com>
 <20250924-knp-dts-v1-14-3fdbc4b9e1b1@oss.qualcomm.com>
 <ejcchgc3isc5f6tmiqbxqihmk5efmbcyhv3ehuoerb5ulkd5an@g7a2wc422l6n>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <ejcchgc3isc5f6tmiqbxqihmk5efmbcyhv3ehuoerb5ulkd5an@g7a2wc422l6n>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: MKmaFDTinyAtrGEiAN2AsmkUzMoSHtvZ
X-Authority-Analysis: v=2.4 cv=RO2zH5i+ c=1 sm=1 tr=0 ts=68d50ff8 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=8xtE-M9Tj1n2mnedfNEA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=5XHQ0vS7sDUA:10 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIwMDAyNSBTYWx0ZWRfX40O6AVrqPANT
 5iWtUUhwUfvlpxZoWk/KQK9sYf4jQ+FKYJC12baeiCAKpTUBd1wLCwoBcH4CusmB9q8eQXZEUs6
 6YXDDeUSPWdIdwBriTIjQ98NgEM3hK7RpinG7Mc20rWBYQGGGwH6+0fkzHaBa9DkuZNUGYwb7cj
 WNlTcvvipwcDW+HwJw0mkiDig+xXvk97aHGFxK0haTkpQKEPcP0dLdfbgAQGpDypZWfdMS1RA9l
 lfEomaPuo5R0RRFspzinhPV9iHWpo/kIfw4yftBF+kbNfMf7MzqGMucP8BpIIr/op/FXIychiId
 rkb2zFzDtpGnGD2FBszyNkxDrZWtag5Dl5ia06wOcUuCSwtd0pTStAKiPprbeL96LTnsgeKC5H+
 d/KOj6Se
X-Proofpoint-ORIG-GUID: MKmaFDTinyAtrGEiAN2AsmkUzMoSHtvZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-24_07,2025-09-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 suspectscore=0 priorityscore=1501
 impostorscore=0 spamscore=0 adultscore=0 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509200025

On 9/25/25 4:09 AM, Dmitry Baryshkov wrote:
> On Wed, Sep 24, 2025 at 05:17:31PM -0700, Jingyi Wang wrote:
>> Enable more features on Kaanapali MTP boards including PMIC peripherals,
>> bus, SDHCI, remoteprocs, USB, PCIE, WLAN and Bluetooth.
>>
>> Written with help from Jyothi Kumar Seerapu(added bus), Ronak Raheja
>> (added USB), Manish Pandey(added SDHCI), Jishnu Prakash(added PMIC),
>> Qiang Yu(added PCIE), Yijie Yang(Added WLAN) and Zijun Hu(Added Bluetooth).
>>
>> Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
>> ---

[...]


>> +&tlmm {
>> +	wlan_en: wlan-en-state {
>> +		pins = "gpio16";
>> +		function = "gpio";
>> +		drive-strength = <8>;
>> +		bias-pull-down;
>> +	};
> 
> Why are the TLMM pin entries sorted?

https://docs.kernel.org/devicetree/bindings/dts-coding-style.html#order-of-nodes

"""
For a few node types, they can be ordered by the main property, e.g.
pin configuration states ordered by value of “pins” property.
"""

Konrad

