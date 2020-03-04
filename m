Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6D56317988F
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Mar 2020 20:05:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388024AbgCDTFn (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 4 Mar 2020 14:05:43 -0500
Received: from mail-oi1-f196.google.com ([209.85.167.196]:41051 "EHLO
        mail-oi1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387969AbgCDTFm (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 4 Mar 2020 14:05:42 -0500
Received: by mail-oi1-f196.google.com with SMTP id i1so3213262oie.8
        for <linux-arm-msm@vger.kernel.org>; Wed, 04 Mar 2020 11:05:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=wUE0H/A87bGXDFTE4AqS0ARy1bdjQHDNJxL+CbScmmY=;
        b=jYRVAQ80CLVLGZ9Llyw0Vua+tia8VuYmFdt7DgN35Z7DFtTToeUSVawobbzypv6zSu
         ypC+Gn4T1wA/7uvSuEECyD8cFNud4yCVc7M7U0RXkGLzeVasqxeZt0dyFQ51dlqPoKG3
         bCgBzK4gHje8sjzbglD5iqqR7hBoQlDHO9aKISc4BYoKDKjdMNT5zkVOt1TwvUBr8sQW
         HErT6Cxr6o7RuhwW2/QTwAqEWSOqy2g4ps2k0bNFzMAx8A+VwssH1QcNvo6nCPGrL8SB
         QTEvAuzHd9G8ggK7H6ckEO9LpjVCXtGZFUdzkhzH1Tlb2n6C08OdKLI59Fa1humjVZ8Q
         CYOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=wUE0H/A87bGXDFTE4AqS0ARy1bdjQHDNJxL+CbScmmY=;
        b=XgcF3cmOJ0owYw8dn9BpSTTzWYUos7PCfq6mOPkvw1HOkJgGn6KDlzYbyJhNPD+odv
         gIkZlYPxS8cwGD/pnR4P8/aK2DGbkmcWc6CZOo1UYC/AVqvglz3SGI/KzSrm4PSkbemn
         s31KXY72fOB/628TWBVv+LM6FXImZi1CMsvJpOPl/W6iG5xZc/oxkE3xmC0+WWE9GIw6
         V3B1ImzeRV4rm0QPzCy9mOKBwXmiO2scq8GMEKNhzEz8tsG3X1AdTdwbLfpZG+jgrUZW
         CV6Eh933BlaBLdxl5I/+ZEe63eeeyNdVofIONUjZVHfUKfm6mLwAwr8Hdmy9wKBzEBRc
         05Bg==
X-Gm-Message-State: ANhLgQ2aWFGgXZzsJ4mTBDuCzq9dX6eZRyd2mO7qVmJ1qe/0S9/Z45ep
        eXDQF/YVS83SASYTi7Kmu2C1MRdHuBhTX9Bz7vghWw==
X-Google-Smtp-Source: ADFU+vtWFAOTDB9Nov2DRFUx0/gqknaQB/SkdEgjJDiKyyQCrtduR9YL+rwZO6SLB4jDXucqbHPKod6bCPNfUZU1+6s=
X-Received: by 2002:a05:6808:2c4:: with SMTP id a4mr2881443oid.176.1583348740502;
 Wed, 04 Mar 2020 11:05:40 -0800 (PST)
MIME-Version: 1.0
References: <1583340776-27865-1-git-send-email-loic.poulain@linaro.org> <1583340776-27865-2-git-send-email-loic.poulain@linaro.org>
In-Reply-To: <1583340776-27865-2-git-send-email-loic.poulain@linaro.org>
From:   Robert Foss <robert.foss@linaro.org>
Date:   Wed, 4 Mar 2020 20:05:24 +0100
Message-ID: <CAG3jFyvjQ_rAe_UkBc5Ha-sSK5ERTCaO+r2FS5n9RiLFRTikig@mail.gmail.com>
Subject: Re: [PATCH v3 2/3] dt-bindings: i2c: Add binding for Qualcomm CCI I2C controller
To:     Loic Poulain <loic.poulain@linaro.org>
Cc:     wsa@the-dreams.de, vkoul@kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-i2c@vger.kernel.org,
        Todor Tomov <todor.tomov@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Signed-off-by: Robert Foss <robert.foss@linaro.org>

On Wed, 4 Mar 2020 at 17:49, Loic Poulain <loic.poulain@linaro.org> wrote:
>
> From: Todor Tomov <todor.tomov@linaro.org>
>
> Add DT binding document for Qualcomm Camera Control Interface (CCI)
> I2C controller.
>
> Signed-off-by: Todor Tomov <todor.tomov@linaro.org>
> Signed-off-by: Vinod Koul <vkoul@kernel.org>
> Reviewed-by: Rob Herring <robh@kernel.org>
> ---
>  v2: Fix subnode properties, remove mandatory clock names
>  v3: Add sdm845 compatible string
>
>  .../devicetree/bindings/i2c/i2c-qcom-cci.txt       | 92 ++++++++++++++++++++++
>  1 file changed, 92 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/i2c/i2c-qcom-cci.txt
>
> diff --git a/Documentation/devicetree/bindings/i2c/i2c-qcom-cci.txt b/Documentation/devicetree/bindings/i2c/i2c-qcom-cci.txt
> new file mode 100644
> index 0000000..c6668b7
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/i2c/i2c-qcom-cci.txt
> @@ -0,0 +1,92 @@
> +Qualcomm Camera Control Interface (CCI) I2C controller
> +
> +PROPERTIES:
> +
> +- compatible:
> +       Usage: required
> +       Value type: <string>
> +       Definition: must be one of:
> +               "qcom,msm8916-cci"
> +               "qcom,msm8996-cci"
> +               "qcom,sdm845-cci"
> +
> +- reg
> +       Usage: required
> +       Value type: <prop-encoded-array>
> +       Definition: base address CCI I2C controller and length of memory
> +                   mapped region.
> +
> +- interrupts:
> +       Usage: required
> +       Value type: <prop-encoded-array>
> +       Definition: specifies the CCI I2C interrupt. The format of the
> +                   specifier is defined by the binding document describing
> +                   the node's interrupt parent.
> +
> +- clocks:
> +       Usage: required
> +       Value type: <prop-encoded-array>
> +       Definition: a list of phandle, should contain an entry for each
> +                   entries in clock-names.
> +
> +- clock-names
> +       Usage: required
> +       Value type: <string>
> +       Definition: a list of clock names, must include "cci" clock.
> +
> +- power-domains
> +       Usage: required for "qcom,msm8996-cci"
> +       Value type: <prop-encoded-array>
> +       Definition:
> +
> +SUBNODES:
> +
> +The CCI provides I2C masters for one (msm8916) or two i2c busses (msm8996 and
> +sdm845), described as subdevices named "i2c-bus@0" and "i2c-bus@1".
> +
> +PROPERTIES:
> +
> +- reg:
> +       Usage: required
> +       Value type: <u32>
> +       Definition: Index of the CCI bus/master
> +
> +- clock-frequency:
> +       Usage: optional
> +       Value type: <u32>
> +       Definition: Desired I2C bus clock frequency in Hz, defaults to 100
> +                   kHz if omitted.
> +
> +Example:
> +
> +       cci@a0c000 {
> +               compatible = "qcom,msm8996-cci";
> +               #address-cells = <1>;
> +               #size-cells = <0>;
> +               reg = <0xa0c000 0x1000>;
> +               interrupts = <GIC_SPI 295 IRQ_TYPE_EDGE_RISING>;
> +               clocks = <&mmcc MMSS_MMAGIC_AHB_CLK>,
> +                        <&mmcc CAMSS_TOP_AHB_CLK>,
> +                        <&mmcc CAMSS_CCI_AHB_CLK>,
> +                        <&mmcc CAMSS_CCI_CLK>,
> +                        <&mmcc CAMSS_AHB_CLK>;
> +               clock-names = "mmss_mmagic_ahb",
> +                             "camss_top_ahb",
> +                             "cci_ahb",
> +                             "cci",
> +                             "camss_ahb";
> +
> +               i2c-bus@0 {
> +                       reg = <0>;
> +                       clock-frequency = <400000>;
> +                       #address-cells = <1>;
> +                       #size-cells = <0>;
> +               };
> +
> +               i2c-bus@1 {
> +                       reg = <1>;
> +                       clock-frequency = <400000>;
> +                       #address-cells = <1>;
> +                       #size-cells = <0>;
> +               };
> +       };
> --
> 2.7.4
>
