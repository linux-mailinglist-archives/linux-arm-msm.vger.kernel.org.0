Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 51D974BD2E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Jun 2019 17:45:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726109AbfFSPps (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 19 Jun 2019 11:45:48 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:39692 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726091AbfFSPps (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 19 Jun 2019 11:45:48 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id 86D0F6016D; Wed, 19 Jun 2019 15:45:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1560959147;
        bh=DqZZs8HjZ+TnZI3yrj3Wdk4M0sTVzDicXzAjl5ChrPQ=;
        h=Subject:Cc:References:To:From:Date:In-Reply-To:From;
        b=fcLCN7ygIAEa90+0toZkHwPvbLiGrKkwdbAnKmBdZoFByXzGWvi8jpFbvcylxII8u
         0zlyTbvs1s3qbCvq7lRHfFjA8aawXvXDp91apd4l0ofSYOOK8iD612QNBjRStALTuv
         BVjTIDl8af3tY9alOQ6hvZW3/Fs018aGX4Sg7N44=
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
        by smtp.codeaurora.org (Postfix) with ESMTPSA id CA9C66016D;
        Wed, 19 Jun 2019 15:45:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1560959146;
        bh=DqZZs8HjZ+TnZI3yrj3Wdk4M0sTVzDicXzAjl5ChrPQ=;
        h=Subject:Cc:References:To:From:Date:In-Reply-To:From;
        b=YBVasY6hfbVfTU8IKa6Bf11lLDnFFMFg469hEt5f4CqlerERk3ciO4AcGQ3s5h46p
         4z+ZMyz3KRA5z7XILuO8DWFQMCx/NJ6NtPVPtN4LqF72wpCOwHI6fxEz45LULxuRmY
         l7LNpr6henxXIvSZglUXO18LNy+dtvnqvaHJ0e7I=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org CA9C66016D
Authentication-Results: pdx-caf-mail.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org; spf=none smtp.mailfrom=jhugo@codeaurora.org
Subject: Re: [PATCH v5 0/6] MSM8998 Multimedia Clock Controller
Cc:     agross@kernel.org, bjorn.andersson@linaro.org,
        marc.w.gonzalez@free.fr, mturquette@baylibre.com,
        robh+dt@kernel.org, mark.rutland@arm.com,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <1560366600-5826-1-git-send-email-jhugo@codeaurora.org>
To:     sboyd@kernel.org
From:   Jeffrey Hugo <jhugo@codeaurora.org>
Message-ID: <f151d380-4ac5-cb1a-4244-9e4e8e2134d8@codeaurora.org>
Date:   Wed, 19 Jun 2019 09:45:44 -0600
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <1560366600-5826-1-git-send-email-jhugo@codeaurora.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 6/12/2019 1:10 PM, Jeffrey Hugo wrote:
> The multimedia clock controller (mmcc) is the main clock controller for
> the multimedia subsystem and is required to enable things like display and
> camera.
> 
> v5:
> -handle the case where gcc uses rpmcc for xo, but the link is not specified in dt
> -have gcc select rpmcc
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

Stephen, is there any chance for this series to make 5.3?

-- 
Jeffrey Hugo
Qualcomm Datacenter Technologies as an affiliate of Qualcomm 
Technologies, Inc.
Qualcomm Technologies, Inc. is a member of the
Code Aurora Forum, a Linux Foundation Collaborative Project.
