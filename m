Return-Path: <linux-arm-msm+bounces-69511-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D1AFEB29D32
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 Aug 2025 11:09:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 22B0517C784
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 Aug 2025 09:07:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 17FFB30C37D;
	Mon, 18 Aug 2025 09:07:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dr4jJhpB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99F8D2BEC3A
	for <linux-arm-msm@vger.kernel.org>; Mon, 18 Aug 2025 09:07:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755508033; cv=none; b=neFPxHKnKvyvMdcZdK25EMLvGsKYgB6HSioLNe1CuN7BwjoKMdkmtgUnsnjfRqgHmT51Wv7JyEarFQr1YVJFX0BS8LZG2JazivJjyL7BC7Ypaswl0e2g7QnpdxJKpVyQm3z+mHxkV31bI3M2Zlx5oQ41PbPCvLN7k+kG6p2IEXc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755508033; c=relaxed/simple;
	bh=wyq/7YeczeadlIcGxtjwBRjfO2o1GBWQYroM9CBv0ZM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CfwhFOu0qyHLqpaLo3wWKD8tf9J37GHF0Ys9aunxAV9kahHFdrVpMrJFYJXtdNI+Vs8c26TBXvqKDyYXvUEz/NV3W8edsPqBg78eQnT8XI12ucxvNWfjNSVC8HQ3+mBqw5NYJoybouBAlnl/nX7P+a5rZM5MrqDN0YhlZIgnE+w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dr4jJhpB; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57I8Cd8F001578
	for <linux-arm-msm@vger.kernel.org>; Mon, 18 Aug 2025 09:07:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dUhpdrCm+k4CB4DE4j2STl3XU1CxkFy0Dl3z3gmHHDg=; b=dr4jJhpBWkhC0hl4
	KNLVhV/EZCKuB+KOy5yVaf2hs2kkScwOO6ssaq/q8+U5Xn7JAEinUEFQ9SA6ryyZ
	JMF+/dZqa4Zo7nyFDJapRonWHDsTxMDbZ8nOVrZJ9bfQ5H1zqMIf2xIURrFo83Gw
	PSIBNUh84K6nqP0KDtwB+jfYYspay+z8aKEKGLsfwFarNUEtWjgd9Jj+9WuLpJ7z
	nLTxaGjXxBV3jpI5pNBDNW3zmGcy0doPL4PVYeDoPwnMGIpvLeqOFKo1bvOZsdDX
	suBTREPKnWfiqFobZEG7NlTzIajO2kH2qGoq1YES5vZ/1pTwHDTCEfichPJ4e2xL
	CB/Iiw==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48jk99kxmw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 18 Aug 2025 09:07:10 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2445806b2beso98896315ad.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 18 Aug 2025 02:07:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755508030; x=1756112830;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dUhpdrCm+k4CB4DE4j2STl3XU1CxkFy0Dl3z3gmHHDg=;
        b=fnRYfsbjanYPRxZEtQyz7p4xsz0E/mp2q8F5J6H2Fz0mDVzGmg/3oJ2hxn0ItK2NCr
         iNE+f4gAisvlH9uHKy0uMycRoAkswSPGuYexFHnaEVCE9q9baY5gcgVpBFKRf+h5ysEO
         cbWeB+Mdt06O9+a13YyVYXguOnsmU5P0eqRy4V01Ec3XxRuDeqjDdNt3TlDGWksEn8lA
         torAtUBaOKr5EpDRqDEE1ZWaf5MgidxMp/OVGkGPTV6fF8T5u7HPsm5boE9G+9fGsQSI
         1RGiQwcVoZu9YZzboAWj3tTUsF6x7aB1CSLsPMtmJK9ghXgOIrfnaVJjWUIOfOt/wenV
         8dTQ==
