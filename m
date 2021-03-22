Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8B4E7343902
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Mar 2021 07:02:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229884AbhCVGB2 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 22 Mar 2021 02:01:28 -0400
Received: from mail.kernel.org ([198.145.29.99]:49864 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229865AbhCVGB1 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 22 Mar 2021 02:01:27 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id E797D61927;
        Mon, 22 Mar 2021 06:01:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1616392886;
        bh=eq4HMF9geV0Zvppc8dzAPHkyUvIp3qmYAerIm0s7TfQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=g/HULiHp8O5kayQwEPqVmFLlr4vpUoHboOiFI7x5vF8rl5Saxa3SAZsTJxpQ25iH9
         VpHXCVAer1zDUptAOiiM7dHWJXQHkQPSZOD39zZllk+yqL406+ShytUj2WzEJGkjbu
         5bPHkLIH+yK/VN1mX/RWQyKFLVifmG4DiWa+BfDRJLds/g9NRyauoXkIz1wLTBtKfc
         UrweOHq6br/2BJ/ihbTIZLDEdWrApJrFuXYps0T9tzBRbGHc+gHegojn6Q0HTITGfu
         2jL783Eklh3NuzngRTnPpVRa9bFD5D+hTuy6ePDbfidLgn3fhssC4Fl5Kza/fx92cY
         jfi42tkqeOpMA==
Date:   Mon, 22 Mar 2021 11:31:22 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Caleb Connolly <caleb@connolly.tech>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] arm64: dts: qcom: sm8150: add iommus to qups
Message-ID: <YFgysqyYlAagyV7y@vkoul-mobl.Dlink>
References: <20210310163024.393578-1-caleb@connolly.tech>
 <20210310163024.393578-3-caleb@connolly.tech>
 <YFBM5Up5caWZCMSx@vkoul-mobl>
 <5ab5b7df-1624-10bf-f268-c32dc5bf0bb6@connolly.tech>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5ab5b7df-1624-10bf-f268-c32dc5bf0bb6@connolly.tech>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 20-03-21, 17:16, Caleb Connolly wrote:
> Hi Vinod,
> 
> On 16/03/2021 6:15 am, Vinod Koul wrote:
> > On 10-03-21, 16:31, Caleb Connolly wrote:
> >> Hook up the SMMU for doing DMA over i2c. Some peripherals like
> >> touchscreens easily exceed 32-bytes per transfer, causing errors and
> >> lockups without this.
> > Why not squash this to patch 1..?
> 
> I thought it made more sense to separate these patches to keep the 
> history a bit cleaner. I can squash them if you'd prefer.

The nodes should be typically added in a single patch, maybe Bjorn is
fine with this ;-)

-- 
~Vinod
