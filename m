Return-Path: <linux-arm-msm+bounces-85456-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id A4808CC6D08
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Dec 2025 10:34:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1E0BD3034EEA
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Dec 2025 09:32:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 51338339844;
	Wed, 17 Dec 2025 09:32:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="W94gv6xW";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PBdyNR1u"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1C3B31A54A
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Dec 2025 09:32:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765963938; cv=none; b=qeos4s1U6sWd4PxKkKRhQuPr3AFgA8ZN1D+z8zV7bSrNVsthOR1Ufpm9zGGjc69ova4nwcqcj1j+EPys58UoztuFl88EdKA1z3gleQvD8ScFEqjoGbyoWbMwGueMZuLpn7dUWo8kc7gQCuSNsqA5ghBknjWxcRF1t0IFQulSO54=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765963938; c=relaxed/simple;
	bh=F94PWeowK21x/MwYXhf/JlJiIyVYHrsYWklQhpd9ZhM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Q+O1FzBCNL6f3+evEW4D2lldIYWbBFxc146IU5c9jzin8zsPvod7DcJ0uZw+mVliHU0d2HZDR9WVG1dERI77sH5NukkNzC6QdvadGnu8d70FArkf7il8fvo5zwWUMwLQ5BCIgS6j3Pj7vbzqAZ+MthSh6ZtoPRIHBAya7tVOmw8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=W94gv6xW; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PBdyNR1u; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BH86bZG1946952
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Dec 2025 09:32:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	k5eSqAi+UmVzEQJzPdvYOyZ8r83jZpTMhH6t4IKjvyc=; b=W94gv6xWyx61wULt
	Ek1YjlEgwrMYRchM8lepWXGvncaTCf0L5BwyIPWatQ/g6dGbx2XEvGmhcQcIYVBo
	KsXcUGNe7ZiOAkckuVJtN3anaiQUw25cnP336Ey51ctNlSxxpBYke9O8AhxUSCSO
	qZbG2N6+DVOrSSLPMVkbqvWsmxM375FhNbIIclSVfu/xnCcX/mq7LFQWlXAJUli2
	xRmoE0T8E9LbOtZFJtdat1WMezMqQXmY9mYbpaW2tJ6b2RbYsAkqfq5z2fH98nZw
	8ehJU3EC2T9vfybnwZ5ECuwlcblQVGdpusc5JppVI9sjYe+r6aviOl3C1nVLfAX/
	b06H9Q==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b3rqa89uk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Dec 2025 09:32:15 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-34aa1d06456so12666490a91.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 17 Dec 2025 01:32:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765963935; x=1766568735; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=k5eSqAi+UmVzEQJzPdvYOyZ8r83jZpTMhH6t4IKjvyc=;
        b=PBdyNR1uYHyBmtEsBB5dylE7Sp0BRrFxAjlUrQGbQX7Zfdiwd6MWDqNZ2sb3n0ldI2
         8TrrxsaPfOAhyX2ck6Z9ofLO5bWZS/56mMzD8i3Y6s8Z0Na3fU77sac1uqqWs5gARvnx
         dbTYcUVLJek/fCWhW8Xl/U5nBHdDIBJHeJ2mePpB7idTQxocSql9rKaCtTIeUjXMN2B2
         EjDki7HKTE55sAeufMIKSqRmCz09YypFBnSfG+UD3kuYHolNoaQVmUZDQVyYEUM/A0vk
         82w0N0AcpG3Ol3bnJeSLiKfac+82dHD5YobzMewNkK9U21EYPxmjWgJCiyNEwxJdxayr
         F1Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765963935; x=1766568735;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=k5eSqAi+UmVzEQJzPdvYOyZ8r83jZpTMhH6t4IKjvyc=;
        b=QiKovCKjWY//fphZr0ultwyxwc9e5VyrzqVgpQ2AzpWDWHEUCX+x98mwCDapXI25aF
         jwgwOUA2ZKVLBBfpWYkqA4wrX7YnzX/XDbgYjgJje6UeuS2wmREmXUPwCIOcv+Wq9+EW
         UEgkxldsLUY242I0cdiVZQz7jCaDnZrrOtzCyw1cd+Zti7S0VMcYqxgOlwClU+FhR6gR
         2auBhXb1zsj8lOuZWohql7Eu0k1cR2W4SY1t8EDOCVqbYBl7lD5koYxr+0mCt2mNjO0d
         SxTMPukokpyjQmatLmHMunCd54g1vSoahpw1ORxbRiWW2HB7sw1XfI19zU8FT/nfvGvA
         Bdbg==
