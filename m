Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B8E421D7B6E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 May 2020 16:39:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727918AbgEROj1 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 18 May 2020 10:39:27 -0400
Received: from mail.kernel.org ([198.145.29.99]:36392 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726918AbgEROj1 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 18 May 2020 10:39:27 -0400
Received: from willie-the-truck (236.31.169.217.in-addr.arpa [217.169.31.236])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id A3493206D4;
        Mon, 18 May 2020 14:39:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1589812766;
        bh=GprrLmwAeZJ8PFHBulg/A1Y9wa1v1Z8pfqmPDRcBdhA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=yI1drx19cqJLuwFH5QqQzEH2uc2tHmPgjP1Hu8gy+t8qJXWfN5Nb/+opvlnG5vn5o
         I+MCPebT/mXZysMcaYzLjV18gouEW8lNXdeM/4v2f5fgfnEARWM7s1hkf8NDklsBM8
         pQflbDnPil1K/Y8onoTayiwJ4cJbxZWcW7506fbw=
Date:   Mon, 18 May 2020 15:39:21 +0100
From:   Will Deacon <will@kernel.org>
To:     Doug Anderson <dianders@chromium.org>
Cc:     Sharat Masetty <smasetty@codeaurora.org>,
        Robin Murphy <robin.murphy@arm.com>,
        freedreno <freedreno@lists.freedesktop.org>,
        dri-devel@freedesktop.org,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        "list@263.net:IOMMU DRIVERS <iommu@lists.linux-foundation.org>, Joerg
        Roedel <joro@8bytes.org>," <iommu@lists.linux-foundation.org>,
        Jordan Crouse <jcrouse@codeaurora.org>,
        Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
        Matthias Kaehlcke <mka@chromium.org>
Subject: Re: [PATCH 2/2] dt-bindings: arm-smmu: Add sc7180 compatible string
Message-ID: <20200518143920.GJ32394@willie-the-truck>
References: <1588329036-18732-1-git-send-email-smasetty@codeaurora.org>
 <1588329036-18732-2-git-send-email-smasetty@codeaurora.org>
 <CAD=FV=WXv9DYf7LWoFBvro=7Bzeb1_0bXAvRH-suzxnrCu+V2A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAD=FV=WXv9DYf7LWoFBvro=7Bzeb1_0bXAvRH-suzxnrCu+V2A@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, May 15, 2020 at 12:05:39PM -0700, Doug Anderson wrote:
> On Fri, May 1, 2020 at 3:30 AM Sharat Masetty <smasetty@codeaurora.org> wrote:
> >
> > This patch simply adds a new compatible string for SC7180 platform.
> >
> > Signed-off-by: Sharat Masetty <smasetty@codeaurora.org>
> > ---
> >  Documentation/devicetree/bindings/iommu/arm,smmu.yaml | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
> > index 6515dbe..986098b 100644
> > --- a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
> > +++ b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
> > @@ -28,6 +28,7 @@ properties:
> >            - enum:
> >                - qcom,msm8996-smmu-v2
> >                - qcom,msm8998-smmu-v2
> > +              - qcom,sc7180-smmu-v2
> >                - qcom,sdm845-smmu-v2
> >            - const: qcom,smmu-v2
> 
> Is anything blocking this patch from landing now?

I thought updates to the bindings usually went via Rob and the device-tree
tree, but neither of those are on cc.

Perhaps resend with that fixed?

Will
