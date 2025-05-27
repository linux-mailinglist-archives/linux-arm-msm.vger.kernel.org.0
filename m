Return-Path: <linux-arm-msm+bounces-59526-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EAEAAAC4D0A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 May 2025 13:19:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8DDA93BFB90
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 May 2025 11:19:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7D1F2253350;
	Tue, 27 May 2025 11:19:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IJUp31k+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFB9E1DF270
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 May 2025 11:19:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748344774; cv=none; b=s5FWrDCo8L3vE8Mv8cReoXzrgRQqbEr1BL/3gkXypAtoe5a+Ij58IOMh2KxBmFRu3rf8vcTEnPV5oC3ZM9UBN6fjmO3tGI6ivsLozcjfPPbp/buO+mATWZdPkanQb7gV5YoGEIeBCZ2JEcE2amZe46azWrloqtULjbZ9/6VDt5Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748344774; c=relaxed/simple;
	bh=19feJZZTbb+km5oSmqKqxCaJrNvkXHMQEj7v3RsRCgE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=K3KCcXmwoTFzcoOzRwsNcpKQ7NrZf5P+jQ3NqpFGnY9WQKbvhn0rc9d0TrM4UjSLPGu/9wLfO/fNEIIrpZCgeV+zoEwZSIa51Zn81b9hVTQ7dbZKfKULgngEL+BpD6lR4vHcH9NBnbyIKQMtQL2d1k3b8Vkn5WnAPj9NU9Jdoa8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IJUp31k+; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54R409R1026623
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 May 2025 11:19:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	sGGnr2Cf6uz/5zgl9H9llVxN13njxFiPARnslx3OyQY=; b=IJUp31k+8iZ8fZ75
	0IwkgnNKcfWG8ZX6uBxvXyY1Pmba9MTgMyJ9hqR/1Gcp+7OmWHv9LA8JhHQdA7i3
	0aP3cvkaobNyLO6lUXfZI/r5rOmMnNC/Kk4VIT7VLVcFNxBQNaWwqTUs1p6XoQXu
	IkRafdp2EyegDVWCus8pQ8A/XQAfHuBaonnhptNyzYVipO5H13DaAsEqum0kSqCE
	S9gCjy/EmPKtHuvimd1LZxt4GPWzAXaZ8NGenBMk9FQtlRDoAVv8iw9IKr4P63V0
	0KwSVQQfRuSO+4HlfdQGBD5BkolkRSTbb8/iuv3xdX0bX/NX11e5MtPohfZTLmUE
	AS6T4g==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46u5ejxkck-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 May 2025 11:19:31 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7c5560e0893so23855285a.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 May 2025 04:19:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748344771; x=1748949571;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sGGnr2Cf6uz/5zgl9H9llVxN13njxFiPARnslx3OyQY=;
        b=FcYJo1gWxv+XLKGBKaWPOK3N4900VPG+NDwKzqBYvu6uRfEfZrRvesG9m/Ofi+ypfV
         K2M2/YrgntNSpogliWkpzvlw3FMtEhgtQcpg0PybQlN3kQBf4hSbpB4jbeoK3OJQ9LsI
         BN762Oi3TgHkbgLJdvppj1OUULTtAPdFi1R4FW2rDU6AgYIjUhGymNS9qPzPos+ZPjR5
         pgzc7cw8G/pmYAn+Ul7qa5UG/kl5XOWXTxOH3bUjDxkVGuphIEdFsKMKIWXqSm1xPqgB
         XbcPuvKWrpuXXVdqs6GhWqQ7wq49bATQXqEWS3ablNNfN74s80aVHciFziD10oTP2CCG
         TTYw==
