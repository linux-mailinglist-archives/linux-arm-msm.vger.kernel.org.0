Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EE49B50CBF1
	for <lists+linux-arm-msm@lfdr.de>; Sat, 23 Apr 2022 17:49:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236157AbiDWPwo (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 23 Apr 2022 11:52:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37266 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236152AbiDWPwh (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 23 Apr 2022 11:52:37 -0400
Received: from mail-oi1-x22e.google.com (mail-oi1-x22e.google.com [IPv6:2607:f8b0:4864:20::22e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 654C61F8D86
        for <linux-arm-msm@vger.kernel.org>; Sat, 23 Apr 2022 08:49:40 -0700 (PDT)
Received: by mail-oi1-x22e.google.com with SMTP id r85so12338054oie.7
        for <linux-arm-msm@vger.kernel.org>; Sat, 23 Apr 2022 08:49:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=v0ylInl64i1hrDqBe9LG4snd53LOWIsND9Zo4cq727k=;
        b=oVqzYjyQU1wu4npBfpRZe+pc8DzrfKOPAh/ztdLQcN1LoLZrTAsC227FUJ6cNEMI/Y
         Z9THlv266Q+z+3IQD3gM0EDhas6CZU5FUX0nXKMXL9PAbDlYM95lx3IHQkPUEQ7bB3u1
         eQLoXJU8PCBd7HMIFftoCoIXzPjUlcvTDS+EuMBbflgaEH+b98SR7Zc+nFl38QrYt5lI
         t2CH0LEBdP7BRRSIetG5gmWLOqZe1fThnDoFQz+ky5jBtEuF4cRKmL//lFBYfligWAei
         CUaU43SWG7A0kWoD/koKwNjoKUZCtOdtPQCHKL6Rd8wDPG1/yfMk0AfKVfClUOtHPoRr
         +t6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=v0ylInl64i1hrDqBe9LG4snd53LOWIsND9Zo4cq727k=;
        b=WYwe1brKbRxHQ7lhwuDjViYkC9vjhcMUcEX2DTaqwBcainQO1NzjbHz0eZPy6E4stz
         9WJlORdejCNKp7FmDXetgWvMkOwm9CSB+OawTO3NBeQ50uAro14OPG7bj0EdhX52Na9x
         nEJxpTA01gYrUEmFYf5WhfnBKwBjwl1EdCWlfggrp77recHAX7U79JQCETVX1LWO5gya
         Hd+GuTzDpHJhAfPuvS+uYFQFGzPI2p447XJZJ9bMs6w+pj2p+7FCd6pFy1upDRKBdLWB
         IsrgeE7T0TQtRAhNtBl32ev/0Lcv+iEsNIjiN7SVuYuitD+VrsHM9k6kyh40IKM10w1/
         eoJA==
X-Gm-Message-State: AOAM533HOufn2t70nRvLaTNTaGXcqLUIJzI5y387X+MxiP005Vj77va3
        JTEhAP2onUkFGTZn12jIIE9MTSkWMh1uAwOm
X-Google-Smtp-Source: ABdhPJx8fCal4anqgjvarWztx1n3sowp/1yUkWS9TO0WIVk/1YCyKPGDiPvo6UGPkRylM+OeJ69yzQ==
X-Received: by 2002:aca:919:0:b0:324:eab4:748d with SMTP id 25-20020aca0919000000b00324eab4748dmr3471818oij.123.1650728979741;
        Sat, 23 Apr 2022 08:49:39 -0700 (PDT)
Received: from ripper ([2600:1700:a0:3dc8:205:1bff:fec0:b9b3])
        by smtp.gmail.com with ESMTPSA id 88-20020a9d0361000000b006056fd81aacsm1980494otv.40.2022.04.23.08.49.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 23 Apr 2022 08:49:39 -0700 (PDT)
Date:   Sat, 23 Apr 2022 08:51:39 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Bhupesh Sharma <bhupesh.sharma@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        bhupesh.linux@gmail.com, agross@kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        robh+dt@kernel.org, vkoul@kernel.org, Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v3 3/4] dt-bindings: phy: qcom,qmp: Describe phy@ subnode
 properly
Message-ID: <YmQgi0i9PDCVqrGz@ripper>
References: <20220418205509.1102109-1-bhupesh.sharma@linaro.org>
 <20220418205509.1102109-4-bhupesh.sharma@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220418205509.1102109-4-bhupesh.sharma@linaro.org>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon 18 Apr 13:55 PDT 2022, Bhupesh Sharma wrote:

> Currently the qcom,qmp-phy dt-binding doesn't describe
> the 'reg' and '#phy-cells' properties for the phy@ subnode.
> 
> Fix the same.
> 
> Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
> Cc: Rob Herring <robh@kernel.org>
> Signed-off-by: Bhupesh Sharma <bhupesh.sharma@linaro.org>
> ---
>  .../devicetree/bindings/phy/qcom,qmp-phy.yaml       | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/phy/qcom,qmp-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,qmp-phy.yaml
> index 411c79dbfa15..c553c8ad0d1a 100644
> --- a/Documentation/devicetree/bindings/phy/qcom,qmp-phy.yaml
> +++ b/Documentation/devicetree/bindings/phy/qcom,qmp-phy.yaml
> @@ -118,6 +118,19 @@ patternProperties:
>        Each device node of QMP phy is required to have as many child nodes as
>        the number of lanes the PHY has.
>      properties:
> +      reg:
> +        minItems: 1
> +        maxItems: 6
> +        items:
> +          description: |
> +            List of offset and length pairs of register sets for PHY blocks.
> +            common block control registers, such as - SW_RESET, START_CTRL.
> +            pcs registers, such as - PCS_STATUS, POWER_DOWN_CONTROL,
> +            pcs misc registers, such as - PCS_MISC_TYPEC_CTRL.

The two cases we have is:

  tx
  rx
  pcs
  pcs_misc

and:

  tx
  rx
  pcs
  tx2
  rx2
  pcs_misc

So I think we should express that explicitly here.

Regards,
Bjorn

> +
> +      "#phy-cells":
> +        const: 0
> +
>        "#clock-cells":
>          enum: [ 0, 1, 2 ]
>  
> -- 
> 2.35.1
> 
