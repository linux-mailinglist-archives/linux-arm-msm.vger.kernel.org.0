Return-Path: <linux-arm-msm+bounces-68980-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 416ADB24928
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 Aug 2025 14:08:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B08C15677F4
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 Aug 2025 12:07:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8D51329E0E8;
	Wed, 13 Aug 2025 12:07:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oK7BQKZC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF2E41EDA1A
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 Aug 2025 12:07:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755086843; cv=none; b=G7Mant6acALxJznA3WX85oWupzmcADJbcoOYlb3YQ5Yh5vTCdBtTD87KwP/EDCB2npdsDsB7f3B+TL7BAOvAbR4yF7YSpbXWu3i7EMBy9jQMTdPSoFbUJsYKef1hkxKDv0DCN2JyOcvcnPJm6P5BiH8HrTSqPfgAb9Mako3shUA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755086843; c=relaxed/simple;
	bh=9qGcsLi3E1UFO4Ta3jTChcqEtx0TcY4Yl7Ij76foFms=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=A2ZWUVn6RhY7UulmQ9sOaYNL2w+3cDrVzLRsS0dQPcKgVOKObnnp2Gs1tIpHpZtHnWCFBIGgHmq2pJqmC1up/GNhwuWdSuebiTKIBtrb3do8GmiLlX9AU9dCAk7htFAzvehn+D2SJo3XEO7kEqNa7wL/UmFLsVEFRxozWDf7Cyg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oK7BQKZC; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57DBLkme031982
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 Aug 2025 12:07:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cpMBrmFukhU4y6bCKMTKHpHZgNaPXxJRJsX95Y0wvlM=; b=oK7BQKZCKX+/NDhf
	Hb1HOr8MuTn1j7LRuc2YfW+CSOtw/441t6C9VDYNYRpDAONHxCLalD0V2LDM8KY7
	X3MBSEM2Vz3+YDZ1eNnTsFH5H4KTW/UZI0e4aU2kslBnFTUKkQszKbXkg07OW5+N
	u7o7ss87Kv51zhOsuNse5CNFUhcLa9XCYkliJw/I+ML4rSQiy/jLnJN34nfxKB3v
	q6QYKwZb8ab7ASLcKj4a1WH34yLsJTRnnWTxW5VWjwz7JoLdaSGeZqetfIcnU1YR
	E1QdW4QTVnDoY6obToK5RpMGp2ZJ2tsNKR2plS8608R9L/v9zQHoc8tPDvZyB1su
	O/WmjA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48fem4fp1t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 Aug 2025 12:07:19 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4b0dfcd82ebso6501101cf.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 13 Aug 2025 05:07:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755086839; x=1755691639;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cpMBrmFukhU4y6bCKMTKHpHZgNaPXxJRJsX95Y0wvlM=;
        b=R1mXC51rNMQxo3TNeUcc3nI0o51ExkppqAAfXow88vg8EFwa1warUA8byC4V9MaNUV
         heqqJz8dm4Ynoi43nCacexmiQhDXnNK8osYTB0euQ8FuAcbSNXWJFKs0ghSzNtZOW1rM
         l05tjyiuDPKK4GP1GfKRnSLz8rm3LoBY8/cwYyfY512FNksFGFFGIh4xDN0SymOtomzq
         st3IwYKbZ+3cdvgxBbLhJe8KRW7N0wHwhqposl2uJGEWNvz+wm8NZeAixfliFnvDGgCJ
         W7LDqMNumio8ReMu+pk7X+PdXKY7BI713dtPCt1A0hXT719D9XQ3AyN3sdnBeLkhLMSy
         TEAg==
X-Forwarded-Encrypted: i=1; AJvYcCU9EBoJwUnLoyguhJapxOyl5PE61StXwqFvRRdr+t45CtH8PesNfWMMXqHm5eg/cSkyxaO2R2ie0G5aUmYe@vger.kernel.org
X-Gm-Message-State: AOJu0YybLvRJGuQvZoZ637MbkOaYejjH7oNpbXrGcjqf7HhZND6Psp3V
	3A/zqTUWzQWQM1rY9d9mhqQz6C9TNYjLbQ9Bw+ANRZYWO3kl3HC92bkJJFihnsE9OdqZ8OLxPsZ
	jWbwDGxGIBE3EoMMIjn90pr2uVzotuqhYFV1EZ3cVrPVtWkJtZ8RaDTgyuB4dVTpskyIL
