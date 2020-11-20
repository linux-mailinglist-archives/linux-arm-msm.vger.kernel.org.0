Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 08C002BA6A0
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Nov 2020 10:55:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727441AbgKTJyw (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 20 Nov 2020 04:54:52 -0500
Received: from mail.kernel.org ([198.145.29.99]:60802 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726460AbgKTJyw (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 20 Nov 2020 04:54:52 -0500
Received: from disco-boy.misterjones.org (disco-boy.misterjones.org [51.254.78.96])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 60895222BA;
        Fri, 20 Nov 2020 09:54:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1605866091;
        bh=8yLZr8Urldyw9+/0Dncp4nYOW1ni13hGaZD0CHdLh3Y=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=2fw5an37Tk3rK8u+Msft/SvUw5wpnXDparfUlovlz1epzDweYfGqWpIvI0PDtPEv3
         OBAzjqGYLs3hfXrfjy4+v3fV4ox9LPbuOqAlBXAXdv3mUOhz2J6diN3eFywexfWMHC
         dyLG1crOCtuptxjKOUBJXXizQyWXv7wkuC5538SI=
Received: from disco-boy.misterjones.org ([51.254.78.96] helo=www.loen.fr)
        by disco-boy.misterjones.org with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
        (Exim 4.94)
        (envelope-from <maz@kernel.org>)
        id 1kg37x-00CDPj-2S; Fri, 20 Nov 2020 09:54:49 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Fri, 20 Nov 2020 09:54:48 +0000
From:   Marc Zyngier <maz@kernel.org>
To:     Vladimir Murzin <vladimir.murzin@arm.com>
Cc:     Neeraj Upadhyay <neeraju@codeaurora.org>, mark.rutland@arm.com,
        suzuki.poulose@arm.com, ionela.voinescu@arm.com,
        MSM <linux-arm-msm@vger.kernel.org>,
        lkml <linux-kernel@vger.kernel.org>, catalin.marinas@arm.com,
        Will Deacon <will@kernel.org>, valentin.schneider@arm.com,
        linux-arm-kernel@lists.infradead.org
Subject: Re: AMU extension v1 support for cortex A76, A77, A78 CPUs
In-Reply-To: <e15de351-63c1-2599-82bf-22c95e8a6a62@arm.com>
References: <2cc9dd44-0b4b-94a8-155a-7a2446a1b892@codeaurora.org>
 <1712842eb0767e51155a5396d282102c@kernel.org>
 <e15de351-63c1-2599-82bf-22c95e8a6a62@arm.com>
User-Agent: Roundcube Webmail/1.4.9
Message-ID: <d77713992e5abef5c6066d9f1939e8db@kernel.org>
X-Sender: maz@kernel.org
X-SA-Exim-Connect-IP: 51.254.78.96
X-SA-Exim-Rcpt-To: vladimir.murzin@arm.com, neeraju@codeaurora.org, mark.rutland@arm.com, suzuki.poulose@arm.com, ionela.voinescu@arm.com, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, catalin.marinas@arm.com, will@kernel.org, valentin.schneider@arm.com, linux-arm-kernel@lists.infradead.org
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2020-11-20 09:09, Vladimir Murzin wrote:
> On 11/20/20 8:56 AM, Marc Zyngier wrote:
>> On 2020-11-20 04:30, Neeraj Upadhyay wrote:
>>> Hi,
>>> 
>>> For ARM cortex A76, A77, A78 cores (which as per TRM, support AMU)
>>> AA64PFR0[47:44] field is not set, and AMU does not get enabled for
>>> them.
>>> Can you please provide support for these CPUs in cpufeature.c?
>> 
>> If that was the case, that'd be an erratum, and it would need to be
>> documented as such. It could also be that this is an optional feature
>> for these cores (though the TRM doesn't suggest that).
>> 
>> Can someone at ARM confirm what is the expected behaviour of these 
>> CPUs?
> 
> Not a confirmation, but IIRC, these are imp def features, while our 
> cpufeatures
> catches architected one.

Ah, good point. So these CPUs implement some sort of AMU, and not *the* 
AMU.

Yet the register names are the same. Who thought that'd be a good idea?

         M.
-- 
Jazz is not dead. It just smells funny...
