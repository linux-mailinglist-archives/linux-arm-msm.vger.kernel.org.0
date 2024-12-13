Return-Path: <linux-arm-msm+bounces-41958-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id ACBE69F0944
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Dec 2024 11:19:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 68B84284975
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Dec 2024 10:19:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1A6901B81DC;
	Fri, 13 Dec 2024 10:19:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="PxUjYaHS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B8061B0F27
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Dec 2024 10:19:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734085161; cv=none; b=guKvuvevMZnKFXh2lEOp8RK8aOpoj5WEu5kDAVTOe2bhbNPv8YBv5HQYk6hOLMaPjg7wd2kXfXE6wRSExH/cS1YRFe+Ap/oeTx86qofDf1IEkQYKU2GDKy0fnUz0ZlJABP7gbIpCBHwTfdY3/mi7kTAwyUoTcRQW8XhcObp+L20=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734085161; c=relaxed/simple;
	bh=TaUoGs+F2ddGLGp0nhoiaf0yEcbeooEJX6cg/YCJu3o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qyFuSxXNY0pJU4sfLbp+BXdcKekHMhjFQ4mson3uB9da1rGhFJtD392vE+0i2A2RuhYoT/EI1g63cZI5OQilLPm4f4RdNhfiFYBki4DDf8Fvym/UyB9kM2JDDoPCaNu9ZgO8fodXMXKeKKb9/ZKHu7Wno3hjd1rTliPMErVgupA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=PxUjYaHS; arc=none smtp.client-ip=209.85.128.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-6f277a1ecfdso7025887b3.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Dec 2024 02:19:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734085157; x=1734689957; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=JzubTKIrCCyJH0pfnEBHBmZCTtcP1wgY3Y2naNN0eVk=;
        b=PxUjYaHSiCNuuwdT/edTmGrQGw0WfbXhWDgvMDPsSGmVNl1z65MiB9JfDSM9bOprJZ
         RuLYjq4aub3FRQcVNBE6ymB6ARYyiY5QXW4beK5U/YJUh2/iTxqDqcTl+a828iklriMB
         H6WpmGLEE7eUd7dF+T4vuEK5BKb1nxBgFRFUGAxKO/gOaMgOevFRx0KrKHjj3cOuBjnC
         BjW/Rjlhsk51Cx/eAipnrUG6q+/TeLjWQsIaKoINKbto49O89jdaGERBzDxE7PwxisTf
         eViAcY8mSI2vpJIzkRtyeK8zdL8RNznlr3Ebof2s9M/kE7J/HkiC6GVgdZDBjqC/3p1b
         6khw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734085157; x=1734689957;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JzubTKIrCCyJH0pfnEBHBmZCTtcP1wgY3Y2naNN0eVk=;
        b=tp7e+qYx8D4GVCx4N05tQwVsgarF8w/0WrWjVn8VzpXJCGfMDyFW9zD/QaZlOUTfDv
         DsYS9bNncgNoBYn7eFLtvShIjD7ywIt/mih/yKEmf9Z9Le6jUNYIpMk7qDzR9+YuCXRw
         LRyskWKFt6ZXcUzcvgd9yKdn9xbzc80jT2hBvomqvxol4xiezbXKcPD/shw28xDtQjWs
         gW8C6A39mZkvc0SQBIzBs6u/mcDgTjOSYXW/vN1MY+lBWaxC1brs0dpGKYCN2twqnCtw
         h9/ujTzyafjsffIaYGWXd3tJlbZntUgoLqbS6jXJ6lRdHqwZH6CH9jj+jZ318KErgp9E
         XRdQ==
X-Forwarded-Encrypted: i=1; AJvYcCXVUfUUAIaGSVe7TsyS85FugiKK1P428zP9Um1nZ4GHPjfdofhRSdGQS0YnM2jdiA2MKfImIGx+UYzd+o1q@vger.kernel.org
X-Gm-Message-State: AOJu0YzC4lLSo87K6U37RwRfkTvYLzphZ6WzOEdE8btN/O8T4XlbBmdq
	WO1fP64xfhiMFST02ZlG6gmWY4U2rIfhk0hM7lkQDvUqT4BGQf3mIOgHfCliDe+uGvYlsU44GoR
	RpWGGrJY0xPKnTcwckpx7e65dwPWgPi5oX8y0Tg==
