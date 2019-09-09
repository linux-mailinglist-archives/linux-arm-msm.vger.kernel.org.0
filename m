Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 28E62AD6C5
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Sep 2019 12:25:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390567AbfIIKYg (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 9 Sep 2019 06:24:36 -0400
Received: from mail.kernel.org ([198.145.29.99]:38604 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2390541AbfIIKYg (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 9 Sep 2019 06:24:36 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 60ED22089F;
        Mon,  9 Sep 2019 10:24:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1568024675;
        bh=kjV5UmPW+o1J0y5yc5/2T9jcM8+FpxAQwKQ1DszQ4wg=;
        h=In-Reply-To:References:Cc:To:From:Subject:Date:From;
        b=hq3gDhgmuFSBWM19gRvwEZVY7joCUP6LcIMfiG6hwI1ONsvQKARCD1r9U+6VKpDp6
         TGJU4eSfvX5UvUuOSyhSj0Y/ihIaPYqw7SWpVFux/T2r2oW7UKR61mOQGnao8LgzGR
         6rpxJXRH7YYbz/oyvwdOtbZdiAZg4f7rIXwnwX1E=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <adaad84a-15ce-3212-9fec-7ff387da2a88@codeaurora.org>
References: <20190906045659.20621-1-vkoul@kernel.org> <20190906203827.A2259208C3@mail.kernel.org> <adaad84a-15ce-3212-9fec-7ff387da2a88@codeaurora.org>
Cc:     linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
To:     Taniya Das <tdas@codeaurora.org>, Vinod Koul <vkoul@kernel.org>
From:   Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH] clk: qcom: gcc-qcs404: Use floor ops for sdcc clks
User-Agent: alot/0.8.1
Date:   Mon, 09 Sep 2019 03:24:34 -0700
Message-Id: <20190909102435.60ED22089F@mail.kernel.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Taniya Das (2019-09-09 00:48:39)
> Hi Stephen, Vinod,
>=20
> On 9/7/2019 2:08 AM, Stephen Boyd wrote:
> > Quoting Vinod Koul (2019-09-05 21:56:59)
> >> Update the gcc qcs404 clock driver to use floor ops for sdcc clocks. As
> >> disuccsed in [1] it is good idea to use floor ops for sdcc clocks as we
> >> dont want the clock rates to do round up.
> >>
> >> [1]: https://lore.kernel.org/linux-arm-msm/20190830195142.103564-1-swb=
oyd@chromium.org/
> >>
> >> Signed-off-by: Vinod Koul <vkoul@kernel.org>
> >> ---
> >=20
> > Is Taniya writing the rest? Please don't dribble it out over the next
> > few weeks!
>=20
> I have pushed the patch : https://patchwork.kernel.org/patch/11137393/
>=20
> Vinod, I have taken care of the QCS404 in the same patch, so as to keep=20
> the change in one patch.
>=20

Cool thanks.

