Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 73CC136DC7F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Apr 2021 17:54:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240170AbhD1PzL (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 28 Apr 2021 11:55:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52928 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236041AbhD1PzL (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 28 Apr 2021 11:55:11 -0400
Received: from mail-oi1-x235.google.com (mail-oi1-x235.google.com [IPv6:2607:f8b0:4864:20::235])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5DEC1C061573
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Apr 2021 08:54:25 -0700 (PDT)
Received: by mail-oi1-x235.google.com with SMTP id l17so32178386oil.11
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Apr 2021 08:54:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=jMQtTg/Qey8vosI3ctdEwkLH1ZsdlWl+A5B8mm+7iRw=;
        b=IupsyiuP045vvmV1BbexYgQQXK2Gpz+06JS8Ja3O5KK8RzP+SK7eMIM9vvizRgd79S
         SdzbPdsq/BAoxHEsgU0Vhwb/f6hgSj0Efi34V3x1xzdFOwF7P14oG+5sBi4+75K+GMWG
         NO+NVQf9fTWZIDlLkUQ5TPTVstnoK/rLD6Q8e7/4d1ANfDqzsXmRKobaE/mAVK05SCK5
         b+CcPcdnuu7FCkTL5wW5YkqznwOjrQ1kjzctNlDldqNowhrWEPQUnvlPIzIx0JNveoL4
         9y0qkhHjfDnbowwBKeq67n5ZSvlBD7bPCLtBjzLy6q9emMtlA80baoNlnckjV/hjfnLL
         DxMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=jMQtTg/Qey8vosI3ctdEwkLH1ZsdlWl+A5B8mm+7iRw=;
        b=mJnrOMalWcT/p6bXvuFU6YI/Xtn69x3nCRw+ZlG1IKyBSwdee+fgArQGgq1lWhc1uB
         ZYaI6Qecr3U+9mdxI617D+1BBLYpXPZCTxvV//1+y4whvasXeHaOkZqVffEPVTySc+YR
         GesYpC+Y/xsCbVNqIxWc0WXGWosg6YOoLB4Bi+3eFGlmQ0d5U4BeS4C4Ji8+afCNMuLv
         DOKLm2vnlIBUy8CPw/IjQX5CKYxdWCXTkrCrPbJ49wGBu1PUmQUMcrBwy+ETtEilZbmo
         qgNxJKAJrvJKy5CHFh0UKjAOdD8yj/dfi+qcaLHdQ7FTCiWCNzwFsCnZ6SX6uEi2AD8K
         esBA==
X-Gm-Message-State: AOAM5326k6Q0DMgAvNzf/PFrK6BFz+ZiNYGn+1n59+Gc7muuX2hcTeCF
        JYWZyvB0lQkUku772lCb8C2IVw==
X-Google-Smtp-Source: ABdhPJwGoy7UDtxPJsjVy9R8T2dHpVasKNLNGorcsJta6vLvWYicqdr/Y9z3z93Ark9Gy1pHWnYdGA==
X-Received: by 2002:aca:5b04:: with SMTP id p4mr20973171oib.109.1619625264638;
        Wed, 28 Apr 2021 08:54:24 -0700 (PDT)
Received: from yoga (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id j7sm65507otk.65.2021.04.28.08.54.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Apr 2021 08:54:24 -0700 (PDT)
Date:   Wed, 28 Apr 2021 10:54:22 -0500
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Fenglin Wu <fenglinw@codeaurora.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        subbaram@codeaurora.org, collinsd@codeaurora.org,
        aghayal@codeaurora.org
Subject: Re: [PATCH 0/2] Add QCOM PMIC PWM driver
Message-ID: <20210428155422.GL1908499@yoga>
References: <20210427102247.822-1-fenglinw@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210427102247.822-1-fenglinw@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue 27 Apr 05:22 CDT 2021, Fenglin Wu wrote:

> Add PWM driver to support PWM modules inside QCOM PMIC chips which are accessed
> through SPMI bus. Normally, there would be multiple PWM modules with adjacent
> address spaces present in one PMIC chip, and each PWM module has 0x100 size of
> address space. With this driver, a pwm_chip with multiple pwm_device individuals
> is created, and each pwm_device individual is corresponding to one PWM module.
> 

Exposing this as individual pwm_chips will prevent us from enabling the
LED related use cases (patterns and multicolor) that most versions of
the hardware support.

I proposed [1] a while ago and think this is a better approach. I'll
take some time to respin this and send out the next version.

[1] https://lore.kernel.org/linux-arm-msm/20201021201224.3430546-1-bjorn.andersson@linaro.org/

Regards,
Bjorn

> Fenglin Wu (2):
>   dt-bindings: pwm: add bindings for PWM modules inside QCOM PMICs
>   pwm: pwm-qcom: add driver for PWM modules in QCOM PMICs
> 
>  .../devicetree/bindings/pwm/pwm-qcom.yaml          |  51 ++
>  drivers/pwm/Kconfig                                |   9 +
>  drivers/pwm/Makefile                               |   1 +
>  drivers/pwm/pwm-qcom.c                             | 585 +++++++++++++++++++++
>  4 files changed, 646 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/pwm/pwm-qcom.yaml
>  create mode 100644 drivers/pwm/pwm-qcom.c
> 
> -- 
> Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
> a Linux Foundation Collaborative Project.
> 
