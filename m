Return-Path: <linux-arm-msm+bounces-40070-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 181059E1B5C
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Dec 2024 12:52:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id ECA23167617
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Dec 2024 11:52:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D683F1E501C;
	Tue,  3 Dec 2024 11:51:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="X0Bu4nmo"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F30D31E503D
	for <linux-arm-msm@vger.kernel.org>; Tue,  3 Dec 2024 11:51:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733226717; cv=none; b=az7Qd5DmncrbPL6zaoyBAGgCDTspuLxcjHhs0p4i/Zhkl+zr1dCql40a085dbmCbO81MgEpbmuOK0mGWIHc23G1TuJtj8QAs56qgU6QjbCS8ipT8j2RoH4RjafyZFGEuyEJqpwCDFLq01mazxTZ955/H7qCMz3yJWAsQIyNQFpQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733226717; c=relaxed/simple;
	bh=xODsXxgFfNZd8MjPBZGqmi3sIBbEKRslq024Q4XA774=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eZ2HNfuXa7RWvgT/Jt7+mDdc43fAar2R6P5ts0pl8Q2peKnpCz5krouMZ655pVeW4MiCG7ULeInjeUt29M509H9NWUVGPRGxOjfuK4HS6usxkE99aOIY6PP6zSV7CCRpMBp4XdhMUsGB3HmCgDKxXgGD1c4JpzyzzPAKrwWcxg8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=X0Bu4nmo; arc=none smtp.client-ip=209.85.128.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-6efa5bf5202so16234987b3.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 03 Dec 2024 03:51:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733226715; x=1733831515; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=jJmN9vm0KKdkbgYJY1kJ2PT7vRHayhKSRB17RM5kC5E=;
        b=X0Bu4nmocEtYnkYNZV3jm3+ODoDpXf7OFUSD4BK/eNEAnGS92mxk0QKcWlfWaqd/t0
         bKan83juUuc5txilEUJnJKr266BkeuwZs11HmnfIIFId0bUZK942UkyzZjafisK9doDa
         5uB31FoFPQSAcVIMtrd3oHZZEFpZAdOUXNu46lVNiBlb2B8OF9ub7va69WFNwxtQmIaU
         vTMyZCyG3++mj5oF+xqTNthMlYM4Untn1TvWhS/s5z0QjaD1NKuD8Vwz6cCO6E/OTwRr
         pVI3kW668KSehmrYZZye/FIFtvSjCLqF5ROYDf4byEq7/hFVlyROhu7oO+AjQ7lkRd4G
         MJBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733226715; x=1733831515;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jJmN9vm0KKdkbgYJY1kJ2PT7vRHayhKSRB17RM5kC5E=;
        b=Da8JIqdvGNcEp+35lVjqXR+FCH1OL2tm4CgZYxaGwlvFwRtGCEbDROEORHzbnpFRwo
         rkKwnUjUDJcdMZ0F/LR5Dxff8Bp8wCueze6oLywVCoipLY9PKiUxdgg14Z3U0CGI/0rJ
         5GfbxAaQ/0SgcR1NFWjRSbSWE/HRh/wAa3xNW5MnJyTIzQWypsrnuKUbXx1jorr8PjLU
         KkIal/PKMPoB1CK6h145wWMFZEs5OHd2M1nI6xVfs/8o2DgbGkyoKzozixo7wfaMJblm
         pYw8MIvjx6f9WDqNreoP7LW/yDygTGi3kYEBV66JQhJVe08cWYlJ/lAXNBolL3eGeHVS
         7yjQ==
X-Forwarded-Encrypted: i=1; AJvYcCUWGvQ+wwX6e35MoI7mRy3bxLqhyEB25pabR6TPKdEOs4BRl6q1Je+dbTpLzVGGqp042jPp+bqchdcrPQnd@vger.kernel.org
X-Gm-Message-State: AOJu0Yxm+NrSvkVvcPTzlRL+mJE/AskvVu/35E0QCpNqhcgRJ1Uyqflg
	lpfKRfM6DT231qiKyhoCiylE7E4QwdJqdlUQUXmfH/1BuEzX/yHKxUF0UrXrxteK0CHlmzb67kR
	N5HI0fwgp+4YgkUFquIvZpKeYU0/exeKebtQV9A==
