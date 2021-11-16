Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C521C453726
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Nov 2021 17:18:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229733AbhKPQUt (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 16 Nov 2021 11:20:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37128 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229456AbhKPQUt (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 16 Nov 2021 11:20:49 -0500
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com [IPv6:2607:f8b0:4864:20::102c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 673BFC061570;
        Tue, 16 Nov 2021 08:17:52 -0800 (PST)
Received: by mail-pj1-x102c.google.com with SMTP id nh10-20020a17090b364a00b001a69adad5ebso3344530pjb.2;
        Tue, 16 Nov 2021 08:17:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:date:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=vq/qbvOpDtTALSBunfD04P/4oL3hiPG2sNC8bjd3Ux4=;
        b=SzMp1vt1/zF/Wtcu//QtgNqpU4/hK1h68Ta+1QiDyWXcFsM+lQtkw9sgXZYpFzPckG
         6vZAc5mHQcdVEOrX7gaHZzDx9zBiXiYBSpTbt3A6CJlFeykM1KjJK8Q190885BSsxEo9
         csamlVUy2D/M+wrzSYdobRSllSc8Kdmc/Edn8FlTniP4lzIbhx/nyzyrgpHVrw/fkUll
         nFhY9cDa/y0dRCUeec3gg8TOIw76nWYaigeJxBDIDlpwLh5pFtj900RWOnKYCQtJTxed
         ZTZBPhZXntJofRIe9c0INrNhnTgfpSf3Kyh4nBheBgOXGMRq/so+KfOLiTOna9HxoF/B
         2QWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:date:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=vq/qbvOpDtTALSBunfD04P/4oL3hiPG2sNC8bjd3Ux4=;
        b=k7c23/AasxiEYHt3BoFjTblchBS7m+wwogwk80M2/+nlCGHzmeY2oRyN59rY5Xg6SC
         tvxat+il7hLtAX29tj0NUvmVoT3TDKiSIN97ZyFbofzu2RiYF94ECyBsFWjlV1ObA3ir
         RfyTByqC11woJMnYpIyh0SbP7qnU54VZONPZNvUPva34KCnKmFq7xDWThfUeGZOerslj
         Gmvdhfi1fZRgZOYLWL8YmV+s+X5xWb6qWB0rytYojzyuSyBrV6xqhtfMSfE+7aFhGDh4
         0hwHfenIb3VIZdAPFAA4Auv7eov0PNBvnaqkqIlXYDHydf+9UFeCn8wYvGkxdnQJBnlq
         0Bwg==
X-Gm-Message-State: AOAM532EqbLePryVTbPAp3Dy3ATPhHTbMuZqm/BXOeHyA7HhVkAWwVF1
        eAazrY2tgjF1an6sicZHFKU=
X-Google-Smtp-Source: ABdhPJz+RdOSwNv/6V9OhMwYSNtttObBBUfvB116zNGPeddkvzk/2yjVqKqPJthxwHUeqLWSrKfeJQ==
X-Received: by 2002:a17:903:32c2:b0:141:eed4:ec1c with SMTP id i2-20020a17090332c200b00141eed4ec1cmr46731524plr.33.1637079471903;
        Tue, 16 Nov 2021 08:17:51 -0800 (PST)
Received: from jaschultz-Thelio-Major ([2001:4898:80e8:35:c6dc:98dc:8835:3138])
        by smtp.gmail.com with ESMTPSA id z12sm755744pfg.186.2021.11.16.08.17.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Nov 2021 08:17:51 -0800 (PST)
From:   Jarrett Schultz <jaschultzms@gmail.com>
X-Google-Original-From: Jarrett Schultz <jaschultzMS@gmail.com>
Date:   Tue, 16 Nov 2021 08:17:49 -0800
To:     Rob Herring <robh@kernel.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <mgross@linux.intel.com>,
        Maximilian Luz <luzmaximilian@gmail.com>,
        linux-arm-msm@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Felipe Balbi <balbi@kernel.org>,
        Jarrett Schultz <jaschultz@microsoft.com>
Subject: Re: [PATCH v2 1/5] dt-bindings: platform: microsoft: Document
 surface xbl
Message-ID: <20211116161749.GA430792@jaschultz-Thelio-Major>
References: <20211108164449.3036210-1-jaschultz@microsoft.com>
 <20211108164449.3036210-2-jaschultz@microsoft.com>
 <YY58nB3XjEbTFBzT@robh.at.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YY58nB3XjEbTFBzT@robh.at.kernel.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, Nov 12, 2021 at 08:39:24AM -0600, Rob Herring wrote:
> On Mon, Nov 08, 2021 at 08:44:45AM -0800, Jarrett Schultz wrote:
> > Introduce yaml for surface xbl driver.
> > 
> > Signed-off-by: Jarrett Schultz <jaschultz@microsoft.com>
> 
> Author and Sob emails need to match.
> 
> > 
> > ---
> > 
> > Changes in v2:
> >  - Removed json-schema dependence
> >  - Elaborated on description of driver
> >  - Updated example
> > 
> > ---
> > 
> >  .../platform/microsoft/surface-xbl.yaml       | 57 +++++++++++++++++++
> >  MAINTAINERS                                   |  7 +++
> >  2 files changed, 64 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/platform/microsoft/surface-xbl.yaml
> > 
> > diff --git a/Documentation/devicetree/bindings/platform/microsoft/surface-xbl.yaml b/Documentation/devicetree/bindings/platform/microsoft/surface-xbl.yaml
> > new file mode 100644
> > index 000000000000..09f806f373bd
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/platform/microsoft/surface-xbl.yaml
> > @@ -0,0 +1,57 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/platform/microsoft/surface-xbl.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Surface Extensible Bootloader for Microsoft Surface Duo
> > +
> > +maintainers:
> > +  - Jarrett Schultz <jaschultzMS@gmail.com>
> > +
> > +description: |
> > +  Exposes the following device information to user space via sysfs -
> 
> What's sysfs? :) Linux details don't go in bindings.
> 
> > +    * board_id
> > +    * battery_present
> > +    * hw_init_retries
> > +    * is_customer_mode
> > +    * is_act_mode
> > +    * pmic_reset_reason
> > +    * touch_fw_version
> > +    * ocp_error_location
> > +  See sysfs documentation for more information.
> > +
> > +properties:
> > +  compatible:
> > +    const: microsoft,sm8150-surface-duo-xbl
> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +unevaluatedProperties: false
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +  - interrupts
> > +
> > +examples:
> > +  - |
> > +    xbl@146bfa94 {
> > +      compatible = "microsoft,sm8150-surface-duo-xbl";
> > +      reg = <0x00 0x146bfa94 0x00 0x100>;
> > +    };
> > +  - |
> > +    imem@146bf000 {
> > +      compatible = "simple-mfd";
> 
> 'simple-mfd' needs a specific compatible for the block.
> 

Is there any need to describe the inner "xbl@a94" binding? If so, could
you point me in the right direction?

> > +      reg = <0x0 0x146bf000 0x0 0x1000>;
> > +      ranges = <0x0 0x0 0x146bf000 0x1000>;
> > +
> > +      #address-cells = <1>;
> > +      #size-cells = <1>;
> > +
> > +      xbl@a94 {
> > +        compatible = "microsoft,sm8150-surface-duo-xbl";
> > +        reg = <0xa94 0x100>;
> > +      };
> > +    };
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index eeb4c70b3d5b..8643546f8fab 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -12423,6 +12423,13 @@ F:	Documentation/driver-api/surface_aggregator/clients/dtx.rst
> >  F:	drivers/platform/surface/surface_dtx.c
> >  F:	include/uapi/linux/surface_aggregator/dtx.h
> >  
> > +MICROSOFT SURFACE DUO XBL DRIVER
> > +M:	Jarrett Schultz <jaschultz@microsoft.com>
> > +L:	linux-arm-msm@vger.kernel.org
> > +L:	platform-driver-x86@vger.kernel.org
> > +S:	Supported
> > +F:	Documentation/devicetree/bindings/platform/microsoft/surface-xbl.yaml
> > +
> >  MICROSOFT SURFACE GPE LID SUPPORT DRIVER
> >  M:	Maximilian Luz <luzmaximilian@gmail.com>
> >  L:	platform-driver-x86@vger.kernel.org
> > -- 
> > 2.25.1
> > 
> > 
