Return-Path: <linux-arm-msm+bounces-10141-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CA1F84DA67
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 Feb 2024 07:51:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D89A82876C1
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 Feb 2024 06:51:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D156B69307;
	Thu,  8 Feb 2024 06:51:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="bh5n7kun"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B12767E7F
	for <linux-arm-msm@vger.kernel.org>; Thu,  8 Feb 2024 06:51:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707375093; cv=none; b=LTrGLM0EodrY1OI8NYvxhGtal4PrRnGbQU5p6o/ke6839rEji7b1l6n0npkgnuR1YQ0pQjlHaf50oUBFtzQFROJZNxCUo76DoDmozIzbBswep4PxJn0AEzIJyH4tWhQHznbvNfL42RPva4qefciOaJxiea8fkgJa7QYNAQaNZTU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707375093; c=relaxed/simple;
	bh=Yk0TRtNDlKvfwOBR1gNtMnOcYp6d38zf8nmp/hyix24=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JFGbBgvpwL5xOd4AW1uvhLaIqeC4VFyz9e1f0FJiW+JPFLbPMJGKmjgLTBTLMVBFYsFS0ZFdolZL2bKSWHKp56j4lcrZEH1KuNEpISmk0y+1ct02bIvBucI5dDnTgsevpkSh7BMKEWf7ZgIcIlVdZ7/mmUyC8QQnpo4HvnO4lNE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=bh5n7kun; arc=none smtp.client-ip=209.85.128.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-6049fc02a19so7360427b3.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 07 Feb 2024 22:51:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1707375090; x=1707979890; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=o78Bc5zbieHqZojFNoz3PnZDBrhr2V8K7hMKKM0imP4=;
        b=bh5n7kunezuHNLxNTvkYv3T3UUCrfeF6+BlXh69Es3WsCkMMEQmzbqlTrXnm0FluD0
         vA3k4W55AcZmFWJAkkdM+VJsclI5LKWWJCnCcB+PZDg0A4hiVS3ABPmJZuekZ7owcoNY
         mGxGvcVYU6TqO7rqACU2WKafTrksGoi4FsqZJviXyi22l4vDGi4Nx0BB+lswKGbTnEY0
         FKbnALfnCPJbroRqYwh2Wj7NFLH8TMVs8f5kjibq5dpTF2iBkyIY54TlEFkCRS7yGJFD
         aU0YB18n10tQV4kkT8OwPtfrC+oAqc1iWF9JfnCxw7Q4HPGccmZF+vYeVPg9R+k73rFg
         r7oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707375090; x=1707979890;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=o78Bc5zbieHqZojFNoz3PnZDBrhr2V8K7hMKKM0imP4=;
        b=OpJMB7d3mIX+7Z552IeD1UQTXzi0W+jHTwTY+ouCcHPlruQ4OmLlS1oiZ7j55pobXM
         uc7H0wcRN2pz74ij9jVhvo4vZAGLpmFqrqB7jzBt2dFhRgi7cOGyp6s7OkD4hx6EIuv5
         8lb1xgvLF7LYplIhJJ6a6iraO/YItJD4KZWVSfEuFEtUQg3WbXsl7kJNTZfoVgaPKwkm
         AOD7enbLTT3L0wY7jZmFc9vBHFRO25p/kCj5ZByQKEMP+BL7MobUKrhBj3YbW7IZovxH
         FzAtu6gQ5ylNwbwVZcfN4bpLsseTpXX//ij5t/r3Hs2a8snShUZ6E+jNe43YQcK69FAW
         ziDw==
X-Forwarded-Encrypted: i=1; AJvYcCVa25ODGL53KGNZd2oNPyztaSwyPjFf09KqEpZDRp7/fNjFHtTm2001TcTy9NBma+UYxFjHnkgCP0/G26Nndc5e31qAxXf8dcvldmPHHQ==
X-Gm-Message-State: AOJu0YxPLVJwVByRBKN8tnCjaE0bMPsq85rWDPGNf7MXBg+JmXu6D/xG
	pp0Y1USejrqKfRj874WgxfhVvB3NDP4yy52Jw1M/SllnMHhQXXgOrdrnCa5Q1Q/3YsgU48AkcwU
	GHV2qRyUQSL08WrWda9rGy8buzWQO5oBZ+C69/w==
X-Google-Smtp-Source: AGHT+IFYoAgIj16RV+Hjgu8xiheQRQLmSX+VIaEO8RTToWv4LX4d36aDiFFyAN6OEF9ccIK7GmIVlD0dzJ7rubpa5w4=
X-Received: by 2002:a81:7606:0:b0:600:3a38:a815 with SMTP id
 r6-20020a817606000000b006003a38a815mr7511795ywc.35.1707375090000; Wed, 07 Feb
 2024 22:51:30 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240207-enable_pcie-v1-1-b684afa6371c@quicinc.com>
 <CAA8EJpqjm_2aE+7BtMkFUdet11q7v_jyHbUEpiDHSBSnzhndYA@mail.gmail.com> <dec2976e-6e1e-6121-e175-210377ff6925@quicinc.com>
