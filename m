Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6D03B41ACDD
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Sep 2021 12:22:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240185AbhI1KXw (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 28 Sep 2021 06:23:52 -0400
Received: from mo4-p01-ob.smtp.rzone.de ([85.215.255.53]:35350 "EHLO
        mo4-p01-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240161AbhI1KXv (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 28 Sep 2021 06:23:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1632824530;
    s=strato-dkim-0002; d=gerhold.net;
    h=In-Reply-To:References:Message-ID:Subject:Cc:To:From:Date:Cc:Date:
    From:Subject:Sender;
    bh=zlZ7tFTRJhpCCgiAaXyQJqTvywOUygVuhXAlOlCKPKc=;
    b=SxeLQAe7vkBWh3xilHdNU4/rM3gOEPswGTM6DAnd55Pli8SYFBgXGGmVlY+T/v/s/W
    UIwdlyBWjyGFk17puCrmW4akytuQjgo8hLVwVY73zJ3hJbPrLLby5zElzlEgUFn4P0zE
    uA5qTsBk4zfHYU5M7ny4K3aqQHfaqbCKtRkBbPzNsUL5c6UX1yBcGP1yv+sxX6C6QOJb
    ntlNMcyv8AOQX5WC/lF7Y/eteAZmGNGaKSUXjrRpjMrGXu98m5bgy20HB2FIVs4QKBn+
    oTHhk5pN08/oxzhUGTgFzhdsEUo18L9zFgtk48uxf9puRav0kl6j0a5BKKRMaRqOwR6H
    a3uw==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":P3gBZUipdd93FF5ZZvYFPugejmSTVR2nRPhVOQ/OcYgojyw4j34+u261EJF5OxJD4pSA8ZyK1A=="
X-RZG-CLASS-ID: mo00
Received: from gerhold.net
    by smtp.strato.de (RZmta 47.33.8 DYNA|AUTH)
    with ESMTPSA id 301038x8SAM9jsq
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
        (Client did not present a certificate);
    Tue, 28 Sep 2021 12:22:09 +0200 (CEST)
Date:   Tue, 28 Sep 2021 12:22:05 +0200
From:   Stephan Gerhold <stephan@gerhold.net>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>
Cc:     Andy Gross <agross@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] dt-bindings: soc: smem: Make indirection optional
Message-ID: <YVLszZ7U7D91oIH2@gerhold.net>
References: <20210928044546.4111223-1-bjorn.andersson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210928044546.4111223-1-bjorn.andersson@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Sep 27, 2021 at 09:45:44PM -0700, Bjorn Andersson wrote:
> In the olden days the Qualcomm shared memory (SMEM) region consisted of
> multiple chunks of memory, so SMEM was described as a standalone node
> with references to its various memory regions.
> 
> But practically all modern Qualcomm platforms has a single reserved memory
> region used for SMEM. So rather than having to use two nodes to describe
> the one SMEM region, update the binding to allow the reserved-memory
> region alone to describe SMEM.
> 
> The olden format is preserved as valid, as this is widely used already.
> 
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---
>  .../bindings/soc/qcom/qcom,smem.yaml          | 34 ++++++++++++++++---
>  1 file changed, 30 insertions(+), 4 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/soc/qcom/qcom,smem.yaml b/Documentation/devicetree/bindings/soc/qcom/qcom,smem.yaml
> index f7e17713b3d8..4149cf2b66be 100644
> --- a/Documentation/devicetree/bindings/soc/qcom/qcom,smem.yaml
> +++ b/Documentation/devicetree/bindings/soc/qcom/qcom,smem.yaml
> [...]
> @@ -43,6 +55,20 @@ examples:
>          #size-cells = <1>;
>          ranges;
>  
> +        smem@fa00000 {

I think this is a good opportunity to make a decision which node name
should be used here. :)

You use smem@ here but mentioned before that you think using the generic
memory@ would be better [1]. And you use memory@ in PATCH 3/3:

-		smem_mem: memory@86000000 {
+		memory@86000000 {
+			compatible = "qcom,smem";
 			reg = <0x0 0x86000000 0 0x200000>;
 			no-map;
+			hwlocks = <&tcsr_mutex 3>;
 		};

However, if you would use memory@ as example in this DT schema,
Rob's bot would complain with the same error that I mentioned earlier [2]:

soc/qcom/qcom,smem.example.dt.yaml: memory@fa00000: 'device_type' is a required property
        From schema: dtschema/schemas/memory.yaml

We should either fix the error when using memory@ or start using some
different node name (Stephen Boyd suggested shared-memory@ for example).
Otherwise we'll just keep introducing more and more dtbs_check errors
for the Qualcomm device trees.

Thanks,
Stephan

[1]: https://lore.kernel.org/linux-arm-msm/YUo0suaIugOco1Vu@builder.lan/
[2]: https://lore.kernel.org/linux-arm-msm/YUo2ZzQktf2iSec%2F@gerhold.net/
