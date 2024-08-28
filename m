Return-Path: <linux-arm-msm+bounces-29741-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 179709622F5
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Aug 2024 11:07:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C4FB0285D5C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Aug 2024 09:07:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 354C815A849;
	Wed, 28 Aug 2024 09:07:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ryph/kPm"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02140158543;
	Wed, 28 Aug 2024 09:07:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724836028; cv=none; b=WTgOX4qIhzKr95tXQCcA6kmlD+WzshrKNdD5566uRjoEU5I6n3npkPC4CrIabXje95JsexPxlKX+SI8t1ePWtBTEJakdcrLfaPuw/+Ge6slaiNJHHG2IwlLRY1dz8FkwOIMaIB7amhilfg4+hpvVVzA1MhJ2GiCLZfES6Kq5FxI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724836028; c=relaxed/simple;
	bh=qa1D8sWQ7smF5eON7ApWsmnuqplMQ1HKdz1ku1wHFIE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=t23kUJzTcHEG0lH1j+hU1BPUbNwx0ojnj6HTHNrCjxngOgfI/jGj5OTbcsAKbuzazkI23KSI6o+mjuC0AiuLTeZjSESu0XetOWqvg8J/Zh6H1sBqn44nHEHL+fEsqJK1SGXQTMWzHNT+NIB2cPdWbSOizSzI/PoHMZbHQYi2pLY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ryph/kPm; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A1CB7C4AF51;
	Wed, 28 Aug 2024 09:07:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724836027;
	bh=qa1D8sWQ7smF5eON7ApWsmnuqplMQ1HKdz1ku1wHFIE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=ryph/kPmI6mUyBZsV6IIW1VHyrUCZWOFAK4yYtYd087XawAaKkN4wndjstA3AxXyG
	 h3mMMnbIho93JqD02uKUztohPXOCAYk7wB1KcQBb6HosG6yBf7xTP0jxNVZWDPr4go
	 URklcY28JBD+ho8cF9T1XAuZyM6eVjWTw26ROWLRv04RRc6zvMOD5ub1k4vLv/R54f
	 oDe8Jrp4XX2DFwMCNvJxsM26nM5zy1LgGmD47MueRrOaBub1m2sMx7HWtn1vKyof8l
	 Xd2PUX4nIoXTlM7vjLPA+xoc6b8YQBKcJxpA1TGxewoj48hwIWsMM3V2IQor7tD2Gb
	 tVnb895fiYipw==
Message-ID: <fcf59ffe-69f7-48d3-bf20-fc223a2c2d10@kernel.org>
Date: Wed, 28 Aug 2024 11:07:00 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] dt-bindings: remoteproc: qcom,sa8775p-pas: Document
 QCS8300 remoteproc
To: Jingyi Wang <quic_jingyw@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org,
 andersson@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, mathieu.poirier@linaro.org,
 bartosz.golaszewski@linaro.or, quic_tingweiz@quicinc.com,
 quic_aiquny@quicinc.com, quic_tengfan@quicinc.com,
 Xin Liu <quic_liuxin@quicinc.com>
References: <20240828030511.443605-1-quic_jingyw@quicinc.com>
 <20240828030511.443605-2-quic_jingyw@quicinc.com>
 <eetb73ycz7kzcgknuzorsnoszhpdljuxepuoflhakobli6dozl@q2sbmj77hedo>
 <51280d4a-ad55-466d-b9d8-c5bdc1a2f0ee@quicinc.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 fv0=
In-Reply-To: <51280d4a-ad55-466d-b9d8-c5bdc1a2f0ee@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 28/08/2024 09:28, Jingyi Wang wrote:
> 
> 
> On 8/28/2024 3:22 PM, Krzysztof Kozlowski wrote:
>> On Wed, Aug 28, 2024 at 11:05:10AM +0800, Jingyi Wang wrote:
>>> Document the components used to boot the ADSP, CDSP and GPDSP on the
>>> QCS8300 SoC.
>>>
>>> Co-developed-by: Xin Liu <quic_liuxin@quicinc.com>
>>> Signed-off-by: Xin Liu <quic_liuxin@quicinc.com>
>>> Signed-off-by: Jingyi Wang <quic_jingyw@quicinc.com>
>>> ---
>>>  .../bindings/remoteproc/qcom,sa8775p-pas.yaml | 22 +++++++++++++++++++
>>>  1 file changed, 22 insertions(+)
>>>
>>> diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,sa8775p-pas.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,sa8775p-pas.yaml
>>> index 7fe401a06805..44b070a17ca0 100644
>>> --- a/Documentation/devicetree/bindings/remoteproc/qcom,sa8775p-pas.yaml
>>> +++ b/Documentation/devicetree/bindings/remoteproc/qcom,sa8775p-pas.yaml
>>> @@ -16,6 +16,9 @@ description:
>>>  properties:
>>>    compatible:
>>>      enum:
>>> +      - qcom,qcs8300-adsp-pas
>>> +      - qcom,qcs8300-cdsp-pas
>>> +      - qcom,qcs8300-gpdsp-pas
>>>        - qcom,sa8775p-adsp-pas
>>>        - qcom,sa8775p-cdsp0-pas
>>>        - qcom,sa8775p-cdsp1-pas
>>> @@ -64,6 +67,7 @@ allOf:
>>>        properties:
>>>          compatible:
>>>            enum:
>>> +            - qcom,qcs8300-adsp-pas
>>>              - qcom,sa8775p-adsp-pas
>>>      then:
>>>        properties:
>>> @@ -75,6 +79,23 @@ allOf:
>>>            items:
>>>              - const: lcx
>>>              - const: lmx
>>> +  - if:
>>> +      properties:
>>> +        compatible:
>>> +          enum:
>>> +            - qcom,qcs8300-cdsp-pas
>>
>> This looks the same as sa8775p cdsp. Why new entry?
>>
> There is difference in power domain, sa8775p use nsp while qcs8300 use nsp0

Please paste code where do you see the difference.

Best regards,
Krzysztof


