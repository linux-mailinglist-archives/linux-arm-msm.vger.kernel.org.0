Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4FFF412E083
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 Jan 2020 22:13:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727305AbgAAVNT (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 1 Jan 2020 16:13:19 -0500
Received: from mail-vs1-f68.google.com ([209.85.217.68]:36855 "EHLO
        mail-vs1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727196AbgAAVNT (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 1 Jan 2020 16:13:19 -0500
Received: by mail-vs1-f68.google.com with SMTP id u14so24402210vsu.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 01 Jan 2020 13:13:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=97LkHj455aBoVei3YqvNr8qA4L7Cfp/wwx2DG5D61uI=;
        b=CUFUmxQACKGvhwByCAStYbtnmv89SNXEgymZ3fEtyZiukyaiueQk7B/DIe4RqsI2pA
         pk0Ptr1wugg1wvpCGga1ePARhRhInGpVx9BhMYDnYCj3Vt1/oW3fNX9HkLGYIvkqoPFj
         WAA8p8UlTigapmxp+FFJrdZ0H9BsVX/4slGiwCZlW1EtqqaFvXhBpP0xc2UE6hxPFXcP
         0ZUHx4EltqfTlU+Lxekp+6pW4M9bL7yaaPYr+Sjm2TfZ+K3X/1QqrVklA53DZQkbzx6x
         +hhCbn6JujW9ieBaSP8oUryYXaNtWsQgIGxbifk+0KgCbakNIjwJNlVLG7WCuC05vFw6
         bYHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=97LkHj455aBoVei3YqvNr8qA4L7Cfp/wwx2DG5D61uI=;
        b=KhJn0527t5Tgdy09mhS/Dah+Nzvk485pMrOF1tjVkcag4/SEmI815SnYmjy/q0Q37Z
         jyYAguPLneoLZGPAz9q5QGgFjpDaxFWiJvK7NAE5AdsASfND/jyIQZS5WUlfRuPn6VRf
         FUK8dcQYpiC08TuOlQk5Wi/CNKgQw5phklI+L9LAJHvGI6wc53XgtymU/rcnHqqHDn77
         5K/zGvfTUBDHEjyDDqvWbmF091JRbn1+HdYiJXm1I60ssheWka7JVykCOju8GO/ALNjB
         YXaWWCy/AX7nOH3IK+Rf2+W/KgR+6rrfANDlzqEKWFZfpjN344gpz+OJIsKvg0ZnaJYp
         6eoQ==
X-Gm-Message-State: APjAAAVUdZ8vL2NukZltslzvuCw64bL3GszW32MAZXqmtAnLct8y+UmK
        Q1YGyiSR4Y2cZujitjytr5j3+eX41MF1JoHKMSpQ6A==
X-Google-Smtp-Source: APXvYqybxu8iBN7W5efJJuoYzfh491Jy45lH3MXU66KTTpkZvQI5f0pUz8+qATDeLmDHXGH0xkv4J3//lASK8i3qnCM=
X-Received: by 2002:a05:6102:d4:: with SMTP id u20mr32348868vsp.27.1577913197555;
 Wed, 01 Jan 2020 13:13:17 -0800 (PST)
MIME-Version: 1.0
References: <20191219120633.20723-1-sibis@codeaurora.org>
In-Reply-To: <20191219120633.20723-1-sibis@codeaurora.org>
From:   Amit Kucheria <amit.kucheria@linaro.org>
Date:   Thu, 2 Jan 2020 02:43:06 +0530
Message-ID: <CAHLCerN1N5XeF_RrwLQ_YveTk8NwjE-VFEKGH9cBTUgHABxDxA@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: qcom: sm8150: Add cpufreq HW device node
To:     Sibi Sankar <sibis@codeaurora.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Dec 19, 2019 at 5:36 PM Sibi Sankar <sibis@codeaurora.org> wrote:
>
> Add cpufreq HW device node to scale 4-Silver/3-Gold/1-Gold+ cores
> on SM8150 SoCs.
>
> Signed-off-by: Sibi Sankar <sibis@codeaurora.org>

Reviewed-by: Amit Kucheria <amit.kucheria@linaro.org>

> ---
>  arch/arm64/boot/dts/qcom/sm8150.dtsi | 21 +++++++++++++++++++++
>  1 file changed, 21 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/qcom/sm8150.dtsi b/arch/arm64/boot/dts/qcom/sm8150.dtsi
> index 694be3c001a68..bad77e539cb1d 100644
> --- a/arch/arm64/boot/dts/qcom/sm8150.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8150.dtsi
> @@ -45,6 +45,7 @@
>                         reg = <0x0 0x0>;
>                         enable-method = "psci";
>                         next-level-cache = <&L2_0>;
> +                       qcom,freq-domain = <&cpufreq_hw 0>;
>                         L2_0: l2-cache {
>                                 compatible = "cache";
>                                 next-level-cache = <&L3_0>;
> @@ -60,6 +61,7 @@
>                         reg = <0x0 0x100>;
>                         enable-method = "psci";
>                         next-level-cache = <&L2_100>;
> +                       qcom,freq-domain = <&cpufreq_hw 0>;
>                         L2_100: l2-cache {
>                                 compatible = "cache";
>                                 next-level-cache = <&L3_0>;
> @@ -73,6 +75,7 @@
>                         reg = <0x0 0x200>;
>                         enable-method = "psci";
>                         next-level-cache = <&L2_200>;
> +                       qcom,freq-domain = <&cpufreq_hw 0>;
>                         L2_200: l2-cache {
>                                 compatible = "cache";
>                                 next-level-cache = <&L3_0>;
> @@ -85,6 +88,7 @@
>                         reg = <0x0 0x300>;
>                         enable-method = "psci";
>                         next-level-cache = <&L2_300>;
> +                       qcom,freq-domain = <&cpufreq_hw 0>;
>                         L2_300: l2-cache {
>                                 compatible = "cache";
>                                 next-level-cache = <&L3_0>;
> @@ -97,6 +101,7 @@
>                         reg = <0x0 0x400>;
>                         enable-method = "psci";
>                         next-level-cache = <&L2_400>;
> +                       qcom,freq-domain = <&cpufreq_hw 1>;
>                         L2_400: l2-cache {
>                                 compatible = "cache";
>                                 next-level-cache = <&L3_0>;
> @@ -109,6 +114,7 @@
>                         reg = <0x0 0x500>;
>                         enable-method = "psci";
>                         next-level-cache = <&L2_500>;
> +                       qcom,freq-domain = <&cpufreq_hw 1>;
>                         L2_500: l2-cache {
>                                 compatible = "cache";
>                                 next-level-cache = <&L3_0>;
> @@ -121,6 +127,7 @@
>                         reg = <0x0 0x600>;
>                         enable-method = "psci";
>                         next-level-cache = <&L2_600>;
> +                       qcom,freq-domain = <&cpufreq_hw 1>;
>                         L2_600: l2-cache {
>                                 compatible = "cache";
>                                 next-level-cache = <&L3_0>;
> @@ -133,6 +140,7 @@
>                         reg = <0x0 0x700>;
>                         enable-method = "psci";
>                         next-level-cache = <&L2_700>;
> +                       qcom,freq-domain = <&cpufreq_hw 2>;
>                         L2_700: l2-cache {
>                                 compatible = "cache";
>                                 next-level-cache = <&L3_0>;
> @@ -834,6 +842,19 @@
>                                 };
>                         };
>                 };
> +
> +               cpufreq_hw: cpufreq@18323000 {
> +                       compatible = "qcom,cpufreq-hw";
> +                       reg = <0 0x18323000 0 0x1400>, <0 0x18325800 0 0x1400>,
> +                             <0 0x18327800 0 0x1400>;
> +                       reg-names = "freq-domain0", "freq-domain1",
> +                                   "freq-domain2";
> +
> +                       clocks = <&rpmhcc RPMH_CXO_CLK>, <&gcc GPLL0>;
> +                       clock-names = "xo", "alternate";
> +
> +                       #freq-domain-cells = <1>;
> +               };
>         };
>
>         timer {
> --
> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
> a Linux Foundation Collaborative Project
