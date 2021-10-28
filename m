Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CF37643E8D1
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 Oct 2021 21:08:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231201AbhJ1TLW (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 28 Oct 2021 15:11:22 -0400
Received: from mail-ot1-f53.google.com ([209.85.210.53]:45639 "EHLO
        mail-ot1-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231178AbhJ1TLV (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 28 Oct 2021 15:11:21 -0400
Received: by mail-ot1-f53.google.com with SMTP id l16-20020a9d6a90000000b0054e7ab56f27so9975852otq.12;
        Thu, 28 Oct 2021 12:08:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
         :message-id;
        bh=tHwyqYZeG12PlwvxWaijeWvT3HLavP643dZAsZIvq2g=;
        b=Mb2H8Qtuxo+ADAV2jW937vnQJpFGNHljqfzZylm+3HaDwbh2cba57YygdB6BWUBaCn
         WBX1qlLhxh9oWapqunWkKAfGQ70spVso93j3ODRFrsV605S5j3aqM/5VTX7h1aegjvSa
         ST9WF2j66WV3dtv7N9BHdq4TKmLax0NW4ckXaAG+sREKLWg1BvEvHWpW6LSgjkxOMJIo
         14Ln9X3cPd/pyxRshVAiVIC4U/hqIh+kwLeAypeXPN5bWvivVC0KHWU57nyvXNiNn0Xg
         k4xYAD+2p1qvzZuekO4WKfjz/SR5OwZA8SdXIBorcRxCDeglVMhyDK94JPJ2KWtInYfz
         Jimw==
X-Gm-Message-State: AOAM530/i+LuVici1a5eWuHKHkGVF+Bqbkw26w+pvvsaUvlblffkvCbn
        KC5Cj5dmZkfynVa3vk6lOg==
X-Google-Smtp-Source: ABdhPJxqVd1DJn9hYajbDWkNVOETuiRVmZt9+VXwhTslZyk5Y43+wUfo/90GMU5kPDLTOAoTTCe1gw==
X-Received: by 2002:a9d:847:: with SMTP id 65mr374703oty.326.1635448132055;
        Thu, 28 Oct 2021 12:08:52 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id r22sm1253535otq.5.2021.10.28.12.08.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Oct 2021 12:08:51 -0700 (PDT)
Received: (nullmailer pid 409859 invoked by uid 1000);
        Thu, 28 Oct 2021 19:08:48 -0000
From:   Rob Herring <robh@kernel.org>
To:     Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc:     rdunlap@infradead.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-usb@vger.kernel.org,
        heikki.krogerus@linux.intel.com, linux@roeck-us.net,
        gregkh@linuxfoundation.org, robh+dt@kernel.org,
        wcheng@codeaurora.org, bjorn.andersson@linaro.org
In-Reply-To: <20211028164941.831918-5-bryan.odonoghue@linaro.org>
References: <20211028164941.831918-1-bryan.odonoghue@linaro.org> <20211028164941.831918-5-bryan.odonoghue@linaro.org>
Subject: Re: [RESEND PATCH v2 4/7] dt-bindings: usb: Add Qualcomm PMIC PDPHY controller YAML schema
Date:   Thu, 28 Oct 2021 14:08:48 -0500
Message-Id: <1635448128.091392.409858.nullmailer@robh.at.kernel.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, 28 Oct 2021 17:49:38 +0100, Bryan O'Donoghue wrote:
> Add a YAML binding for the power-delivery PHY silicon interface inside
> Qualcomm's pm8150b hardware block.
> 
> The pdphy driver operates with a type-c driver inside of a high level
> single TCPM device to provide overall TCPM functionality.
> 
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---
>  .../bindings/usb/qcom,pmic-pdphy.yaml         | 115 ++++++++++++++++++
>  1 file changed, 115 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/usb/qcom,pmic-pdphy.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:
./Documentation/devicetree/bindings/usb/qcom,pmic-pdphy.yaml:37:8: [warning] wrong indentation: expected 6 but found 7 (indentation)

dtschema/dtc warnings/errors:

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/patch/1547614

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.

