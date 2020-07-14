Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BAEEB21F739
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jul 2020 18:24:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728362AbgGNQXR (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 14 Jul 2020 12:23:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43520 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728066AbgGNQXQ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 14 Jul 2020 12:23:16 -0400
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com [IPv6:2607:f8b0:4864:20::1044])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D4F9EC061794
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Jul 2020 09:23:16 -0700 (PDT)
Received: by mail-pj1-x1044.google.com with SMTP id ch3so1833471pjb.5
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Jul 2020 09:23:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=X/RLsS5yfX7EXYlA8IeOjMJ1W+RyrTvf2oXuin3OWbM=;
        b=BrO4TI/cpnQPTSfx2dZA/ku0JexfDh+Ymk9Y4Gfkn9nEFd8S5ZkoULVC8X08fd4HHu
         0T9CAfxkSarAjc+wsUE4nUvmeYSn4o6qM/3AgPVfzHKA/qTrERRtdhiyuYN+qqJG46jo
         WVVS8Wsn8uH2mlyTG3XclUgKrCe2JYcgpxh9M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=X/RLsS5yfX7EXYlA8IeOjMJ1W+RyrTvf2oXuin3OWbM=;
        b=H+zrQ+e8nluPq7ArW3JZidBJyYw9C68ZfHdrvhCR3LRErKCuXBCwrCtBr8BtaPlRBt
         i3q4GHaCIfm52r8cpks9q37KVNpU0kER8m9SbVVUODwLhptnSfANksUHXOfsJSiDu2FF
         mZJCqpQQPU40Vxzo4+q2oJgww5+uGMCJQ1UNJafdc/sw4IcjYkRx5CxlE+IKDuBxecP6
         BMOCmPjddojf0Ww1hAU7U1lFWsR14OAOHM6vOkBpl+jB2dgt+a/22cy/JOWWiF1ms43O
         j6YH/ZyQY0qR6DzrcrdVn6W8FWxAacqBhIH853jKv03uwtGdFr/IfVtDBVPTNkmF+7mA
         vuTQ==
X-Gm-Message-State: AOAM533TmA4SnoZMS8AgFYtJD/48PLZCbzA9w0FIKUoidYsqPl8glsQp
        B1PBHG/U8agXsnLbRqhgKkk6Bw==
X-Google-Smtp-Source: ABdhPJyBUwa8eGYp1ji5QbzsXhJoqUprSybfXZ7nPR6Ps/1B7VD1ETC0gv9wRoJi5Jcx5QcoNKKylg==
X-Received: by 2002:a17:90a:e687:: with SMTP id s7mr5202873pjy.21.1594743796339;
        Tue, 14 Jul 2020 09:23:16 -0700 (PDT)
Received: from localhost ([2620:15c:202:1:f693:9fff:fef4:e70a])
        by smtp.gmail.com with ESMTPSA id c1sm3262699pje.9.2020.07.14.09.23.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Jul 2020 09:23:15 -0700 (PDT)
Date:   Tue, 14 Jul 2020 09:23:14 -0700
From:   Matthias Kaehlcke <mka@chromium.org>
To:     kalyan_t@codeaurora.org
Cc:     dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, robdclark@gmail.com,
        seanpaul@chromium.org, hoegsberg@chromium.org,
        dianders@chromium.org, mkrishn@codeaurora.org,
        travitej@codeaurora.org, nganji@codeaurora.org
Subject: Re: [v1] drm/msm/dpu: add support for clk and bw scaling for display
Message-ID: <20200714162314.GR3191083@google.com>
References: <1592489321-29213-1-git-send-email-kalyan_t@codeaurora.org>
 <20200714011219.GQ3191083@google.com>
 <38dc4bbfd754175e476252c4bc259d55@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <38dc4bbfd754175e476252c4bc259d55@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Jul 14, 2020 at 04:39:47PM +0530, kalyan_t@codeaurora.org wrote:
> On 2020-07-14 06:42, Matthias Kaehlcke wrote:
> > On Thu, Jun 18, 2020 at 07:38:41PM +0530, Kalyan Thota wrote:
> > > This change adds support to scale src clk and bandwidth as
> > > per composition requirements.
> > > 
> > > Interconnect registration for bw has been moved to mdp
> > > device node from mdss to facilitate the scaling.
> > > 
> > > Changes in v1:
> > >  - Address armv7 compilation issues with the patch (Rob)
> > > 
> > > Signed-off-by: Kalyan Thota <kalyan_t@codeaurora.org>
> > 
> > It seems this is an evolution of this series:
> > https://patchwork.kernel.org/project/linux-arm-msm/list/?series=265351
> > 
> > Are the DT bits of the series still valid? If so please include them in
> > the
> > series, otherwise please add DT patches to allow folks to test and
> > review,
> > and get them landed in Bjorn's tree after the driver changes have
> > landed.
> 
> Hi,
> 
> Yes the patch is dependent on the DT changes, should i add them with depends
> tag in the commit text ?
> https://patchwork.kernel.org/patch/11470785/
> https://patchwork.kernel.org/patch/11470789/

This patch doesn't really depend on the DT changes. I would suggest to
make this a series of 3 patches, just like the original series linked
above.

