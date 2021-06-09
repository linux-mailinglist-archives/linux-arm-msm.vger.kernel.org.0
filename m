Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5FE663A1AAF
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Jun 2021 18:16:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236678AbhFIQSq (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 9 Jun 2021 12:18:46 -0400
Received: from mail-oi1-f172.google.com ([209.85.167.172]:37631 "EHLO
        mail-oi1-f172.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231842AbhFIQSq (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 9 Jun 2021 12:18:46 -0400
Received: by mail-oi1-f172.google.com with SMTP id h9so25623557oih.4;
        Wed, 09 Jun 2021 09:16:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
         :message-id;
        bh=mWk3u4y9PCnukQNdZz3+rIhPiKsxMQw70OyupJtz0A0=;
        b=QCHQI3oCvg2Aq3YBOd5udu9TtsPFNhDoZQmfr/4U7wbfBCpSZClGJkHXN5CRXeEa1v
         jVkwhGZj/vhT7sUW0X6gCCgeUVlbzr1V58oOzu4A7j9eDBlapRITNnyQl3L/cR/WdElF
         k7D1mZAc6NN9YX4hDuTS1MAUpGq9hTxfvb9wftO7FraPYSUEEPemZf1596jWgrFOyQfZ
         UJy68yYskyBwcd2bHOZXqm3guRov64Lau6C3tiJusILhGB4qe29YLx95l0Ekq4Lg6xw4
         YurmJcR/ojbwJ2a/oKtbiQIb6YDM9+0MQWvfpi1wp10fbNGxvTAAtus1S0Xje63D2eLh
         r1kg==
X-Gm-Message-State: AOAM531m23DM/R8fsh3GpwRQD+/EZvHrugaUIufIH+or28hmyEOkYfc2
        yA1Za0+XBHWE0jmFvHKGNwVXXNiyew==
X-Google-Smtp-Source: ABdhPJzLntfzoFvge8MQtjBfDnp9NEYq1S2avbXpztqhS6+KyPh6p4egqutlpMkKSGIOmteq7KSW8g==
X-Received: by 2002:aca:33d4:: with SMTP id z203mr7013522oiz.51.1623255411326;
        Wed, 09 Jun 2021 09:16:51 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id 21sm90962otd.21.2021.06.09.09.16.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Jun 2021 09:16:50 -0700 (PDT)
Received: (nullmailer pid 3763300 invoked by uid 1000);
        Wed, 09 Jun 2021 16:16:43 -0000
From:   Rob Herring <robh@kernel.org>
To:     Konrad Dybcio <konrad.dybcio@somainline.org>
Cc:     martin.botka@somainline.org, Taniya Das <tdas@codeaurora.org>,
        linux-clk@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        marijn.suijten@somainline.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Andy Gross <agross@kernel.org>,
        jamipkettunen@somainline.org,
        Michael Turquette <mturquette@baylibre.com>,
        ~postmarketos/upstreaming@lists.sr.ht,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org,
        angelogioacchino.delregno@somainline.org
In-Reply-To: <20210609145523.467090-1-konrad.dybcio@somainline.org>
References: <20210609145523.467090-1-konrad.dybcio@somainline.org>
Subject: Re: [PATCH v2 1/9] dt-bindings: clk: qcom: Add bindings for MSM8994 GCC driver
Date:   Wed, 09 Jun 2021 11:16:43 -0500
Message-Id: <1623255403.638061.3763299.nullmailer@robh.at.kernel.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, 09 Jun 2021 16:55:13 +0200, Konrad Dybcio wrote:
> Add documentation for the MSM8994 GCC driver.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@somainline.org>
> ---
>  .../bindings/clock/qcom,gcc-msm8994.yaml      | 72 +++++++++++++++++++
>  1 file changed, 72 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/clock/qcom,gcc-msm8994.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/clock/qcom,gcc-msm8994.example.dt.yaml: clock-controller@300000: 'clock-names', 'clocks' do not match any of the regexes: 'pinctrl-[0-9]+'
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/clock/qcom,gcc.yaml
\ndoc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/patch/1489930

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.

