Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4E403357D67
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 Apr 2021 09:32:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229552AbhDHHcd (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 8 Apr 2021 03:32:33 -0400
Received: from mail.kernel.org ([198.145.29.99]:52590 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229517AbhDHHcd (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 8 Apr 2021 03:32:33 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 9361760FF1;
        Thu,  8 Apr 2021 07:32:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1617867142;
        bh=jZ4zDHsdEM1jYSB2eQTevkSyHlCwgLGqYTV1P1wR3Gs=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=M3c095rTrYMuR+s6G1+vNfJ5DjCVapWuu9h3s0451uerGbG5CA0VuFEsvj1mzN4/m
         ubzQyln2JIeb9dGh6T+A76AkM/xMA3RcX7Xiam34BUoYpDc/IR6psGY/HeaC92lBDh
         vctId2/MF8xKrSM78Bcb6Fd4fOh7abqPbqXpaU/XdxLQpXAqQZNMfh/dvG+kVBkCHz
         0MBmYrCRvYN6dXnwLJX5qs27H1f6zy3K4KA60mH5XR9YEmKG0+gPfPOhAPaXdwa2Gm
         aU/oLJKHZA3qU85c7XaddzllnIIMwR2kZaNaoeFj+xnkm3a1vlytr2gtns8hGL6YlB
         BfKZPIz9grXnw==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <CAA8EJprrQVPZxV7nhScgTCL7ZKU2c1AicNjOvd2YUEu8pCUxkQ@mail.gmail.com>
References: <20210406230606.3007138-1-dmitry.baryshkov@linaro.org> <161783530964.3790633.16412468884239960912@swboyd.mtv.corp.google.com> <CAA8EJppsM1sP=OTiMY8jsLLgU=+p3qgZDD7M+M5naJhfFEF_Zg@mail.gmail.com> <161783803315.3790633.10829887417379757624@swboyd.mtv.corp.google.com> <CAA8EJprrQVPZxV7nhScgTCL7ZKU2c1AicNjOvd2YUEu8pCUxkQ@mail.gmail.com>
Subject: Re: [PATCH] clk: fixed: fix double free in resource managed fixed-factor clock
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        DRM DRIVER FOR MSM ADRENO GPU 
        <linux-arm-msm@vger.kernel.org>,
        "open list:COMMON CLK FRAMEWORK <linux-clk@vger.kernel.org>, open 
        list:DRM DRIVER FOR MSM ADRENO GPU <dri-devel@lists.freedesktop.org>, 
        freedreno <freedreno@lists.freedesktop.org>, Rob Clark 
        <robdclark@chromium.org>, Daniel Palmer" <daniel@0x0f.com>
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Thu, 08 Apr 2021 00:32:21 -0700
Message-ID: <161786714115.3790633.2310701694968142298@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Dmitry Baryshkov (2021-04-07 17:52:01)
>
> Short story: no other patches needed.
>=20
> Long story:
> I've checked the rest of devres allocations in clk subsystem.
> Interesting, they use a bit different pattern: they devres_alloc a
> pointer to the clock, then they fill the pointer with the new clock
> data. The release callback would (correctly) free the clock pointer by
> the devres and then devres code would kfree the devres data (clock
> pointer).
>=20
> The fixed-factor is unique in this area, because it devres_alloc's a
> clock instance (rather than the pointer) and then fills it, so it
> should not be freed in the release callback (only unregistered) with
> the devres code kfreeing() the instance itself.
>=20
>=20

Cool thanks for checking. Maybe we should change those other callers in
clk directory to devres alloc the container structure instead of a
pointer. Then we avoid the double allocation. Glad it's not a critical
fix though.
