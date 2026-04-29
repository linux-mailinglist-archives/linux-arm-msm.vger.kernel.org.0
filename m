Return-Path: <linux-arm-msm+bounces-105173-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4HTQDCvV8Wm3kgEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-105173-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Apr 2026 11:53:47 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 90F924925D3
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Apr 2026 11:53:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BC67C30FFF20
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Apr 2026 09:46:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5243D3D091A;
	Wed, 29 Apr 2026 09:45:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LuKDEork";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gaBqpwLq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B471F3CF672
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Apr 2026 09:45:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777455918; cv=none; b=WzK6h3ZTvYGaV530hUz/xSIyRpozdi5CtEqUFcurwlHLNAH/2dTeBdacQzNH7UjlPE9Ao/JrjNNGredSkJuZxN6RbcltQ5yUi0wfNzbKxwzYHvW7e5HrREpg5mCheGSEq3WTXNwq5Nq/3pYUxhDwbuYGIwg6NKFtdz6w6KfqCnE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777455918; c=relaxed/simple;
	bh=rb+S9cRH5O4Evo+lQh5gjWwTxjkNzuP4cLJWn6+BQIE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=I8SB6+zcHll8IrAS0JzOGHPKCUOgfetzVQxCiYA2YHQ9E09ItfUgddh3eEWSxvQZTgOaYamrSP4cjN3idNmIEBgLt/7TjeaxYQx4ZmBAs5bC1q0KqDFs7K9lDGP3khMsqSEOuaIjHrO+JpcLrRhdl0X9X9E3J84asLxh+Sf4hYg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LuKDEork; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gaBqpwLq; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63T8pqAU1641536
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Apr 2026 09:45:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WMqklI8ttVYLrBDaTzBOFfh8/XdfBoOxs8T67F1EYdU=; b=LuKDEorkKlCqTN73
	dvXSf0vE7nnjCvwyt1aEV4cAvwSUnr2qIqyLfUIezhZXTKS3o/uQFnrEPocsEv+Z
	DBzunci2QlzO3CsjIZIqNUoExGr4QX7QALL9YVX0lEuTntoEsp3BNlIqRKjpbrXV
	RTTDK7RqRjpxiWqHV2gj0FfsRiqpv5H79hWydR6BbsDPfqjcpLqnUCPJERW2sY+g
	NtnlumAUDHwI1MpVSYZGqIPVMv8Pe54N28oxUWOC0KNuNS9uqIwAwMzMmUl61oxu
	i4TOg9L7fAnqXvTQtt1+87ZM1hhjpP0QKakCLJuAKc2HRdEzCZffqni82VO1rBGt
	Ee8DIA==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ducj80was-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Apr 2026 09:45:15 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-610b3dc3fe8so481311137.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 Apr 2026 02:45:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777455915; x=1778060715; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=WMqklI8ttVYLrBDaTzBOFfh8/XdfBoOxs8T67F1EYdU=;
        b=gaBqpwLq04MLFSK5ZgORVujsIdoMWZqs9iQoZirZ/RE0E3JDPvKB24+pD57iaWPAGb
         7uljpxIiNADyB3uqHyQz7Lc8cqEnSHDQSCySwvhGVeNr/KRog1TW63FK7ESTHRwRQzYC
         RNIcG1HpcAG3uJrf0hWABHTUu8vMBlNqGPhsRNNGxERM9ZUWOcbxxKb0ZKu41BaDnVNj
         vrZ3Ec7zFOcHNnSlWfBNir0Tz/UIZtGXVkrRRQ+4Cjgwx7XWM7dsNZjCRtPxYj4g4WR9
         0gRgaJyohdkYTrNiM+mn7hbYuFTBCsJsyiRKjnGxZ8VCMz4mGeYvBBrPTmZq7ZDncXeO
         HpNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777455915; x=1778060715;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WMqklI8ttVYLrBDaTzBOFfh8/XdfBoOxs8T67F1EYdU=;
        b=eO0qjo6qCIxJID+sfQc7MxSnNkDmeGmXaKHEL3csWOcnlzuK2AmTvRz++D3NhWl+zs
         Fz+mjrzSUtymB3YsTf+uU7qxmnd0cO2giE13uXS/wXRys2gCc2DwlIyRJNDYyZemZlTe
         YJeGYFmiTKgLk594eLZU6lcGMpxMTZtqTAjQ8gdrRU66F0qyV3SrAAUJR48fokqbNidV
         AJjCDVKWWQ7r6JdedQQj5FiIxftDu52CPT27+dxzQstfzFxOGYg2AHgcvfTmRA7sRCyr
         BSmmFUArQJO8T2OGvAYPAh/oUfmOeju3N0+Ief6NEvW0YpwFUZltUfWJtEpJWiIyczda
         E2iA==