In-Reply-To: <dec2976e-6e1e-6121-e175-210377ff6925@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 8 Feb 2024 08:51:18 +0200
Message-ID: <CAA8EJprsm5Tw=vFpmfEKL8fxS-S+aW+YR0byfyL=v78k75TGEw@mail.gmail.com>
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

On Thu, 8 Feb 2024 at 08:14, Krishna Chaitanya Chundru
<quic_krichai@quicinc.com> wrote:
>
>
>
> On 2/7/2024 5:17 PM, Dmitry Baryshkov wrote:
> > On Wed, 7 Feb 2024 at 12:42, Krishna chaitanya chundru
> > <quic_krichai@quicinc.com> wrote:
> >>
> >> Enable PCIe1 controller and its corresponding PHY nodes on
> >> qcs6490-rb3g2 platform.
> >>
> >> PCIe switch is connected to PCIe1, PCIe switch has multiple endpoints
> >> connected. For each endpoint a unique BDF will be assigned and should
> >> assign unique smmu id. So for each BDF add smmu id.
> >>
> >> Signed-off-by: Krishna chaitanya chundru <quic_krichai@quicinc.com>
> >> ---
> >>   arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts | 42 ++++++++++++++++++++++++++++
> >>   1 file changed, 42 insertions(+)
> >>
> >> diff --git a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
> >> index 8bb7d13d85f6..0082a3399453 100644
> >> --- a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
> >> +++ b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
> >> @@ -413,6 +413,32 @@ vreg_bob_3p296: bob {
> >>          };
> >>   };
> >>
> >> +&pcie1 {
> >> +       perst-gpios = <&tlmm 2 GPIO_ACTIVE_LOW>;
> >> +
> >> +       pinctrl-0 = <&pcie1_reset_n>, <&pcie1_wake_n>;
> >> +       pinctrl-names = "default";
> >> +
> >> +       iommu-map = <0x0 &apps_smmu 0x1c80 0x1>,
> >> +                   <0x100 &apps_smmu 0x1c81 0x1>,
> >> +                   <0x208 &apps_smmu 0x1c84 0x1>,
> >> +                   <0x210 &apps_smmu 0x1c85 0x1>,
> >> +                   <0x218 &apps_smmu 0x1c86 0x1>,
> >> +                   <0x300 &apps_smmu 0x1c87 0x1>,
> >> +                   <0x400 &apps_smmu 0x1c88 0x1>,
> >> +                   <0x500 &apps_smmu 0x1c89 0x1>,
> >> +                   <0x501 &apps_smmu 0x1c90 0x1>;
> >
> > Is the iommu-map really board specific?
> >
> The iommu-map for PCIe varies if PCIe switch is connected.
> For this platform a PCIe switch is connected and for that reason
> we need to define additional smmu ID's for each BDF.
>
> For that reason we defined here as these ID's are applicable only
> for this board.

So, these IDs are the same for all boards, just being unused on
devices which have no bridges / switches connected to this PCIe host.
If this is correct, please move them to sc7280.dtsi.

>
> - Krishna Chaitanya.
> >> +
> >> +       status = "okay";
> >> +};
> >> +
> >> +&pcie1_phy {
> >> +       vdda-phy-supply = <&vreg_l10c_0p88>;
> >> +       vdda-pll-supply = <&vreg_l6b_1p2>;
> >> +
> >> +       status = "okay";
> >> +};
> >> +
> >>   &qupv3_id_0 {
> >>          status = "okay";
> >>   };
> >> @@ -420,6 +446,22 @@ &qupv3_id_0 {
> >>   &tlmm {
> >>          gpio-reserved-ranges = <32 2>, /* ADSP */
> >>                                 <48 4>; /* NFC */
> >> +
> >> +       pcie1_reset_n: pcie1-reset-n-state {
> >> +               pins = "gpio2";
> >> +               function = "gpio";
> >> +               drive-strength = <16>;
> >> +               output-low;
> >> +               bias-disable;
> >> +       };
> >> +
> >> +       pcie1_wake_n: pcie1-wake-n-state {
> >> +               pins = "gpio3";
> >> +               function = "gpio";
> >> +               drive-strength = <2>;
> >> +               bias-pull-up;
> >> +       };
> >> +
> >>   };
> >>
> >>   &uart5 {
> >>
> >> ---
> >> base-commit: 70d201a40823acba23899342d62bc2644051ad2e
> >> change-id: 20240207-enable_pcie-95b1d6612b27
> >>
> >> Best regards,
> >> --
> >> Krishna chaitanya chundru <quic_krichai@quicinc.com>
> >>
> >>
> >
> >



-- 
With best wishes
Dmitry

