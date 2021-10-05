Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 06BED42266E
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 Oct 2021 14:26:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234875AbhJEM2r (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 5 Oct 2021 08:28:47 -0400
Received: from mail-ot1-f48.google.com ([209.85.210.48]:44631 "EHLO
        mail-ot1-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234732AbhJEM2j (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 5 Oct 2021 08:28:39 -0400
Received: by mail-ot1-f48.google.com with SMTP id h9-20020a9d2f09000000b005453f95356cso25595567otb.11;
        Tue, 05 Oct 2021 05:26:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
         :message-id;
        bh=w/FK/ML78245XHAIchDVDOq8/sxzIBzb2YgmaSlt68M=;
        b=BNmj+N/ixDvm9UXW0KHDpUe09qO1ZqlJseu17K0pNM7Hp+6EjLtsyRxsApGJltf8iQ
         Scjv2h8eBupi9FmJoBJuG1vOnyQRKQaBRCshZw80Yo2tYQCWzwX6BPWaod46+2HQc9hL
         VQIaogH66m+Wu1LTrXERb0eANEDHtVcKJckyACCZz3OVffv8O7Y6YRZ+HQazrsEqi71I
         0GtBHIW1XLl6DIfr9BdJBZmbJpTaeneuUWDVk5Fl6jWczZWf5kUCS4zk5bP+wBnGUJVt
         7JgAfl0EtECVSesQ9l1VJYay0Es1m/zDNX2WOhAe99zxOMODMcEDR2OKU8n0sFAi3bkw
         SLnw==
X-Gm-Message-State: AOAM533XquHuVScvQaos+QVpBzYiPJy1c/QqTjBXaFwOmmE6IEaOBSoA
        QZ8vEhTPIrldL/yb/bhW9g==
X-Google-Smtp-Source: ABdhPJysfIpY+AlZGPd1aq069xpRzqdiEWvovmqueORSOfYiFbk/wJ4mm+HHZh3UGFbHFe4HlLF1Mg==
X-Received: by 2002:a05:6830:1bc6:: with SMTP id v6mr13950334ota.299.1633436808863;
        Tue, 05 Oct 2021 05:26:48 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id h26sm3505109otn.67.2021.10.05.05.26.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Oct 2021 05:26:48 -0700 (PDT)
Received: (nullmailer pid 3226814 invoked by uid 1000);
        Tue, 05 Oct 2021 12:26:38 -0000
From:   Rob Herring <robh@kernel.org>
To:     Maulik Shah <mkshah@codeaurora.org>
Cc:     devicetree@vger.kernel.org, bjorn.andersson@linaro.org,
        evgreen@chromium.org, agross@kernel.org, swboyd@chromium.org,
        linux-arm-msm@vger.kernel.org, Lina Iyer <ilina@codeaurora.org>,
        dianders@chromium.org,
        Mahesh Sivasubramanian <msivasub@codeaurora.org>,
        mka@chromium.org, rnayak@codeaurora.org, linux@roeck-us.net,
        lsrao@codeaurora.org, linux-kernel@vger.kernel.org
In-Reply-To: <1633425065-7927-2-git-send-email-mkshah@codeaurora.org>
References: <1633425065-7927-1-git-send-email-mkshah@codeaurora.org> <1633425065-7927-2-git-send-email-mkshah@codeaurora.org>
Subject: Re: [PATCH v10 1/5] dt-bindings: Introduce SoC sleep stats bindings
Date:   Tue, 05 Oct 2021 07:26:38 -0500
Message-Id: <1633436798.669118.3226812.nullmailer@robh.at.kernel.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, 05 Oct 2021 14:41:01 +0530, Maulik Shah wrote:
> From: Mahesh Sivasubramanian <msivasub@codeaurora.org>
> 
> Add device binding documentation for Qualcomm Technologies, Inc. (QTI)
> SoC sleep stats driver. The driver is used for displaying SoC sleep
> statistic maintained by Always On Processor or Resource Power Manager.
> 
> Cc: devicetree@vger.kernel.org
> Signed-off-by: Mahesh Sivasubramanian <msivasub@codeaurora.org>
> Signed-off-by: Lina Iyer <ilina@codeaurora.org>
> Signed-off-by: Maulik Shah <mkshah@codeaurora.org>
> Reviewed-by: Rob Herring <robh@kernel.org>
> Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> Reviewed-by: Stephen Boyd <swboyd@chromium.org>
> ---
>  .../bindings/soc/qcom/soc-sleep-stats.yaml         | 47 ++++++++++++++++++++++
>  1 file changed, 47 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/soc/qcom/soc-sleep-stats.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/soc/qcom/soc-sleep-stats.example.dt.yaml: memory@c3f0000: 'device_type' is a required property
	From schema: /usr/local/lib/python3.8/dist-packages/dtschema/schemas/memory.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/soc/qcom/soc-sleep-stats.example.dt.yaml: memory@4690000: 'device_type' is a required property
	From schema: /usr/local/lib/python3.8/dist-packages/dtschema/schemas/memory.yaml

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/patch/1536587

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.

