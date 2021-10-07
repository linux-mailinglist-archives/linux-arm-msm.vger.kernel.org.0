Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8B651425C99
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 Oct 2021 21:51:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232604AbhJGTwx (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 7 Oct 2021 15:52:53 -0400
Received: from mo4-p01-ob.smtp.rzone.de ([81.169.146.165]:33239 "EHLO
        mo4-p01-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230009AbhJGTwx (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 7 Oct 2021 15:52:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1633636242;
    s=strato-dkim-0002; d=gerhold.net;
    h=In-Reply-To:References:Message-ID:Subject:Cc:To:From:Date:Cc:Date:
    From:Subject:Sender;
    bh=Y8dbSP1krNuwSnUXT8U1+QNeeNt6XCGicB1yuv4x2Jw=;
    b=VK8M9zyyOsOxLdemR0iMEYn+1adCCXxs8pmQu9ome4ZcFZJrN2NNcp6HZkRKvvLh9l
    BLRWp8nGbCkipjRzEh/pxqiQgc2ILY192k0vaLBjbFkKyTvSgjIC8CKfxDjIRuMG+2/6
    rp8/gnTu0Q7pAY1o5P7V3cj7c/Fb4lYApaqZ2+NbBaYGJcZtOfaPHvPGa7pQ5OswQN6w
    lFmR7C6I74FDogqEdktf/8m8jsuyVis8oY75Hs/yRTBz5w+jWIDXWMgX1AWFMOl6aCbd
    Pd1ZgZ9PBpEu31oOU+RE5Rsyob/Mk+rnM/dePB+59LyZM/+FxLK3ynGeHq10YCxzzeUX
    9tYw==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":P3gBZUipdd93FF5ZZvYFPugejmSTVR2nRPhVOQ/OcYgojyw4j34+u261EJF5OxJD4pSA8pmE1A=="
X-RZG-CLASS-ID: mo00
Received: from gerhold.net
    by smtp.strato.de (RZmta 47.33.8 DYNA|AUTH)
    with ESMTPSA id 301038x97JogfYW
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
        (Client did not present a certificate);
    Thu, 7 Oct 2021 21:50:42 +0200 (CEST)
Date:   Thu, 7 Oct 2021 21:50:40 +0200
From:   Stephan Gerhold <stephan@gerhold.net>
To:     Maulik Shah <mkshah@codeaurora.org>
Cc:     swboyd@chromium.org, mka@chromium.org, evgreen@chromium.org,
        bjorn.andersson@linaro.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, agross@kernel.org,
        dianders@chromium.org, linux@roeck-us.net, rnayak@codeaurora.org,
        lsrao@codeaurora.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v11 1/5] dt-bindings: Introduce QCOM Sleep stats bindings
Message-ID: <YV9PN1JNPhVQb8jN@gerhold.net>
References: <1633600649-7164-1-git-send-email-mkshah@codeaurora.org>
 <1633600649-7164-2-git-send-email-mkshah@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1633600649-7164-2-git-send-email-mkshah@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Oct 07, 2021 at 03:27:25PM +0530, Maulik Shah wrote:
> From: Mahesh Sivasubramanian <msivasub@codeaurora.org>
> 
> Add device binding documentation for Qualcomm Technologies, Inc. (QTI)
> Sleep stats driver. The driver is used for displaying Sleep statistic maintained
> by Always On Processor or Resource Power Manager.
> 
> Cc: devicetree@vger.kernel.org
> Signed-off-by: Mahesh Sivasubramanian <msivasub@codeaurora.org>
> Signed-off-by: Lina Iyer <ilina@codeaurora.org>
> Signed-off-by: Maulik Shah <mkshah@codeaurora.org>
> Reviewed-by: Rob Herring <robh@kernel.org>
> Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> Reviewed-by: Stephen Boyd <swboyd@chromium.org>
> ---
>  .../bindings/soc/qcom/qcom-sleep-stats.yaml        | 47 ++++++++++++++++++++++
>  1 file changed, 47 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/soc/qcom/qcom-sleep-stats.yaml
> 
> diff --git a/Documentation/devicetree/bindings/soc/qcom/qcom-sleep-stats.yaml b/Documentation/devicetree/bindings/soc/qcom/qcom-sleep-stats.yaml
> new file mode 100644
> index 0000000..5213daf
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/soc/qcom/qcom-sleep-stats.yaml
> @@ -0,0 +1,47 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/soc/qcom/qcom-sleep-stats.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm Technologies, Inc. (QTI) Sleep stats bindings
> +
> +maintainers:
> +  - Maulik Shah <mkshah@codeaurora.org>
> +
> +description:
> +  Always On Processor/Resource Power Manager maintains statistics of the SoC
> +  sleep modes involving powering down of the rails and oscillator clock.
> +
> +  Statistics includes SoC sleep mode type, number of times low power mode were
> +  entered, time of last entry, time of last exit and accumulated sleep duration.
> +
> +properties:
> +  compatible:
> +    enum:
> +      - qcom,rpmh-sleep-stats
> +      - qcom,rpm-sleep-stats
> +
> +  reg:
> +    maxItems: 1
> +
> +required:
> +  - compatible
> +  - reg
> +
> +additionalProperties: false
> +
> +examples:
> +  # Example of rpmh sleep stats
> +  - |
> +    sram@c3f0000 {
> +      compatible = "qcom,rpmh-sleep-stats";
> +      reg = <0x0c3f0000 0x400>;
> +    };
> +  # Example of rpm sleep stats
> +  - |
> +    sram@4690000 {
> +      compatible = "qcom,rpm-sleep-stats";
> +      reg = <0x04690000 0x400>;
> +    };

Does this region really only contain "rpm-*sleep*-stats"? AFAICT this is
really a more generic memory region where various offsets are read from.

These are all the offsets in msm8998-pm.dtsi downstream [1]:
  ...9000c: rpm-rail-stats offset
  ...90014: rpm-sleep-stats offset (RPM_DYNAMIC_ADDR in your driver)
  ...90018: rpm-log offset
  ...9001c: "RPM FREE HEAP SPACE"

How would you set up any of the other drivers if the entire region
is declared as "rpm-sleep-stats"?

Perhaps this region should have a more generic name that represents what
it actually is and not only one of the information it contains, similar
to "qcom,rpm-msg-ram"?

Thanks,
Stephan

[1]: https://source.codeaurora.org/quic/la/kernel/msm-4.4/tree/arch/arm/boot/dts/qcom/msm8998-pm.dtsi?h=LA.UM.8.4.1.c25#n271
