Return-Path: <linux-arm-msm+bounces-32225-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C80D6983CD1
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Sep 2024 08:14:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EA7C91C209DF
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Sep 2024 06:14:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6D4FF4EB38;
	Tue, 24 Sep 2024 06:14:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="YZ66UYj2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9369C1B85F1
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Sep 2024 06:14:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727158471; cv=none; b=KdWeTvrwbe5kaxjBG4OLhjgtEUfULrN2CRscotE6y3F0/oTL0dO904I0hgNaoUvp8y0r5rYuxqCUJOVgxjqDUXngZkD2hvOgTt+TL8nhLx+TdtsLVY4qBLqqI8tBiJVhuqmaxoFLWda5MAQqPPkQ21Iv7DcxZF06ctOc9WcI7mM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727158471; c=relaxed/simple;
	bh=Qr8m1yo5fCudhrN8+J3AFsSeYbvPSLy4ErAplDL01hw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aHAtKj5JgQdHqfXv4qZECKypxbYAZcmGwR1/xqvUtEaw/WPGcOsNJFZRa10eHh2HHoDosnkMzyFVb4Y9EXCBVRXWAIU1SMgWeOh9mB92uiqz3uSQixJjN2UyuyNPB9TuB9oq6Xhf4yDNL4HIEYlh5FBrhjsecT4PMCFrFWWNNXM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=YZ66UYj2; arc=none smtp.client-ip=209.85.128.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-6e214c3d045so440377b3.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Sep 2024 23:14:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1727158468; x=1727763268; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=/VjSBYA8cGtVWX7UwzKIdqqC/5t90VWcah768k+1m10=;
        b=YZ66UYj2uXdOVOkcQuTgymnvckjIi/8Oe5L3V02N2hxkdI+78bjpT9T8SRdPJt5uN6
         7tmQ7o6ryGK4lLm6Anq5IqpIyqFNVBvA2vA77e6sdnRdJg06VW8SPOnnqIxcjpC1DPzY
         W2G09X70RGFISyb/4BhgKSDdoA93Gw1pnV7JgBC9HTLJfx81XxmBIv05K04I1C9+vm7r
         GnBhIgJpavEKww7oiCeAJSgDVegcFH7i2OHvtqB7alcXA1WZL3HoyLgWNfq+8wLjX+uS
         6uY2cMJ0rLRGiU4LRPtnqPf9SSl0NYf3ZGcQptegOYFCP9GbFjVnJlmE5Y8HXfIVWSmR
         4LlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727158468; x=1727763268;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/VjSBYA8cGtVWX7UwzKIdqqC/5t90VWcah768k+1m10=;
        b=pNQ9wzFogPdnoTF0j0QbECnA6Uillfxcpsb9O1nz9R+cN/PdMZIMwt3IXjbxdvd0ND
         BrNkXmAFTNGodyl+T6IQaORwBDYVqHIk1clH6w8kPdGOA30Q0QTiDTExLakN/eYKvTuW
         S3+juLvsF0tl7AGJEbUm1CTAdImBx/Cov5MmnupxDpy+Pkr6i+cW6Nz6vipFP03aA2Y2
         Qly9HVTQRmoeWBbxEEMeLL38L+Hku5GbX09f4BSpBCdcrHdNPd3bcYgxgNBB9kR9l1Fn
         t7sBFCym2MbPKDaFskP+D2O4W267hu3C5UpDPL8p0MS+Fn2xq0EYRUvex/XtqVXpVJvh
         4jgg==
X-Forwarded-Encrypted: i=1; AJvYcCUMDdbr6DQNR4tXfDE5KcikcglKMT/baOKrkZ0kdHS1PTB0KtezW4fQDiqaQketpxDVUGptOErcgChZKlIA@vger.kernel.org
X-Gm-Message-State: AOJu0YwXaEO/7UkAprMU40qKi2Dr7en6tPwwMzHoN3g7g7x1V2O+4IWn
	QmIbtJzF+/AFdQeB9ZdsSNlbItSsO4C1SVZP4n5yi3MoZGwZM4m1JVnvLXDWopcsD/362Ub/6bq
	iwcSikK1W2mSgf4g1abIfmxWfHNEv8OVAEf+1jg==
