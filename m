Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 29E94555248
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Jun 2022 19:24:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1359642AbiFVRYf (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 22 Jun 2022 13:24:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33140 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344588AbiFVRYf (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 22 Jun 2022 13:24:35 -0400
Received: from mo4-p01-ob.smtp.rzone.de (mo4-p01-ob.smtp.rzone.de [85.215.255.52])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9FD4324BFD;
        Wed, 22 Jun 2022 10:24:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1655918671;
    s=strato-dkim-0002; d=gerhold.net;
    h=In-Reply-To:References:Message-ID:Subject:Cc:To:From:Date:Cc:Date:
    From:Subject:Sender;
    bh=Rf641NUrcEXqA/dr8a9JQSxqSi528bpAP6rbP83uW/g=;
    b=a/FqR0hyY7YwlwWbpgzoQSLgrm9jtNmLUsnLkcGhaAwiAGRQUBROH8IwkEVj7bgcaz
    564CfLlxXz7QAW99yP4eWfqQMYHUEmfMYra/4AG5NPuYRdR9XxoHGPuSPO6dg2qWo6P9
    MgXRSq+6z7pB1WabDkjvVu2G7XbVY7XB6nbWXoi1ZcbR1wEPCZkOoLNs5jugJcj1FmRM
    2rKfQ22tWrihbZURpaYg9Q7YYCM8GRQqAMtadOhRhOLMBDFJlFCOfw8W7PY4QY28EH9j
    xm5y9DqKlgacoDKMvL8YE+C9LFVfNpUGpwYoe7Imy8kvQ+iVlxW+eQf6e8zMCzlq5Qwu
    7PSQ==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":P3gBZUipdd93FF5ZZvYFPugejmSTVR2nRPhVOQ/OcYgojyw4j34+u267FZF9PwpcNKLVrK88/6Y="
X-RZG-CLASS-ID: mo00
Received: from gerhold.net
    by smtp.strato.de (RZmta 47.46.0 AUTH)
    with ESMTPSA id g32597y5MHOUOle
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
        (Client did not present a certificate);
    Wed, 22 Jun 2022 19:24:30 +0200 (CEST)
Date:   Wed, 22 Jun 2022 19:24:28 +0200
From:   Stephan Gerhold <stephan@gerhold.net>
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: msm8916: add xo clocks to rpmcc and
 a53pll
Message-ID: <YrNQRDJTrTECSHXd@gerhold.net>
References: <20220620010519.1533364-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220620010519.1533364-1-dmitry.baryshkov@linaro.org>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_PASS,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Jun 20, 2022 at 04:05:19AM +0300, Dmitry Baryshkov wrote:
> Both a53pll and rpmcc make use of xo as a clock parent. Add it to the
> respective device nodes.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

FWIW:

Reviewed-by: Stephan Gerhold <stephan@gerhold.net>

Thanks!
Stephan

> ---
>  arch/arm64/boot/dts/qcom/msm8916.dtsi | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/msm8916.dtsi b/arch/arm64/boot/dts/qcom/msm8916.dtsi
> index 562c42ce2c5c..d679aa5989a6 100644
> --- a/arch/arm64/boot/dts/qcom/msm8916.dtsi
> +++ b/arch/arm64/boot/dts/qcom/msm8916.dtsi
> @@ -301,6 +301,8 @@ rpm_requests: rpm-requests {
>  				rpmcc: clock-controller {
>  					compatible = "qcom,rpmcc-msm8916", "qcom,rpmcc";
>  					#clock-cells = <1>;
> +					clocks = <&xo_board>;
> +					clock-names = "xo";
>  				};
>  
>  				rpmpd: power-controller {
> @@ -1872,6 +1874,8 @@ a53pll: clock@b016000 {
>  			compatible = "qcom,msm8916-a53pll";
>  			reg = <0x0b016000 0x40>;
>  			#clock-cells = <0>;
> +			clocks = <&xo_board>;
> +			clock-names = "xo";
>  		};
>  
>  		timer@b020000 {
> -- 
> 2.35.1
> 