X-Forwarded-Encrypted: i=1; AJvYcCWTr99FflyKLlaFYspBMQKlLOkVt+TbQ9gpMKjn3SOGwlqdgb6kXtma3Hw3IPBAcMlT1IWxQXLRWCN7x5cy@vger.kernel.org
X-Gm-Message-State: AOJu0Yy2ObeX8HMVKi1STTP/W83xA3Gth1v7MSWvyVgGyW49tQDV2hs5
	sORif/KWl0Ds0lzuWsvRXj+OJNSXdmHdOIYGD823uPF1glhsvFngYiYKZVrqWi6np5e4h5Y+fhE
	XyBRkBmAlviaVpunjmM/YcBzAsmQKViLodyXwOW7M5so0tBa/RVIrRu1mt/V+QtdDHEv7
X-Gm-Gg: AY/fxX7cwx84dPQdJ5mq6YskrnzwO1ZPRcFJQvr+FO70eNlLd4T2XpGywx3GtPEuHyK
	1/qHQZQ/8jFB3oZmNHoKKN/7IGk0IQnlrbo4e5z2avd2c3tOpRabxTT/AwkB9/AS/RV48jdhh7k
	XbuT5KnnGnKgHiRNA29+Rm9rqgrMaHGQpBivoCKCWd5uJK8XiuGoxO6LRBdawwBC8IolvATerVU
	0dTQ+q/kRGFVeIY6reRm0qHhZaEtjuntNiV7vDaqixaSg4kMHwJWbaxGwmO2Y2oW0TKwrmQzkgJ
	lyiaFf91dm6a++wtQU0cPR4pDKL3ktBOFZuaowS8X5gTO1ZHAROYjEhUrwXtjoeh9j0n0CSvisC
	bvvGBxlo3NHyjyZpglTrPGPN5sfUrzFAzofaO
X-Received: by 2002:a17:90b:37c5:b0:341:2b78:61b8 with SMTP id 98e67ed59e1d1-34abd75b84cmr16118271a91.20.1765963935256;
        Wed, 17 Dec 2025 01:32:15 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH2IAzyeAsxmbkCnxnu4u0xxCDf9pVYnBNLb9NM9pOCNAkCdEN4BEa2l81OARdkqZ8OLtxezA==
X-Received: by 2002:a17:90b:37c5:b0:341:2b78:61b8 with SMTP id 98e67ed59e1d1-34abd75b84cmr16118239a91.20.1765963934714;
        Wed, 17 Dec 2025 01:32:14 -0800 (PST)
Received: from [10.218.35.249] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-34cfdc607c0sm1774392a91.12.2025.12.17.01.32.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Dec 2025 01:32:14 -0800 (PST)
Message-ID: <503f445e-0d12-407d-bc77-f48ad335639b@oss.qualcomm.com>
Date: Wed, 17 Dec 2025 15:02:06 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 07/11] dt-bindings: clock: qcom: document the Kaanapali
 GPU Clock Controller
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
References: <20251125-kaanapali-mmcc-v2-v2-0-fb44e78f300b@oss.qualcomm.com>
 <20251125-kaanapali-mmcc-v2-v2-7-fb44e78f300b@oss.qualcomm.com>
 <20251126-elated-stoic-scorpion-25b630@kuoka>
 <de44560d-4ed8-41fe-be7b-56412b933a8c@oss.qualcomm.com>
 <fbe39eac-7c92-4a08-bafb-31e5c51a0613@kernel.org>
Content-Language: en-US
From: Taniya Das <taniya.das@oss.qualcomm.com>
In-Reply-To: <fbe39eac-7c92-4a08-bafb-31e5c51a0613@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: om6hqPpfpadDOtsxv1Yjt5Jah5ZMav5h
X-Authority-Analysis: v=2.4 cv=ALq93nRn c=1 sm=1 tr=0 ts=694278a0 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EdL18t7L_n9XgEVTQngA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE3MDA3NSBTYWx0ZWRfX2ifL0dz8WxVL
 GwWFSkiA3nPInvYD/Q/5zxc6+Prh1ljN4tUNw9FdeeAWyOdigennqDTorehuF6tzL+vjyshd8fe
 6FKfNyfJC0x3knReHZsMGHNmA29pIHc92XEiHaCPsgYbwBXO1CxGeVrgn8+9BLswSH1TwAfHz5p
 oGz7S2iavzn2MzXTTLs5Xfr4QGH3FMeJVn4lKZehp2bOb4jWr15t+fg3NnwV78Ox1KMEBF3bYrp
 xp+B3waz1+iaDtW6S0IAEHAu/BrIVywD3IC5srzCHVo2RFO8ztzN3hcTFt5qrFGnIEP5h5HmRlK
 YvfvnT6oBWYeG4MZohfGB96q1TqATj7WYQ1+HZQDNJzYkg3JT/3u3YpPWnRIzsm/tHSpnBP6tYI
 7rrNPaihnCo6AwAPwtFI16hV4oenFw==
