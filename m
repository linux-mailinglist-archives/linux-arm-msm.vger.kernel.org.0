Return-Path: <linux-arm-msm+bounces-51737-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C1CFA67550
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Mar 2025 14:39:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id ED87B19A3524
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Mar 2025 13:37:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0D47820D4E8;
	Tue, 18 Mar 2025 13:37:31 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 65C6020CCFF;
	Tue, 18 Mar 2025 13:37:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742305050; cv=none; b=A9dgPYjzLUULIdNt9CimyNkR+yZOkAhbPbAui/q28gXzpPz4QBPj89NOGm5ysrRJ2PPu34HJNIK4Tji11DQWrzLOX6PtUdX6u9sQSVJaPBt9hOfHpxfS7rHUva+QpnAQs3tt6aG2Z/Bi1xb76UyOkby6mRsQ0p2/YnbsGAGWRRc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742305050; c=relaxed/simple;
	bh=VmTzynLEZMwhCT3MfTXuku7wjKlEdu3eCX94MGhkA0I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mE02s0VUT1SEWwQUO1GRFdZwUbLfbDNuc1wUuobnu1sNDbkek8jvha3gEADxdymBQ/8hLxZmU9RBtKNgAQZr+4x71C7B2XUzQlxeazqypin2zYuZpK5YTDU+jmQ3xV3nXqj6Pkfob6Alv2URVT+le0FGpHFIuprbKD/39P+fYIE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E78EC13D5;
	Tue, 18 Mar 2025 06:37:36 -0700 (PDT)
Received: from [10.1.197.1] (ewhatever.cambridge.arm.com [10.1.197.1])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7FEDC3F673;
	Tue, 18 Mar 2025 06:37:24 -0700 (PDT)
Message-ID: <eeff769a-ff81-4017-9738-98ad130980a9@arm.com>
Date: Tue, 18 Mar 2025 13:37:23 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/9] dt-bindings: arm: qcom,coresight-static-replicator:
 add optional clocks
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Mike Leach <mike.leach@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>, Rob Clark <robdclark@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Mike Leach <mike.leach@linaro.org>, James Clark <james.clark@linaro.org>,
 Leo Yan <leo.yan@linux.dev>, Kumar Gala <galak@codeaurora.org>,
 Andy Gross <agross@codeaurora.org>, "Ivan T. Ivanov"
 <ivan.ivanov@linaro.org>, Andy Gross <andy.gross@linaro.org>,
 Georgi Djakov <djakov@kernel.org>, David Heidelberg <david@ixit.cz>,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, coresight@lists.linaro.org,
 linux-arm-kernel@lists.infradead.org
References: <20250317-fix-nexus-4-v1-0-655c52e2ad97@oss.qualcomm.com>
 <20250317-fix-nexus-4-v1-4-655c52e2ad97@oss.qualcomm.com>
 <7b0af57c-a38c-4c30-9bb7-efe511d6bd1d@arm.com>
 <klcggfxrhjqty4rktx24xmnosqnwzsbyfzgv5ea6okqbffyswn@5yei6276hlla>
Content-Language: en-US
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <klcggfxrhjqty4rktx24xmnosqnwzsbyfzgv5ea6okqbffyswn@5yei6276hlla>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 18/03/2025 12:19, Dmitry Baryshkov wrote:
> On Tue, Mar 18, 2025 at 10:38:17AM +0000, Suzuki K Poulose wrote:
>> On 17/03/2025 17:44, Dmitry Baryshkov wrote:
>>
>> nit: Subject:
>>
>> s/qcom,coresight-static-replicator/arm,coresight-static-replicator
>>
>>> As most other CoreSight devices the replicator can use either of the
>>> optional clocks (or both). Document those optional clocks in the schema.
>>>
>>> Fixes: 3c15fddf3121 ("dt-bindings: arm: Convert CoreSight bindings to DT schema")
>>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
>>> ---
>>>    .../bindings/arm/arm,coresight-static-replicator.yaml          | 10 ++++++++++
>>>    1 file changed, 10 insertions(+)
>>>
>>> diff --git a/Documentation/devicetree/bindings/arm/arm,coresight-static-replicator.yaml b/Documentation/devicetree/bindings/arm/arm,coresight-static-replicator.yaml
>>> index a6f793ea03b6c193fc0ff72a45e0249a63a2ba3c..56e64067ed3d63c5e293a0840858f13428bacb45 100644
>>> --- a/Documentation/devicetree/bindings/arm/arm,coresight-static-replicator.yaml
>>> +++ b/Documentation/devicetree/bindings/arm/arm,coresight-static-replicator.yaml
>>> @@ -30,6 +30,16 @@ properties:
>>>      power-domains:
>>>        maxItems: 1
>>> +  clocks:
>>> +    minItems: 1
>>> +    maxItems: 2
>>> +
>>
>> For the static replicator, you don't have an APB clock, as they can't be
>> programmed. It may have an ATB clock. So minItems 0, maxItems: 1
> 
> It can, see qcom-apq8064.dtsi
> 
> Also minItems:0 doesn't make sense to me. I'd rather keep this as an
> optional property rather than requiring an empty set.

Interesting, that must be atclk in fact. Because a static replicator
only manages ATB transactions. It doesn't have an APB interface.

I am not an expert in DTB schema. But the point is the clocks are optional.

Suzuki


> 
>>
>> Suzuki
>>
>>
>>
>>> +  clock-names:
>>> +    minItems: 1
>>> +    enum:
>>> +      - apb_pclk
>>> +      - atclk
>>> +
>>>      in-ports:
>>>        $ref: /schemas/graph.yaml#/properties/ports
>>>        additionalProperties: false
>>>
>>
> 


