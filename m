Return-Path: <linux-arm-msm+bounces-75700-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 69DE3BB0AEE
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Oct 2025 16:22:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B8B07189C1EA
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 Oct 2025 14:22:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 216D926B0AE;
	Wed,  1 Oct 2025 14:21:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ciNAmB7M"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E340B262D14;
	Wed,  1 Oct 2025 14:21:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759328519; cv=none; b=S3jNPiLeNXpGquHf2RKf2HUJ89r8Yb/kvKv5JzsOWJA8IeWF4/1tdsas2kZ10ZPAfDK+yPLZR8osf32issD5tsqEQY0YoZdZgonLs0DfVYbw6jo3rFgzFnzWvM7kqh0sXEa0Qw8vL2Hv9OVnXlJyl1LuxyihcFooMVuNZSLija0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759328519; c=relaxed/simple;
	bh=P+/PrC2Paa9jeoCYGpGbT0KQUaERjFuR3yZyDVz8sng=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AlVahxqD4KFqwb5HHwbjmP82Jx3qY/f92UNEdHZE5eRO4Geg7xyybGpPsmih3faPaxClQyhdTWIhgzfcsW34blX23o9+joEBxkttALwy0UKPnO5A9vYz3xTlhKDJ9dqWI2RevZNLjWKVI7gxf5eiBulCfLBPdQlE2UO/kuU+OUE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ciNAmB7M; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CCCB9C4CEF1;
	Wed,  1 Oct 2025 14:21:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759328518;
	bh=P+/PrC2Paa9jeoCYGpGbT0KQUaERjFuR3yZyDVz8sng=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=ciNAmB7M9OULJaEhYNIRw4kXGnTeZAZz16TSOaUP8qc+c9KXLp3cxc3/hnZzwLFO/
	 V6rwk4liZfuEFgsg7uHmJgB7ADID7X9oU9PLqMGDWgLbNVGKA7r2f5hckGrJEatuY4
	 qzyJpkCP3JC8DpYgvHs6iXOUb2YXtpyeePCrg1nT4OAYEhy+0J/8m5DTt8+aquDCVD
	 fNxLWQdVSV73EJtx8MFEOXirO5ZToH+LAPno7J6rIuo0QK+8fKZdG5JMEL76BAqthZ
	 wVdxDPIQZFMGegwm0qO3JucyFj8Tgbt6sILuZ4wHuuQDSI0p9LGWY3SezH61spJD7q
	 9981v8dMoKYFA==
Message-ID: <b8c1365a-545d-40ae-a39c-e15a3e1f07e7@kernel.org>
Date: Wed, 1 Oct 2025 15:21:55 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] slimbus: qcom: remove unused qcom controller driver
To: Rob Herring <robh@kernel.org>, Srinivas Kandagatla <srini@kernel.org>,
 Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: krzk+dt@kernel.org, conor+dt@kernel.org, linux-arm-msm@vger.kernel.org,
 linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250724132808.101351-1-srinivas.kandagatla@oss.qualcomm.com>
 <CAL_JsqKG+dcMgp1QF4F3Oxh5Shvagg6cSde=g1JMcEAquZhH_Q@mail.gmail.com>
 <990cb5af-3846-44a3-b373-ded62d3309b9@oss.qualcomm.com>
 <CAL_Jsq+zC91GPdzQQa9F8KEw5UL4xc13u5U_5vTyQG1WeJa5rw@mail.gmail.com>
 <82906e08-9583-4f4c-91ad-d5b53b2dffd6@kernel.org>
 <CAL_JsqLtLbCqzHzcaGAuYwxqr=e9HZFX8X20tndx7US-XjhH3Q@mail.gmail.com>
 <CAL_JsqLcinpeJyib+JG7UFspUqXDTzCLguF3Nt4JJY9YncTb9A@mail.gmail.com>
