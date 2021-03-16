Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DDD4F33DB8D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Mar 2021 18:55:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239341AbhCPRys (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 16 Mar 2021 13:54:48 -0400
Received: from mail-io1-f47.google.com ([209.85.166.47]:45769 "EHLO
        mail-io1-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239364AbhCPRyT (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 16 Mar 2021 13:54:19 -0400
Received: by mail-io1-f47.google.com with SMTP id a7so38107702iok.12;
        Tue, 16 Mar 2021 10:54:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
         :message-id;
        bh=nPCe2pWHJBs2omsExRt0WS0Aom9BtYjVqvEnEmMiJSo=;
        b=XRzgi924kXQoOgg3WfSSuDu5t3NW/tEZkPW35mSD5yORFeu6p3ShncRrw8BSPWbUiN
         64JtSXW4McslX+hiZ0abwO1vbNks1r1jvieSn2j0mnW9lh4SG29vhJ79ZsDf0tsjehnc
         RxRCWzcVMXFwLvyaSB7wr9iedQ78wXEhreVf0GkwNQxK9l6iETSEGfTxNrSL+WzpBRNg
         ss9rpanFYJ74/NjwfJchjQENzxtO9UW8/OcxwAwqWTn2sANxSxj7Vf1q5ozcC+w1u8py
         ofXgiiVb2qvJP1CihikjMnGnO/GsKYkCNwqdlW5dT84wOQRLY4PDYHQ0EYaFmRJsM7RG
         7/Ag==
X-Gm-Message-State: AOAM532QsrPAEg27gApFbyBd8hxSZnoWuhz9Jrj0OVvMHtgqlMZ5VETr
        +k2OLccjjEM/XM3MpY9GDA==
X-Google-Smtp-Source: ABdhPJzl3o8G/UcXREEFWDlU5Y5mDjQ2mG47axCBmFh0qU0v7sR7POdBm08dc/9pW76tGCI3Qv4cFw==
X-Received: by 2002:a6b:b415:: with SMTP id d21mr4251015iof.149.1615917258833;
        Tue, 16 Mar 2021 10:54:18 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.253])
        by smtp.gmail.com with ESMTPSA id u5sm9092435iob.8.2021.03.16.10.54.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Mar 2021 10:54:18 -0700 (PDT)
Received: (nullmailer pid 3326121 invoked by uid 1000);
        Tue, 16 Mar 2021 17:54:09 -0000
From:   Rob Herring <robh@kernel.org>
To:     satya priya <skakit@codeaurora.org>
Cc:     David Collins <collinsd@codeaurora.org>,
        devicetree@vger.kernel.org, kgunda@codeaurora.org,
        rnayak@codeaurora.org, Mark Brown <broonie@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>, mka@chromium.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>
In-Reply-To: <1615816454-1733-5-git-send-email-skakit@codeaurora.org>
References: <1615816454-1733-1-git-send-email-skakit@codeaurora.org> <1615816454-1733-5-git-send-email-skakit@codeaurora.org>
Subject: Re: [PATCH V2 4/5] dt-bindings: regulator: Convert regulator bindings to YAML format
Date:   Tue, 16 Mar 2021 11:54:09 -0600
Message-Id: <1615917249.223984.3326120.nullmailer@robh.at.kernel.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, 15 Mar 2021 19:24:13 +0530, satya priya wrote:
> Convert regulator bindings from .txt to .yaml format.
> 
> Signed-off-by: satya priya <skakit@codeaurora.org>
> ---
> Changes in V2:
>  - As per Mark's comment moved this patch to the end of series.
>  - As per Rob's comments,  added flash and rgb bindings, dropped allOf and
>    unused labels and fixed few other things.
> 
>  .../bindings/regulator/qcom,rpmh-regulator.txt     | 180 ---------------------
>  .../bindings/regulator/qcom,rpmh-regulator.yaml    | 158 ++++++++++++++++++
>  2 files changed, 158 insertions(+), 180 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/regulator/qcom,rpmh-regulator.txt
>  create mode 100644 Documentation/devicetree/bindings/regulator/qcom,rpmh-regulator.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:
./Documentation/devicetree/bindings/regulator/qcom,rpmh-regulator.yaml:111:2: [warning] wrong indentation: expected 2 but found 1 (indentation)

dtschema/dtc warnings/errors:

See https://patchwork.ozlabs.org/patch/1453283

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.

