Return-Path: <linux-arm-msm+bounces-78176-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A0CC0BF6B4D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Oct 2025 15:15:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DD71A420861
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Oct 2025 13:14:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4241B355033;
	Tue, 21 Oct 2025 13:14:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OHYh3WfO"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E31332861B
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Oct 2025 13:14:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761052445; cv=none; b=jExze4ejAcX+2mqpYlz+ZN71Cg3jhoOuxpbfKJgYFJBpX0m4LhMHe5C2QA5vf5jfyQsJQS75xc5l4kn2fQp0Gq+JpZt+Wso/7OUgYF0zr4zk0gKkrD/w8BGkuwdAgFvNQmSWY6a2woWn+0sBcAuVgfIHH+t5r4/IXmcV0FYdOmY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761052445; c=relaxed/simple;
	bh=w2i+FxONBXXx3PvM+d1TKTp00ehfZPIgAaTK1j0wkl4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QoFBFornWBeGazrWqeaVqTPHaHBHtZasXXg7Nyfqyz4P1of63XDzqHjRXKw7tECbpqWIYufj7vFJOxNUfC3Jg1O0vjUVKz99hklCy4GBt0LpMRPpBFDwRk9QjKCtqynSoY/nox4vHq1uFpvoBg+2/lacK8+lJJtR3XGX1wWlqxw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OHYh3WfO; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59L8EoDZ031052
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Oct 2025 13:14:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1J3FwMBpLhx8fYWCDWyhBCXacIdXPm0xifRPcXHEaJ8=; b=OHYh3WfONtQnQIWN
	jqNqPFtwtmIP6JuNtltLlO5uECBdbthXS+cv6w0vMPNXrYjgT5OBozJ9FUOWeSF3
	0vVU4zQyf1ABp5ByavV32Z1Yw8QYcFVMMZQMOgSJA9+/jGsbkhevmCz1xVF5rt9D
	dmYUdrckZy/8d/BHg5/j5SvzlJqXwBM9xwMWTRywIVniZ9uSD72wA2TWzyVaXldO
	Tf3ftUzKy/lwH3jKzWcQskpsraeuzVDqItzYJ7YcrrwX54OoOgUSLzxcJ7Gv5yP4
	6jEIIbojQtWjgzoOTtbed8Dg4M/+TVBqcFR6yV0WtdZDRRRDfkwF+rweUBiPzAld
	o4uFRA==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49v42k8n4d-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Oct 2025 13:14:02 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-87bf4ed75beso210974176d6.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Oct 2025 06:14:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761052441; x=1761657241;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1J3FwMBpLhx8fYWCDWyhBCXacIdXPm0xifRPcXHEaJ8=;
        b=Fcfr+RDH6qFGm8NOi568u8kAyLMTMBUtqnGc4TpPwjstJzOTFDs6VQRd9mc8fjB81W
         nFu3x8aG6oQH28Pepl3XxNrOMzTT+3NqC/sYE5SAjxTW+MZoBFYXVzapPNROFlhE/6P/
         d2oB1h+5M0wHW9JYN+re6irt3itVk77bFrjN+6Iu8DE6wIoQrtxP+/wo4mHpZa32xmFo
         dE0XQbU+kIKlq5fvVMcGudKU5gIH/yonOUyKs+bfcsmiVmTT0WgdBR9EsU0Gts45Eqvu
         kSKnxdl+Mcs6G2GtGOWoOxH8zngC7L5pD7qMAZhWwJQh4l3ByOxhdQwAwTaP+ls+6kKO
         2PDw==
