Return-Path: <linux-arm-msm+bounces-43593-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 9ECD59FE212
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Dec 2024 03:45:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id EE1887A07F2
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Dec 2024 02:45:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4DB542E414;
	Mon, 30 Dec 2024 02:45:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="hMGISW9C"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F2F42594B3;
	Mon, 30 Dec 2024 02:45:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735526744; cv=none; b=OTsF9ebybe959m2rT5jV7Ql2IwJ/hpjg9oHYeJ93D1acsxb7lX7QrD6UlKEK5VtQtBiGoBhbP+eHIv0PNTwh8Oao1R6uOSi5HgWFIg76CApc+S+dQ1NsWpZfAvhtbd9VIoBdcU8Xtz8LcnnpGpAadRp8X2FmiD10xeTx1hzeXMw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735526744; c=relaxed/simple;
	bh=lINa1NYSiACMmhycuUyTv6a4CZG69fV1i6lwXOcA2cY=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=COaey/pXf+jUqTw5v2kIarRu/Eb1RpQlw1QV4Xxg71fzfHAu8+7Y3gZmjXbQ3Z9emWknKfUtEgFXgfoTK9weAxxNEAg6GVzFY3KbG9+xcoeCWgjmSw6HExnZT751B7/Yy+rRmpo2RUrDFlEAgxHzhMgRIEs90/4E/VyIxWE6XXw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=hMGISW9C; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BU0j8oh013510;
	Mon, 30 Dec 2024 02:45:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dNUUS20lJs9Xa/JNwr4yZaC/X3cCdfHkMVbCHo62G8c=; b=hMGISW9CM7VijkUU
	cygagMc9PKZWtxU1i8hjWVyHAR+9P3dX0792uG5wL23ggEg2aXWZzVbqqLug1Vvs
	UFnZEY9aNJNhR5XidG3uk+33Y52NZrfHjGxXymjbQp261Q+8VMCYJDbO5k/5BYYp
	WtQhKLOQ0ITCT7E+1YJ/gD0077MFWvDNyFXNJ8dSGuQVnNKRbN0wQPTkQimwL+rF
	ySJxUXo4befIby28YT07rd261aSN/DhaSa9e4SSsYVD2tTfnBhOfOdW03+4kkn5J
	Pei7Iw0i9yMdVDaB/w9P4aHnsXgG/3nUeyAOigbiSkJtGvQ4yCRzLledwZC2feNR
	YhkACQ==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43uh8e85n6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 30 Dec 2024 02:45:25 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BU2jO5h004565
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 30 Dec 2024 02:45:24 GMT
Received: from [10.239.132.150] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Sun, 29 Dec
 2024 18:45:22 -0800
Message-ID: <23a29a97-4d0f-4bc3-a0bf-10b32cc4ea7c@quicinc.com>
Date: Mon, 30 Dec 2024 10:45:19 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] dt-bindings: platform: Add bindings for Qcom's EC
 on IT8987
To: Maya Matuszczyk <maccraft123mc@gmail.com>,
        Krzysztof Kozlowski
	<krzk@kernel.org>
CC: Stephan Gerhold <stephan.gerhold@linaro.org>,
        Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>, <linux-arm-msm@vger.kernel.org>,
        devicetree
	<devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
References: <20241219200821.8328-1-maccraft123mc@gmail.com>
 <Z2WxzvKRVcOz5d2V@linaro.org>
 <CAO_MupJ7JtXNgGyXcxGa+EGAvsu-yG0O6MgneGUBdCEgKNG+MA@mail.gmail.com>
 <Z2W2UhspMZNT1TRU@linaro.org>
 <c8677ae6-a145-411c-a221-02faa1ce809d@kernel.org>
 <CAO_Mup+YFAT5oFRGYucW5h_eGcfp4C5FzF20hM6xF=qMR1DdQw@mail.gmail.com>
From: "Aiqun(Maria) Yu" <quic_aiquny@quicinc.com>
Content-Language: en-US
In-Reply-To: <CAO_Mup+YFAT5oFRGYucW5h_eGcfp4C5FzF20hM6xF=qMR1DdQw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 4d8cwamUx5Yb-IslZFQji25la9kEiFs7
X-Proofpoint-ORIG-GUID: 4d8cwamUx5Yb-IslZFQji25la9kEiFs7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 clxscore=1015
 phishscore=0 spamscore=0 suspectscore=0 priorityscore=1501 mlxscore=0
 bulkscore=0 mlxlogscore=999 malwarescore=0 lowpriorityscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412300020

