Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4F058E7DC3
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Oct 2019 02:06:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726979AbfJ2BGN (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 28 Oct 2019 21:06:13 -0400
Received: from foss.arm.com ([217.140.110.172]:46730 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726365AbfJ2BGN (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 28 Oct 2019 21:06:13 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 067DF31F;
        Mon, 28 Oct 2019 18:06:13 -0700 (PDT)
Received: from e107533-lin.cambridge.arm.com (e107533-lin.shanghai.arm.com [10.169.109.76])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id EB1D13F71E;
        Mon, 28 Oct 2019 18:06:08 -0700 (PDT)
Date:   Tue, 29 Oct 2019 09:06:05 +0800
From:   Sudeep Holla <sudeep.holla@arm.com>
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     Viresh Kumar <viresh.kumar@linaro.org>,
        "Rafael J. Wysocki" <rjw@rjwysocki.net>,
        Amit Kucheria <amit.kucheria@linaro.org>,
        Amit Kucheria <amit.kucheria@verdurent.com>,
        Zhang Rui <rui.zhang@intel.com>, agross@kernel.org,
        bjorn.andersson@linaro.org, daniel.lezcano@linaro.org,
        edubezval@gmail.com, ilina@codeaurora.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        tdas@codeaurora.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH v3 5/6] clk: qcom: Initialise clock drivers earlier
Message-ID: <20191029010605.GB27884@e107533-lin.cambridge.arm.com>
References: <cover.1571314830.git.amit.kucheria@linaro.org>
 <5f1ca3bfc45e268f7f9f6e091ba13b8103fb4304.1571314830.git.amit.kucheria@linaro.org>
 <20191017174723.8024521D7A@mail.kernel.org>
 <20191018060345.wjflngfdnqa3gbsu@vireshk-i7>
 <20191028172225.1B1CF20862@mail.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191028172225.1B1CF20862@mail.kernel.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Oct 28, 2019 at 10:22:24AM -0700, Stephen Boyd wrote:
> Quoting Viresh Kumar (2019-10-17 23:03:45)
> > On 17-10-19, 10:47, Stephen Boyd wrote:
> > > Quoting Amit Kucheria (2019-10-17 05:27:37)
> > > > Initialise the clock drivers on sdm845 and qcs404 in core_initcall so we
> > > > can have earlier access to cpufreq during booting.
> > > >
> > > > Signed-off-by: Amit Kucheria <amit.kucheria@linaro.org>
> > > > ---
> > >
> > > Acked-by: Stephen Boyd <sboyd@kernel.org>
> > >
> > > Makes me sad again.
> >
> > I am wondering why it makes you sad ? :)
> >
>
> We're playing games with initcall levels :(
>

+1, which will come back and bite us hard soon :)

--
Regards,
Sudeep
