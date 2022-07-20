Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B70C657B9C3
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 Jul 2022 17:32:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240890AbiGTPc2 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 20 Jul 2022 11:32:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38994 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235271AbiGTPcJ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 20 Jul 2022 11:32:09 -0400
Received: from mail-ot1-x336.google.com (mail-ot1-x336.google.com [IPv6:2607:f8b0:4864:20::336])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6B2D864E1E
        for <linux-arm-msm@vger.kernel.org>; Wed, 20 Jul 2022 08:32:00 -0700 (PDT)
Received: by mail-ot1-x336.google.com with SMTP id k25-20020a056830169900b0061c6f68f451so14372033otr.9
        for <linux-arm-msm@vger.kernel.org>; Wed, 20 Jul 2022 08:32:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=5Gts3SkxMfRCeWEaR7qTqMqrF0wVdIlYu4fKNG/TUSM=;
        b=RWelVE9974bNp9m3pFJz7791s7qoOt7Jl8NIyojioJBSM44T6k9DYtVLZdEpF79fvf
         9WBHIkxYFDpQCod0LhpSuEfsmJsILwiLfuQ+GTYvWcONHkmyITEXGppb9z2HaRQ2XKa5
         XDlYq5W5mdjT3Suj6UcWe2AokuSqgUiPLV9rXTHMsARWI+UzXDV6kIj2dw3YVu4wPAdL
         a8P3LGSXRZHfb0EikLtkZFFepteNeYn1yzbBO/PgykZlPj0fPhbGDeTG/LfnQwDi/l6x
         rUVwt9g05KqGPa/ogBT2XmGnp/M1zr1rx+PGrMQyBInm/g+k0mZXhlrRUsnWq8Fq25Wx
         gL1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=5Gts3SkxMfRCeWEaR7qTqMqrF0wVdIlYu4fKNG/TUSM=;
        b=bqFfEZ8kn7AfC+i7MvVuN6xT41z1HwxQJaPZDPgbq55EW+JsyY9zpwDKV0l42bDwpH
         EZnZDqobPDxngK7PSddtgHUlGMYK1VxSh/JjqMQ+ClvBhDbkCwuAqjT/MFSGULzXoJX/
         jGCGLvuPuJe+Kvm56D7fzfMkxT7JbA20KGvbFq63WFa3VgQm3SZKGnLnv3kN/1ibrxiB
         e9Y5jBoy85jxbRDJiPnNmt3tP3X75h9Ia3SbFWN9SptV0AFhEJhvRI2k6CDtluzZD7Fk
         nrlM+xuuRo3Akoiy9gZ+niWyhtPvPrqqv07b6m/+oAIZuUGYajm3N+3CWPMBxAJXVRNp
         tBcQ==
X-Gm-Message-State: AJIora+iE35oXllwGQnCijj62uEC820oYrFNBKf34yNtdmCHh6Bz6GFJ
        yJER+rHUxRi84YHeSVP8/AXxWQ==
X-Google-Smtp-Source: AGRyM1sX7inWVCmOmXT72qY6COXELb48tpYUrB37O+9QgSQs/whECkwaW6oNpLLcvHmTkIgkUs+MkA==
X-Received: by 2002:a05:6830:2906:b0:60c:2d64:976 with SMTP id z6-20020a056830290600b0060c2d640976mr16226529otu.320.1658331119551;
        Wed, 20 Jul 2022 08:31:59 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id l35-20020a0568302b2300b0061ca7aa0cc8sm3053964otv.50.2022.07.20.08.31.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Jul 2022 08:31:59 -0700 (PDT)
Date:   Wed, 20 Jul 2022 10:31:57 -0500
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     Rob Herring <robh@kernel.org>, Andy Gross <agross@kernel.org>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzk@kernel.org>,
        linux-arm-msm@vger.kernel.org
Subject: Re: [GIT PULL] dt-bindings: qcom for v5.20, version 2
Message-ID: <Ytgf7ejB/2usK4uW@builder.lan>
References: <20220628092253.21905-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220628092253.21905-1-krzysztof.kozlowski@linaro.org>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue 28 Jun 04:22 CDT 2022, Krzysztof Kozlowski wrote:
[..]
> The following changes since commit f2906aa863381afb0015a9eb7fefad885d4e5a56:
> 
>   Linux 5.19-rc1 (2022-06-05 17:18:54 -0700)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux-dt.git tags/dt-bindings-qcom-5.20-2
> 
> for you to fetch changes up to 062529700fdb843eee921961eb3cbc6a51419491:
> 
>   dt-bindings: cpufreq: qcom-cpufreq-nvmem: fix board compatible in example (2022-06-28 10:28:50 +0200)
> 
> ----------------------------------------------------------------
> Devicetree bindings for Qualcomm for v5.20
> 
> Cleanup, fixes and additions of missing pieces for Qualcomm bindings.
> These are address dtbs_check warnings and do not bring new hardware
> (new compatibles are added for existing boards/hardware).
> 
> ----------------------------------------------------------------
> Krzysztof Kozlowski (25):

Many thanks for gathering these patches in a pull request!

>       dt-bindings: soc: qcom,rpmh-rsc: simplify qcom,tcs-config
>       spi: dt-bindings: qcom,spi-geni-qcom: allow three interconnects

This,

>       dt-bindings: soc: qcom: aoss: document qcom,sm8450-aoss-qmp
>       dt-bindings: soc: qcom: qcom,smd-rpm: add power-controller
>       dt-bindings: nvmem: qfprom: add IPQ8064 and SDM630 compatibles

this,

>       dt-bindings: leds: qcom-wled: fix number of addresses

this

>       dt-bindings: arm: qcom: fix Alcatel OneTouch Idol 3 compatibles
>       dt-bindings: arm: qcom: fix Longcheer L8150 compatibles
>       dt-bindings: arm: qcom: fix MSM8916 MTP compatibles
>       dt-bindings: arm: qcom: fix MSM8994 boards compatibles
>       dt-bindings: arm: qcom: add missing MSM8916 board compatibles
>       dt-bindings: arm: qcom: add missing MSM8994 board compatibles
>       dt-bindings: arm: qcom: add missing SM8150 board compatibles
>       dt-bindings: arm: qcom: add missing SM8250 board compatibles
>       dt-bindings: arm: qcom: add missing SM8350 board compatibles
>       dt-bindings: vendor-prefixes: add Shift GmbH
>       dt-bindings: arm: qcom: add missing MSM8998 board compatibles
>       dt-bindings: arm: qcom: add missing MSM8992 board compatibles
>       dt-bindings: arm: qcom: add missing QCS404 board compatibles
>       dt-bindings: arm: qcom: add missing SDM630 board compatibles
>       dt-bindings: arm: qcom: add missing SDM636 board compatibles
>       dt-bindings: arm: qcom: add missing SDM845 board compatibles
>       dt-bindings: arm: qcom: add missing SM6125 board compatibles
>       dt-bindings: arm: qcom: add missing SM6350 board compatibles
>       dt-bindings: cpufreq: qcom-cpufreq-nvmem: fix board compatible in example

and this does however need to go through respective maintainers' trees.

I've incorporated the rest in my trees now.

Thanks,
Bjorn