X-Forwarded-Encrypted: i=1; AJvYcCV40xldlpY3e0FhYMAqvncOCj6upgC/SlvAyzxJADaItT05BngT5tElVwN22UD/HFcjPSxpnI6zM66dcONp@vger.kernel.org
X-Gm-Message-State: AOJu0YyRFs5scYZ5KjdlXoqErpFcLFp/BlBmAEmpI2R+nqGBEweY9BBA
	+k2XyDLmcEMaK4UIYCaFWx+ybOQEoEWLvUJZYky/PAq3H0uGqcppfmOt8OLd+rt4iUDz3dhmZoj
	QOab1jccZuy+2ROpOu11w2Qq8W/KRvqGBvq4qVf3w8pHegv05IcVqtp9B03Ei9DD7EN+l
X-Gm-Gg: ASbGnctw/QWkDtlg6KOH2Pld7qdEOaO3Qld8z11gLqxp2FeIHEVXOo1TowGtkwA2VQu
	5gIYj1ye6A/em7wkPo1SZHlRqbhQeZqldzM9PrIYrnFac1Go3363gTtlmpRCTsB8HMhZFhfJnpJ
	Wpqu61a5dxaNM0Om2XqtTJHM2jfuqEAQj29TK9ulfPeq8v5VvwUUoVEe9FYqlSzGOIkZG/JHC2r
	o0cQEsVTm45hZGwW8LBKV9yjg7feX3kJpp7IcsywcnPRguWt/w49fH6vMUUXFvEcOOtLCfSWh1t
	YHX4xWWy5pJkisOw8QgrbgxOFtnILwTp1D3Pbr5hwVN7Qh+wqPKd2o7s9Qmne9VlnFR8PsCBExm
	SabFlvZusQU4Z+JQrwzCP/vNlaA==
X-Received: by 2002:ac8:5fd0:0:b0:4df:a3f1:2b41 with SMTP id d75a77b69052e-4e89d2f2d22mr191979251cf.37.1761052440973;
        Tue, 21 Oct 2025 06:14:00 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGMR85aYmO0SlEiPplaQeeABFnTh46S57hFvtLZYcoP7my3aQJA/qcKSdNST7j3T+8HnZ1Sug==
X-Received: by 2002:ac8:5fd0:0:b0:4df:a3f1:2b41 with SMTP id d75a77b69052e-4e89d2f2d22mr191978891cf.37.1761052440479;
        Tue, 21 Oct 2025 06:14:00 -0700 (PDT)
Received: from [192.168.68.121] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-474949e0a3csm18730905e9.0.2025.10.21.06.13.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Oct 2025 06:14:00 -0700 (PDT)
Message-ID: <450cac8b-598b-4f47-8bf0-43c805038e7c@oss.qualcomm.com>
Date: Tue, 21 Oct 2025 14:13:57 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/4] arm64: dts: qcom: qcm2290: add LPASS LPI pin
 controller
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Alexey Klimov <alexey.klimov@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Srinivas Kandagatla <srini@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org
References: <20251007-rb1_hdmi_audio-v2-0-821b6a705e4c@linaro.org>
 <20251007-rb1_hdmi_audio-v2-3-821b6a705e4c@linaro.org>
 <b6223af9-2d9e-4ccd-b297-79f63167242b@oss.qualcomm.com>
 <DDEN5NSLDIHD.C1IELQW0VOG3@linaro.org>
 <zmi5grjg2znxddqzfsdsr35ad5olj3xgwwt6hvkiaynxzm5z33@gsgrdguj563n>
 <DDO0LYS7UTEW.3A9WGTAA5DKVO@linaro.org>
 <56vmqgrjy3je7omzirxnfxtuocebbj356iaew5thgkagi35464@hh34y7efssow>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
