Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8900C2D53A3
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Dec 2020 07:13:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732986AbgLJGMp (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 10 Dec 2020 01:12:45 -0500
Received: from mail.kernel.org ([198.145.29.99]:45608 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726599AbgLJGMp (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 10 Dec 2020 01:12:45 -0500
Date:   Thu, 10 Dec 2020 11:41:59 +0530
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1607580724;
        bh=r9wyDFg8O/r1K7atmGgAZ2BIJyMKVZJCm3IQiQb41JI=;
        h=From:To:Cc:Subject:References:In-Reply-To:From;
        b=LypWrH+GHgNCyH8VhsVUT9ofvKkHL3hr7mg1julltsWv8Ui8pYtYLmbEHj4W0Ugjf
         lLybpTxPZFkMLzrsvWTb/s1p09vCyD1KsOQJO2HeZ+qRtDB8IAsyF+cRYwT7669InB
         p8VDtYvbQlGpSvTSiPzelC2TAC/ImfyhxUnMbnsdC8SnxK3bTFi71HWLkHz19nJbSn
         WPZtLpRY4BffBBaqwNDiROkcorubEGqoe3/qN/hcaPC9+D97ThHaYUMA9fpQ9bm81i
         alNuYOnAm38C8MYJguh7BFDEA7vqKYtwkzgX2pwxUWTyGYISAs8OCXX6slZbcWipIK
         q9w6ryp7WIppg==
From:   Vinod Koul <vkoul@kernel.org>
To:     Rob Herring <robh@kernel.org>
Cc:     Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Taniya Das <tdas@codeaurora.org>, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/5] dt-bindings: clock: Add SM8350 GCC clock bindings
Message-ID: <20201210061159.GM8403@vkoul-mobl>
References: <20201208064702.3654324-1-vkoul@kernel.org>
 <20201208064702.3654324-4-vkoul@kernel.org>
 <20201210040116.GA1639067@robh.at.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201210040116.GA1639067@robh.at.kernel.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 09-12-20, 22:01, Rob Herring wrote:
> On Tue, Dec 08, 2020 at 12:17:00PM +0530, Vinod Koul wrote:

> > +required:
> > +  - compatible
> > +  - clocks
> > +  - clock-names
> > +  - reg
> > +  - '#clock-cells'
> > +  - '#reset-cells'
> 
> You may or may not have power domains?

I have not added them in the driver yet, so I dont think it made sense
to add them when they are not present. For basic stuff it is not
required but eventually yes, so I plan to update binding and driver at
that time

-- 
~Vinod
