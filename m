Return-Path: <linux-arm-msm+bounces-52417-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B6637A6E764
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Mar 2025 01:00:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3F351169483
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Mar 2025 00:00:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ED2E81F2369;
	Mon, 24 Mar 2025 23:59:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dTH8Zuea"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC8141F1519
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Mar 2025 23:59:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742860798; cv=none; b=gTyiXA4cwmR/TfD2ORfF5DXlRE5k5skXep1KsCJ0GO5bhXyPsroXxp0kCs4SBpj9gbi6Trq7cLLKlBmF6CQOJnXQofZckVYBHcyZOgkENd9k8ZASmpTHA4dk9vJGf6VaJmQ6d+QISj/TKbzUiCR6WEmHXdhz+N2l9rVvlPoVQ3M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742860798; c=relaxed/simple;
	bh=Gm4m/qnCBIk9eW6dtzI5t7WbQFiXoUSDnNsNWq2SfAY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kQj8eTF7YK1VGC1V4PEg/xQhEbtynVJFOGikuYnHdKc5+qtARgMfnJvUNngKmOhN2LOWwd8pF1zeUuV9GO6OchIecahQBX98Kp6EiuK9iQjqM7URHylKSHXqAlu+VRoJTREUbuiBkCYcExh9KXpcaetsAyH6mxnZ0xx3i3vbmus=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dTH8Zuea; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52OIDGjr025889
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Mar 2025 23:59:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GUUEA+5MifU8OXBHZIrL3fvNsszMlIyyIRJX6M6YE7o=; b=dTH8ZueaaFUskarn
	viCSwxxA4D7ngqKz7+AZYux1F8YEiaD5OhQVfVCqpux5oroveaO0UA2LUdQouJ+d
	4q/jPmejcHwzLTGMS5OUpBNOrQQDe1FSobdnkdK7H0H4y/jOha5dZMGAAx565Wz/
	g3UX7graKa2uj/CHOzDBXbyWuVbSy0ITBSeZKYJLflE7FxhZXro1ygML7EI76G2v
	sDGmxZFdB4Nuz2jbbZFWjNO8yRURJnK8IDallGpltG9UUyAClZgCRPVJU9FD4PjT
	OafEw0/mkNFagXbJ2PvTnq8m+AlxrIOc/TjuHM6IxG63saqpvqI8LH36xmTBUwm0
	iJ6kcw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45hjjnp56e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Mar 2025 23:59:54 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7c54788bdf7so81108785a.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 24 Mar 2025 16:59:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742860794; x=1743465594;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GUUEA+5MifU8OXBHZIrL3fvNsszMlIyyIRJX6M6YE7o=;
        b=IG/3e7q40jG2eW5oK5GXvCCoaMeaizxupYqwidWyhmsxbbg9BT6Odd0C22XKoMyLD2
         FEv1qourfuQoCXZ+5G59vqd7eYxvLRv3JBWXR6pB/I4bHQ13HKrEfNNf55x6bupt8ED/
         dWvfTkvXXbpLMKMKMyZeGO1E/JY44hhHVgJQVcacDyxYbACEgj7arVAVNQ9w8ahJrh0S
         3bIkoEwgitljFPeWGYeKXanbo8zpI/Ce7Yvgi82o9+XvzHClzhILNY1VPOe/cHnnpMgi
         7ar1LBH7hIMQpnkih6aNNwVnq4jNulbBnhPAezKNA9f9J9s/SD6U777hnAF2RnVxxiaW
         UVig==
X-Gm-Message-State: AOJu0YygTFuf+6k5q6I4UESwcmkk1wi0Whv/6G0SbQZpk29lSHCc3aGJ
	pAU9P0pBqWVucS3Gq99MihPyAzY4l5bcUaHaIwT1VuOqJu3tE8fE5ue2ZfeXuB+btSa5vlFfOkV
	CeiaLF+Y0lXt7fNxDNjgJSOaC/bO5b4xUhFiq0Q69JAXeycVzcrUQcGvL7jp3PJ5k
X-Gm-Gg: ASbGncv6cblrJ8SuoYP5I5T5ShRq5YYmBwtuRtGZavts2GWTnFpeV2gVxNCIb36wlbe
	tBi/TjwUrE45E6GGkbk2/39d78DLhiLYYgt3BshSMzy445+7GBrOH9pRwei1jSTeBR7inqisaOa
	25b3LwhPVT8X+ILoPrcH2YEZmuP5zx7rxz7XSrgOK4XVASvSvDz+S5azVCX9iggV28as93Y6d9I
	dKPLLgouBbWpWLo5hRKhqUj8My66pxjoxUSaiVL0dHZ4i3eRhcsiQ2ndeuTdNXbpHr4D6CU6rF9
	35dhCIxYrzs/oRCMEt0VdB2Qv4SmVJpqPGRH6GeeZUQOPNx2fZLik3QjKAlCZgsWoiRyaQ==
X-Received: by 2002:a05:620a:4482:b0:7c3:e399:3289 with SMTP id af79cd13be357-7c5ba1828cdmr656206285a.4.1742860793721;
        Mon, 24 Mar 2025 16:59:53 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEHj0ppr+7xuQb9OW7wF3Px5IbXShixiG+Mq4HkZUqXFMac+ctdDTnQWLijCrc5IDwfw8wZqw==
