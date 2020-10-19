Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1DE20292EF8
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 Oct 2020 21:56:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727207AbgJST4B (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 19 Oct 2020 15:56:01 -0400
Received: from mail-oi1-f195.google.com ([209.85.167.195]:45918 "EHLO
        mail-oi1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726422AbgJST4A (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 19 Oct 2020 15:56:00 -0400
Received: by mail-oi1-f195.google.com with SMTP id j7so1261001oie.12;
        Mon, 19 Oct 2020 12:56:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=P/hTg4j4NaSRwrdCd+DFfZAfoiwbN1y8Dh2wP+0FigI=;
        b=MndC/grpYbIfmu8MmXgGHPZiaSlH39IUmvIiMfjc/4067VO5YqLncgc4ooICAf925l
         h6/NOCb3IlvPm1Ji/j2Tx/6qog9P1WjDfoKwnlOJO+mm/PR+sDIProM0Fs+/r37Ktgku
         IaACLoz/FkR4wxtwYlLUi+zBy0j+L7YHjCuA3y8QPsdlfecDeTa2KWYp9UF5aDGePYe7
         5eyqQ5q8uvsqXxnJyec4B6p270hXB7IhxL+5fdx7D9OryBUQMdFKh2rAALaD2SN/pAjq
         I73Ps6F4TpbLMqmBaqXvXpGrEKuwOYqYBao6yWs4EPS8hRL5pEqKB95dDqbqsWH1t6Wd
         7oBA==
X-Gm-Message-State: AOAM531nZpWJIa4gVYovun2Xe5tSedJ1Ws79wsW/4A2LKQ9eURBrIHFg
        59KTKUHHEbrpTEqYsIqODw==
X-Google-Smtp-Source: ABdhPJxWMhPVQ4+qR3gBGct37t/NumgtkOrYc23xtnFrVyEq+nJAoVSsOymUMmxITkyNKIEaEadwoQ==
X-Received: by 2002:a54:4194:: with SMTP id 20mr713571oiy.137.1603137359992;
        Mon, 19 Oct 2020 12:55:59 -0700 (PDT)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id y5sm257437ool.30.2020.10.19.12.55.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2020 12:55:59 -0700 (PDT)
Received: (nullmailer pid 3505541 invoked by uid 1000);
        Mon, 19 Oct 2020 19:55:58 -0000
Date:   Mon, 19 Oct 2020 14:55:58 -0500
From:   Rob Herring <robh@kernel.org>
To:     Evan Green <evgreen@chromium.org>
Cc:     Douglas Anderson <dianders@chromium.org>,
        devicetree@vger.kernel.org, Stephen Boyd <swboyd@chromium.org>,
        Andy Gross <agross@kernel.org>, linux-kernel@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: Re: [PATCH v2 1/4] dt-bindings: nvmem: Add soc qfprom compatible
 strings
Message-ID: <20201019195558.GA3504432@bogus>
References: <20201016192654.32610-1-evgreen@chromium.org>
 <20201016122559.v2.1.I8b447ca96abfbef5f298d77350e6c9d1d18d00f6@changeid>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201016122559.v2.1.I8b447ca96abfbef5f298d77350e6c9d1d18d00f6@changeid>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, 16 Oct 2020 12:26:51 -0700, Evan Green wrote:
> Add SoC-specific compatible strings so that data can be attached
> to it in the driver.
> 
> Signed-off-by: Evan Green <evgreen@chromium.org>
> ---
> 
> Changes in v2:
>  - Add other soc compatible strings (Doug)
>  - Fix compatible string definition (Doug)
> 
>  .../devicetree/bindings/nvmem/qcom,qfprom.yaml      | 13 ++++++++++++-
>  1 file changed, 12 insertions(+), 1 deletion(-)
> 


My bot found errors running 'make dt_binding_check' on your patch:

/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/nvmem/qcom,qfprom.example.dt.yaml: efuse@784000: compatible:0: 'qcom,qfprom' is not one of ['qcom,apq8064-qfprom', 'qcom,apq8084-qfprom', 'qcom,msm8974-qfprom', 'qcom,msm8916-qfprom', 'qcom,msm8996-qfprom', 'qcom,msm8998-qfprom', 'qcom,qcs404-qfprom', 'qcom,sc7180-qfprom', 'qcom,sdm845-qfprom']
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/nvmem/qcom,qfprom.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/nvmem/qcom,qfprom.example.dt.yaml: efuse@784000: compatible: ['qcom,qfprom'] is too short
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/nvmem/qcom,qfprom.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/nvmem/qcom,qfprom.example.dt.yaml: efuse@784000: compatible:0: 'qcom,qfprom' is not one of ['qcom,apq8064-qfprom', 'qcom,apq8084-qfprom', 'qcom,msm8974-qfprom', 'qcom,msm8916-qfprom', 'qcom,msm8996-qfprom', 'qcom,msm8998-qfprom', 'qcom,qcs404-qfprom', 'qcom,sc7180-qfprom', 'qcom,sdm845-qfprom']
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/nvmem/qcom,qfprom.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/nvmem/qcom,qfprom.example.dt.yaml: efuse@784000: compatible: ['qcom,qfprom'] is too short
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/nvmem/qcom,qfprom.yaml


See https://patchwork.ozlabs.org/patch/1383520

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure dt-schema is up to date:

pip3 install git+https://github.com/devicetree-org/dt-schema.git@master --upgrade

Please check and re-submit.

