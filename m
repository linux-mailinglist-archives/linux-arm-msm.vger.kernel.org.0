Return-Path: <linux-arm-msm+bounces-34898-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4519F9A3828
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Oct 2024 10:12:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B8D991F268AF
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Oct 2024 08:12:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5B30518DF8B;
	Fri, 18 Oct 2024 08:11:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="k+zWHGC7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8362A18D65E
	for <linux-arm-msm@vger.kernel.org>; Fri, 18 Oct 2024 08:11:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729239103; cv=none; b=IC+7HTy7iz3RcsiJ2/ijsU11OY4WNPQVpYWFGwhTlCxSfefUGs0U1SqSWzcQaJtmp0cbwV1aFdiIkfiBUvSpFM2UdkboTWck9RJbw+nTIeljhU3U2dgduWJ5AEwnEgBbHF0277Qy0+iqfWq7m7dL+9UJgunmedkmkhMohISlkro=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729239103; c=relaxed/simple;
	bh=THf4KpV76/OhTc22GttJi0bmW4uwbaHKlkUjG8Ztius=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OWptmUUdis7mrQOLW0LY+MwJetGt6NLEvJIYZ45VQPLaS6OTaiTq0Z5UQQ8IdffhvtoUwvooYMCZY8w2jAuipTUFvV7XgsNZaRUD/2NWls5Qo0wTJ2aXAlLJV/NSHw3BxF1STX3FDrfcVn/1gP9r+MKlK5j0w9BnsRC4isuwQjY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=k+zWHGC7; arc=none smtp.client-ip=209.85.128.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-6e35f08e23eso17510277b3.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 18 Oct 2024 01:11:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729239099; x=1729843899; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=UwG3rDefpa7BtqQZIIQ/EL3ucM2UZ1ZTkh5NrgP84oQ=;
        b=k+zWHGC7MioLS+/zwjw5f5lY3312oOq2+taXNNIHBMVJ27UjTtXiUcehfyyCnTiyEi
         0msFoxGHxHg60kHW4mEji0T1qMSwPRyCVa0zXXpupnDd6jkCjXZ/t0L4Z4sk4eFhYISW
         haKC1yzrmPQlf3e6qj3XWjHoOKbFgMi/DsaSKK5pxWzus+GAYsLTbLlFr8OMBxED5uhM
         pw5L7oPADdCJPqSeEZunzZ7uko3EnGvNZzit+NqbfCjYjs3uN/SlLQjo061CDogAceTD
         xHX3rVs0xLYTWT/0JVTiB0AGFBUOxv+6DGrNtlCANMxQ8HnL9vPzS1DgNY8UHv3D6hK1
         Eh2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729239099; x=1729843899;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UwG3rDefpa7BtqQZIIQ/EL3ucM2UZ1ZTkh5NrgP84oQ=;
        b=pycra/p/v52YpSiqhQFZMImsRqMRFBsqA1Vf93g8YchhOnrdaxGSw9XdwrIzWIRdOF
         d2ttSpXwnR6snCPVDljPHEsz6bLM5XrjgPvYkr9aT9M0TZo2LtYLUsbay6ZDfp2D/JY7
         tZDwrNaoJG1lyECeTBVeo2Ar1I+QwhlKa0lHTZpav/FcHeilc/l0vNnMXG0BoysfnDmH
         Rirhmv1d3nA944By0GrCjUdnKJVpR6qTlYTjo5cNOBkAtH1R5YJ3cjL9nNdO0HyIt1uh
         r/MmKUkC+m69qj3Bw1FlTeUx2P2m3AaAuT3k6rpJQPvx70Bc2Cu+0k9FrZA2wQJBIDeb
         zHKw==
