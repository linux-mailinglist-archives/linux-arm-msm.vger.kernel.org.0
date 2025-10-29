Return-Path: <linux-arm-msm+bounces-79417-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 87542C19EAB
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Oct 2025 12:03:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id DB93B4F3445
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Oct 2025 11:01:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BABD82EBBA2;
	Wed, 29 Oct 2025 11:01:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="d2Ab3UA0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com [209.85.222.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9CFD2D8395
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Oct 2025 11:01:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761735678; cv=none; b=UjTIHt6dK7/ag97T4O5ZJaPb2F+qh7hS9ch4JRuThG/viybeEGMEsYHkWa1Fatc3V49gR1dcY3z4GLdCKzltY4kwHGpiAnjQfi2ZB5bHxvI7T87TVnNZr9r8QM9IRfZTWU9/SIo1FYtjUFFQhJuz9YhdEkTtgMGXTt8pp4pTU7c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761735678; c=relaxed/simple;
	bh=hXAUBSkUqybhhXZyTYQ9DuFdsPNmrVbpbQYulz4IDPk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=k41508/V41s3Wh7lq72+Qhxz35eE/D3lSZZwMmiVYtN6qPRH2mEP4DVt/DPTk31K3rdZGwg58F6p8I89dGGgNL2kKFVGnj/OcVjZbOTbnEVmMy+Vji99LvHiTl4Lvk2eHuHP8IJkUqbg9kSmO1GPxP8jFkFEyQ99T6VSJmj+aVk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=d2Ab3UA0; arc=none smtp.client-ip=209.85.222.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-qk1-f172.google.com with SMTP id af79cd13be357-88f2aebce7fso730382085a.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 Oct 2025 04:01:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761735675; x=1762340475; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eQWDpVejCHNnm4EwaVB6drbJOWDW2V1Yh8yBgxJN8YA=;
        b=d2Ab3UA0YObITkdK6FoBmoK0OZVlsKdKYJPms8kn3nOg2HLJfJA+G1sL/ZyOVvf8wo
         KBylXVJ/xk5CYCcoW7Oj2veY2xoOF8Y7ksl6ogjdGO2jvdKIL6I/3WN3kXwammHa4Hex
         niBiJrBggqs+lcEY7KMiyFCzSLWKcsxyKQpi95l2JndUav0dEOJahdoRI7a8K1m9jdph
         XYiFWMHG8tvaT1g8qbQqg9q05UFZ1BCSUBEtvu2TJhg5ylTRCSh1iC3ysxaLA8iY1EY0
         SQE7mh9veBTJvJl5IJXUD4yFccv5hgRI7/On1htphSMKry5IsVfP/xcir+5EU0FmdYoe
         fdTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761735675; x=1762340475;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eQWDpVejCHNnm4EwaVB6drbJOWDW2V1Yh8yBgxJN8YA=;
        b=gq4X6pZhzrXFMtOzNTuA5DDUSkH5uRBgP6EFkFTAXE45zdNeZ4mbP9ptoqgsBU03CK
         9TSJIN2YOQdiYp+/VIQoANVrtAoKs2h+PkXgTbhknBVvWogppsoRYo2ggE6v2w9wNJQr
         hncctXMbU8yEZyFQkRo7PbtO1TY9q8f6lIrSctyUvy0szNdfDj6+ExyFVlk9BC/zLe/5
         ltmE2qT6Z9YzZLzKNlnrXgN1yNa6tplo73Vdzo/tj6QFSKQUfp7NLNBWoSogqU5cOmZn
         qPLwUS+TB6IrXwfUSB5bbSSypHQwnfVnIDaZBK3Nw5ccsk6cpH2T98gtPPZPrltcUvlK
         Ie9Q==
X-Forwarded-Encrypted: i=1; AJvYcCXw6hN19m9Wi1yBonozJu3A0pb/Zm2ymri17SmPa9YKcZyhwWa08c0SUDzy/mvDiQbDQpgWrEnGdxwxmqOK@vger.kernel.org
X-Gm-Message-State: AOJu0YyOli6E8HhlS/QaIWm15MDJlrmvn6WEu1tKlU5+IDHrNXFXZflI
	avj/sxQ24RU9lox4i3hojGEN9SxxWiuCdp/WqlAVh8OKNlgjJYaSzfYK1ahGCldCKXeYJv0ZJN1
	H0wuvVCIe/jGVjwVp/eIVpEkYEY0th81vxm3N65MEMQ==
