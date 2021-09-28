Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0D06841AEFC
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Sep 2021 14:28:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240627AbhI1M37 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 28 Sep 2021 08:29:59 -0400
Received: from mail-ot1-f43.google.com ([209.85.210.43]:35648 "EHLO
        mail-ot1-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240610AbhI1M37 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 28 Sep 2021 08:29:59 -0400
Received: by mail-ot1-f43.google.com with SMTP id 77-20020a9d0ed3000000b00546e10e6699so28734554otj.2;
        Tue, 28 Sep 2021 05:28:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
         :message-id;
        bh=HzAZ/T3R+PH8bgPxuKvTGOSJkQIkRR+vx63M18LOtQc=;
        b=IXpHqqL02P5+YpTfhoxtVfZF3hy2D41RiZCsiVvkdQ8KvucyO/2twdUjMBIxp4kkSO
         3hCe7M3yMOEbjqYCWoYv8niQ2Glg2a6nua8ZGTvOPhiptYTQ2Mi7pb2cVq4PIxZ13SZU
         64g1uQrcn8Xl2pPwqd8nPLGrBcdMdRYlTrPrRkZPanlkaCtsIu2EXSsqsFkFGqdse02o
         l4WTAeNBbfsrU7Zbh+JwytthnQJt7xkV7i/cs+DqHY+gyAy2Hib88Jg4nsTnocBQHrPd
         ALmkgJFPFUsEFUSfQJ7rMnsVbFFS7ZdCAnWYZw+VBFbIL8/KPX7PijR3Qm8qP+ZaC4gJ
         mktg==
X-Gm-Message-State: AOAM530jD+k0GDRc9+UitkjjuAEWaHwnNezny0g4Xej8z1U0fHXh7xZJ
        O5J8zZgiQ/aevYbTPcXSlA==
X-Google-Smtp-Source: ABdhPJxVIrmxKPlTwA7wEdAtl66dHAN0QACL6JJR7dP8LaFI8FqpE7dEQViPIRV461RJgTN5q8H47A==
X-Received: by 2002:a9d:20aa:: with SMTP id x39mr4788921ota.292.1632832099904;
        Tue, 28 Sep 2021 05:28:19 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id y12sm4507502otu.11.2021.09.28.05.28.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Sep 2021 05:28:19 -0700 (PDT)
Received: (nullmailer pid 963813 invoked by uid 1000);
        Tue, 28 Sep 2021 12:28:18 -0000
From:   Rob Herring <robh@kernel.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Andy Gross <agross@kernel.org>, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>,
        devicetree@vger.kernel.org
In-Reply-To: <20210928044546.4111223-1-bjorn.andersson@linaro.org>
References: <20210928044546.4111223-1-bjorn.andersson@linaro.org>
Subject: Re: [PATCH 1/3] dt-bindings: soc: smem: Make indirection optional
Date:   Tue, 28 Sep 2021 07:28:18 -0500
Message-Id: <1632832098.523897.963812.nullmailer@robh.at.kernel.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, 27 Sep 2021 21:45:44 -0700, Bjorn Andersson wrote:
> In the olden days the Qualcomm shared memory (SMEM) region consisted of
> multiple chunks of memory, so SMEM was described as a standalone node
> with references to its various memory regions.
> 
> But practically all modern Qualcomm platforms has a single reserved memory
> region used for SMEM. So rather than having to use two nodes to describe
> the one SMEM region, update the binding to allow the reserved-memory
> region alone to describe SMEM.
> 
> The olden format is preserved as valid, as this is widely used already.
> 
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---
>  .../bindings/soc/qcom/qcom,smem.yaml          | 34 ++++++++++++++++---
>  1 file changed, 30 insertions(+), 4 deletions(-)
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Documentation/devicetree/bindings/soc/qcom/qcom,smem.example.dt.yaml:0:0: /example-1/soc/sram@fc428000: failed to match any schema with compatible: ['qcom,rpm-msg-ram']

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/patch/1533702

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.

