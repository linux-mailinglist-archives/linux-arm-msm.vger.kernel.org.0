Return-Path: <linux-arm-msm+bounces-50632-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BDDA9A563BF
	for <lists+linux-arm-msm@lfdr.de>; Fri,  7 Mar 2025 10:28:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B794C7A475B
	for <lists+linux-arm-msm@lfdr.de>; Fri,  7 Mar 2025 09:27:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7AA00201278;
	Fri,  7 Mar 2025 09:28:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="l7aMHI7v"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D08A1E5B85
	for <linux-arm-msm@vger.kernel.org>; Fri,  7 Mar 2025 09:28:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741339724; cv=none; b=XCOQDPJ4KVwGVMdzsbcBR/KtErv/r3+qoTdfaNfOlX6VHhvx/OexB88Omp1yZrfBw+ESxI8a883LPV/H9+2CvBfUffX4LyTl5Vsd2dSybnUEQuHnhcoIeeaTf07YVlqhtUVafooC0nDqdoRnMFl+xwS6j8funPUw2w0EP+xWy80=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741339724; c=relaxed/simple;
	bh=m8Tj0POgnoapLm/OY8OJA5+oLBG3GUog23SkfXC+J4s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VbSeK0AiHwWCjLvqrDiLc7x3OADoqVAc1A8t5OWJrMx6a4QKPq6fqhLUuOoUEc1au5w0y4u6l/kj47FAR1mhXJPHJVesmERjcAd7rh5zglqHxNQhIxM4byzqpYkE0G1bB/N+tzZ5ghdYvNCiK8MxA9etUPYvKnuGZcTCccPp9Ic=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=l7aMHI7v; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-223959039f4so32077365ad.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 07 Mar 2025 01:28:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741339722; x=1741944522; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=9LozWTu8KuZwTBoDAKofTRfh40nSpSm6qy1uB6jmrPY=;
        b=l7aMHI7vcA8Ig/VHliluzWWM6QXV8La4vkF8XK7Mc8uhGkERmb6T7o042yf+lVXt4A
         mrXLEAUOSN7uW7lbqB59RufznUDbpYXN5uFpQVGFJtp8XDM9baMpf0rOIjBn9wWs3NhC
         z6BEMIofNNe2tWrANix9vuoN5HPBzvxUuLEBgkXJoI9jnEA/5whMbvn1BVRseqzOLhJj
         tr9KFzLIkL4KnIecuNjPURD6kY9/1mDx8zb7/GJKjuQcadJ9DVnEtliC8GXUOkIH0NLL
         Z73O62VvyYahZRq7O0PRt3HZLB7WyQIcFhZ7yT+14KSyYYaLnGoS9QIzm1gNia99VJXS
         iQ8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741339722; x=1741944522;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9LozWTu8KuZwTBoDAKofTRfh40nSpSm6qy1uB6jmrPY=;
        b=gRB/OSVHd43Wc/Njm8IfFax2/bPrgp8rW07Bpc60hXZkQs9ufdk32UEcJG1xuScZ28
         FKJSL0dNanoEOzCZrQZ938Z20JWmKo0+tXi1QuOQonS2USGRz5yDfF9mGZ3UeuizN+Ee
         ovABaA4ZgsYuDHUTRBiA8ipCIbJ+aiOM6fAtKhyxMXIcdnaku0DJciHGIVYWvadotF0Q
         1xMUyf1q+dLW7788I+0/wcm8GD68FMxPGMAaQMFatzj1EU+g2dMG6UsrPjNaE1gsJHGV
         bqVvKw+fCZE6H1likCOS5zYzu2YHd6hTCgz2R1ity93RjuYopwT0c9EJW4wPHOttt/Y4
         a0oA==
X-Forwarded-Encrypted: i=1; AJvYcCWQWN1knnsMFAW7L7WhkruTW9IOdryUcFvbcCeRvn0QXsqBihuvaqs/l4AaBzBlof7z9Q6XBgauuZsDwgEb@vger.kernel.org
X-Gm-Message-State: AOJu0YwzAMMoKg5B0b5XppsadE2doZCIY5OHz7SApElfLU6TlJD4bPU9
	s+TrUCqrRYr8OJzTTqGFzGFDTIihm5xgW5OYo0vSENRmc/JNAQXGc4LU2ocqSEpgQ5A0r0J7kEA
	OjQxQAI/hm8X+lcsu8kDk1vKhogLM/d5icSKQcQ==
X-Gm-Gg: ASbGncsglTyxwCCHMSEKtbPaxQBk2zx7HHh565DTyVzVJmzYUik0xrDKnHlTFIFAjFS
	H+f3a9WcMxBtPYAMK656i183OY+BhKeR7KfQMjgNRvnDBPs5H914DnydzAHlxhjSTaCTr4BZjrA
	PawRnWIEcITZvSUsnuTVjinZUyl+Q=
