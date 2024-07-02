Return-Path: <linux-arm-msm+bounces-24887-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 60E5B923E9B
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Jul 2024 15:15:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E04D428AA5E
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Jul 2024 13:15:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2B84519DFB4;
	Tue,  2 Jul 2024 13:14:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="b88BRPvU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC05319D085;
	Tue,  2 Jul 2024 13:14:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719926092; cv=none; b=HZHO1nnVxXqo2K65udSCtRztu0C+SnCgBj5/av2TsKoIUWIp6t+11QJyBBx+x1Q9cx/9Esj8raXrDfddnmkPGRP07wXb45GOV7UxxCeN9Rcg8sd4Mw+b9dfsnR7L8/UsZvCYo968GyWDttNvf3/xfa6h/yey8XkOB2h+Ar1gZN0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719926092; c=relaxed/simple;
	bh=0qpxZPhCEx3EMAmnhgP6pEgufhEKOr/B4RtgvPeZFzA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MDIbZfidP3k+K4pzHu2aihubLP/LIp2qBlwap8XuEmbewxafRGELZLTcVqoXfKjbH2a7iOjqd39uIAuN7Rd7CM8AXlBuF80jUeIPhRl1HE76JaiaHd95Qm/7nuHFg6NwFO3zSmzsF/6jt89wpwyi7YZ9Z1uaY1VpX8gh3xKEct4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=b88BRPvU; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4F915C116B1;
	Tue,  2 Jul 2024 13:14:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719926091;
	bh=0qpxZPhCEx3EMAmnhgP6pEgufhEKOr/B4RtgvPeZFzA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=b88BRPvUSeSZlCyR1wASdvO/X3IDL0cPk+khldSHjDvsEDZT7A1mAFXbwdfamnlbn
	 nmAe/RPFzJT8nQr5VOgqB8Fq8M0Y23tlH7BdPlY8HAjzG+xg7mLCHidZ4MlDsYsTzp
	 89j4ayyCjh5i6JXmjfUTH+xHd0nbYcBvc/Ip/a9BlLWF2H0yHgSumdgRdebLWkYEVv
	 risPV6pElQuHetsdBFxJ7cgvrfgrAA/s9FD0fpeNHuANJOrd+tWahEeltxr3wfupOb
	 GG3xznq2R7jK7VEbepK/YLEilvO6IzqXH5GVM7YJKATiUTf1SwjDsMCwQGMqazZcnU
	 Wsh7Rnd9RpOZQ==
Message-ID: <f0f08f0d-3bc6-4649-ad31-b46f0748c6ef@kernel.org>
Date: Tue, 2 Jul 2024 15:14:44 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V5 4/7] dt-bindings: clock: Add ipq9574 NSSCC clock and
 reset definitions
To: Devi Priya <quic_devipriy@quicinc.com>,
 "Rob Herring (Arm)" <robh@kernel.org>
Cc: catalin.marinas@arm.com, u-kumar1@ti.com,
 linux-arm-kernel@lists.infradead.org, krzk+dt@kernel.org,
 geert+renesas@glider.be, neil.armstrong@linaro.org, nfraprado@collabora.com,
 mturquette@baylibre.com, linux-kernel@vger.kernel.org,
 dmitry.baryshkov@linaro.org, netdev@vger.kernel.org,
 konrad.dybcio@linaro.org, m.szyprowski@samsung.com, arnd@arndb.de,
 richardcochran@gmail.com, will@kernel.org, sboyd@kernel.org,
 andersson@kernel.org, p.zabel@pengutronix.de, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, conor+dt@kernel.org,
 linux-arm-msm@vger.kernel.org
References: <20240626143302.810632-1-quic_devipriy@quicinc.com>
 <20240626143302.810632-5-quic_devipriy@quicinc.com>
 <171941612020.3280624.794530163562164163.robh@kernel.org>
 <5ccbfde6-f26a-4796-abac-e8d6a18c74e7@quicinc.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 fv0=
