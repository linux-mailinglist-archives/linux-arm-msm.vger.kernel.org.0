Return-Path: <linux-arm-msm+bounces-14815-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 70C9F886AB7
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 Mar 2024 11:54:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 99A3D1C20B2C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 Mar 2024 10:54:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ADF483D3B3;
	Fri, 22 Mar 2024 10:54:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="lrCUysCT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B62F422EF5
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 Mar 2024 10:54:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711104893; cv=none; b=ZptndefrmsT+pm410LnX9ZvX0D+1fXDKb27dzsq3eTlFJn2VdukIbfOm1zYvi3/CGHzjJSc5K8hVxZ1IkCNGybgx17SC5InhZnNtXN9ZGgtPSRJOzZn383Lf4W99dh8Kk2W0ouzcvJLoh2QXeRwH4f/zIOQzNbeKsShz3J0h07k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711104893; c=relaxed/simple;
	bh=lqlF6LC2lHEkheQ1iOMwalBqlnrXpZNihZvbCgN/AP8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=arIOAtAsrS/4yoeO0Ydg58OgYzBcTEsgPdJgTcvxRppbrno19ftkxQLEMfbHvXjTtHZCD3VXNg/DiS4paWPLPyshI1y1hY5NsJhjcn1SHTIhUF2LUuqKHOE8A59OO+TQb90oqvWGBTAIZl8O8a+nfSP0xDZ9GqYEtSKK6lgoXBI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=lrCUysCT; arc=none smtp.client-ip=209.85.128.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-609f1f97864so22350067b3.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 22 Mar 2024 03:54:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711104891; x=1711709691; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=3yLTyJy7JcrovLWujJX3AA6N2qSzZlAvcXrRMfhN/Lk=;
        b=lrCUysCTxiIcVxILMqEGFBATl4JZBjmnrzIBw7gjsu2YpkQ17dRvE+4uutEjSSHeFZ
         9+4C/C93lLUqqc4LPij+Vmj80Vz76PeZJJimWMHK69W7jc78Lgz8UVRkiUtWF8Xw5zeN
         WXg/A8/hEakxKIhTwf2z63n0205mPT/aFt985myrah9K1+eKs9qPbl5T5Da5MZIYNPxN
         Cys+313sqGiXPASl2SdsF7mz2ViGA5HmqRCHCxATr17enjX36TxvV+2rYOcSocjOtBWx
         0I4evCeOWeWBXhnVEQb4hXERXmdD+1IH85q1G7BoBXhjmUS1X9YtgBoO5x7+aJCrT08R
         ztxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711104891; x=1711709691;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3yLTyJy7JcrovLWujJX3AA6N2qSzZlAvcXrRMfhN/Lk=;
        b=BdubhcZt2T1d/l3Z1E0i8Qv8Gy3fQVsA/uT5gm1RfdhknX2hrcQn4YjuGFYYqr4xWX
         XEGevye+EbIxKLihVWFpVAndLW+vhWc2bPxz3d02xVydcCHNn3LWLuYBeOspHpwz4cGV
         YkmSHkxP/zMs1eHPm9itbt2e2DmMrT3928pXX8L9ZnED5WLW6qdYNBjwvm9sH598hV85
         qbR0hACC59mCeB4KaTNNuNJGbAIXgZrmJbaMlB3P6U0achL+iA/aAZYdOIKn7O+qryWj
         qICfS3GJdCWfPV6muUG0ytr9Ix696agAhhLnWxYY8rhSEAtErZkJwgwhX6zuwBNM+K5N
         M2FQ==
