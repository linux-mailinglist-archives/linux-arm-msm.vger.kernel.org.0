Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C15F816BF23
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Feb 2020 11:55:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729163AbgBYKzW (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 25 Feb 2020 05:55:22 -0500
Received: from foss.arm.com ([217.140.110.172]:49034 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726019AbgBYKzW (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 25 Feb 2020 05:55:22 -0500
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7335330E;
        Tue, 25 Feb 2020 02:55:21 -0800 (PST)
Received: from bogus (e103737-lin.cambridge.arm.com [10.1.197.49])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 083263F6CF;
        Tue, 25 Feb 2020 02:55:19 -0800 (PST)
Date:   Tue, 25 Feb 2020 10:55:17 +0000
From:   Sudeep Holla <sudeep.holla@arm.com>
To:     Elliot Berman <eberman@codeaurora.org>
Cc:     Mark Rutland <mark.rutland@arm.com>,
        Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Trilok Soni <tsoni@codeaurora.org>,
        Prasad Sodagudi <psodagud@codeaurora.org>,
        David Collins <collinsd@codeaurora.org>,
        Sudeep Holla <sudeep.holla@arm.com>,
        linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/3] dt: psci: Add arm,psci-sys-reset2-type property
Message-ID: <20200225105517.GE32784@bogus>
References: <1582577858-12410-1-git-send-email-eberman@codeaurora.org>
 <1582577858-12410-2-git-send-email-eberman@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1582577858-12410-2-git-send-email-eberman@codeaurora.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Feb 24, 2020 at 12:57:36PM -0800, Elliot Berman wrote:
> Some implementors of PSCI may relax the requirements of the PSCI
> architectural warm reset. In order to comply with PSCI specification, a
> different reset_type value must be used. The alternate PSCI
> SYSTEM_RESET2 may be used in all warm/soft reboot scenarios, replacing
> the architectural warm reset.
>

You forgot to update $subject accordingly. No need to respin for that
now, unless you get any other comments.

Other than the $subject fix,
Reviewed-by: Sudeep Holla <sudeep.holla@arm.com>

-- 
Regards,
Sudeep
