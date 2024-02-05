Return-Path: <linux-arm-msm+bounces-9806-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 341FE849CEC
	for <lists+linux-arm-msm@lfdr.de>; Mon,  5 Feb 2024 15:23:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B01351F27862
	for <lists+linux-arm-msm@lfdr.de>; Mon,  5 Feb 2024 14:23:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1C74F24B2A;
	Mon,  5 Feb 2024 14:23:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="NQfc5zvF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yb1-f181.google.com (mail-yb1-f181.google.com [209.85.219.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4977A28DD5
	for <linux-arm-msm@vger.kernel.org>; Mon,  5 Feb 2024 14:23:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707143000; cv=none; b=lTEFdDdNpNNy3ItS3/N1njemCSeKdLYrIC26P27BW6vAdsA8f5vyhJ0PkSpHaAmcksmSrseuMnP5jHQEud/qZ+29XXjTMSPH9RFR04XwyQ0BwGJOzeLIOTXSVQMddZnFTGCKklLL+62XhE4nZ1n+lrwzCSdcs2gRvXcg3Xy68/4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707143000; c=relaxed/simple;
	bh=5RyMVLemSkWVpyHBi0so1fiYtu5f37OhHrGEU8lWY2Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pJEHttTnhOJJWkopnJ9Hzhl4jbBqOecEhcv9ZHZLCxSY31wDhwcub6WIcZwP8Drh3Ae7KkYI+oa91fjz/afIhkwYTrmfkdURKUZ+nN5VdlpIsebcsUZxsJv9WNzr3HFJi1Pf/ZTqiaaTc8moP6YCdiYZcsfAcgr3dwSi8zhRjjY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=NQfc5zvF; arc=none smtp.client-ip=209.85.219.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f181.google.com with SMTP id 3f1490d57ef6-dc6d8f19ab3so4399896276.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 05 Feb 2024 06:23:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1707142997; x=1707747797; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=+5NlV443+B7q3oSMetmnKtZavUAqBXHNm5S0epsUCIU=;
        b=NQfc5zvF8fb4Iv1czlnFnsrAGQULSpqyTntEPy8R0ej0wzEa/OfOKOMfoTYEgjkwsF
         oxc5xMVesQO/nN0FJUQlYcnUdroO2tU77lx/+LWQ/ieeeLAKaC0GB/p40j2syrtiLpR5
         r1KcUOaWLgOf06uVXrojPXonDNfW11SCyF34blWNBsufyh1YJ+7t2dtKUt65cXwJlnv1
         BgETtjgFC6Aruf6oI3H5Hj5N3uN49EHQB3IxGS8J2XPoI+/0oF8xx+VdDuDSDFVrcCc2
         p+e2gvEWNzkYft7AdwSSXZtaek7+xaaN5lljO8fJsWDDSmLEXPXp9vJerMe5zGvTxnfn
         1mbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707142997; x=1707747797;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+5NlV443+B7q3oSMetmnKtZavUAqBXHNm5S0epsUCIU=;
        b=DrkRjAyTLCvcICZEzKT+VPZqeSym4TuTqpXJ2UU9ng/h78EJqjwYowR2D5luej+a/E
         Km6njmwrlGgwMrJVWqAxBTCAlbO5jNkxj6cENK1M32IHs4pdyy/VvazUPu0dPewrmHqa
         4upoLYCEtVOv7+XFsWHNtFz36nmseA94RlajIIUNPMvpeifvoZHqKXCw2k3fOJDvmzr1
         CnRb0muOTySNDqKe4MDtQvubx+aYdg0nFsMuxWtRTuOy5Gwl2XgoTMCh9DzrAUb6KDLh
         oGmMqHfFVAbuYtuauzr0cOwlC6OFUNo5PaiyQEAws+fCvvKudZvyMcJVHTeDxZ1KQUMI
         kl6Q==
X-Gm-Message-State: AOJu0YwIihnt34U/lh7faFUu2hhjYEn/6vgG7rYXX+YTmoMlEbJYh/Af
	Kmw3MSIp/D+Yy4L3/whIKpOePG7YL+s/4oA8IXC3sd01FviZgTi5Efesw9aK9LGko8qhrwvnTLU
	aBMQL/soxSSU/7HoXRu2/DF+HQwgaVxOmwG3AwA==
X-Google-Smtp-Source: AGHT+IEUlohlidLYzYqnXenkXiTLg3hicV5YhqMEsU4zqFnIKrsU4uVbegoKrmAkB3WpX/zLBRuIrICMW8TGUvdgVxg=
X-Received: by 2002:a25:acd2:0:b0:dc2:35c1:7d9c with SMTP id
 x18-20020a25acd2000000b00dc235c17d9cmr8131574ybd.60.1707142997250; Mon, 05
 Feb 2024 06:23:17 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240205115721.1195336-1-quic_jingyw@quicinc.com> <20240205115721.1195336-6-quic_jingyw@quicinc.com>
