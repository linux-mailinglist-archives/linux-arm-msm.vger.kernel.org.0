Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 01662506C17
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Apr 2022 14:14:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236328AbiDSMQH (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 19 Apr 2022 08:16:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34878 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1352067AbiDSMP4 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 19 Apr 2022 08:15:56 -0400
Received: from mail-oa1-f47.google.com (mail-oa1-f47.google.com [209.85.160.47])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 89C16205C6;
        Tue, 19 Apr 2022 05:12:45 -0700 (PDT)
Received: by mail-oa1-f47.google.com with SMTP id 586e51a60fabf-e2442907a1so17204642fac.8;
        Tue, 19 Apr 2022 05:12:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
         :message-id;
        bh=VXmHngvtUNu5eflY1U61e24oRozhrPUFJTNzovpIsX8=;
        b=rdpYrGIYX5AIUDhj7rGkE/uwyqBxnP1Qu9xqXUB1q48/7LkZ1aIxg0rlp5ZmgZewqL
         xO+uB+sUMps5sl79qVIzdDdY0XxaikHmcm35wTfGYVJiKSu4ucNpQGbKaHm+PPywk15I
         usdwCY4cvGqDil3pZHQ6cq9amsbbouWq38qte39ek3E67XPONl4Q9aKvCsxqffCEa7Ue
         KTpSy24xuBC1VFIGu2CjySK064mVHx/5s9vY0I22t+3++QpuZ2BO9fJmhWSj3DDQyNjr
         /cqD3XyeBcVEt210hcq6xi9IP3clGkdlp0AY8KXTHtkhi+gQD3NZ0JeK626uj/6uJqYT
         9z4g==
X-Gm-Message-State: AOAM533B9dROGFbOBjhca54eFU2Ujybzu1jTMfoTaLGDRfCjNzvSzO/G
        zh5lv03daZ00kVkFW/IPTg==
X-Google-Smtp-Source: ABdhPJzZAxioIvN5lx5R0aO1Ov01x4UQccfPiROqrHGPhS5fTnwkpumUl7WXGGMmhzbzqmSL9jr9PQ==
X-Received: by 2002:a05:6870:d683:b0:de:eaa2:3550 with SMTP id z3-20020a056870d68300b000deeaa23550mr6390390oap.253.1650370364721;
        Tue, 19 Apr 2022 05:12:44 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id e22-20020a056870239600b000e2f0c69849sm5000358oap.11.2022.04.19.05.12.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Apr 2022 05:12:44 -0700 (PDT)
Received: (nullmailer pid 1977862 invoked by uid 1000);
        Tue, 19 Apr 2022 12:12:43 -0000
From:   Rob Herring <robh@kernel.org>
To:     Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc:     devicetree@vger.kernel.org, zac@squareup.com, krzk+dt@kernel.org,
        jun.nie@linaro.org, linux-arm-msm@vger.kernel.org,
        benl@squareup.com, robh+dt@kernel.org, bjorn.andersson@linaro.org,
        shawn.guo@linaro.org, jgates@squareup.com, mchen@squareup.com,
        jwillcox@squareup.com, agross@kernel.org
In-Reply-To: <20220419010903.3109514-2-bryan.odonoghue@linaro.org>
References: <20220419010903.3109514-1-bryan.odonoghue@linaro.org> <20220419010903.3109514-2-bryan.odonoghue@linaro.org>
Subject: Re: [PATCH v1 1/4] dt-bindings: arm: qcom: Document MSM8939 SoC binding
Date:   Tue, 19 Apr 2022 07:12:43 -0500
Message-Id: <1650370363.502202.1977861.nullmailer@robh.at.kernel.org>
X-Spam-Status: No, score=-1.2 required=5.0 tests=BAYES_00,
        FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, 19 Apr 2022 02:09:00 +0100, Bryan O'Donoghue wrote:
> Document the MSM8939 and supported boards in upstream Sony "Tulip" M4 Aqua
> and Square APQ8039 T2.
> 
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---
>  Documentation/devicetree/bindings/arm/qcom.yaml | 7 +++++++
>  1 file changed, 7 insertions(+)
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:
./Documentation/devicetree/bindings/arm/qcom.yaml:37:1: [error] syntax error: found character '\t' that cannot start any token (syntax)

dtschema/dtc warnings/errors:
make[1]: *** Deleting file 'Documentation/devicetree/bindings/arm/qcom.example.dts'
Traceback (most recent call last):
  File "/usr/local/bin/dt-extract-example", line 52, in <module>
    binding = yaml.load(open(args.yamlfile, encoding='utf-8').read())
  File "/usr/local/lib/python3.8/dist-packages/ruamel/yaml/main.py", line 434, in load
    return constructor.get_single_data()
  File "/usr/local/lib/python3.8/dist-packages/ruamel/yaml/constructor.py", line 119, in get_single_data
    node = self.composer.get_single_node()
  File "_ruamel_yaml.pyx", line 706, in _ruamel_yaml.CParser.get_single_node
  File "_ruamel_yaml.pyx", line 724, in _ruamel_yaml.CParser._compose_document
  File "_ruamel_yaml.pyx", line 775, in _ruamel_yaml.CParser._compose_node
  File "_ruamel_yaml.pyx", line 889, in _ruamel_yaml.CParser._compose_mapping_node
  File "_ruamel_yaml.pyx", line 731, in _ruamel_yaml.CParser._compose_node
  File "_ruamel_yaml.pyx", line 904, in _ruamel_yaml.CParser._parse_next_event
ruamel.yaml.scanner.ScannerError: while scanning a block scalar
  in "<unicode string>", line 12, column 14
found a tab character where an indentation space is expected
  in "<unicode string>", line 37, column 1
make[1]: *** [Documentation/devicetree/bindings/Makefile:26: Documentation/devicetree/bindings/arm/qcom.example.dts] Error 1
make[1]: *** Waiting for unfinished jobs....
./Documentation/devicetree/bindings/arm/qcom.yaml:  while scanning a block scalar
  in "<unicode string>", line 12, column 14
found a tab character where an indentation space is expected
  in "<unicode string>", line 37, column 1
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/arm/qcom.yaml: ignoring, error parsing file
make: *** [Makefile:1401: dt_binding_check] Error 2

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/patch/

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.