X-Gm-Gg: ASbGncvJcZBlTC3z8kAR4t53wTOMkcmRXn+jmoyCiCuSQuS4N2DOs6s/rorvtVNCkbQ
	vh+PfIFSHmhrUkhvLZLjYwlbyJbJXFVfYE9HKbvUlmsbuxFwru7KcZFYtkyz+2iXRmX1FOvIC9R
	uzif+zPfd6wsshRqEwOFwgJUbJGoVLlVkmdkVQhKtjDU5OqF/ej/CBLgbfPggZ12OB1DY31HwOE
	mkOmfD5yLpnIvSxxkECvvOvn0NwZYtaus6JxebPBtYc4RCrL+iYtoPdLJBeXfOc1x+44n3SZyRQ
	ylLmzJPqmpazaOdhZQ==
X-Google-Smtp-Source: AGHT+IHWP5Cbc3G4W0Ik0NLLQcf3Rmww0dInCJA9bBcxiEAnG512YgHlmnNkFU3hoCfwOl86Kin1pgVlI3IyVxMDBkU=
X-Received: by 2002:a05:620a:7019:b0:829:fa5d:6f0d with SMTP id
 af79cd13be357-8a8efb03ddfmr306069985a.82.1761735674490; Wed, 29 Oct 2025
 04:01:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251027-cpu_cluster_component_pm-v1-0-31355ac588c2@oss.qualcomm.com>
In-Reply-To: <20251027-cpu_cluster_component_pm-v1-0-31355ac588c2@oss.qualcomm.com>
From: Mike Leach <mike.leach@linaro.org>
Date: Wed, 29 Oct 2025 11:01:03 +0000
X-Gm-Features: AWmQ_bmBZ4u6Nr5AkhU0uSKV2P-I149L6WKOoDdLwfOOqdcc5hyzFz1zWOkxIwc
Message-ID: <CAJ9a7VipQh=y0o+6k=fLMMK408E5eGD6vhY2TKBMm+q63NUiWA@mail.gmail.com>
Subject: Re: [PATCH 00/12] coresight: Add CPU cluster funnel/replicator/tmc support
To: Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>, James Clark <james.clark@linaro.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Mathieu Poirier <mathieu.poirier@linaro.org>, Leo Yan <leo.yan@linux.dev>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, kernel@oss.qualcomm.com, 
	coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, Jie Gan <jie.gan@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

This entire set seems to initially check the generic power domain for
a list of associated CPUs, then check CPU state for all other
operations.

Why not simply use the generic power domain state itself, along with
the power up / down notifiers to determine if the registers are safe
to access? If the genpd is powered up then the registers must be safe
to access?

Regards

Mike

On Tue, 28 Oct 2025 at 06:28, Yuanfang Zhang
<yuanfang.zhang@oss.qualcomm.com> wrote:
>
> This patch series introduces support for CPU cluster local CoreSight comp=
onents,
> including funnel, replicator, and TMC, which reside inside CPU cluster
> power domains. These components require special handling due to power
> domain constraints.
>
> Unlike system-level CoreSight devices, CPU cluster local components share=
 the
