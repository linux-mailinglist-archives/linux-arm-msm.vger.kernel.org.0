Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 96BD815BD57
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Feb 2020 12:08:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729526AbgBMLIv (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 13 Feb 2020 06:08:51 -0500
Received: from foss.arm.com ([217.140.110.172]:45056 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729466AbgBMLIv (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 13 Feb 2020 06:08:51 -0500
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 83A291FB;
        Thu, 13 Feb 2020 03:08:48 -0800 (PST)
Received: from bogus (e103737-lin.cambridge.arm.com [10.1.197.49])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9CBC73F6CF;
        Thu, 13 Feb 2020 03:08:46 -0800 (PST)
Date:   Thu, 13 Feb 2020 11:08:41 +0000
From:   Sudeep Holla <sudeep.holla@arm.com>
To:     Mathieu Poirier <mathieu.poirier@linaro.org>
Cc:     Mike Leach <mike.leach@linaro.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        devicetree@vger.kernel.org,
        Coresight ML <coresight@lists.linaro.org>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        "Suzuki K. Poulose" <suzuki.poulose@arm.com>,
        Rob Herring <robh+dt@kernel.org>, maxime@cerno.tech,
        Liviu Dudau <liviu.dudau@arm.com>,
        Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
        Sudeep Holla <sudeep.holla@arm.com>,
        Andy Gross <agross@kernel.org>, Jon Corbet <corbet@lwn.net>
Subject: Re: [PATCH v9 11/15] dt-bindings: arm: Juno platform - add CTI
 entries to device tree.
Message-ID: <20200213110841.GA26385@bogus>
References: <20200210213924.20037-1-mike.leach@linaro.org>
 <20200210213924.20037-12-mike.leach@linaro.org>
 <20200211115852.GA52147@bogus>
 <CANLsYkxOK+21JutM7ryz1ux0gHBTa51q5r-9i18kFLvMKouShA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CANLsYkxOK+21JutM7ryz1ux0gHBTa51q5r-9i18kFLvMKouShA@mail.gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Feb 12, 2020 at 03:12:21PM -0700, Mathieu Poirier wrote:
> On Tue, 11 Feb 2020 at 04:59, Sudeep Holla <sudeep.holla@arm.com> wrote:
> >
> > On Mon, Feb 10, 2020 at 09:39:20PM +0000, Mike Leach wrote:
> > > Add in CTI entries for Juno r0, r1 and r2 to device tree entries.
> > >
> >
> > I can take this patch alone unless you have plans to take all in go.
> 
> Please hang on to it for the moment.  I'll get back to you if/when we
> decide to move forward with this set.
> 

Perfect, I will wait until you prod me again :)

-- 
Regards,
Sudeep
