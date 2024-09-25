Return-Path: <linux-arm-msm+bounces-32432-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D8F5985373
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Sep 2024 09:14:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C3E04B216CC
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Sep 2024 07:14:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 17D99156237;
	Wed, 25 Sep 2024 07:14:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fGqurL4P"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D735A132103;
	Wed, 25 Sep 2024 07:14:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727248447; cv=none; b=sH8ShnszKoeRNf5v7gFWCSr8rjAVb194RnbONGYGtfYjeu8sw4hnV+K3VINQeVWEI1LChEpc6NVrOKFp9CNamAOUoDRWiuAq3FupllWslogBPS/reACs/Ljvbmn5FeAYKVwjh3Q6wAuC3NDjeXIg/84xe23EqKG8C6EM3dhzHQw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727248447; c=relaxed/simple;
	bh=qJ4TsQ/6sArUbR1U3iecRaZ6CownESjdXqH3GgdPvcs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Ze+O6uWYnAHC3ZRct05t4GfYwnkFb/avgh/SO5Q0LcVq9VN2gb8Ng5hgiVdYzAqIxGcB9Em6GBOEopXZhC8H5CPdV+vT5NbUt05eFU9Yw2hCCxTMnGUgolx/6ZfGQx1PxTRbwZm9wDnoM3aK2uvgrX1/xgWjyOgBW9GqLPZjcTo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fGqurL4P; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 67892C4CECD;
	Wed, 25 Sep 2024 07:14:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727248446;
	bh=qJ4TsQ/6sArUbR1U3iecRaZ6CownESjdXqH3GgdPvcs=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=fGqurL4Pj8U8nZs+NSlgdDX3IWw9273x8Mrg51UhRYzx+B5x/tw/FyqGNOhQM7V5y
	 4O4SphPKSGZ2abMaExxrXiwOed/+HyZUewPzvyALMeLbBHTvwCk8K9flSGpsk/cWT5
	 b/q/XJ4n/xRT8NeFeaS9kE4kMdy5i9SoRp++3Xsrd5YTHen3TDJkUwWA5ZdF9YFLkZ
	 kAFGnOvMNpo2RuOPI6Xs1ZJEvZ194lS2gbyYN3nziIIRigHBW2M1VieylwM+dRbO9z
	 jdkoQkyg7P21OGos7k9JTs1xKN2DXrAXq7k/8lD0XjqiTGzfRKQIIy3uJDW81qtydP
	 3Caiur91MlF6w==
Message-ID: <01ea36e7-f4a7-4f1f-9596-3ed6ed13b47b@kernel.org>
Date: Wed, 25 Sep 2024 09:14:00 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] dt-bindings: phy: Add QMP UFS PHY comptible for
 QCS8300
To: Jingyi Wang <quic_jingyw@quicinc.com>
Cc: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I
 <kishon@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
 linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Xin Liu <quic_liuxin@quicinc.com>
References: <20240911-qcs8300_ufs_phy_binding-v2-1-c801a2d27a84@quicinc.com>
 <ztpetznwid2om6vylyl2boi665ch3wnkprkmzcq6bem6cqhqtf@ogsi657y4kex>
 <6656171b-12d3-490b-b53c-f907b7454f99@quicinc.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 fv0=