X-Gm-Gg: ASbGncsALp0SjxoyQH30dKMfKdePjhNoN6wnOYcpcoOsB1Tg695KGVnl7CCbaDtklNN
	5TfDbIKXYThQN2P35733S+ou6veOYtOA0yfyvp2i34yDo+9I6FeKu4AA27WYl+//M3wGTYSULtd
	c2b/AudrHiw+cyAumiaa6lmfT2Htu2SQFbXRxHgSiTMTjxIOGGnYI9amY87Hjx6YLL106K5tV9c
	Xb87RJJ1hqgGXJ6BpdJI1rA0MC0srG6lqE5MP/nDhS2A5aA1e+hFBOHBEOhALcNmwYAQCf9E56c
	hQtC1K0ZsNeUP2RfapoXZn9Rxj0fqSnSkKtA2/ZHIouGvJZHd0kLeVyOwuX8kEKoPjJkKZYY7Kp
	6z2Z2UftMyW8kNJotlg==
X-Received: by 2002:a05:622a:11c9:b0:4a5:aaeb:dce2 with SMTP id d75a77b69052e-4b0fc7bd280mr17927591cf.10.1755086838416;
        Wed, 13 Aug 2025 05:07:18 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGZpdI3hsMO67WfmjVMZeVxcjGlR3cg/Z3J/5n/B10NtxW+duZ0gzDzWCXUZ//zNILeSnGbFw==
X-Received: by 2002:a05:622a:11c9:b0:4a5:aaeb:dce2 with SMTP id d75a77b69052e-4b0fc7bd280mr17927091cf.10.1755086837804;
        Wed, 13 Aug 2025 05:07:17 -0700 (PDT)
Received: from [192.168.43.16] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6187d96a320sm385968a12.4.2025.08.13.05.07.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 Aug 2025 05:07:17 -0700 (PDT)
Message-ID: <f2f13082-20d6-4f22-8dfb-f11b01cd6706@oss.qualcomm.com>
Date: Wed, 13 Aug 2025 14:07:14 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V4 4/4] arm64: dts: qcom: sm8550: Remove SDR104/SDR50
 broken capabilities
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Sarthak Garg <quic_sartgarg@quicinc.com>,
        Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Adrian Hunter <adrian.hunter@intel.com>
Cc: linux-mmc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        quic_cang@quicinc.com, quic_nguyenb@quicinc.com,
        quic_rampraka@quicinc.com, quic_pragalla@quicinc.com,
        quic_sayalil@quicinc.com, quic_nitirawa@quicinc.com,
        quic_bhaskarv@quicinc.com, kernel@oss.qualcomm.com
References: <20250801084518.2259767-1-quic_sartgarg@quicinc.com>
 <20250801084518.2259767-5-quic_sartgarg@quicinc.com>
 <69f2807c-9a28-4b31-97cc-2756f0ab9fd4@kernel.org>
 <c7e36755-9255-4209-9d53-20077bd1d3ba@quicinc.com>
 <8b023e56-435b-43df-8b15-c562a494e06f@kernel.org>
 <ab5d3811-9fbf-4749-9463-4457fbf50023@quicinc.com>
 <4091c488-996c-4318-82ad-c054a9ef5a22@oss.qualcomm.com>
 <a93fb5bf-1fd5-4e00-8338-b8608a9ba8fa@kernel.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <a93fb5bf-1fd5-4e00-8338-b8608a9ba8fa@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: fUTF2JInNlXCISUYZVS5D7Mk_TuMoupC
X-Proofpoint-ORIG-GUID: fUTF2JInNlXCISUYZVS5D7Mk_TuMoupC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODExMDA2OCBTYWx0ZWRfXza91sN1Q4F1v
 iA5/50gvGNhqfAvK8UQwRXDCV7YOgKq8m58l5bya46cf7NNAwb0zNe6Sxg2tM4K92Hw9VrjiwgS
 qlKoi5YTWPBGeoizEUzfxwmHFz+z1x//jvdzyzbJCmG3rURNqSEXuqtj4xlleRWlg+7HQa2aCaH
 a04hmAbLjOV/IbpQjpUxidUSiEq0bi16iAS7syDCoWxkrLrqbFDxwTt4vcluq/u+yPMxSSX45p4
 K+cO2XkKlpTEsR2LX3HAemiPjhEoDI2FUlgLrxg9rhAPpzjT37LgbhZEdr/Y4YrR2XMNnbVGzT8
 Db4gkytHklG/9TqKQ72LgMx4z+2Q2z5X/5q59tcE+NoPEZQOOmRcXN0sk0yzMG4YXOAmUTvpLce
 HQ4+Romr
