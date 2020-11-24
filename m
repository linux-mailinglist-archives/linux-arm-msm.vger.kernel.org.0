Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C9C6F2C1DB0
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Nov 2020 06:45:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725616AbgKXFpC (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 24 Nov 2020 00:45:02 -0500
Received: from mail.kernel.org ([198.145.29.99]:56288 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728905AbgKXFpB (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 24 Nov 2020 00:45:01 -0500
Received: from localhost (unknown [122.167.149.197])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 4361D2080A;
        Tue, 24 Nov 2020 05:44:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1606196701;
        bh=Nayo1hcCvrxVay411tIx/sZm6mAiGdjXgzpc7xcMTQc=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=jwUiQnig9GNjy6S/gigjZq3ipnFjSA6V2IqJg+NXPnrQG5kZ5UyIB+RZzHFjJiDhV
         y5imN6nM+crjmOv12RJXlUekAvBngQ9Tnhys+H7mM7qpcxepENyFkxVWmReNsIOvGJ
         Vd1D0gIL+iW1GsPRj10xDHq2CbDGQnaAqR2sd4aw=
Date:   Tue, 24 Nov 2020 11:14:56 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Chen-Yu Tsai <wens@kernel.org>
Cc:     Olof Johansson <olof@lixom.net>, Rob Herring <robh+dt@kernel.org>,
        devicetree <devicetree@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Subject: Re: Reusing DTS from arm64 to arm
Message-ID: <20201124054456.GG8403@vkoul-mobl>
References: <20201124052701.GF8403@vkoul-mobl>
 <CAGb2v67DpjMkcXoumQ=92wVovCqor37U7xroxsoh+BO6i7x8jg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAGb2v67DpjMkcXoumQ=92wVovCqor37U7xroxsoh+BO6i7x8jg@mail.gmail.com>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello Chen-Yu,

On 24-11-20, 13:36, Chen-Yu Tsai wrote:
> Hi,
> 
> On Tue, Nov 24, 2020 at 1:28 PM Vinod Koul <vkoul@kernel.org> wrote:
> >
> > Hello Olof, Rob,
> >
> > We have Qualcomm arm platform which uses PMIC PM8150B. This PMIC was
> > also used in SM8150 board and is already upstream [1] but in arm64.
> >
> > So, what is the guidance to share DTS files between 32 and 64 variants?
> > Does a solution already exist which I may not be aware of..?
> >
> > I can think of following options for this, in case we dont have a
> > solution:
> >
> > 1. Hack up arm include paths to also include arm64 path so that we can
> > share DTS
> 
> These are already provided. See scripts/dtc/include-prefixes/ .
> 
> So just put
> 
> #include <arm64/qcom/pm8150b.dtsi>
> 
> in your DTS and it should work?

It does work, thank you for pointing me to this

-- 
~Vinod