On 12/22/2024 11:07 PM, Maya Matuszczyk wrote:
> niedz., 22 gru 2024 o 15:40 Krzysztof Kozlowski <krzk@kernel.org> napisał(a):
>>
>> On 20/12/2024 19:24, Stephan Gerhold wrote:
>>> On Fri, Dec 20, 2024 at 07:16:34PM +0100, Maya Matuszczyk wrote:
>>>> Excuse the formatting, I've typed this reply from my phone
>>>>
>>>> pt., 20 gru 2024, 19:05 użytkownik Stephan Gerhold <
>>>> stephan.gerhold@linaro.org> napisał:
>>>>
>>>>> On Thu, Dec 19, 2024 at 09:08:18PM +0100, Maya Matuszczyk wrote:
>>>>>> This patch adds bindings for the EC firmware running on IT8987 present
>>>>>> on most of X1E80100 devices
>>>>>>
>>>>>> Signed-off-by: Maya Matuszczyk <maccraft123mc@gmail.com>
>>>>>> ---
>>>>>>  .../bindings/platform/qcom,x1e-it8987-ec.yaml | 52 +++++++++++++++++++
>>>>>>  1 file changed, 52 insertions(+)
>>>>>>  create mode 100644
>>>>> Documentation/devicetree/bindings/platform/qcom,x1e-it8987-ec.yaml
>>>>>>
>>>>>> diff --git
>>>>> a/Documentation/devicetree/bindings/platform/qcom,x1e-it8987-ec.yaml
>>>>> b/Documentation/devicetree/bindings/platform/qcom,x1e-it8987-ec.yaml
>>>>>> new file mode 100644
>>>>>> index 000000000000..4a4f6eb63072
>>>>>> --- /dev/null
>>>>>> +++ b/Documentation/devicetree/bindings/platform/qcom,x1e-it8987-ec.yaml
>>>>>> @@ -0,0 +1,52 @@
>>>>>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>>>>>> +%YAML 1.2
>>>>>> +---
>>>>>> +$id: http://devicetree.org/schemas/platform/qcom,x1e-it8987-ec.yaml#
>>>>>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>>>>>> +
>>>>>> +title: Qualcomm Embedded Controller on IT8987 chip.
>>>>>> +
>>>>>> +maintainers:
>>>>>> +  - Maya Matuszczyk <maccraft123mc@gmail.com>
>>>>>> +
>>>>>> +description:
>>>>>> +  Most x1e80100 laptops have an EC running on IT8987 MCU chip. The EC
>>>>> controls
>>>>>> +  minor functions, like fans, power LED, and on some laptops it also
>>>>> handles
>>>>>> +  keyboard hotkeys.
>>>>>> +
>>>>>> +properties:
>>>>>> +  compatible:
>>>>>> +    oneOf:
>>>>>> +      - const: qcom,x1e-it8987-ec
>>>>>
>>>>> Given that ECs tend to be somewhat device-specific and many vendors
>>>>> might have slightly customized the EC firmware(?), I think it would be
>>>>> better to disallow using this generic compatible without a more specific
>>>>> one. In other words, I would drop this line and just keep the case
>>>>> below:
>>>>>
>>>> I've looked at DSDT of other devices and they look to be compatible with
>>>> what's on the devkit, with differences being extra features on magicbook
>>>> art 14 and yoga slim 7x. Though this isn't a hill I'm willing to die on.
>>>>
>>>
>>> I think it's fine to keep qcom,x1e-it8987-ec as second compatible.
>>
>>
>> No, because:
>> 1. There is no such thing as x1e
>> 2. If there was a soc like this, this has nothing to do with SoC. It is
>> not a component inside SoC and that is the only allowed case when you
>> use SoC compatibles.
> 
> It was the closest thing I had for a "platform name"
> 
>>
>>> However, without a more specific compatible, there is a risk we have
>>> nothing to match on in case device-specific handling becomes necessary
>>> in the driver at some point.
>>>
>>> It's certainly subjective, but it might be better to play it safe here
>>> and have a specific compatible that one can match, even if the behavior
>>> is 99% the same. There will often be subtly different behavior across
>>> devices, you mentioned the "keyboard backlight turning off and the power
>>> LED slowly blinking", who knows what else exists.
>>>
>>> I suppose worst case we could also use of_machine_is_compatible() to
>>> just match the device the EC is running on, but I'm not sure if that
>>> would be frowned upon.
>>
>>
>> Unless you have some sort of insights or secret knowledge from Qualcomm
>> (Bjorn or Konrad can chime in here), I think these are pure guesses that
>> this is a Qualcomm product (implied by vendor prefix) or some sort of
>> re-usable generic firmware from Qualcomm present on multiple devices.
> 
> The x elite devkit also has the IT8987 EC chip, and when comparing the
> firmware of it and Yoga Slim 7x's EC there are similarities when
> running them through strings
> On both of them at the beginning there are strings that look like
> version identifiers:
> Devkit:
> UUBBK V:00.20.00$
> BBK-V20$
> 
> Slim7x:
> UUBBK V:00.21.00$
> BBK-V21$
> 
> With similar ones at the end:
> Devkit:
> EC VER:00.29.00$
> LsFv:00.29.00$
> Qualcomm$
> WoS 8c GenX$
> ODM$
> MB:A0$
> BUILD DATE:
> 02/0//2/24$
> TIME:
> 14:33:35$
> 
> Slim7x:
> EC VER:00.60.00$
> LsFv:00.20.00$
> Qualcomm$
> WoS 8c GenX$
> ODM$
> MB:A0$
> BUILD DATE:
> 2024/07/25$
> TIME:
> 09:58:00$
> 
> 
> 
>>
>> If the FW across devices is the same, then fallbacks for these are fine
>> with me.
> 
> As the devkit has EC firmware that is handled the same way in DSDT
> tables of most of other x1e laptops with the same EC, and is a subset
> of what's done on Lenovo Yoga Slim 7x and Honor Magicbook Art 14 I
> think the devkit's compatible  + -ec would be a good pick.
> 
> This conversation is getting long and I feel like I've said everything
> I wanted to say, I'll just do what you tell me to do about the
> fallback and binding filename.
> 

I have raised this topic internally at Qualcomm. However, since some key
personnel are currently on holiday, an immediate response is not
possible. Rest assured, the topic is under review internally. Please
stay tuned for updates.

I want to personally thank you for your current support and efforts.
>>
>> Best regards,
>> Krzysztof


-- 
Thx and BRs,
Aiqun(Maria) Yu

