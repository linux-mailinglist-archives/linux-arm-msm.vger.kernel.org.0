Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DDE711E8607
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 May 2020 19:57:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728178AbgE2R5j (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 29 May 2020 13:57:39 -0400
Received: from mail-io1-f67.google.com ([209.85.166.67]:40267 "EHLO
        mail-io1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728044AbgE2R5j (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 29 May 2020 13:57:39 -0400
Received: by mail-io1-f67.google.com with SMTP id q8so261680iow.7;
        Fri, 29 May 2020 10:57:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=oxo77FVnjJMwb/NWzd+pP3DPoeFJPCInSHGgQ3nDKkQ=;
        b=P9NN8s2FEYqWIDbArCJo8nrjGd3nXOyGBEo2Zb3mZ9BDkhsiuR36Z2Q8GrefwT3k2V
         SnByUjUMkR04B3dKaFdjzITQsUSQkzf7foOA2fx8UojFjjB6kchUW6eWAPZpuR+1MGjn
         sPirXlOtDckvcgOttURyCvPJgUSWh7GNvNlZofpRgzJMSskM7puXu6P8zTXJDCpAjzJx
         Ttcic+XY01nuf1uye8mnO3wku94kUcpgotfMzHfhwWK73Re3VnqglAlC9eGq80pZ6ZVs
         nD2MX6V/m9ovfa0Mqk0uvyuHYD+rVDP84eIywpFW2xIvIbeg8KWPmkY5XEoH32q2BB6p
         vmEw==
X-Gm-Message-State: AOAM532bqgLwSmLlR3fKj60kHYOdVFbtz6HrCiJIfUj/xDCo3ape7MUi
        2w369FdC9K5qFS5eDduIHZystQMJ0Q==
X-Google-Smtp-Source: ABdhPJwAS9a6V1RYax4Qs1972SoUX60L2+2+nRZH1B7Wmq59b4D8tH3kEPEi6ltkBBEpVGD9VJoaCA==
X-Received: by 2002:a5d:8155:: with SMTP id f21mr7738265ioo.151.1590775057982;
        Fri, 29 May 2020 10:57:37 -0700 (PDT)
Received: from xps15 ([64.188.179.252])
        by smtp.gmail.com with ESMTPSA id f15sm5179060ill.58.2020.05.29.10.57.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 May 2020 10:57:37 -0700 (PDT)
Received: (nullmailer pid 2658044 invoked by uid 1000);
        Fri, 29 May 2020 17:57:36 -0000
Date:   Fri, 29 May 2020 11:57:36 -0600
From:   Rob Herring <robh@kernel.org>
To:     Akash Asthana <akashast@codeaurora.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, mgautam@codeaurora.org,
        rojay@codeaurora.org, skakit@codeaurora.org,
        msavaliy@codeaurora.org
Subject: Re: [PATCH V7 1/3] dt-bindings: geni-se: Convert QUP geni-se
 bindings to YAML
Message-ID: <20200529175736.GA2654622@bogus>
References: <1590560864-27037-1-git-send-email-akashast@codeaurora.org>
 <1590560864-27037-2-git-send-email-akashast@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1590560864-27037-2-git-send-email-akashast@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, May 27, 2020 at 11:57:42AM +0530, Akash Asthana wrote:
> Convert QUP geni-se bindings to DT schema format using json-schema.
> 
> Signed-off-by: Akash Asthana <akashast@codeaurora.org>
> Reviewed-by: Rob Herring <robh@kernel.org>
> Reviewed-by: Stephen Boyd <swboyd@chromium.org>
> ---
> Changes in V2:
>  - As per Stephen's comment corrected defintion of interrupts for UART node.
>    Any valid UART node must contain atleast 1 interrupts.
> 
> Changes in V3:
>  - As per Rob's comment, added number of reg entries for reg property.
>  - As per Rob's comment, corrected unit address to hex.
>  - As per Rob's comment, created a pattern which matches everything common
>    to geni based I2C, SPI and UART controller and then one pattern  for each.
>  - As per Rob's comment, restored original example.
> 
> Changes in V4:
>  - Resolve below compilation error reported from bot.
> 
> /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/soc/qcom/
> qcom,geni-se.yaml: properties:clocks:minItems: False schema does not allow 2
> /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/soc/qcom/
> qcom,geni-se.yaml: properties:clocks:maxItems: False schema does not allow 2
> Documentation/devicetree/bindings/Makefile:12: recipe for target
> 'Documentation/devicetree/bindings/soc/qcom/qcom,geni-se.example.dts' failed
> make[1]: *** [Documentation/devicetree/bindings/soc/qcom/
> qcom,geni-se.example.dts] Error 1
> Makefile:1263: recipe for target 'dt_binding_check' failed
> make: *** [dt_binding_check] Error 2
> 
> Changes in V6:
>  - Added reg entry for soc@0 example node to address below warning.
> 
> Documentation/devicetree/bindings/soc/qcom/qcom,geni-se.example.dts:22.20-60.11
> : Warning (unit_address_vs_reg): /example-0/soc@0: node has a unit name,
> but no reg or ranges property
> 
> Changes in V7:
>  - No change.
> 
>  .../devicetree/bindings/soc/qcom/qcom,geni-se.txt  |  94 ---------
>  .../devicetree/bindings/soc/qcom/qcom,geni-se.yaml | 210 +++++++++++++++++++++
>  2 files changed, 210 insertions(+), 94 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/soc/qcom/qcom,geni-se.txt
>  create mode 100644 Documentation/devicetree/bindings/soc/qcom/qcom,geni-se.yaml

Applied, thanks.

Rob
