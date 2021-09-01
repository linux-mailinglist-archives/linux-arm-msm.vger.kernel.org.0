Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4394D3FD2F3
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 Sep 2021 07:35:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242002AbhIAFgK (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 1 Sep 2021 01:36:10 -0400
Received: from mail.kernel.org ([198.145.29.99]:35734 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233857AbhIAFgJ (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 1 Sep 2021 01:36:09 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 6E2A761059;
        Wed,  1 Sep 2021 05:35:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1630474513;
        bh=T1FksYP7QPcFhgT46aKX7pcP5aYxOKXLzlqcQgGkZYk=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=aOwBZbY2FDZ46mFnNrSjBp6Tzsrei3zfbZIwQXR8vyecZ2F5Tkx14SM9omWvv19cN
         zB4cTuGpneYQo9iVOOhvlbXsVpDCesrm4gxsqAtpsQdhHnKgrIBr50dGHIkjQoAV6H
         pxGhZqXKwE8+88CS0S7kUi2Y2yw3hT6/TEsh91u3LNZoBY5au4U55bqTKqhOCVFwKU
         kkR9iA3hMSmxce1Jq3CqvuVkhAnY8rQXTm2PXeLEK3jczzXcnkR9bS7MDPXCDQGrqQ
         ekmiV99x9TUJj96wgfdAD7Av2a5Nx145Ts5Xun6NWilI99kacAvDLsgrJ6/lweI+VE
         1DycHtlBXxjHw==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <YS1lYui5aXadgkEr@Marijn-Arch-PC.localdomain>
References: <20210830182445.167527-1-marijn.suijten@somainline.org> <20210830182445.167527-2-marijn.suijten@somainline.org> <163036177339.2676726.12271104951144475163@swboyd.mtv.corp.google.com> <YS1fllEswGQEGWPc@Marijn-Arch-PC.localdomain> <163036399040.2676726.5816296584899284140@swboyd.mtv.corp.google.com> <YS1lYui5aXadgkEr@Marijn-Arch-PC.localdomain>
Subject: Re: [PATCH v2 1/2] drm/msm/dsi: Use "ref" fw clock instead of global name for VCO parent
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-arm-msm@vger.kernel.org, phone-devel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Martin Botka <martin.botka@somainline.org>,
        Jami Kettunen <jami.kettunen@somainline.org>,
        Pavel Dubrova <pashadubrova@gmail.com>,
        Andy Gross <agross@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Abhinav Kumar <abhinavk@codeaurora.org>,
        Jonathan Marek <jonathan@marek.ca>,
        Matthias Kaehlcke <mka@chromium.org>,
        Douglas Anderson <dianders@chromium.org>,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        Stephen Boyd <swboyd@chromium.org>
To:     Marijn Suijten <marijn.suijten@somainline.org>
Date:   Tue, 31 Aug 2021 22:35:12 -0700
Message-ID: <163047451225.42057.10341429266269552927@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Marijn Suijten (2021-08-30 16:10:26)
>=20
> I'm 95% sure this shouldn't cause any problems given current DTs and
> their history, but that's probably not enough.  This might also impact
> DTs that have not yet been upstreamed, but afaik the general stance is
> to not care and actually serve as a fair hint/warning before new DTs
> make it to the list.
>=20
> If there is a protocol in place to deprecate, warn, and eventually
> remove this reliance on global clock names I'm more than happy to add
> .name as a temporary fallback, even if likely unneeded.  Otherwise we
> might never get rid of it.

I'm not aware of any protocol to deprecate, warn, and remove the
fallback name. It's a fallback because it can't ever really be removed.

Anyway, if you're not willing to add the .name then that's fine. We can
deal with the problem easily by adding a .name in the future if someone
complains that things aren't working. Sound like a plan? If so, it's
probably good to add some sort of note in the commit text so that when
the bisector lands on this patch they can realize that this
intentionally broke them.