X-Forwarded-Encrypted: i=1; AJvYcCVOdZ1AIHaI87S7gwZ5zEmnBz4wogE/PL51ZOwxEDh12xMRwL4fWaZvCMV9aXJNE1ODLTHUYZWEYjwpQZwh@vger.kernel.org
X-Gm-Message-State: AOJu0Yy5gVfF8NZgZvwecjpdBedGbAcNGJcxH6wOr1ic6Shkq8OQjzls
	4K2fVESZ0cpSiTQ6mmxSq3OPwP4WmXg/Om68/kQa5bIjWADbZRZO9EMSqKmJX1eI0HRfpwQSW7a
	EuJC2EhZr8fVHKkAhDsuerGeu6KiuwbPdbI941KWe39A+fj2hUyj2DMxKOH0jgLcpF+9X
X-Gm-Gg: ASbGncuSf49Yfkjb9QfmZhd8kbL7Am6Ux6YNM46gR5aTkVGHZN5CGa5f29x6hIrFekD
	HEbF7dLMGjOxmOREe8RrVB7+y+/+Gluxmn6Te5tufj3CLTv5sbIMsx1CNLp7dc5LKbc6kvk3TyP
	8VFUglUbQPDCHMKg8uqpJS7MV/oPgTJQ2glVds+nRbPqedL0fh1NTSvynA+bIw/siSi1FnlLiIG
	4qGPJN4wyYWWnMvNQh4qWfR6LOKxd8/DvCPv1eRnz50TeGO2JJPoE1o5ZKhk/JqdJDfLAnvtfNv
	OfT1tRxgcGXjmJ15OMxopZeodAdd5eqnUZO2DZzQZLKuwFlK5p19NkP5TNzJxtuKFLJketW0BQ=
	=
X-Received: by 2002:a17:902:f64d:b0:242:6f41:2351 with SMTP id d9443c01a7336-2446d756f8cmr135618915ad.14.1755508029989;
        Mon, 18 Aug 2025 02:07:09 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEh9JX97qwlZF3aEKy3JEAMK4ybJH6tMcLrA2mXkPjaM+Z0DmqdjxHsABWyv6WSPHfpsDKwwA==
X-Received: by 2002:a17:902:f64d:b0:242:6f41:2351 with SMTP id d9443c01a7336-2446d756f8cmr135618585ad.14.1755508029517;
        Mon, 18 Aug 2025 02:07:09 -0700 (PDT)
Received: from [10.218.42.132] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2446d554619sm74574605ad.141.2025.08.18.02.07.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 Aug 2025 02:07:09 -0700 (PDT)
Message-ID: <5f3261c3-3e44-42a5-bac7-624ce4e7041f@oss.qualcomm.com>
Date: Mon, 18 Aug 2025 14:37:03 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] arm64: dts: qcom: sm8450: Add opp-level to
 indicate PCIe data rates
To: Viresh Kumar <viresh.kumar@linaro.org>
Cc: Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>,
        Stephen Boyd <sboyd@kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
References: <20250818-opp_pcie-v2-0-071524d98967@oss.qualcomm.com>
 <20250818-opp_pcie-v2-2-071524d98967@oss.qualcomm.com>
 <20250818090240.in7frzv4pudvnl6q@vireshk-i7>
Content-Language: en-US
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
In-Reply-To: <20250818090240.in7frzv4pudvnl6q@vireshk-i7>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: mFiShjd5AK-W5jvWIosyKrFvJlrYTrK0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODE2MDA0NSBTYWx0ZWRfXzXXvDumPeFDo
 ymjJgizhDUVe5BeDilbVnBQKGh0qGVCAJFJvmMKMQHY8DYuHlsPRY3iMAsLjyi55JcPawgVAuZQ
 KqIaFiwmsNTmxPI8qStFLxScrS9cSHjL8WmN+yrsTeKB1Pzu6Iol/1yOe7c3N4Mc5BEW6V/E8FP
 816lk8+0kGqR1mmnTMjrt4RpoQ5w69e3l2/HYsNWp9YjPMYh5EoE5upisejoWzGn4Y42HX9pDuj
 QrAXO2bzsxC/U+p+M1SgAgpvFTQwcVtm11y4fqlEWGF0/LXS6IUk2a60a3oPX8QHwjtLhPXugmG
 PQTEWVDZVjavXJGZXkIpBNKyntbO48QkxEU+BKNMK4uKwDHq+qzLrFQVDLjQ+rOwP2o1ImI9LJ4
 KrG0JuFI
