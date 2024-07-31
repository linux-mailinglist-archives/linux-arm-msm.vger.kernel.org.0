Return-Path: <linux-arm-msm+bounces-27546-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C1E4F943304
	for <lists+linux-arm-msm@lfdr.de>; Wed, 31 Jul 2024 17:21:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E59AB1C20823
	for <lists+linux-arm-msm@lfdr.de>; Wed, 31 Jul 2024 15:21:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8BD871AE87F;
	Wed, 31 Jul 2024 15:15:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="sEM5sj5N"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7F6A1BBBE7
	for <linux-arm-msm@vger.kernel.org>; Wed, 31 Jul 2024 15:15:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722438915; cv=none; b=coSEkiJp6Lpk8d74bwq2hNBhlSPlK1Blnx7Yrk20syJMnz8fgy/F1OtyvKN/S2l3LDQ6xxSUfNO6t34bJJEOe8GyQjnbLjoOuAcMuBt8K57Tl0YKjliPxObmidydQuB3t9fhR9hA2zjQguO4QvlK+OLxYh0DohcE4svOZ8HWO7E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722438915; c=relaxed/simple;
	bh=VpgY0Xg6DfUwXevHJITHSptNpZ/KejiVVBO0M9I7wcE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bzTj/gphrVzb1cA6cMnXsc+odgM59VOeFHn53o5Jm9KKPV+72xbof57+aF7bQ9zOPv9jQVSdjk5qDygmbLXM02OANPyN/mX6btYmKqd5XvJHfsa4CQXvPTB14knmm1kDCdjk5WJRtFGoNCBqUKxs2U87UelwCwi6rNSGsGM45D8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=sEM5sj5N; arc=none smtp.client-ip=209.85.215.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-6e7e23b42c3so3705688a12.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 31 Jul 2024 08:15:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1722438913; x=1723043713; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=A7L5Do6ql/oByA0Og1lQHP5Zdt58GNPzs9bcb2110UQ=;
        b=sEM5sj5NYGYb+rUnHGpCMbfl/hEsSkYUl9x8wWdIlbJSIexIP3afYESisa+An8ocPI
         cOePFTIrqk+31MapWL/9IQ+HM7rI90KG9KVQHr4iSelxrBQjT4P4Ol1RACW/S916bgCr
         k5PofrfFYM5uYOipDc4UtIsu9BP2YXNFvZRQPPMVFRXHYd6WnSnN9DboxLmrqcWCHULy
         Zd5fTadYXM+nnVWNIcEiUWL/2JOZan6SsuGuAHLaoyz/ah47ipVFL4b8TTFWOeboRh4V
         2b+2OJ+idBMvIDZMuZEyn5VfYRolU3sTZgYuGYLtNE5bhzBGgO6Tneof6C5Yw9MyWYxp
         ngWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722438913; x=1723043713;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=A7L5Do6ql/oByA0Og1lQHP5Zdt58GNPzs9bcb2110UQ=;
        b=j14RYLoRcY9ffnkDrkaHJxAUD3tHZESiUiBdzojectKDxxs4jNJyuFNavtOiJ/P5uz
         ZcscrJK/chPhMGnCrTZTT9+2ZMqxcu5A31lT1qtPHLbOQt/JL8/i0ekJD1rrFBRl2RtS
         VVqKOQZZAqnn/mvZC582ZvVy1s4TDXGLedfMsV7b4lzSdE/i9/meZvwKVergLsviQe+G
         Qj41SpKaUsBYmTtPxSPj9CrKCkU5DG1Wu21iugqvWW1uhlVwvFp+OOkTjDhKSBGd5D4e
         7sRLcxjkO6GQ56vT2QFEcAQuccacgrQC2x4MkfxlEvZ2pVyguSELm+d2gvkFk3auVwlU
         9Pyg==
X-Forwarded-Encrypted: i=1; AJvYcCXOTJOmRTMeZvrHyEieXvonnTDEDPyMMFUx3mSgYGST5PsAJiRufKYcALCNVuAUsqG6QYQ0KBI5bC6eKR4iitLx8ShtmOVuf9vNBn9yIQ==
X-Gm-Message-State: AOJu0YxH9r8KSFEEwIaJEt0Xn8zldZNaJB7VQZ9oNmw5QqO2TobIlFQy
	Hyc74qKJTeiGT00Q5wV8bMiJKeVrTQI4wce7KnJBwtUSNMIlP62MbTJqAPjKgxaMWBjHH3quSKg
	aJcDeL4st32lI3PMy8PSm9UYsnzpJVDkoAXstLA==
X-Google-Smtp-Source: AGHT+IGOWnZACRw0j7R7sCt8gjeIABsJBlUfMD6ugy5Yf6aBd2+UubVXWPKVHQfhzdmGpu+w3Qe6DXJGRnK/31tW6FI=
X-Received: by 2002:a17:90b:3b51:b0:2c9:a3d4:f044 with SMTP id
 98e67ed59e1d1-2cf7e1c6781mr12380574a91.11.1722438913083; Wed, 31 Jul 2024
 08:15:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240703122340.26864-1-quic_jinlmao@quicinc.com>
