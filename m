Return-Path: <linux-arm-msm+bounces-10194-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 29FEA84E3E4
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 Feb 2024 16:19:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D568E28C717
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 Feb 2024 15:19:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DD26779DDA;
	Thu,  8 Feb 2024 15:19:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Yzpzkewh"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07BDE7B3DB
	for <linux-arm-msm@vger.kernel.org>; Thu,  8 Feb 2024 15:19:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707405583; cv=none; b=uGFOqIKiT5D0l4IGB08uNwr0bcvq0Of/N92lDDnaJKC3PrloEIdw61yUIRltwaIbgUahtZQT3z07DcVWnIMastCyLyhrH4QV22R2/69yv5zL4xA6dQ7YJZCSYN4CHMTIr1uUC57AAG4K5oyIBlMveyw9wiqUnNugKAcJGNuBz68=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707405583; c=relaxed/simple;
	bh=Cql9v3QJS/sIvf2tkpEI2ABtjNbLrAV8ks35r4jLYD4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fG0Z9mAMxXCffnNCH8hq9d5Xpu8ihJzmCyMW8hEkZ3N3LyerW/lhaEouzKPakxv8ztLElcwcBjFCR6vU0lin9UxBanoTaG+GQ5FIsH35wvmB1MskbhVQP2gMgLYbHYLxfaxV2s8RR0nCuPHJO+QlZpLGPqRj0usV/W+twDPhbUw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Yzpzkewh; arc=none smtp.client-ip=209.85.128.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-60493e299b6so17898247b3.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 08 Feb 2024 07:19:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1707405581; x=1708010381; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=T5ApjLugEkVpLwS1IE3m+znnflHQdCEggtEoQEc+XWE=;
        b=Yzpzkewh9S2eoU0opMeIFq5c9xMI71+yuzWJB+rP6x24Mz174pkWAIJoJQAr/SsA+z
         1N1iEwDtD8TyYLNFuQcpO44Ek66q0/5WEHBGwMZe1R23dX+zhbW8huoqTKdHBujjIp2V
         qmaaR0qAAeU2sUdIwIBBjNRqrqTYYD/ZSKiFBD2tbJQzfG0wxzykkxWsuoKPSta3fPZ2
         3PKGdjFS3o3xtYudivYqGFJs6GMJRrej4+2cDBl1R37I6WWfbnJFT7FEWEmA7B8q69gt
         WrfQD82Xb4yb8q3JFVsU6zPG0DDBNmURd8ucIK4bZZWYzbK87Mgn0e90c763+DyUl4be
         bXMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707405581; x=1708010381;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=T5ApjLugEkVpLwS1IE3m+znnflHQdCEggtEoQEc+XWE=;
        b=h64odcykvqqhTZKRr0Wc6cOo+f4GL3WcAJ7v7+1TXBuHEq30VpMIP50hnp/XdZoIYI
         ZFhsmlJ31KOcL8TLKcK56IMlE+5ilCteK3pgFmYBqMqRqkm61S0zSFbekPNu2LIyTDt1
         n883AoX3iurC49qo9wYP2kfNyrd8EJ08XCPbIRYfnAlPTfs5okneFjOtLpXYxZjgTMbV
         UR0/MnktTJkavDMkRtlL76ZU5yPycxqJInaIrs7xon0tZ5AycDQPJi6Z3iPove4CFr/A
         EjCLPi0mdHHk1mrxw9jJ0Z/kgs0eBQ0MRfcgGr5aDwaXEip6tLFKyMNTvmJ4xfWTKw0v
         wDOg==
X-Gm-Message-State: AOJu0Yzfe1la9ewFMtEAKS2TqvSxyczIEFDYv0dYuW2/3tIp5FPo7y+X
	t1UMdhdiesqnQt4afz/v5djlA3ByhP/9iP+CpcHmlo9EbY9/DD5foQE25PZdGAkPJtZcZ3Do+QJ
	H5lvlpyckY6chLs+PgfFVEgOGAZZwPajzUfE6fw==
X-Google-Smtp-Source: AGHT+IH020ZQGgxaYyPS9FOMnG7TjjCdrCG2DKdl1M+13FXOLl/HvwzXMEkobFbiRv08WQK4R7EAm1MGzJElnbSiyak=
X-Received: by 2002:a0d:ca0e:0:b0:604:9c0f:7672 with SMTP id
 m14-20020a0dca0e000000b006049c0f7672mr4543300ywd.31.1707405580944; Thu, 08
 Feb 2024 07:19:40 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240207-enable_pcie-v1-1-b684afa6371c@quicinc.com>
 <CAA8EJpqjm_2aE+7BtMkFUdet11q7v_jyHbUEpiDHSBSnzhndYA@mail.gmail.com>
 <dec2976e-6e1e-6121-e175-210377ff6925@quicinc.com> <CAA8EJprsm5Tw=vFpmfEKL8fxS-S+aW+YR0byfyL=v78k75TGEw@mail.gmail.com>
 <3ad77846-b4a8-80ee-e9e1-d5cbf4add6d8@quicinc.com>
In-Reply-To: <3ad77846-b4a8-80ee-e9e1-d5cbf4add6d8@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 8 Feb 2024 17:19:29 +0200
Message-ID: <CAA8EJprRF0tVFZK9c=MT8bSRcBdRvcugBaeEzpX5-wfRyNgc3Q@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: qcom: qcs6490-rb3gen2: Add PCIe nodes
To: Krishna Chaitanya Chundru <quic_krichai@quicinc.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, quic_vbadigan@quicinc.com, 
	quic_ramkri@quicinc.com, quic_nitegupt@quicinc.com, quic_skananth@quicinc.com, 
	quic_parass@quicinc.com
