Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8FC33306044
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 Jan 2021 16:54:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235859AbhA0PyY (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 27 Jan 2021 10:54:24 -0500
Received: from mail.kernel.org ([198.145.29.99]:35206 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S236133AbhA0Pdw (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 27 Jan 2021 10:33:52 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id EAF2D207A2;
        Wed, 27 Jan 2021 15:33:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1611761591;
        bh=FoGK8gbWTH8dPnMZm8A+vGjJx3S+xWPZTf4oS3ZKmd8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=qqnW0aqKtq14YxUSawR2OGkv8A7e16wgibMSQ6cfBUOmybbqdNtwVB/XbECgULnyE
         UjlDWILBKW98X567gypj+bDv7FEangv1aVHJA/o5v4VIQhsmzRniQB0rSlfPSjacxv
         9VP54Pxm0MKPRnpPJsfVNHFz3a6Me1DGts4K4jQXqw3UIwVBa90O1NmSMSZu/JIcA6
         RPG1W9lWoaPXliarDYQq9tEbbwUiVBSS2fz9DYnS1zqYX9mcLA1tNsKyrflN802xgd
         76P/6rMz7A0vutNRRd5/YdIdRMoSI5PnttUkJohhpxt9SGxqD8XdU0yVTmkLNJ322D
         w81FQTv+OhuSA==
Date:   Wed, 27 Jan 2021 21:03:07 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-arm-msm@vger.kernel.org, Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 5/6] arm64: dts: qcom: Add basic devicetree support
 for SM8350 SoC
Message-ID: <20210127153307.GC2771@vkoul-mobl>
References: <20210127123054.263231-1-vkoul@kernel.org>
 <20210127123054.263231-6-vkoul@kernel.org>
 <194d2ebe26a9420f842c97738adb0443@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <194d2ebe26a9420f842c97738adb0443@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Sai,

On 27-01-21, 18:37, Sai Prakash Ranjan wrote:
> Hi Vinod,
> 
> On 2021-01-27 18:00, Vinod Koul wrote:

> > +	timer {
> > +		compatible = "arm,armv8-timer";
> > +		interrupts = <GIC_PPI 13 (GIC_CPU_MASK_SIMPLE(8) |
> > IRQ_TYPE_LEVEL_LOW)>,
> > +			     <GIC_PPI 14 (GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_LOW)>,
> > +			     <GIC_PPI 11 (GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_LOW)>,
> > +			     <GIC_PPI 12 (GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_LOW)>;
> 
> The last interrupt should be hypervisor physical interrupt(10) not 12(hyp
> virtual).
> It works currently with android bootloaders because the host linux kernel
> will run
> at EL1 and will use EL1 physical timer interrupt(14), but if we ever have
> the host
> kernel run in EL2(for example, chrome) then we will not receive any timer
> interrupts.

I got these values from downstream and used them as is. I will update
and also check documentation. Thanks for pointing out

-- 
~Vinod
