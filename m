Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A7DFB2D16B0
	for <lists+linux-arm-msm@lfdr.de>; Mon,  7 Dec 2020 17:45:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727457AbgLGQoZ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 7 Dec 2020 11:44:25 -0500
Received: from mail-oi1-f194.google.com ([209.85.167.194]:46730 "EHLO
        mail-oi1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725804AbgLGQoZ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 7 Dec 2020 11:44:25 -0500
Received: by mail-oi1-f194.google.com with SMTP id k2so16040690oic.13;
        Mon, 07 Dec 2020 08:44:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=b6XhvrHIi+pjk7bRVugtQTc187KpUcA9mIMEEtjrx48=;
        b=oZcFcbRGRhOnKxmUhF8TPLmuJiHAws/Z+7FtzFRZ4PeqCH9XSzQu9AYll25Urpdz18
         xfIT7lykmMb2saa6e/0leVTu3oOscixj72KE3pHhpii+HcprJ+H+vcjER8tuwOfZVCCe
         /5ze+kUw8dZTwFIX/kvqjpSxvOM3QV6C/BQxLVjc0Ypsi8c6WI5Yu3zHCNOdwx/BGzcS
         wvXbOsqPVVdK3uqxxxfKR2fRPOUkh2MpLforPik9qdJRUlXZJFhIlPSuczotKSIcYctl
         nROxpRWYF1Yb+T7a//whwpWHt3o3NJfs6Poz9AgXfCUEE6aomyJdYLBNgNzyvsK1W/+1
         bwnA==
X-Gm-Message-State: AOAM530+wxYD7HaLioStFnUFpFYrF6nelLTlGo1fAvun1OLEBN1e+xGB
        zT9FjCv+LDWlNYgxdZsbPg==
X-Google-Smtp-Source: ABdhPJzuzVSeTTNxwS3CHq11xvFm3hbEmOhvcV9OYo8qaQElMgLwSM/7gKSnAuICa/eSPh2p8Sf5jQ==
X-Received: by 2002:aca:e082:: with SMTP id x124mr1537651oig.3.1607359423865;
        Mon, 07 Dec 2020 08:43:43 -0800 (PST)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id y18sm2686861ooj.20.2020.12.07.08.43.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Dec 2020 08:43:42 -0800 (PST)
Received: (nullmailer pid 412520 invoked by uid 1000);
        Mon, 07 Dec 2020 16:43:42 -0000
Date:   Mon, 7 Dec 2020 10:43:42 -0600
From:   Rob Herring <robh@kernel.org>
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Andy Gross <agross@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH v2] dt-bindings: soc: qcom: convert qcom,smem bindings to
 yaml
Message-ID: <20201207164342.GA411695@robh.at.kernel.org>
References: <20201204022401.1054122-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201204022401.1054122-1-dmitry.baryshkov@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, 04 Dec 2020 05:24:01 +0300, Dmitry Baryshkov wrote:
> Convert soc/qcom/qcom,smem.txt bindings to YAML format.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  .../bindings/soc/qcom/qcom,smem.txt           | 57 ---------------
>  .../bindings/soc/qcom/qcom,smem.yaml          | 73 +++++++++++++++++++
>  2 files changed, 73 insertions(+), 57 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/soc/qcom/qcom,smem.txt
>  create mode 100644 Documentation/devicetree/bindings/soc/qcom/qcom,smem.yaml
> 


My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/soc/qcom/qcom,smem.example.dt.yaml: memory@fc428000: 'device_type' is a required property
	From schema: /usr/local/lib/python3.8/dist-packages/dtschema/schemas/memory.yaml


See https://patchwork.ozlabs.org/patch/1410768

The base for the patch is generally the last rc1. Any dependencies
should be noted.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.

