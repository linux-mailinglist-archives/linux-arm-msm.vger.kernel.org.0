Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AC92F31E033
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Feb 2021 21:26:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234909AbhBQUZn (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 17 Feb 2021 15:25:43 -0500
Received: from mail-oo1-f43.google.com ([209.85.161.43]:40506 "EHLO
        mail-oo1-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234385AbhBQUZl (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 17 Feb 2021 15:25:41 -0500
Received: by mail-oo1-f43.google.com with SMTP id l5so3373534ooj.7;
        Wed, 17 Feb 2021 12:25:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
         :message-id;
        bh=fLnlpKVa8aTFZUXpVDWvEfm5d0zNdvRXjqwtdTXGr4Y=;
        b=Go5MpGWLd1LaZGlzK14c9lVgUMjzl57Sa3AXwMYx8u0YGr/o0bdE3v7yKJmaQ4mYZy
         +1dfGwKAk/NhQ80iniD0EMqTxizOmKRiqEaWPweTYQ6uHmtqfYKYJdMVfnxRx+VNJAZV
         ZEYXJqokesp+4LB/t+yjbFvLtkAa0kk3pQ7cKSO1kh+FIIFRiolu5G+lySxNkvgOcZzu
         9TNHt0BveLGD6T0f17q2PtzjFu45krY4BnTy7v1izyEs6tfeXncIqgw5evI4VWWScZK/
         DQc9rtj1bVoTmhvc//NJjfIvc0Vzg/BXkVXxgZKwOptg+40Ba/RkAq+Ye9H7mU6X9Emo
         hVTg==
X-Gm-Message-State: AOAM530/ZAedTRAv8QEg3nNO4EKpHh8pq+lWmoENes99mdiP/P77pWVf
        GCltRkLwsnB6MInuHVLzSA==
X-Google-Smtp-Source: ABdhPJw0ann/bAXT8Q2SRZLvNn/g2q7ZaTUzRhipwnSq59eKQ+0l9ROEKPtiufDY9YopMpZ0zXUYGg==
X-Received: by 2002:a4a:98a3:: with SMTP id a32mr568295ooj.51.1613593500392;
        Wed, 17 Feb 2021 12:25:00 -0800 (PST)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id t17sm82851oij.45.2021.02.17.12.24.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Feb 2021 12:24:59 -0800 (PST)
Received: (nullmailer pid 2681067 invoked by uid 1000);
        Wed, 17 Feb 2021 20:24:51 -0000
From:   Rob Herring <robh@kernel.org>
To:     Souradeep Chowdhury <schowdhu@codeaurora.org>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        devicetree@vger.kernel.org, Andy Gross <agross@kernel.org>,
        Sibi Sankar <sibis@codeaurora.org>,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org
In-Reply-To: <5da43657817066e0ffe1e24cfb17104138515452.1613541226.git.schowdhu@codeaurora.org>
References: <cover.1613541226.git.schowdhu@codeaurora.org> <5da43657817066e0ffe1e24cfb17104138515452.1613541226.git.schowdhu@codeaurora.org>
Subject: Re: [PATCH V0 1/6] dt-bindings: Added the yaml bindings for DCC
Date:   Wed, 17 Feb 2021 14:24:51 -0600
Message-Id: <1613593491.498451.2681066.nullmailer@robh.at.kernel.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, 17 Feb 2021 12:18:22 +0530, Souradeep Chowdhury wrote:
> Documentation for Data Capture and Compare(DCC) device tree bindings
> in yaml format.
> 
> Signed-off-by: Souradeep Chowdhury <schowdhu@codeaurora.org>
> ---
>  .../devicetree/bindings/arm/msm/qcom,dcc.yaml      | 49 ++++++++++++++++++++++
>  1 file changed, 49 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/arm/msm/qcom,dcc.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:
./Documentation/devicetree/bindings/arm/msm/qcom,dcc.yaml:21:5: [warning] wrong indentation: expected 6 but found 4 (indentation)
./Documentation/devicetree/bindings/arm/msm/qcom,dcc.yaml:22:7: [warning] wrong indentation: expected 8 but found 6 (indentation)

dtschema/dtc warnings/errors:
Documentation/devicetree/bindings/arm/msm/qcom,dcc.example.dts:19.21-24.11: Warning (unit_address_format): /example-0/dcc@010a2000: unit name should not have leading 0s
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/arm/msm/qcom,dcc.example.dt.yaml: example-0: dcc@010a2000:reg:0: [0, 17440768, 0, 4096] is too long
	From schema: /usr/local/lib/python3.8/dist-packages/dtschema/schemas/reg.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/arm/msm/qcom,dcc.example.dt.yaml: example-0: dcc@010a2000:reg:1: [0, 17489920, 0, 8192] is too long
	From schema: /usr/local/lib/python3.8/dist-packages/dtschema/schemas/reg.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/arm/msm/qcom,dcc.example.dt.yaml: dcc@010a2000: compatible: ['qcom,sm8150-dcc'] is too short
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/arm/msm/qcom,dcc.yaml

See https://patchwork.ozlabs.org/patch/1441182

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.

