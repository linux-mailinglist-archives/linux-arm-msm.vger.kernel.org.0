Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ABF3A2F5987
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Jan 2021 04:42:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726742AbhANDmF (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 13 Jan 2021 22:42:05 -0500
Received: from mail-ot1-f41.google.com ([209.85.210.41]:33010 "EHLO
        mail-ot1-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726700AbhANDmE (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 13 Jan 2021 22:42:04 -0500
Received: by mail-ot1-f41.google.com with SMTP id b24so4082928otj.0;
        Wed, 13 Jan 2021 19:41:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
         :message-id;
        bh=SGWbR3BrTol+d77A+2HgxhYJh6fSWxTvgiIdLTniN8c=;
        b=GPi++iC9uizoWGa4lcWysUvNojG1sBKmBQFEbm/AOGta4kx6V2ktHbzFT1axAc3kYv
         m0KF1//BeukeX9zET89eb6wgaQ+87kwUNtPO/CbKabxEKxLYsqUlBNsrWdyKDThwrZ+X
         ITO/Szu/9iAzDuEUcCOSx3pVxT4iL8V2VF4rNyAJeSpmm+B+XuTttLxXULc+cW8sFDs7
         gvzWncYL9/gQaRJObvR+EU29KWlAatrZhtkZXXwKv4Kl1AwW0yWXJEC2KZH69KWrmB6p
         foRXxbsZX6Kr+qTFQJCoPRK7i1+l+TzogJ9RlOG8DO21j8fen31LesXzpkDXaA+NsVIt
         Khhw==
X-Gm-Message-State: AOAM532CKeIUAl6UH/TesVPA6pnGH2J4dW1OLaMcmSpz9HEri8/Fe0Sg
        +Z9Q4nskRdT+8a4ZtDPp7Q==
X-Google-Smtp-Source: ABdhPJwJa4Z41DmVPHPjJCTeKfDKtkC85EF6YrkJqnUVg+XmnwZsX3pVKhE96duI+Pshf3Hlgke1QQ==
X-Received: by 2002:a9d:8b6:: with SMTP id 51mr3544813otf.5.1610595683907;
        Wed, 13 Jan 2021 19:41:23 -0800 (PST)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id g26sm829421otp.52.2021.01.13.19.41.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Jan 2021 19:41:22 -0800 (PST)
Received: (nullmailer pid 3165653 invoked by uid 1000);
        Thu, 14 Jan 2021 03:41:22 -0000
From:   Rob Herring <robh@kernel.org>
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Andy Gross <agross@kernel.org>, devicetree@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-arm-msm@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
        linux-kernel@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
In-Reply-To: <20210113160053.3974229-2-dmitry.baryshkov@linaro.org>
References: <20210113160053.3974229-1-dmitry.baryshkov@linaro.org> <20210113160053.3974229-2-dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH v2 1/2] dt-bindings: misc: qcom,qca6390: add binding for QCA6390 device
Date:   Wed, 13 Jan 2021 21:41:22 -0600
Message-Id: <1610595682.023066.3165651.nullmailer@robh.at.kernel.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, 13 Jan 2021 19:00:52 +0300, Dmitry Baryshkov wrote:
> Qualcomm QCA6390/1 is a family of WiFi + Bluetooth SoCs, with BT part
> being controlled through the UART and WiFi being present on PCIe bus.
> Both blocks share common power sources. Add binding to describe power
> sequencing required to power up this device.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  .../bindings/misc/qcom,qca6390.yaml           | 84 +++++++++++++++++++
>  1 file changed, 84 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/misc/qcom,qca6390.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
./Documentation/devicetree/bindings/misc/qcom,qca6390.yaml: $id: relative path/filename doesn't match actual path or filename
	expected: http://devicetree.org/schemas/misc/qcom,qca6390.yaml#

See https://patchwork.ozlabs.org/patch/1425839

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.