In-Reply-To: <6656171b-12d3-490b-b53c-f907b7454f99@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 25/09/2024 05:16, Jingyi Wang wrote:
> 
> 
> On 9/16/2024 10:53 PM, Krzysztof Kozlowski wrote:
>> On Wed, Sep 11, 2024 at 02:56:16PM +0800, Jingyi Wang wrote:
>>> From: Xin Liu <quic_liuxin@quicinc.com>
>>>
>>> Document the QMP UFS PHY compatible for Qualcomm QCS8300 to support
>>> physical layer functionality for UFS found on the SoC. Use fallback to
>>> indicate the compatibility of the QMP UFS PHY on the QCS8300 with that
>>> on the SA8775P.
>>>
>>> Signed-off-by: Xin Liu <quic_liuxin@quicinc.com>
>>> Signed-off-by: Jingyi Wang <quic_jingyw@quicinc.com>
>>> ---
>>> Changes in v2:
>>> - decoupled from the original series.
>>> - Use fallback to indicate compatibility with SA8775P.
>>> - typo fixup
>>> - Link to v1: https://lore.kernel.org/r/20240904-qcs8300_initial_dtsi-v1-0-d0ea9afdc007@quicinc.com
>>> ---
>>>  .../bindings/phy/qcom,sc8280xp-qmp-ufs-phy.yaml    | 46 ++++++++++++----------
>>>  1 file changed, 26 insertions(+), 20 deletions(-)
>>>
>>> diff --git a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-ufs-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-ufs-phy.yaml
>>> index f9cfbd0b2de6..626a2039e177 100644
>>> --- a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-ufs-phy.yaml
>>> +++ b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-ufs-phy.yaml
>>> @@ -15,26 +15,31 @@ description:
>>>  
>>>  properties:
>>>    compatible:
>>> -    enum:
>>> -      - qcom,msm8996-qmp-ufs-phy
>>> -      - qcom,msm8998-qmp-ufs-phy
>>> -      - qcom,sa8775p-qmp-ufs-phy
>>> -      - qcom,sc7180-qmp-ufs-phy
>>> -      - qcom,sc7280-qmp-ufs-phy
>>> -      - qcom,sc8180x-qmp-ufs-phy
>>> -      - qcom,sc8280xp-qmp-ufs-phy
>>> -      - qcom,sdm845-qmp-ufs-phy
>>> -      - qcom,sm6115-qmp-ufs-phy
>>> -      - qcom,sm6125-qmp-ufs-phy
>>> -      - qcom,sm6350-qmp-ufs-phy
>>> -      - qcom,sm7150-qmp-ufs-phy
>>> -      - qcom,sm8150-qmp-ufs-phy
>>> -      - qcom,sm8250-qmp-ufs-phy
>>> -      - qcom,sm8350-qmp-ufs-phy
>>> -      - qcom,sm8450-qmp-ufs-phy
>>> -      - qcom,sm8475-qmp-ufs-phy
>>> -      - qcom,sm8550-qmp-ufs-phy
>>> -      - qcom,sm8650-qmp-ufs-phy
>>> +    oneOf:
>>> +      - items:
>>> +          - enum:
>>> +              - qcom,qcs8300-qmp-ufs-phy
>>> +          - const: qcom,sa8775p-qmp-ufs-phy
>>> +      - enum:
>>> +          - qcom,msm8996-qmp-ufs-phy
>>> +          - qcom,msm8998-qmp-ufs-phy
>>> +          - qcom,sa8775p-qmp-ufs-phy
>>> +          - qcom,sc7180-qmp-ufs-phy
>>> +          - qcom,sc7280-qmp-ufs-phy
>>> +          - qcom,sc8180x-qmp-ufs-phy
>>> +          - qcom,sc8280xp-qmp-ufs-phy
>>> +          - qcom,sdm845-qmp-ufs-phy
>>> +          - qcom,sm6115-qmp-ufs-phy
>>> +          - qcom,sm6125-qmp-ufs-phy
>>> +          - qcom,sm6350-qmp-ufs-phy
>>> +          - qcom,sm7150-qmp-ufs-phy
>>> +          - qcom,sm8150-qmp-ufs-phy
>>> +          - qcom,sm8250-qmp-ufs-phy
>>> +          - qcom,sm8350-qmp-ufs-phy
>>> +          - qcom,sm8450-qmp-ufs-phy
>>> +          - qcom,sm8475-qmp-ufs-phy
>>> +          - qcom,sm8550-qmp-ufs-phy
>>> +          - qcom,sm8650-qmp-ufs-phy
>>>  
>>>    reg:
>>>      maxItems: 1
>>> @@ -85,6 +90,7 @@ allOf:
>>>            contains:
>>>              enum:
>>>                - qcom,msm8998-qmp-ufs-phy
>>> +              - qcom,qcs8300-qmp-ufs-phy
>>
>> Not needed.
>>
> Well noted.
>> BTW, please be sure you organize your patchsets per subsystem. IOW, that
>> you do not split same subsystem bindings patches into separate
>> patchsets.
>>
> Do you mean combine the binding of qmp-ufs-phy with ufs controller? I noticed
> that this patch belongs to "GENERIC PHY FRAMEWORK" subsystem and ufs controller
> binding belongs to "UNIVERSAL FLASH STORAGE HOST CONTROLLER DRIVER". If necessary,
> we can pay attention to combine them next time

No, I mean group patches targeting the same subsystem.

Best regards,
Krzysztof