X-Proofpoint-GUID: om6hqPpfpadDOtsxv1Yjt5Jah5ZMav5h
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-17_01,2025-12-16_05,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 impostorscore=0 spamscore=0 adultscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2512170075



On 12/16/2025 2:21 PM, Krzysztof Kozlowski wrote:
> On 04/12/2025 07:49, Taniya Das wrote:
>>>> +  power-domains:
>>>> +    description:
>>>> +      Power domains required for the clock controller to operate
>>>> +    items:
>>>> +      - description: GFX power domain
>>>> +      - description: GMXC power domain
>>>> +      - description: GPUCC(CX) power domain
>>>> +
>>>> +  '#power-domain-cells':
>>>
>>> Power domain controllers do not belong to clocks, so this is:
>>> 1. Misplaced - wrong folder
>>> 2. Probably wrongly named. gxclkctl sounds like clock controller, but
>>> this is domain controller?
>>>
>>
>> The GFXCLKCTL is actually a clock controller which has PLLs, clocks and
>> Power domains (GDSC), but the requirement here is to use the GDSC from
>> the clock controller to recover the GPU firmware in case of any
>> failure/hangs. The rest of the resources of the clock controller are
>> being used by the firmware of GPU. The GDSC is a clock controller
>> resource and modeled from the clock controller drivers across chipsets.
> 
> This should be somewhere explained.

I will capture it in the binding description in the next patch set.

> 
>>
>>>> +    const: 1
>>>> +
>>>> +  reg:
>>>> +    maxItems: 1
>>>> +
>>>> +required:
>>>> +  - compatible
>>>> +  - reg
>>>> +  - power-domains
>>>> +  - '#power-domain-cells'
>>>> +
>>>> +unevaluatedProperties: false
>>>> +
>>>> +examples:
>>>> +  - |
>>>> +    #include <dt-bindings/power/qcom,rpmhpd.h>
>>>> +    soc {
>>>> +        #address-cells = <2>;
>>>> +        #size-cells = <2>;
>>>> +
>>>> +        clock-controller@3d68024 {
>>>> +            compatible = "qcom,kaanapali-gxclkctl";
>>>> +            reg = <0 0x3d68024 0x0 0x8>;
>>>
>>> Keep consistent hex, so first 0 -> 0x0.
>>
>> Sure, will fix this.
>>
>>> But the problem is that you defined a device for two registers,
>>> basically one domain. I have doubts now whether this is complete and
>>> real device.
>>>
>>
>> As the Linux GPU driver requires only the GDSC, I have mapped the region
>> which is required by the clock controller driver. If required, the
>> entire region can be mapped as well.
> 
> Required is to properly describe the hardware, please read writing
> bindings doc.
> 

Sure, will map the entire region to be describe the entire hardware.

>>
>>>> +            power-domains = <&rpmhpd RPMHPD_GFX>,
>>>> +                            <&rpmhpd RPMHPD_GMXC>,
>>>> +                            <&gpucc 0>;
>>>> +            #power-domain-cells = <1>;
>>>
>>> And cells 1 makes no sense in such case.
>>>
>>
>> We would like to leverage the existing common clock driver(GDSC) code to
> 
> Fix the driver code if it cannot handle other cells. Your drivers do not
> matter for choices made in bindings.
> 

As it is still a clock controller from hardware design and in SW I will
be map the entire hardware region and this way this clock controller
will also be aligned to the existing clock controllers and keep the
#power-domain-cells = <1> as other CCs.

>> register the power-domains and also maintain uniformity across chipsets
>> and consistency in consumer GDSC phandle usage.
> 
> There is no such consistency rule. Don't make up your own rules.
> 
-- 
Thanks,
Taniya Das