X-Authority-Analysis: v=2.4 cv=YMafyQGx c=1 sm=1 tr=0 ts=689c7ff7 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=COk6AnOGAAAA:8 a=RWzb36qre9bUkXLxNJYA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-13_01,2025-08-11_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 priorityscore=1501 spamscore=0 suspectscore=0
 adultscore=0 impostorscore=0 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508110068

On 8/13/25 1:56 PM, Krzysztof Kozlowski wrote:
> On 13/08/2025 13:21, Konrad Dybcio wrote:
>> On 8/13/25 1:08 PM, Sarthak Garg wrote:
>>>
>>>
>>> On 8/5/2025 2:55 PM, Krzysztof Kozlowski wrote:
>>>> On 05/08/2025 11:19, Sarthak Garg wrote:
>>>>>
>>>>>
>>>>> On 8/1/2025 2:32 PM, Krzysztof Kozlowski wrote:
>>>>>> On 01/08/2025 10:45, Sarthak Garg wrote:
>>>>>>> The kernel now handles level shifter limitations affecting SD card
>>>>>>> modes, making it unnecessary to explicitly disable SDR104 and SDR50
>>>>>>> capabilities in the device tree.
>>>>>>>
>>>>>>> However, due to board-specific hardware constraints particularly related
>>>>>>> to level shifter in this case the maximum frequency for SD High-Speed
>>>>>>> (HS) mode must be limited to 37.5 MHz to ensure reliable operation of SD
>>>>>>> card in HS mode. This is achieved using the max-sd-hs-frequency property
>>>>>>> in the board DTS.
>>>>>>>
>>>>>>> Signed-off-by: Sarthak Garg <quic_sartgarg@quicinc.com>
>>>>>>> ---
>>>>>>>    arch/arm64/boot/dts/qcom/sm8550-hdk.dts                     | 1 +
>>>>>>>    arch/arm64/boot/dts/qcom/sm8550-mtp.dts                     | 1 +
>>>>>>>    arch/arm64/boot/dts/qcom/sm8550-sony-xperia-yodo-pdx234.dts | 1 +
>>>>>>>    arch/arm64/boot/dts/qcom/sm8550.dtsi                        | 3 ---
>>>>>>>    4 files changed, 3 insertions(+), 3 deletions(-)
>>>>>>>
>>>>>>
>>>>>> This will break MMC for all of the users and nothing in commit msg or
>>>>>> cover letter explains that or mentions merging strategy.
>>>>>>
>>>>>> Exactly this case is covered by your internal guideline, no? Please read it.
>>>>>>
>>>>>> Best regards,
>>>>>> Krzysztof
>>>>>
>>>>> Just to make sure I’m addressing the right concern — are you primarily
>>>>> worried about the introduction of the max-sd-hs-frequency property in
>>>>> the board DTS files, or about the removal of the sdhci-caps-mask
>>>>> from the common sm8550.dtsi?
>>>>
>>>>
>>>> Apply this patch and test MMC. Does it work? No. Was it working? Yes.
>>>>
>>>>
>>>> Best regards,
>>>> Krzysztof
>>>
>>>
>>> You're absolutely right to raise the concern about potential breakage.
>>> After conducting additional testing across multiple boards, I’ve confirmed that the removal of SDR104/SDR50 broken capabilities does indeed affect V1 SM8550 devices.
>>
>> v1 is a prototype revision, please forget it exists, we most definitely
>> do not support it upstream
> 
> 
> You should double check. SM8450 (not v1!) needed it, so either it was
> copied to SM8550 (v2!) by mistake or was also needed.

I believe that the speed capabilities are indeed restricted on 8550-final
and that's why this patchset exists in the first place

Konrad

