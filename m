Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6C1826BD4FC
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Mar 2023 17:17:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230040AbjCPQRS (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 16 Mar 2023 12:17:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36592 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230078AbjCPQRR (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 16 Mar 2023 12:17:17 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 49CDDB1A78
        for <linux-arm-msm@vger.kernel.org>; Thu, 16 Mar 2023 09:15:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1678983331;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=mlukPFgMuUiNDYUja4zCoHJNdHul/iInVFC/mNyQV8Q=;
        b=WeIDxR7eS8wn2u9RAe3uYDIPjTN3fa4/3TeEbrgNYTSA4OJ8lRDo/CcY0j4qAa3S/r8Fqy
        gBe/su+wJTNYG82KbEpOSbu1QSG6q6LdQAXuO10fQiRi8H76X/6IMfuPWcTWQZ0gwTSPb/
        c2KGZl4aWeseV6gwMI8XUeq9odNrW3E=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-486-fRcfMmfVMCGvGKg5_ZHGXQ-1; Thu, 16 Mar 2023 12:15:30 -0400
X-MC-Unique: fRcfMmfVMCGvGKg5_ZHGXQ-1
Received: by mail-qk1-f199.google.com with SMTP id s21-20020a05620a0bd500b0074234f33f24so1193147qki.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 16 Mar 2023 09:15:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678983329;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mlukPFgMuUiNDYUja4zCoHJNdHul/iInVFC/mNyQV8Q=;
        b=lsppGZ3yIX7okx1DucroPGs3m2J8DJPDNPGaqu8+BfwS4qwe4zPdLTjQeORB0c1OLK
         U2FORAfhjpW+3W3CQQIyBNOIYDmLXob8ukhvh794uzfUPdLboug96QpCWv2djWQjVtkb
         80ZAVdbSjKMOmHjoVNF/245sVlulzgFus2kiVzFSFLaLaA+N6D5+fCUzF8jhGr5wUsCq
         5qQWXhml2nHgxaCGCSybhJGjwVJCD6u7nESJGp2n0QfstEudYlWkZ350kQmdf4lopZQu
         xqNBS6QEA8Bsu9YCjUz/CtGPVodBPmli0/de/SKaYv8jszUTTvbAqLyuQ4FCTC04Okaf
         mavg==
X-Gm-Message-State: AO0yUKWkoBa708axBPsrImRB/pV92+pv4SVu8AtBY9W1TwoT7APMTMkC
        kQhBOD+pzRA9hb7moSd5jvZi9GaJy1F7uUKSIfPul1X1p8tORPg4kJS/pX8zsS0D0zvNPilPyAr
        CRDW5T0PL5qUgJicgftIb79l7Uw==
X-Received: by 2002:a05:6214:2428:b0:574:8ef8:89d2 with SMTP id gy8-20020a056214242800b005748ef889d2mr39824744qvb.38.1678983329400;
        Thu, 16 Mar 2023 09:15:29 -0700 (PDT)
X-Google-Smtp-Source: AK7set+of7na8F1dFKLndAwQGwakPmWiDEiDVwrlTO9yupX5AyjFyMqZe903mbwQxlEn+ZQoYaB20w==
X-Received: by 2002:a05:6214:2428:b0:574:8ef8:89d2 with SMTP id gy8-20020a056214242800b005748ef889d2mr39824676qvb.38.1678983329027;
        Thu, 16 Mar 2023 09:15:29 -0700 (PDT)
Received: from halaney-x13s (104-53-165-62.lightspeed.stlsmo.sbcglobal.net. [104.53.165.62])
        by smtp.gmail.com with ESMTPSA id q16-20020a05620a025000b00745df9edd7csm4841721qkn.91.2023.03.16.09.15.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Mar 2023 09:15:28 -0700 (PDT)
Date:   Thu, 16 Mar 2023 11:15:25 -0500
From:   Andrew Halaney <ahalaney@redhat.com>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     linux-kernel@vger.kernel.org, agross@kernel.org,
        andersson@kernel.org, konrad.dybcio@linaro.org,
        davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
        pabeni@redhat.com, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, vkoul@kernel.org,
        bhupesh.sharma@linaro.org, mturquette@baylibre.com,
        sboyd@kernel.org, peppe.cavallaro@st.com,
        alexandre.torgue@foss.st.com, joabreu@synopsys.com,
        mcoquelin.stm32@gmail.com, richardcochran@gmail.com,
        linux@armlinux.org.uk, veekhee@apple.com,
        tee.min.tan@linux.intel.com, mohammad.athari.ismail@intel.com,
        jonathanh@nvidia.com, ruppala@nvidia.com, bmasney@redhat.com,
        andrey.konovalov@linaro.org, linux-arm-msm@vger.kernel.org,
        netdev@vger.kernel.org, devicetree@vger.kernel.org,
        linux-clk@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org, ncai@quicinc.com,
        jsuraj@qti.qualcomm.com, hisunil@quicinc.com
Subject: Re: [PATCH net-next 01/11] dt-bindings: net: snps,dwmac: Update
 interrupt-names
Message-ID: <20230316161525.fwzfyj3fhekfwafd@halaney-x13s>
References: <20230313165620.128463-1-ahalaney@redhat.com>
 <20230313165620.128463-2-ahalaney@redhat.com>
 <d4831176-c6f1-5a9b-3086-23d82f1f05a6@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d4831176-c6f1-5a9b-3086-23d82f1f05a6@linaro.org>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Mar 16, 2023 at 08:13:24AM +0100, Krzysztof Kozlowski wrote:
> On 13/03/2023 17:56, Andrew Halaney wrote:
> > From: Bhupesh Sharma <bhupesh.sharma@linaro.org>
> >
> > As commit fc191af1bb0d ("net: stmmac: platform: Fix misleading
> > interrupt error msg") noted, not every stmmac based platform
> > makes use of the 'eth_wake_irq' or 'eth_lpi' interrupts.
> >
> > So, update the 'interrupt-names' inside 'snps,dwmac' YAML
> > bindings to reflect the same.
> >
> > Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> > Signed-off-by: Bhupesh Sharma <bhupesh.sharma@linaro.org>
> > Signed-off-by: Andrew Halaney <ahalaney@redhat.com>
> > ---
> >
> > I picked this up from:
> >		https://lore.kernel.org/netdev/20220929060405.2445745-2-bhupesh.sharma@linaro.org/
> > No changes other than collecting the Acked-by.
> >
> >  Documentation/devicetree/bindings/net/snps,dwmac.yaml | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/Documentation/devicetree/bindings/net/snps,dwmac.yaml b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
> > index 16b7d2904696..52ce14a4bea7 100644
> > --- a/Documentation/devicetree/bindings/net/snps,dwmac.yaml
> > +++ b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
> > @@ -105,8 +105,8 @@ properties:
> >      minItems: 1
> >      items:
> >        - const: macirq
> > -      - const: eth_wake_irq
> > -      - const: eth_lpi
> > +      - enum: [eth_wake_irq, eth_lpi]
> > +      - enum: [eth_wake_irq, eth_lpi]
>
> I acked it before but this is not correct. This should be:
> +      - enum: [eth_wake_irq, eth_lpi]
> +      - enum: eth_lpi

Would
+      - enum: [eth_wake_irq, eth_lpi]
+      - const: eth_lpi
be more appropriate? With the suggested change above I get the following
error, but with the above things seem to work as I expect:

    (dtschema) ahalaney@halaney-x13s ~/git/redhat/stmmac (git)-[stmmac|rebase-i] % git diff HEAD~
    diff --git a/Documentation/devicetree/bindings/net/snps,dwmac.yaml b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
    index 16b7d2904696..ca199a17f83d 100644
    --- a/Documentation/devicetree/bindings/net/snps,dwmac.yaml
    +++ b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
    @@ -105,8 +105,8 @@ properties:
         minItems: 1
         items:
           - const: macirq
    -      - const: eth_wake_irq
    -      - const: eth_lpi
    +      - enum: [eth_wake_irq, eth_lpi]
    +      - enum: eth_lpi

       clocks:
         minItems: 1
    (dtschema) ahalaney@halaney-x13s ~/git/redhat/stmmac (git)-[stmmac|rebase-i] % make dt_binding_check DT_SCHEMA_FILES=Documentation/devicetree/bindings/net/snps,dwmac.yaml
      DTEX    Documentation/devicetree/bindings/net/snps,dwmac.example.dts
      LINT    Documentation/devicetree/bindings
      CHKDT   Documentation/devicetree/bindings/processed-schema.json
    /home/ahalaney/git/redhat/stmmac/Documentation/devicetree/bindings/net/snps,dwmac.yaml: properties:interrupt-names:items: 'anyOf' conditional failed, one must be fixed:
        [{'const': 'macirq'}, {'enum': ['eth_wake_irq', 'eth_lpi']}, {'enum': 'eth_lpi'}] is not of type 'object', 'boolean'
        'eth_lpi' is not of type 'array'
        from schema $id: http://json-schema.org/draft-07/schema#
    /home/ahalaney/git/redhat/stmmac/Documentation/devicetree/bindings/net/snps,dwmac.yaml: properties:interrupt-names:items: 'oneOf' conditional failed, one must be fixed:
        [{'const': 'macirq'}, {'enum': ['eth_wake_irq', 'eth_lpi']}, {'enum': 'eth_lpi'}] is not of type 'object'
        'eth_lpi' is not of type 'array'
        from schema $id: http://devicetree.org/meta-schemas/keywords.yaml#
    /home/ahalaney/git/redhat/stmmac/Documentation/devicetree/bindings/net/snps,dwmac.yaml: properties:interrupt-names:items: 'oneOf' conditional failed, one must be fixed:
        [{'const': 'macirq'}, {'enum': ['eth_wake_irq', 'eth_lpi']}, {'enum': 'eth_lpi'}] is not of type 'object'
        'eth_lpi' is not of type 'array'
        from schema $id: http://devicetree.org/meta-schemas/string-array.yaml#
      SCHEMA  Documentation/devicetree/bindings/processed-schema.json
    /home/ahalaney/git/redhat/stmmac/Documentation/devicetree/bindings/net/snps,dwmac.yaml: ignoring, error in schema: properties: interrupt-names: items
      DTC_CHK Documentation/devicetree/bindings/net/snps,dwmac.example.dtb

Thanks,
Andrew