X-Forwarded-Encrypted: i=1; AJvYcCUCiALl8nOwNfxI3CtGIgcpz6yIBSwbThsLdBeZd4+Is5uIllpP3YQXQKxfpw4vzyOzC8gxScNu1s+hxWE4@vger.kernel.org
X-Gm-Message-State: AOJu0Yx6LFFjcrz4sOCYYc4zw4kcPEniMkMB+UsUd7n3G8iMW5C67z9g
	C4CMb7LIl6WB6m8fzIL6awonjo+V6Aie3akc0uTJPWOTguFXqTH+s0d4ADAHqVuoJ+g/1bgwVqR
	MDlVPa1P0upFc/D7vGmTSBwMkmRFjPhM7eGbIpZttlcS428ojeVDt/3rDxirm+CZkk1HM
X-Gm-Gg: ASbGncuwhvE/Gf23rqRQgo65xdnRt8zxjJDIR7xeoE4K+kqlInKtq8GGqKWKa8qhoqm
	t27Tr96CgJNvo2qNioZnEay2csR283A8nhiOShCCz+6XXzZv2eMq/kudZRKpgPQmdrvP/25a4mX
	/WQE3X68RPoxQCaZ4/DLdwMkcwYZ/gpBLhwpytEH233b87RWE3ziF/eFHE+SOyprX9Xm3QBY+/r
	suZBWtKpNmsqQ537sotnrOSfio6p4+A9VIKFsKYIkeMljMiPmYlJOVEbbt00rZSwfd1aWvycemA
	AO4gMRlCWTETkeHWFVAfZqn0rrnfDWAO2mWG+xkyB9iehvjAGM2t2+sVuWwZSeNFOw==
X-Received: by 2002:a05:6214:2124:b0:6f8:e438:6a31 with SMTP id 6a1803df08f44-6fa9d38a281mr84868956d6.9.1748344770701;
        Tue, 27 May 2025 04:19:30 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEVX0YQa52wzPt5zotLH02+4Oq1iIQcnbNqEa0aCHbsQCwGP7XhMmeQ5L88JOR1OO1b3BhmMA==
X-Received: by 2002:a05:6214:2124:b0:6f8:e438:6a31 with SMTP id 6a1803df08f44-6fa9d38a281mr84868616d6.9.1748344770315;
        Tue, 27 May 2025 04:19:30 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6049fe0e94fsm3125097a12.26.2025.05.27.04.19.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 May 2025 04:19:29 -0700 (PDT)
Message-ID: <99fd4103-97e0-486d-9e6c-66c8adb70b3b@oss.qualcomm.com>
Date: Tue, 27 May 2025 13:19:26 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/5] clk: qcom: gcc-ipq5018: fix GE PHY reset
To: George Moussalem <george.moussalem@outlook.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Andrew Lunn
 <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>,
        Russell King <linux@armlinux.org.uk>,
        "David S. Miller"
 <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org
References: <20250525-ipq5018-ge-phy-v1-0-ddab8854e253@outlook.com>
 <20250525-ipq5018-ge-phy-v1-2-ddab8854e253@outlook.com>
 <337068fa-adc2-478e-8f3f-ec93af0bb1c6@oss.qualcomm.com>
 <DS7PR19MB8883BE13166F7CD5DCA777DB9D64A@DS7PR19MB8883.namprd19.prod.outlook.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <DS7PR19MB8883BE13166F7CD5DCA777DB9D64A@DS7PR19MB8883.namprd19.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=GIgIEvNK c=1 sm=1 tr=0 ts=68359fc3 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=qC_FGOx9AAAA:8 a=UqCG9HQmAAAA:8
 a=2jJET5DcvFRXXXsR3agA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=fsdK_YakeE02zTmptMdW:22