X-Authority-Analysis: v=2.4 cv=IIMCChvG c=1 sm=1 tr=0 ts=68a2ed3e cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=jYHQ0JWC-Ns_2KpUhz4A:9
 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-GUID: mFiShjd5AK-W5jvWIosyKrFvJlrYTrK0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-18_04,2025-08-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 clxscore=1015 impostorscore=0 phishscore=0
 adultscore=0 malwarescore=0 bulkscore=0 suspectscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508160045



On 8/18/2025 2:32 PM, Viresh Kumar wrote:
> On 18-08-25, 13:52, Krishna Chaitanya Chundru wrote:
>> @@ -2210,45 +2213,67 @@ pcie1_opp_table: opp-table {
>>   				compatible = "operating-points-v2";
>>   
>>   				/* GEN 1 x1 */
>> -				opp-2500000 {
>> +				opp-2500000-1 {
> 
> Why mention -1 here when there is only one entry with this freq value
> ?
> 
>>   					opp-hz = /bits/ 64 <2500000>;
>>   					required-opps = <&rpmhpd_opp_low_svs>;
>>   					opp-peak-kBps = <250000 1>;
>> +					opp-level = <1>;
>>   				};
>>   
>> -				/* GEN 1 x2 and GEN 2 x1 */
>> -				opp-5000000 {
>> +				/* GEN 1 x2 */
>> +				opp-5000000-1 {
>> +					opp-hz = /bits/ 64 <5000000>;
>> +					required-opps = <&rpmhpd_opp_low_svs>;
>> +					opp-peak-kBps = <500000 1>;
>> +					opp-level = <1>;
>> +				};
>> +
>> +				/* GEN 2 x1 */
>> +				opp-5000000-2 {
>>   					opp-hz = /bits/ 64 <5000000>;
>>   					required-opps = <&rpmhpd_opp_low_svs>;
>>   					opp-peak-kBps = <500000 1>;
>> +					opp-level = <2>;
>>   				};
> 
> This looks okay.
> 
>>   
>>   				/* GEN 2 x2 */
>> -				opp-10000000 {
>> +				opp-10000000-2 {
> 
> Why -2 here ?
> 
>>   					opp-hz = /bits/ 64 <10000000>;
>>   					required-opps = <&rpmhpd_opp_low_svs>;
>>   					opp-peak-kBps = <1000000 1>;
>> +					opp-level = <2>;
>>   				};
>>   
>>   				/* GEN 3 x1 */
>> -				opp-8000000 {
>> +				opp-8000000-3 {
> 
> same.
> 
>>   					opp-hz = /bits/ 64 <8000000>;
>>   					required-opps = <&rpmhpd_opp_nom>;
>>   					opp-peak-kBps = <984500 1>;
>> +					opp-level = <3>;
>> +				};
>> +
>> +				/* GEN 3 x2 */
>> +				opp-16000000-3 {
> 
> Shouldn't this be opp-16000000-1 only ? This is the first occurrence
> 16000000.
> 
>> +					opp-hz = /bits/ 64 <16000000>;
>> +					required-opps = <&rpmhpd_opp_nom>;
>> +					opp-peak-kBps = <1969000 1>;
>> +					opp-level = <3>;
>>   				};
>>   
>> -				/* GEN 3 x2 and GEN 4 x1 */
>> -				opp-16000000 {
>> +				/* GEN 4 x1 */
>> +				opp-16000000-4 {
> 
> opp-16000000-2 ?
I tried to add the level as prefix as that will indicate the PCIe date
rate also instead of 1, 2 to make more aligned with the PCIe 
representations. I will update this in the commit text in my next
series.

- Krishna Chaitanya.
> 

