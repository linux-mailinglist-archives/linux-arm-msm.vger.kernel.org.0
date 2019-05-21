Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D687B252D9
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 May 2019 16:52:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728964AbfEUOwe (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 21 May 2019 10:52:34 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:48020 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728316AbfEUOwe (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 21 May 2019 10:52:34 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id 7DA1D60E5A; Tue, 21 May 2019 14:52:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1558450352;
        bh=SrPfq8MUViUv+XabaPgjbbiYPwSPr5D7GfKJjGwPG+I=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=gi979lmu16tGOEOTilt7ENiKg7rFcuOTfFLuR+c4mUCM/Erh3fSjEoeQnjmPvTwlH
         dJV0V8+OWwXaZsrnn64uinhEM20+yhbMBCFwI3fegy/pObPwt0G7/y4A38x63Rxop4
         /pUn38KW6NJodHSvOO0+TFpZmOteK5IPy8aMExiM=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        pdx-caf-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        DKIM_INVALID,DKIM_SIGNED,SPF_NONE autolearn=no autolearn_force=no
        version=3.4.0
Received: from [10.226.58.28] (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: jhugo@smtp.codeaurora.org)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id ED10D6021C;
        Tue, 21 May 2019 14:52:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1558450351;
        bh=SrPfq8MUViUv+XabaPgjbbiYPwSPr5D7GfKJjGwPG+I=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=I8ukjk4VvZ1URFh1a1CnLlOUQgcflGA2KQX4W7UDU0PS4dhXqM/Fw0r195XSmtXEc
         OFC9lEihjflZtu/u2C+5Zl3hMUNX6d/m9Y8yGmDJvKAyvNU6M+VBgPne5tcXM82ixH
         hV8zbiK6KoKwcZX2VEUvx8q8vXpEUlDNeLO1fqU4=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org ED10D6021C
Authentication-Results: pdx-caf-mail.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org; spf=none smtp.mailfrom=jhugo@codeaurora.org
Subject: Re: [PATCH v4 0/6] MSM8998 Multimedia Clock Controller
To:     sboyd@kernel.org
Cc:     david.brown@linaro.org, agross@kernel.org,
        bjorn.andersson@linaro.org, marc.w.gonzalez@free.fr,
        mturquette@baylibre.com, robh+dt@kernel.org, mark.rutland@arm.com,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <1558449843-19971-1-git-send-email-jhugo@codeaurora.org>
From:   Jeffrey Hugo <jhugo@codeaurora.org>
Message-ID: <933023a0-10fd-fedf-6715-381dae174ad9@codeaurora.org>
Date:   Tue, 21 May 2019 08:52:28 -0600
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <1558449843-19971-1-git-send-email-jhugo@codeaurora.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 5/21/2019 8:44 AM, Jeffrey Hugo wrote:
> The multimedia clock controller (mmcc) is the main clock controller for
> the multimedia subsystem and is required to enable things like display and
> camera.

Stephen, I think this series is good to go, and I have display/gpu stuff 
I'm polishing that will depend on this.  Would you kindly pickup patches 
1, 3, 4, and 5 for 5.3?  I can work with Bjorn to pick up patches 2 and 6.

> 
> v4:
> -fix makefile to use correct config item
> -pick up tags
> -fix ordering of clocks and clock-names in dt
> -drop MODULE_ALIAS
> -wait for xo in mmcc since that was found to be useful in some debug configs
> 
> v3:
> -Rebase onto linux-next to get the final version of the clk parent rewrite
> series
> -Moved the bindings header to the bindings patch per Rob
> -Made xo manditory for GCC to work around the lack of clk orphan probe defer
> to avoid the uart console glitch
> 
> v2:
> -Rebased on the "Rewrite clk parent handling" series and updated to the clk init
> mechanisms introduced there.
> -Marked XO clk as CLK_IGNORE_UNUSED to avoid the concern about the XO going away
> "incorrectly" during late init
> -Corrected the name of the XO clock to "xo"
> -Dropped the fake XO clock in GCC to prevent a namespace conflict
> -Fully enumerated the external clocks (DSI PLLs, etc) in the DT binding
> -Cleaned up the weird newlines in the added DT node
> -Added DT header file to msm8998 DT for future clients
> 
> Jeffrey Hugo (6):
>    dt-bindings: clock: Document external clocks for MSM8998 gcc
>    arm64: dts: msm8998: Add xo clock to gcc node
>    clk: qcom: smd: Add XO clock for MSM8998
>    dt-bindings: clock: Add support for the MSM8998 mmcc
>    clk: qcom: Add MSM8998 Multimedia Clock Controller (MMCC) driver
>    arm64: dts: qcom: msm8998: Add mmcc node
> 
>   .../devicetree/bindings/clock/qcom,gcc.txt    |   10 +
>   .../devicetree/bindings/clock/qcom,mmcc.txt   |   21 +
>   arch/arm64/boot/dts/qcom/msm8998.dtsi         |   16 +
>   drivers/clk/qcom/Kconfig                      |    9 +
>   drivers/clk/qcom/Makefile                     |    1 +
>   drivers/clk/qcom/clk-smd-rpm.c                |   24 +-
>   drivers/clk/qcom/gcc-msm8998.c                |   29 +-
>   drivers/clk/qcom/mmcc-msm8998.c               | 2915 +++++++++++++++++
>   include/dt-bindings/clock/qcom,mmcc-msm8998.h |  210 ++
>   9 files changed, 3214 insertions(+), 21 deletions(-)
>   create mode 100644 drivers/clk/qcom/mmcc-msm8998.c
>   create mode 100644 include/dt-bindings/clock/qcom,mmcc-msm8998.h
> 


-- 
Jeffrey Hugo
Qualcomm Datacenter Technologies as an affiliate of Qualcomm 
Technologies, Inc.
Qualcomm Technologies, Inc. is a member of the
Code Aurora Forum, a Linux Foundation Collaborative Project.
