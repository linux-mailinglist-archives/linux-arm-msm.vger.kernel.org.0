Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5C0E73FB4CB
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Aug 2021 13:49:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236463AbhH3LuG (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 30 Aug 2021 07:50:06 -0400
Received: from mail-ot1-f49.google.com ([209.85.210.49]:46912 "EHLO
        mail-ot1-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236434AbhH3LuG (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 30 Aug 2021 07:50:06 -0400
Received: by mail-ot1-f49.google.com with SMTP id v33-20020a0568300921b0290517cd06302dso17941354ott.13;
        Mon, 30 Aug 2021 04:49:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
         :message-id;
        bh=JabMds8rlTqzaFVY57dtROBNgjZw2GgQgB2Qb6t5/ns=;
        b=kF9BVL9s/e9VDzZp289mr3JZoQ7aGF9o/1rdXYG0siGPoos64C0qg5+t8xeRlheWmI
         +rFUhglQvlBm6T+Hf3uF8RyVYJiB7FYQ5N8iX1Auhr4+fU7OAou/mWRPBw+HXd7nfji/
         6him0dquhJ7VvYMz0xaoD7tEFOWInihEn7qfv6J5EXjV11D0q/3DqLbhqiSU1iNmIyJa
         qKo3tBC6Eb50UYhLpEs8YFg3t7msXCsHNjTrLsbRlJpMck1p2CN+mGUhGjWAjoXxSolI
         qgEFm1VlFSzrag23InEqAb4f+a3Nw0M1ZeCHPuXyfdfq6MCwn7knfaTJoQdx13xEaCQn
         GPyA==
X-Gm-Message-State: AOAM530yn54qSX9j5VPre1VxlD2gvis02ndzMibm+mhFmnCdPEZWOSyu
        89od/7YMCHpsmYX9mNl69w==
X-Google-Smtp-Source: ABdhPJxCLJ/yib0AOP+DL1a/lRsjMNJ6RDrdZQNNBtWLnSUpCjSeNRI4mOsfXmR11mHZddEmz9UYUA==
X-Received: by 2002:a9d:5a6:: with SMTP id 35mr18050354otd.256.1630324152528;
        Mon, 30 Aug 2021 04:49:12 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id q31sm3129438otv.57.2021.08.30.04.49.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Aug 2021 04:49:12 -0700 (PDT)
Received: (nullmailer pid 1731752 invoked by uid 1000);
        Mon, 30 Aug 2021 11:49:10 -0000
From:   Rob Herring <robh@kernel.org>
To:     Konrad Dybcio <konrad.dybcio@somainline.org>
Cc:     devicetree@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>,
        jamipkettunen@somainline.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Taniya Das <tdas@codeaurora.org>, linux-kernel@vger.kernel.org,
        angelogioacchino.delregno@somainline.org,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>, linux-clk@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht,
        Andy Gross <agross@kernel.org>, martin.botka@somainline.org,
        marijn.suijten@somainline.org
In-Reply-To: <20210829193617.4105-1-konrad.dybcio@somainline.org>
References: <20210829193617.4105-1-konrad.dybcio@somainline.org>
Subject: Re: [PATCH RESEND v2 1/9] dt-bindings: clk: qcom: Add bindings for MSM8994 GCC driver
Date:   Mon, 30 Aug 2021 06:49:10 -0500
Message-Id: <1630324150.916431.1731751.nullmailer@robh.at.kernel.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sun, 29 Aug 2021 21:36:08 +0200, Konrad Dybcio wrote:
> Add documentation for the MSM8994 GCC driver.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@somainline.org>
> Acked-by: Rob Herring <robh@kernel.org>
> ---
> No changes since the original v2, only added Rob's A-b
> 
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

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/patch/1522007

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.