> power domain of the CPU cluster. When the cluster enters low-power mode (=
LPM),
> the registers of these components become inaccessible. Importantly, `pm_r=
untime_get`
> calls alone are insufficient to bring the CPU cluster out of LPM, making
> standard register access unreliable in such cases.
>
> To address this, the series introduces:
> - Device tree bindings for CPU cluster local funnel, replicator, and TMC.
> - Introduce a cpumask to record the CPUs belonging to the cluster where t=
he
>   cpu cluster local component resides.
> - Safe register access via smp_call_function_single() on CPUs within the
>   associated cpumask, ensuring the cluster is power-resident during acces=
s.
> - Delayed probe support for CPU cluster local components when all CPUs of
>   this CPU cluster are offline, re-probe the component when any CPU in th=
e
>   cluster comes online.
> - Introduce `cs_mode` to link enable interfaces to avoid the use
>   smp_call_function_single() under perf mode.
>
> Patch summary:
> Patch 1: Adds device tree bindings for CPU cluster funnel/replicator/TMC =
devices.
> Patches 2=E2=80=933: Add support for CPU cluster funnel.
> Patches 4-6: Add support for CPU cluster replicator.
> Patches 7-10: Add support for CPU cluster TMC.
> Patch 11: Add 'cs_mode' to link enable functions.
> Patches 12-13: Add Coresight nodes for APSS debug block for x1e80100 and
> fix build issue.
>
> Verification:
>
> This series has been verified on sm8750.
>
> Test steps for delay probe:
>
> 1. limit the system to enable at most 6 CPU cores during boot.
> 2. echo 1 >/sys/bus/cpu/devices/cpu6/online.
> 3. check whether ETM6 and ETM7 have been probed.
>
> Test steps for sysfs mode:
>
> echo 1 >/sys/bus/coresight/devices/tmc_etf0/enable_sink
> echo 1 >/sys/bus/coresight/devices/etm0/enable_source
> echo 1 >/sys/bus/coresight/devices/etm6/enable_source
> echo 0 >/sys/bus/coresight/devices/etm0/enable_source
> echo 0 >/sys/bus/coresight/devicse/etm6/enable_source
> echo 0 >/sys/bus/coresight/devices/tmc_etf0/enable_sink
>
> echo 1 >/sys/bus/coresight/devices/tmc_etf1/enable_sink
> echo 1 >/sys/bus/coresight/devcies/etm0/enable_source
> cat /dev/tmc_etf1 >/tmp/etf1.bin
> echo 0 >/sys/bus/coresight/devices/etm0/enable_source
> echo 0 >/sys/bus/coresight/devices/tmc_etf1/enable_sink
>
> echo 1 >/sys/bus/coresight/devices/tmc_etf2/enable_sink
> echo 1 >/sys/bus/coresight/devices/etm6/enable_source
> cat /dev/tmc_etf2 >/tmp/etf2.bin
> echo 0 >/sys/bus/coresight/devices/etm6/enable_source
> echo 0 >/sys/bus/coresight/devices/tmc_etf2/enable_sink
>
> Test steps for sysfs node:
>
> cat /sys/bus/coresight/devices/tmc_etf*/mgmt/*
>
> cat /sys/bus/coresight/devices/funnel*/funnel_ctrl
>
> cat /sys/bus/coresight/devices/replicator*/mgmt/*
>
> Test steps for perf mode:
>
> perf record -a -e cs_etm//k -- sleep 5
>
> Signed-off-by: Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>
> ---
> Yuanfang Zhang (12):
>       dt-bindings: arm: coresight: Add cpu cluster tmc/funnel/replicator =
support
>       coresight-funnel: Add support for CPU cluster funnel
>       coresight-funnel: Handle delay probe for CPU cluster funnel
>       coresight-replicator: Add support for CPU cluster replicator
>       coresight-replicator: Handle delayed probe for CPU cluster replicat=
or
>       coresight-replicator: Update mgmt_attrs for CPU cluster replicator =
compatibility
>       coresight-tmc: Add support for CPU cluster ETF and refactor probe f=
low
>       coresight-tmc-etf: Refactor enable function for CPU cluster ETF sup=
port
>       coresight-tmc: Update tmc_mgmt_attrs for CPU cluster TMC compatibil=
ity
>       coresight-tmc: Handle delayed probe for CPU cluster TMC
>       coresight: add 'cs_mode' to link enable functions
>       arm64: dts: qcom: x1e80100: add Coresight nodes for APSS debug bloc=
k
>
>  .../bindings/arm/arm,coresight-dynamic-funnel.yaml |  23 +-
>  .../arm/arm,coresight-dynamic-replicator.yaml      |  22 +-
>  .../devicetree/bindings/arm/arm,coresight-tmc.yaml |  22 +-
>  arch/arm64/boot/dts/qcom/x1e80100.dtsi             | 885 +++++++++++++++=
++++++
>  arch/arm64/boot/dts/qcom/x1p42100.dtsi             |  12 +
>  drivers/hwtracing/coresight/coresight-core.c       |   7 +-
>  drivers/hwtracing/coresight/coresight-funnel.c     | 260 +++++-
>  drivers/hwtracing/coresight/coresight-replicator.c | 343 +++++++-
>  drivers/hwtracing/coresight/coresight-tmc-core.c   | 396 +++++++--
>  drivers/hwtracing/coresight/coresight-tmc-etf.c    | 105 ++-
>  drivers/hwtracing/coresight/coresight-tmc.h        |  10 +
>  drivers/hwtracing/coresight/coresight-tnoc.c       |   3 +-
>  drivers/hwtracing/coresight/coresight-tpda.c       |   3 +-
>  include/linux/coresight.h                          |   3 +-
>  14 files changed, 1912 insertions(+), 182 deletions(-)
> ---
> base-commit: 01f96b812526a2c8dcd5c0e510dda37e09ec8bcd
> change-id: 20251016-cpu_cluster_component_pm-ce518f510433
>
> Best regards,
> --
> Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>
>


--=20
Mike Leach
Principal Engineer, ARM Ltd.
Manchester Design Centre. UK

