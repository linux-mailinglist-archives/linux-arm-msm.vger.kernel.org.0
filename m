Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E3541151FD9
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Feb 2020 18:47:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727359AbgBDRrZ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 4 Feb 2020 12:47:25 -0500
Received: from mail.kernel.org ([198.145.29.99]:44662 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727382AbgBDRrZ (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 4 Feb 2020 12:47:25 -0500
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 3D66420674;
        Tue,  4 Feb 2020 17:47:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1580838444;
        bh=ghuD7O0BLUVGalJVIEuCAIhUB8RfQn3yHHwvB7smM4E=;
        h=In-Reply-To:References:Subject:To:Cc:From:Date:From;
        b=wL7m7jdM/YZDL90RDX5sGWDmplHQgytJXEU4DoeEIcRM5U7nH+qEPaEy50EDDWBHK
         oE+osSAyVHTxjij1sZu6LAybBZ2Qccgbe5CfAi5Jl7vKr+pOUXDxQ+ZuZRO1B3bd3f
         duYkhA6DJ5EiBr/wioVcuI4bFmKB9m7Q5sAjhVhE=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20200203103049.v4.1.I7487325fe8e701a68a07d3be8a6a4b571eca9cfa@changeid>
References: <20200203183149.73842-1-dianders@chromium.org> <20200203103049.v4.1.I7487325fe8e701a68a07d3be8a6a4b571eca9cfa@changeid>
Subject: Re: [PATCH v4 01/15] clk: qcom: rcg2: Don't crash if our parent can't be found; return an error
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Douglas Anderson <dianders@chromium.org>,
        Rob Herring <robh@kernel.org>
Cc:     Jeffrey Hugo <jhugo@codeaurora.org>,
        Taniya Das <tdas@codeaurora.org>, jeffrey.l.hugo@gmail.com,
        linux-arm-msm@vger.kernel.org, harigovi@codeaurora.org,
        devicetree@vger.kernel.org, mka@chromium.org,
        kalyan_t@codeaurora.org, Mark Rutland <mark.rutland@arm.com>,
        linux-clk@vger.kernel.org, hoegsberg@chromium.org,
        Douglas Anderson <dianders@chromium.org>,
        Michael Turquette <mturquette@baylibre.com>,
        linux-kernel@vger.kernel.org
From:   Stephen Boyd <sboyd@kernel.org>
User-Agent: alot/0.8.1
Date:   Tue, 04 Feb 2020 09:47:23 -0800
Message-Id: <20200204174724.3D66420674@mail.kernel.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Douglas Anderson (2020-02-03 10:31:34)
> When I got my clock parenting slightly wrong I ended up with a crash
> that looked like this:
>=20
>   Unable to handle kernel NULL pointer dereference at virtual
>   address 0000000000000000
>   ...
>   pc : clk_hw_get_rate+0x14/0x44
>   ...
>   Call trace:
>    clk_hw_get_rate+0x14/0x44
>    _freq_tbl_determine_rate+0x94/0xfc
>    clk_rcg2_determine_rate+0x2c/0x38
>    clk_core_determine_round_nolock+0x4c/0x88
>    clk_core_round_rate_nolock+0x6c/0xa8
>    clk_core_round_rate_nolock+0x9c/0xa8
>    clk_core_set_rate_nolock+0x70/0x180
>    clk_set_rate+0x3c/0x6c
>    of_clk_set_defaults+0x254/0x360
>    platform_drv_probe+0x28/0xb0
>    really_probe+0x120/0x2dc
>    driver_probe_device+0x64/0xfc
>    device_driver_attach+0x4c/0x6c
>    __driver_attach+0xac/0xc0
>    bus_for_each_dev+0x84/0xcc
>    driver_attach+0x2c/0x38
>    bus_add_driver+0xfc/0x1d0
>    driver_register+0x64/0xf8
>    __platform_driver_register+0x4c/0x58
>    msm_drm_register+0x5c/0x60
>    ...
>=20
> It turned out that clk_hw_get_parent_by_index() was returning NULL and
> we weren't checking.  Let's check it so that we don't crash.
>=20
> Fixes: ac269395cdd8 ("clk: qcom: Convert to clk_hw based provider APIs")
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> Reviewed-by: Matthias Kaehlcke <mka@chromium.org>
> ---

Applied to clk-next

