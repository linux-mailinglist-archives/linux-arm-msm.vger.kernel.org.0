Return-Path: <linux-arm-msm+bounces-57021-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 35E27AAD124
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 May 2025 00:53:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 952185062E1
	for <lists+linux-arm-msm@lfdr.de>; Tue,  6 May 2025 22:53:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0FCBC4B1E7D;
	Tue,  6 May 2025 22:53:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ShSjCFLo"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C63721ABA4
	for <linux-arm-msm@vger.kernel.org>; Tue,  6 May 2025 22:53:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746572016; cv=none; b=lf+6Qjoi557dvW0/Q23tbBdRJ482xB4CDoKJgFS1iTCwarDtW33O+ZZMhcQAhSsTybDlLkkUXZak71Rt2+yMn8U3FHKNIEHYNtPWif0ePENIQt6d9/nmW6eLoIWCxQ+0ozzivbZ/P9Os3MUwWm+MDeLa2VxAhk9otmiWMRYqucE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746572016; c=relaxed/simple;
	bh=WnMPpwg5JDjp5B8VN00/1xJ4Cen7riGSv0Wxd6c0ZG0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OT0JhjJVU48Cll2vDWUxyg1lyXlUbxZNgS6MhWtPFqtFYSXIE39Z3JtzTlIW1xN+d4tsrOC+SQGkU0JpzmMHHhpntUNZ2w5KQ8bPrXClJ4e09h3K8kYf7pWSe62foQp8wZ5tYq2ufOQxy002tJqYAkSZPZ2qEd7zWWCnRfe+lDI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ShSjCFLo; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 546I21XG006702
	for <linux-arm-msm@vger.kernel.org>; Tue, 6 May 2025 22:53:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ygofsMCIB0jAe4SjuNSFtVbwkj+wcUa/4Hu0Jd/IzCc=; b=ShSjCFLoNtC+bO7H
	kpSDfPhqfkuBmEepArQEgKU2v0smbJN1omencgfMxQC5D37JAUW/cMfJ/ncrlJpH
	uWcTT9P40BRlEZjaiyq+q5L9H6l00N+63h/EKmwov79qwdcFJwj3ag65RROKfEGg
	MD3Mqq/vGSdLR5nU/+tlIg8DPW2kzeGaTt8lrrVd7qowj3uNyXbvIQBmo/3sNxji
	UlCk9bPVNrpg+Z+LinpadsDWjHRYqr54oBDRzZ9RNNiqse2HPBsLVPGu3NYHomvy
	eCEddUpAPxIRb461+w2Ki94Ann47aAVw8xIaE7/TKHjPj3F6BwA5AzmjXyIUmseh
	Vk4wpw==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46f5wg3pqe-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 06 May 2025 22:53:32 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-6f0c76e490cso13468636d6.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 06 May 2025 15:53:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746572012; x=1747176812;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ygofsMCIB0jAe4SjuNSFtVbwkj+wcUa/4Hu0Jd/IzCc=;
        b=FDqDBnmV1f+WlBVNaOJ0JLCji6nqmR85Sakgb0oZrbdA1Di9ChDmyjC+n3hZ8gXD9t
         xIirAsYiZtZ/pQCc+305Qh7I3Kycx5rFf61HPPgF4CFI0aH9tq8Q+jTG8UWWd09hhNbe
         nfNlsv7okK9ejBCFPrzeibInUEpONBtCKwhjJsA+MxPZqlzi9Jj5c9lfYWFBV98Dyq3Z
         /YsiMY5KLy6NJMDRkXcnuCGwmnVCt9UT/njDpoyr3ES8fzqFI6jK12zePpZobwrl6DgW
         BT+u1q/g0RflJatJi44LrvGBmRQrn1nsHLLdbBfg7MSWUD/k1nmtFNAJT0iVmBqE549O
         hWyA==