X-Forwarded-Encrypted: i=1; AFNElJ/fpz/Oqmc9h48UsyxHFN5e9godami6MnEQv2aHR/ttZrScP8Nk8m30OgtivzoXPS5qOXHoGum6Ao2Dg8K6@vger.kernel.org
X-Gm-Message-State: AOJu0YxJ8GXXbI0eKENOhZlTsZTwprD8aIhiguoNsk3CefATT+lvOWng
	D0FLH1j/UexEZmD5BCMvbd3q6YGqMlelREdDc72P+gflagyY5a3CUky6GT3/EwK55ME2+/AoBSM
	ZmqXv2HHZu2uiWnA2+RfN6s9nJ/h5+9vK4HyYxW6XjSULpMfLK3m2HU5EZFmgDcq3PuHC
X-Gm-Gg: AeBDiet3vlSUACakzAFYnJTSRLO1hlUvtRjNxDAY7p7cuLo9wxoxbBEW6bjO2vWJdVU
	n/uIN1m203PKSEoBmCQsJk7f69gxnBKZjiVPMB9SvNX2bOK7a/k5cz6H+DFqOyf2Sf6K1AV5cRo
	VxgZlux2Qe8XukQ7XO6vwyStBYlEsDFAhqUQP5iWfTXlwy0iJl1NEwWbvVhCDYbBqRQ47mE+FS8
	zxZAqeyzKykOIhGbKiG3U2XTrnEu+PhkLT4+q/FjhiNAtv2maC3tPCZH02fZ+TDS59y69Djof0c
	ttXuQVPxoC51jKJEOBqmT5nNszhlO7+c1to/ZNS7JV0VKq4zDZRJdUuFhwwMpWe1dlnumaoE9aG
	IEIJ5aeeXgPgJdM/JMnBUBUTkJE67SM38CTuoE/R8BtLSSn5Btb/yOY59Cpk3eQrzgIGVFqAlKq
	CW+QM5ndsKIJtdbQ==
X-Received: by 2002:a05:6102:3183:b0:612:15ce:f650 with SMTP id ada2fe7eead31-627d5dca865mr1081936137.8.1777455914714;
        Wed, 29 Apr 2026 02:45:14 -0700 (PDT)
X-Received: by 2002:a05:6102:3183:b0:612:15ce:f650 with SMTP id ada2fe7eead31-627d5dca865mr1081928137.8.1777455914199;
        Wed, 29 Apr 2026 02:45:14 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bb98543bf48sm68334666b.41.2026.04.29.02.45.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Apr 2026 02:45:13 -0700 (PDT)
Message-ID: <3886cbd8-be29-4aa4-8331-f5b9a2e2497e@oss.qualcomm.com>
Date: Wed, 29 Apr 2026 11:45:10 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] arm64: dts: qcom: eliza: Describe the ADSP and USB
 related nodes
To: Krishna Kurapati PSSNV <krishna.kurapati@oss.qualcomm.com>
Cc: Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Wesley Cheng <wesley.cheng@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260331-eliza-adsp-usb-v1-0-d8a251be20c3@oss.qualcomm.com>
 <20260331-eliza-adsp-usb-v1-1-d8a251be20c3@oss.qualcomm.com>
 <69d644bd-d64e-4ef4-b0ca-b47103e84764@oss.qualcomm.com>
 <p6duntiwahnmxwit2qgegcmqerv3or3h36y5cel36ekw4vkcfp@exmgriqkkqqb>
 <e0dacc06-432f-4924-89e8-f5fafaee4906@oss.qualcomm.com>
 <jznwxsifczinkboh5kakjj7etxvfbvn5hwbxvxauy42mr3cgph@dnnqiihclguy>
 <CAEiyvpq0e_VgTq0FYOSKGxa_d88sz9uOQgMCBoZfztRk1cjD2A@mail.gmail.com>
 <5c7d64d6-6fc8-4323-894d-56d1dffa7d09@oss.qualcomm.com>
 <CAEiyvpp42MsK_vr1kw86KZUWtP=VWCTPWzCJFdq5Qgd2k91x0A@mail.gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <CAEiyvpp42MsK_vr1kw86KZUWtP=VWCTPWzCJFdq5Qgd2k91x0A@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: ZQqfnNoLADF9xG4pKt5N8yjt4IPYRWny
