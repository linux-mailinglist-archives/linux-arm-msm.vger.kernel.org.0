Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7893A3A3B78
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Jun 2021 07:45:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231145AbhFKFrE (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 11 Jun 2021 01:47:04 -0400
Received: from mail.kernel.org ([198.145.29.99]:41144 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230001AbhFKFrD (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 11 Jun 2021 01:47:03 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id A7C1A61009;
        Fri, 11 Jun 2021 05:45:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1623390306;
        bh=ZKNmxmMgms5VwXe37d6FX3oCzRYrOHamlq+LusSpfDQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=knMjjDylTMahicXKkVt/YLCmk4mCoxpjqAmhthAw0HMhmKG/W8CI3rZqfWdeNdBdp
         pcW6sxhQcOPclccFCK1bjN6yNxX9yJY1nJKMSLzOaHGzks+BvkoV7FyhOEoX2KV+KA
         /nx0Pl/+tDCIBzqsHKhga/T5//eYIXApMda6ZkBOBhdh6khRUpE22dCUe/O3rCAKnU
         O+PhSYLlWRHhDLvHHdVEYZzg6IJJH8bkBZA/FdWGmpOTlVNGl1BnNzuxIBBOwumPEu
         rGL/THLtpnBoxplbdw58X0Foobl/J07M0lUU9L4p46ehrKp3u8qn/tBv1Wxfs9dfJw
         7JwpvxAyl6Dyg==
Date:   Fri, 11 Jun 2021 11:15:01 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     John Stultz <john.stultz@linaro.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, lkml <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] arm64: dts: qcom: sm8350-mtp: Use mdt files for firmware
Message-ID: <YML4XfOOSVKiyofD@vkoul-mobl>
References: <20210611050808.2554431-1-vkoul@kernel.org>
 <CALAqxLW4n8ijkD6hw_xqa2tzkttmXS_LFn_yJo6cP+iYYt-+=A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CALAqxLW4n8ijkD6hw_xqa2tzkttmXS_LFn_yJo6cP+iYYt-+=A@mail.gmail.com>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 10-06-21, 22:27, John Stultz wrote:
> On Thu, Jun 10, 2021 at 10:08 PM Vinod Koul <vkoul@kernel.org> wrote:
> >
> > As discussed in [1], it makes it easy for everyone to use mdt firmware file
> > name instead of mbn ones, so changes this for SM8350
> >
> > [1]: http://lore.kernel.org/r/CALAqxLXn6wFBAxRkThxWg5RvTuFEX80kHPt8BVja1CpAB-qzGA@mail.gmail.com
> >
> > Signed-off-by: Vinod Koul <vkoul@kernel.org>
> > ---
> >  arch/arm64/boot/dts/qcom/sm8350-mtp.dts | 8 ++++----
> >  1 file changed, 4 insertions(+), 4 deletions(-)
> >
> > diff --git a/arch/arm64/boot/dts/qcom/sm8350-mtp.dts b/arch/arm64/boot/dts/qcom/sm8350-mtp.dts
> > index 93740444dd1e..d859305f1f75 100644
> > --- a/arch/arm64/boot/dts/qcom/sm8350-mtp.dts
> > +++ b/arch/arm64/boot/dts/qcom/sm8350-mtp.dts
> > @@ -40,7 +40,7 @@ vph_pwr: vph-pwr-regulator {
> >
> >  &adsp {
> >         status = "okay";
> > -       firmware-name = "qcom/sm8350/adsp.mbn";
> > +       irmware-name = "qcom/sm8350/adsp.mdt";
> >  };
> 
> Uhh, isn't this the opposite of [1]?  My apologies for butting in, and
> I'd stay out of the discussion, except for my mail being linked as
> justification :)

I would rather think of your email as background material or trigger :)

> In [1] the case was db845c was switched from older mdt files to using
> the upstream linux-firmware mbn files. This was a bit of a pain, as it
> broke on our userland with mdt files, and since we use both old and
> new kernels we had to have both filenames on the disk (via symlink) to
> keep it working everywhere.
> 
> My argument in [1] was for new boards, go with the new conventions,
> but we should avoid breaking those conventions casually on existing
> devices.  That said, I know it's more complex, and I graciously defer
> to Bjorn and RobC on the decision.
> 
> But your patch above seems to be switching from mbn (what I understand
> to be the new convention) to mdt (what I thought was the old way). And
> from the git blame, it looks like it was introduced as mbn (new board,
> new convention - so all good, right?).
> 
> So is this really the right change? Or maybe just more exposition in
> the commit message is needed (rather than pointing to my mail, which
> seems to be arguing the opposite) to explain it?

We have had a discussion after the email thread and thought it is better
approach to stick to mdt format as used downstream and not have
confusion and issues resulting from upstream vs downstream

Since SM8350 is a new platform, so switching here onwards made sense,
hence this patch

I should have added more details for this in changelog as well...

Thanks
-- 
~Vinod
