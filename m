Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E58CA1C1F54
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 May 2020 23:12:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726405AbgEAVKu (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 1 May 2020 17:10:50 -0400
Received: from mail-ot1-f67.google.com ([209.85.210.67]:38812 "EHLO
        mail-ot1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726579AbgEAVKt (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 1 May 2020 17:10:49 -0400
Received: by mail-ot1-f67.google.com with SMTP id g19so3630392otk.5;
        Fri, 01 May 2020 14:10:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=d8vAF+PY0nWCIBCBn4+LnDutJoHCKEjlYZUrgGSNTxI=;
        b=T+Df/p4IQvdMVzrB+plu8FvYWEUc6atWnKJ5ui8KiIN9arT58RJpkBHRUS1RHEn3Ig
         qmMwGHdzRUrYv5UirhNp/ydZdvvcg14kcOn17ozhbvNyH2nmacSo/cla1Jq8ZDK/EgXF
         xlOHOAKDtcbw0Fnwcfu/ka1Db/zKTqNadaKf7RGzUdQbRwQtq30KK5upe0UcXILqvw9P
         FLdhNu4Vd7BFvXjx5Gy+8OrDWoyyBcZagQ7BljsaGQg2uaCFenb7y0zANUsZcIWqodyt
         eURCwKUDPWyQcxfkJQNgcxjw3SvZPA7zkJfcGNN+dTumD5lxpkqNnx7CTocB+NxWxuXW
         SSFQ==
X-Gm-Message-State: AGi0PubWkqGjWs8q1QkNGM3TOSp539k5kBR/q75SwHEiVfR8xD0khAZx
        +kmgV8h331nu5699r6s1Xg==
X-Google-Smtp-Source: APiQypJXkbYVukB/6vxjI7uHS29tGC9oXir3mVEZ2lcW+KwqwzxOJPVhkSaJkIbFy3SV5b59OjaSDg==
X-Received: by 2002:a05:6830:1c2b:: with SMTP id f11mr5415187ote.196.1588367448305;
        Fri, 01 May 2020 14:10:48 -0700 (PDT)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id e91sm1125111otb.40.2020.05.01.14.10.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 May 2020 14:10:47 -0700 (PDT)
Received: (nullmailer pid 32685 invoked by uid 1000);
        Fri, 01 May 2020 21:10:46 -0000
Date:   Fri, 1 May 2020 16:10:46 -0500
From:   Rob Herring <robh@kernel.org>
To:     Ansuel Smith <ansuelsmth@gmail.com>
Cc:     Andy Gross <agross@kernel.org>,
        Ansuel Smith <ansuelsmth@gmail.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH v4 2/2] devicetree: bindings: phy: Document ipq806x dwc3
 qcom phy
Message-ID: <20200501211046.GA31395@bogus>
References: <20200429211926.4952-1-ansuelsmth@gmail.com>
 <20200429211926.4952-2-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200429211926.4952-2-ansuelsmth@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, 29 Apr 2020 23:19:25 +0200, Ansuel Smith wrote:
> Document dwc3 qcom phy hs and ss phy bindings needed to correctly
> inizialize and use usb on ipq806x SoC.
> 
> Signed-off-by: Ansuel Smith <ansuelsmth@gmail.com>
> ---
> v4:
> * Add qcom to specific bindings
> v3:
> * Use explicit reg instead of regmap
> 
>  .../bindings/phy/qcom,ipq806x-usb-phy-hs.yaml | 58 +++++++++++++++
>  .../bindings/phy/qcom,ipq806x-usb-phy-ss.yaml | 73 +++++++++++++++++++
>  2 files changed, 131 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/phy/qcom,ipq806x-usb-phy-hs.yaml
>  create mode 100644 Documentation/devicetree/bindings/phy/qcom,ipq806x-usb-phy-ss.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/phy/qcom,ipq806x-usb-phy-ss.yaml: properties:qcom,tx_deamp_3_5db: {'maxItems': 1, 'description': 'Override value for transmit preemphasis.', 'default': 23} is not valid under any of the given schemas (Possible causes of the failure):
	/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/phy/qcom,ipq806x-usb-phy-ss.yaml: properties:qcom,tx_deamp_3_5db: 'not' is a required property

/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/phy/qcom,ipq806x-usb-phy-ss.yaml: properties:qcom,rx_eq: {'maxItems': 1, 'description': 'Override value for rx_eq.', 'default': 4} is not valid under any of the given schemas (Possible causes of the failure):
	/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/phy/qcom,ipq806x-usb-phy-ss.yaml: properties:qcom,rx_eq: 'not' is a required property

/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/phy/qcom,ipq806x-usb-phy-ss.yaml: properties:qcom,mpll: {'maxItems': 1, 'description': 'Override value for mpll.', 'default': 0} is not valid under any of the given schemas (Possible causes of the failure):
	/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/phy/qcom,ipq806x-usb-phy-ss.yaml: properties:qcom,mpll: 'not' is a required property

Documentation/devicetree/bindings/Makefile:11: recipe for target 'Documentation/devicetree/bindings/phy/qcom,ipq806x-usb-phy-ss.example.dts' failed
make[1]: *** [Documentation/devicetree/bindings/phy/qcom,ipq806x-usb-phy-ss.example.dts] Error 1
make[1]: *** Waiting for unfinished jobs....
warning: no schema found in file: Documentation/devicetree/bindings/phy/qcom,ipq806x-usb-phy-ss.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/phy/qcom,ipq806x-usb-phy-ss.yaml: ignoring, error in schema: properties: qcom,mpll
warning: no schema found in file: Documentation/devicetree/bindings/phy/qcom,ipq806x-usb-phy-ss.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/phy/qcom,ipq806x-usb-phy-ss.yaml: ignoring, error in schema: properties: qcom,mpll
Makefile:1300: recipe for target 'dt_binding_check' failed
make: *** [dt_binding_check] Error 2

See https://patchwork.ozlabs.org/patch/1279692

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure dt-schema is up to date:

pip3 install git+https://github.com/devicetree-org/dt-schema.git@master --upgrade

Please check and re-submit.