X-Authority-Analysis: v=2.4 cv=RI6D2Yi+ c=1 sm=1 tr=0 ts=69f1d32b cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=NvRcSlmr8ke_58cIeykA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-GUID: ZQqfnNoLADF9xG4pKt5N8yjt4IPYRWny
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI5MDA5NiBTYWx0ZWRfX66VGZctfR+nU
 1SaSozEd9KnI6NXt2ctTS/NP9MLGBg6mzz31bA8LustPgx3+oUUzVkxaXqedMb28XYvwLrE5Ou6
 K2Qmoz7YUU5K2fGa0KCgCKYHvz7uL2NNs8vXCGczbZMvVada21FrxuMKK/WK1qtuDdXM08bbJux
 SJUDYAeWLksNUEWvTdtEbRtpT9T5uISZ851HXYidu+Y7S+4+R0TnbEeHqvtQ5Co76oLMTKecJfQ
 q7KOch2zJOSdBElHz5HzTgjPfzJIH+rqXAvptsD+JY5xFwi0nJKzJp5mTszhjk6snv/+COIQLix
 0WFXiWiLFwqWeuVFglcqWy9FEm4sksp+0Vi8v6OwERZFLrxDmB806SpFApl2Wc15grFmtIzcPQ1
 6DEGk9vfvLdlJAo7seU9ftvtcdJtBNb3LykuEM+9n4jEMLOh6KYNkeBwTk36H/XmUrm0vrhc9Ue
 8b7voJfva9U4sKi1hkQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-28_05,2026-04-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 malwarescore=0 suspectscore=0
 lowpriorityscore=0 adultscore=0 clxscore=1015 impostorscore=0 bulkscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604290096
X-Rspamd-Queue-Id: 90F924925D3
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,a600000:email];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-105173-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_COUNT_SEVEN(0.00)[7]

