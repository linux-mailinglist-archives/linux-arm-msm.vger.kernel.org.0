Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 87C17422667
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 Oct 2021 14:26:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234779AbhJEM2i (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 5 Oct 2021 08:28:38 -0400
Received: from mail-oo1-f54.google.com ([209.85.161.54]:41699 "EHLO
        mail-oo1-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234780AbhJEM2g (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 5 Oct 2021 08:28:36 -0400
Received: by mail-oo1-f54.google.com with SMTP id b5-20020a4ac285000000b0029038344c3dso6342924ooq.8;
        Tue, 05 Oct 2021 05:26:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
         :message-id;
        bh=12B425lue7e7bkxC1MmLr36fhfhw6Ghp6FxDgU81lTI=;
        b=2ZvG6cRtRoQjw9TDwvPnA1TmO7OhqJ6eaJoK+UE/2H2KxmT0yPkim3HJ0SwNxgH+Z7
         L4qfZL3FosZuTGVTVUwZ55JKyoLs9wObGO2QmDmq93cHAA0krvj0VAGxIGzH0B7t7GHk
         E/ZrHImSvCpcGnvI15KWiQrBDn+ZStyY8k6E+aQbxedRW6XejOZdoR+K0IZTiBME4+eB
         R7hGEnxcbG+u1YfMifCl0MjgwSYYXVG4WjfV2ohZCkDz3uDr+YRZd/4X2+FGMxeUtvlL
         kTf6wrQahHRAHpC3IOoTrbrBKtdpMrZwU7JEk4BNkivYetrZ+JaSx//8GE3eGhMqYQzB
         /J3A==
X-Gm-Message-State: AOAM5335Z1tshfYxBdJgSgmTYQXDvLnF9Hw7PfTztOFx54noCi97LlR0
        a4gs7jqglkDLP3ab2HPtdg==
X-Google-Smtp-Source: ABdhPJzviUxP+uSvuH4E4JBAfoTZZ7tkOF4YnI98mcMiSAVS1rlPEbdZ3k7X70uJfL7DNdiD2Hhe0w==
X-Received: by 2002:a4a:b994:: with SMTP id e20mr12894523oop.50.1633436805397;
        Tue, 05 Oct 2021 05:26:45 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id g21sm3490872ooc.31.2021.10.05.05.26.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Oct 2021 05:26:44 -0700 (PDT)
Received: (nullmailer pid 3226798 invoked by uid 1000);
        Tue, 05 Oct 2021 12:26:38 -0000
From:   Rob Herring <robh@kernel.org>
To:     Marijn Suijten <marijn.suijten@somainline.org>
Cc:     Stephen Boyd <sboyd@kernel.org>, Taniya Das <tdas@codeaurora.org>,
        Jami Kettunen <jami.kettunen@somainline.org>,
        linux-kernel@vger.kernel.org,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>,
        linux-arm-msm@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        ~postmarketos/upstreaming@lists.sr.ht,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Pavel Dubrova <pashadubrova@gmail.com>,
        Martin Botka <martin.botka@somainline.org>,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        phone-devel@vger.kernel.org
In-Reply-To: <20211004195255.701220-2-marijn.suijten@somainline.org>
References: <20211004195255.701220-1-marijn.suijten@somainline.org> <20211004195255.701220-2-marijn.suijten@somainline.org>
Subject: Re: [PATCH v5 1/2] dt-bindings: clk: qcom: Document MSM8976 Global Clock Controller
Date:   Tue, 05 Oct 2021 07:26:38 -0500
Message-Id: <1633436798.553183.3226797.nullmailer@robh.at.kernel.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, 04 Oct 2021 21:52:54 +0200, Marijn Suijten wrote:
> Document the required properties and firmware clocks for gcc-msm8976 to
> operate nominally, and add header definitions for referencing the clocks
> from firmware.
> 
> Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>
> ---
>  .../bindings/clock/qcom,gcc-msm8976.yaml      |  95 +++++++
>  include/dt-bindings/clock/qcom,gcc-msm8976.h  | 240 ++++++++++++++++++
>  2 files changed, 335 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/clock/qcom,gcc-msm8976.yaml
>  create mode 100644 include/dt-bindings/clock/qcom,gcc-msm8976.h
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/clock/qcom,gcc-msm8976.example.dt.yaml: clock-controller@1800000: 'vdd_gfx-supply' is a required property
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/clock/qcom,gcc-msm8976.yaml

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/patch/1536345

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.

