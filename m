Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6C92745A7FA
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Nov 2021 17:34:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235834AbhKWQh7 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 23 Nov 2021 11:37:59 -0500
Received: from mail-io1-f45.google.com ([209.85.166.45]:46654 "EHLO
        mail-io1-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234175AbhKWQhy (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 23 Nov 2021 11:37:54 -0500
Received: by mail-io1-f45.google.com with SMTP id x6so6946666iol.13;
        Tue, 23 Nov 2021 08:34:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
         :message-id;
        bh=S/Nde44oeUhb7hSJ7kbhEXm+wq52G5N4BXF/4ZQG150=;
        b=wpdNW8Kk6Rp7XvEvl1gtgGwfFWMz6+Wb5QfMEAomZJl1KKHaXuGwhBpg7Ne+9e5/0m
         6UxbW/WBmXbyLCijHv1jpRnI6FtABPh/G0zXPfYYL2xMn71SNFep7hVHwMxHPVT1KubA
         QAUkNjNxJzMJ7BFUL1JvzVgmoLnKKlKX5SsKjyyH1gT66AdGPXJLyj1H8uYbK6vi3bjG
         S7KJNUn3eJyX5o/0GgPD6bYV6LA+r94Ug+FdcTyzl3xFwWXPw1nrWkA8j4LNNPtXdFYG
         b6OMHOq13J8xC2saJRqXXWz9zypF4iWV0HexIsfQwZ0JnGYiBq7S/+V1cwZ6j1WoBSLD
         ydMw==
X-Gm-Message-State: AOAM530vsWbGNAu9Nawd8ZrS8bjSIX0Jh/aMW/imJiMVeM2gFJRDX8FT
        SWpcrf4OHU34SzSrbLA72w==
X-Google-Smtp-Source: ABdhPJxY9LI3xE3uj4uGqRDh0ZTL7igLEhH7Y3XAJLEdoLGp1dS+1WAAgwPxTdmQNcb5QXHWLl91qg==
X-Received: by 2002:a05:6602:3d3:: with SMTP id g19mr942776iov.104.1637685284901;
        Tue, 23 Nov 2021 08:34:44 -0800 (PST)
Received: from robh.at.kernel.org ([64.188.179.248])
        by smtp.gmail.com with ESMTPSA id p14sm8656867ilo.39.2021.11.23.08.34.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Nov 2021 08:34:44 -0800 (PST)
Received: (nullmailer pid 3442908 invoked by uid 1000);
        Tue, 23 Nov 2021 16:34:29 -0000
From:   Rob Herring <robh@kernel.org>
To:     Souradeep Chowdhury <schowdhu@codeaurora.org>
Cc:     rnayak@codeaurora.org, devicetree@vger.kernel.org,
        pheragu@codeaurora.org, satyap@codeaurora.org,
        linux-kernel@vger.kernel.org, sibis@codeaurora.org,
        pure.logic@nexus-software.ie, psodagud@codeaurora.org,
        tsoni@codeaurora.org, quic_schowdhu@quicinc.com,
        linux-usb@vger.kernel.org, saiprakash.ranjan@codeaurora.org,
        bjorn.andersson@linaro.org, greg@kroah.com,
        linux-arm-msm@vger.kernel.org
In-Reply-To: <472de38309fd5d773f903f7a0cfb4440ae1dd380.1637639009.git.schowdhu@codeaurora.org>
References: <cover.1637639009.git.schowdhu@codeaurora.org> <472de38309fd5d773f903f7a0cfb4440ae1dd380.1637639009.git.schowdhu@codeaurora.org>
Subject: Re: [PATCH V1 1/8] dt-bindings: Add the yaml bindings for EUD
Date:   Tue, 23 Nov 2021 09:34:29 -0700
Message-Id: <1637685269.640239.3442907.nullmailer@robh.at.kernel.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, 23 Nov 2021 09:58:19 +0530, Souradeep Chowdhury wrote:
> Documentation for Embedded USB Debugger(EUD) device tree
> bindings in yaml format.
> 
> Signed-off-by: Souradeep Chowdhury <schowdhu@codeaurora.org>
> ---
>  .../devicetree/bindings/soc/qcom/qcom,eud.yaml     | 52 ++++++++++++++++++++++
>  1 file changed, 52 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/soc/qcom/qcom,eud.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/soc/qcom/qcom,eud.example.dt.yaml: example-0: eud@88e0000:reg:0: [0, 143523840, 0, 8192] is too long
	From schema: /usr/local/lib/python3.8/dist-packages/dtschema/schemas/reg.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/soc/qcom/qcom,eud.example.dt.yaml: example-0: eud@88e0000:reg:1: [0, 143532032, 0, 4096] is too long
	From schema: /usr/local/lib/python3.8/dist-packages/dtschema/schemas/reg.yaml

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/patch/1558347

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.