X-Forwarded-Encrypted: i=1; AJvYcCXLalJDDWjfHkugFCvJzCOHawNz4fjnUgnSGWMl/RnlNTpN7lkS9fHzIqvlTlL9J7AElO+kwXtVCDDZnT2NNACzARcUNK3kPWd5EwVGFQ==
X-Gm-Message-State: AOJu0Yxu8tuFlRWbIrVh8ChqG1IpK83eJ7/O0RROgtVXCvdfhAjmpQuM
	dRAAC1/r6aIGuDCs/BouE9NrbUAxbHRp1NuL8DU53mLUXvjhCrn0nzikyZ7+Zc3SaUciHibEhnX
	k16pg6WYvPEnxSEN6hMzVCVIB7DL24w307KTRCg==
X-Google-Smtp-Source: AGHT+IGz+x7tVfFIboyUBVIztTiYvPl61n17Jr2i8etPqEnpA+dZPRoFyPRs7c3I1/knQbb/932ar1JaVW/dsRUSqng=
X-Received: by 2002:a25:dbd0:0:b0:dc2:1f53:3a4f with SMTP id
 g199-20020a25dbd0000000b00dc21f533a4fmr1686940ybf.5.1711104890696; Fri, 22
 Mar 2024 03:54:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240322-fp4-tcpm-v1-0-c5644099d57b@fairphone.com> <20240322-fp4-tcpm-v1-5-c5644099d57b@fairphone.com>
In-Reply-To: <20240322-fp4-tcpm-v1-5-c5644099d57b@fairphone.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 22 Mar 2024 12:54:39 +0200
Message-ID: <CAA8EJpq3eKFYhBbnggzRy2acE6uSyWGqCMcLxfkqx1Hot50gRw@mail.gmail.com>
Subject: Re: [PATCH 5/5] arm64: dts: qcom: sm7225-fairphone-fp4: Enable USB
 role switching
To: Luca Weiss <luca.weiss@fairphone.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Wesley Cheng <quic_wcheng@quicinc.com>, "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, ~postmarketos/upstreaming@lists.sr.ht, 
	phone-devel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, 22 Mar 2024 at 10:03, Luca Weiss <luca.weiss@fairphone.com> wrote:
>
> Configure the Type-C and VBUS regulator on PM7250B and wire it up to the
> USB PHY, so that USB role and orientation switching works.
>
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---
> With this patch I'm not quite sure if the 'ports' are connected
> correctly, though functionally everything appears to work fine.
>
> On some other SoCs port@1 in qmpphy and a second port in dwc3 are
> connected together also - one port of USB 2.0 HS, one for USB 3.0 SS.
>
> Here I'm following sm8250's solution. Also checking the binding doc
> doesn't reveal anything useful.

Thanks for pointing it out. The SM8250 / RB5 predated final DP
bindings / graphs. As such it didn't fully describe the signal chain
(the signals go from DWC3 and from DP controllers to the QMP PHY,
where they are muxed to the 4 output lanes).
I'll post an update for sm8250 / bindings doc.

I'd kindly ask to connect qmp / port@1 and dwc / port@1