X-Forwarded-Encrypted: i=1; AJvYcCU+/fUbUlpSlW98AU08m7oSdZ0X4hkEqwwI6Cr4X4K4frnTq9eeI6VxQnNY1Ihd0Ld1AKTz/j78FT4Gk14p@vger.kernel.org
X-Gm-Message-State: AOJu0YzTD+nRfZRrTT3GK3UU/zTMvn4bAPZg++cxDmSsROYmaDS8tmvs
	F2m+ifKAhbvcjdotVLXPQCtdw11MjYOEEu2lEiKDKA7tE9sHhW320D3WNmqOmwFW4zxyR9gzt+P
	EA7b1ZOfx2bTur+cs4V11UoRNdREaLckAUJr8lDvVWXj/AgpoBs+TBWl3gO7mFYkg
X-Gm-Gg: ASbGnctZWcufAGnryO9wRnYCcxmR7W7HYVTHl11TEEMFFPGrZdfFnBR20GV7dRe9PQ+
	2OxdaLIFDbQcMS8aEIs+MS0FiOta4kEnEFGgglniRB9nFIB4Ed+X58bZUvz5TmOiRAY3GNjNYg8
	GXjJ58sJGC15oCoFK/liHbcdT5phgPMeM8LZS3HdynDPqgXtfsTqG8ZS4PLxJceENU8jvsldZgq
	/exVcWCh72z5fjV9MpK1ujnuj7TnBvdJHJ+B9a26jZSheXS4TbYFNKnjcn7qev1e2LbL6fx1FPo
	JY6pIMu9fMgbArF9JXl54xOCFlYVyMaV+zOUwvDNaRT7sfCzGWzV8HUBCoLMzYp6cYk=
X-Received: by 2002:ad4:5b87:0:b0:6f5:3c5e:27fc with SMTP id 6a1803df08f44-6f542a33ea5mr5293436d6.4.1746572011902;
        Tue, 06 May 2025 15:53:31 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE43cQIT9y8yXMQPh1E2nIEuYn9kHdGjFj3F2wY9ltVfAgob6dYvmnhqdTo3UgiQkpbsfe9cg==
X-Received: by 2002:ad4:5b87:0:b0:6f5:3c5e:27fc with SMTP id 6a1803df08f44-6f542a33ea5mr5293256d6.4.1746572011426;
        Tue, 06 May 2025 15:53:31 -0700 (PDT)
Received: from [192.168.65.143] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5fb61307074sm2741831a12.75.2025.05.06.15.53.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 May 2025 15:53:30 -0700 (PDT)
Message-ID: <651f1421-b471-485a-aea0-1b1ef92f8331@oss.qualcomm.com>
Date: Wed, 7 May 2025 00:53:27 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] arm64: dts: qcom: sm8650: add iris DT node
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        neil.armstrong@linaro.org, Konrad Dybcio <konradybcio@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250424-topic-sm8x50-upstream-iris-8650-dt-v2-1-dd9108bf587f@linaro.org>
 <3498cfda-a738-449d-9d9f-754bbc8125c2@oss.qualcomm.com>
 <db91a526-e2f8-48f8-a071-f3fcc75235be@linaro.org>
 <CAO9ioeWaPKXHgNGPx5q34+RP59PMLD+EVK5fQsN89KC9A1ca-Q@mail.gmail.com>
 <d79790e5-52c9-4135-8f3c-af797145fa2d@oss.qualcomm.com>
 <4lmt5cgg2tanrughooxw73h2brwyyc6ifqgo3ju6iz4enkvkic@umeijjk4ijxg>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <4lmt5cgg2tanrughooxw73h2brwyyc6ifqgo3ju6iz4enkvkic@umeijjk4ijxg>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: qo-oFLloY3yvRQThigfOz1oOEmQqpc6N
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA2MDIxNyBTYWx0ZWRfX2eo6636R4tIl
 VjegMgCh+7D9YDg9yqkODAyabMGmuES7GYAzuvOiDvBtekKpiVLwP/D1tIBRNf4MxcQMp0Qmzo1
 p4fKBPlrkFlaRJuXZK1DdjC4tx41u0DZPM7Af5L2QeMO9aK3q553QjOQhQEg3JOm060xK0mdIir
 UAk/TGetkADCrcM99w1LtOdP23SnlvLZ5EWImk/1Rhid8dOoCTjKoaenCSV73U469wx9D7ylMDA
 y5vwIjxXMx+6KrO3jOToRTuiIjFEyuelYaUSL1B5mQLYAVVK4mRPWnITEX1RiGi2fs4dwCEZvCZ
 UHsKMaTJPySNdqCc7VNAe3WPrNiJfqGC7dM5d97HSgVX9N02tho2DueuewY/a46pGJq/r3g84se
 OR98GlsHBa3GMpg9UdrI+SRu/AmUnsne/nRt7gz6OHhItBylLxrbcEo5VzTqYDcp1DN6Yi1q