On 4/29/26 3:57 AM, Krishna Kurapati PSSNV wrote:
> On Tue, Apr 28, 2026 at 2:54 PM Konrad Dybcio
> <konrad.dybcio@oss.qualcomm.com> wrote:
>>
>> On 4/28/26 7:46 AM, Krishna Kurapati PSSNV wrote:
>>> On Wed, Apr 22, 2026 at 3:55 PM Abel Vesa <abel.vesa@oss.qualcomm.com> wrote:
>>>>
>>>> On 26-04-22 12:09:31, Konrad Dybcio wrote:
>>>>> On 4/22/26 11:41 AM, Abel Vesa wrote:
>>>>>> On 26-03-31 15:37:08, Konrad Dybcio wrote:
>>>>>>> On 3/31/26 12:37 PM, Abel Vesa wrote:
>>>>>>>> Describe the ADSP remoteproc node along with its dependencies, including
>>>>>>>> the IPCC mailbox, AOSS QMP and SMP2P links used for communication.
>>>>>>>>
>>>>>>>> The Eliza SoC features a USB 3.1 Gen 2 controller connected to a QMP
>>>>>>>> combo PHY and an SNPS eUSB2 PHY. Describe them.
>>>>>>>>
>>>>>>>> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
>>>>>>>> ---
>>>>>>>
>>>>>>> [...]
>>>>>>>
>>>>>>>> +         usb_hsphy: phy@88e3000 {
>>>>>>>> +                 compatible = "qcom,eliza-snps-eusb2-phy",
>>>>>>>> +                              "qcom,sm8550-snps-eusb2-phy";
>>>>>>>> +                 reg = <0x0 0x088e3000 0x0 0x154>;
>>>>>>>> +                 #phy-cells = <0>;
>>>>>>>> +
>>>>>>>> +                 clocks = <&rpmhcc RPMH_CXO_CLK>;
>>>>>>>
>>>>>>> This is TCSR_USB2_CLKREF_EN
>>>>>>
>>>>>> Good point. Will fix.
>>>>>>
>>>>>>>
>>>>>>>
>>>>>>>> +         usb: usb@a600000 {
>>>>>>>> +                 compatible = "qcom,eliza-dwc3", "qcom,snps-dwc3";
>>>>>>>
>>>>>>> Does the device suspend and resume successfully?
>>>>>>
>>>>>> Well, tested with pm_test devices and it does suspend and resume
>>>>>> successfully, but there is this:
>>>>>>
>>>>>> [   54.584126] dwc3-qcom a600000.usb: port-1 HS-PHY not in L2
>>>>>>
>>>>>> But if I'm not mistaken, this is valid accross all SNPS eUSB2 PHYs, on
>>>>>> all platforms that have them.
>>>>>
>>>>> Well it's not fatal, but ideally this wouldn't be there. Maybe you're missing
>>>>> some DWC quirk in the list, although it seems pretty long already. Perhaps
>>>>> Wesley would know more.
>>>>
>>>> + Wesley
>>>>
>>>
>>> As per HPG and downstream, this is what needs to be done while entering suspend:
>>>
>>> 1. Clear PWR_EVNT_LPM_IN_L2_MASK bit of pwr_evnt_irq_stat_reg
>>> 2. Clear PWR_EVNT_LPM_OUT_L2_MASK bit of pwr_evnt_irq_stat_reg
>>> 3. Set the following bits in the pwr_evnt_irq_stat_reg:
>>>  a)  DWC3_GUSB2PHYCFG_ENBLSLPM  and  DWC3_GUSB2PHYCFG_SUSPHY
>>
>> In case that's related, most platforms (including this one), set
>> snps,dis_enblslpm_quirk which prevents the first bit from being set
>>
>> Likewise, snps,dis_u2_susphy_quirk for the second one
>>
>> (although it looks like setting these bits is currently
>> unconditional upon suspend in HOST mode?)
>>
>>
>> As for the sequence you mentioned, I believe the diff below should be
>> OK - although it _really_ just adds some delay vs the current state,
>> since the bits are cleared in the resume call
>>
>> diff --git a/drivers/usb/dwc3/dwc3-qcom.c b/drivers/usb/dwc3/dwc3-qcom.c
>> index f43f73ac36ff..e7b1775b7207 100644
>> --- a/drivers/usb/dwc3/dwc3-qcom.c
>> +++ b/drivers/usb/dwc3/dwc3-qcom.c
>> @@ -12,6 +12,7 @@
>>  #include <linux/module.h>
>>  #include <linux/kernel.h>
>>  #include <linux/interconnect.h>
>> +#include <linux/iopoll.h>
>>  #include <linux/platform_device.h>
>>  #include <linux/phy/phy.h>
>>  #include <linux/usb/of.h>
>> @@ -344,10 +345,18 @@ static int dwc3_qcom_suspend(struct dwc3_qcom *qcom, bool wakeup)
>>                 return 0;
>>
>>         for (i = 0; i < qcom->num_ports; i++) {
>> -               val = readl(qcom->qscratch_base + pwr_evnt_irq_stat_reg[i]);
>> -               if (!(val & PWR_EVNT_LPM_IN_L2_MASK))
>> +               /* Wait for the PHYs to go into L2 */
>> +               ret = readl_poll_timeout(qcom->qscratch_base + pwr_evnt_irq_stat_reg[i],
>> +                                        val, val & PWR_EVNT_LPM_IN_L2_MASK,
>> +                                        10, 3 * USEC_PER_MSEC);
>> +
>> +               if (ret == -ETIMEDOUT)
>>                         dev_err(qcom->dev, "port-%d HS-PHY not in L2\n", i + 1);
>>         }
>> +
> 
> 
> I think its best to set the DWC3_GUSB2PHYCFG_ENBLSLPM and
> DWC3_GUSB2PHYCFG_SUSPHY here as well based on quirks before polling
> for the irq_stat register.

Hm, it seems like the dwc3 core layer only does so in the suspend
path if dr_mode = "host"?

Konrad

