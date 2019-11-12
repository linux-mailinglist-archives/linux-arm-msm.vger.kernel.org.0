Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 99DF1F8588
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Nov 2019 01:44:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726923AbfKLAoU (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 11 Nov 2019 19:44:20 -0500
Received: from mail-ot1-f66.google.com ([209.85.210.66]:37822 "EHLO
        mail-ot1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726902AbfKLAoU (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 11 Nov 2019 19:44:20 -0500
Received: by mail-ot1-f66.google.com with SMTP id d5so12881048otp.4;
        Mon, 11 Nov 2019 16:44:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=Vfe9Fg7BmbDCLOpxmVpT7Cu0nR/H6JXWKbwODF2l2L0=;
        b=BYEE/fEHgsIMq9l0w5p1hlAN4RqHln1gWWvwmaHdF+uLtl5xbdvsEWdkG+vWhmOHfu
         J5TYND7sJf3NDGNUGNsOAlqBUTHkUWgeKyvGdHFzoJCPcUPLjF+cX9H8KzUwX6EYDAPA
         BuPBReEYP2yNrWt9qJ2btXKDRk1ebeUn+6gG1bA4FY7JhbQVan33StqdxC9tOvfYUqj3
         +vFn4QkO92Ck7YzVspT3xe/qSfSjVTzhd59/n/8Q7CcV3BaYJkcJ5K3/o/TTafaxwR8j
         vZwpx8Ns8avewJ/IBzClWPDrhPE7L5y4ijqXhnxUJFj7evgz0+uixVfeSvy8KkqH2Rnp
         knzA==
X-Gm-Message-State: APjAAAVSDp2LVjPF5F9geZrxoTXqHKPvrHmxdq9enPVeexQwzVIM5/pt
        4j///2DdLwq37Pz9Be/lsA==
X-Google-Smtp-Source: APXvYqzF36pipFPrfQSDb0XrigmalI4FTBoRhRDY4hsis2SzkDYu16sSKQh1L3XO/f36b7A7IKthgw==
X-Received: by 2002:a9d:365:: with SMTP id 92mr1083256otv.9.1573519458955;
        Mon, 11 Nov 2019 16:44:18 -0800 (PST)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id 100sm5621630otl.48.2019.11.11.16.44.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Nov 2019 16:44:18 -0800 (PST)
Date:   Mon, 11 Nov 2019 18:44:17 -0600
From:   Rob Herring <robh@kernel.org>
To:     Jeffrey Hugo <jhugo@codeaurora.org>
Cc:     mturquette@baylibre.com, sboyd@kernel.org, mark.rutland@arm.com,
        agross@kernel.org, bjorn.andersson@linaro.org,
        marc.w.gonzalez@free.fr, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH v8 1/4] dt-bindings: clock: Document external clocks for
 MSM8998 gcc
Message-ID: <20191112004417.GA16664@bogus>
References: <1573254987-10241-1-git-send-email-jhugo@codeaurora.org>
 <1573255036-10302-1-git-send-email-jhugo@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1573255036-10302-1-git-send-email-jhugo@codeaurora.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, Nov 08, 2019 at 04:17:16PM -0700, Jeffrey Hugo wrote:
> The global clock controller on MSM8998 can consume a number of external
> clocks.  Document them.
> 
> Signed-off-by: Jeffrey Hugo <jhugo@codeaurora.org>
> ---
>  .../devicetree/bindings/clock/qcom,gcc.yaml        | 47 +++++++++++++++-------
>  1 file changed, 33 insertions(+), 14 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/clock/qcom,gcc.yaml b/Documentation/devicetree/bindings/clock/qcom,gcc.yaml
> index e73a56f..2f3512b 100644
> --- a/Documentation/devicetree/bindings/clock/qcom,gcc.yaml
> +++ b/Documentation/devicetree/bindings/clock/qcom,gcc.yaml
> @@ -40,20 +40,38 @@ properties:
>         - qcom,gcc-sm8150
>  
>    clocks:
> -    minItems: 1

1 or 2 clocks are no longer allowed?

> -    maxItems: 3
> -    items:
> -      - description: Board XO source
> -      - description: Board active XO source
> -      - description: Sleep clock source
> +    oneOf:
> +      #qcom,gcc-sm8150
> +      #qcom,gcc-sc7180

Typically, this would be an if/then schema, but I'm okay with leaving it 
like this. Depends whether you want to check the clocks match the 
compatible.

> +      - items:
> +        - description: Board XO source
> +        - description: Board active XO source
> +        - description: Sleep clock source
> +      #qcom,gcc-msm8998
> +      - items:
> +        - description: Board XO source
> +        - description: USB 3.0 phy pipe clock
> +        - description: UFS phy rx symbol clock for pipe 0
> +        - description: UFS phy rx symbol clock for pipe 1
> +        - description: UFS phy tx symbol clock
> +        - description: PCIE phy pipe clock
>  
>    clock-names:
> -    minItems: 1
> -    maxItems: 3
> -    items:
> -      - const: bi_tcxo
> -      - const: bi_tcxo_ao
> -      - const: sleep_clk
> +    oneOf:
> +      #qcom,gcc-sm8150
> +      #qcom,gcc-sc7180
> +      - items:
> +        - const: bi_tcxo
> +        - const: bi_tcxo_ao
> +        - const: sleep_clk
> +      #qcom,gcc-msm8998
> +      - items:
> +        - const: xo
> +        - const: usb3_pipe
> +        - const: ufs_rx_symbol0
> +        - const: ufs_rx_symbol1
> +        - const: ufs_tx_symbol0
> +        - const: pcie0_pipe
>  
>    '#clock-cells':
>      const: 1
> @@ -118,6 +136,7 @@ else:
>        compatible:
>          contains:
>            enum:
> +            - qcom,gcc-msm8998
>              - qcom,gcc-sm8150
>              - qcom,gcc-sc7180
>    then:
> @@ -179,8 +198,8 @@ examples:
>      clock-controller@100000 {
>        compatible = "qcom,gcc-sc7180";
>        reg = <0x100000 0x1f0000>;
> -      clocks = <&rpmhcc 0>, <&rpmhcc 1>;
> -      clock-names = "bi_tcxo", "bi_tcxo_ao";
> +      clocks = <&rpmhcc 0>, <&rpmhcc 1>, <0>;
> +      clock-names = "bi_tcxo", "bi_tcxo_ao", "sleep_clk";

The patch subject says 8998, but this is changing sc7180. 

>        #clock-cells = <1>;
>        #reset-cells = <1>;
>        #power-domain-cells = <1>;
> -- 
> Qualcomm Technologies, Inc. is a member of the
> Code Aurora Forum, a Linux Foundation Collaborative Project.
> 
