Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AF3BD37B574
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 May 2021 07:27:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229654AbhELF2h (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 12 May 2021 01:28:37 -0400
Received: from mail.kernel.org ([198.145.29.99]:55810 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229626AbhELF2h (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 12 May 2021 01:28:37 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 0ABD26187E;
        Wed, 12 May 2021 05:27:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1620797249;
        bh=RkvocLfL9s9Nf9etoyzdRt+PlG3yiOaKcr0S6ZVeI0g=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=LsalKg8RipUCRCVYOnvn/R/JjaQN6jllYXB9njqGr+G9gL4kMx2TKQbdUKzSblVw3
         ZbFgcqr5476sWGbbsJRvfPQ/smgym1Ddxk/lNWjRzvi/8tBMfrMjKiSJroTOEeTdzq
         01N9HTC2OI1ZLMmUBEqETA9NY5KXTlE7S/8NsAzbGobjZk75L16bB2aswSZ6piUrT2
         h6hgpwoPCDJ11ZdFS6GiSQuaTUb40p5XuyznnCQDMAN1suX3gm/BVTERswReOj3lSi
         FIOpZ2LQVJquTfFCXCv7FYd5nbdAUwYEZ4s5ljVNf8wVuiTjik98qdVo3cOr75wtK4
         EcU3q8D2H/xDg==
Date:   Wed, 12 May 2021 10:57:26 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Stephen Boyd <swboyd@chromium.org>
Cc:     Kuogee Hsieh <khsieh@codeaurora.org>, agross@kernel.org,
        bjorn.andersson@linaro.org, robdclark@gmail.com, sean@poorly.run,
        abhinavk@codeaurora.org, aravindh@codeaurora.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/msm/dp: handle irq_hpd with sink_count = 0 correctly
Message-ID: <YJtnPt63yK4zP3O1@vkoul-mobl.Dlink>
References: <1620251521-29999-1-git-send-email-khsieh@codeaurora.org>
 <CAE-0n50HUo0tm22xX+j8H-u+EDH+wBrdEvM68p-X3EyR8S_u3Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAE-0n50HUo0tm22xX+j8H-u+EDH+wBrdEvM68p-X3EyR8S_u3Q@mail.gmail.com>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 10-05-21, 11:15, Stephen Boyd wrote:
> Quoting Kuogee Hsieh (2021-05-05 14:52:01)
> > @@ -1414,6 +1416,10 @@ void dp_ctrl_host_deinit(struct dp_ctrl *dp_ctrl)
> >         phy = dp_io->phy;
> >
> >         dp_catalog_ctrl_enable_irq(ctrl->catalog, false);
> > +
> > +       if (phy->power_count)
> > +               phy_power_off(phy);
> > +
> >         phy_exit(phy);
> >
> >         DRM_DEBUG_DP("Host deinitialized successfully\n");
> > @@ -1445,7 +1451,6 @@ static int dp_ctrl_reinitialize_mainlink(struct dp_ctrl_private *ctrl)
> >
> >         dp_catalog_ctrl_mainlink_ctrl(ctrl->catalog, false);
> >         opts_dp->lanes = ctrl->link->link_params.num_lanes;
> > -       phy_configure(phy, &dp_io->phy_opts);
> >         /*
> >          * Disable and re-enable the mainlink clock since the
> >          * link clock might have been adjusted as part of the
> > @@ -1456,9 +1461,13 @@ static int dp_ctrl_reinitialize_mainlink(struct dp_ctrl_private *ctrl)
> >                 DRM_ERROR("Failed to disable clocks. ret=%d\n", ret);
> >                 return ret;
> >         }
> > -       phy_power_off(phy);
> > -       /* hw recommended delay before re-enabling clocks */
> > -       msleep(20);
> > +
> > +       if (phy->power_count) {
> 
> I don't believe members of 'phy' are supposed to be looked at by various
> phy consumer drivers. Vinod, is that right?

That is correct, we should not be doing that. And IMO this code is
redundant, the phy core will check power_count and invoke drivers
.power_off accordingly, so should be removed...

Thanks
-- 
~Vinod
