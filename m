Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 828D244652A
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Nov 2021 15:41:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233207AbhKEOo0 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 5 Nov 2021 10:44:26 -0400
Received: from mail-ot1-f48.google.com ([209.85.210.48]:36526 "EHLO
        mail-ot1-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233176AbhKEOo0 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 5 Nov 2021 10:44:26 -0400
Received: by mail-ot1-f48.google.com with SMTP id r10-20020a056830448a00b0055ac7767f5eso13351079otv.3;
        Fri, 05 Nov 2021 07:41:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
         :message-id;
        bh=QkPN/CR5ZJh39sWRmtoFbT/FglcGFlHjZaWBOtBqClo=;
        b=QHtrSJ35pmAMon1XrDp2IG3ryX2XP494N79GIuu0+934YOnKp8NXCjFW9x2mfA0XqJ
         +d4cSefKjUnKFSiTwc6lxf5OdhisFde5QAY7rpuWYs1HDNmNr+n36Y6FiBE23FYhQBUo
         L10Mjs9A9znAY2inHI+cF5DbAUFzmgNRecQghrreoGRZ4j4aAsAKMtu+23vrNKtFGyTE
         68s4H/Qw6VhbNgMhzwG7bDfFVlEVrQzbPTTc1g3g13NYjBB06tZjkIijsEx92MCirrZe
         7ObsEQjaygLSTmLyZA4XlOgOasg58MFUwzwlP1TdGCpX4uQUigDsF3MdtojZIIZ/y9Y9
         oxhw==
X-Gm-Message-State: AOAM531DzGPjSUd8jd7aRxR+KXg2ntmHBBZja6tCL/+O19SyHNgzXbRT
        f4iDaXWhiif8pco0vSwFwQ==
X-Google-Smtp-Source: ABdhPJyBfaghY/9QQkiJr9DXLe8cnBlDWm7hz0KaGjTRDyJ0LtZ9/XGdOhFFiiXvnZ98kvSH8oR3EQ==
X-Received: by 2002:a9d:24ea:: with SMTP id z97mr21954698ota.64.1636123305984;
        Fri, 05 Nov 2021 07:41:45 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id c8sm100416ooq.43.2021.11.05.07.41.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Nov 2021 07:41:45 -0700 (PDT)
Received: (nullmailer pid 1321314 invoked by uid 1000);
        Fri, 05 Nov 2021 14:41:44 -0000
From:   Rob Herring <robh@kernel.org>
To:     Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc:     devicetree@vger.kernel.org, bjorn.andersson@linaro.org,
        heikki.krogerus@linux.intel.com, linux@roeck-us.net,
        robh+dt@kernel.org, linux-usb@vger.kernel.org,
        wcheng@codeaurora.org, gregkh@linuxfoundation.org,
        linux-arm-msm@vger.kernel.org
In-Reply-To: <20211105033558.1573552-6-bryan.odonoghue@linaro.org>
References: <20211105033558.1573552-1-bryan.odonoghue@linaro.org> <20211105033558.1573552-6-bryan.odonoghue@linaro.org>
Subject: Re: [PATCH v3 5/7] dt-bindings: usb: Add Qualcomm PMIC TCPM YAML schema
Date:   Fri, 05 Nov 2021 09:41:44 -0500
Message-Id: <1636123304.802297.1321313.nullmailer@robh.at.kernel.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, 05 Nov 2021 03:35:56 +0000, Bryan O'Donoghue wrote:
> Add a YAML description for the pm8150b-tcpm driver. The pm8150b-tcpm
> encapsulates a type-c block and a pdphy block into one block presented to
> the tcpm Linux API.
> 
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---
>  .../bindings/usb/qcom,pmic-tcpm.yaml          | 68 +++++++++++++++++++
>  1 file changed, 68 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/usb/qcom,pmic-tcpm.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/usb/qcom,pmic-tcpm.example.dt.yaml: pmic-tcpm: '#address-cells', '#size-cells', 'connector' do not match any of the regexes: 'pinctrl-[0-9]+'
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/usb/qcom,pmic-tcpm.yaml

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/patch/1551213

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.

