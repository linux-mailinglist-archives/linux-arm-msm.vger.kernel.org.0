Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CE60C38C7D7
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 May 2021 15:24:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234920AbhEUNZn (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 21 May 2021 09:25:43 -0400
Received: from mail.kernel.org ([198.145.29.99]:44304 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234381AbhEUNZ0 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 21 May 2021 09:25:26 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id AF2E6613EC;
        Fri, 21 May 2021 13:24:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1621603443;
        bh=H+w4vX7tF2iIyenYBI6epVpEEI7LBi6bD5GR38apUE0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=c/09CVsC3ymPZE2zRl7EjB2JhUbhtnnSz0bH9/rM+E1ZqHsFhv3v9rPGHWBn1lYGb
         NBKf/UV00ynYGjaJ6HEsEVqsUVVTP8GuirVCbIBEh3b9Q93/j7kSFh8qg8O5+Idkwc
         wQnj9z2i7Pwk8PqYMap4Zr8fnenhQjA/l6P3QCY5bQ/f811qZkKJTlj1wER0G7c6J9
         55iec6CeQKFTyF+aZzDZgRudVrVGKlEiviXXPmXVwO8iN2UoCOil+UpxbfOtb5zMxT
         b9cYWM0te5W7Cllt4Mk055vYYqNe8wWRs0GILnVZzUiHR/8GWl/7G8eEH9ijEQC+Sc
         I1FG3Bhii7NJw==
Date:   Fri, 21 May 2021 18:53:59 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Rob Herring <robh+dt@kernel.org>
Cc:     Rob Clark <robdclark@gmail.com>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Jonathan Marek <jonathan@marek.ca>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Abhinav Kumar <abhinavk@codeaurora.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        freedreno <freedreno@lists.freedesktop.org>,
        devicetree@vger.kernel.org
Subject: Re: [RFC PATCH 02/13] dt-bindings: msm/dsi: Document Display Stream
 Compression (DSC) parameters
Message-ID: <YKe0b0hGN86E67iW@vkoul-mobl.Dlink>
References: <20210521124946.3617862-1-vkoul@kernel.org>
 <20210521124946.3617862-3-vkoul@kernel.org>
 <CAL_JsqJqPwkzxVgAfS9VgEXcY=ZH5LOaaxzoPDBzuDxOZ_OLjw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAL_JsqJqPwkzxVgAfS9VgEXcY=ZH5LOaaxzoPDBzuDxOZ_OLjw@mail.gmail.com>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 21-05-21, 08:18, Rob Herring wrote:
> On Fri, May 21, 2021 at 7:50 AM Vinod Koul <vkoul@kernel.org> wrote:
> >
> > DSC enables streams to be compressed before we send to panel. This
> > requires DSC enabled encoder and a panel to be present. So we add this
> > information in board DTS and find if DSC can be enabled and the
> > parameters required to configure DSC are added to binding document along
> > with example
> >
> > Signed-off-by: Vinod Koul <vkoul@kernel.org>
> > ---
> >  .../devicetree/bindings/display/msm/dsi.txt       | 15 +++++++++++++++
> >  1 file changed, 15 insertions(+)
> 
> This is getting converted to schema. Hopefully, v17 will be it. Sigh.

I will update these on top, whenever that one gets merged... Any comments
on the parameters added here?

-- 
~Vinod