In-Reply-To: <5ccbfde6-f26a-4796-abac-e8d6a18c74e7@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 02/07/2024 14:13, Devi Priya wrote:
> 
> 
> On 6/26/2024 9:05 PM, Rob Herring (Arm) wrote:
>>
>> On Wed, 26 Jun 2024 20:02:59 +0530, Devi Priya wrote:
>>> Add NSSCC clock and reset definitions for ipq9574.
>>>
>>> Signed-off-by: Devi Priya <quic_devipriy@quicinc.com>
>>> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>>> ---
>>>   Changes in V5:
>>> 	- Dropped interconnects and added interconnect-cells to NSS
>>> 	  clock provider so that it can be  used as icc provider.
>>>
>>>   .../bindings/clock/qcom,ipq9574-nsscc.yaml    |  74 +++++++++
>>>   .../dt-bindings/clock/qcom,ipq9574-nsscc.h    | 152 ++++++++++++++++++
>>>   .../dt-bindings/reset/qcom,ipq9574-nsscc.h    | 134 +++++++++++++++
>>>   3 files changed, 360 insertions(+)
>>>   create mode 100644 Documentation/devicetree/bindings/clock/qcom,ipq9574-nsscc.yaml
>>>   create mode 100644 include/dt-bindings/clock/qcom,ipq9574-nsscc.h
>>>   create mode 100644 include/dt-bindings/reset/qcom,ipq9574-nsscc.h
>>>
>>
>> My bot found errors running 'make dt_binding_check' on your patch:
>>
>> yamllint warnings/errors:
>>
>> dtschema/dtc warnings/errors:
>> Error: Documentation/devicetree/bindings/clock/qcom,ipq9574-nsscc.example.dts:26.26-27 syntax error
>> FATAL ERROR: Unable to parse input tree
>> make[2]: *** [scripts/Makefile.lib:427: Documentation/devicetree/bindings/clock/qcom,ipq9574-nsscc.example.dtb] Error 1
>> make[2]: *** Waiting for unfinished jobs....
>> make[1]: *** [/builds/robherring/dt-review-ci/linux/Makefile:1430: dt_binding_check] Error 2
>> make: *** [Makefile:240: __sub-make] Error 2
>>
>> doc reference errors (make refcheckdocs):
>>
>> See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20240626143302.810632-5-quic_devipriy@quicinc.com
>>
>> The base for the series is generally the latest rc1. A different dependency
>> should be noted in *this* patch.
>>
>> If you already ran 'make dt_binding_check' and didn't see the above
>> error(s), then make sure 'yamllint' is installed and dt-schema is up to
>> date:
>>
>> pip3 install dtschema --upgrade
>>
>> Please check and re-submit after running the above command yourself. Note
>> that DT_SCHEMA_FILES can be set to your schema file to speed up checking
>> your schema. However, it must be unset to test all examples with your schema.
>> Hi Rob,
> 
> We tried running dt_binding_check on linux-next and we do not face any
> sort of errors.
> 
> However in case of v6.10-rc1, patch[1] failed to apply as the dependent
> patch[2] is not available on rc1.
> 
> [1] 
> https://patchwork.kernel.org/project/linux-arm-msm/patch/20240626143302.810632-3-quic_devipriy@quicinc.com/
> 
> [2] 
> https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?h=next-20240531&id=475beea0b9f631656b5cc39429a39696876af613
> 
> Patch [2] does not hold any functional dependency on this series but has 
> a patch rebase dependency.
> 
> The Bot has went ahead and tried running the dt_binding_check on patch 
> https://patchwork.kernel.org/project/linux-arm-msm/patch/20240626143302.810632-5-quic_devipriy@quicinc.com/
> which is dependent on patch [1] and hence the issue was reported.
> 
> Is this the expected behaviour?

If you expect your patch not to be ignored after such feedback, explain
briefly missing dependency in changelog. I think Rob told it many times
already.

Otherwise you will get this message *every time* and maintainers might
ignore your patch, due to unresolved reports from automation.

Best regards,
Krzysztof


