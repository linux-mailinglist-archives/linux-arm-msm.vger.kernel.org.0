Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 044753B92AD
	for <lists+linux-arm-msm@lfdr.de>; Thu,  1 Jul 2021 16:03:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232966AbhGAOFq (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 1 Jul 2021 10:05:46 -0400
Received: from mail-il1-f180.google.com ([209.85.166.180]:45717 "EHLO
        mail-il1-f180.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232937AbhGAOFq (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 1 Jul 2021 10:05:46 -0400
Received: by mail-il1-f180.google.com with SMTP id b5so6430045ilc.12;
        Thu, 01 Jul 2021 07:03:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
         :message-id;
        bh=34pditdGAnkmOoWQm+ofV1mGsalRsMGBBDjdbXOmEes=;
        b=Cv2JvEXhmiF7Q6xcIlDCPuFDz5JAdT/03VrtXW7NEWUl+vIO1rcyxn/nm7qZ0W77V2
         H0M4ysxvm+umhf0x0b1cm2BQFWVFYa4r298zjK0RhYsaRWxjIEe3izwk/wkrs2Dnxlq2
         Yx8ObC83ZzirKhyt01ZZIpTl4c+NhksayH0JnugyRUnW0Ww0EfDxBMIlQhIamvU0rGsb
         F2uPfKk9W/gZZyTKOxzRi4H7ti/vrq4ro/+vvmGtAKoaMcBKrHtQWnXfB/Z82HX+3hor
         MjAbiBnZiK0n2kcfnBty6gWVRQ5uc9kZ078lcPz74GPGjo/XXUi0h3UKttFyeqm7XIpf
         p7LQ==
X-Gm-Message-State: AOAM533fhZWbdhHUoIAxTeHWFVK4eeEJrO5bu/tpSVDVxDOGIrJ2jCy6
        oI41POZvf5WpyafVt8IuDjAa0IFN2A==
X-Google-Smtp-Source: ABdhPJwC7NMLRfHWNQ8AaqlAY9dCRLK5L1h8nMWNBTSc/DgyiB2LGSdA4v3aEPQWf8EYA8dvoeC6YA==
X-Received: by 2002:a05:6e02:1a02:: with SMTP id s2mr11414787ild.76.1625148194770;
        Thu, 01 Jul 2021 07:03:14 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
        by smtp.gmail.com with ESMTPSA id l5sm14245907ion.44.2021.07.01.07.03.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Jul 2021 07:03:13 -0700 (PDT)
Received: (nullmailer pid 2278694 invoked by uid 1000);
        Thu, 01 Jul 2021 14:02:43 -0000
From:   Rob Herring <robh@kernel.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Rob Herring <robh+dt@kernel.org>, linux-kernel@vger.kernel.org,
        Andy Gross <agross@kernel.org>, Sibi S <sibis@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20210625234018.1324681-3-bjorn.andersson@linaro.org>
References: <20210625234018.1324681-1-bjorn.andersson@linaro.org> <20210625234018.1324681-3-bjorn.andersson@linaro.org>
Subject: Re: [PATCH 2/3] dt-bindings: soc: qcom: aoss: Convert to YAML
Date:   Thu, 01 Jul 2021 08:02:43 -0600
Message-Id: <1625148163.508920.2278693.nullmailer@robh.at.kernel.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, 25 Jun 2021 16:40:17 -0700, Bjorn Andersson wrote:
> Convert to YAML in order to allow validation.
> 
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---
> 
> I'm aware that this conflicts with Sibi's removal of '#power-domain-cells', but
> that's a trivial change regardless of which of the two patches gets in first.
> 
>  .../bindings/soc/qcom/qcom,aoss-qmp.txt       |  90 --------------
>  .../bindings/soc/qcom/qcom,aoss-qmp.yaml      | 115 ++++++++++++++++++
>  2 files changed, 115 insertions(+), 90 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/soc/qcom/qcom,aoss-qmp.txt
>  create mode 100644 Documentation/devicetree/bindings/soc/qcom/qcom,aoss-qmp.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:
./Documentation/devicetree/bindings/soc/qcom/qcom,aoss-qmp.yaml:29:9: [warning] wrong indentation: expected 10 but found 8 (indentation)

dtschema/dtc warnings/errors:
\ndoc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/patch/1497468

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.

