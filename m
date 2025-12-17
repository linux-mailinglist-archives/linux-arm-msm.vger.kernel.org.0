Return-Path: <linux-arm-msm+bounces-85519-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FCDFCC7E43
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Dec 2025 14:41:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 2F3F73023EC2
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Dec 2025 13:41:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 41ADA366571;
	Wed, 17 Dec 2025 13:37:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jBOtV3in";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dldHJqAg"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E2CE364E95
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Dec 2025 13:37:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765978666; cv=none; b=tjwrMQF4bdNMU9Zg/y7OorrBBjoKbjFyFgilt5c7v+7KBJ0W3cLPPiZHeCVKgA00bj8a4EO8Kq4JhlJtnZ7LhvW/+WP+LC68PgSf5jCX86IzpN1YSBBhmTpnns7HOxwgzMgHkPy5uCT6l7JFAXmFN1OuLC6gp6zg96/wvt24lYc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765978666; c=relaxed/simple;
	bh=XGKTe1hKK+vNGzgPfKNlsnHq5DtSKLJGVVlKJzjxChg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BQhQScrL6B6+8B0oM20bO9IuUENRlUH0YShcSMHwCo2EwvMbWyhkTe+XfZBFBJ6Mr1+wsiUcb5pYmJv0p/xtFeWLdZJYypwKiHhtHn6jQ27TkCRGNeNOhK7yhwnQY6pStT5dfLV+3v7+iS231uXIpKEUByqTxBvVa4Oow2y8E7g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jBOtV3in; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dldHJqAg; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BHCKnNx2764392
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Dec 2025 13:37:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BRFmdbW08xn/yZlVw1NnMRhg106RRsCWX65cLJz5EgQ=; b=jBOtV3inAtKBtCm+
	i2G5e4ezB8SiWHX0eHptsFWoTZO2aVAnlVygPsczCeyi8vmVaNcHEJHQejA2RNRd
	HrgEqEEGRi7P22B48/9LtZlbvNVFwl/ASlu0t+O3BRw30+cWUhOhwZBQpPX/55on
	dNGIewIHXsFmOylUSORkmKBzERtncZOL5x9TUPj12AxXZY2Htvhr/Bp8YOIHXiTm
	bJQ7OqzGK5G0T84dupoTfqDeBh53lqFJnTQnAKc4j/K3kIfmuN6XvBccgYwAAD7n
	S60XxSqHyHUnBaViPMGNaXTMEbbvG8Z9budeV2Qb1/SAsf1Dnfo/NT3buDSBTJtK
	LSe5WA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b3fefjjd5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Dec 2025 13:37:43 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4f34c24e2cbso3904401cf.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 17 Dec 2025 05:37:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765978663; x=1766583463; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BRFmdbW08xn/yZlVw1NnMRhg106RRsCWX65cLJz5EgQ=;
        b=dldHJqAgMNy1H6pMiUyR4i7oZAdIlHGFmD46ze60qBjYh64wqFNZX4YgOP+Ku7Tru5
         deUYZXaZgGqmGRnIINLCKXn9JYTNgtFqdyWX0U0veKomWFaG56rbkDIIRLcka9JQ6BFF
         IVeAG/dFJfYnTX8ejt8vCS+rsSXOat5d5BalwuX/RaRmy7dx76ts5yEXWvrdvDFl/YO2
         Im08wMvaCux8Wpb8tf4ADn0WAK8B0+h2w1fjSrzD4VxCBdng87Jw89Rb4ICgP1AUN8pB
         +QA6ZrpoFGD7oNwmw2lhKeuKdA/pA5uNCuBtZeuPMTRd330IXYC6U0ljpS3Q+tMEoljR
         7xnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765978663; x=1766583463;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BRFmdbW08xn/yZlVw1NnMRhg106RRsCWX65cLJz5EgQ=;
        b=EWuGxyYi9GjVCWCRUhzASoW7QwYshZPCyiQjY06a/3Kb7EG4yhJXPtBUyMDWutJP/u
         w3raCw/syudtaxmRtfhtoEcV9oVApgjHYa4ZXJq8wgLJeudrkBBPCSMQZ7VG8G4ubisV
         OvwDmdh0ZkfT/+TRVPcVoItRfgtzr49n9VelZ9Ad8eO3JM7wyh0ntiXA96gqsnIVtRDN
         IFHIkqyUkryPlv910GIJSdIUZEN/YUDhBKCHRXdVNQpsRVKUc6pT/zCBTXj3RXmFTqDt
         sv61nm4L1vAoxzhVauAwoKa3QoKx7Wamg1V3jIhAF9mwGOVZI/EzA0YcopdY4pMcVW70
         hJaQ==