X-Gm-Gg: ASbGncupKUosqA2utL0BCynuLaj55Z8XIQy7ZHsoE2L0/kEbptZOk+y+MF1cJORJbSR
	ITrn07tN+vUyS9om62t9db3wXN1AjFw==
X-Google-Smtp-Source: AGHT+IEjsHAYwArBu8zqyJKRiaq0r1rzH6TwAontXOXbJw7jEjz6js3BPKBbGiqM6LVavcAfeIYgmun7BtLOfMgwhmU=
X-Received: by 2002:a05:6902:150d:b0:e39:772b:4bae with SMTP id
 3f1490d57ef6-e39d39ee384mr1903823276.6.1733226714940; Tue, 03 Dec 2024
 03:51:54 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241112003017.2805670-1-quic_molvera@quicinc.com>
 <20241112003017.2805670-3-quic_molvera@quicinc.com> <em4vkg4totsg435s4usu7kqn45vfqfot2j7sikzmnof2kkyidi@26b6kkpz7z4c>
 <0ca812e7-bf5b-463a-83dc-9195aee14589@quicinc.com> <828dbdb1-d987-43e6-8cd1-7ba267da9e67@quicinc.com>
In-Reply-To: <828dbdb1-d987-43e6-8cd1-7ba267da9e67@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 3 Dec 2024 13:51:46 +0200
Message-ID: <CAA8EJpqPRpV_aGH_LHoG8EWkaQ_tCR3u0jM3C_jXKowCAUEqPQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] interconnect: qcom: Add interconnect provider
 driver for SM8750
To: Melody Olvera <quic_molvera@quicinc.com>
Cc: Georgi Djakov <djakov@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Adam Skladowski <a39.skl@gmail.com>, Konrad Dybcio <konradybcio@kernel.org>, 
	Sibi Sankar <quic_sibis@quicinc.com>, =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@baylibre.com>, 
	Vladimir Lypak <vladimir.lypak@gmail.com>, Danila Tikhonov <danila@jiaxyga.com>, 
	Raviteja Laggyshetty <quic_rlaggysh@quicinc.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Rajendra Nayak <quic_rjendra@quicinc.com>, Mike Tipton <quic_mdtipton@quicinc.com>, 
	Abel Vesa <abel.vesa@linaro.org>, Trilok Soni <quic_tsoni@quicinc.com>, 
	Satya Durga Srinivasu Prabhala <quic_satyap@quicinc.com>, linux-arm-msm@vger.kernel.org, 
	linux-pm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 3 Dec 2024 at 00:04, Melody Olvera <quic_molvera@quicinc.com> wrote:
