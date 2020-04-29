Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D78441BE972
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Apr 2020 23:01:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726776AbgD2VBb (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 29 Apr 2020 17:01:31 -0400
Received: from mail-oi1-f193.google.com ([209.85.167.193]:44030 "EHLO
        mail-oi1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726456AbgD2VBa (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 29 Apr 2020 17:01:30 -0400
Received: by mail-oi1-f193.google.com with SMTP id j16so3125132oih.10;
        Wed, 29 Apr 2020 14:01:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=Sjv8xbtiF5VJ25YlOqqY8GTwXuNo2deA4xSa7WAS5uY=;
        b=eIN0B7uzF4hP3BiQ4xgPeDkwZSFQl9Wrlr/VIfxDoi0nk/YACKPB3C+MfxZ/HA9QNW
         zU6vi7MD1s7PHhifhe5C4vEcS6SoSp/f8GiZArAiDMdFLAhss5qqjPWNW0O4EgvOL7+6
         yi2NwblABcYuAPntF0ICEms6HCYviofUWNv8BhEoOcT2KUgZYmNFk6QWkMi0SDIQFwBK
         ocD16xlfJBndGPP4buRFRPu0WUxszdBOnkkRkIFGczsAHupc/Y9DnM7Q4vitW0jvKn50
         CPRqT2iOVhtxeXTfgSBjuS69Ew1WYjj+pR59M93/5WDxkxOOLsmsa/8iM+yGVoprIVsY
         +O6A==
X-Gm-Message-State: AGi0Pua9x/kRXbPj6IiixzQ/GxGBLq92EoejX2H2i3Snc4ugm32n0P2M
        dRhFvdrkSMNWouYRCE5Neg==
X-Google-Smtp-Source: APiQypIzSLMtyIzqU2ZEb1BZ77J1RfgsOD6XLRhb3ggRh/7d+26Wu8tnRl5N3v1bfZdsxlLsKPcOCw==
X-Received: by 2002:a05:6808:998:: with SMTP id a24mr133484oic.65.1588194089606;
        Wed, 29 Apr 2020 14:01:29 -0700 (PDT)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id q12sm656933otn.57.2020.04.29.14.01.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Apr 2020 14:01:28 -0700 (PDT)
Received: (nullmailer pid 19382 invoked by uid 1000);
        Wed, 29 Apr 2020 21:01:27 -0000
Date:   Wed, 29 Apr 2020 16:01:27 -0500
From:   Rob Herring <robh@kernel.org>
To:     Guru Das Srinagesh <gurus@codeaurora.org>
Cc:     devicetree@vger.kernel.org,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Lee Jones <lee.jones@linaro.org>,
        Subbaraman Narayanamurthy <subbaram@codeaurora.org>,
        David Collins <collinsd@codeaurora.org>,
        linux-kernel@vger.kernel.org,
        Guru Das Srinagesh <gurus@codeaurora.org>
Subject: Re: [PATCH v1 1/2] dt-bindings: mfd: Document QTI I2C PMIC controller
Message-ID: <20200429210127.GA18663@bogus>
References: <cover.1588115326.git.gurus@codeaurora.org>
 <0960b5d17013124d9bbdbe7f28374b3d6c9c026e.1588115326.git.gurus@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0960b5d17013124d9bbdbe7f28374b3d6c9c026e.1588115326.git.gurus@codeaurora.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, 28 Apr 2020 17:30:11 -0700, Guru Das Srinagesh wrote:
> The Qualcomm Technologies, Inc. I2C PMIC Controller is used by
> multi-function PMIC devices which communicate over the I2C bus.  The
> controller enumerates all child nodes as platform devices, and
> instantiates a regmap interface for them to communicate over the I2C
> bus.
> 
> The controller also controls interrupts for all of the children platform
> devices.  The controller handles the summary interrupt by deciphering
> which peripheral triggered the interrupt, and which of the peripheral
> interrupts were triggered.  Finally, it calls the interrupt handlers for
> each of the virtual interrupts that were registered.
> 
> Signed-off-by: Guru Das Srinagesh <gurus@codeaurora.org>
> ---
> Changes from v0:
> - Fixed "FATAL ERROR: Unable to parse input tree" error thrown by `make
>   dt_binding_check`.
> 
>  .../devicetree/bindings/mfd/qcom,i2c-pmic.yaml     | 86 ++++++++++++++++++++++
>  1 file changed, 86 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mfd/qcom,i2c-pmic.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

Documentation/devicetree/bindings/mfd/qcom,i2c-pmic.example.dts:19.11-23: Warning (reg_format): /example-0/qcom,smb138x@8:reg: property has invalid length (4 bytes) (#address-cells == 1, #size-cells == 1)
Documentation/devicetree/bindings/mfd/qcom,i2c-pmic.example.dt.yaml: Warning (pci_device_reg): Failed prerequisite 'reg_format'
Documentation/devicetree/bindings/mfd/qcom,i2c-pmic.example.dt.yaml: Warning (pci_device_bus_num): Failed prerequisite 'reg_format'
Documentation/devicetree/bindings/mfd/qcom,i2c-pmic.example.dt.yaml: Warning (simple_bus_reg): Failed prerequisite 'reg_format'
Documentation/devicetree/bindings/mfd/qcom,i2c-pmic.example.dt.yaml: Warning (i2c_bus_reg): Failed prerequisite 'reg_format'
Documentation/devicetree/bindings/mfd/qcom,i2c-pmic.example.dt.yaml: Warning (spi_bus_reg): Failed prerequisite 'reg_format'

See https://patchwork.ozlabs.org/patch/1278818

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure dt-schema is up to date:

pip3 install git+https://github.com/devicetree-org/dt-schema.git@master --upgrade

Please check and re-submit.
