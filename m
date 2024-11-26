Return-Path: <linux-arm-msm+bounces-39168-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 460909D9299
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 Nov 2024 08:38:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 06BED281625
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 Nov 2024 07:38:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 506F81A9B36;
	Tue, 26 Nov 2024 07:37:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="H05zmFpZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 561D919CC3C
	for <linux-arm-msm@vger.kernel.org>; Tue, 26 Nov 2024 07:37:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732606669; cv=none; b=px3ZqdGiJlVtqqH9co00sC+A9N98VKRSdE/gPENWpKRPM/sSEZ0+sE7l0YkWxVl3wbIs35JNCsQxaGuZ41j9y7cp2SnhOQ9NMCRwJ3VEmQsLziKUw74+hUAN08vA4qU0WyjfFH/wLlYDBj1Hut7mDJC6fRaLkUuUbdCNizsMwi8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732606669; c=relaxed/simple;
	bh=z0R18S0d0POXSq+hvwQl136nVU+kLIn61Jdmo0ILmVI=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=TnDEybSueWRl+WVWcMcryQBE9lUWijjkhy0GUisqmq3yHKz8j9lk/fc9MrX/MpGYDKgXcpbgpszyJO2H2rIc2txuv4VGNpA02s56H8ZKlPtoEqyTAKGZ/5FUkm/1zca04ppiyf7V1ArtcLJzjaMehWtK2v/6ppVODuR9uPM0GRk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=H05zmFpZ; arc=none smtp.client-ip=209.85.208.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-2ffa3e8e917so50062171fa.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 25 Nov 2024 23:37:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732606665; x=1733211465; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=0S15AS2+IAWhOlFxUJLerXC5aMLzjf0hnvf3dDW0dVY=;
        b=H05zmFpZd6oyjPH135nfaMtXtxfpK51ERmjX/jR+nfys4gPoleB+yzDI70AznkredK
         /iWH13REwqcwxPYY3CTSmVf3Ygt3rNXnCbVr1rdNQ2e7jjMZC9XhRxikkXBSzWahIpzr
         AWuMjwUDvnsA14Lq4RFHyxo+HlI3mYNNrTgKyqXk8JTiGlgnswI7E4HbWW+iP7qsgYua
         AmhUrbxIrFOo0FKQsPWQnL0XHIZmxYMYujuGnxXFhNNt+Y9qeiT7JTIrt5GptLGuJb39
         +z4puzpS38r7J9fE8uMi+BWAOzDEy7OWI+Il1NP9PfRx3d9MWe1w8X5qULdpnSEtvykU
         Z0hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732606665; x=1733211465;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:cc:to:from:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0S15AS2+IAWhOlFxUJLerXC5aMLzjf0hnvf3dDW0dVY=;
        b=AilB91lymKioorFuHcTqiRlGMgcDPQOudg3YDfrR/Ifk88QNSUmYqFB6ytxipSrwQX
         DL3VvURvu7D0GjgIvzVHzY7f/hSTsZn9Uc6EzPmnfQcxfBpgRDOBHuWH6PUA0qWfNAyA
         idn3k9dXh8Jw1Jzx3cQEYHVLieC9vEF52RVY7MeLoBLqv+lYnpi9jGRudcnOCvkaua3W
         NCX8CyZsO11YFtZPymu3JUj4R0EWLBFoGXmItJxxrKpiXRB7QakEQMmjS/du2M4xRq0X
         AmdizBwr7/smYSMTrwTQpD3uy6hJ4TGz5t5LRyI5bffhzcT+MtmB6HBCrxeO6PNWeW72
         IzKw==
X-Forwarded-Encrypted: i=1; AJvYcCW1/iwkA+LprLxh1cssxyqV/GW55kteSTj9gwBtn9qVDmdmhrMrJ3D+ioHcTin8h67dIg2Ej+LVy8pDfh9i@vger.kernel.org
X-Gm-Message-State: AOJu0YxLI7isBWVIDRVMgqZVTPCVCi5+J7QTZWTJvySnsmZdSm8m7q+S
	NQ/8jrE2BJatS7q6TsntEndi9exmXTyXpi8G1E37y61oZksw9o6hJ92TJibsPo0=
X-Gm-Gg: ASbGncsUSJaSONE8ZvkALoQ9M2cQwwTbS52Ia9ZnSGMw0tMPeY5RyIq59j8AH97HK29
	YHCUFR2dG5pQbkNFsD/10Cf6qJsq3AyKMjoaldek8pWMK2NfbVfSH+SRbDHNFQ/kU6EK64iOJes
	uquDH1QYDyzi31wizN0GgVq1/dCOd/ZpLnxHEbUTYajJQBJUVn2mtNIlmQqdGUwbOUt3U2u+Jqe
	f5gTtLLp3xv9AG08KuadLrnzxVnivJNlGe+vDmswxefghMAV0Dvmxl/2tXGUwaC0Oj9gLqtmNed
	+OP/hkJI31LgYwQ=
