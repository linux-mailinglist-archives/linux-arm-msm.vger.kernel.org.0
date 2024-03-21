Return-Path: <linux-arm-msm+bounces-14749-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D09928859CB
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 Mar 2024 14:13:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 45EA41F22883
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 Mar 2024 13:13:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CD02A83CD5;
	Thu, 21 Mar 2024 13:13:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Qjpww81f"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yb1-f173.google.com (mail-yb1-f173.google.com [209.85.219.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C1BB83CCD
	for <linux-arm-msm@vger.kernel.org>; Thu, 21 Mar 2024 13:13:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711026801; cv=none; b=CCSJBUtQR9JWmrZdDawjftJB73dVYRf5jjEDxawyoKnF+95hwHnUGeGBB++wQZKyKZg3jsEHMKG55Wu01afTGrQSYfpV5vfsl2fma0QRVPcQOezkHAPbvQyQB9YZ3hb/K0Cgey3Yz2TKDudxWkiVB2jQWLsEy8CuIqIGYgflQ6k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711026801; c=relaxed/simple;
	bh=OCFf+/0k3N14SL9VxeOv2x7i6IWhZI7oCAPcVIJzITg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fnQLSviOuAGLvFi0w+o3dKh96iY57nJi+EsxfVaByhCba0gRvgQ2oAvvzwLHNqsVbHqyYZ33COpouwkP/2hdQk0nv7BkzVsc7Nn5XG/MfWEAvAG9QqTL5gv/u3LDDl6FGea7mTWXHgZ9njUQdFfKFoYov99oJ6r6AM0Nk+7xygc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Qjpww81f; arc=none smtp.client-ip=209.85.219.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f173.google.com with SMTP id 3f1490d57ef6-dc745927098so842295276.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 21 Mar 2024 06:13:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711026799; x=1711631599; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=E40Aatrxpjcewhw+3X2xvQbHG3kr0R3AEZCTM1NCCeI=;
        b=Qjpww81fzokxyCiB08wpBMOzi81cHt7X+PGDsxh5kQwjZFqPiphsfn9w2Z9iIfCGQd
         4hHyJKUiYyVPgm0BMsJN5N057vfmC0+EqVSZXoI2yA0uMbz1rRJEZNdoYEtGlUcW2+a6
         2ubpxpBouZcdB3JM9i5etHH2BuZ9PJHAVBYNz5Wy7HNYGmPLnj9MyTK5KlEBBN4BeOTj
         t3hBdQJDERjGDbBE2jr/g3hqrZbZjhf5/a0M2CkpL1FzqM1HABEOnwXIeMiyxFIYxovS
         HXclNpM0n6LgdvyjbU73OGmwIfJO3ANkkuONCvsuLFM5oeaiPCC32Alm1Ai1iW7HJEkX
         NsiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711026799; x=1711631599;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=E40Aatrxpjcewhw+3X2xvQbHG3kr0R3AEZCTM1NCCeI=;
        b=LElpBiGxVA0kZHuI2Gb40tA6Cl+9+m8/yvmwwGngZYasIqNzf+uP+RsJ8ySUOJDXhP
         iYqCrYWm2bzoV35w9p7wjud8tEmojXYdaL1TB7hwwlHKEfY4wOvRqA6gime65/4NkvHh
         m2Mzxr6GU3+bPZWcxtYT/QgeKQQpby11Kld7J06miuRi53GQ/0d+PbbM4ZP5bH5heNho
         dGMdkgIn6Hes1EVVwz9GNkgHJ56E30O9jzASWvZ7aa3Ia+l80lvvaXXt+dhdcnjgJIoJ
         TxiZtTtQFXwqCdVK/vWpfL/vbsi7SFOdCg/MhEHqtzlKovb7jNIHNaWEtPSnRoDbaS7P
         FjNw==
X-Forwarded-Encrypted: i=1; AJvYcCXLLn4KpVDlFNo7tvKzYWzl8prlxGEFCjbzI4XD4I4QBkw4kfoGydQ+/kqj/YVgFgaC9jnZY37xgwsbnEtKK357bOubb6RqlhR8U9kWoQ==
X-Gm-Message-State: AOJu0YzO3t7zsNCo4k+STNHL9bjvhlzeLY/CwcXi07qvCHGP3XX0N/Mp
	JH/hArBNIq3h2p5y6MZfz07/hkWIwlFOQPVlzq/ZJN3FQtSQNY1Mlsane0yVvY47T+1sSZX8K3b
	7a+p3aqL3qS40R2IgEUgKJdC3mbH/o4BVx4RY8A==
