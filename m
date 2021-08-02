Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D03153DD75A
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Aug 2021 15:39:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234003AbhHBNkG (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 2 Aug 2021 09:40:06 -0400
Received: from mail-il1-f179.google.com ([209.85.166.179]:43686 "EHLO
        mail-il1-f179.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234032AbhHBNkF (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 2 Aug 2021 09:40:05 -0400
Received: by mail-il1-f179.google.com with SMTP id x7so13111533ilh.10;
        Mon, 02 Aug 2021 06:39:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
         :message-id;
        bh=TENNApnA3pRK87RRsfp5wpxG2YcnGhsJlA20WbVifLk=;
        b=HswowOqsvG5bejucUm8i5rR1YCKkLAOALcRD/UyxWYWC0C+qwwrScFgG6BjiLmdR3X
         j58yRYfI78iLnIRZbZoZbil39ORVlTz2qKWdzb2NKiJIF4jFMwmSF0Pa13/XVFtZHLSX
         X67h7TrjzEMB7AwuK4RM4VqIHClHiUnLVCA9MWxPA/LTNuIL/UQxCgt4exyru4gvEMbS
         j+KiRm6wHq+c6xQcWYBgxd+mWxL3YeNSoUwnZD+Q18wLMMJeDceHMH5eBZp2HMG+3gcs
         td29jC0BqQVseq0WodkearWjjZY2YYhUGdLWHDrUDHCkfT6j+z94zB5ui3p+2h6KeBrp
         6Tmw==
X-Gm-Message-State: AOAM533mnS140ohCI+HTaPtFd2mzKlwRs4ENUJv9EO0CstVDPCeePr90
        Wf5aHIWZmnnDrshaApxPFw==
X-Google-Smtp-Source: ABdhPJzfosP56bJdNxD4Ijzp2ZlTM+40hrVsN+FY9mSl/e1GMizabh/TW6EXI++5V3KCEafHRE7mkw==
X-Received: by 2002:a05:6e02:1bcc:: with SMTP id x12mr1141093ilv.275.1627911594639;
        Mon, 02 Aug 2021 06:39:54 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
        by smtp.gmail.com with ESMTPSA id q7sm7459028iow.12.2021.08.02.06.39.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Aug 2021 06:39:54 -0700 (PDT)
Received: (nullmailer pid 918766 invoked by uid 1000);
        Mon, 02 Aug 2021 13:39:43 -0000
From:   Rob Herring <robh@kernel.org>
To:     Iskren Chernev <iskren.chernev@gmail.com>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, phone-devel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-kernel@vger.kernel.org
In-Reply-To: <20210801103448.3329333-2-iskren.chernev@gmail.com>
References: <20210801103448.3329333-1-iskren.chernev@gmail.com> <20210801103448.3329333-2-iskren.chernev@gmail.com>
Subject: Re: [PATCH v3 1/2] dt-bindings: clk: qcom: gcc-sm6115: Document SM6115 GCC
Date:   Mon, 02 Aug 2021 07:39:43 -0600
Message-Id: <1627911583.087441.918765.nullmailer@robh.at.kernel.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sun, 01 Aug 2021 13:34:47 +0300, Iskren Chernev wrote:
> Add device tree bindings for global clock controller on SM6115 and
> SM4250 SoCs (pin and software compatible).
> 
> Signed-off-by: Iskren Chernev <iskren.chernev@gmail.com>
> ---
>  .../bindings/clock/qcom,gcc-sm6115.yaml       |  74 +++++++
>  include/dt-bindings/clock/qcom,gcc-sm6115.h   | 201 ++++++++++++++++++
>  2 files changed, 275 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/clock/qcom,gcc-sm6115.yaml
>  create mode 100644 include/dt-bindings/clock/qcom,gcc-sm6115.h
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/clock/qcom,gcc-sm6115.example.dt.yaml: clock-controller@1400000: clocks: [[4294967295, 0], [4294967295]] is too short
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/clock/qcom,gcc-sm6115.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/clock/qcom,gcc-sm6115.example.dt.yaml: clock-controller@1400000: clock-names: ['bi_tcxo', 'sleep_clk'] is too short
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/clock/qcom,gcc-sm6115.yaml
\ndoc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/patch/1512028

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.

