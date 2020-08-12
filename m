Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6CDB7242EC6
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Aug 2020 20:55:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726512AbgHLSzb (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 12 Aug 2020 14:55:31 -0400
Received: from mail.kernel.org ([198.145.29.99]:43794 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726447AbgHLSzb (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 12 Aug 2020 14:55:31 -0400
Received: from onda.lan (ip5f5ad5c5.dynamic.kabel-deutschland.de [95.90.213.197])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id F091C20774;
        Wed, 12 Aug 2020 18:55:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1597258530;
        bh=iH2bntJ3heab/wBuNIHiZ2SrGEOTzKk8leH5YEXop+k=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=nUHLzoNyKRckx10X8ij4rbPs1razktvIs2RtxSsCmQGfnw/qYpda/mLhHza7zgwGa
         sUUmahLxbw0ge062C4Zl1AOcc5pVc8sNwTJRwrWWDjQTD32Q0MInF7rE7X06iqgGxW
         k6WhMy7CKe2xeICz4aZr9F/GC48qJkXH5abK6zqk=
Date:   Wed, 12 Aug 2020 15:55:26 -0300
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Rob Herring <robh@kernel.org>
Cc:     Rob Herring <robh+dt@kernel.org>, linuxarm@huawei.com,
        devicetree@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Lee Jones <lee.jones@linaro.org>, mauro.chehab@huawei.com
Subject: Re: [PATCH 31/33] dt: document HiSilicon SPMI controller and
 mfd/regulator properties
Message-ID: <20200812155526.220ec1c2@onda.lan>
In-Reply-To: <20200812163036.GA2324764@bogus>
References: <cover.1597160086.git.mchehab+huawei@kernel.org>
        <176043f329dfa9889f014feec04e7e1553077873.1597160086.git.mchehab+huawei@kernel.org>
        <20200812163036.GA2324764@bogus>
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Em Wed, 12 Aug 2020 10:30:36 -0600
Rob Herring <robh@kernel.org> escreveu:

> On Tue, 11 Aug 2020 17:41:57 +0200, Mauro Carvalho Chehab wrote:
> > Add documentation for the properties needed by the HiSilicon
> > 6421v600 driver, and by the SPMI controller used to access
> > the chipset.
> > 
> > Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> > ---
> >  .../mfd/hisilicon,hi6421-spmi-pmic.yaml       | 175 ++++++++++++++++++
> >  .../spmi/hisilicon,hisi-spmi-controller.yaml  |  54 ++++++
> >  2 files changed, 229 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/mfd/hisilicon,hi6421-spmi-pmic.yaml
> >  create mode 100644 Documentation/devicetree/bindings/spmi/hisilicon,hisi-spmi-controller.yaml
> >   
> 
> 
> My bot found errors running 'make dt_binding_check' on your patch:
> 
> Documentation/devicetree/bindings/mfd/hisilicon,hi6421-spmi-pmic.yaml: $id: relative path/filename doesn't match actual path or filename
> 	expected: http://devicetree.org/schemas/mfd/hisilicon,hi6421-spmi-pmic.yaml#
> Documentation/devicetree/bindings/mfd/hisilicon,hi6421-spmi-pmic.example.dts:34.15-28: Warning (reg_format): /example-0/pmic@0/regulators/ldo3@16:reg: property has invalid length (4 bytes) (#address-cells == 2, #size-cells == 1)
> Documentation/devicetree/bindings/mfd/hisilicon,hi6421-spmi-pmic.example.dts:57.15-28: Warning (reg_format): /example-0/pmic@0/regulators/ldo4@17:reg: property has invalid length (4 bytes) (#address-cells == 2, #size-cells == 1)
> Documentation/devicetree/bindings/mfd/hisilicon,hi6421-spmi-pmic.example.dt.yaml: Warning (pci_device_reg): Failed prerequisite 'reg_format'
> Documentation/devicetree/bindings/mfd/hisilicon,hi6421-spmi-pmic.example.dt.yaml: Warning (pci_device_bus_num): Failed prerequisite 'reg_format'
> Documentation/devicetree/bindings/mfd/hisilicon,hi6421-spmi-pmic.example.dt.yaml: Warning (simple_bus_reg): Failed prerequisite 'reg_format'
> Documentation/devicetree/bindings/mfd/hisilicon,hi6421-spmi-pmic.example.dt.yaml: Warning (i2c_bus_reg): Failed prerequisite 'reg_format'
> Documentation/devicetree/bindings/mfd/hisilicon,hi6421-spmi-pmic.example.dt.yaml: Warning (spi_bus_reg): Failed prerequisite 'reg_format'
> Documentation/devicetree/bindings/mfd/hisilicon,hi6421-spmi-pmic.example.dts:33.27-54.15: Warning (avoid_default_addr_size): /example-0/pmic@0/regulators/ldo3@16: Relying on default #address-cells value
> Documentation/devicetree/bindings/mfd/hisilicon,hi6421-spmi-pmic.example.dts:33.27-54.15: Warning (avoid_default_addr_size): /example-0/pmic@0/regulators/ldo3@16: Relying on default #size-cells value
> Documentation/devicetree/bindings/mfd/hisilicon,hi6421-spmi-pmic.example.dts:56.27-76.15: Warning (avoid_default_addr_size): /example-0/pmic@0/regulators/ldo4@17: Relying on default #address-cells value
> Documentation/devicetree/bindings/mfd/hisilicon,hi6421-spmi-pmic.example.dts:56.27-76.15: Warning (avoid_default_addr_size): /example-0/pmic@0/regulators/ldo4@17: Relying on default #size-cells value
> Documentation/devicetree/bindings/mfd/hisilicon,hi6421-spmi-pmic.example.dt.yaml: Warning (unique_unit_address): Failed prerequisite 'avoid_default_addr_size'
> /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/spmi/hisilicon,hisi-spmi-controller.example.dt.yaml: example-0: spmi@fff24000:reg:0: [0, 4294066176, 0, 4096] is too long
> /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/spmi/hisilicon,hisi-spmi-controller.example.dt.yaml: spmi@fff24000: spmi-channel:0: 'number of the SPMI channel where the PMIC is connected' was expected
> /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/mfd/hisilicon,hi6421-spmi-pmic.example.dt.yaml: pmic@0: 'spmi-channel' is a required property
> 
> 
> See https://patchwork.ozlabs.org/patch/1343370
> 
> If you already ran 'make dt_binding_check' and didn't see the above
> error(s), then make sure dt-schema is up to date:
> 
> pip3 install git+https://github.com/devicetree-org/dt-schema.git@master --upgrade
> 
> Please check and re-submit.
> 

Hi Rob,

Fixed those at the newest version I submitted today via staging tree.

At least here, dt_binding_check passes at the newest version.

Regards,
Mauro