X-Google-Smtp-Source: AGHT+IG72jBrJpCMbV8xmaTG1rW1NrWV8soeY10kze37FjgyQ6JCaV/IOnv2E1o6c7zVnMf1sRd7+1dpErtm2GfwguA=
X-Received: by 2002:a05:690c:f0a:b0:6dd:d34b:373f with SMTP id
 00721157ae682-6dfeed222ebmr130914267b3.8.1727158468586; Mon, 23 Sep 2024
 23:14:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240918-a663-gpu-support-v1-0-25fea3f3d64d@quicinc.com>
 <20240918-a663-gpu-support-v1-3-25fea3f3d64d@quicinc.com> <udt76i3sl7zekhudqpnvhvhfxchvixwoinz7metuwfrpynl47k@wlpforwv7mcf>
 <20240923200537.q5rcw66wmqnwmtpk@hu-akhilpo-hyd.qualcomm.com>
In-Reply-To: <20240923200537.q5rcw66wmqnwmtpk@hu-akhilpo-hyd.qualcomm.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 24 Sep 2024 08:14:17 +0200
Message-ID: <CAA8EJpqNXb+pJp0OQXi5Pn7d2u2zGeJmVkTvsgFXzvkHn6FjqA@mail.gmail.com>
Subject: Re: [PATCH 3/3] arm64: dts: qcom: sa8775p: Add gpu and gmu nodes
To: Akhil P Oommen <quic_akhilpo@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
	Konrad Dybcio <konrad.dybcio@linaro.org>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
	Marijn Suijten <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, 
	Daniel Vetter <daniel@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, linux-arm-msm@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	Puranam V G Tejaswi <quic_pvgtejas@quicinc.com>
Content-Type: text/plain; charset="UTF-8"

