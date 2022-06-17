Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3D02754FBFF
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Jun 2022 19:14:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231518AbiFQROV (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 17 Jun 2022 13:14:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52940 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229687AbiFQROU (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 17 Jun 2022 13:14:20 -0400
Received: from mo4-p01-ob.smtp.rzone.de (mo4-p01-ob.smtp.rzone.de [81.169.146.165])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4543C15A3F;
        Fri, 17 Jun 2022 10:14:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1655486056;
    s=strato-dkim-0002; d=gerhold.net;
    h=In-Reply-To:References:Message-ID:Subject:Cc:To:From:Date:Cc:Date:
    From:Subject:Sender;
    bh=W2z+oIQknW7onhzoqKNstfGLD4z+lXrDmFliVixL0m0=;
    b=ivqIgo9Kc5ghX3TUXXOz/PHqkpfxKoqatyueuEhQ6x0UEvRYKDbn4ieBsQcywZpYQk
    AzZvEUliMonjVG0BB4xgzQkodyqTmPQUSuEc/fIrohPszxvPxzJqJaX9FIVuDdb5Tb+H
    d+28rVZzgHeH+fhLvvYX6aGMCFUuD9zMZNgF3yYabbTCQxnsSRojtMWXmrAd+HR3Kb0b
    H8mIPcX1atA9XQeDNeyne5Z7alfjGy6rASAMqAboKzL/FT0TL59DcyL0jx1RSDYgNoC4
    u+uVRo5LcThzC46DuQqUNISCMa3+wmuoN8uNYTcnPpL6MhQX4PBisHj0hWIaj+u/uSKr
    SQ5Q==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":P3gBZUipdd93FF5ZZvYFPugejmSTVR2nRPhVOQ/OcYgojyw4j34+u267FZF9PwpcNKLUrK8+86Y="
X-RZG-CLASS-ID: mo00
Received: from gerhold.net
    by smtp.strato.de (RZmta 47.46.0 AUTH)
    with ESMTPSA id g32597y5HHEF8mG
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
        (Client did not present a certificate);
    Fri, 17 Jun 2022 19:14:15 +0200 (CEST)
Date:   Fri, 17 Jun 2022 19:14:08 +0200
From:   Stephan Gerhold <stephan@gerhold.net>
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Taniya Das <quic_tdas@quicinc.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH 7/7] arm64: dts: qcom: msm8916: add clocks to the GCC
 device node
Message-ID: <Yqy2YHpl93kEQRYU@gerhold.net>
References: <20220617144714.817765-1-dmitry.baryshkov@linaro.org>
 <20220617144714.817765-8-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220617144714.817765-8-dmitry.baryshkov@linaro.org>
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Dmitry,

Thanks for cleaning up MSM8916! :)

On Fri, Jun 17, 2022 at 05:47:14PM +0300, Dmitry Baryshkov wrote:
> As we are converting this platform to use DT clock bindings, add clocks
> and clock-names properties to the MMCC device tree node.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/msm8916.dtsi | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/msm8916.dtsi b/arch/arm64/boot/dts/qcom/msm8916.dtsi
> index 05472510e29d..e905415b3456 100644
> --- a/arch/arm64/boot/dts/qcom/msm8916.dtsi
> +++ b/arch/arm64/boot/dts/qcom/msm8916.dtsi
> @@ -934,6 +934,20 @@ gcc: clock-controller@1800000 {
>  			#reset-cells = <1>;
>  			#power-domain-cells = <1>;
>  			reg = <0x01800000 0x80000>;
> +			clocks = <&rpmcc RPM_SMD_BB_CLK1_PIN>,

This should be <&xo_board> to avoid functional changes.

If we want to change this to the actual votable clock later this should
probably be <&rpmcc RPM_SMD_XO_CLK_SRC>. AFAIK that clock exists in RPM
on MSM8916 but was never added to the clk-smd-rpm driver (for MSM8916).

Not sure where the pin-controlled BB_CLK1 is coming from here. :)

Thanks,
Stephan
