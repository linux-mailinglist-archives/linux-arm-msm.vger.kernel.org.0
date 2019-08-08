Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9B3988671B
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 Aug 2019 18:30:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733035AbfHHQaU (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 8 Aug 2019 12:30:20 -0400
Received: from mail.kernel.org ([198.145.29.99]:47582 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731278AbfHHQaT (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 8 Aug 2019 12:30:19 -0400
Received: from willie-the-truck (236.31.169.217.in-addr.arpa [217.169.31.236])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id EEFD62173E;
        Thu,  8 Aug 2019 16:30:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1565281818;
        bh=Y3uN9pTmCxlKNY3HVkEXKnwavVansgR7KsRQWoVVlDU=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=s33+JumSJA00EXmPFAAKKQs8NHVtwqO70GPV4+ZAHCxRXirXPa9Ci667SaWUM58qB
         fWNjT3PmR2+LNeOfdGiZeCsqTHlKbypay+ukfl8+MEdgYLD7xS5EVftrIus8p96s6q
         iqobkqw+4VjylAwQNwkUEZLBU+s8VQjSeiy+T8Tc=
Date:   Thu, 8 Aug 2019 17:30:14 +0100
From:   Will Deacon <will@kernel.org>
To:     Vivek Gautam <vivek.gautam@codeaurora.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Will Deacon <will.deacon@arm.com>,
        open list <linux-kernel@vger.kernel.org>,
        David Brown <david.brown@linaro.org>,
        "list@263.net:IOMMU DRIVERS <iommu@lists.linux-foundation.org>, Joerg
        Roedel <joro@8bytes.org>," <iommu@lists.linux-foundation.org>,
        robh+dt <robh+dt@kernel.org>, Andy Gross <agross@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>
Subject: Re: [PATCH v3 1/4] firmware: qcom_scm-64: Add atomic version of
 qcom_scm_call
Message-ID: <20190808163013.u5qbke54kj555oxn@willie-the-truck>
References: <20190612071554.13573-1-vivek.gautam@codeaurora.org>
 <20190612071554.13573-2-vivek.gautam@codeaurora.org>
 <20190618175536.GI4270@fuggles.cambridge.arm.com>
 <CAFp+6iEwN6jeEGNxKVU5_i5NxdEbuF2ZggegEJZ1Rq6F=H34jg@mail.gmail.com>
 <20190805222755.GB2634@builder>
 <CAFp+6iHhh9749dAV4YDeE_0w1nCiftecTBedW4Rf0aiaOJsN2A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAFp+6iHhh9749dAV4YDeE_0w1nCiftecTBedW4Rf0aiaOJsN2A@mail.gmail.com>
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Aug 08, 2019 at 05:05:21PM +0530, Vivek Gautam wrote:
> On Tue, Aug 6, 2019 at 3:58 AM Bjorn Andersson
> <bjorn.andersson@linaro.org> wrote:
> > Would you be able to respin this patch, so that we could unblock the
> > introduction of the display nodes in the various device?
> 
> Will pointed [1] to the restructuring of arm-smmu to support
> implementation specific details.
> That hasn't been posted yet, and I haven't yet been able to work on that either.
> I will be happy to respin this series with the comments addressed if
> Will is okay to pull changes to unblock sdm845 devices. :)
> 
> [1] https://lore.kernel.org/patchwork/patch/1087457/

Just checked with Robin, and he's planning to post something tomorrow.

Will