X-Authority-Analysis: v=2.4 cv=dPemmPZb c=1 sm=1 tr=0 ts=681a92ec cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8
 a=EUspDBNiAAAA:8 a=sxpqNeDj30WxuUvu1H0A:9 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: qo-oFLloY3yvRQThigfOz1oOEmQqpc6N
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-06_09,2025-05-06_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 mlxlogscore=999 priorityscore=1501 impostorscore=0
 suspectscore=0 lowpriorityscore=0 bulkscore=0 spamscore=0 malwarescore=0
 mlxscore=0 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505060217

On 5/6/25 10:23 PM, Bjorn Andersson wrote:
> On Mon, Apr 28, 2025 at 11:14:18PM +0200, Konrad Dybcio wrote:
>> On 4/28/25 12:48 PM, Dmitry Baryshkov wrote:
>>> On Mon, 28 Apr 2025 at 11:18, Neil Armstrong <neil.armstrong@linaro.org> wrote:
>>>>
>>>> Hi,
>>>>
>>>> On 25/04/2025 23:49, Konrad Dybcio wrote:
>>>>> On 4/24/25 6:32 PM, Neil Armstrong wrote:
>>>>>> Add DT entries for the sm8650 iris decoder.
>>>>>>
>>>>>> Since the firmware is required to be signed, only enable
>>>>>> on Qualcomm development boards where the firmware is
>>>>>> available.
>>>>>>
>>>>>> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
>>>>>> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
>>>>>> ---
>>>>>> Changes in v2:
>>>>>> - removed useless firmware-name
>>>>>> - Link to v1: https://lore.kernel.org/r/20250418-topic-sm8x50-upstream-iris-8650-dt-v1-1-80a6ae50bf10@linaro.org
>>>>>> ---
>>>>>
>>>>> [...]
>>>>>
>>>>>> +            iris: video-codec@aa00000 {
>>>>>> +                    compatible = "qcom,sm8650-iris";
>>>>>> +                    reg = <0 0x0aa00000 0 0xf0000>;
>>>>>> +
>>>>>> +                    interrupts = <GIC_SPI 174 IRQ_TYPE_LEVEL_HIGH 0>;
>>>>>> +
>>>>>> +                    power-domains = <&videocc VIDEO_CC_MVS0C_GDSC>,
>>>>>> +                                    <&videocc VIDEO_CC_MVS0_GDSC>,
>>>>>> +                                    <&rpmhpd RPMHPD_MXC>,
>>>>>> +                                    <&rpmhpd RPMHPD_MMCX>;
>>>>>> +                    power-domain-names = "venus",
>>>>>> +                                         "vcodec0",
>>>>>> +                                         "mxc",
>>>>>> +                                         "mmcx";
>>>>>> +
>>>>>> +                    operating-points-v2 = <&iris_opp_table>;
>>>>>> +
>>>>>> +                    clocks = <&gcc GCC_VIDEO_AXI0_CLK>,
>>>>>> +                             <&videocc VIDEO_CC_MVS0C_CLK>,
>>>>>> +                             <&videocc VIDEO_CC_MVS0_CLK>;
>>>>>> +                    clock-names = "iface",
>>>>>> +                                  "core",
>>>>>> +                                  "vcodec0_core";
>>>>>> +
>>>>>> +                    interconnects = <&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
>>>>>> +                                     &config_noc SLAVE_VENUS_CFG QCOM_ICC_TAG_ACTIVE_ONLY>,
>>>>>> +                                    <&mmss_noc MASTER_VIDEO QCOM_ICC_TAG_ALWAYS
>>>>>> +                                     &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
>>>>>> +                    interconnect-names = "cpu-cfg",
>>>>>> +                                         "video-mem";
>>>>>> +
>>>>>> +                    /* FW load region */
>>>>>
>>>>> I don't think this comment brings value
>>>>
>>>> Right
>>>>
>>>>>
>>>>>> +                    memory-region = <&video_mem>;
>>>>>> +
>>>>>> +                    resets = <&gcc GCC_VIDEO_AXI0_CLK_ARES>,
>>>>>> +                             <&videocc VIDEO_CC_XO_CLK_ARES>,
>>>>>> +                             <&videocc VIDEO_CC_MVS0C_CLK_ARES>;
>>>>>> +                    reset-names = "bus",
>>>>>> +                                  "xo",
>>>>>> +                                  "core";
>>>>>> +
>>>>>> +                    iommus = <&apps_smmu 0x1940 0>,
>>>>>> +                             <&apps_smmu 0x1947 0>;
>>>>>
>>>>> I think you may also need 0x1942 0x0 (please also make the second value / SMR
>>>>> mask hex)> +
>>>>
>>>> I don't see 0x1942 in the downstream DT, and which mask should I set ? 0x1 ?
>>
>> I saw it in docs only, maybe Vikash or Dikshita can chime in whether it's
>> necessary. It would have mask 0x0 if so.
>>
>>>>
>>>>>> +                    dma-coherent;
>>>>>> +
>>>>>> +                    /*
>>>>>> +                     * IRIS firmware is signed by vendors, only
>>>>>> +                     * enable in boards where the proper signed firmware
>>>>>> +                     * is available.
>>>>>> +                     */
>>>>>
>>>>> Here's to another angry media article :(
>>>>>
>>>>> Please keep Iris enabled.. Vikash reassured me this is not an
>>>>> issue until the user attempts to use the decoder [1], and reading
>>>>> the code myself I come to the same conclusion (though I haven't given
>>>>> it a smoke test - please do that yourself, as you seem to have a better
>>>>> set up with these platforms).
>>>>>
>>>>> If the userland is sane, it should throw an error and defer to CPU
>>>>> decoding.
>>>>>
>>>>> This is >>unlike venus<< which if lacking firmware at probe (i.e. boot)
>>>>> would prevent .sync_state
>>>>
>>>> Well sync with Bjorn who asked me to only enable on board with available firmware ;-)
>>>
>>> I'd second him here: if there is no firmware, don't enable the device.
>>> It's better than the users having cryptic messages in the dmesg,
>>> trying to understand why the driver errors out.
>>
>> I don't agree.. the firmware may appear later at boot (e.g. user installs a
>> small rootfs and manually pulls in linux-firmware). Plus without the firmware,
>> we can still power on and off the IP block, particularly achieve sync_state
>> regardless of it
>>
> 
> Not "available during boot", but rather "available for a particular
> board".

I'd argue that if a device is in the hands of users, there already exists
some acceptable set of fw binaries.. but most developers aren't in the
position to upload them into l-f.. And quite frankly I'm not the biggest
fan of having a gigabyte of 99%-the-same files with a dozen lines changed
and a different signature prepended to them either..

> We generally avoid enabling device_nodes that depend on vendor-signed
> firmware until someone has tested the device on such board and specified
> the proper path to the vendor-specific firmware.
> 
> Are you suggesting that we should leave this enabled on all boards for
> some reason (perhaps to ensure that resources are adequately managed)?

Yes, for that reason indeed.

We don't generally need to load firmware to turn something *off*. And
most IP blocks don't **actually** need to be presented with firmware at
probe time (I can only think of external ICs like no-storage touch
controllers that need the fw uploaded on each powerup). 

Telling the user "hey, this is supported but the firmware file can't
be loaded on your device" may also be better sounding than "won't work
on your machine" (with the quiet part being: "because someone hasn't
copied 5 lines of DTS")

Konrad

