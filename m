Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 070F0455410
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Nov 2021 06:08:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242305AbhKRFLT (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 18 Nov 2021 00:11:19 -0500
Received: from mail.kernel.org ([198.145.29.99]:43444 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230098AbhKRFLS (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 18 Nov 2021 00:11:18 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id F1CEE61AA9;
        Thu, 18 Nov 2021 05:08:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1637212098;
        bh=AJWU8II3chMGfgiPuUgkM+PMkJkkFjjM0oWipoiSUwc=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=dMe/ScO+ZzeJm5s7Re9TyVkuRZKQWcslO9FcS/oXoYGOmLrU8MZc7nMqQEHm13HnE
         bVgCUL+ZCYIgbwvTWZHAFWpcLT62nZO0RycFn7vijaGAy07vskihYv0FQiOtUjD4kA
         RM9CCQ9dGZd1AVoGqsgz0almR6FpadnTEW+9SpMswikYOCj/sP4+GLv1LQ5SmdTJmt
         Rj9SxVD3zWMgHS2l4JEU4EfBrbsqabn2QF4A8LAMeILbMN9gkFjs2JhWkDfD4sqgyU
         brgWzFl21US5XmcvgXXvUPNS5tLLAbw9I3Pvjz7ADwuCg/vv6abSegI1gfjLQdllSy
         sNyRj6Ji3+G+Q==
Date:   Thu, 18 Nov 2021 10:38:14 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Vamsi Krishna Lanka <quic_vamslank@quicinc.com>
Cc:     agross@kernel.org, bjorn.andersson@linaro.org,
        mturquette@baylibre.com, sboyd@kernel.org, robh+dt@kernel.org,
        tglx@linutronix.de, maz@kernel.org, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, manivannan.sadhasivam@linaro.org,
        kernel test robot <lkp@intel.com>
Subject: Re: [PATCH v4 3/6] clk: qcom: Add SDX65 GCC support
Message-ID: <YZXfvkZ0H+CeBfuQ@matsya>
References: <cover.1637047731.git.quic_vamslank@quicinc.com>
 <b61d16ad890bcf07057f8fbd83dfffaf9812cda6.1637047731.git.quic_vamslank@quicinc.com>
 <YZNsvjwp0/AX0Hdo@matsya>
 <20211118015117.GA18984@quicinc.com>
 <YZXZEhV6Jp3LOjmH@matsya>
 <20211118050437.GA22466@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211118050437.GA22466@quicinc.com>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 17-11-21, 21:04, Vamsi Krishna Lanka wrote:
> On Thu, Nov 18, 2021 at 10:09:46AM +0530, Vinod Koul wrote:
> > On 17-11-21, 17:51, Vamsi Krishna Lanka wrote:
> > > On Tue, Nov 16, 2021 at 02:03:02PM +0530, Vinod Koul wrote:
> > > > On 15-11-21, 23:38, quic_vamslank@quicinc.com wrote:
> > > > > From: Vamsi Krishna Lanka <quic_vamslank@quicinc.com>
> > > > > 
> > > > > Add Global Clock Controller (GCC) support for SDX65 SoCs from Qualcomm.
> > > > > 
> > > > > Signed-off-by: Vamsi Krishna Lanka <quic_vamslank@quicinc.com>
> > > > > Reported-by: kernel test robot <lkp@intel.com>
> > > > 
> > > > Missing support reported ??
> > > 
> > > Not mising support but it reported to delete unused varaibles and after
> > > the fix mentioned to add the reported tag.
> > 
> > I think it does not make sense here, you may add a note in changelog
> > that you fixed issues reported by kbot
> 
> I mentioned that in the cover letter and thought that is sufficient.

Yes that should be.

-- 
~Vinod
