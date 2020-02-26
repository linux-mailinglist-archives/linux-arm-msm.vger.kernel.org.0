Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D55FC16FE96
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Feb 2020 13:02:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726806AbgBZMCY (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 26 Feb 2020 07:02:24 -0500
Received: from foss.arm.com ([217.140.110.172]:34932 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726272AbgBZMCY (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 26 Feb 2020 07:02:24 -0500
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2B36D1FB;
        Wed, 26 Feb 2020 04:02:24 -0800 (PST)
Received: from bogus (e103737-lin.cambridge.arm.com [10.1.197.49])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B53393FA00;
        Wed, 26 Feb 2020 04:02:22 -0800 (PST)
Date:   Wed, 26 Feb 2020 12:02:20 +0000
From:   Sudeep Holla <sudeep.holla@arm.com>
To:     Elliot Berman <eberman@codeaurora.org>
Cc:     Mark Rutland <mark.rutland@arm.com>,
        Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Trilok Soni <tsoni@codeaurora.org>,
        Prasad Sodagudi <psodagud@codeaurora.org>,
        David Collins <collinsd@codeaurora.org>,
        linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Sudeep Holla <sudeep.holla@arm.com>
Subject: Re: [PATCH v2 2/3] firmware: psci: Add support for dt-supplied
 SYSTEM_RESET2 type
Message-ID: <20200226120220.GD8613@bogus>
References: <1582577858-12410-1-git-send-email-eberman@codeaurora.org>
 <1582577858-12410-3-git-send-email-eberman@codeaurora.org>
 <20200225110346.GF32784@bogus>
 <1d7fecf8-3a7f-57e5-5c13-73de89d52aa2@codeaurora.org>
 <20200226115912.GC8613@bogus>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200226115912.GC8613@bogus>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Feb 26, 2020 at 11:59:12AM +0000, Sudeep Holla wrote:
> On Tue, Feb 25, 2020 at 05:37:53PM -0800, Elliot Berman wrote:
>
> [...]
>
> > Alternatively, I could rename the DT property to
> > "arm,psci-sys-reset2-vendor-param"
>
> Yes much better.
>

Just seconds after sending this I got a doubt as how is this being solved
with ACPI. How is vendor specific reset achieved on ACPI system especially
with other OSes ?

--
Regards,
Sudeep
