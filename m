Return-Path: <linux-arm-msm+bounces-75481-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A7D7BA8323
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Sep 2025 08:54:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CA7583C477D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Sep 2025 06:53:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2F3662C031E;
	Mon, 29 Sep 2025 06:51:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SqBSAIPi"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C4DD2C08AA
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Sep 2025 06:51:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759128671; cv=none; b=s0KKDd2v7zDc7l3QzCM2VmvgIm0QTDJi2HTpPc+uNq4LQejungpLJWfvA4sB+PQZSuu9fJTI29pCf+noO+8mW5uD5DsfxlhJZ1ksaXCzeh6yPdP21BfDln3v8Ubu3VA6uaqntYLBaA5xY7WBdbpjkEbHtHIK38WaEnvGxCdvO6Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759128671; c=relaxed/simple;
	bh=Qs6Xu2skLRe1j3hqfR4jb/bGbkPW2iNTslRy5lTMWsc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fSBt3sfxr2sPWuJ2HBXLN2r1vO7bsHAgDl01boASRoP5vuzYCUYJqFHSTR8t4/B8qC3Hw7MFekb1UHDX3D+5kMEKRpmDClqM/bUSc8Zf7rVKAEAk2BFQytIQauKohu0laAEVjlYYsiOyGb3s565lqmTVclbrcPFgc92l6CwuaP4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SqBSAIPi; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58SMpo6Y003235
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Sep 2025 06:51:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1g51hOpNYcbi+fYrTKGLSDcwoetQbIsCELfJGZDrqFU=; b=SqBSAIPiwNbuvuHp
	CbwQYSdS/AY8z53FTL4wf8vEEJ3LwS3LMacqeby5qnN4Bso8ylRZNZHU4Y0kxR1r
	PFjEpjSB5rOXpdlrdXlEI68DO1iTPFV4dit3y7C5zuEbOO3uB+QEqKRdDTTgjuLh
	lfT/ppNZQJy0rTU/u12DfXSnLiVEcuCXPBUAxOOv+BE5mwCOJTWE7QrmwJ26Brh2
	+fMo/6DcOgiGt1jOX0iJnPpTdZWyPTMJ5Yqa8PxLGIbGcgdFnBQ1vi2u4zb7ziIm
	WTjDlwfNt2T92d5eoclIWaPmwa5hTs6ZRB8u3HpF7zSKMevjgfxfL48jCMkS8RdV
	UrgYwg==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49e977kxaw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Sep 2025 06:51:08 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-32eddb7bad7so1230925a91.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 28 Sep 2025 23:51:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759128668; x=1759733468;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1g51hOpNYcbi+fYrTKGLSDcwoetQbIsCELfJGZDrqFU=;
        b=jWMhdx8wCpNjnZcqdeTShQXV8dAX+Ar0xNVAO2zFQ7UWEcqJDC64N+y31oAybPQcao
         MUPA3PsOGEaSmylmMIDXWw+cTahLm8wce48626wbesI+puX3EZJ8c9FX+/zQ0girj/AH
         k90ghS3GU8qNHH32DIdSH6tAXjhAX71kBRmrqKhpfzBd3hFrlvqBCr7ncZ5KWRVVRbQZ
         JcSXeVqdz+sVTM1P5K2AHDssKeyZIAlcsaCB4cmrYJaM5II1L+LSUDEbxVL94l3ukDPG
         a6Z5sPi9bZpujMFBESgLkloj3H8S+4BPjEOL/6Y4j6g+7wdnm/ET9CWlJI56mxgmTk21
         tE4w==
X-Forwarded-Encrypted: i=1; AJvYcCWfxmmSKVl6sVlUPx8BJl47fKa08Hc00ods9Fa68TcBuhfmnrxtGjiJVT13aF08Xi0dCO0H+a3o9qZTb2CJ@vger.kernel.org
X-Gm-Message-State: AOJu0YwbndNkc5UbsST39hIpbRVq9tKpPaFJEZHqWqMDqPn2efl4RXBJ
	Ny7l2w2aEaMmIZmzxdfUAvFgW2U3UnGrUaQynES+yBMKhmi5i11Egql6ujG6nkhnEMpBjAq2TIN
	vZVexjTcBaSnxKhn4qu2R+hzso8uxFDk0hzFWysV1f7rw89ijQvvMs5YKozsu7KTd7wag
X-Gm-Gg: ASbGncsNWrJrJZgng7kZbZJME1JtKMDcrFmbdfhL4SLirw4ofNV3UehGXuN7QcMlYO7
	RBeEeJunoHaUmbY7SIaKvFV1aW4ndro7XDcnX1yomH2u3pTWDOsVLOXDWT+lMWOLj1Mj6dO8z0P
	OQ5l26LSBhJ1w81hKUDlK60ei+maYrF7Q4gHoI2N1CbIDNQNVjpS5wwEwYTsUPQaFijH/OKF1hA
	QB1taO5RSiX3GuVq9qm5WbT+gwoMk6Q84iltwFj2MDQzmokg93mwgmH0Zpr7OQPgD3va7+XIYtr
	GIqkBSlo9IzGD2Ndwm1CGl0IDvCtFW2VV1QV7owtCmp2tEbSmhPMorl5OXzNvII7KjKEMq0UE6n
	fUOMcirAb/ytGx6j7dVK/vT0lYsp8O7M=
X-Received: by 2002:a17:90b:3810:b0:332:50a7:af86 with SMTP id 98e67ed59e1d1-3342a230e4fmr9581394a91.1.1759128667834;
        Sun, 28 Sep 2025 23:51:07 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEqfrcDffEGa89Kr6nZD7JGX9u2ah7a4jDj9bw27/AGY3Zd737uosmm3FQftDtufXIByKAO7A==