Content-Type: text/plain; charset="UTF-8"

On Thu, 8 Feb 2024 at 16:58, Krishna Chaitanya Chundru
<quic_krichai@quicinc.com> wrote:
> On 2/8/2024 12:21 PM, Dmitry Baryshkov wrote:
> > On Thu, 8 Feb 2024 at 08:14, Krishna Chaitanya Chundru
> > <quic_krichai@quicinc.com> wrote:
> >>
> >>
> >>
> >> On 2/7/2024 5:17 PM, Dmitry Baryshkov wrote:
> >>> On Wed, 7 Feb 2024 at 12:42, Krishna chaitanya chundru
> >>> <quic_krichai@quicinc.com> wrote:
> >>>>
> >>>> Enable PCIe1 controller and its corresponding PHY nodes on
> >>>> qcs6490-rb3g2 platform.
> >>>>
> >>>> PCIe switch is connected to PCIe1, PCIe switch has multiple endpoints
> >>>> connected. For each endpoint a unique BDF will be assigned and should
> >>>> assign unique smmu id. So for each BDF add smmu id.
> >>>>
> >>>> Signed-off-by: Krishna chaitanya chundru <quic_krichai@quicinc.com>
> >>>> ---
> >>>>    arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts | 42 ++++++++++++++++++++++++++++
> >>>>    1 file changed, 42 insertions(+)
> >>>>
> >>>> diff --git a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
> >>>> index 8bb7d13d85f6..0082a3399453 100644
> >>>> --- a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
> >>>> +++ b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
> >>>> @@ -413,6 +413,32 @@ vreg_bob_3p296: bob {
> >>>>           };
> >>>>    };
> >>>>
> >>>> +&pcie1 {
> >>>> +       perst-gpios = <&tlmm 2 GPIO_ACTIVE_LOW>;
> >>>> +
> >>>> +       pinctrl-0 = <&pcie1_reset_n>, <&pcie1_wake_n>;
> >>>> +       pinctrl-names = "default";
> >>>> +
> >>>> +       iommu-map = <0x0 &apps_smmu 0x1c80 0x1>,
> >>>> +                   <0x100 &apps_smmu 0x1c81 0x1>,
> >>>> +                   <0x208 &apps_smmu 0x1c84 0x1>,
> >>>> +                   <0x210 &apps_smmu 0x1c85 0x1>,
> >>>> +                   <0x218 &apps_smmu 0x1c86 0x1>,
> >>>> +                   <0x300 &apps_smmu 0x1c87 0x1>,
> >>>> +                   <0x400 &apps_smmu 0x1c88 0x1>,
> >>>> +                   <0x500 &apps_smmu 0x1c89 0x1>,
> >>>> +                   <0x501 &apps_smmu 0x1c90 0x1>;
> >>>
> >>> Is the iommu-map really board specific?
> >>>
> >> The iommu-map for PCIe varies if PCIe switch is connected.
> >> For this platform a PCIe switch is connected and for that reason
> >> we need to define additional smmu ID's for each BDF.
> >>
> >> For that reason we defined here as these ID's are applicable only
> >> for this board.
> >
> > So, these IDs are the same for all boards, just being unused on
> > devices which have no bridges / switches connected to this PCIe host.
> > If this is correct, please move them to sc7280.dtsi.
> >
> Yes ID's will be same for all boards. we can move them sc7280.dtsi
> but the BDF to smmu mapping will be specific to this board only.
> if there is some other PCIe switch with different configuration is
> connected to different board of same variant in future again these
> mapping needs to updated.

Could you possibly clarify this? Are they assigned one at a time
manually? Or is it somehow handled by the board's TZ code, which
assigns them sequentially to the known endpoints? And is it done via
probing the link or via some static configuration?

>
> For that reason I tried to add it here.
>
> - Krishna Chaitanya.
> >>
> >> - Krishna Chaitanya.
> >>>> +
> >>>> +       status = "okay";
> >>>> +};
> >>>> +
> >>>> +&pcie1_phy {
> >>>> +       vdda-phy-supply = <&vreg_l10c_0p88>;
> >>>> +       vdda-pll-supply = <&vreg_l6b_1p2>;
> >>>> +
> >>>> +       status = "okay";
> >>>> +};
> >>>> +
> >>>>    &qupv3_id_0 {
> >>>>           status = "okay";
> >>>>    };
> >>>> @@ -420,6 +446,22 @@ &qupv3_id_0 {
> >>>>    &tlmm {
> >>>>           gpio-reserved-ranges = <32 2>, /* ADSP */
> >>>>                                  <48 4>; /* NFC */
> >>>> +
> >>>> +       pcie1_reset_n: pcie1-reset-n-state {
> >>>> +               pins = "gpio2";
> >>>> +               function = "gpio";
> >>>> +               drive-strength = <16>;
> >>>> +               output-low;
> >>>> +               bias-disable;
> >>>> +       };
> >>>> +
> >>>> +       pcie1_wake_n: pcie1-wake-n-state {
> >>>> +               pins = "gpio3";
> >>>> +               function = "gpio";
> >>>> +               drive-strength = <2>;
> >>>> +               bias-pull-up;
> >>>> +       };
> >>>> +
> >>>>    };
> >>>>
> >>>>    &uart5 {
> >>>>
> >>>> ---
> >>>> base-commit: 70d201a40823acba23899342d62bc2644051ad2e
> >>>> change-id: 20240207-enable_pcie-95b1d6612b27
> >>>>
> >>>> Best regards,
> >>>> --
> >>>> Krishna chaitanya chundru <quic_krichai@quicinc.com>
> >>>>
> >>>>
> >>>
> >>>
> >
> >
> >



-- 
With best wishes
Dmitry