X-Forwarded-Encrypted: i=1; AJvYcCVHqrZNvrXwpEG+9j47ccZLKDoTZP5MhpN6q+UMpYLO3W7ZzcPEMDrSQSoMZUGKipo0VKSR2YpA9ZK1uLfX@vger.kernel.org
X-Gm-Message-State: AOJu0YxpeyprVSs3l3HIPvFVdvRDxlTtt8mlFxK/mwnBrBjECBBfjipj
	PAtzhc0e2HDZn7tj6m5jlghE9Q8lZslr58rCzMW9rkoq5U4AFXUmM39l1pS1EkgUEzrlh2dYvcS
	3zi8lZ2hyvU0w/kobqS2erl1AMIznlv7S+sbzTw==
X-Google-Smtp-Source: AGHT+IERPg6UNxdVW0V80x9bHiyvgx2Bw2B9lVFXGaP686cuW8Kv+mqAKZtXcsHxfWStzu6OGYokH34VuZ2WHvyeszE=
X-Received: by 2002:a05:690c:46c7:b0:6e3:2c80:5413 with SMTP id
 00721157ae682-6e5bfc8e733mr17629497b3.23.1729239099463; Fri, 18 Oct 2024
 01:11:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241015-qcom_ipq_cmnpll-v4-0-27817fbe3505@quicinc.com>
 <20241015-qcom_ipq_cmnpll-v4-4-27817fbe3505@quicinc.com> <abro3enahzbugcwokcyyhwybbokestbigvzhywxhnfrdjihni3@7ej2hkgbgtf6>
 <b336724c-1fea-4e1e-9477-66f53d746f09@quicinc.com>
In-Reply-To: <b336724c-1fea-4e1e-9477-66f53d746f09@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 18 Oct 2024 11:11:30 +0300
Message-ID: <CAA8EJprVNOLO-CoorNhvKrrSD1bNKdFrzth5BL0GHXffPv62jw@mail.gmail.com>
Subject: Re: [PATCH v4 4/4] arm64: dts: qcom: Add CMN PLL node for IPQ9574 SoC
To: Jie Luo <quic_luoj@quicinc.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	quic_kkumarcs@quicinc.com, quic_suruchia@quicinc.com, quic_pavir@quicinc.com, 
	quic_linchen@quicinc.com, quic_leiwei@quicinc.com, 
	bartosz.golaszewski@linaro.org, srinivas.kandagatla@linaro.org
Content-Type: text/plain; charset="UTF-8"