X-Google-Smtp-Source: AGHT+IEHRyep+CWHS6MMha8nUs8GPhmkNXh4lCyvkD09UFdn8zd5EhwUXs2EBs8mRJAWZqt2jvGg4lY4AfpwLNMYolA=
X-Received: by 2002:a05:6a00:4f90:b0:736:4a5b:7f08 with SMTP id
 d2e1a72fcca58-736aaae86d4mr3932036b3a.22.1741339721658; Fri, 07 Mar 2025
 01:28:41 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250227092640.2666894-1-quic_songchai@quicinc.com>
 <20250227092640.2666894-2-quic_songchai@quicinc.com> <20250304-certain-aboriginal-magpie-cade86@krzk-bin>
In-Reply-To: <20250304-certain-aboriginal-magpie-cade86@krzk-bin>
From: Mike Leach <mike.leach@linaro.org>
Date: Fri, 7 Mar 2025 09:28:29 +0000
X-Gm-Features: AQ5f1JoxSZ1K86_Hd1c_UCyRuSfkTy9x4ZTGUItIE7TwPlDH-oNja8NI8CjlxzU
Message-ID: <CAJ9a7VjOU2d0tGjvbMBWwWtjKp38hj_NptVYFHDy9Zrs-sdOeg@mail.gmail.com>
Subject: Re: [PATCH v3 1/7] dt-bindings: arm: Add support for Coresight TGU trace
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: songchai <quic_songchai@quicinc.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	James Clark <james.clark@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Andy Gross <agross@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org, 
	coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi,

On Tue, 4 Mar 2025 at 08:05, Krzysztof Kozlowski <krzk@kernel.org> wrote:
>
> On Thu, Feb 27, 2025 at 05:26:34PM +0800, songchai wrote:
> > From: Songwei Chai <quic_songchai@quicinc.com>
> >
> > The Trigger Generation Unit (TGU) is designed to detect patterns or
> > sequences within a specific region of the System on Chip (SoC). Once
> > configured and activated, it monitors sense inputs and can detect a
> > pre-programmed state or sequence across clock cycles, subsequently
> > producing a trigger.
> >
> >    TGU configuration space
> >         offset table
> >  x-------------------------x
> >  |                         |
> >  |                         |
> >  |                         |                           Step configuration
> >  |                         |                             space layout
> >  |   coresight management  |                           x-------------x
> >  |        registers        |                     |---> |             |
> >  |                         |                     |     |  reserve    |
> >  |                         |                     |     |             |
> >  |-------------------------|                     |     |-------------|
> >  |                         |                     |     | priority[3] |
> >  |         step[7]         |<--                  |     |-------------|
> >  |-------------------------|   |                 |     | priority[2] |
> >  |                         |   |                 |     |-------------|
> >  |           ...           |   |Steps region     |     | priority[1] |
> >  |                         |   |                 |     |-------------|
> >  |-------------------------|   |                 |     | priority[0] |
> >  |                         |<--                  |     |-------------|
> >  |         step[0]         |-------------------->      |             |
> >  |-------------------------|                           |  condition  |
> >  |                         |                           |             |
> >  |     control and status  |                           x-------------x
> >  |           space         |                           |             |
> >  x-------------------------x                           |Timer/Counter|
> >                                                        |             |
> >                                                      x-------------x
> > TGU Configuration in Hardware
> >
> > The TGU provides a step region for user configuration, similar
> > to a flow chart. Each step region consists of three register clusters:
> >
> > 1.Priority Region: Sets the required signals with priority.
> > 2.Condition Region: Defines specific requirements (e.g., signal A
> > reaches three times) and the subsequent action once the requirement is
> > met.
> > 3.Timer/Counter (Optional): Provides timing or counting functionality.
> >
> > Add a new coresight-tgu.yaml file to describe the bindings required to
> > define the TGU in the device trees.
> >
> > Signed-off-by: Songwei Chai <quic_songchai@quicinc.com>
> > Signed-off-by: songchai <quic_songchai@quicinc.com>
>
> Don't duplicate yourself.
>
> Anyway, this is marked as v3, I cannot find previous versions, no
> changelog, no references.
>
> What happened here in this binding?
>
> > ---
> >  .../bindings/arm/qcom,coresight-tgu.yaml      | 135 ++++++++++++++++++
> >  1 file changed, 135 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/arm/qcom,coresight-tgu.yaml
> >
> > diff --git a/Documentation/devicetree/bindings/arm/qcom,coresight-tgu.yaml b/Documentation/devicetree/bindings/arm/qcom,coresight-tgu.yaml
> > new file mode 100644
> > index 000000000000..a41ac68a4fe7
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/arm/qcom,coresight-tgu.yaml
> > @@ -0,0 +1,135 @@
> > +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> > +# Copyright (c) 2023-2025 Qualcomm Innovation Center, Inc. All rights reserved.
>
> 2023 and 2024? Where was it published in these years?
>
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/arm/qcom,coresight-tgu.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Trigger Generation Unit - TGU
> > +
> > +description: |
> > +  The Trigger Generation Unit (TGU) is a Data Engine which can be utilized
> > +  to sense a plurality of signals and create a trigger into the CTI or
> > +  generate interrupts to processors. The TGU is like the trigger circuit
> > +  of a Logic Analyzer. The corresponding trigger logic can be realized by
> > +  configuring the conditions for each step after sensing the signal.
> > +  Once setup and enabled, it will observe sense inputs and based upon
> > +  the activity of those inputs, even over clock cycles, may detect a
> > +  preprogrammed state/sequence and then produce a trigger or interrupt.
> > +
> > +  The primary use case of the TGU is to detect patterns or sequences on a
> > +  given set of signals within some region of the SoC.
> > +
> > +maintainers:
> > +  - Mao Jinlong <quic_jinlmao@quicinc.com>
> > +  - Sam Chai <quic_songchai@quicinc.com>
> > +
> > +# Need a custom select here or 'arm,primecell' will match on lots of nodes
> > +select:
> > +  properties:
> > +    compatible:
> > +      contains:
> > +        enum:
> > +          - qcom,coresight-tgu
> > +  required:
> > +    - compatible
> > +
> > +properties:
> > +  compatible:
> > +    items:
> > +      - const: qcom,coresight-tgu
> > +      - const: arm,primecell
> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +  clocks:
> > +    maxItems: 1
> > +
> > +  clock-names:
> > +    items:
> > +      - const: apb_pclk
> > +
> > +  qcom,tgu-steps:
> > +    description:
> > +      The trigger logic is realized by configuring each step after sensing
> > +      the signal. The parameter here is used to describe the maximum of steps
> > +      that could be configured in the current TGU.
> > +    $ref: /schemas/types.yaml#/definitions/uint32
> > +    minimum: 1
> > +    maximum: 8
> > +

