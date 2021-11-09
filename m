Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D85DF44A59D
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Nov 2021 05:07:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242574AbhKIEJl (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 8 Nov 2021 23:09:41 -0500
Received: from mail-oi1-f174.google.com ([209.85.167.174]:38756 "EHLO
        mail-oi1-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242516AbhKIEJZ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 8 Nov 2021 23:09:25 -0500
Received: by mail-oi1-f174.google.com with SMTP id r26so10167398oiw.5;
        Mon, 08 Nov 2021 20:06:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
         :message-id;
        bh=yWjEoiTmBnd7kKiE2670l9/aYrullxFB3tI7lE4jPLI=;
        b=I1bEwN3gGz2Nr22VqfPt53yRF6LmRPUiil7GPWzNr0kb5mvcMpf2Jirz2g2YFx4Lq+
         0MasgCvbpwffiXkoqh68iWOs4hX52BjJpa3/ZJoGHty7OAmlTa4JaieUEsB/S2/MzQA0
         saUdHqg1tpVivny0AAVnK9TH3eT0m5uHhMUNxcJo3tc3W65euBqM5iqhnAwNJsJn+/JE
         R/3+5W0xD9/ci4f2dckNlerbxB+Mi6WQXecN6K7tqbkNMi5SFHSpCi0j70/M4CCUn89t
         DXXkTla5yr7oAbjjS12WJGR71G26kxyNALmWFuAY6NgL/UT3g+JAouzNDGgAf0gI0mgz
         a9GQ==
X-Gm-Message-State: AOAM533w8NZnOty+4aYHFNtQQSgaqACe2x9vOA+92urwTr2clwh+E8Yr
        G++58d9m1PS82+927eEJgRH6CxuBpQ==
X-Google-Smtp-Source: ABdhPJzE9iIxM9m48OrJ/Egben0+1clK6xGops/L6ZzAdXtZMvt+oX5UJ1xi7S0LdLsDtDAr4S/IYg==
X-Received: by 2002:a05:6808:2017:: with SMTP id q23mr3108540oiw.122.1636430799739;
        Mon, 08 Nov 2021 20:06:39 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id k24sm6117571oou.18.2021.11.08.20.06.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Nov 2021 20:06:39 -0800 (PST)
Received: (nullmailer pid 743047 invoked by uid 1000);
        Tue, 09 Nov 2021 04:06:29 -0000
From:   Rob Herring <robh@kernel.org>
To:     Jarrett Schultz <jaschultzms@gmail.com>
Cc:     Maximilian Luz <luzmaximilian@gmail.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-kernel@vger.kernel.org, Felipe Balbi <balbi@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Gross <mgross@linux.intel.com>,
        Jarrett Schultz <jaschultz@microsoft.com>,
        Hans de Goede <hdegoede@redhat.com>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Jarrett Schultz <jaschultzMS@gmail.com>,
        platform-driver-x86@vger.kernel.org
In-Reply-To: <20211108164449.3036210-2-jaschultz@microsoft.com>
References: <20211108164449.3036210-1-jaschultz@microsoft.com> <20211108164449.3036210-2-jaschultz@microsoft.com>
Subject: Re: [PATCH v2 1/5] dt-bindings: platform: microsoft: Document surface xbl
Date:   Mon, 08 Nov 2021 22:06:29 -0600
Message-Id: <1636430789.960811.743046.nullmailer@robh.at.kernel.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, 08 Nov 2021 08:44:45 -0800, Jarrett Schultz wrote:
> Introduce yaml for surface xbl driver.
> 
> Signed-off-by: Jarrett Schultz <jaschultz@microsoft.com>
> 
> ---
> 
> Changes in v2:
>  - Removed json-schema dependence
>  - Elaborated on description of driver
>  - Updated example
> 
> ---
> 
>  .../platform/microsoft/surface-xbl.yaml       | 57 +++++++++++++++++++
>  MAINTAINERS                                   |  7 +++
>  2 files changed, 64 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/platform/microsoft/surface-xbl.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/platform/microsoft/surface-xbl.yaml: 'additionalProperties' is a required property
	hint: A schema without a "$ref" to another schema must define all properties and use "additionalProperties"
	from schema $id: http://devicetree.org/meta-schemas/base.yaml#
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/platform/microsoft/surface-xbl.yaml: ignoring, error in schema: 
warning: no schema found in file: ./Documentation/devicetree/bindings/platform/microsoft/surface-xbl.yaml
Documentation/devicetree/bindings/platform/microsoft/surface-xbl.example.dts:44.11-48: Warning (ranges_format): /example-1/imem@146bf000:ranges: "ranges" property has invalid length (16 bytes) (parent #address-cells == 1, child #address-cells == 1, #size-cells == 1)
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/platform/microsoft/surface-xbl.example.dt.yaml: example-0: xbl@146bfa94:reg:0: [0, 342620820, 0, 256] is too long
	From schema: /usr/local/lib/python3.8/dist-packages/dtschema/schemas/reg.yaml
Documentation/devicetree/bindings/platform/microsoft/surface-xbl.example.dt.yaml:0:0: /example-0/xbl@146bfa94: failed to match any schema with compatible: ['microsoft,sm8150-surface-duo-xbl']
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/platform/microsoft/surface-xbl.example.dt.yaml: example-1: imem@146bf000:reg:0: [0, 342618112, 0, 4096] is too long
	From schema: /usr/local/lib/python3.8/dist-packages/dtschema/schemas/reg.yaml
Documentation/devicetree/bindings/platform/microsoft/surface-xbl.example.dt.yaml:0:0: /example-1/imem@146bf000/xbl@a94: failed to match any schema with compatible: ['microsoft,sm8150-surface-duo-xbl']

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/patch/1552442

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.