X-Forwarded-Encrypted: i=1; AJvYcCXHZhxTw0qfthb6hrh4JOXbUWZw1pneVSCoU2fnBS3aOjBo+a5cFZ82giz2fAtFM+/Uv4koeC4kuMT16qyo@vger.kernel.org
X-Gm-Message-State: AOJu0YwYB4ayOpG8MXiP3+W7NxDIbDdDoocOk/sq23o+RMlnjioC5RYk
	YEfBfGa06+GJEOhlF5DPkk5R82B9nAXzsa88jHsD0HFifNQIiu0EkmOk0nrRGo8p1XnbjauPsoY
	+0/HSb5v2n79IJjUHlew0Q4Eh6gcxz9Em2lNrKtGtyfh47FiqLeFeekcJdnvh1hsELNrY
X-Gm-Gg: AY/fxX7Lb0PYXQwnwFkVd+kcsugslEjIEYOyY9JeUa5OnD46IUVLRqK+mbjtzglE9sI
	u4Z0i1yGnP++tVZvrcDtDKiPUyugs/nYtf07tzMPIcdKhXl/Fi2jYaGur1xZSj6pkenPU5Cc13c
	DhFwefIR713eOmRA9juwQHgW5k+A2i0ihl1x0/6TjMU0RgP1rcM5jvJHbZR82tyJDW4RcuLmafK
	CrOl51IP974ng0wKMuk9LvGULl1ybOLI6woomT0i7iFV9QgrFUKcc461BZgVZPwHx6AOyOjHGOL
	DtkZb0pIOf7WXtFcNI8Dv+02oJSIKNK9f8wkc6MnMn5QAZ15UOMNkpaav+LVXS5BMPfe8cQ028S
	T23D5fDdO2o8nleQEhwsW2Va/dRPqUZ5Zcq4AalyUA2RbSh5VV/obb8VFHFQOKyNNxw==
X-Received: by 2002:ac8:5ac1:0:b0:4ee:1718:dec8 with SMTP id d75a77b69052e-4f1d052aa9dmr180470301cf.3.1765978662495;
        Wed, 17 Dec 2025 05:37:42 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG5hcKpNWolLM4K5N6uq6YaQ/dtS4F2/5/FWXjCbgirh+bHqofuVSx30scH2go7nZDSO88X9Q==
X-Received: by 2002:ac8:5ac1:0:b0:4ee:1718:dec8 with SMTP id d75a77b69052e-4f1d052aa9dmr180469961cf.3.1765978662018;
        Wed, 17 Dec 2025 05:37:42 -0800 (PST)
Received: from [192.168.119.72] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b7cfa51754dsm2019004566b.42.2025.12.17.05.37.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Dec 2025 05:37:41 -0800 (PST)
Message-ID: <f6f788fe-af56-43f1-9810-e5f3327ff92f@oss.qualcomm.com>
Date: Wed, 17 Dec 2025 14:37:38 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] arm64: dts: qcom: sdm630/660: Add CDSP-related
 nodes
To: Nickolay Goppen <setotau@mainlining.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
Cc: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht, linux@mainlining.org,
        Chenna Kesava Raju <chennak@qti.qualcomm.com>,
        Bharath Kumar <bkumar@qti.qualcomm.com>
