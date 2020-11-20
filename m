Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 808102BA53D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Nov 2020 09:57:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727403AbgKTI4e (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 20 Nov 2020 03:56:34 -0500
Received: from mail.kernel.org ([198.145.29.99]:33852 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727208AbgKTI4e (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 20 Nov 2020 03:56:34 -0500
Received: from disco-boy.misterjones.org (disco-boy.misterjones.org [51.254.78.96])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id B12DD2225B;
        Fri, 20 Nov 2020 08:56:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1605862593;
        bh=qqbbW/WYW8djm9O14VKV5AS5hfRXpB/xq6CzZTiK4jw=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=sQRmtxweZWYf8+ngQfhnlseoXKfRr6S7mM9xu4PBQ3kw3GCA2im/uHKTDtoK6yTcW
         hy6fVGjxdHFWBbLgKCjedTRT0Mk5c7Uns+hdfA9KqTLKZ3qkBQSds14Y0zkBEzZhoM
         QkzXHGewnfVrJRGVIxBdpqRioAg8u0UpJll94oKA=
Received: from disco-boy.misterjones.org ([51.254.78.96] helo=www.loen.fr)
        by disco-boy.misterjones.org with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
        (Exim 4.94)
        (envelope-from <maz@kernel.org>)
        id 1kg2DX-00CCR4-I8; Fri, 20 Nov 2020 08:56:31 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Fri, 20 Nov 2020 08:56:31 +0000
From:   Marc Zyngier <maz@kernel.org>
To:     Neeraj Upadhyay <neeraju@codeaurora.org>
Cc:     ionela.voinescu@arm.com, valentin.schneider@arm.com,
        mark.rutland@arm.com, suzuki.poulose@arm.com,
        Will Deacon <will@kernel.org>, catalin.marinas@arm.com,
        linux-arm-kernel@lists.infradead.org,
        lkml <linux-kernel@vger.kernel.org>,
        MSM <linux-arm-msm@vger.kernel.org>
Subject: Re: AMU extension v1 support for cortex A76, A77, A78 CPUs
In-Reply-To: <2cc9dd44-0b4b-94a8-155a-7a2446a1b892@codeaurora.org>
References: <2cc9dd44-0b4b-94a8-155a-7a2446a1b892@codeaurora.org>
User-Agent: Roundcube Webmail/1.4.9
Message-ID: <1712842eb0767e51155a5396d282102c@kernel.org>
X-Sender: maz@kernel.org
X-SA-Exim-Connect-IP: 51.254.78.96
X-SA-Exim-Rcpt-To: neeraju@codeaurora.org, ionela.voinescu@arm.com, valentin.schneider@arm.com, mark.rutland@arm.com, suzuki.poulose@arm.com, will@kernel.org, catalin.marinas@arm.com, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2020-11-20 04:30, Neeraj Upadhyay wrote:
> Hi,
> 
> For ARM cortex A76, A77, A78 cores (which as per TRM, support AMU)
> AA64PFR0[47:44] field is not set, and AMU does not get enabled for
> them.
> Can you please provide support for these CPUs in cpufeature.c?

If that was the case, that'd be an erratum, and it would need to be
documented as such. It could also be that this is an optional feature
for these cores (though the TRM doesn't suggest that).

Can someone at ARM confirm what is the expected behaviour of these CPUs?

         M.
-- 
Jazz is not dead. It just smells funny...
