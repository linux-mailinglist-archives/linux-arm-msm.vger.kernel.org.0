Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 51195452CE1
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Nov 2021 09:34:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232269AbhKPIg4 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 16 Nov 2021 03:36:56 -0500
Received: from mail.kernel.org ([198.145.29.99]:42058 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232277AbhKPIgs (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 16 Nov 2021 03:36:48 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 2507F6152B;
        Tue, 16 Nov 2021 08:33:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1637051632;
        bh=1OEkJebcENce/ymEMrGlGw4nnJ57fMvtOldP0Whkg5o=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Nw82rwRctbM8gOnMAsAAc58gJBXiDZrbACTYJpeC91Aqck9zsGB9MrJ3dSV5omC1f
         igpSMdIdvalmcwAN5RS8k2kSybUUFuilRlln0HqzidinSNTI933Nu4mAE4znKxOuav
         h4a4Ne+CujW5ppEJJmerO/krLvmEiKUN9a9hGLTN3zCXzNJPhe/AylnL0AgNOjaLxC
         1ROGj884pcEnxPI7AzVOcJpvYhcliInfG73LP4eYphm+npegccJ1c5FfCECex6rQkt
         Rh6PiSjv3dRpZ4FaOil+9uexelf6FchxID7jCz3h1rOaphj1LnYE/0Hz9ebNzSF+nP
         F/u04V7oCi8jg==
Date:   Tue, 16 Nov 2021 14:03:47 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     quic_vamslank@quicinc.com
Cc:     agross@kernel.org, bjorn.andersson@linaro.org,
        mturquette@baylibre.com, sboyd@kernel.org, robh+dt@kernel.org,
        tglx@linutronix.de, maz@kernel.org, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, manivannan.sadhasivam@linaro.org
Subject: Re: [PATCH v4 0/6] Add Pdc, GCC and RPMh clock support for SDX65
Message-ID: <YZNs6wF4s7hG/u4o@matsya>
References: <cover.1637047731.git.quic_vamslank@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1637047731.git.quic_vamslank@quicinc.com>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 15-11-21, 23:38, quic_vamslank@quicinc.com wrote:
> From: Vamsi Krishna Lanka <quic_vamslank@quicinc.com>
> 
> Hello,
> 
> Changes from v3:
>  - Fixed DTbindings and unused varaibles errors reported by kernel test bot
>  - Rebased on top of v5.16-rc1 
> 
> Changes from v2:
>  - Addressed Taniya Das and Vinod Koul's comments related to adding LUCID_EVO

Ah wasnt aware the comments are fixed. It is a good practice to reply to
reviewers about the comments

>    PLL type and rpmh support patches
>  - Collected Rob's Acked-by for the dt-bindings patches
> 
> Changes from v1:
>  - Addressed Bjorn's comments related to the GCC support patch
>  - Collected Bjorn's and Rob's Reviewed-by for the dt-bindings patches
> 
> This patch series adds bindings and device driver changes for GCC, pdc and RPMh
> clock support for SDX65 Platform.
> 
> Thanks,
> Vamsi
> 
>  .../bindings/clock/qcom,gcc-sdx65.yaml        |   78 +
>  .../bindings/clock/qcom,rpmhcc.yaml           |    1 +
>  .../interrupt-controller/qcom,pdc.txt         |    1 +
>  drivers/clk/qcom/Kconfig                      |    8 +
>  drivers/clk/qcom/Makefile                     |    1 +
>  drivers/clk/qcom/clk-alpha-pll.c              |  171 ++
>  drivers/clk/qcom/clk-alpha-pll.h              |    3 +
>  drivers/clk/qcom/clk-rpmh.c                   |   25 +
>  drivers/clk/qcom/gcc-sdx65.c                  | 1589 +++++++++++++++++
>  include/dt-bindings/clock/qcom,gcc-sdx65.h    |  122 ++
>  10 files changed, 1999 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/clock/qcom,gcc-sdx65.yaml
>  create mode 100644 drivers/clk/qcom/gcc-sdx65.c
>  create mode 100644 include/dt-bindings/clock/qcom,gcc-sdx65.h
> 
> 
> base-commit: 8ab774587903771821b59471cc723bba6d893942
> -- 
> 2.33.1

-- 
~Vinod
