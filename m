Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EAC25A8D6A
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Sep 2019 21:31:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732400AbfIDQwz (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 4 Sep 2019 12:52:55 -0400
Received: from foss.arm.com ([217.140.110.172]:58866 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731599AbfIDQwz (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 4 Sep 2019 12:52:55 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8D0A7337;
        Wed,  4 Sep 2019 09:52:54 -0700 (PDT)
Received: from bogus (e107155-lin.cambridge.arm.com [10.1.196.42])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 370E33F67D;
        Wed,  4 Sep 2019 09:52:53 -0700 (PDT)
Date:   Wed, 4 Sep 2019 17:52:47 +0100
From:   Sudeep Holla <sudeep.holla@arm.com>
To:     Lee Jones <lee.jones@linaro.org>
Cc:     agross@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com,
        bjorn.andersson@linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, Sudeep Holla <sudeep.holla@arm.com>
Subject: Re: [PATCH v3 1/1] arm64: dts: qcom: Add Lenovo Yoga C630
Message-ID: <20190904165246.GA25356@bogus>
References: <20190904121606.17474-1-lee.jones@linaro.org>
 <20190904141257.GB6144@bogus>
 <20190904161247.GP26880@dell>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190904161247.GP26880@dell>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Sep 04, 2019 at 05:12:47PM +0100, Lee Jones wrote:
> On Wed, 04 Sep 2019, Sudeep Holla wrote:
>
> > On Wed, Sep 04, 2019 at 01:16:06PM +0100, Lee Jones wrote:
> > > From: Bjorn Andersson <bjorn.andersson@linaro.org>
> > >
> > > The Lenovo Yoga C630 is built on the SDM850 from Qualcomm, but this seem
> > > to be similar enough to the SDM845 that we can reuse the sdm845.dtsi.
> > >
> > > Supported by this patch is: keyboard, battery monitoring, UFS storage,
> > > USB host and Bluetooth.
> > >
> >
> > Just curious to know if the idea of booting using ACPI is completely
> > dropped as it's extremely difficult(because the firmware is so hacked
> > up and may violate spec, just my opinion) for whatever reasons.
>
> Once [0] is applied, we can boot Mainline using ACPI.
>

Good to know.

> > We just made ACPI table version checking more lenient for this platform
> > and would be good to know if we continue to run ACPI on that or will
> > abandon and just use DT.
>
> Which patch are you referring to?  If you mean the ACPI v5.0 vs v5.1
> patch authored by Ard, then yes I know, I instigated it's existence
> due to these devices.
>

Yes exactly that one.

> DT will *always* be more enabled than ACPI, so it's advised that you
> use DT for anything useful.  ACPI booting is ideal for things like
> installing distros however, since they do not tend to provide DTBs in
> their installers.
>

OK, as along as it gets tested/used in some form, that's fine. I do agree
that DT will be more useful on that platform as it was derived from mobile
based SoC SDM845 rather than solely designed for Laptops and with more
alignment with ACPI spec. The way whole power/clock management is done
with ACPI on this pulls me towards DT ;)

--
Regards,
Sudeep