On Fri, 18 Oct 2024 at 09:55, Jie Luo <quic_luoj@quicinc.com> wrote:
>
>
>
> On 10/18/2024 6:32 AM, Dmitry Baryshkov wrote:
> > On Tue, Oct 15, 2024 at 10:16:54PM +0800, Luo Jie wrote:
> >> The CMN PLL clock controller allows selection of an input
> >> clock rate from a defined set of input clock rates. It in-turn
> >> supplies fixed rate output clocks to the hardware blocks that
> >> provide ethernet functions such as PPE (Packet Process Engine)
> >> and connected switch or PHY, and to GCC.
> >>
> >> Signed-off-by: Luo Jie <quic_luoj@quicinc.com>
> >> ---
> >>   arch/arm64/boot/dts/qcom/ipq9574-rdp-common.dtsi |  6 +++++-
> >>   arch/arm64/boot/dts/qcom/ipq9574.dtsi            | 20 +++++++++++++++++++-
> >>   2 files changed, 24 insertions(+), 2 deletions(-)
> >>
> >> diff --git a/arch/arm64/boot/dts/qcom/ipq9574-rdp-common.dtsi b/arch/arm64/boot/dts/qcom/ipq9574-rdp-common.dtsi
> >> index 91e104b0f865..77e1e42083f3 100644
> >> --- a/arch/arm64/boot/dts/qcom/ipq9574-rdp-common.dtsi
> >> +++ b/arch/arm64/boot/dts/qcom/ipq9574-rdp-common.dtsi
> >> @@ -3,7 +3,7 @@
> >>    * IPQ9574 RDP board common device tree source
> >>    *
> >>    * Copyright (c) 2020-2021 The Linux Foundation. All rights reserved.
> >> - * Copyright (c) 2023, Qualcomm Innovation Center, Inc. All rights reserved.
> >> + * Copyright (c) 2023-2024, Qualcomm Innovation Center, Inc. All rights reserved.
> >>    */
> >>
> >>   /dts-v1/;
> >> @@ -164,6 +164,10 @@ &usb3 {
> >>      status = "okay";
> >>   };
> >>
> >> +&cmn_pll_ref_clk {
> >> +    clock-frequency = <48000000>;
> >> +};
> >> +
> >>   &xo_board_clk {
> >>      clock-frequency = <24000000>;
> >>   };
> >> diff --git a/arch/arm64/boot/dts/qcom/ipq9574.dtsi b/arch/arm64/boot/dts/qcom/ipq9574.dtsi
> >> index 14c7b3a78442..93f66bb83c5a 100644
> >> --- a/arch/arm64/boot/dts/qcom/ipq9574.dtsi
> >> +++ b/arch/arm64/boot/dts/qcom/ipq9574.dtsi
> >> @@ -3,10 +3,11 @@
> >>    * IPQ9574 SoC device tree source
> >>    *
> >>    * Copyright (c) 2020-2021 The Linux Foundation. All rights reserved.
> >> - * Copyright (c) 2023, Qualcomm Innovation Center, Inc. All rights reserved.
> >> + * Copyright (c) 2023-2024, Qualcomm Innovation Center, Inc. All rights reserved.
> >>    */
> >>
> >>   #include <dt-bindings/clock/qcom,apss-ipq.h>
> >> +#include <dt-bindings/clock/qcom,ipq-cmn-pll.h>
> >>   #include <dt-bindings/clock/qcom,ipq9574-gcc.h>
> >>   #include <dt-bindings/interconnect/qcom,ipq9574.h>
> >>   #include <dt-bindings/interrupt-controller/arm-gic.h>
> >> @@ -19,6 +20,11 @@ / {
> >>      #size-cells = <2>;
> >>
> >>      clocks {
> >> +            cmn_pll_ref_clk: cmn-pll-ref-clk {
> >> +                    compatible = "fixed-clock";
> >> +                    #clock-cells = <0>;
> >> +            };
> >
> > Which block provides this clock? If it is provided by the external XO
> > then it should not be a part of the SoC dtsi.
>
> The on-chip WiFi block supplies this reference clock. So keeping it in
> the SoC DTSI is perhaps appropriate.

Then maybe it should be provided by the WiFi device node? At least you
should document your design decisions in the commit message.

Also, I don't think this node passes DT schema validation. Did you check it?

>
> >
> >> +
> >>              sleep_clk: sleep-clk {
> >>                      compatible = "fixed-clock";
> >>                      #clock-cells = <0>;
> >> @@ -243,6 +249,18 @@ mdio: mdio@90000 {
> >>                      status = "disabled";
> >>              };
> >>
> >> +            cmn_pll: clock-controller@9b000 {
> >> +                    compatible = "qcom,ipq9574-cmn-pll";
> >> +                    reg = <0x0009b000 0x800>;
> >> +                    clocks = <&cmn_pll_ref_clk>,
> >> +                             <&gcc GCC_CMN_12GPLL_AHB_CLK>,
> >> +                             <&gcc GCC_CMN_12GPLL_SYS_CLK>;
> >> +                    clock-names = "ref", "ahb", "sys";
> >> +                    #clock-cells = <1>;
> >> +                    assigned-clocks = <&cmn_pll CMN_PLL_CLK>;
> >> +                    assigned-clock-rates-u64 = /bits/ 64 <12000000000>;
> >> +            };
> >> +
> >>              qfprom: efuse@a4000 {
> >>                      compatible = "qcom,ipq9574-qfprom", "qcom,qfprom";
> >>                      reg = <0x000a4000 0x5a1>;
> >>
> >> --
> >> 2.34.1
> >>
> >
>


-- 
With best wishes
Dmitry

