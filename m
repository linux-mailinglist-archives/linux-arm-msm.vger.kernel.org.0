Return-Path: <linux-arm-msm+bounces-81852-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FAC3C5D0DC
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Nov 2025 13:16:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 6D4033593A2
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Nov 2025 12:16:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E608822AE65;
	Fri, 14 Nov 2025 12:16:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OQP9Mujj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8439136358;
	Fri, 14 Nov 2025 12:16:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763122572; cv=none; b=l7ZacCSoOGxQzhJTNLRk6oAcxz5i9q04JfwFh/7iiLCvfrFs/EoSEV0IK+ogSKVW0rZ3jsVi77aB2vvk/2UGQFRTELe21oLSyN2eXjif0vumHK7PLGT24hB5ta/wcI7BpIZ5lziOuvM+3nNF8i2k2JaIPRkzmc0TWpB5O7YYcGY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763122572; c=relaxed/simple;
	bh=xPOPe5KPnNiu09gF7yQRUhum6s9WtN78iX7rty+2ULQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=C/ojZwemrE3BLABuNa8BJumhZXgjGlSNgwEJxWg5SqHV5tElpk4d3OQEZiMF4A9VTmNHAOQ7bkXbwglcjgtbug4inQVFNGHddX078hiBz9XzH8npDpbXLiHlu6JLmv8sWDe+kDsI9Ke7c/9RGNZ52nTYYuWZpNoAhRvlBf365EU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OQP9Mujj; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EA893C4CEF5;
	Fri, 14 Nov 2025 12:16:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763122572;
	bh=xPOPe5KPnNiu09gF7yQRUhum6s9WtN78iX7rty+2ULQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=OQP9MujjMCq4Uv/f866Yn2CCo9a4YMujBOwr2ADvwuThtbnLO8bkdZS2CofH+L6l8
	 JYS+HMULZebmC+Of/wI4fJzkMjuWJKK5YoPvOnG79fHV21fynxJVi9uNuOnKWO3fKZ
	 rLbDg4wZB4UiWCvV7aFcgBAME2TwnCOLwQ3C4qaXHfB+1wGyxSTvxpSYM+EB3tEITV
	 gS+HQ/RltMbeTQ7PVd2tPDrSb8oSUH3L7DB8NUNx2UcX69l1tPYOxZP+IosaFMU0+U
	 GWomPsGw5MTmA1oj4yLVqhJiOL98CRP81Krxp3kSr8qxN7eidwH9moepMHp01bef5x
	 uSFuFUjUHHuHQ==
Message-ID: <e7e4b35f-8c8c-4a11-8d3a-193ba93bb6d8@kernel.org>
Date: Fri, 14 Nov 2025 13:16:04 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/6] dt-bindings: display/msm/rgmu: Document A612 RGMU
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>, Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Jessica Zhang <jesszhan0024@gmail.com>,
 Dan Carpenter <dan.carpenter@linaro.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 Jie Zhang <jie.zhang@oss.qualcomm.com>
References: <20251107-qcs615-spin-2-v2-0-a2d7c4fbf6e6@oss.qualcomm.com>
 <20251107-qcs615-spin-2-v2-3-a2d7c4fbf6e6@oss.qualcomm.com>
 <20251110-persimmon-wombat-of-holiness-6b3f9c@kuoka>
 <f08c8707-eb72-4689-b53b-acd6e3218836@oss.qualcomm.com>
 <e0e82b22-ecef-4136-834b-ea4a6b00e179@oss.qualcomm.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <e0e82b22-ecef-4136-834b-ea4a6b00e179@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 14/11/2025 13:08, Akhil P Oommen wrote:
> On 11/14/2025 5:30 PM, Akhil P Oommen wrote:
>> On 11/10/2025 1:21 PM, Krzysztof Kozlowski wrote:
>>> On Fri, Nov 07, 2025 at 02:20:08AM +0530, Akhil P Oommen wrote:
>>>> From: Jie Zhang <jie.zhang@oss.qualcomm.com>
>>>>
>>>> RGMU a.k.a Reduced Graphics Management Unit is a small state machine
>>>> with the sole purpose of providing IFPC (Inter Frame Power Collapse)
>>>> support. Compared to GMU, it doesn't manage GPU clock, voltage
>>>> scaling, bw voting or any other functionalities. All it does is detect
>>>> an idle GPU and toggle the GDSC switch. As it doesn't access DDR space,
>>>> it doesn't require iommu.
>>>>
>>>> So far, only Adreno 612 GPU has an RGMU core. Document RGMU in the GMU's
>>>> schema.
>>>>
>>>> Signed-off-by: Jie Zhang <jie.zhang@oss.qualcomm.com>
>>>> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
>>>> ---
>>>>  .../devicetree/bindings/display/msm/rgmu.yaml      | 131 +++++++++++++++++++++
>>>>  MAINTAINERS                                        |   1 +
>>>>  2 files changed, 132 insertions(+)
>>>>
>>>> diff --git a/Documentation/devicetree/bindings/display/msm/rgmu.yaml b/Documentation/devicetree/bindings/display/msm/rgmu.yaml
>>>> new file mode 100644
>>>> index 000000000000..7621556477d0
>>>> --- /dev/null
>>>> +++ b/Documentation/devicetree/bindings/display/msm/rgmu.yaml
>>>
>>> Filename matching compatible, so qcom,adreno-rgmu.yaml
>>>
>>>
>>>> @@ -0,0 +1,131 @@
>>>> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
>>>> +# Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
>>>> +%YAML 1.2
>>>> +---
>>>> +
>>>> +$id: http://devicetree.org/schemas/display/msm/rgmu.yaml#
>>>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>>>> +
>>>> +title: RGMU attached to certain Adreno GPUs
>>>> +
>>>> +maintainers:
>>>> +  - Rob Clark <robin.clark@oss.qualcomm.com>
>>>> +
>>>> +description: |
>>>
>>> Do not need '|' unless you need to preserve formatting.
>>>
>>>> +  RGMU (Reduced Graphics Management Unit) IP is present in some GPUs that
>>>> +  belong to Adreno A6xx family. It is a small state machine that helps to
>>>> +  toggle the GX GDSC (connected to CX rail) to implement IFPC feature and save
>>>> +  power.
>>>> +
>>>> +properties:
>>>> +  compatible:
>>>> +    items:
>>>> +      - const: qcom,adreno-rgmu-612.0
>>>> +      - const: qcom,adreno-rgmu
>>>> +
>>>> +  reg:
>>>> +    items:
>>>> +      - description: Core RGMU registers
>>>> +
>>>> +  reg-names:
>>>> +    items:
>>>> +      - const: gmu
>>>
>>> Drop reg-names, useless for one entry with same name as the block name.
>>
>> Just to confirm, drop only reg-names, but keep 'reg'?
> 
> Wait. We should keep 'reg'.
> 
> If we remove 'reg-names' here, we cannot use reg-names in DT too because
> we are setting additionalProperties to False, right?


Yes, I ask to drop reg-names from everywhere because they are pointless.

Best regards,
Krzysztof