X-Proofpoint-ORIG-GUID: XKy4zwP37dH-LhAy2HdjKJxa8xoQ-QEH
X-Proofpoint-GUID: XKy4zwP37dH-LhAy2HdjKJxa8xoQ-QEH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTI3MDA5MyBTYWx0ZWRfXxtG2RnrVTkCT
 vYXLX/PGGwhVng3yYtnO7WB1s/6M86SMS+wlqZW4KLGgGAH3f68B0wchR/k9lz2ZDva1c5YM24J
 nDxvF3g4ER2mapviSY2HeI9EsvDgWkAuwh2It7yXDVHUzBbgrz+zGE05maVZPn8jga087B5Gb3N
 TJJc7GLL9+61mmQOaxeCCx6X4Z0ymC2vurll8CBLpGqS4xMi1vkmHYdjEC88TUvyjc/Ew4KmecE
 teiUb7eGQ2GsE4eRbRymagRGdmMu36JNotZMjKEQphz9cuQEmIUZ2nIQGr4E2xj1fQyRMIXv5IE
 cjW9CjPuswfY+7nwhK6IT1CyPESnk17LDlxo7ABNxs6DAJ/aNLcyLKExemwPsXG5Ww8oGj3tdAD
 01C2LJKQxRH/nXw5F1z8gTduLoySK2D+Nq9yuK0MtlfKabN0zLPLxL3KyPffbc3BlQ6TNJeQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-27_05,2025-05-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 bulkscore=0 clxscore=1015 lowpriorityscore=0
 adultscore=0 priorityscore=1501 mlxscore=0 phishscore=0 spamscore=0
 suspectscore=0 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505270093

On 5/27/25 1:14 PM, George Moussalem wrote:
> Hi Konrad,
> 
> On 5/27/25 15:00, Konrad Dybcio wrote:
>> On 5/25/25 7:56 PM, George Moussalem via B4 Relay wrote:
>>> From: George Moussalem <george.moussalem@outlook.com>
>>>
>>> The MISC reset is supposed to trigger a resets across the MDC, DSP, and
>>> RX & TX clocks of the IPQ5018 internal GE PHY. So let's set the bitmask
>>> of the reset definition accordingly in the GCC as per the downstream
>>> driver.
>>>
>>> Link: https://git.codelinaro.org/clo/qsdk/oss/kernel/linux-ipq-5.4/-/commit/00743c3e82fa87cba4460e7a2ba32f473a9ce932
>>>
>>> Signed-off-by: George Moussalem <george.moussalem@outlook.com>
>>> ---
>>>   drivers/clk/qcom/gcc-ipq5018.c | 2 +-
>>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/clk/qcom/gcc-ipq5018.c b/drivers/clk/qcom/gcc-ipq5018.c
>>> index 70f5dcb96700f55da1fb19fc893d22350a7e63bf..02d6f08f389f24eccc961b9a4271288c6b635bbc 100644
>>> --- a/drivers/clk/qcom/gcc-ipq5018.c
>>> +++ b/drivers/clk/qcom/gcc-ipq5018.c
>>> @@ -3660,7 +3660,7 @@ static const struct qcom_reset_map gcc_ipq5018_resets[] = {
>>>       [GCC_WCSS_AXI_S_ARES] = { 0x59008, 6 },
>>>       [GCC_WCSS_Q6_BCR] = { 0x18004, 0 },
>>>       [GCC_WCSSAON_RESET] = { 0x59010, 0},
>>> -    [GCC_GEPHY_MISC_ARES] = { 0x56004, 0 },
>>> +    [GCC_GEPHY_MISC_ARES] = { 0x56004, .bitmask = 0xf },
>>
>> The computer tells me there aren't any bits beyond this mask..
>>
>> Does this actually fix anything?
> 
> The mask is documented in the referenced downstream driver and allows for consolidating:
> 
> resets = <&gcc GCC_GEPHY_MDC_SW_ARES>,
>      <&gcc GCC_GEPHY_DSP_HW_ARES>,
>      <&gcc GCC_GEPHY_RX_ARES>,
>      <&gcc GCC_GEPHY_TX_ARES>;
> to:
> 
> resets = <&gcc GCC_MISC_ARES>;
> 
> to conform to this bindings restriction in ethernet-phy.yaml
> 
>   resets:
>     maxItems: 1
> 
> Effectively, there's no functional change. So we can also list all the resets in the device tree, whatever is preferred.

+ Kathiravan

are there any recommendations from the hw team on which one to use?
As far as I can tell, the _MISC one simply pulls all the aforementioned
resets, like George described.. it seems weird that it would be designed
like this

Konrad

