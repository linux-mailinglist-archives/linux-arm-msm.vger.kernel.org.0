Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 753CA1BC088
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Apr 2020 16:05:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727106AbgD1OFB (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 28 Apr 2020 10:05:01 -0400
Received: from mail-ot1-f65.google.com ([209.85.210.65]:41497 "EHLO
        mail-ot1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727933AbgD1OFB (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 28 Apr 2020 10:05:01 -0400
Received: by mail-ot1-f65.google.com with SMTP id c3so32729054otp.8;
        Tue, 28 Apr 2020 07:05:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=CsXsbPmc/AQsgDmce1lCUxAQ9qNPMT/YUlbmJYg9aAk=;
        b=brvVanV3TZMIUOWOMhHsrJOERIhwXEwCAklGhfMWC0hNOpLWbbXTd24woXvLtPHT9w
         uasexgtz7ulYt19L5a6Hac2XHsdWtfDA6axQChHCCobIStkHsCd9Xfquevz3ZIgk2krB
         UwRXmcYV3xdw4r/S+1xwJy+eYVNa0iQOba6qZ0enuxPyLjQ/SVFEqg40GsA2m/+GTFPv
         /IPc4FwYOpW3ciiN6OHnJ4DRHX+RQg3gjCDCiZQpLL2HVMNa+poIPzLB4pxnQXSPh9BS
         /VLZxQnQ7XAkr78NM9csLyHpQ9G7j+qrz+jv447RbOYr6jo1DEjyC80KWrJxTPsGyNup
         sxeA==
X-Gm-Message-State: AGi0PubgRlM3LueCxu0C5tLigqypecwBHQ19lDA0IYEBrQOJBGxz3fqV
        gDPW8g3D9pEhJ3LD9rfJKu3tHvI=
X-Google-Smtp-Source: APiQypKb2JF8s+fM9v/SS//A1mpGTbCm5LO0BD+cx6dpOnHXjQ4YaX4fx4QV3shJkWB6WKHF1e8NQQ==
X-Received: by 2002:aca:5513:: with SMTP id j19mr2978201oib.31.1588082700621;
        Tue, 28 Apr 2020 07:05:00 -0700 (PDT)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id u1sm2536938oif.54.2020.04.28.07.04.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Apr 2020 07:05:00 -0700 (PDT)
Received: (nullmailer pid 713 invoked by uid 1000);
        Tue, 28 Apr 2020 14:04:59 -0000
Date:   Tue, 28 Apr 2020 09:04:59 -0500
From:   Rob Herring <robh@kernel.org>
To:     Guru Das Srinagesh <gurus@codeaurora.org>
Cc:     devicetree@vger.kernel.org,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Lee Jones <lee.jones@linaro.org>,
        Subbaraman Narayanamurthy <subbaram@codeaurora.org>,
        David Collins <collinsd@codeaurora.org>,
        linux-kernel@vger.kernel.org,
        Guru Das Srinagesh <gurus@codeaurora.org>
Subject: Re: [PATCH 1/2] dt-bindings: mfd: Document QTI I2C PMIC controller
Message-ID: <20200428140459.GA15128@bogus>
References: <cover.1588037638.git.gurus@codeaurora.org>
 <362fc93ff06d19788bfb0387eac86e6976decb98.1588037638.git.gurus@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <362fc93ff06d19788bfb0387eac86e6976decb98.1588037638.git.gurus@codeaurora.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, 27 Apr 2020 19:18:01 -0700, Guru Das Srinagesh wrote:
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
>  .../devicetree/bindings/mfd/qcom,i2c-pmic.yaml     | 89 ++++++++++++++++++++++
>  1 file changed, 89 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mfd/qcom,i2c-pmic.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

Error: Documentation/devicetree/bindings/mfd/qcom,i2c-pmic.example.dts:17.1-7 syntax error
FATAL ERROR: Unable to parse input tree
scripts/Makefile.lib:312: recipe for target 'Documentation/devicetree/bindings/mfd/qcom,i2c-pmic.example.dt.yaml' failed
make[1]: *** [Documentation/devicetree/bindings/mfd/qcom,i2c-pmic.example.dt.yaml] Error 1
make[1]: *** Waiting for unfinished jobs....
Makefile:1300: recipe for target 'dt_binding_check' failed
make: *** [dt_binding_check] Error 2

See https://patchwork.ozlabs.org/patch/1278158

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure dt-schema is up to date:

pip3 install git+https://github.com/devicetree-org/dt-schema.git@master --upgrade

Please check and re-submit.