In-Reply-To: <20240703122340.26864-1-quic_jinlmao@quicinc.com>
From: Mike Leach <mike.leach@linaro.org>
Date: Wed, 31 Jul 2024 16:15:02 +0100
Message-ID: <CAJ9a7VhwD6kFHPTgrfs+7fNx4nXZPqXTLK0ObmJM3A6mQfmuyQ@mail.gmail.com>
Subject: Re: [PATCH v4 0/2] coresight: core: Add device name support
To: Mao Jinlong <quic_jinlmao@quicinc.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>, James Clark <james.clark@arm.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, coresight@lists.linaro.org, 
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	Tingwei Zhang <quic_tingweiz@quicinc.com>, Yuanfang Zhang <quic_yuanfang@quicinc.com>, 
	Tao Zhang <quic_taozha@quicinc.com>, songchai <quic_songchai@quicinc.com>, 
	Jie Gan <quic_jiegan@quicinc.com>
Content-Type: text/plain; charset="UTF-8"

Hi,

1) As per Krzysztof comment - use the standard "label" property

2) Do not use the label string as the node name - there is no
guarantee of uniqueness which will cause issues. Please add the label
as a sysfs file to the standard node.
This uses the existing standard names, allowing any scripting based on
this to continue to work, and will not cause issues with uniqueness

e.g.
This will allow :

cat cti_cpu0/label

to extract the additional hardware context information that you need.

Thanks

Mike


On Wed, 3 Jul 2024 at 13:24, Mao Jinlong <quic_jinlmao@quicinc.com> wrote:
>
> With current design, the name of the non-cpu bounded coresight
> component is the device type with the number. And with 'ls' command
> we can get the register address of the component. But from these
> information, we can't know what the HW or system the component belongs
> to. Add device-name in DT to support it.
>
> cti_sys0 -> ../../../devices/platform/soc@0/138f0000.cti/cti_sys0
> cti_sys1 -> ../../../devices/platform/soc@0/13900000.cti/cti_sys1
> tpdm0 -> ../../../devices/platform/soc@0/10b0d000.tpdm/tpdm0
> tpdm1 -> ../../../devices/platform/soc@0/10c28000.tpdm/tpdm1
> tpdm2 -> ../../../devices/platform/soc@0/10c29000.tpdm/tpdm2
>
> Change since V3:
> 1. Change device-name to arm,cs-dev-name.
> 2. Add arm,cs-dev-name to only CTI and sources' dt-binding.
>
> Change since V2:
> 1. Fix the error in coresight core.
> drivers/hwtracing/coresight/coresight-core.c:1775:7: error: assigning to 'char *' from 'const char *' discards qualifiers
>
> 2. Fix the warning when run dtbinding check.
> Documentation/devicetree/bindings/arm/arm,coresight-cpu-debug.yaml: device-name: missing type definition
>
> Change since V1:
> 1. Change coresight-name to device name.
> 2. Add the device-name in coresight dt bindings.
>
>
> Mao Jinlong (2):
>   coresight: core: Add device name support
>   dt-bindings: arm: Add device-name in the coresight components
>
>  .../bindings/arm/arm,coresight-catu.yaml      |  6 +++
>  .../bindings/arm/arm,coresight-cpu-debug.yaml |  6 +++
>  .../bindings/arm/arm,coresight-cti.yaml       |  6 +++
>  .../arm/arm,coresight-dummy-sink.yaml         |  6 +++
>  .../arm/arm,coresight-dummy-source.yaml       |  6 +++
>  .../arm/arm,coresight-dynamic-funnel.yaml     |  6 +++
>  .../arm/arm,coresight-dynamic-replicator.yaml |  6 +++
>  .../bindings/arm/arm,coresight-etb10.yaml     |  6 +++
>  .../bindings/arm/arm,coresight-etm.yaml       |  6 +++
>  .../arm/arm,coresight-static-funnel.yaml      |  6 +++
>  .../arm/arm,coresight-static-replicator.yaml  |  6 +++
>  .../bindings/arm/arm,coresight-stm.yaml       |  6 +++
>  .../bindings/arm/arm,coresight-tmc.yaml       |  6 +++
>  .../bindings/arm/arm,coresight-tpiu.yaml      |  6 +++
>  .../bindings/arm/qcom,coresight-tpda.yaml     |  6 +++
>  .../bindings/arm/qcom,coresight-tpdm.yaml     |  6 +++
>  drivers/hwtracing/coresight/coresight-core.c  | 37 ++++++++++---------
>  .../hwtracing/coresight/coresight-platform.c  | 31 ++++++++++++++++
>  include/linux/coresight.h                     |  3 +-
>  19 files changed, 149 insertions(+), 18 deletions(-)
>
> Mao Jinlong (2):
>   dt-bindings: arm: Add device-name in the coresight components
>   coresight: core: Add device name support
>
>  .../bindings/arm/arm,coresight-cti.yaml       |  6 +++
>  .../arm/arm,coresight-dummy-source.yaml       |  6 +++
>  .../bindings/arm/arm,coresight-stm.yaml       |  6 +++
>  .../bindings/arm/qcom,coresight-tpdm.yaml     |  6 +++
>  drivers/hwtracing/coresight/coresight-core.c  | 37 ++++++++++---------
>  .../hwtracing/coresight/coresight-platform.c  | 30 +++++++++++++++
>  include/linux/coresight.h                     |  3 +-
>  7 files changed, 76 insertions(+), 18 deletions(-)
>
> --
> 2.41.0
>


--
Mike Leach
Principal Engineer, ARM Ltd.
Manchester Design Centre. UK