>
>
>
> On 11/18/2024 10:01 AM, Melody Olvera wrote:
> >
> >
> > On 11/15/2024 7:27 AM, Dmitry Baryshkov wrote:
> >> On Mon, Nov 11, 2024 at 04:30:17PM -0800, Melody Olvera wrote:
> >>> From: Raviteja Laggyshetty <quic_rlaggysh@quicinc.com>
> >>>
> >>> Introduce SM8750 interconnect provider driver using the interconnect
> >>> framework.
> >>>
> >>> Signed-off-by: Raviteja Laggyshetty <quic_rlaggysh@quicinc.com>
> >>> Signed-off-by: Melody Olvera <quic_molvera@quicinc.com>
> >>> ---
> >>>   drivers/interconnect/qcom/Kconfig  |    9 +
> >>>   drivers/interconnect/qcom/Makefile |    2 +
> >>>   drivers/interconnect/qcom/sm8750.c | 1585
> >>> ++++++++++++++++++++++++++++
> >>>   drivers/interconnect/qcom/sm8750.h |  132 +++
> >>>   4 files changed, 1728 insertions(+)
> >>>   create mode 100644 drivers/interconnect/qcom/sm8750.c
> >>>   create mode 100644 drivers/interconnect/qcom/sm8750.h
> >>>
> >>> diff --git a/drivers/interconnect/qcom/Kconfig
> >>> b/drivers/interconnect/qcom/Kconfig
> >>> index 362fb9b0a198..1219f4f23d40 100644
> >>> --- a/drivers/interconnect/qcom/Kconfig
> >>> +++ b/drivers/interconnect/qcom/Kconfig
> >>> @@ -337,6 +337,15 @@ config INTERCONNECT_QCOM_SM8650
> >>>         This is a driver for the Qualcomm Network-on-Chip on
> >>> SM8650-based
> >>>         platforms.
> >>>   +config INTERCONNECT_QCOM_SM8750
> >>> +    tristate "Qualcomm SM8750 interconnect driver"
> >>> +    depends on INTERCONNECT_QCOM_RPMH_POSSIBLE
> >>> +    select INTERCONNECT_QCOM_RPMH
> >>> +    select INTERCONNECT_QCOM_BCM_VOTER
> >>> +    help
> >>> +      This is a driver for the Qualcomm Network-on-Chip on
> >>> SM8750-based
> >>> +      platforms.
> >>> +
> >>>   config INTERCONNECT_QCOM_X1E80100
> >>>       tristate "Qualcomm X1E80100 interconnect driver"
> >>>       depends on INTERCONNECT_QCOM_RPMH_POSSIBLE
> >>> diff --git a/drivers/interconnect/qcom/Makefile
> >>> b/drivers/interconnect/qcom/Makefile
> >>> index 9997728c02bf..7887b1e8d69b 100644
> >>> --- a/drivers/interconnect/qcom/Makefile
> >>> +++ b/drivers/interconnect/qcom/Makefile
> >>> @@ -40,6 +40,7 @@ qnoc-sm8350-objs            := sm8350.o
> >>>   qnoc-sm8450-objs            := sm8450.o
> >>>   qnoc-sm8550-objs            := sm8550.o
> >>>   qnoc-sm8650-objs            := sm8650.o
> >>> +qnoc-sm8750-objs            := sm8750.o
> >>>   qnoc-x1e80100-objs            := x1e80100.o
> >>>   icc-smd-rpm-objs            := smd-rpm.o icc-rpm.o icc-rpm-clocks.o
> >>>   @@ -80,5 +81,6 @@ obj-$(CONFIG_INTERCONNECT_QCOM_SM8350) +=
> >>> qnoc-sm8350.o
> >>>   obj-$(CONFIG_INTERCONNECT_QCOM_SM8450) += qnoc-sm8450.o
> >>>   obj-$(CONFIG_INTERCONNECT_QCOM_SM8550) += qnoc-sm8550.o
> >>>   obj-$(CONFIG_INTERCONNECT_QCOM_SM8650) += qnoc-sm8650.o
> >>> +obj-$(CONFIG_INTERCONNECT_QCOM_SM8750) += qnoc-sm8750.o
> >>>   obj-$(CONFIG_INTERCONNECT_QCOM_X1E80100) += qnoc-x1e80100.o
> >>>   obj-$(CONFIG_INTERCONNECT_QCOM_SMD_RPM) += icc-smd-rpm.o
> >>> diff --git a/drivers/interconnect/qcom/sm8750.c
> >>> b/drivers/interconnect/qcom/sm8750.c
> >>> new file mode 100644
> >>> index 000000000000..bc72954d54ff
> >>> --- /dev/null
> >>> +++ b/drivers/interconnect/qcom/sm8750.c
> >>> @@ -0,0 +1,1585 @@
> >>> +// SPDX-License-Identifier: GPL-2.0-only
> >>> +/*
> >>> + * Copyright (c) 2024, Qualcomm Innovation Center, Inc. All rights
> >>> reserved.
> >>> + *
> >>> + */
> >>> +
> >>> +#include <linux/device.h>
> >>> +#include <linux/interconnect.h>
> >>> +#include <linux/interconnect-provider.h>
> >>> +#include <linux/module.h>
> >>> +#include <linux/of_platform.h>
> >>> +#include <dt-bindings/interconnect/qcom,sm8750-rpmh.h>
> >>> +
> >>> +#include "bcm-voter.h"
> >>> +#include "icc-rpmh.h"
> >>> +#include "sm8750.h"
> >> Nit: please merge sm8750.h here, there is no need to have a separate
> >> header, there are no other users.
> >
> > Ack.
> >
> >>
> >> Also, is there QoS support? I see no qcom_icc_qosbox entries.
> >
> > Unsure; will let Raviteja comment.
> >
>
> Spoke w Raviteja; looks like he wants to do this later.

Will that cause bindings changes?

-- 
With best wishes
Dmitry