In-Reply-To: <56vmqgrjy3je7omzirxnfxtuocebbj356iaew5thgkagi35464@hh34y7efssow>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: EJoGZQ7fU5dNvaeol_F2fhicKcBJXJ2H
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE4MDAzMSBTYWx0ZWRfX5W9eugA4aIxx
 1iPMD+NVK5ZxF+hRxur286DKVXbD9izqcCd96nupybh0eoKPn9VcFa1ceiVG4t1nhT3Z1BqlNBP
 VLn0QmDEzAztmW3885ndFLSqPTOk3y7hFmsFctZq6QzO/tDUDVdR55HB7qnds9vzJJgbS2fMWFB
 2pqa7eMPy3zPrWyf5XW/wsRbHWZhURmP09B3MRzN/p9YxBI9LQrBiXbcIB6xch/QPtLP9+Xa2+B
 96y1CBgOnS+CR0aU6RnhTV8ohqnTHbcvMyHQ0WOaFtwCY0zG5gahoDHc34auLl+d7mqKksbCZOf
 5JtD7cWtALACnye9xnpQ3DtnCrQU5SiUhUUIhTNa0+rW6fiJq2PI+Y/er+A+bKzEGuZ8on3rl0p
 3j3Y07UmspSvsDGmWcH+6H0n+vIecw==
X-Authority-Analysis: v=2.4 cv=QYNrf8bv c=1 sm=1 tr=0 ts=68f7871a cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=S47CMrjrQcjTfVtel-AA:9 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: EJoGZQ7fU5dNvaeol_F2fhicKcBJXJ2H
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-21_01,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 malwarescore=0 clxscore=1015 impostorscore=0
 spamscore=0 bulkscore=0 suspectscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510180031



On 10/21/25 2:03 PM, Dmitry Baryshkov wrote:
> On Tue, Oct 21, 2025 at 01:56:09PM +0100, Alexey Klimov wrote:
>> On Fri Oct 17, 2025 at 11:42 PM BST, Bjorn Andersson wrote:
>>> On Fri, Oct 10, 2025 at 01:29:38PM +0100, Alexey Klimov wrote:
>>>> On Tue Oct 7, 2025 at 1:39 PM BST, Konrad Dybcio wrote:
>>>>> On 10/7/25 4:03 AM, Alexey Klimov wrote:
>>>>>> Add the Low Power Audio SubSystem Low Power Island (LPASS LPI) pin
>>>>>> controller device node required for audio subsystem on Qualcomm
>>>>>> QRB2210 RB1. QRB2210 is based on qcm2290 which is based on sm6115.
>>>>>>
>>>>>> While at this, also add description of lpi_i2s2 pins (active state)
>>>>>> required for audio playback via HDMI/I2S.
>>>>>>
>>>>>> Cc: Srinivas Kandagatla <srini@kernel.org>
>>>>>> Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
>>>>>> ---
>>>>>
>>>>> [...]
>>>>>
>>>>>> +			lpi_i2s2_active: lpi-i2s2-active-state {
>>>>>> +				data-pins {
>>>>>> +					pins = "gpio12";
>>>>>> +					function = "i2s2_data";
>>>>>> +					bias-disable;
>>>>>> +					drive-strength = <8>;
>>>>>> +					output-high;
>>>>>
>>>>> I.. doubt output-high is what you want?
>>>>
>>>> Why? Or is it because of some in-kernel gpiod?
>>>>
>>>
>>> What does "output-high" mean for a non-gpio function?
>>
>> This is not efficient. It will be more useful to go straight to
>> the point.
> 
> It is efficient. It makes everybody think about it (and ask the same
> question in future) instead of just depending on maintainers words.
> 
>> This description of pins was taken from Qualcomm downstream code
>> and the similar patch was applied (see provided URL in the prev email).
> 
> And we all know that downstream can be buggy, incomplete, etc.
> 
>> Back to your question -- does it matter here if it is gpio or non-gpio
>> function?
> 
> It does. The I2S data pin is supposed to be toggled in some way by a
> certain IP core. What would it mean if we program output-high? Will the
> pin still be toggled (by the function) or stay pulled up (because of the
> output being programmed)?
I2S lines are configured in push-pull mode which means that the lines
are driven high and low actively, am not sure why output-high is needed
an what it means here as these lines are actively driven by the controller.

@Alexey, what issues do you see without this?

Am not sure if pinctrl driver even cares about this if we are in alt mode.


--srini>


