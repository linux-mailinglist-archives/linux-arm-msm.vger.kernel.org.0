Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 543DD242D50
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Aug 2020 18:30:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727004AbgHLQan (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 12 Aug 2020 12:30:43 -0400
Received: from mail-il1-f195.google.com ([209.85.166.195]:38491 "EHLO
        mail-il1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726901AbgHLQal (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 12 Aug 2020 12:30:41 -0400
Received: by mail-il1-f195.google.com with SMTP id 77so2350968ilc.5;
        Wed, 12 Aug 2020 09:30:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=qbqEkaQ15mtFpbr/JyMCw9XOODlZ8i0VURftlLjm2sI=;
        b=ry/Uu2yXco4KBqItHp9puYoZOYGLnWsWfwznRcCdpMa+7p6HfMXZF301+EO8fXGRmy
         qRP/2I0T+gfwAQokLL+X0BaE2XQqAuOU5T2iTUUpMDFVadYREI3JkcxBF22zZ/lT5M6a
         Ld6t8iTVFzev+dJXNbEPoyGfjCmYlIWJqVCeGhMl9SyLfZ6mX4OfRJxJbQPM6mgSEJdE
         YS7dDMLVa+vKNwo9O7V6mcdfuKDVzp8fRrG8fVuTzxArP6NRs07BR73ohJoSMSFtWDjd
         kCL0KQuOhBAgkL81lWencucdV1XGPZWxCjLrnkDMG0S5mAr2hQ6qlB6BPIpwKlKCgDVv
         h6nw==
X-Gm-Message-State: AOAM532wpI3wWKzs3zJzkvWZX/4ojnFM4VZ64+wqN2Y/+I6VN7Ybuc/v
        dNtT3Y7eXqR52gJi9hGGGwIVa54=
X-Google-Smtp-Source: ABdhPJx5yFY86n1UYDBGncdOmXu5uB+u/miINL2rA94dhWt7DYre7QceJa73MR38R9bHmfRzK4CkFA==
X-Received: by 2002:a92:9fdb:: with SMTP id z88mr454553ilk.154.1597249839214;
        Wed, 12 Aug 2020 09:30:39 -0700 (PDT)
Received: from xps15 ([64.188.179.248])
        by smtp.gmail.com with ESMTPSA id q1sm1187361iow.8.2020.08.12.09.30.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Aug 2020 09:30:38 -0700 (PDT)
Received: (nullmailer pid 2326239 invoked by uid 1000);
        Wed, 12 Aug 2020 16:30:36 -0000
Date:   Wed, 12 Aug 2020 10:30:36 -0600
From:   Rob Herring <robh@kernel.org>
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     Rob Herring <robh+dt@kernel.org>, linuxarm@huawei.com,
        devicetree@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Lee Jones <lee.jones@linaro.org>, mauro.chehab@huawei.com
Subject: Re: [PATCH 31/33] dt: document HiSilicon SPMI controller and
 mfd/regulator properties
Message-ID: <20200812163036.GA2324764@bogus>
References: <cover.1597160086.git.mchehab+huawei@kernel.org>
 <176043f329dfa9889f014feec04e7e1553077873.1597160086.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <176043f329dfa9889f014feec04e7e1553077873.1597160086.git.mchehab+huawei@kernel.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, 11 Aug 2020 17:41:57 +0200, Mauro Carvalho Chehab wrote:
> Add documentation for the properties needed by the HiSilicon
> 6421v600 driver, and by the SPMI controller used to access
> the chipset.
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> ---
>  .../mfd/hisilicon,hi6421-spmi-pmic.yaml       | 175 ++++++++++++++++++
>  .../spmi/hisilicon,hisi-spmi-controller.yaml  |  54 ++++++
>  2 files changed, 229 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mfd/hisilicon,hi6421-spmi-pmic.yaml
>  create mode 100644 Documentation/devicetree/bindings/spmi/hisilicon,hisi-spmi-controller.yaml
> 


My bot found errors running 'make dt_binding_check' on your patch:

Documentation/devicetree/bindings/mfd/hisilicon,hi6421-spmi-pmic.yaml: $id: relative path/filename doesn't match actual path or filename
	expected: http://devicetree.org/schemas/mfd/hisilicon,hi6421-spmi-pmic.yaml#
Documentation/devicetree/bindings/mfd/hisilicon,hi6421-spmi-pmic.example.dts:34.15-28: Warning (reg_format): /example-0/pmic@0/regulators/ldo3@16:reg: property has invalid length (4 bytes) (#address-cells == 2, #size-cells == 1)
Documentation/devicetree/bindings/mfd/hisilicon,hi6421-spmi-pmic.example.dts:57.15-28: Warning (reg_format): /example-0/pmic@0/regulators/ldo4@17:reg: property has invalid length (4 bytes) (#address-cells == 2, #size-cells == 1)
Documentation/devicetree/bindings/mfd/hisilicon,hi6421-spmi-pmic.example.dt.yaml: Warning (pci_device_reg): Failed prerequisite 'reg_format'
Documentation/devicetree/bindings/mfd/hisilicon,hi6421-spmi-pmic.example.dt.yaml: Warning (pci_device_bus_num): Failed prerequisite 'reg_format'
Documentation/devicetree/bindings/mfd/hisilicon,hi6421-spmi-pmic.example.dt.yaml: Warning (simple_bus_reg): Failed prerequisite 'reg_format'
Documentation/devicetree/bindings/mfd/hisilicon,hi6421-spmi-pmic.example.dt.yaml: Warning (i2c_bus_reg): Failed prerequisite 'reg_format'
Documentation/devicetree/bindings/mfd/hisilicon,hi6421-spmi-pmic.example.dt.yaml: Warning (spi_bus_reg): Failed prerequisite 'reg_format'
Documentation/devicetree/bindings/mfd/hisilicon,hi6421-spmi-pmic.example.dts:33.27-54.15: Warning (avoid_default_addr_size): /example-0/pmic@0/regulators/ldo3@16: Relying on default #address-cells value
Documentation/devicetree/bindings/mfd/hisilicon,hi6421-spmi-pmic.example.dts:33.27-54.15: Warning (avoid_default_addr_size): /example-0/pmic@0/regulators/ldo3@16: Relying on default #size-cells value
Documentation/devicetree/bindings/mfd/hisilicon,hi6421-spmi-pmic.example.dts:56.27-76.15: Warning (avoid_default_addr_size): /example-0/pmic@0/regulators/ldo4@17: Relying on default #address-cells value
Documentation/devicetree/bindings/mfd/hisilicon,hi6421-spmi-pmic.example.dts:56.27-76.15: Warning (avoid_default_addr_size): /example-0/pmic@0/regulators/ldo4@17: Relying on default #size-cells value
Documentation/devicetree/bindings/mfd/hisilicon,hi6421-spmi-pmic.example.dt.yaml: Warning (unique_unit_address): Failed prerequisite 'avoid_default_addr_size'
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/spmi/hisilicon,hisi-spmi-controller.example.dt.yaml: example-0: spmi@fff24000:reg:0: [0, 4294066176, 0, 4096] is too long
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/spmi/hisilicon,hisi-spmi-controller.example.dt.yaml: spmi@fff24000: spmi-channel:0: 'number of the SPMI channel where the PMIC is connected' was expected
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/mfd/hisilicon,hi6421-spmi-pmic.example.dt.yaml: pmic@0: 'spmi-channel' is a required property


See https://patchwork.ozlabs.org/patch/1343370

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure dt-schema is up to date:

pip3 install git+https://github.com/devicetree-org/dt-schema.git@master --upgrade

Please check and re-submit.

