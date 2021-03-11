Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F3527338127
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Mar 2021 00:15:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229920AbhCKXO3 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 11 Mar 2021 18:14:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59684 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231154AbhCKXOE (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 11 Mar 2021 18:14:04 -0500
Received: from mail-oi1-x22d.google.com (mail-oi1-x22d.google.com [IPv6:2607:f8b0:4864:20::22d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B8CE0C061574
        for <linux-arm-msm@vger.kernel.org>; Thu, 11 Mar 2021 15:14:03 -0800 (PST)
Received: by mail-oi1-x22d.google.com with SMTP id t83so14982784oih.12
        for <linux-arm-msm@vger.kernel.org>; Thu, 11 Mar 2021 15:14:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=nhmLVmrcPmGwvbjYVDwRR3WnIqaaWiz28GD602W121E=;
        b=dkuu4DwH/C66+QzC0DfeRwOQ6Gdk09sDk7RZU+vrg9WM31NbEp8K5IwM9MaPWMYfRc
         DwV63vVIJv06FFgnWuylt7tHa2dbPSbEjIsC8lVtyxFQDMXaZfryum63trs8bStN++Fw
         3HymaBA7HACTegKX3eD72jLDBUU6uCDv98Ts4446f1Xw2uXFB0A+IcAb17iss2/h1nau
         QAdOdE3PukNwZy6gU+do84Sp1a6AuIbbTVQvTKLT9Nj2zLGP2ITVP8bz3FQL3yS+Fxik
         JCxEyK8i09c7ucYm3ai0wEvVOQ88oAAFgCGnDdXLdHZiH4l9qyHcuGe6W7TVV4MDC3if
         S82w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=nhmLVmrcPmGwvbjYVDwRR3WnIqaaWiz28GD602W121E=;
        b=PStL+2rGHKJMCJm5d5ykCt0wZv6KG3jBe0U2YmI0vEmeHkv+4S6gCDn9qTGvQF1tex
         lGEkaY0L/BQxz/1OPF3xL3jrQK1mpsIL0GyBG3uoOlqfKRBSRnEFIcCzbPqB5ojEs0qH
         iIrDFqD5aJmlepmchfv7J1OpNPfmubVm7Vos+x9h2OWkPzY3U+Ntz80+KlLBWl4evAc3
         qHm/JeFh2dH0oXEj5iIYXrZq4jWLNHSoeNt7jhLTGqk7zhtDHZ2pIFPwKiuq2sOEXGib
         BIE/PNqAs2KLIC5mOvWZIe/VfbjelVJEv0s+VS5SXlzpyY57SuT2YIFMWcjRDS+CiBYP
         iaFA==
X-Gm-Message-State: AOAM531U14Qgl+iCtAEKkpoVNlJQsnIfVMHW6EZVZGHa2/jMO8mgQ/a4
        isAl4n22yqkWW9v312R40CeVUA==
X-Google-Smtp-Source: ABdhPJxt1o5MUEMvXqsKbwhzM9TckDBLY6QgtLIucb5t5kLcQDIMESK8ilAVtfUiwUHM86IFWupBPA==
X-Received: by 2002:a54:4e8c:: with SMTP id c12mr7986767oiy.175.1615504443179;
        Thu, 11 Mar 2021 15:14:03 -0800 (PST)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id g3sm803107ooi.28.2021.03.11.15.14.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Mar 2021 15:14:02 -0800 (PST)
Date:   Thu, 11 Mar 2021 17:14:00 -0600
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
Cc:     Andy Gross <agross@kernel.org>, devicetree@vger.kernel.org,
        Stephen Boyd <swboyd@chromium.org>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Rajendra Nayak <rnayak@codeaurora.org>,
        Sibi Sankar <sibis@codeaurora.org>
Subject: Re: [PATCH 0/9] qcom/sc7280: Enable various hardware blocks on
 SC7280 SoC
Message-ID: <YEqkOOuYztTUg1u3@builder.lan>
References: <cover.1614244789.git.saiprakash.ranjan@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1614244789.git.saiprakash.ranjan@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu 25 Feb 03:30 CST 2021, Sai Prakash Ranjan wrote:

> This series enables various hardware blocks such as LLCC, IPCC, AOSS QMP
> and Coresight on SC7280 SoC.
> 
> This series is dependent on the base support added for SC7280 in [1].
> 

I've picked some of these patches...


It would be helpful if you split series like this based on how they will
be picked up my various maintainers. E.g. I think it's quite likely
Jassi won't find and pick up the mailbox binding patch.


PS. I sent a patch to Jassi adding the mailbox binding directory to
MAINTAINERS.

Regards,
Bjorn

> [1] https://lore.kernel.org/patchwork/cover/1379842/
> 
> Sai Prakash Ranjan (9):
>   dt-bindings: arm: msm: Add LLCC for SC7280
>   soc: qcom: llcc: Add configuration data for SC7280
>   arm64: dts: qcom: sc7280: Add device tree node for LLCC
>   dt-bindings: mailbox: qcom-ipcc: Add compatible for SC7280
>   arm64: dts: qcom: sc7280: Add IPCC for SC7280 SoC
>   dt-bindings: soc: qcom: aoss: Add SC7280 compatible
>   soc: qcom: aoss: Add AOSS QMP support for SC7280
>   arm64: dts: qcom: sc7280: Add AOSS QMP node
>   arm64: dts: qcom: sc7280: Add Coresight support
> 
>  .../bindings/arm/msm/qcom,llcc.yaml           |   1 +
>  .../bindings/mailbox/qcom-ipcc.yaml           |   1 +
>  .../bindings/soc/qcom/qcom,aoss-qmp.txt       |   1 +
>  arch/arm64/boot/dts/qcom/sc7280.dtsi          | 520 ++++++++++++++++++
>  drivers/soc/qcom/llcc-qcom.c                  |  19 +
>  drivers/soc/qcom/qcom_aoss.c                  |   1 +
>  6 files changed, 543 insertions(+)
> 
> 
> base-commit: d79b47c59576a51d8e288a6b98b75ccf4afb8acd
> prerequisite-patch-id: d8babdd3c8a9923360af342f3d8d9876820272e5
> prerequisite-patch-id: 5757e07e4336d773d402769d09106924962ce31b
> prerequisite-patch-id: 9b21eb51aa86619f5695a511c65c9236e3bc0f2b
> prerequisite-patch-id: 2f834cc892f7f9109cbf32a87d504ba27b64a5df
> prerequisite-patch-id: 14b1185357703d750c3411a16e97675489ca7dde
> prerequisite-patch-id: 55c143f21b646c18da921a62bbd2801a5df38c8f
> prerequisite-patch-id: 66f4c58aff2f1a7283b0103590ff82384907bae3
> prerequisite-patch-id: 75e73e6b13ab91ed5e3a96b59957aa5e867d65ea
> prerequisite-patch-id: eb46845b4f9eb3706a26911042c2865a58577198
> -- 
> QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
> of Code Aurora Forum, hosted by The Linux Foundation
> 
