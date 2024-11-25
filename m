Return-Path: <linux-arm-msm+bounces-39144-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id EDE539D8E53
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 Nov 2024 23:08:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AD355281916
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 Nov 2024 22:08:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8C84E188724;
	Mon, 25 Nov 2024 22:08:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Uod5sVLY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yb1-f172.google.com (mail-yb1-f172.google.com [209.85.219.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF7B4190059
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 Nov 2024 22:08:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732572504; cv=none; b=N68aQOR3rfNPNViLdpm1kFyW2uKQ4S+EysTRxBIbY/mcErpxsgDQDFgiTkNtNO5m/7WFhzDLojYAR88toPZaI4JShTGcF4g8eUSa4nK0d8m2Ab7Go7gqSItVgYhJy1mQE0ge3PVoZfYjigyaZbco4UNio1uqf3Pjx4AjL0/t5AQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732572504; c=relaxed/simple;
	bh=xNz1w0/+f9nkgC6K+YBMLNPP16IhNrqOslyvuYbdvbw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mMHLHgCEwgv0Q1TNKPzIH2G1NxIbO1gJcQnX8ieSyLOsjLsXTrKZPbWhuEuxt7d65iJb0lmFt9k3xc2YPo4uXZLBftDSQyry7AFDawvREsOKhlv0nGHY09Cs8UtXW3KGjT8ss1rlTY63Lb5RusWuG+oyQvTgMvUOyv1mWeMmb/k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Uod5sVLY; arc=none smtp.client-ip=209.85.219.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f172.google.com with SMTP id 3f1490d57ef6-e388186edbfso4755907276.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 25 Nov 2024 14:08:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732572501; x=1733177301; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=2eAVON7HGIpJamTV+1ul/jOyH9ikQLUzIAIpUaFRKeE=;
        b=Uod5sVLY0p8ExaykKTLYWBIUCmPh1jw/tLGJEwSb94gyL3xbylgYCHzvTSMpixyWLs
         oehxgoImPCoECxnDt13/jox3vrUSlHdTtW3A93mLNZgCt9AU5ZVHxve8XUagHti+WJps
         IbPP1TdwG6ZtE4Q7nkFOWyrI353sl0W09YsPgBV/2EPgHTsgIdBr8wy3OWfhNgqule4O
         aLKrfN8AtsACvBr8ouVb6huQFHKRkMvRk9e8RDrK3AzyTlHyi/EVjNrbGDcALLHGD/R8
         QJKLt2i1UmM4z0Yd5UNesHHsD2XduwgpnpFYWgOKZcH5A3cTi6gHHGDSKE9wtCOn0csH
         2LPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732572501; x=1733177301;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2eAVON7HGIpJamTV+1ul/jOyH9ikQLUzIAIpUaFRKeE=;
        b=vhxd/scURmVZ7A1Au7mKQklT9Fw+lgdRK/uCgkVhsTzcjq8cNHv+QA+W7gouvEVP9C
         Xlt6cU9aIwRveFAPBzTevkcWWkc8OxrObc7AxZj7WdF7SuIQF8tVHKuohEcqY2IDuPJt
         vbvp87/Ym0AkndCDVvV84A+ZCQ0r85iclcXiXAqh1I8k5SqoeXvOGvXhZ4uHgPYoqHCn
         zztEbsfLI8fU5L6WjmipnYLoB1QMFKW7BpTtgOpzqYo00a32d3kStsGCZPQIooj7mBWM
         A1LpSoWAnZvAgsMtRdk+usRlb35GglmEmGlQ9AXEPQaFJ1Syy6/3oh77BVd3g4IhjAh7
         hkEg==
X-Forwarded-Encrypted: i=1; AJvYcCUnDEMx6sCVZJVhz6MfUotlTuz2jUXHwOI/bD8ElTyZWDqf4B46vaZMwPf7Hx1rx0a4ad+76WxS1HbLyr7H@vger.kernel.org
X-Gm-Message-State: AOJu0Yy9GZWnVvMgnQbvSY6i8KXUPj4vbYdln7Lrt24MDd4A+k+P1HKK
	eYhbZRKWQ9oZP15DSf7tyVqzBnfBRSQTT6rfp9AfjGKBsefN5wxUpACkPIMn0OMgcahSiNhFohf
	f3Bs7EgkDny782EBGoqImDLp8UTAmXzd3gLPg4A==
X-Gm-Gg: ASbGncsw9u8lSh0fs+nwGqCARYBxAffMFaEunBLqwrPsRFlOzyGGwD177zGXpAHkg8F
	v922nHjfAtLuQjXRnTuRYUF0JqMzLnXePpt7/YEo9mnuTpw==
X-Google-Smtp-Source: AGHT+IH3FXdPBpJiJnoxYtZf5OcPuzoBCcHTS63VZoNzGC8i3tQMMu8CiFEfyuzsoE5SpSq1X+HyPrst164d4mk4PR4=
X-Received: by 2002:a05:6902:2b85:b0:e38:bec9:527d with SMTP id
 3f1490d57ef6-e38f8b22061mr11846744276.26.1732572501125; Mon, 25 Nov 2024
 14:08:21 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241122-add-display-support-for-qcs615-platform-v3-0-35252e3a51fe@quicinc.com>
 <20241122-add-display-support-for-qcs615-platform-v3-9-35252e3a51fe@quicinc.com>
 <azdmcs7uafw3n6cqbq4ei66oybzhtyvdyz2xl4wtaf3u5zextb@vdhbs6wnbeg4> <520419eb-cedf-465b-a14a-12d97ab257a0@quicinc.com>
In-Reply-To: <520419eb-cedf-465b-a14a-12d97ab257a0@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 26 Nov 2024 00:08:10 +0200
Message-ID: <CAA8EJpqvkeMWgeWCx9D-HcJhRfipZJdEvpvag0wk-WXazkPahA@mail.gmail.com>
Subject: Re: [PATCH v3 9/9] arm64: dts: qcom: Add display support for QCS615
 RIDE board
To: fange zhang <quic_fangez@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
	Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Krishna Manikandan <quic_mkrishn@quicinc.com>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Li Liu <quic_lliu6@quicinc.com>, 
	Xiangxu Yin <quic_xiangxuy@quicinc.com>, linux-arm-msm@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 25 Nov 2024 at 09:39, fange zhang <quic_fangez@quicinc.com> wrote:
>
>
>
> On 2024/11/22 18:22, Dmitry Baryshkov wrote:
> > On Fri, Nov 22, 2024 at 05:56:52PM +0800, Fange Zhang wrote:
> >> From: Li Liu <quic_lliu6@quicinc.com>
> >>
> >> Add display MDSS and DSI configuration for QCS615 RIDE board.
> >> QCS615 has a DP port, and DP support will be added in a later patch.
> >>
> >> Signed-off-by: Li Liu <quic_lliu6@quicinc.com>
> >> Signed-off-by: Fange Zhang <quic_fangez@quicinc.com>
> >> ---
> >>   arch/arm64/boot/dts/qcom/qcs615-ride.dts | 76 ++++++++++++++++++++++++++++++++
> >>   1 file changed, 76 insertions(+)
> >>
> >> diff --git a/arch/arm64/boot/dts/qcom/qcs615-ride.dts b/arch/arm64/boot/dts/qcom/qcs615-ride.dts
> >> index ee6cab3924a6d71f29934a8debba3a832882abdd..cc7dadc411ab79b9e60ccb15eaff84ea5f997c4c 100644
> >> --- a/arch/arm64/boot/dts/qcom/qcs615-ride.dts
> >> +++ b/arch/arm64/boot/dts/qcom/qcs615-ride.dts
> >> @@ -202,6 +202,82 @@ &gcc {
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
> >> +                                            };
> >
> > Where is it connected? Is it DP port? USB-C? eDP?
> yes, it's DP port

So, I'd expect to see a dp-connector node at the end, not the
unterminated anx7625.

> >
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