On Mon, 23 Sept 2024 at 22:05, Akhil P Oommen <quic_akhilpo@quicinc.com> wrote:
>
> On Wed, Sep 18, 2024 at 12:27:03AM +0300, Dmitry Baryshkov wrote:
> > On Wed, Sep 18, 2024 at 02:08:43AM GMT, Akhil P Oommen wrote:
> > > From: Puranam V G Tejaswi <quic_pvgtejas@quicinc.com>
> > >
> > > Add gpu and gmu nodes for sa8775p based platforms.
> >
> > Which platforms? The commit adds nodes to the SoC and the single RIDE
> > platform.
> >
> > >
> > > Signed-off-by: Puranam V G Tejaswi <quic_pvgtejas@quicinc.com>
> > > Signed-off-by: Akhil P Oommen <quic_akhilpo@quicinc.com>
> > > ---
> > >  arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi |  8 ++++
> > >  arch/arm64/boot/dts/qcom/sa8775p.dtsi      | 75 ++++++++++++++++++++++++++++++
> > >  2 files changed, 83 insertions(+)
> > >
> > > diff --git a/arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi b/arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi
> > > index 2a6170623ea9..a01e6675c4bb 100644
> > > --- a/arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi
> > > +++ b/arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi
> > > @@ -407,6 +407,14 @@ queue3 {
> > >     };
> > >  };
> > >
> > > +&gpu {
> > > +   status = "okay";
> > > +
> > > +   zap-shader {
> >
> > It's easier to add gpu_zap_shader_link label in the DTSI file and then
> > reference it instead of using the subnode again.
> >
> > > +           firmware-name = "qcom/sa8775p/a663_zap.mbn";
> > > +   };
> > > +};
> >
> > Separate patch, please.
> >
> > > +
> > >  &i2c11 {
> > >     clock-frequency = <400000>;
> > >     pinctrl-0 = <&qup_i2c11_default>;
> > > diff --git a/arch/arm64/boot/dts/qcom/sa8775p.dtsi b/arch/arm64/boot/dts/qcom/sa8775p.dtsi
> > > index 23f1b2e5e624..12c79135a303 100644
> > > --- a/arch/arm64/boot/dts/qcom/sa8775p.dtsi
> > > +++ b/arch/arm64/boot/dts/qcom/sa8775p.dtsi
> > > @@ -2824,6 +2824,81 @@ tcsr_mutex: hwlock@1f40000 {
> > >                     #hwlock-cells = <1>;
> > >             };
> > >
> > > +           gpu: gpu@3d00000 {
> > > +                   compatible = "qcom,adreno-663.0", "qcom,adreno";
> > > +                   reg = <0 0x03d00000 0 0x40000>,
> > > +                         <0 0x03d9e000 0 0x1000>,
> > > +                         <0 0x03d61000 0 0x800>;
> >
> > I think it's suggested to use 0x0 now
> >
> > > +                   reg-names = "kgsl_3d0_reg_memory",
> > > +                               "cx_mem",
> > > +                               "cx_dbgc";
> > > +                   interrupts = <GIC_SPI 300 IRQ_TYPE_LEVEL_HIGH>;
> > > +                   iommus = <&adreno_smmu 0 0xc00>,
> > > +                            <&adreno_smmu 1 0xc00>;
> > > +                   operating-points-v2 = <&gpu_opp_table>;
> > > +                   qcom,gmu = <&gmu>;
> > > +                   interconnects = <&gem_noc MASTER_GFX3D 0 &mc_virt SLAVE_EBI1 0>;
> >
> > QCOM_ICC_TAG_ALWAYS instead of 0
> >
> > > +                   interconnect-names = "gfx-mem";
> > > +                   #cooling-cells = <2>;
> >
> > No speed bins?
>
> Thanks for the review. Agree on all comments.
>
> Speedbins were missed because we are sharing these changes early in the
> developement cycle, sort of like what we did for chromeos develeopment.
> Will try to pick it up in the next patchset.

Ack. If you mention this in the commit message, that would be great!

>
> -Akhil
>
> >
> > > +
> > > +                   status = "disabled";
> > > +
> > > +                   zap-shader {
> >
> > gpu_zap_shader: zap-shader
> >
> > > +                           memory-region = <&pil_gpu_mem>;
> > > +                   };
> > > +
> > > +                   gpu_opp_table: opp-table {
> > > +                           compatible = "operating-points-v2";
> > > +
> > > +                           opp-405000000 {
> >
> > Just a single freq?
> >
> > > +                                   opp-hz = /bits/ 64 <405000000>;
> > > +                                   opp-level = <RPMH_REGULATOR_LEVEL_SVS_L1>;
> > > +                                   opp-peak-kBps = <8368000>;
> > > +                           };
> > > +
> >
> > Drop the empty line, please.
> >
> > > +                   };
> > > +           };
> > > +
> > > +           gmu: gmu@3d6a000 {
> > > +                   compatible = "qcom,adreno-gmu-663.0", "qcom,adreno-gmu";
> > > +                   reg = <0 0x03d6a000 0 0x34000>,
> > > +                           <0 0x3de0000 0 0x10000>,
> > > +                           <0 0x0b290000 0 0x10000>;
> >
> > Wrong indentation, please align to the angle bracket.
> > Also I think it's suggested to use 0x0 now
> >
> > > +                   reg-names = "gmu", "rscc", "gmu_pdc";
> > > +                   interrupts = <GIC_SPI 304 IRQ_TYPE_LEVEL_HIGH>,
> > > +                                   <GIC_SPI 305 IRQ_TYPE_LEVEL_HIGH>;
> >
> > And here
> >
> > > +                   interrupt-names = "hfi", "gmu";
> > > +                   clocks = <&gpucc GPU_CC_CX_GMU_CLK>,
> > > +                            <&gpucc GPU_CC_CXO_CLK>,
> > > +                            <&gcc GCC_DDRSS_GPU_AXI_CLK>,
> > > +                            <&gcc GCC_GPU_MEMNOC_GFX_CLK>,
> > > +                            <&gpucc GPU_CC_AHB_CLK>,
> > > +                            <&gpucc GPU_CC_HUB_CX_INT_CLK>,
> > > +                            <&gpucc GPU_CC_HLOS1_VOTE_GPU_SMMU_CLK>;
> > > +                   clock-names = "gmu",
> > > +                                 "cxo",
> > > +                                 "axi",
> > > +                                 "memnoc",
> > > +                                 "ahb",
> > > +                                 "hub",
> > > +                                 "smmu_vote";
> > > +                   power-domains = <&gpucc GPU_CC_CX_GDSC>,
> > > +                                   <&gpucc GPU_CC_GX_GDSC>;
> > > +                   power-domain-names = "cx",
> > > +                                        "gx";
> > > +                   iommus = <&adreno_smmu 5 0xc00>;
> > > +                   operating-points-v2 = <&gmu_opp_table>;
> > > +
> > > +                   gmu_opp_table: opp-table {
> > > +                           compatible = "operating-points-v2";
> > > +
> > > +                           opp-200000000 {
> > > +                                   opp-hz = /bits/ 64 <200000000>;
> > > +                                   opp-level = <RPMH_REGULATOR_LEVEL_MIN_SVS>;
> > > +                           };
> > > +                   };
> > > +           };
> > > +
> > >             gpucc: clock-controller@3d90000 {
> > >                     compatible = "qcom,sa8775p-gpucc";
> > >                     reg = <0x0 0x03d90000 0x0 0xa000>;
> > >
> > > --
> > > 2.45.2
> > >
> >
> > --
> > With best wishes
> > Dmitry



-- 
With best wishes
Dmitry