References: <a3cb6633-1595-41e7-8e87-ca48a98f822c@mainlining.org>
 <83c3aea5-764e-4e60-8b16-67b474f19357@oss.qualcomm.com>
 <d17548bb-ddce-4d60-8dc4-2c0633989299@oss.qualcomm.com>
 <f5c7eb1c-28b1-4cf1-afb0-b993384b7712@oss.qualcomm.com>
 <80836b8f-16a8-4520-ad11-5ca0abb3403e@oss.qualcomm.com>
 <99c22e73-797c-4a30-92ba-bc3bd8cf70f0@oss.qualcomm.com>
 <eddc16cb-d951-401c-8fb8-fccfcf600143@mainlining.org>
 <0b06f744-b695-43d9-8da3-4424e2b53a5e@oss.qualcomm.com>
 <24221ce7-24e4-4eaa-8681-ed9b4b9f2d6e@oss.qualcomm.com>
 <be4e2715-882d-4358-8575-374187f7ee2f@oss.qualcomm.com>
 <2h222ejvc37cldeno7e4qom5tnvdblqn2zypuquvadbcu7d3pr@765qomrwfvwl>
 <f0c41563-dcd1-4cf9-8b73-fb9fedd52710@mainlining.org>
 <bacb6293-a4e3-4d23-8a1f-cf42f221ba4b@mainlining.org>
 <8080bcb5-280d-459c-8877-5086129c87a6@mainlining.org>
 <eca6cead-111f-436f-8507-826ce48863c1@mainlining.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <eca6cead-111f-436f-8507-826ce48863c1@mainlining.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE3MDEwNiBTYWx0ZWRfX0ZO2frNHvj1q
 lZrxUY2I+ZVQmRlVEs6TaLswU7OxpX0o4SrhTDTdq2bxSU6aZRXmAJGTUZ660fMiNLdGTdAC5Mk
 c2CWPlggCqhMDuelXXw2CCS++xYB8LWvDtJB7F2Zj3IqBQbaa2xPAu3WDSQ6PI8JSEydD4VFdtE
 DN78SWBsH4msXOhSWxj8qEB7u0jFx8rYVf60CakjdQ0Zd5bceGSzQ4n8gn50n3ZxKH6bL8DJblC
 5m9zRUkCsnOmpLNs6+VsfxFfkiiD4CCOWpvY+TPiTv/v2IDOA88ZX+xHMFLfuKnnhVne1cEu8Yk
 Mx/TN/8xJXGE8MS5moD/pgdFw+ORtBS+K7xPS+UINtIRbFDzgOfVV3zmAY7XdTdNvNzWt9NiMW8
 cDPSHvA9ua7RhCiNVg5TUKP/9a+adg==
X-Proofpoint-ORIG-GUID: TThpvu5q6lQz-DGj2yGESkIGcp4NPTrE
X-Proofpoint-GUID: TThpvu5q6lQz-DGj2yGESkIGcp4NPTrE
X-Authority-Analysis: v=2.4 cv=R48O2NRX c=1 sm=1 tr=0 ts=6942b227 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=NEAV23lmAAAA:8 a=OuZLqq7tAAAA:8
 a=Ngv1LdsQvuuVW_vAX9sA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22 a=AKGiAy9iJ-JzxKVHQNES:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-17_01,2025-12-16_05,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 malwarescore=0 spamscore=0 impostorscore=0
 adultscore=0 priorityscore=1501 clxscore=1015 suspectscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2512170106