Hardware features are usually defined by ID registers in coresight
devices. e.g. ETM has a number of ID registers that describe the
number of comparators / counters etc.
Does this device not have similar registers? Is there not a unique ID
for each hardware variant - hardware discoverablility is an
architecture requirement for coresight devices?

> > +  qcom,tgu-regs:
> > +    description:
> > +      There are some "groups" register clusters in each step, which are used to
> > +      configure the signal that we want to detect. Meanwhile, each group has its
> > +      own priority, and the priority increases with number of groups. For example,
> > +      group3 has a higher priority than group2, the signal configured in group3
> > +      will be sensed more preferentially than the signal which is configured in group2.
> > +      The parameter here is used to describe the signal number that each group
> > +      could be configured.
>
> And all groups are indexed by number? Or do they have names?
>
> > +    $ref: /schemas/types.yaml#/definitions/uint32
> > +    minimum: 1
> > +    maximum: 18
> > +
> > +  qcom,tgu-conditions:
> > +    description:
> > +      A condition sets a specific requirement for a step and defines the subsequent
> > +      action once the requirement is met. For example, in step two, if signal A is
> > +      detected three times, the process jumps back to step one. The parameter describes
> > +      the register number for each functionality, whether it is setting a specific
> > +      requirement or defining a subsequent action.
> > +    $ref: /schemas/types.yaml#/definitions/uint32
> > +    minimum: 1
> > +    maximum: 4
> > +
> > +  qcom,tgu-timer-counters:
> > +    description:
> > +      TGU has timer and counter which are used to set some requirement on each step.
>
> Wrap according to Linux coding style, so at 80.
>
> > +      For example, we could use counter to create a trigger into CTI once TGU senses
> > +      the target signal three times.This parameter is used to describe the number of
> > +      Timers/Counters in TGU.
> > +    $ref: /schemas/types.yaml#/definitions/uint32
> > +    minimum: 0
>
> Drop
>
> > +    maximum: 2
> > +
> > +  in-ports:
> > +    $ref: /schemas/graph.yaml#/properties/ports
> > +    additionalProperties: false
> > +
> > +    properties:
> > +      port:
> > +        description: AXI Slave connected to another Coresight component
>
> So this TGU can be connected to anything in coresight graph, no
> restrictions?
>


Coresight uses APB for register access and ATB for moving trace from
source to sink. The only use of AXI is on the ETR/CATU output saving
trace data into system memory.

> > +        $ref: /schemas/graph.yaml#/properties/port
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +  - clocks
> > +  - clock-names
>
> Most likely you miss also: in-ports
>
>
> Best regards,
> Krzysztof
>

Regards

Mike

-- 
Mike Leach
Principal Engineer, ARM Ltd.
Manchester Design Centre. UK

