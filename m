Return-Path: <linux-arm-msm+bounces-51703-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 43EA2A6712C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Mar 2025 11:25:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 35AA4188B0DD
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Mar 2025 10:25:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 623C919F424;
	Tue, 18 Mar 2025 10:25:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IASshelC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BAC1204F97
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Mar 2025 10:25:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742293505; cv=none; b=SNojJ2kquCTy4PovJlvm8L0F7jX3oma7az/9SXYnMMGpEZRNTuob8bVY6BGhAbSauZtCmrzdsAIFrZPnzfR3yVvMded6tD4qCSOlzrcU5FEp7rGKaZ/4jBgpC1GXZOXrzup+d1nO4AwJjVHVVjcOfdQq2f0rYMhugFzanHzxXBM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742293505; c=relaxed/simple;
	bh=viI7y/zKVyvSQat5yicr/ZP4aQMPwYcfsOE3HA4N1zM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LB585os9YBvFzyXjlmcqBr7CELtqDtIy+ous3TnciohONaZBtrNXWI9dKBBYSTO453raZwQw0KJEcFgYo7XCF37inmhIo8FAdbbloeMBCyZ/Q0Ml9JZ8KnkiAnedvpTKFD2H2n3uzmcB6u9XIeSAxZ87ln5JpJgYUyNGU4YMWBY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IASshelC; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52I9pQhp018687
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Mar 2025 10:25:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9tGWEqzwTs/fY6RPkduOMFdSME0M9poWROeZ179aC8E=; b=IASshelCF92cIw4f
	A1dPhjICdvIqb6ufrw2KWwm9tA871vKxWyLLy+V69JZFMSQIyzibEEd6RSEqxV/g
	HVJje31jJw5qEq2eLZshtfd/m8/eqZ7juPPbU9Ypaw8hyWX54PKSCm81CWy0Lim9
	aFqB5Gv9APizKnl0hPt09l/RjD9gLSYTHEEEhUm04pMg3XQvVOOpQGeK/CnvcFee
	ljSrAtFPz8oIWVcI4/acLvDrPkfvQ3Y3uhIMoQJvO7qWIxnFrjtmGICsqA3JSG3/
	W6v5STl/Ib/kyzfCCX3ahR3rPpxv/xDxHoLoPSpjDmDwXhQWWCql8tk6X22y7uCs
	13aKpA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45d1t4qud0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Mar 2025 10:25:02 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-476718f9369so8336721cf.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 18 Mar 2025 03:25:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742293501; x=1742898301;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9tGWEqzwTs/fY6RPkduOMFdSME0M9poWROeZ179aC8E=;
        b=wNowrhb+mlFYt1Pdj8Kkcsi/Rj6W7CsbQ5rrCeqwQfo+mXylP9inZI31N0xSLsfT+f
         3EjysRm537s8yVeefaVn9Re1RjQTJNOfQEy0ZM9WgFCtcGsbRiA+R0c5Lg/Z1sUxaPMt
         lCBtKeHxe0g6/6lu64ZA/7n1/F+89HyD+cIeXIj3Yh/PtBE/jlGuL+toKfXkeC6S+hGP
         vMqjkpDW7Yn3MDS+wBn1+jkof6vdzeocyo73oZzYNGzPQf27UXTJ7302ASIE+jSlB7kI
         y/ODjoxK11yp1W7yfmeQcF68qEfrE9jdHyfhf2usA1OIpsBMozLQKbwr1Q8EDWV/IEG/
         gwJA==
X-Forwarded-Encrypted: i=1; AJvYcCUTkF6ZsKCrYNMw9p39NUdDjl335xUbpgpZxVZqc02PNOMnga35uLDOT84bpkwGiCJW8iYWkw8vyyrUeOM/@vger.kernel.org
X-Gm-Message-State: AOJu0Yy1VMhmdulTxF+/cSPnXtKkXRQZllgA4e0FxFxZOvb4lZkej8Eb
	uCmqvew6axLjMd8OZl6eJHRD9wsu4l86t0KtJUEgY0bpXRYXyyNFUCsLQVJUMnjNOAW9DR0hu/H
	Ue4rVXt9J4NBfUwUnPGXZQHievST/1O3HzqqGNPAzHqmT4EGG7aS2zNk7C/izwXsC
