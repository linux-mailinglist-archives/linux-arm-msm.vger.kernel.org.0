Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BA71F3554F4
	for <lists+linux-arm-msm@lfdr.de>; Tue,  6 Apr 2021 15:24:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231767AbhDFNYP (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 6 Apr 2021 09:24:15 -0400
Received: from mail-oo1-f54.google.com ([209.85.161.54]:39543 "EHLO
        mail-oo1-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230342AbhDFNYP (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 6 Apr 2021 09:24:15 -0400
Received: by mail-oo1-f54.google.com with SMTP id r17-20020a4acb110000b02901b657f28cdcso3680991ooq.6;
        Tue, 06 Apr 2021 06:24:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
         :message-id;
        bh=c+dr09iEOiWwhlY6jark2BPva3mg8Ko55TUQeP3LOTQ=;
        b=EuzLDUGrbzOhJkobvhvs+p/c3492kZO9W+NUVfGYx0fS87x/d6qKQmjeOYlqS8p3eC
         dwlpKaZ1NOXUwjpkyjcjPLxUjhYMJSMKOm2vX683Av0Jec7ysaNU/1/tvRnal9OplCyi
         M94aWs5iqcQmgFQaHx5WQwQXkga/5RS5H1uiYTspo6AU7I3PFTIUq7Qhq1N8QKLxtnfA
         UZXQOANtz/pQ4HuA1lGw3b6s6ASvisMJQdgLy+DOQffhxzg8tDHgkfw9gjFF/pNST15Z
         XSxDzvyHPDeP4HAGKksh/iW9lT8+apsr8hWxfEBbm/Qvk/MjjGGR5IsZd9iP6m+zj1DX
         eo2Q==
X-Gm-Message-State: AOAM5339gLncxRiAJcT/WE+upmeXsd9GYnxwHlV1qDJANSuZnJvafZA2
        +MkTzO6GHCDXpC8gibSa1Q==
X-Google-Smtp-Source: ABdhPJy1H5MC5AV5/1PLAVHXSI2VxCtDGeuzF+SPgq6I9rDImJ8MDbdc0BVD9MHBLEWkcFD5l/3FRg==
X-Received: by 2002:a05:6820:58:: with SMTP id v24mr26459197oob.55.1617715447042;
        Tue, 06 Apr 2021 06:24:07 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id p3sm3638698oif.53.2021.04.06.06.24.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Apr 2021 06:24:06 -0700 (PDT)
Received: (nullmailer pid 1674493 invoked by uid 1000);
        Tue, 06 Apr 2021 13:24:05 -0000
From:   Rob Herring <robh@kernel.org>
To:     Manaf Meethalavalappu Pallikunhi <manafm@codeaurora.org>
Cc:     Akhil P Oommen <akhilpo@codeaurora.org>,
        Rob Herring <robh+dt@kernel.org>,
        Taniya Das <tdas@codeaurora.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Ram Chandrasekar <rkumbako@codeaurora.org>
In-Reply-To: <1617346747-8611-2-git-send-email-manafm@codeaurora.org>
References: <1617346747-8611-1-git-send-email-manafm@codeaurora.org> <1617346747-8611-2-git-send-email-manafm@codeaurora.org>
Subject: Re: [RFC PATCH 1/2] dt-bindings: soc: qcom: Add SDPM clock monitor driver documentation in yaml
Date:   Tue, 06 Apr 2021 08:24:05 -0500
Message-Id: <1617715445.141060.1674492.nullmailer@robh.at.kernel.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, 02 Apr 2021 12:29:06 +0530, Manaf Meethalavalappu Pallikunhi wrote:
> Add yaml documentation for SDPM clock monitor driver which will
> register for clock rate change notification and writes the clock rate
> into SDPM CSR register.
> 
> Signed-off-by: Ram Chandrasekar <rkumbako@codeaurora.org>
> Signed-off-by: Manaf Meethalavalappu Pallikunhi <manafm@codeaurora.org>
> ---
>  .../devicetree/bindings/soc/qcom/qcom-sdpm.yaml    | 68 ++++++++++++++++++++++
>  1 file changed, 68 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/soc/qcom/qcom-sdpm.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:
./Documentation/devicetree/bindings/soc/qcom/qcom-sdpm.yaml:31:11: [error] empty value in block mapping (empty-values)
./Documentation/devicetree/bindings/soc/qcom/qcom-sdpm.yaml:37:11: [error] empty value in block mapping (empty-values)

dtschema/dtc warnings/errors:
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/soc/qcom/qcom-sdpm.yaml: properties:clock-names:items: 'anyOf' conditional failed, one must be fixed:
	None is not of type 'object', 'boolean'
	None is not of type 'array'
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/soc/qcom/qcom-sdpm.yaml: properties:clocks:items: 'anyOf' conditional failed, one must be fixed:
	None is not of type 'object', 'boolean'
	None is not of type 'array'
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/soc/qcom/qcom-sdpm.yaml: properties:clock-names:items: 'oneOf' conditional failed, one must be fixed:
	None is not of type 'object'
	None is not of type 'array'
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/soc/qcom/qcom-sdpm.yaml: properties:clocks:items: 'oneOf' conditional failed, one must be fixed:
	None is not of type 'object'
	None is not of type 'array'
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/soc/qcom/qcom-sdpm.yaml: 'additionalProperties' is a required property
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/soc/qcom/qcom-sdpm.yaml: properties:clock-names:items: 'oneOf' conditional failed, one must be fixed:
	None is not of type 'object'
	None is not of type 'array'
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/soc/qcom/qcom-sdpm.yaml: properties:clocks: 'oneOf' conditional failed, one must be fixed:
	/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/soc/qcom/qcom-sdpm.yaml: properties:clocks: 'anyOf' conditional failed, one must be fixed:
		'items' is not one of ['maxItems', 'description', 'deprecated']
		'minItems' is not one of ['maxItems', 'description', 'deprecated']
		'items' is not one of ['description', 'deprecated', 'const', 'enum', 'minimum', 'maximum', 'multipleOf', 'default', '$ref']
		'minItems' is not one of ['description', 'deprecated', 'const', 'enum', 'minimum', 'maximum', 'multipleOf', 'default', '$ref']
		'maxItems' is not one of ['description', 'deprecated', 'const', 'enum', 'minimum', 'maximum', 'multipleOf', 'default', '$ref']
		/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/soc/qcom/qcom-sdpm.yaml: properties:clocks:items: 'oneOf' conditional failed, one must be fixed:
			None is not of type 'object'
			None is not of type 'array'
		1 was expected
	'items' is not one of ['type', 'description', 'dependencies', 'properties', 'patternProperties', 'additionalProperties', 'unevaluatedProperties', 'deprecated', 'required', 'allOf', 'anyOf', 'oneOf', '$ref']
	'minItems' is not one of ['type', 'description', 'dependencies', 'properties', 'patternProperties', 'additionalProperties', 'unevaluatedProperties', 'deprecated', 'required', 'allOf', 'anyOf', 'oneOf', '$ref']
	'maxItems' is not one of ['type', 'description', 'dependencies', 'properties', 'patternProperties', 'additionalProperties', 'unevaluatedProperties', 'deprecated', 'required', 'allOf', 'anyOf', 'oneOf', '$ref']
	'type' is a required property
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/soc/qcom/qcom-sdpm.yaml: ignoring, error in schema: properties: clocks: items
warning: no schema found in file: ./Documentation/devicetree/bindings/soc/qcom/qcom-sdpm.yaml
Documentation/devicetree/bindings/soc/qcom/qcom-sdpm.example.dts:19:18: fatal error: dt-bindings/clock/qcom,camcc-sc7280.h: No such file or directory
   19 |         #include <dt-bindings/clock/qcom,camcc-sc7280.h>
      |                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
compilation terminated.
make[1]: *** [scripts/Makefile.lib:377: Documentation/devicetree/bindings/soc/qcom/qcom-sdpm.example.dt.yaml] Error 1
make[1]: *** Waiting for unfinished jobs....
make: *** [Makefile:1414: dt_binding_check] Error 2

See https://patchwork.ozlabs.org/patch/1461582

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.