> ---
>  arch/arm64/boot/dts/qcom/sm6350.dtsi              | 25 ++++++++++
>  arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dts | 57 ++++++++++++++++++++++-
>  2 files changed, 81 insertions(+), 1 deletion(-)
>
> diff --git a/arch/arm64/boot/dts/qcom/sm6350.dtsi b/arch/arm64/boot/dts/qcom/sm6350.dtsi
> index 24bcec3366ef..b267500467f0 100644
> --- a/arch/arm64/boot/dts/qcom/sm6350.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm6350.dtsi
> @@ -1686,6 +1686,27 @@ usb_1_qmpphy: phy@88e8000 {
>                         #phy-cells = <1>;
>
>                         status = "disabled";
> +
> +                       ports {
> +                               #address-cells = <1>;
> +                               #size-cells = <0>;
> +
> +                               port@0 {
> +                                       reg = <0>;
> +
> +                                       usb_1_qmpphy_out: endpoint {};
> +                               };
> +
> +                               port@1 {
> +                                       reg = <1>;
> +                               };
> +
> +                               port@2 {
> +                                       reg = <2>;
> +
> +                                       usb_1_qmpphy_dp_in: endpoint {};
> +                               };
> +                       };
>                 };
>
>                 dc_noc: interconnect@9160000 {
> @@ -1861,6 +1882,10 @@ usb_1_dwc3: usb@a600000 {
>                                 snps,hird-threshold = /bits/ 8 <0x10>;
>                                 phys = <&usb_1_hsphy>, <&usb_1_qmpphy QMP_USB43DP_USB3_PHY>;
>                                 phy-names = "usb2-phy", "usb3-phy";
> +
> +                               port {
> +                                       usb_1_role_switch_out: endpoint {};
> +                               };
>                         };
>                 };
>
> diff --git a/arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dts b/arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dts
> index bc67e8c1fe4d..104f23ec322d 100644
> --- a/arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dts
> +++ b/arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dts
> @@ -19,6 +19,7 @@
>  #include <dt-bindings/leds/common.h>
>  #include <dt-bindings/pinctrl/qcom,pmic-gpio.h>
>  #include <dt-bindings/regulator/qcom,rpmh-regulator.h>
> +#include <dt-bindings/usb/pd.h>
>  #include "sm7225.dtsi"
>  #include "pm6150l.dtsi"
>  #include "pm6350.dtsi"
> @@ -543,6 +544,50 @@ conn-therm@1 {
>         };
>  };
>
> +&pm7250b_typec {
> +       vdd-pdphy-supply = <&vreg_l3a>;
> +
> +       status = "okay";
> +
> +       connector {
> +               compatible = "usb-c-connector";
> +
> +               power-role = "source";
> +               data-role = "dual";
> +               self-powered;
> +
> +               source-pdos = <PDO_FIXED(5000, 1500,
> +                                        PDO_FIXED_DUAL_ROLE |
> +                                        PDO_FIXED_USB_COMM |
> +                                        PDO_FIXED_DATA_SWAP)>;
> +
> +               ports {
> +                       #address-cells = <1>;
> +                       #size-cells = <0>;
> +
> +                       port@0 {
> +                               reg = <0>;
> +                               pm7250b_role_switch_in: endpoint {
> +                                       remote-endpoint = <&usb_1_role_switch_out>;
> +                               };
> +                       };
> +
> +                       port@1 {
> +                               reg = <1>;
> +                               pm7250b_typec_mux_in: endpoint {
> +                                       remote-endpoint = <&usb_1_qmpphy_out>;
> +                               };
> +                       };
> +               };
> +       };
> +};
> +
> +&pm7250b_vbus {
> +       regulator-min-microamp = <500000>;
> +       regulator-max-microamp = <1500000>;
> +       status = "okay";
> +};
> +
>  &pmk8350_rtc {
>         status = "okay";
>  };
> @@ -726,7 +771,12 @@ &usb_1 {
>
>  &usb_1_dwc3 {
>         maximum-speed = "super-speed";
> -       dr_mode = "peripheral";
> +       dr_mode = "otg";
> +       usb-role-switch;
> +};
> +
> +&usb_1_role_switch_out {
> +       remote-endpoint = <&pm7250b_role_switch_in>;
>  };
>
>  &usb_1_hsphy {
> @@ -740,10 +790,15 @@ &usb_1_hsphy {
>  &usb_1_qmpphy {
>         vdda-phy-supply = <&vreg_l22a>;
>         vdda-pll-supply = <&vreg_l16a>;
> +       orientation-switch;
>
>         status = "okay";
>  };
>
> +&usb_1_qmpphy_out {
> +       remote-endpoint = <&pm7250b_typec_mux_in>;
> +};
> +
>  &wifi {
>         vdd-0.8-cx-mx-supply = <&vreg_l4a>;
>         vdd-1.8-xo-supply = <&vreg_l7a>;
>
> --
> 2.44.0
>
>


-- 
With best wishes
Dmitry

