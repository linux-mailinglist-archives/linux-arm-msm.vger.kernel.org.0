Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E506444E7D2
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Nov 2021 14:48:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234909AbhKLNva (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 12 Nov 2021 08:51:30 -0500
Received: from mail-ot1-f41.google.com ([209.85.210.41]:46861 "EHLO
        mail-ot1-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231617AbhKLNva (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 12 Nov 2021 08:51:30 -0500
Received: by mail-ot1-f41.google.com with SMTP id b5-20020a9d60c5000000b0055c6349ff22so13871770otk.13;
        Fri, 12 Nov 2021 05:48:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
         :message-id;
        bh=MqM1y+YyYOZCCqAxeMTnppzeftxX5GadFE8PpETstQk=;
        b=VvdKT5RiB1rL45ljyF9U/qY50nKYegM+3Ej6asXzrMsucShMMltJMEtOuYnh/EgJ6o
         XbtYBTaT/AT1kvg1cLe8O9KTYBHxJPiWqTXlMSXRbjofg0z9KJb8oL51yNQxqPQRJD/O
         SqJeZmed3sf5FZOnHigeRXwLIEzOI4pZ1bzd/STop5NMvBIjBHrwSi+ZjxHL+0zVlXJ5
         f5tFW98YTY0zInPyyqGbHBU+IeSOJolBg/Zk8Qcyezyr9hu/xLBD1hterLjUI9xFMNbl
         eX/iYRow4e5xNgOLrZYmAy0FjfhWdP/j41mW0VRbvMg4xTaWZBGMjjs6gvfT4n8ONowf
         aAKg==
X-Gm-Message-State: AOAM533kAVRcs16qZ47ExUsQeLBWWXvdJRcjxrbx1sOmpG65XZ6765bZ
        jmkkBq+kk4pfd6znNGvzxQ==
X-Google-Smtp-Source: ABdhPJxMVssZ8GmZ4oyCj7qLbWiswb6ULyqp0gFSp8x4aT8SgTVHOb+uEQAR4Lz0Y9THSP8wpIy+RQ==
X-Received: by 2002:a05:6830:4cf:: with SMTP id s15mr12600373otd.219.1636724919387;
        Fri, 12 Nov 2021 05:48:39 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id t13sm1499376oiw.30.2021.11.12.05.48.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Nov 2021 05:48:38 -0800 (PST)
Received: (nullmailer pid 2463364 invoked by uid 1000);
        Fri, 12 Nov 2021 13:48:37 -0000
From:   Rob Herring <robh@kernel.org>
To:     Fenglin Wu <quic_fenglinw@quicinc.com>
Cc:     Rob Herring <robh+dt@kernel.org>, sboyd@kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>, maz@kernel.org,
        devicetree@vger.kernel.org, Andy Gross <agross@kernel.org>,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        tglx@linutronix.de, collinsd@codeaurora.org,
        subbaram@codeaurora.org
In-Reply-To: <1636691059-4305-12-git-send-email-quic_fenglinw@quicinc.com>
References: <1636691059-4305-1-git-send-email-quic_fenglinw@quicinc.com> <1636691059-4305-12-git-send-email-quic_fenglinw@quicinc.com>
Subject: Re: [RESEND PATCH v2 11/11] dt-bindings: convert qcom,spmi-pmic-arb binding to YAML format
Date:   Fri, 12 Nov 2021 07:48:37 -0600
Message-Id: <1636724917.088909.2463363.nullmailer@robh.at.kernel.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, 12 Nov 2021 12:24:19 +0800, Fenglin Wu wrote:
> Convert the SPMI PMIC arbiter documentation to JSON/yaml.
> 
> Signed-off-by: Fenglin Wu <quic_fenglinw@quicinc.com>
> ---
>  .../bindings/spmi/qcom,spmi-pmic-arb.txt           |  67 -----------
>  .../bindings/spmi/qcom,spmi-pmic-arb.yaml          | 122 +++++++++++++++++++++
>  2 files changed, 122 insertions(+), 67 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/spmi/qcom,spmi-pmic-arb.txt
>  create mode 100644 Documentation/devicetree/bindings/spmi/qcom,spmi-pmic-arb.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/spmi/qcom,spmi-pmic-arb.yaml: properties:interrupt-names: 'const' should not be valid under {'enum': ['const', 'enum', 'exclusiveMaximum', 'exclusiveMinimum', 'minimum', 'maximum', 'multipleOf', 'pattern']}
	hint: Scalar and array keywords cannot be mixed
	from schema $id: http://devicetree.org/meta-schemas/keywords.yaml#
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/spmi/qcom,spmi-pmic-arb.yaml: properties:reg-names: {'minItems': 3, 'maxItems': 5, 'items': [{'const': 'core'}, {'const': 'intr'}, {'const': 'cnfg'}, {'const': 'chnls'}, {'const': 'obsrvr'}]} should not be valid under {'required': ['maxItems']}
	hint: "maxItems" is not needed with an "items" list
	from schema $id: http://devicetree.org/meta-schemas/items.yaml#
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/spmi/qcom,spmi-pmic-arb.yaml: ignoring, error in schema: properties: interrupt-names
warning: no schema found in file: ./Documentation/devicetree/bindings/spmi/qcom,spmi-pmic-arb.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/spmi/qcom,spmi-pmic-arb.example.dt.yaml: spmi@fc4cf000: reg: [[4232900608, 4096], [4232884224, 4096], [4232880128, 4096]] is too long
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/spmi/spmi.yaml
Documentation/devicetree/bindings/spmi/qcom,spmi-pmic-arb.example.dt.yaml:0:0: /example-0/spmi@fc4cf000: failed to match any schema with compatible: ['qcom,spmi-pmic-arb']

doc reference errors (make refcheckdocs):
Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.txt: Documentation/devicetree/bindings/spmi/qcom,spmi-pmic-arb.txt

See https://patchwork.ozlabs.org/patch/1554141

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.