On 12/8/25 8:49 AM, Nickolay Goppen wrote:
> 
> 02.12.2025 20:09, Nickolay Goppen пишет:
>>
>> 24.11.2025 18:02, Nickolay Goppen пишет:
>>>
>>> 23.11.2025 13:51, Nickolay Goppen пишет:
>>>>
>>>> 21.11.2025 15:09, Dmitry Baryshkov пишет:
>>>>> On Fri, Nov 21, 2025 at 01:41:21PM +0530, Ekansh Gupta wrote:
>>>>>>
>>>>>> On 11/20/2025 5:17 PM, Konrad Dybcio wrote:
>>>>>>> On 11/20/25 11:54 AM, Ekansh Gupta wrote:
>>>>>>>> On 11/20/2025 1:27 PM, Nickolay Goppen wrote:
>>>>>>>>> 20.11.2025 07:55, Ekansh Gupta пишет:
>>>>>>>>>> On 11/20/2025 1:58 AM, Srinivas Kandagatla wrote:
>>>>>>>>>>> On 11/12/25 1:52 PM, Konrad Dybcio wrote:
>>>>>>>>>>>> On 11/10/25 6:41 PM, Srinivas Kandagatla wrote:
>>>>>>>>>>>>> On 11/3/25 12:52 PM, Konrad Dybcio wrote:
>>>>>>>>>>>>>> On 10/31/25 12:30 PM, Nickolay Goppen wrote:
>>>>>>>>>>>>>>> 24.10.2025 16:58, Nickolay Goppen пишет:
>>>>>>>>>>>>>>>> 24.10.2025 11:28, Konrad Dybcio пишет:
>>>>>>>>>>>>>>>>> On 10/23/25 9:51 PM, Nickolay Goppen wrote:
>>>>>>>>>>>>>>>>>> In order to enable CDSP support for SDM660 SoC:
>>>>>>>>>>>>>>>>>>     * add shared memory p2p nodes for CDSP
>>>>>>>>>>>>>>>>>>     * add CDSP-specific smmu node
>>>>>>>>>>>>>>>>>>     * add CDSP peripheral image loader node
>>>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>>>> Memory region for CDSP in SDM660 occupies the same spot as
>>>>>>>>>>>>>>>>>> TZ buffer mem defined in sdm630.dtsi (which does not have CDSP).
>>>>>>>>>>>>>>>>>> In sdm660.dtsi replace buffer_mem inherited from SDM630 with
>>>>>>>>>>>>>>>>>> cdsp_region, which is also larger in size.
>>>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>>>> SDM636 also doesn't have CDSP, so remove inherited from sdm660.dtsi
>>>>>>>>>>>>>>>>>> related nodes and add buffer_mem back.
>>>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>>>> Signed-off-by: Nickolay Goppen <setotau@mainlining.org>
>>>>>>>>>>>>>>>>>> ---
>>>>>>>>>>>>>>>>> [...]
>>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>>>> + label = "turing";
>>>>>>>>>>>>>>>>> "cdsp"
>>>>>>>>>>>>>>>> Ok, I'll change this in the next revision.
>>>>>>>>>>>>>>>>>> + mboxes = <&apcs_glb 29>;
>>>>>>>>>>>>>>>>>> +            qcom,remote-pid = <5>;
>>>>>>>>>>>>>>>>>> +
>>>>>>>>>>>>>>>>>> +            fastrpc {
>>>>>>>>>>>>>>>>>> +                compatible = "qcom,fastrpc";
>>>>>>>>>>>>>>>>>> + qcom,glink-channels = "fastrpcglink-apps-dsp";
>>>>>>>>>>>>>>>>>> +                label = "cdsp";
>>>>>>>>>>>>>>>>>> + qcom,non-secure-domain;
>>>>>>>>>>>>>>>>> This shouldn't matter, both a secure and a non-secure device is
>>>>>>>>>>>>>>>>> created for CDSP
>>>>>>>>>>>>>>>> I've added this property, because it is used in other SoC's, such as SDM845 and SM6115 for both ADSP and CDSP
>>>>>>>>>>>>>>> Is this property not neccessary anymore?
>>>>>>>>>>>>>> +Srini?
>>>>>>>>>>>>> That is true, we do not require this for CDSP, as CDSP allows both
>>>>>>>>>>>>> unsigned and signed loading, we create both secured and non-secure node
>>>>>>>>>>>>> by default. May be we can provide that clarity in yaml bindings so that
>>>>>>>>>>>>> it gets caught during dtb checks.
>>>>>>>>>>>>>
>>>>>>>>>>>>>
>>>>>>>>>>>>> However in ADSP case, we only support singed modules, due to historical
>>>>>>>>>>>>> reasons how this driver evolved over years, we have this flag to allow
>>>>>>>>>>>>> compatiblity for such users.
>>>>>>>>>>>> Does that mean that we can only load signed modules on the ADSP, but
>>>>>>>>>>>> the driver behavior was previously such that unsigned modules were
>>>>>>>>>>>> allowed (which was presumably fine on devboards, but not on fused
>>>>>>>>>>>> devices)?
>>>>>>>>>>> Yes, its true that we allowed full access to adsp device nodes when we
>>>>>>>>>>> first started upstreaming fastrpc driver.
>>>>>>>>>>>
>>>>>>>>>>> irrespective of the board only signed modules are supported on the ADSP.
>>>>>>>>>>> I think there was one version of SoC i think 8016 or some older one
>>>>>>>>>>> which had adsp with hvx which can load unsigned modules for compute
>>>>>>>>>>> usecase only.
>>>>>>>>>>>
>>>>>>>>>>> I have added @Ekansh for more clarity.
>>>>>>>>>>>
>>>>>>>>>>> --srini
>>>>>>>>>> For all the available platforms, ADSP supports only signed modules. Unsigned
>>>>>>>>>> modules(as well as signed) are supported by CDSP and GDSP subsystems.
>>>>>>>>>>
>>>>>>>>>> qcom,non-secure-domain property marks the corresponding DSP as non-secure DSP.
>>>>>>>>>> The implications of adding this property would be the following:
>>>>>>>>>> on ADSP, SDSP, MDSP:
>>>>>>>>>> - Only non-secure device node(/dev/fastrpc-Xdsp) is created.
>>>>>>>>>> - Non-secure device node can be used for signed DSP PD offload.
>>>>>>>>>>
>>>>>>>>>> on CDSP, GDSP:
>>>>>>>>>> - Both secure(/dev/fastrpc-Xdsp-secure) and non-secure(/dev/fastrpc-Xdsp) devices
>>>>>>>>>>     are created, regardless of this property.
>>>>>>>>>> - Both the nodes can be used for signed and unsigned DSP PD offload.
>>>>>>>>>>
>>>>>>>>>> Note: If the property is not added for CDSP/GDSP, only secure device node can
>>>>>>>>>> be used for signed PD offload, if non-secure device is used, the request gets
>>>>>>>>>> rejected[1].
>>>>>>>>>>
>>>>>>>>>> [1] https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tree/drivers/misc/fastrpc.c#n1245
>>>>>>>>>>
>>>>>>>>>> //Ekansh
>>>>>>>>> Does this mean that the qcom,non-secure-domain property should be dropped from both nodes?
>>>>>>>> I checked again and found that unsigned module support for CDSP is
>>>>>>>> not available on this platform. Given this, the safest approach would
>>>>>>>> be to add the property for both ADSP and CDSP, ensuring that all
>>>>>>>> created device nodes can be used for signed PD offload. I can provide
>>>>>>> The property allows *unsigned* PD offload though
>>>>>> I don't think I can directly relate this property to unsigned PD offload. This is just
>>>>>> defining what type of device node will be created and whether the channel is secure
>>>>>> or not. There is a possibility of making unsigned PD request(on CDSP/GDSP) irrespective
>>>>>> of whether this property is added or not. If DSP does not support unsigned offload, it
>>>>>> should return failures for such requests.
>>>>> Which part of the hardware and/or firmware interface does it define? If
>>>>> it simply declared Linux behaviour, it is incorrect and probably should
>>>>> be dropped.
>>>> I still don't understand, do I need this property or not?
>>>
>>> I've began testing the FastRPC on CDSP and the command
>>>
>>> sudo fastrpc_test -d 3 -U 1 -t linux -a v68
>>> has caused the following errors:
>>>
>>> [   60.810545] arm-smmu 5180000.iommu: Unhandled context fault: fsr=0x402, iova=0xfffff000, fsynr=0x1, cbfrsynra=0x6, cb=3

This iova looks a little suspicious..

>>> [   60.810588] arm-smmu 5180000.iommu: FSR    = 00000402 [Format=2 TF], SID=0x6
>>> [   60.810603] arm-smmu 5180000.iommu: FSYNR0 = 00000001 [S1CBNDX=0 PLVL=1]
>>> [   60.815657] qcom_q6v5_pas 1a300000.remoteproc: fatal error received: :0:EX:kernel:0:frpck_0_0:77:PC=c0117de0
>>> [   60.815684] remoteproc remoteproc2: crash detected in cdsp: type fatal error
>>> [   60.815738] remoteproc remoteproc2: handling crash #1 in cdsp
>>> [   60.815754] remoteproc remoteproc2: recovering cdsp
>>> [   60.819267] (NULL device *): Error: dsp information is incorrect err: -32
>>>
>> How to debug such issues?
> 
> This issue occurs also when I'm trying to run a hexagonrpcd with the following command (with copied from the dspso partition libs):
> 
> sudo -u fastrpc hexagonrpcd -f /dev/fastrpc-cdsp -R /usr/share/qcom/sdm660/Xiaomi/clover/ -d cdsp -c /usr/share/qcom/sdm660/Xiaomi/clover/dsp/cdsp/fastrpc_shell_3

Please open an issue on:

https://github.com/qualcomm/fastrpc/issues

Konrad

