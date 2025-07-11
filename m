Return-Path: <linux-arm-msm+bounces-64601-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0925DB01D79
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Jul 2025 15:29:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 530F7A43A07
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Jul 2025 13:29:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8E9BF2D374A;
	Fri, 11 Jul 2025 13:29:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="idm+1zLI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1B2A2D3233
	for <linux-arm-msm@vger.kernel.org>; Fri, 11 Jul 2025 13:29:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752240569; cv=none; b=mwEpUVtOY2TUvBNHj1UHsHdLP7VfJTsYgQF4fB4Y160bK4kG1gAaMuYovIx5SjS70Lk8WTCrG6K2ushEovRED/L3Fb/+R4fKlz82spHFRkqsMwZRTfTQGYSh1zrrCc4CCCL/SHM+sJ67MatouD8T71vVS3yBrIJIeQHWa2eAqf8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752240569; c=relaxed/simple;
	bh=WDiPIjuqiChPX+asKp37/ByLWlXgZKPqmpcoStrHRxM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NLeeRaZKKiMhm2OHdiUAE1Ac/juD23/BsU3KdlIZGRTdCeIODbfTGpsdzGYhcODWC4zzGPaszJysku4EGMeC+LhX24ojk2J1EpoOiswBS0uPlYXHLHqf1FtXVUaqilEHLDul/yOXwtEJLnWzNHzGaeO2FmkIaW21160SdOMfPSY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=idm+1zLI; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2352400344aso19346355ad.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 11 Jul 2025 06:29:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1752240567; x=1752845367; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=pPQRVC+gYXzA0BtSE8rtHH/2+eUDBChSDQmEkeHBXgE=;
        b=idm+1zLI9/PsnIdNl2AjPQmXZRdGyJf4BmfeAe0FmCmw3CfOCb5XcK56fFNOyW9bKN
         9hLHYqM/i4dS9ifqsHHEUsDrDl34xwMjHufMPq4cAlAhGqPg9VqYih2F/gY/LTmiGIRY
         zMJgcrB+QxAf/nzzS0Hj7B3ygDIrQon2YRQGCND0ktvK9KySusQ9V3XiJOnduOr8hMNA
         jMoYUiiMcFzixAqeIyRVgyVya/G75h+4Qj8p0i1vybz/BGt53Kea5KmaeIb3oqrKB7z3
         9pmw0YAtfooThSpEMQsMPv/YGQZo4jRW/A2Vrk/82rWD2/8CAbNMn6SNbha6pm+cz4yU
         z3Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752240567; x=1752845367;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pPQRVC+gYXzA0BtSE8rtHH/2+eUDBChSDQmEkeHBXgE=;
        b=mg71tKv6Ihh1fIZSH/AKey07X3Hje2Ui/fptapTN4GHiA9rI1kbuInFmWXRFHpoSs+
         FoN5WLEbJWAvwh/4sFhqKAsjYQVzRNWvCk/9eFHTFTB13J27yDzQNIM6oksjSxlLH4bX
         dNMualsnSZkZCGsZl6i+S7lMIKeJkyhRhDxnAwmGFK7ULYhl4NxS9D6HAgckdIdczF1N
         +2nV6yno0PWI5gk2RGExLyWXgNVEToWV/pMU9mwtpTqwYDfBsO0BneJpMeX0bEyagHM6
         WFCRMpHJbG3XwMsu+0xDpTJq8eUr6AUAoVyPm3drMA/Ty/W8jCkjNquQtuBmuXNEWlhH
         T9EA==
X-Forwarded-Encrypted: i=1; AJvYcCUM1bZT0P0LEvQR54coJfchhKJwH+wo0d3HdoQ2Z/Hi25o5lzzYDgvGwfeVUlNY30p6UDm9JwyCLcoBScmn@vger.kernel.org
X-Gm-Message-State: AOJu0YzzHfONBeBT9iFRXHHzzLkfCpBGH0yeXeruLx4POg0DllYC96R7
	SQQz2BZ7otfpyiWyxiM6XagfnDZBp1F41PpxwNQK9UFux4ihU1pwi5yE5oEBE54JWX+ZyjDQKzc
	mwk3NsoLUVLgBPAbih0Kv2hfm4FvJWAl01+HfbGVrhw==
X-Gm-Gg: ASbGnctE7qMLpAlvTTAQF8oHH9vbx6S0ZTFSX7Z6gRU2wiG/ya3kYQTzLkhOWoXtK9r
	PYvjZMR15Aw2hq2GBUH41j2Ma2oDVjRxRpwXNpf5bxLGJ0NJ1FjBOcDJIjueRzBufDuYBYhd5hB
	QT97gqvV2orFe40iCSzeMasgpbaW4rcsCsqHiamryuBlsNqSREv5jI15of1yS0H8lgp4fVvpBvb
	zXtS03tChnNca1g4Sb3H5xIjoHol7/BNwzQLoON
X-Google-Smtp-Source: AGHT+IG4zXliACGrQprvEQ5wj7JsyfYLrvCmNiaEH+tMrZ+FZGuEDY+CASzdByOLlOs/WswgsUHGYzyvgG94wPmljLk=
X-Received: by 2002:a17:90b:4b8d:b0:313:b1a:3939 with SMTP id
 98e67ed59e1d1-31c50da140amr3325921a91.15.1752240566909; Fri, 11 Jul 2025
 06:29:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250711094031.4171091-1-quic_jinlmao@quicinc.com>
