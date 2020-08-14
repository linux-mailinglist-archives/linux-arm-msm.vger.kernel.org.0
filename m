Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 03499244655
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Aug 2020 10:17:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726669AbgHNIRK (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 14 Aug 2020 04:17:10 -0400
Received: from mail.kernel.org ([198.145.29.99]:55340 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726641AbgHNIRK (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 14 Aug 2020 04:17:10 -0400
Received: from disco-boy.misterjones.org (disco-boy.misterjones.org [51.254.78.96])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id C69AD206B2;
        Fri, 14 Aug 2020 08:17:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1597393029;
        bh=YgO/v+wl3RV6ZsbHn7D3JlpwNdtDIHAfZh9E27YIQpk=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=WxJFKyohdJoDrxE3CmmxAdxJPPTni1dRkGLrqOaUzEwjQbwBGDQ9rpVWSELhh1z+9
         ToDvK8bcMSJoBVXkiIQveJMq7ypNmBabnyga3egg6Prvr0PAy77JwYJWbuP2kvP/JD
         8fV95VGaXgxHcLjxQlIpC4yI1JoSsPEZ1BqHEkAE=
Received: from disco-boy.misterjones.org ([51.254.78.96] helo=www.loen.fr)
        by disco-boy.misterjones.org with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.92)
        (envelope-from <maz@kernel.org>)
        id 1k6Utg-0026vn-CN; Fri, 14 Aug 2020 09:17:08 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Fri, 14 Aug 2020 09:17:08 +0100
From:   Marc Zyngier <maz@kernel.org>
To:     Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
Cc:     Will Deacon <will@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Andre Przywara <andre.przywara@arm.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Stephen Boyd <swboyd@chromium.org>,
        Douglas Anderson <dianders@chromium.org>,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH] arm64: Add KRYO4XX gold CPU core to spectre-v2 safe list
In-Reply-To: <d4ad5ade9815632f450374c9b6bbe9d2@codeaurora.org>
References: <20200813081834.13576-1-saiprakash.ranjan@codeaurora.org>
 <20200813090324.GB9829@willie-the-truck>
 <89f0f41514e547533c3fa66364e5a2ac@codeaurora.org>
 <20200813094041.GA9894@willie-the-truck>
 <ff6fa7bd817d49e8ef9bee5c1e13d99c@kernel.org>
 <368280026c8af5b5a58a52c1e19cfae9@codeaurora.org>
 <8ffd22d5926aedda0c9fa6ea429fd84e@kernel.org>
 <d4ad5ade9815632f450374c9b6bbe9d2@codeaurora.org>
User-Agent: Roundcube Webmail/1.4.7
Message-ID: <961724681d6d3f8c37a4e3c8facbdea3@kernel.org>
X-Sender: maz@kernel.org
X-SA-Exim-Connect-IP: 51.254.78.96
X-SA-Exim-Rcpt-To: saiprakash.ranjan@codeaurora.org, will@kernel.org, catalin.marinas@arm.com, andre.przywara@arm.com, mark.rutland@arm.com, suzuki.poulose@arm.com, swboyd@chromium.org, dianders@chromium.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2020-08-14 05:34, Sai Prakash Ranjan wrote:
> On 2020-08-13 23:29, Marc Zyngier wrote:

[...]

>> We'd need to disable the late onlining of CPUs that would change
>> the mitigation state, and this is... ugly.
>> 
> 
> Ugh, yes indeed and here I was thinking that these things are 
> straightforward :(

It never is. Big-little is a broken concept. I'll try and think of
something next week, as I'm pretty swamped at the moment.

         M.
-- 
Jazz is not dead. It just smells funny...