X-Gm-Gg: ASbGncsrFTbjrKOg6ytZnQiPKC90zEUnMHNgryvnknq6oRrjy6LEjj/wiCnOz9zeLFX
	M3byhejAXoNiRNDeqGbcJNLMXoEm6RdkJDvIVYA==
X-Google-Smtp-Source: AGHT+IE+V0UDCOAU5QBdFhu4vGa18K/4xyOW5PpbJKOBiXTh72LOzIvfBG+05zrZNP3V7nBvigfrJ7wDyZaG9B3yK7Y=
X-Received: by 2002:a05:6902:2484:b0:e3a:3a3d:40c9 with SMTP id
 3f1490d57ef6-e4352f57b49mr1567063276.39.1734085157123; Fri, 13 Dec 2024
 02:19:17 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241210-add-display-support-for-qcs615-platform-v4-0-2d875a67602d@quicinc.com>
 <20241210-add-display-support-for-qcs615-platform-v4-9-2d875a67602d@quicinc.com>
 <cfdyvcxdkmf4sv5f75koflayyx74wd3tuscdl7byp5peaag5ty@yhr3275jhftn> <92b6335e-a303-49d3-9b77-f951663fc10c@quicinc.com>
In-Reply-To: <92b6335e-a303-49d3-9b77-f951663fc10c@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 13 Dec 2024 12:19:05 +0200
Message-ID: <CAA8EJpqyM-r3jvY7sTpG-KKRHP9K7c3q0xfoLb_f0th7vunPYw@mail.gmail.com>
Subject: Re: [PATCH v4 9/9] arm64: dts: qcom: Add display support for QCS615
 RIDE board
To: fange zhang <quic_fangez@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
	Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Krishna Manikandan <quic_mkrishn@quicinc.com>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Liu Li <quic_lliu6@quicinc.com>, 
	Xiangxu Yin <quic_xiangxuy@quicinc.com>, linux-arm-msm@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, 13 Dec 2024 at 11:21, fange zhang <quic_fangez@quicinc.com> wrote:
>
>
>
> On 2024/12/10 19:02, Dmitry Baryshkov wrote:
> > On Tue, Dec 10, 2024 at 02:54:00PM +0800, Fange Zhang wrote:
> >> From: Li Liu <quic_lliu6@quicinc.com>
> >>
> >> Add display MDSS and DSI configuration for QCS615 RIDE board.
> >> QCS615 has a DP port, and DP support will be added in a later patch.
> >>
> >> Signed-off-by: Li Liu <quic_lliu6@quicinc.com>
> >> Signed-off-by: Fange Zhang <quic_fangez@quicinc.com>
> >> ---
> >>   arch/arm64/boot/dts/qcom/qcs615-ride.dts | 89 ++++++++++++++++++++++++++++++++
> >>   1 file changed, 89 insertions(+)
> >>
> >> diff --git a/arch/arm64/boot/dts/qcom/qcs615-ride.dts b/arch/arm64/boot/dts/qcom/qcs615-ride.dts
> >> index a25928933e2b66241258e418c6e5bc36c306101e..694719a09ac46bfa2fe34f1883c0970b9d0902be 100644
> >> --- a/arch/arm64/boot/dts/qcom/qcs615-ride.dts
> >> +++ b/arch/arm64/boot/dts/qcom/qcs615-ride.dts
> >> @@ -32,6 +32,18 @@ xo_board_clk: xo-board-clk {
> >>                      #clock-cells = <0>;
> >>              };
> >>      };
> >> +
> >> +    dp-connector {
> >> +            compatible = "dp-connector";
> >> +            label = "DP";
> >> +            type = "mini";
> >> +
> >> +            port {
> >> +                    dp_connector_out: endpoint {
> >> +                            remote-endpoint = <&anx_7625_out>;
> >> +                    };
> >> +            };
> >> +    };
> >>   };
> >>
> >>   &apps_rsc {
> >> @@ -202,6 +214,83 @@ &gcc {
> >>               <&sleep_clk>;
> >>   };
> >>
> >> +&i2c2 {
> >> +    clock-frequency = <400000>;
> >> +    status = "okay";
> >> +
> >> +    ioexp: gpio@3e {
> >> +            compatible = "semtech,sx1509q";
> >> +            reg = <0x3e>;
> >> +            interrupt-parent = <&tlmm>;
> >> +            interrupts = <58 0>;
> >
> > Use IRQ flags instead of just 0 (here and further on). Also it might be
> > better to use interrupts-extended instead.
> Got it, will use interrupts-extended instead
> -               interrupt-parent = <&tlmm>;
> -               interrupts = <58 0>;
> +               interrupts-extended = <&tlmm 58 IRQ_TYPE_NONE>;
> >
> >> +            gpio-controller;
> >> +            #gpio-cells = <2>;
> >> +            interrupt-controller;
> >> +            #interrupt-cells = <2>;
> >> +            semtech,probe-reset;
> >> +    };
> >> +
> >> +    i2c-mux@77 {
> >> +            compatible = "nxp,pca9542";
> >> +            reg = <0x77>;
> >> +            #address-cells = <1>;
> >> +            #size-cells = <0>;
> >
> > Add empty line before device nodes (here and furher on).
> Sorry, will add it in next patch.
> >
> >> +            i2c@0 {
> >> +                    reg = <0>;
> >> +                    #address-cells = <1>;
> >> +                    #size-cells = <0>;
> >> +
> >> +                    anx7625@58 {
> >> +                            compatible = "analogix,anx7625";
> >> +                            reg = <0x58>;
> >> +                            interrupt-parent = <&ioexp>;
> >> +                            interrupts = <0 0>;
> will change it to interrupts-extended in next patch
> -               interrupt-parent = <&ioexp>;
> -               interrupts = <0 0>;
> +               interrupts-extended = <&ioexp 0 IRQ_TYPE_NONE>;

Yes, much better. BTW: are you sure that it's really IRQ_TYPE_NONE?

> >> +                            enable-gpios = <&tlmm 4 GPIO_ACTIVE_HIGH>;
> >> +                            reset-gpios = <&tlmm 5 GPIO_ACTIVE_HIGH>;
> >> +                            wakeup-source;
> >> +
> >> +                            ports {
> >> +                                    #address-cells = <1>;
> >> +                                    #size-cells = <0>;
> >> +
> >> +                                    port@0 {
> >> +                                            reg = <0>;
> >> +                                            anx_7625_in: endpoint {
> >> +                                                    remote-endpoint = <&mdss_dsi0_out>;
> >> +                                            };
> >> +                                    };
> >> +
> >> +                                    port@1 {
> >> +                                            reg = <1>;
> >> +                                            anx_7625_out: endpoint {
> >> +                                                    remote-endpoint = <&dp_connector_out>;
> >> +                                            };
> >> +                                    };
> >> +                            };
> >> +                    };
> >> +            };
> >> +    };
> >> +};
> >> +
> >> +&mdss {
> >> +    status = "okay";
> >> +};
> >> +
> >> +&mdss_dsi0 {
> >> +    vdda-supply = <&vreg_l11a>;
> >> +    status = "okay";
> >> +};
> >> +
> >> +&mdss_dsi0_out {
> >> +    remote-endpoint = <&anx_7625_in>;
> >> +    data-lanes = <0 1 2 3>;
> >> +};
> >> +
> >> +&mdss_dsi0_phy {
> >> +    vdds-supply = <&vreg_l5a>;
> >> +    status = "okay";
> >> +};
> >> +
> >>   &qupv3_id_0 {
> >>      status = "okay";
> >>   };
> >>
> >> --
> >> 2.34.1
> >>
> >
>


-- 
With best wishes
Dmitry