Content-Language: en-US
From: Srinivas Kandagatla <srini@kernel.org>
In-Reply-To: <CAL_JsqLcinpeJyib+JG7UFspUqXDTzCLguF3Nt4JJY9YncTb9A@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 10/1/25 3:19 PM, Rob Herring wrote:
> +Greg
> 
> On Fri, Sep 19, 2025 at 12:25 PM Rob Herring <robh@kernel.org> wrote:
>>
>> On Fri, Sep 5, 2025 at 12:30 AM Srinivas Kandagatla <srini@kernel.org> wrote:
>>>
>>>
>>>
>>> On 9/5/25 12:08 AM, Rob Herring wrote:
>>>> On Tue, Aug 19, 2025 at 8:44 AM Srinivas Kandagatla
>>>> <srinivas.kandagatla@oss.qualcomm.com> wrote:
>>>>>
>>>>> Thanks Rob for reporting this,
>>>>>
>>>>> On 8/19/25 2:35 PM, Rob Herring wrote:
>>>>>> On Thu, Jul 24, 2025 at 8:28 AM <srinivas.kandagatla@oss.qualcomm.com> wrote:
>>>>>>>
>>>>>>> From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
>>>>>>>
>>>>>>> Qcom Slimbus controller driver is totally unused and dead code, there is
>>>>>>> no point in keeping this driver in the kernel without users.
>>>>>>>
>>>>>>> This patch removes the driver along with device tree bindings.
>>>>>>>
>>>>>>> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
>>>>>>> ---
>>>>>>>  .../bindings/slimbus/qcom,slim.yaml           |  86 --
>>>>>>>  drivers/slimbus/Kconfig                       |   7 -
>>>>>>>  drivers/slimbus/Makefile                      |   3 -
>>>>>>>  drivers/slimbus/qcom-ctrl.c                   | 735 ------------------
>>>>>>>  4 files changed, 831 deletions(-)
>>>>>>>  delete mode 100644 Documentation/devicetree/bindings/slimbus/qcom,slim.yaml
>>>>>>>  delete mode 100644 drivers/slimbus/qcom-ctrl.c
>>>>>>
>>>>>> This adds warnings to dt_binding_check:
>>>>>>
>>>>>> Documentation/devicetree/bindings/slimbus/slimbus.example.dtb:
>>>>>> /example-0/soc/slim@28080000: failed to match any schema with
>>>>>> compatible: ['qcom,apq8064-slim', 'qcom,slim']
>>>>>
>>>>> Will replace this example with slim-ngd and fold it in the original patch.
>>>>
>>>> Still warning in linux-next...
>>> Its done now!
>>
>> Now I get this:
>>
>> Documentation/devicetree/bindings/slimbus/slimbus.example.dtb:
>> slim@28080000 (qcom,slim-ngd-v1.5.0): 'audio-codec@1,0' does not match
>> any of the regexes: '^pinctrl-[0-9]+$', '^slim@[0-9a-f]+$'
>>         from schema $id:
>> http://devicetree.org/schemas/slimbus/qcom,slim-ngd.yaml#
>> Documentation/devicetree/bindings/slimbus/slimbus.example.dtb:
>> slim@28080000 (qcom,slim-ngd-v1.5.0): #address-cells: 1 was expected
>>         from schema $id:
>> http://devicetree.org/schemas/slimbus/qcom,slim-ngd.yaml#
>> Documentation/devicetree/bindings/slimbus/slimbus.example.dtb:
>> slim@28080000 (qcom,slim-ngd-v1.5.0): 'dmas' is a required property
>>         from schema $id:
>> http://devicetree.org/schemas/slimbus/qcom,slim-ngd.yaml#
>> Documentation/devicetree/bindings/slimbus/slimbus.example.dtb:
>> slim@28080000 (qcom,slim-ngd-v1.5.0): 'dma-names' is a required
>> property
>>         from schema $id:
>> http://devicetree.org/schemas/slimbus/qcom,slim-ngd.yaml#
> 
> Still failing in linux-next.

Rob, sorry for delay..

will send a fix,


--srini

> 
> Rob


