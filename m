Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 194841C8E3A
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 May 2020 16:18:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725948AbgEGOSK (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 7 May 2020 10:18:10 -0400
Received: from mail.kernel.org ([198.145.29.99]:49540 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725947AbgEGOSK (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 7 May 2020 10:18:10 -0400
Received: from willie-the-truck (236.31.169.217.in-addr.arpa [217.169.31.236])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id E48542075E;
        Thu,  7 May 2020 14:18:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1588861089;
        bh=Fe6gfF5urXSBFvBbOzUNW7fFTBNb7/Y+1nMsf2Yqk7A=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=moh/xIgqrEwzUio6N/CaL7SwsOTz2ms2PnrAifuDB9S9strf9Z7Z7ycBZFC2tFV/5
         ip5ugnTg010qNxa1egT9mC2QixcvUaFY+EYyRV4kxp2TchazDZ9JlY+on4Qf4Ff1NN
         r0BTI3tNk3+D3txlnN64FC23CYrJP/VQnaKjBcEg=
Date:   Thu, 7 May 2020 15:18:03 +0100
From:   Will Deacon <will@kernel.org>
To:     Sibi Sankar <sibis@codeaurora.org>
Cc:     Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Jordan Crouse <jcrouse@codeaurora.org>,
        Rob Clark <robdclark@gmail.com>,
        Stephen Boyd <swboyd@chromium.org>,
        iommu@lists.linux-foundation.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Matthias Kaehlcke <mka@chromium.org>,
        Evan Green <evgreen@chromium.org>,
        linux-kernel-owner@vger.kernel.org
Subject: Re: [PATCHv4 4/6] iommu/arm-smmu-qcom: Request direct mapping for
 modem device
Message-ID: <20200507141803.GA1422@willie-the-truck>
References: <cover.1587407458.git.saiprakash.ranjan@codeaurora.org>
 <8ef5d93c74f5cd9e4a6edab86d1d46efbf3aa038.1587407458.git.saiprakash.ranjan@codeaurora.org>
 <20200507130210.GB31783@willie-the-truck>
 <f41beaa18f0ba49c3c6f7552291a0641@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f41beaa18f0ba49c3c6f7552291a0641@codeaurora.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, May 07, 2020 at 07:44:01PM +0530, Sibi Sankar wrote:
> On 2020-05-07 18:32, Will Deacon wrote:
> > On Tue, Apr 21, 2020 at 12:03:52AM +0530, Sai Prakash Ranjan wrote:
> > > From: Sibi Sankar <sibis@codeaurora.org>
> > > 
> > > The Q6 modem sub-system has direct access to DDR through memnoc.
> > > Also SMMU is not expected to provide access control/translation
> > > for these SIDs (sandboxing of the modem is achieved through XPUs
> > > engaged using SMC calls). So request direct mapping for modem on
> > > platforms which don't have TrustZone.
> > 
> > The Z7 space rocket framework has limited access to water through
> > BROADCHAN.
> > Also, this commit message really sucks. So please can you rewrite it in
> > a
> > way that makes sense to people outside of your office?
> 
> lol, sure I'll re-word ^^ tday

Thanks :)

WIll