X-Google-Smtp-Source: AGHT+IGbiWtKd/lGwrtqcd9WOSTuQvR/3OBwBvxD6BUrKgJ8DpWXZzxxbZ86FV/Zex9X9NHx3cHz2DDYl9C7wXDAoXs=
X-Received: by 2002:a25:aac6:0:b0:dcb:d653:8ad9 with SMTP id
 t64-20020a25aac6000000b00dcbd6538ad9mr4294836ybi.12.1711026799165; Thu, 21
 Mar 2024 06:13:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240321092529.13362-1-quic_jkona@quicinc.com> <20240321092529.13362-7-quic_jkona@quicinc.com>
In-Reply-To: <20240321092529.13362-7-quic_jkona@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 21 Mar 2024 15:13:08 +0200
Message-ID: <CAA8EJppHGS+W-aiXvJ2cE=jCbua8Y0Q+zv_QTs+C9V5+Y1vuZg@mail.gmail.com>
Subject: Re: [PATCH V2 RESEND 6/6] arm64: dts: qcom: sm8650: Add video and
 camera clock controllers
To: Jagadeesh Kona <quic_jkona@quicinc.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, linux-arm-msm@vger.kernel.org, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Taniya Das <quic_tdas@quicinc.com>, 
	Satya Priya Kakitapalli <quic_skakitap@quicinc.com>, Ajit Pandey <quic_ajipan@quicinc.com>, 
	Imran Shaik <quic_imrashai@quicinc.com>
Content-Type: text/plain; charset="UTF-8"

On Thu, 21 Mar 2024 at 11:27, Jagadeesh Kona <quic_jkona@quicinc.com> wrote:
>
> Add device nodes for video and camera clock controllers on Qualcomm
> SM8650 platform.
>
> Signed-off-by: Jagadeesh Kona <quic_jkona@quicinc.com>
> ---
>  arch/arm64/boot/dts/qcom/sm8650.dtsi | 28 ++++++++++++++++++++++++++++
>  1 file changed, 28 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/qcom/sm8650.dtsi b/arch/arm64/boot/dts/qcom/sm8650.dtsi
> index 32c0a7b9aded..d862aa6be824 100644
> --- a/arch/arm64/boot/dts/qcom/sm8650.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8650.dtsi
> @@ -4,6 +4,8 @@
>   */
>
>  #include <dt-bindings/clock/qcom,rpmh.h>
> +#include <dt-bindings/clock/qcom,sm8450-videocc.h>
> +#include <dt-bindings/clock/qcom,sm8650-camcc.h>
>  #include <dt-bindings/clock/qcom,sm8650-dispcc.h>
>  #include <dt-bindings/clock/qcom,sm8650-gcc.h>
>  #include <dt-bindings/clock/qcom,sm8650-gpucc.h>
> @@ -3110,6 +3112,32 @@ opp-202000000 {
>                         };
>                 };
>
> +               videocc: clock-controller@aaf0000 {
> +                       compatible = "qcom,sm8650-videocc";
> +                       reg = <0 0x0aaf0000 0 0x10000>;
> +                       clocks = <&bi_tcxo_div2>,
> +                                <&gcc GCC_VIDEO_AHB_CLK>;
> +                       power-domains = <&rpmhpd RPMHPD_MMCX>;
> +                       required-opps = <&rpmhpd_opp_low_svs>;

The required-opps should no longer be necessary.

> +                       #clock-cells = <1>;
> +                       #reset-cells = <1>;
> +                       #power-domain-cells = <1>;
> +               };
> +
> +               camcc: clock-controller@ade0000 {
> +                       compatible = "qcom,sm8650-camcc";
> +                       reg = <0 0x0ade0000 0 0x20000>;
> +                       clocks = <&gcc GCC_CAMERA_AHB_CLK>,
> +                                <&bi_tcxo_div2>,
> +                                <&bi_tcxo_ao_div2>,
> +                                <&sleep_clk>;
> +                       power-domains = <&rpmhpd RPMHPD_MMCX>;
> +                       required-opps = <&rpmhpd_opp_low_svs>;
> +                       #clock-cells = <1>;
> +                       #reset-cells = <1>;
> +                       #power-domain-cells = <1>;
> +               };
> +
>                 mdss: display-subsystem@ae00000 {
>                         compatible = "qcom,sm8650-mdss";
>                         reg = <0 0x0ae00000 0 0x1000>;
> --
> 2.43.0
>
>


-- 
With best wishes
Dmitry

