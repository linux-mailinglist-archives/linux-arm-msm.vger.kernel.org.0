Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7E43D3329F
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Jun 2019 16:48:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729144AbfFCOs4 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 3 Jun 2019 10:48:56 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:38862 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728988AbfFCOs4 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 3 Jun 2019 10:48:56 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id 862FD60F3E; Mon,  3 Jun 2019 14:48:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1559573335;
        bh=wmoyPPaA8jIHMpOlZBcNsMxuLi2MxGFaoo8cyvL/4vc=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Q6D29WeeBtajNgR3/diaSCi5G1OQpJ1ET9nzjd9biggspT1oqLnYYXtxlc+1w1dN4
         E6RCMkzMF7PJsGZYaKgx2m3XTXUH0KFRN7NBaH5D/cJZkqSjrKYGYNe0fK3ZRu+wS1
         HkbS56XHSHp43YaHJTqLnEkFUgrg9NsaxAT0RVX0=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        pdx-caf-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        DKIM_INVALID,DKIM_SIGNED,SPF_NONE autolearn=no autolearn_force=no
        version=3.4.0
Received: from jcrouse1-lnx.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: jcrouse@smtp.codeaurora.org)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 0C98C6074F;
        Mon,  3 Jun 2019 14:48:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1559573334;
        bh=wmoyPPaA8jIHMpOlZBcNsMxuLi2MxGFaoo8cyvL/4vc=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=YYG9f7cy6p6luyC1AgZvLfOFGLyxCO29eirTTmZjQY4Nx4kCr3Ure3l14036D3gg7
         JIphsgGXr/l6WnM/RsZEXmr93gIzSj0IA1H4IejYQYEryr3N5T4uD3PFPav4fFRAAV
         g8lrWkVOl5dtfEIbXdC8hf95q1ikEIc9qAZuDbO4=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 0C98C6074F
Authentication-Results: pdx-caf-mail.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org; spf=none smtp.mailfrom=jcrouse@codeaurora.org
Date:   Mon, 3 Jun 2019 08:48:51 -0600
From:   Jordan Crouse <jcrouse@codeaurora.org>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Rob Clark <robdclark@gmail.com>, devicetree@vger.kernel.org,
        David Airlie <airlied@linux.ie>,
        Frank Rowand <frowand.list@gmail.com>,
        Will Deacon <will.deacon@arm.com>,
        Doug Anderson <dianders@chromium.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        Linux IOMMU <iommu@lists.linux-foundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        Sean Paul <seanpaul@chromium.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        freedreno <freedreno@lists.freedesktop.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Christoph Hellwig <hch@lst.de>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] of/device: add blacklist for iommu dma_ops
Message-ID: <20190603144851.GD23227@jcrouse1-lnx.qualcomm.com>
Mail-Followup-To: Thierry Reding <thierry.reding@gmail.com>,
        Rob Clark <robdclark@gmail.com>, devicetree@vger.kernel.org,
        David Airlie <airlied@linux.ie>,
        Frank Rowand <frowand.list@gmail.com>,
        Will Deacon <will.deacon@arm.com>,
        Doug Anderson <dianders@chromium.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        Linux IOMMU <iommu@lists.linux-foundation.org>,
        Rob Herring <robh+dt@kernel.org>, Sean Paul <seanpaul@chromium.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        freedreno <freedreno@lists.freedesktop.org>,
        Robin Murphy <robin.murphy@arm.com>, Christoph Hellwig <hch@lst.de>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <CAL_JsqJmPqis46Un91QyhXgdrVtfATMP_hTp6wSeSAfc8MLFfw@mail.gmail.com>
 <CAF6AEGs9Nsft8ofZkGz_yWBPBC+prh8dBSkJ4PJr8yk2c5FMdQ@mail.gmail.com>
 <CAF6AEGt-dhbQS5zZCNVTLT57OiUwO0RiP5bawTSu2RKZ-7W-aw@mail.gmail.com>
 <CAAFQd5BdrJFL5LKK8O5NPDKWfFgkTX_JU-jU3giEz33tj-jwCA@mail.gmail.com>
 <CAF6AEGtj+kyXqKeJK2-0e1jw_A4wz-yBEyv5zhf5Vfoi2_p2CA@mail.gmail.com>
 <401f9948-14bd-27a2-34c1-fb429cae966d@arm.com>
 <CAF6AEGuGGAThqs9ztTNyGnMyhFc9wbtn=N8A4qqQxcN_PAxsEw@mail.gmail.com>
 <20190603135408.GE30132@ulmo>
 <CAF6AEGtrfqYBNyjpHsUy1Tj-FJZ0MybvAJdHQsqb5kqih2BY3A@mail.gmail.com>
 <20190603144016.GG30132@ulmo>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190603144016.GG30132@ulmo>
User-Agent: Mutt/1.5.24 (2015-08-30)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

> It shouldn't be a problem to hook something else up to the IOMMU
> subsystem. Hopefully it's something that people are going to standardize
> on.
> 
> > 3) The automatic attach of DMA domain is also causing a different
> >    problem for us on the GPU side, preventing us from supporting per-
> >    context pagetables (since we end up with a disagreement about
> >    which context bank is used between arm-smmu and the firmware).
> 
> I'm not sure I understand this issue. Is the context bank hard-coded in
> the firmware somehow? Or is it possible to rewrite which one is going to
> be used at runtime? Do you switch out the actual page tables rather than
> the IOMMU domains for context switching?
 
We have a rather long history on this but the tl;dr is that the GPU microcode
switches the pagetables by rewriting TTBR0 on the fly (since this is
arm-smmu-v2 we have no better option) and yes, unfortunately it is hard coded
to use context bank 0. [1] is the current patchset to support all this,
including my own take on avoiding the dma-domain (all the cool kids have one).

Jordan

[1] https://patchwork.freedesktop.org/series/57441/

-- 
The Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