X-Received: by 2002:a05:620a:4482:b0:7c3:e399:3289 with SMTP id af79cd13be357-7c5ba1828cdmr656204785a.4.1742860793154;
        Mon, 24 Mar 2025 16:59:53 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac3ef86e514sm749680066b.35.2025.03.24.16.59.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Mar 2025 16:59:51 -0700 (PDT)
Message-ID: <ba6cbf94-3e78-4c77-8c4f-908d3d90a1b1@oss.qualcomm.com>
Date: Tue, 25 Mar 2025 00:59:49 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] dt-bindings: clock: qcom: Add CMN PLL support for
 IPQ5424 SoC
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Luo Jie <quic_luoj@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        quic_kkumarcs@quicinc.com, quic_suruchia@quicinc.com,
        quic_pavir@quicinc.com, quic_linchen@quicinc.com,
        quic_leiwei@quicinc.com
References: <20250321-qcom_ipq5424_cmnpll-v1-0-3ea8e5262da4@quicinc.com>
 <20250321-qcom_ipq5424_cmnpll-v1-1-3ea8e5262da4@quicinc.com>
 <55eada15-222e-4b97-a519-95b5e3aa7c23@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <55eada15-222e-4b97-a519-95b5e3aa7c23@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=fNc53Yae c=1 sm=1 tr=0 ts=67e1f1fa cx=c_pps a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=COk6AnOGAAAA:8 a=BPsefSz62mVIWsVq_7wA:9 a=QEXdDO2ut3YA:10 a=RVmHIydaz68A:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: Qqx-MyNizHGrUsR1rqzw89_xPZZh85TS
X-Proofpoint-GUID: Qqx-MyNizHGrUsR1rqzw89_xPZZh85TS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-24_07,2025-03-21_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 impostorscore=0
 lowpriorityscore=0 mlxlogscore=999 priorityscore=1501 mlxscore=0
 adultscore=0 spamscore=0 bulkscore=0 suspectscore=0 phishscore=0
 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503240164

On 3/25/25 12:57 AM, Konrad Dybcio wrote:
> On 3/21/25 1:49 PM, Luo Jie wrote:
>> The CMN PLL block in the IPQ5424 SoC takes 48 MHZ as the reference
>> input clock. The output clocks are the same as IPQ9574 SoC, except
>> for the clock rate of output clocks to PPE and NSS.
>>
>> Also, add macros for clock rates that are applicable specifically
>> only for IPQ5424.
>>
>> Signed-off-by: Luo Jie <quic_luoj@quicinc.com>
>> ---
>>  .../devicetree/bindings/clock/qcom,ipq9574-cmn-pll.yaml        |  1 +
>>  include/dt-bindings/clock/qcom,ipq-cmn-pll.h                   | 10 +++++++++-
>>  2 files changed, 10 insertions(+), 1 deletion(-)
>>
>> diff --git a/Documentation/devicetree/bindings/clock/qcom,ipq9574-cmn-pll.yaml b/Documentation/devicetree/bindings/clock/qcom,ipq9574-cmn-pll.yaml
>> index f869b3739be8..bbaf896ae908 100644
>> --- a/Documentation/devicetree/bindings/clock/qcom,ipq9574-cmn-pll.yaml
>> +++ b/Documentation/devicetree/bindings/clock/qcom,ipq9574-cmn-pll.yaml
>> @@ -25,6 +25,7 @@ properties:
>>    compatible:
>>      enum:
>>        - qcom,ipq9574-cmn-pll
>> +      - qcom,ipq5424-cmn-pll
>>  
>>    reg:
>>      maxItems: 1
>> diff --git a/include/dt-bindings/clock/qcom,ipq-cmn-pll.h b/include/dt-bindings/clock/qcom,ipq-cmn-pll.h
>> index 936e92b3b62c..e30d57001c38 100644
>> --- a/include/dt-bindings/clock/qcom,ipq-cmn-pll.h
>> +++ b/include/dt-bindings/clock/qcom,ipq-cmn-pll.h
>> @@ -1,6 +1,6 @@
>>  /* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
>>  /*
>> - * Copyright (c) 2024 Qualcomm Innovation Center, Inc. All rights reserved.
>> + * Copyright (c) 2024-2025 Qualcomm Innovation Center, Inc. All rights reserved.
>>   */
>>  
>>  #ifndef _DT_BINDINGS_CLK_QCOM_IPQ_CMN_PLL_H
>> @@ -19,4 +19,12 @@
>>  #define ETH1_50MHZ_CLK			7
>>  #define ETH2_50MHZ_CLK			8
>>  #define ETH_25MHZ_CLK			9
>> +
>> +/*
>> + * The CMN PLL output clock rates that are specifically applicable for IPQ5424
>> + * SoC. For IPQ5424, the other output clocks and their rates are same as IPQ9574.
>> + */
>> +#define NSS_300MHZ_CLK			4
>> +#define PPE_375MHZ_CLK			5
> 
> Not a huge fan of this, such differences are only relevant to the driver
> part in my view - bindings only let a consumer reference a specific piece
> of hardware

Oh I the bindings are stepping into the frequency department already,
hmm.. Then I suppose it's fine if the dt-bindings maintainers don't have any
concerns

Konrad

