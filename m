Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D6E9434DD40
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Mar 2021 02:50:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229557AbhC3AuX (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 29 Mar 2021 20:50:23 -0400
Received: from mail.kernel.org ([198.145.29.99]:57338 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229709AbhC3AuN (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 29 Mar 2021 20:50:13 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 79A1761987;
        Tue, 30 Mar 2021 00:50:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1617065413;
        bh=WlcDHTsL/++ADm3igDYuxYt/sN+5arS6fz0ryE5i49Y=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=EZn6gqtezMJcHI7kKyh3BCXxdb0X5ZGJhHxOw4zoxZ7Chz/X7kd0XZtohJ1MSwuzc
         cE6REp1Z8me0BNIqjRxypgLfdHTx+rSeggC4RkkKDLaMn9OhOQe9OxGSlphO4NM/xs
         yDr0k6+PuLfY97sO6JLVRbs5OAx48Z/VFtXbn/ivfq4n+guSbZuC+CDHtFJ9FKLbkQ
         zV1JbvVPEC5+tl2MN8s1g8mZRj2l9USfYRstoF5BuzFbjUv2tG43ADo9MX2PcViHxL
         Tl6oTwm4mw9p9ZiLUNDNqdVISXzUPUzQtr7iQY1ZeKLREQMYCe6oYlvG0H8r1xnU03
         EgfwwtUm/DeGA==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20210327110305.3289784-14-dmitry.baryshkov@linaro.org>
References: <20210327110305.3289784-1-dmitry.baryshkov@linaro.org> <20210327110305.3289784-14-dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH v3 13/25] drm/msm/dsi: use devm_of_clk_add_hw_provider
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-clk@vger.kernel.org
To:     Abhinav Kumar <abhinavk@codeaurora.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Jonathan Marek <jonathan@marek.ca>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>
Date:   Mon, 29 Mar 2021 17:50:12 -0700
Message-ID: <161706541233.3012082.17908704840023674123@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Would make it devm_of_clk_add_hw_provider() in the subject

Quoting Dmitry Baryshkov (2021-03-27 04:02:53)
> Use devm_of_clk_add_hw_provider() to register provided clocks. This
> allows dropping the remove function alltogether.
>=20
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

Reviewed-by: Stephen Boyd <sboyd@kernel.org>
