Return-Path: <linux-arm-msm+bounces-13500-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D994873963
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Mar 2024 15:39:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 935A2B2538F
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Mar 2024 14:39:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E54721339A2;
	Wed,  6 Mar 2024 14:38:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="r1xOPHrw"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACC6C134CD0
	for <linux-arm-msm@vger.kernel.org>; Wed,  6 Mar 2024 14:38:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709735935; cv=none; b=DgH4ClE9xmTTwhYF0Hx+lqN6M/jJndzWVgujiFKGE8y9Ai7Pa1OxB1yVJzSehQeoR66yU96i/JNRhblEnjb5wAlgOukEopEvP3bl+5ylGbsz1MF5Yq9eFrxe8O4W5jiXOP7PElhfiSQJyAd24j0BHzimrFsOC8rN+8pmg/519AQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709735935; c=relaxed/simple;
	bh=MpDhnAN5CnsD+9jk7y8K5Rh89xQkvphbiPN/Uv8voGA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fX9ioYpm5lwasGK1FrUfB3lYh44qWB8tHfRFo9HXiWJ1wV4gy9QoWj325hJKG1PKaJRuxMvbTZHNTTpqG73foyvqmUxTGikUcP0nCY8iapBrZ9wu713ZU+wGn4GVBpwgH7tQ8pBEJw5N4utcUoH2S7wuT85Bc6VByE/GFRu7/cI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=r1xOPHrw; arc=none smtp.client-ip=209.85.128.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-60974cb1cd7so63548007b3.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 06 Mar 2024 06:38:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709735931; x=1710340731; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=rgn+fbiALcH1MSWgsS+x3nP7X4DPXs1x86Sf7OmjGBo=;
        b=r1xOPHrwgV5dM3UbpeRD/cFuvB5DcPkxwBKDLU+KUmIAaq4AQdiopCEq8k6+7h2tzY
         5aF17Arp0Jtdqp363qHRHkuyQiJZTFOLPdGrECcDmZL/bibf5u5eqoG9yB4y9o3AJVK5
         etAcR7eKEnsEbSxMNBYmQutLfxil9HyA615ynE80O/FioF+Gv4Jhd9Ly0iw2Ii8hZQ0e
         IBhBFnItBiDieLB/ivt5w9ZgRQdoKldwbm4UHtG5HR9ECrZhNrkMHBWju3w/+D5ytkBi
         APs2V0RuhUg6jpXTgwTYsr8KGkhODSCgPedMf1hfB4bupMbwmY+4mcVnnS4g+K8eRaaB
         0SkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709735931; x=1710340731;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rgn+fbiALcH1MSWgsS+x3nP7X4DPXs1x86Sf7OmjGBo=;
        b=DLnVMFlBpHBjuOz59sGjH8Z7awCS+K4PgA/rELxoQ90Uij1Mk3vpM5Oc2ZC6lqINTs
         Xxg0NHWq31EyYBxIHmKN1XW4+V6CA+nCpu6zkdsQRpMQLNR/1DnnhazXdSXtCToZe58h
         RCo9stcD9fELwDuZVYmkm9ZhzCAf51Zp87knbPOVS8DxiAxyAKnLlDEpfADTlBOo8BRc
         7GOFf5Bk1ZNO13CTm+I1lw5GBfsRQCBdA1xusSV9tnKUn6ZhIpoILKxvbARn7bDKCjOC
         xtRDmLCVMIsjnXTiwOBpe0CdlusdyexyZVWe24qb4SnSppuqcExOlgfQbSA/Yvhfi94O
         6yqA==
X-Forwarded-Encrypted: i=1; AJvYcCXNLoKksEaT4CW8bvYpVhuTa8rcmJsDlpEib7O4uI996vVP4vz5F52C9MczJqagYj5KwjiDBeI7rQ0TD/yg67ZsvGIekDcuqACFJ1KIkA==
X-Gm-Message-State: AOJu0Yy2YB6yac3o8+j1lMLtvl3YhQTziPN9eG3yX7htdyunlGUQMV0q
	whUNG75SqI/QQAxONrpxKO5t2ssNYoemzS6vmLkr+ZZdGpoFe3zwtN5B5W1UT1bEgPeBV9HYVTo
	rjynxGcPKNlg6DPqyc6gaM6ZkVMoL77f1sF8VWA==
X-Google-Smtp-Source: AGHT+IFU4SEZqLUrGH6c45A1ZNc5qs3PQbwPEvpYh7FSf640PTQvR0Ll56BpqrWHESawBKra7g21wOXC08a/J9trnYQ=
X-Received: by 2002:a0d:d341:0:b0:609:7354:6b11 with SMTP id
 v62-20020a0dd341000000b0060973546b11mr14830225ywd.52.1709735931599; Wed, 06
 Mar 2024 06:38:51 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240306140306.876188-1-amadeus@jmu.edu.cn> <20240306140306.876188-4-amadeus@jmu.edu.cn>
In-Reply-To: <20240306140306.876188-4-amadeus@jmu.edu.cn>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 6 Mar 2024 16:38:41 +0200
Message-ID: <CAA8EJprc_xjejMANBjDkA2_FnRcYSJYsmM4VOvsKu1FkuMvGeg@mail.gmail.com>
Subject: Re: [PATCH v2 3/4] arm64: dts: qcom: ipq6018: move mp5496 regulator
 outside soc dtsi