In-Reply-To: <20240205115721.1195336-6-quic_jingyw@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 5 Feb 2024 16:23:06 +0200
Message-ID: <CAA8EJpr7tHXZHcH1Sbcy0-MCZfMxKBjaPXGdpg3cqyyFjTZOeA@mail.gmail.com>
Subject: Re: [RFC PATCH 5/6] arm64: dts: qcom: add base AIM500 dtsi
To: Jingyi Wang <quic_jingyw@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, andersson@kernel.org, konrad.dybcio@linaro.org, 
	robh@kernel.org, krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, 
	kernel@quicinc.com, Tingwei Zhang <quic_tingweiz@quicinc.com>
Content-Type: text/plain; charset="UTF-8"

On Mon, 5 Feb 2024 at 14:00, Jingyi Wang <quic_jingyw@quicinc.com> wrote:
>
> Introduce aim500 board dtsi.

So, is it a board or a module?

>
> AIM500 Series is a highly optimized family of modules designed to
> support AIoT and Generative AI applications based on sm8650p with
> PMIC and bluetooth functions etc.
>
> Co-developed-by: Tingwei Zhang <quic_tingweiz@quicinc.com>
> Signed-off-by: Tingwei Zhang <quic_tingweiz@quicinc.com>
> Signed-off-by: Jingyi Wang <quic_jingyw@quicinc.com>
> ---
>  arch/arm64/boot/dts/qcom/sm8650p-aim500.dtsi | 409 +++++++++++++++++++
>  1 file changed, 409 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/qcom/sm8650p-aim500.dtsi
>
> diff --git a/arch/arm64/boot/dts/qcom/sm8650p-aim500.dtsi b/arch/arm64/boot/dts/qcom/sm8650p-aim500.dtsi
> new file mode 100644
> index 000000000000..cb857da8653b
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/sm8650p-aim500.dtsi
> @@ -0,0 +1,409 @@
> +// SPDX-License-Identifier: BSD-3-Clause
> +/*
> + * Copyright (c) 2024, Qualcomm Innovation Center, Inc. All rights reserved.
> + */
> +
> +#include <dt-bindings/regulator/qcom,rpmh-regulator.h>
> +#include "sm8650p.dtsi"
> +#include "pm8550.dtsi"
> +#include "pm8550b.dtsi"
> +#define PMK8550VE_SID 8
> +#include "pm8550ve.dtsi"
> +#include "pm8550vs.dtsi"
> +#include "pmk8550.dtsi"
> +
> +/ {
> +       aliases {
> +               serial1 = &uart14;
> +       };
> +
> +       vph_pwr: vph-pwr-regulator { };

Is this regulator a part of the module or a part of the carrier board?
If the latter is true, this must go to the carrier board DT file.

> +};
> +
> +&apps_rsc {
> +       regulators-0 {
> +               compatible = "qcom,pm8550-rpmh-regulators";
> +
> +               vdd-bob1-supply = <&vph_pwr>;
> +               vdd-bob2-supply = <&vph_pwr>;
> +               vdd-l2-l13-l14-supply = <&vreg_bob1>;
> +               vdd-l3-supply = <&vreg_s1c_1p2>;
> +               vdd-l5-l16-supply = <&vreg_bob1>;
> +               vdd-l6-l7-supply = <&vreg_bob1>;
> +               vdd-l8-l9-supply = <&vreg_bob1>;
> +               vdd-l11-supply = <&vreg_s1c_1p2>;
> +               vdd-l12-supply = <&vreg_s6c_1p8>;
> +               vdd-l15-supply = <&vreg_s6c_1p8>;
> +               vdd-l17-supply = <&vreg_bob2>;
> +
> +               qcom,pmic-id = "b";

[skipped]

> +
> +&qupv3_id_1 {
> +       status = "okay";
> +};

No GPI node being enabled?

> +
> +&tlmm {
> +       bt_default: bt-default-state {
> +               bt-en-pins {
> +                       pins = "gpio17";
> +                       function = "gpio";
> +                       drive-strength = <16>;
> +                       bias-disable;
> +               };
> +
> +               sw-ctrl-pins {
> +                       pins = "gpio18";
> +                       function = "gpio";
> +                       bias-pull-down;
> +               };
> +       };
> +};
> +
> +&uart14 {
> +       status = "okay";
> +
> +       bluetooth {
> +               compatible = "qcom,wcn7850-bt";
> +
> +               clocks = <&rpmhcc RPMH_RF_CLK1>;
> +
> +               vddio-supply = <&vreg_l3c_1p2>;
> +               vddaon-supply = <&vreg_l15b_1p8>;
> +               vdddig-supply = <&vreg_s3c_0p9>;
> +               vddrfa0p8-supply = <&vreg_s3c_0p9>;
> +               vddrfa1p2-supply = <&vreg_s1c_1p2>;
> +               vddrfa1p9-supply = <&vreg_s6c_1p8>;
> +
> +               max-speed = <3200000>;
> +
> +               enable-gpios = <&tlmm 17 GPIO_ACTIVE_HIGH>;
> +               swctrl-gpios = <&tlmm 18 GPIO_ACTIVE_HIGH>;
> +
> +               pinctrl-0 = <&bt_default>;
> +               pinctrl-names = "default";
> +       };
> +};
> --
> 2.25.1
>
>


-- 
With best wishes
Dmitry