X-Gm-Gg: ASbGncuqNUwmlSr0JdxSCUeUCI296gvd1jZcloaNOv/O644JCUkfXpjNYQQxC74sKHn
	1N04SAw6T253WKrqXXS1N455jzWof2eUEUEeSIBYGcVlXiIHPnL4dugz+Z1IN3ooWDmqq960GL3
	/cYQ2x0wkjMceIN3UedUWV90KtqAkJ6NxDpk0OHT8VLNfQ6Cy2ULMuCmhh7Sd7EJR2fcdZ4ljoh
	kYvR0eEU/m0miu/PIMMZTx1F4pWW1ve78KByYD1xmz+UnjJDkjhgv0HljMOrlHCNU2fdd7b2JMV
	QmbAF921XbnF1qWrfCR1ygZ7kuPGf7kux1GQ5IzZ57B6uGYptPLOiUfDtw/jT2ugYwlpWA==
X-Received: by 2002:ac8:58c1:0:b0:471:fe93:4b5f with SMTP id d75a77b69052e-476c81b622emr86278561cf.13.1742293501472;
        Tue, 18 Mar 2025 03:25:01 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGDsMQDOS+0HDILyNXHIvpznOD0Y7l4AYvNrP+8R89ZspJwFSR2+cZXNbEUsjSQJ6tnA8Zr6g==
X-Received: by 2002:ac8:58c1:0:b0:471:fe93:4b5f with SMTP id d75a77b69052e-476c81b622emr86278321cf.13.1742293501043;
        Tue, 18 Mar 2025 03:25:01 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5e816968bfbsm7331474a12.17.2025.03.18.03.24.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Mar 2025 03:25:00 -0700 (PDT)
Message-ID: <8e830d99-61d1-43c0-bcd3-a8b669fcc2bb@oss.qualcomm.com>
Date: Tue, 18 Mar 2025 11:24:57 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] arm64: dts: qcom: sm6350: Add OPP table support to
 UFSHC
To: Luca Weiss <luca.weiss@fairphone.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250314-sm6350-ufs-things-v1-0-3600362cc52c@fairphone.com>
 <20250314-sm6350-ufs-things-v1-2-3600362cc52c@fairphone.com>
 <cddcd851-5e8c-4202-baad-e56a09d5775a@oss.qualcomm.com>
 <D8IJ5TEHREW1.2FK88ACT1JPYQ@fairphone.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <D8IJ5TEHREW1.2FK88ACT1JPYQ@fairphone.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=VLPdn8PX c=1 sm=1 tr=0 ts=67d949fe cx=c_pps a=JbAStetqSzwMeJznSMzCyw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=6H0WHjuAAAAA:8 a=EUspDBNiAAAA:8 a=4oVbTNSGWYtvGuB_2MIA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-ORIG-GUID: cYnVf8r8BHtVweIYGYeJ1tj0iM6uFIfW
X-Proofpoint-GUID: cYnVf8r8BHtVweIYGYeJ1tj0iM6uFIfW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-18_05,2025-03-17_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0
 priorityscore=1501 clxscore=1015 mlxscore=0 lowpriorityscore=0
 phishscore=0 mlxlogscore=999 impostorscore=0 suspectscore=0 malwarescore=0
 bulkscore=0 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503180076

On 3/17/25 1:12 PM, Luca Weiss wrote:
> Hi Konrad,
> 
> On Fri Mar 14, 2025 at 11:08 PM CET, Konrad Dybcio wrote:
>> On 3/14/25 10:17 AM, Luca Weiss wrote:
>>> UFS host controller, when scaling gears, should choose appropriate
>>> performance state of RPMh power domain controller along with clock
>>> frequency. So let's add the OPP table support to specify both clock
>>> frequency and RPMh performance states replacing the old "freq-table-hz"
>>> property.
>>>
>>> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
>>> ---
>>
>> [...]
>>
>>> +
>>> +			ufs_opp_table: opp-table {
>>> +				compatible = "operating-points-v2";
>>> +
>>> +				opp-50000000 {
>>> +					opp-hz = /bits/ 64 <50000000>,
>>> +						 /bits/ 64 <0>,
>>> +						 /bits/ 64 <0>,
>>> +						 /bits/ 64 <37500000>,
>>
>> This rate on this clk requires opp_svs (not low_svs)
> 
> Not sure where you're seeing this?
> 
> This is from my msm-4.19 tree:
> 
> gcc_ufs_phy_axi_clk_src:
>     .rate_max = (unsigned long[VDD_NUM]) { [VDD_LOWER] = 50000000,
> gcc_ufs_phy_unipro_core_clk_src:
>     .rate_max = (unsigned long[VDD_NUM]) { [VDD_LOWER] = 37500000,
> gcc_ufs_phy_ice_core_clk_src:
>     .rate_max = (unsigned long[VDD_NUM]) { [VDD_LOWER] = 75000000,
> 
> [VDD_LOWER] = RPMH_REGULATOR_LEVEL_LOW_SVS,
> 
> My intepretation for this is we need low_svs?

Hm, I took another look and it seems you're right, I must have misread

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