To: Chukun Pan <amadeus@jmu.edu.cn>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Rob Herring <robh@kernel.org>, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 6 Mar 2024 at 16:04, Chukun Pan <amadeus@jmu.edu.cn> wrote:
>
> Some IPQ60xx SoCs don't have the mp5496 pmic chips. The mp5496
> pmic is not part of the ipq60xx SoC, and the mp5496 node is
> the same for devices with pmic, so create a common dtsi.

Please inline this dtsi file into the board file. While it might seem
to make life easier, having such includes makes following regulator
settings much harder. Especially once a board or two start overriding
or expanding those settings.

>
> Signed-off-by: Chukun Pan <amadeus@jmu.edu.cn>
> ---
>  arch/arm64/boot/dts/qcom/ipq6018-cp01-c1.dts |  1 +
>  arch/arm64/boot/dts/qcom/ipq6018-mp5496.dtsi | 29 ++++++++++++++++++++
>  arch/arm64/boot/dts/qcom/ipq6018.dtsi        | 14 ----------
>  3 files changed, 30 insertions(+), 14 deletions(-)
>  create mode 100644 arch/arm64/boot/dts/qcom/ipq6018-mp5496.dtsi
>
> diff --git a/arch/arm64/boot/dts/qcom/ipq6018-cp01-c1.dts b/arch/arm64/boot/dts/qcom/ipq6018-cp01-c1.dts
> index f5f4827c0e17..8331890e529e 100644
> --- a/arch/arm64/boot/dts/qcom/ipq6018-cp01-c1.dts
> +++ b/arch/arm64/boot/dts/qcom/ipq6018-cp01-c1.dts
> @@ -8,6 +8,7 @@
>  /dts-v1/;
>
>  #include "ipq6018.dtsi"
> +#include "ipq6018-mp5496.dtsi"
>
>  / {
>         model = "Qualcomm Technologies, Inc. IPQ6018/AP-CP01-C1";
> diff --git a/arch/arm64/boot/dts/qcom/ipq6018-mp5496.dtsi b/arch/arm64/boot/dts/qcom/ipq6018-mp5496.dtsi
> new file mode 100644
> index 000000000000..841fd757bee7
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/ipq6018-mp5496.dtsi
> @@ -0,0 +1,29 @@
> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> +
> +&rpm_requests {
> +       regulators {
> +               compatible = "qcom,rpm-mp5496-regulators";
> +
> +               ipq6018_s2: s2 {
> +                       regulator-min-microvolt = <725000>;
> +                       regulator-max-microvolt = <1062500>;
> +                       regulator-always-on;
> +               };
> +       };
> +};
> +
> +&CPU0 {
> +       cpu-supply = <&ipq6018_s2>;
> +};
> +
> +&CPU1 {
> +       cpu-supply = <&ipq6018_s2>;
> +};
> +
> +&CPU2 {
> +       cpu-supply = <&ipq6018_s2>;
> +};
> +
> +&CPU3 {
> +       cpu-supply = <&ipq6018_s2>;
> +};
> diff --git a/arch/arm64/boot/dts/qcom/ipq6018.dtsi b/arch/arm64/boot/dts/qcom/ipq6018.dtsi
> index 064b5706a289..823b87fdcefd 100644
> --- a/arch/arm64/boot/dts/qcom/ipq6018.dtsi
> +++ b/arch/arm64/boot/dts/qcom/ipq6018.dtsi
> @@ -43,7 +43,6 @@ CPU0: cpu@0 {
>                         clocks = <&apcs_glb APCS_ALIAS0_CORE_CLK>;
>                         clock-names = "cpu";
>                         operating-points-v2 = <&cpu_opp_table>;
> -                       cpu-supply = <&ipq6018_s2>;
>                         #cooling-cells = <2>;
>                 };
>
> @@ -56,7 +55,6 @@ CPU1: cpu@1 {
>                         clocks = <&apcs_glb APCS_ALIAS0_CORE_CLK>;
>                         clock-names = "cpu";
>                         operating-points-v2 = <&cpu_opp_table>;
> -                       cpu-supply = <&ipq6018_s2>;
>                         #cooling-cells = <2>;
>                 };
>
> @@ -69,7 +67,6 @@ CPU2: cpu@2 {
>                         clocks = <&apcs_glb APCS_ALIAS0_CORE_CLK>;
>                         clock-names = "cpu";
>                         operating-points-v2 = <&cpu_opp_table>;
> -                       cpu-supply = <&ipq6018_s2>;
>                         #cooling-cells = <2>;
>                 };
>
> @@ -82,7 +79,6 @@ CPU3: cpu@3 {
>                         clocks = <&apcs_glb APCS_ALIAS0_CORE_CLK>;
>                         clock-names = "cpu";
>                         operating-points-v2 = <&cpu_opp_table>;
> -                       cpu-supply = <&ipq6018_s2>;
>                         #cooling-cells = <2>;
>                 };
>
> @@ -184,16 +180,6 @@ glink-edge {
>                         rpm_requests: rpm-requests {
>                                 compatible = "qcom,rpm-ipq6018";
>                                 qcom,glink-channels = "rpm_requests";
> -
> -                               regulators {
> -                                       compatible = "qcom,rpm-mp5496-regulators";
> -
> -                                       ipq6018_s2: s2 {
> -                                               regulator-min-microvolt = <725000>;
> -                                               regulator-max-microvolt = <1062500>;
> -                                               regulator-always-on;
> -                                       };
> -                               };
>                         };
>                 };
>         };
> --
> 2.25.1
>
>


-- 
With best wishes
Dmitry