X-Received: by 2002:a17:90b:3810:b0:332:50a7:af86 with SMTP id 98e67ed59e1d1-3342a230e4fmr9581372a91.1.1759128667293;
        Sun, 28 Sep 2025 23:51:07 -0700 (PDT)
Received: from [10.133.33.226] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-334352935d3sm5945332a91.3.2025.09.28.23.51.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 28 Sep 2025 23:51:06 -0700 (PDT)
Message-ID: <8429ae83-e027-4ea5-8cbd-a65f3a5a8cb6@oss.qualcomm.com>
Date: Mon, 29 Sep 2025 14:51:01 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 10/20] arm64: dts: qcom: Add PMH0104 pmic dtsi
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        tingwei.zhang@oss.qualcomm.com, trilok.soni@oss.qualcomm.com,
        yijie.yang@oss.qualcomm.com,
        Jishnu Prakash
 <jishnu.prakash@oss.qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
References: <20250924-knp-dts-v1-0-3fdbc4b9e1b1@oss.qualcomm.com>
 <20250924-knp-dts-v1-10-3fdbc4b9e1b1@oss.qualcomm.com>
 <CAJKOXPetzYdOvYkzeWmm9pVM1MwJhng4JLn2jsoAuey4jtfrqQ@mail.gmail.com>
 <7dfd14ed-18d2-423e-abbc-33ef8bdc0a75@oss.qualcomm.com>
Content-Language: en-US
From: "Aiqun(Maria) Yu" <aiqun.yu@oss.qualcomm.com>
In-Reply-To: <7dfd14ed-18d2-423e-abbc-33ef8bdc0a75@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: nHABZ2m7gOnZQQeaGvbNOZPt7g0zu1PK
X-Proofpoint-ORIG-GUID: nHABZ2m7gOnZQQeaGvbNOZPt7g0zu1PK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI3MDA0MyBTYWx0ZWRfX/4XUGexM1xaA
 sKIdEeE3BFeQDZP/Mi3oHhZVC9H2F9J05UawaZnK8HmhRKwjnPGn/4bEZjHQCSgMbA1+XAcHZ2W
 BWPmphhGJJKYc7WXsSBy2ZQGR+raNXlZolmR+sHL3OCABLWVKgwhC8xUk0UzVW0ezFZ7W/RT4fl
 ZCDXzMCZHPRLUA6ULLj0rM6M0F78UKIMvIYbn4oCRkNLeDvt2jtcpvlmWkFdtfmNkVtnymQ93Ag
 w9wcIFd7TJqRKCKp1BWx77pSE/ANoEPZkAf1u6Fp+LUAKUFevuXEaBsJroZhQpG5LngyB/Ikg5A
 vjf4FnGUOPmRhMZYseQR0I9Y+sfYQ+S4/kdYBoKYNiClomqNo3OBUWKH0T7AXrYO2f0fTS+2+JO
 E/bxRJAzCAPQn2sqGsLFlwcXIUrICw==
X-Authority-Analysis: v=2.4 cv=Sf36t/Ru c=1 sm=1 tr=0 ts=68da2c5c cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=SANCmw4WSCOK-ABOScoA:9
 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-29_02,2025-09-29_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 suspectscore=0 adultscore=0 spamscore=0
 priorityscore=1501 malwarescore=0 lowpriorityscore=0 phishscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2509150000
 definitions=main-2509270043

On 9/25/2025 8:21 PM, Konrad Dybcio wrote:
> On 9/25/25 9:59 AM, Krzysztof Kozlowski wrote:
>> On Thu, 25 Sept 2025 at 09:17, Jingyi Wang <jingyi.wang@oss.qualcomm.com> wrote:
>>>
>>> From: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
>>>
>>> Add base DTS file for PMH0104 inclduing temp-alarm and GPIO nodes.
>>>
>>> Signed-off-by: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
>>> Signed-off-by: Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
>>> Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
>>> ---
>>>  arch/arm64/boot/dts/qcom/pmh0104.dtsi | 33 +++++++++++++++++++++++++++++++++
>>>  1 file changed, 33 insertions(+)
>>>
>>> diff --git a/arch/arm64/boot/dts/qcom/pmh0104.dtsi b/arch/arm64/boot/dts/qcom/pmh0104.dtsi
>>> new file mode 100644
>>> index 000000000000..f5393fdebe95
>>> --- /dev/null
>>> +++ b/arch/arm64/boot/dts/qcom/pmh0104.dtsi
>>> @@ -0,0 +1,33 @@
>>> +// SPDX-License-Identifier: BSD-3-Clause
>>> +/*
>>> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
>>> + */
>>> +
>>> +#include <dt-bindings/interrupt-controller/irq.h>
>>> +#include <dt-bindings/spmi/spmi.h>
>>> +
>>> +&spmi_bus1 {
>>> +       pmh0104_j_e1: pmic@PMH0104_J_E1_SID {
>>
>>
>> This might be fine for Kaanapali, but it's wrong for Glymur.
>>
>> We discussed it already and I'm surprised you come with completely
>> different solution, not talking with the community, not aligning to
>> solve it properly.
> 
> I think I omitted said discussion.. if it was in public, could you share
> a reference here, and if not, would you happen to have it saved somewhere
> that you could forward to me?
> 
> Konrad
>>
>> Judging by other patches sent now, I recommend to drop it.
>>
>> And instead just join the talks... Otherwise how am I suppose to look

Could you include the talks with us?
I've discussed with Jishnu, Kamal and Rajendra before the patches send here.
The conclusion is Kaanapali should be post as it is here.
Feel free to have me in this followed discussion.

>> at this? Everything I said should be repeated?
>>
>> Best regards,
>> Krzysztof
>>
-- 
Thx and BRs,
Aiqun(Maria) Yu

