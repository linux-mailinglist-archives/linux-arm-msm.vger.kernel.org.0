Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B925D310424
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Feb 2021 05:43:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230252AbhBEEme (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 4 Feb 2021 23:42:34 -0500
Received: from mail.kernel.org ([198.145.29.99]:45420 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229927AbhBEEmc (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 4 Feb 2021 23:42:32 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id E446064F92;
        Fri,  5 Feb 2021 04:41:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1612500111;
        bh=Vg4ZFn3/Am2ZxSTiMr/3rsk4nYhXC1sB0da4Z9W77PY=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=bYrjrlQ18rs/fLsoio/8dokt39K7iUOWb6VLBhMw+oxHpQ8cvy9SCeiVDC1q07/uS
         /TsiUb+HutPQy01jlPs+wyF/ba/CqipoSzjXSRyTkJDHzBJpyN1J7Tm3DA5B+TAFPK
         U58xbqTFx9146+5d/Iie9OXeqI64Lf5xVg7DFVEAOEev0VYd4RT7zbuEY/Ggbr6edN
         At/WrP3IjzJ7STgyX+io0hjbppHsTvpYku9OMQrsTUu/f70DCaJRPZUGkVYVuLu2rn
         1oao+ZW0Oj/cdXzdqeXmB51lAee67O2p9Jg8aa2pLuMPTBXT4GIQklTVPke1jvRoDm
         c5X2IsMjaE5tg==
Date:   Fri, 5 Feb 2021 10:11:47 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Jack Pham <jackp@codeaurora.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-arm-msm@vger.kernel.org, Andy Gross <agross@kernel.org>,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/6] arm64: dts: qcom: sm8350: add USB and PHY device
 nodes
Message-ID: <20210205044147.GE2656@vkoul-mobl.Dlink>
References: <20210204170907.63545-1-vkoul@kernel.org>
 <20210204170907.63545-3-vkoul@kernel.org>
 <20210204180552.GA25531@jackp-linux.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210204180552.GA25531@jackp-linux.qualcomm.com>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello Jack,

On 04-02-21, 10:05, Jack Pham wrote:
> On Thu, Feb 04, 2021 at 10:39:03PM +0530, Vinod Koul wrote:
> > From: Jack Pham <jackp@codeaurora.org>

> > +
> > +			resets = <&gcc 20>;
> 
> Shouldn't this (and all the other gcc phandles below) use the
> dt-bindings macros from here?
> https://patchwork.kernel.org/project/linux-arm-msm/patch/20210118044321.2571775-5-vkoul@kernel.org/

Ideally yes but it would cause build failure on qcom tree and the header
is not available here. I have a patch [1] to convert all numbers to enum
values which would be sent once header is in qcom tree (after next merge
window)..

This way we could get SM8350 booting to shell with basic things on next
rc1 rather than wait for 2 cycles.

Thanks
-- 
~Vinod