In-Reply-To: <20250711094031.4171091-1-quic_jinlmao@quicinc.com>
From: Mike Leach <mike.leach@linaro.org>
Date: Fri, 11 Jul 2025 14:29:14 +0100
X-Gm-Features: Ac12FXz2yLkWQDmM32aTY0N8Gj1hFRU1asfRpnUpH_TzU92dKa2GOxAV8v2hkGM
Message-ID: <CAJ9a7VhmHooDpht-gU7eAA5O028Tn=CVmCNHU6Qg+UYXp6kUQg@mail.gmail.com>
Subject: Re: [PATCH v6 0/5] coresight: Add remote etm support
To: Mao Jinlong <quic_jinlmao@quicinc.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>, James Clark <james.clark@linaro.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, coresight@lists.linaro.org, 
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi,

The majority of this code should not be in the coresight drivers
directory as it is not actually coresight.

This seems to be a communications bus system for various SoC
components - one of which happens to be a remote etm. It really needs
to be in a qcom-qmi subdirectory - which would also remove your
reliance on the coresight maintainers for getting all the qmi drivers
upstreamed. I note that there is a CONFIG dependency of
QCOM_QMI_HELPERS, which implies there is already a set of QMI
functionality not in the coresight directory.

We already have  a dummy coresight driver to cover these cases where
the actual etm source or sink might be in a different subsystem. This
could be extended in a generic manner to have an associated driver /
component, with the dummy source then forwarding the enable / disable
commands and acting as the coresight device for the purposes of
enabling the trace path from source to sink.

Thus the "coresight-remote-etm" driver becomes "qmi-node-etm" driver,
with the proprietary comms info, instance IDs etc encapsulated away
from any generic coresight information, and has an associated
coresight-dummy-source to handle the connection to the coresight trace
framework. I imagine the association could easily be modeled in device
tree using a phandle reference.

This would not change your usage model, but would give better
separation between what is clearly the QMI comms subsystem, and what
is needed to handle coresight connectivity.

Moreover, having the generic coresight dummy driver extended in this
way would allow other underlying communication systems to be used on
other devices in future.

Best Regards

Mike


On Fri, 11 Jul 2025 at 10:40, Mao Jinlong <quic_jinlmao@quicinc.com> wrote:
>
> The system on chip (SoC) consists of main APSS(Applications processor
> subsytem) and additional processors like modem, lpass. There is
> coresight-etm driver for etm trace of APSS. Coresight remote etm driver
> is for enabling and disabling the etm trace of remote processors.
> It uses QMI interface to communicate with remote processors' software
> and uses coresight framework to configure the connection from remote
> etm source to TMC sinks.
>
> Example to capture the remote etm trace:
>
> Enable source:
> echo 1 > /sys/bus/coresight/devices/tmc_etf0/enable_sink
> echo 1 > /sys/bus/coresight/devices/remote_etm0/enable_source
>
> Capture the trace:
> cat /dev/tmc_etf0 > /data/remote_etm.bin
>
> Disable source:
> echo 0 > /sys/bus/coresight/devices/remote_etm0/enable_source
>
> Changes since V5:
> 1. Fix the warning and error when compile.
> 2. Add traceid for remote etm.
> 3. Change qcom,qmi-id tp qcom,qmi-instance-id.
>
> Changes since V4:
> 1. Add coresight QMI driver
> 2. Add coresight qmi node and qcom,qmi-id of modem-etm in msm8996 dtsi
> V5: https://lwn.net/ml/all/20250424115854.2328190-1-quic_jinlmao@quicinc.com/
>
> Changes since V3:
> 1. Use different compatible for different remote etms in dt.
> 2. Get qmi instance id from the match table data in driver.
>
> Change since V2:
> 1. Change qcom,inst-id to qcom,qmi-id
> 2. Fix the error in code for type of remote_etm_remove
> 3. Depend on QMI helper in Kconfig
>
> Changes since V1:
> 1. Remove unused content
> 2. Use CORESIGHT_DEV_SUBTYPE_SOURCE_OTHERS as remote etm source type.
> 3. Use enabled instead of enable in driver data.
> 4. Validate instance id value where it's read from the DT.
>
> Mao Jinlong (5):
>   dt-bindings: arm: Add CoreSight QMI component description
>   coresight: Add coresight QMI driver
>   dt-bindings: arm: Add qcom,qmi-id for remote etm
>   coresight: Add remote etm support
>   arm64: dts: qcom: msm8996: Add coresight qmi node
>
>  .../bindings/arm/qcom,coresight-qmi.yaml      |  65 +++++
>  .../arm/qcom,coresight-remote-etm.yaml        |   9 +
>  arch/arm64/boot/dts/qcom/msm8996.dtsi         |  11 +
>  drivers/hwtracing/coresight/Kconfig           |  23 ++
>  drivers/hwtracing/coresight/Makefile          |   2 +
>  drivers/hwtracing/coresight/coresight-qmi.c   | 198 +++++++++++++
>  drivers/hwtracing/coresight/coresight-qmi.h   | 101 +++++++
>  .../coresight/coresight-remote-etm.c          | 262 ++++++++++++++++++
>  8 files changed, 671 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/arm/qcom,coresight-qmi.yaml
>  create mode 100644 drivers/hwtracing/coresight/coresight-qmi.c
>  create mode 100644 drivers/hwtracing/coresight/coresight-qmi.h
>  create mode 100644 drivers/hwtracing/coresight/coresight-remote-etm.c
>
> --
> 2.25.1
>


--
Mike Leach
Principal Engineer, ARM Ltd.
Manchester Design Centre. UK

