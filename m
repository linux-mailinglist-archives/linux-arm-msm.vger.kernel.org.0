Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8E24A32812B
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Mar 2021 15:45:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236506AbhCAOpG (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 1 Mar 2021 09:45:06 -0500
Received: from mail-oi1-f174.google.com ([209.85.167.174]:42953 "EHLO
        mail-oi1-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236463AbhCAOpE (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 1 Mar 2021 09:45:04 -0500
Received: by mail-oi1-f174.google.com with SMTP id l64so18222221oig.9;
        Mon, 01 Mar 2021 06:44:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
         :message-id;
        bh=PKi7bPCvLLJYTrOHV7hFTTu/5jhFGP5klWwVnr6aieA=;
        b=DlbcMpf1w1ALcKDnNlSPFbKh3MnQIIbv+kXu5mYw/nZvyVpFVE4s48FLydh5Ss65mK
         +umm9DIYyjtAvYPV3gwm8N9qWDhwnTFcenRec0BcRMZfvRr2OqrThLSqteBk7FdsVI6h
         mERbSfA5ZI4dRH3qJKrUeUrRnPVNjil/AR3WYkqfxyEO3XczdCC6NSC1AU1Gn+Hxj/Vx
         dlezBBXX0fURqeGQSAz1tixDNqSNrI7kjahtXCVngdcxAQufi5M2UMY5BfmyhTE3zuSq
         +hiE0TonCxhwZ9PApd5hPlvaRy7InvNgZw1enNz74k/TeOqnC/iwpyP6oyhD7MdXNvxK
         r51g==
X-Gm-Message-State: AOAM5338mSGdxCUIlkdiNEUBbfQWY95QDH7kw0KzfCUIiiTwjob4LlIT
        uZT1s7Njfs1Xe/DnF92dPg==
X-Google-Smtp-Source: ABdhPJz46z7d74LZoVxgX9NXWDklqW6EA0EXTh0H73eMk1VHLAMfqSG+D8d8AdmHSpqh1RU04a/wQw==
X-Received: by 2002:a05:6808:1383:: with SMTP id c3mr11689377oiw.153.1614609862895;
        Mon, 01 Mar 2021 06:44:22 -0800 (PST)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id i20sm1878550otf.17.2021.03.01.06.44.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Mar 2021 06:44:22 -0800 (PST)
Received: (nullmailer pid 37859 invoked by uid 1000);
        Mon, 01 Mar 2021 14:44:21 -0000
From:   Rob Herring <robh@kernel.org>
To:     satya priya <skakit@codeaurora.org>
Cc:     linux-arm-msm@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        Mark Brown <broonie@kernel.org>, linux-kernel@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, kgunda@codeaurora.org,
        rnayak@codeaurora.org, devicetree@vger.kernel.org
In-Reply-To: <1614155592-14060-2-git-send-email-skakit@codeaurora.org>
References: <1614155592-14060-1-git-send-email-skakit@codeaurora.org> <1614155592-14060-2-git-send-email-skakit@codeaurora.org>
Subject: Re: [PATCH 1/7] dt-bindings: regulator: Convert regulator bindings to YAML format
Date:   Mon, 01 Mar 2021 08:44:21 -0600
Message-Id: <1614609861.067266.37858.nullmailer@robh.at.kernel.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, 24 Feb 2021 14:03:06 +0530, satya priya wrote:
> Convert regulator bindings from .txt to .yaml format.
> 
> Signed-off-by: satya priya <skakit@codeaurora.org>
> ---
>  .../bindings/regulator/qcom,rpmh-regulator.txt     | 180 ---------------------
>  .../bindings/regulator/qcom,rpmh-regulator.yaml    | 147 +++++++++++++++++
>  2 files changed, 147 insertions(+), 180 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/regulator/qcom,rpmh-regulator.txt
>  create mode 100644 Documentation/devicetree/bindings/regulator/qcom,rpmh-regulator.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:
./Documentation/devicetree/bindings/regulator/qcom,rpmh-regulator.yaml:13:5: [warning] wrong indentation: expected 2 but found 4 (indentation)
./Documentation/devicetree/bindings/regulator/qcom,rpmh-regulator.yaml:48:5: [warning] wrong indentation: expected 2 but found 4 (indentation)
./Documentation/devicetree/bindings/regulator/qcom,rpmh-regulator.yaml:49:9: [warning] wrong indentation: expected 6 but found 8 (indentation)
./Documentation/devicetree/bindings/regulator/qcom,rpmh-regulator.yaml:50:13: [warning] wrong indentation: expected 10 but found 12 (indentation)
./Documentation/devicetree/bindings/regulator/qcom,rpmh-regulator.yaml:64:9: [warning] wrong indentation: expected 6 but found 8 (indentation)
./Documentation/devicetree/bindings/regulator/qcom,rpmh-regulator.yaml:69:9: [warning] wrong indentation: expected 6 but found 8 (indentation)
./Documentation/devicetree/bindings/regulator/qcom,rpmh-regulator.yaml:83:6: [warning] wrong indentation: expected 6 but found 5 (indentation)
./Documentation/devicetree/bindings/regulator/qcom,rpmh-regulator.yaml:89:6: [warning] wrong indentation: expected 6 but found 5 (indentation)
./Documentation/devicetree/bindings/regulator/qcom,rpmh-regulator.yaml:95:2: [warning] wrong indentation: expected 2 but found 1 (indentation)

dtschema/dtc warnings/errors:

See https://patchwork.ozlabs.org/patch/1443748

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.