X-Google-Smtp-Source: AGHT+IHSvd8+Okq1rWT0Gwj+Ojl6/8fdOcG083wycHgqsDoXJ6KPadO0/SSu0+2RmVjYC6Koyhifvg==
X-Received: by 2002:a05:651c:b0b:b0:2ff:d03c:bcda with SMTP id 38308e7fff4ca-2ffd03cbda5mr3060351fa.9.1732606665534;
        Mon, 25 Nov 2024 23:37:45 -0800 (PST)
Received: from [127.0.0.1] (85-76-116-93-nat.elisa-mobile.fi. [85.76.116.93])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2ffb61bde51sm10798881fa.30.2024.11.25.23.37.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 25 Nov 2024 23:37:44 -0800 (PST)
Date: Tue, 26 Nov 2024 09:37:40 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Melody Olvera <quic_molvera@quicinc.com>
CC: Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Taniya Das <quic_tdas@quicinc.com>,
 Trilok Soni <quic_tsoni@quicinc.com>,
 Satya Durga Srinivasu Prabhala <quic_satyap@quicinc.com>,
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_v2_5/7=5D_clk=3A_qcom=3A_Add_supp?=
 =?US-ASCII?Q?ort_for_GCC_clock_controller_on_SM8750?=
User-Agent: Thunderbird for Android
In-Reply-To: <3d9d3d18-9028-4dbc-8e72-3ed70edc97f4@quicinc.com>
References: <20241112002807.2804021-1-quic_molvera@quicinc.com> <20241112002807.2804021-6-quic_molvera@quicinc.com> <n4h4jvxrsyahgmxedfsifhgmarw4rzn2cbg5pcvzo4ll3edziq@vgpvjco5hyb4> <f2bf7790-7387-4eb6-8e1e-e555a20a717b@quicinc.com> <xjfdqtiauxzmes3hwtgknjglu5rkp4mnyktsaxqtb7xmzsa2zx@phlkamgm47x4> <3d9d3d18-9028-4dbc-8e72-3ed70edc97f4@quicinc.com>
Message-ID: <B5649FBA-0B04-462D-AEC9-DE228E05A806@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 25 November 2024 23:31:58 EET, Melody Olvera <quic_molvera@quicinc=2Ecom=
> wrote:
>
>
>On 11/18/2024 5:59 PM, Dmitry Baryshkov wrote:
>> On Mon, Nov 18, 2024 at 11:30:58AM -0800, Melody Olvera wrote:
>>>=20
>>> On 11/15/2024 7:34 AM, Dmitry Baryshkov wrote:
>>>> On Mon, Nov 11, 2024 at 04:28:05PM -0800, Melody Olvera wrote:
>>>>> From: Taniya Das <quic_tdas@quicinc=2Ecom>
>>>>>=20
>>>>> Add support for GCC Clock Controller for SM8750 platform=2E
>>>>>=20
>>>>> Signed-off-by: Taniya Das <quic_tdas@quicinc=2Ecom>
>>>>> Signed-off-by: Melody Olvera <quic_molvera@quicinc=2Ecom>
>>>>> ---
>>>>>    drivers/clk/qcom/Kconfig      |    9 +
>>>>>    drivers/clk/qcom/Makefile     |    1 +
>>>>>    drivers/clk/qcom/gcc-sm8750=2Ec | 3274 ++++++++++++++++++++++++++=
+++++++
>>>>>    3 files changed, 3284 insertions(+)
>>>>>    create mode 100644 drivers/clk/qcom/gcc-sm8750=2Ec
>>>>>=20
>>>>> diff --git a/drivers/clk/qcom/Kconfig b/drivers/clk/qcom/Kconfig
>>>>> index ef89d686cbc4=2E=2E26bfb607235b 100644
>>>>> --- a/drivers/clk/qcom/Kconfig
>>>>> +++ b/drivers/clk/qcom/Kconfig
>>>>> @@ -1130,6 +1130,15 @@ config SM_GCC_8650
>>>>>    	  Say Y if you want to use peripheral devices such as UART,
>>>>>    	  SPI, I2C, USB, SD/UFS, PCIe etc=2E
>>>>> +config SM_GCC_8750
>>>>> +	tristate "SM8750 Global Clock Controller"
>>>>> +	depends on ARM64 || COMPILE_TEST
>>>>> +	select QCOM_GDSC
>>>>> +	help
>>>>> +	  Support for the global clock controller on SM8750 devices=2E
>>>>> +	  Say Y if you want to use peripheral devices such as UART,
>>>>> +	  SPI, I2C, USB, SD/UFS, PCIe etc=2E
>>>>> +
>>>>>    config SM_GPUCC_4450
>>>>>    	tristate "SM4450 Graphics Clock Controller"
>>>>>    	depends on ARM64 || COMPILE_TEST
>>>>> diff --git a/drivers/clk/qcom/Makefile b/drivers/clk/qcom/Makefile
>>>>> index b09dbdc210eb=2E=2E1875018d1100 100644
>>>>> --- a/drivers/clk/qcom/Makefile
>>>>> +++ b/drivers/clk/qcom/Makefile
>>>>> @@ -143,6 +143,7 @@ obj-$(CONFIG_SM_GCC_8350) +=3D gcc-sm8350=2Eo
>>>>>    obj-$(CONFIG_SM_GCC_8450) +=3D gcc-sm8450=2Eo
>>>>>    obj-$(CONFIG_SM_GCC_8550) +=3D gcc-sm8550=2Eo
>>>>>    obj-$(CONFIG_SM_GCC_8650) +=3D gcc-sm8650=2Eo
>>>>> +obj-$(CONFIG_SM_GCC_8750) +=3D gcc-sm8750=2Eo
>>>>>    obj-$(CONFIG_SM_GPUCC_4450) +=3D gpucc-sm4450=2Eo
>>>>>    obj-$(CONFIG_SM_GPUCC_6115) +=3D gpucc-sm6115=2Eo
>>>>>    obj-$(CONFIG_SM_GPUCC_6125) +=3D gpucc-sm6125=2Eo
>>>>> diff --git a/drivers/clk/qcom/gcc-sm8750=2Ec b/drivers/clk/qcom/gcc-=
sm8750=2Ec
>>>>> new file mode 100644
>>>>> index 000000000000=2E=2Efaaefa42a039
>>>>> --- /dev/null
>>>>> +++ b/drivers/clk/qcom/gcc-sm8750=2Ec
>>>>> @@ -0,0 +1,3274 @@
>>>>> +// SPDX-License-Identifier: (GPL-2=2E0-only OR BSD-2-Clause)
>>>>> +/*
>>>>> + * Copyright (c) 2024, Qualcomm Innovation Center, Inc=2E All right=
s reserved=2E
>>>>> + */
>>>>> +
>>>>> +#include <linux/clk-provider=2Eh>
>>>>> +#include <linux/mod_devicetable=2Eh>
>>>>> +#include <linux/module=2Eh>
>>>>> +#include <linux/platform_device=2Eh>
>>>>> +#include <linux/regmap=2Eh>
>>>>> +
>>>>> +#include <dt-bindings/clock/qcom,sm8750-gcc=2Eh>
>>>>> +
>>>>> +#include "clk-alpha-pll=2Eh"
>>>>> +#include "clk-branch=2Eh"
>>>>> +#include "clk-pll=2Eh"
>>>>> +#include "clk-rcg=2Eh"
>>>>> +#include "clk-regmap=2Eh"
>>>>> +#include "clk-regmap-divider=2Eh"
>>>>> +#include "clk-regmap-mux=2Eh"
>>>>> +#include "clk-regmap-phy-mux=2Eh"
>>>>> +#include "common=2Eh"
>>>>> +#include "gdsc=2Eh"
>>>>> +#include "reset=2Eh"
>>>>> +
>>>>> +enum {
>>>>> +	DT_BI_TCXO,
>>>>> +	DT_BI_TCXO_AO,
>>>>> +	DT_PCIE_0_PIPE_CLK,
>>>>> +	DT_SLEEP_CLK,
>>>>> +	DT_UFS_PHY_RX_SYMBOL_0_CLK,
>>>>> +	DT_UFS_PHY_RX_SYMBOL_1_CLK,
>>>>> +	DT_UFS_PHY_TX_SYMBOL_0_CLK,
>>>>> +	DT_USB3_PHY_WRAPPER_GCC_USB30_PIPE_CLK,
>>>> This doesn't match Documentation/devicetree/bindings/clock/qcom,sm865=
0-gcc=2Eyaml
>>> Hmmm I see what seems to have happened here=2E You're correct; this do=
esn't
>>> match the bindings
>>> in sm8650-gcc=2E The v1 patchset had a new bindings file which matched=
 the
>>> sm8650 bindings, but also
>>> didn't match the driver; however we only seemed to catch that the two
>>> bindings matched and not the
>>> fact that they didn't match the drivers=2E
>> I don't see v1=2E Please bring bindings back=2E
>
>Will do=2E
>
>>=20
>>> In terms of remedy I see two options=2E I'm fairly certain the driver =
here is
>>> correct, so we can either
>>> add the sm8750 bindings file back and remove the two lines about the P=
CIE 1
>>> clocks or adjust the
>>> sm8650 binding to encompass both sm8650 and sm8750=2E It's unclear to =
me how
>>> precedented the latter
>>> is; certainly having a single bindings file encompass both chips is
>>> feasible, but I think I'm currently
>>> leaning towards bringing back the original bindings file as that seems=
 more
>>> precedented=2E Lmk
>>> your thoughts=2E
>> How are you thinking to change SM8650 bindings without breaking the ABI
>> / backwards compatibility?
>
>
>Giant if-then (read: poorly)=2E

I'd say, this means a separate file=2E

>
>Thanks,
>Melody


