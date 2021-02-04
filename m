Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9891D30FF17
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Feb 2021 22:10:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230037AbhBDVKT (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 4 Feb 2021 16:10:19 -0500
Received: from mail-ot1-f46.google.com ([209.85.210.46]:44351 "EHLO
        mail-ot1-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229518AbhBDVKS (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 4 Feb 2021 16:10:18 -0500
Received: by mail-ot1-f46.google.com with SMTP id e70so4800463ote.11;
        Thu, 04 Feb 2021 13:10:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
         :message-id;
        bh=kDCEeeVNBxm4PZ+XUDNv/+J3MgQ6LbJpFq4H4iRKaqk=;
        b=DR6ARsbopXp5YCot7p8kCTjaBJ0d0eBLA7ADFwFsRpSvNUMA3hH5FwG1Z8IsoSwD+6
         ppbcBArJekmT60wKgMRGKKQzwfiKKR+IAm+JKThs/RgQw5ujTOyvWxGPnjJOCzOZqPHt
         vYT11zGXorz4GMl9t9zvxteJzlbgPo/wg+uJ3v4qwTDWSd8VB7FGfPDsQTLz+WjqyuNT
         5wkq3y09V0ImwBJ1xnF9tetFkXKEyfhOwfcDGjy5I+A/aTBmB1QaO67VVTdUUHMuZJFO
         PpFwFOL6yyVvAanW9i5TyCxdkHwScJz1nmsaQfXbZqDoBZ7nDNRxqcQPjV6VbAazRbpY
         nJHA==
X-Gm-Message-State: AOAM533jdu25OiqoK1WMduDJUzKWxI2CtnntscM6IhwhGJOOkrmpt988
        nC2RWpA9iyB2aJ110YhSQw==
X-Google-Smtp-Source: ABdhPJzzXqbwqmE12QzS0yfeLW64QI9YDIx5wLA6mfngOwRiUqdGhd6bvA+euThEIUmL7CssCFXRxQ==
X-Received: by 2002:a9d:674f:: with SMTP id w15mr993190otm.88.1612472977321;
        Thu, 04 Feb 2021 13:09:37 -0800 (PST)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id y17sm1326755oie.7.2021.02.04.13.09.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Feb 2021 13:09:36 -0800 (PST)
Received: (nullmailer pid 1070128 invoked by uid 1000);
        Thu, 04 Feb 2021 21:09:35 -0000
From:   Rob Herring <robh@kernel.org>
To:     Maulik Shah <mkshah@codeaurora.org>
Cc:     lsrao@codeaurora.org, linux-arm-msm@vger.kernel.org,
        mka@chromium.org, linux-kernel@vger.kernel.org, agross@kernel.org,
        linux@roeck-us.net, devicetree@vger.kernel.org,
        dianders@chromium.org, ilina@codeaurora.org,
        Mahesh Sivasubramanian <msivasub@codeaurora.org>,
        swboyd@chromium.org, bjorn.andersson@linaro.org,
        evgreen@chromium.org, rnayak@codeaurora.org
In-Reply-To: <1612448508-9179-2-git-send-email-mkshah@codeaurora.org>
References: <1612448508-9179-1-git-send-email-mkshah@codeaurora.org> <1612448508-9179-2-git-send-email-mkshah@codeaurora.org>
Subject: Re: [PATCH v6 1/4] dt-bindings: Introduce SoC sleep stats bindings
Date:   Thu, 04 Feb 2021 15:09:35 -0600
Message-Id: <1612472975.265026.1070127.nullmailer@robh.at.kernel.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, 04 Feb 2021 19:51:45 +0530, Maulik Shah wrote:
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
>  .../bindings/soc/qcom/soc-sleep-stats.yaml         | 46 ++++++++++++++++++++++
>  1 file changed, 46 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/soc/qcom/soc-sleep-stats.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/soc/qcom/soc-sleep-stats.yaml: 'additionalProperties' is a required property
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/soc/qcom/soc-sleep-stats.yaml: ignoring, error in schema: 
warning: no schema found in file: ./Documentation/devicetree/bindings/soc/qcom/soc-sleep-stats.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/soc/qcom/soc-sleep-stats.example.dt.yaml: example-0: rpmh-sleep-stats@c3f0000:reg:0: [0, 205455360, 0, 1024] is too long
	From schema: /usr/local/lib/python3.8/dist-packages/dtschema/schemas/reg.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/soc/qcom/soc-sleep-stats.example.dt.yaml: example-1: rpm-sleep-stats@4690000:reg:0: [0, 73990144, 0, 1024] is too long
	From schema: /usr/local/lib/python3.8/dist-packages/dtschema/schemas/reg.yaml

See https://patchwork.ozlabs.org/patch/1436034

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.

