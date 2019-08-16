Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E44BC90648
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 Aug 2019 18:58:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727164AbfHPQ6O (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 16 Aug 2019 12:58:14 -0400
Received: from mail.kernel.org ([198.145.29.99]:41570 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726497AbfHPQ6O (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 16 Aug 2019 12:58:14 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id BC64B2077C;
        Fri, 16 Aug 2019 16:58:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1565974692;
        bh=xk9mbri+sSP2Ako0+cU4IDTi1rBEvLPjA67uzQhKM9o=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=hxKsVunl58y8c5edThB0D+ZiNMYsKJ/yM6d+OQj43gRG9jpFVjSAk50PLSCpmeBnh
         GUU/F7/+xO9Z2ifpfXGprqDDH56sFu6IoUZw+0WG/W9aH5dR1XTuFGHDHj/A+4GLv1
         aayoMBs6PhUWbGj5MptlxV5K9UG9dJAEJk1+xQlw=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20190816042440.GY12733@vkoul-mobl.Dlink>
References: <20190814122958.4981-1-vkoul@kernel.org> <20190814122958.4981-2-vkoul@kernel.org> <20190814171946.E9E8D20665@mail.kernel.org> <20190816042440.GY12733@vkoul-mobl.Dlink>
Subject: Re: [PATCH 2/2] clk: qcom: clk-rpmh: Add support for SM8150
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
To:     Vinod Koul <vkoul@kernel.org>
User-Agent: alot/0.8.1
Date:   Fri, 16 Aug 2019 09:58:11 -0700
Message-Id: <20190816165812.BC64B2077C@mail.kernel.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Vinod Koul (2019-08-15 21:24:40)
> On 14-08-19, 10:19, Stephen Boyd wrote:
> > Quoting Vinod Koul (2019-08-14 05:29:58)
> > > Add support for rpmh clocks found in SM8150
> > >=20
> > > Signed-off-by: Vinod Koul <vkoul@kernel.org>
> > > ---
> >=20
> > Patch looks OK, but can you convert this driver to use the new parent
> > style and then update the binding to handle it? We can fix the other
> > platforms and dts files that use this driver in parallel, but sm8150
> > will be forward looking.
>=20
> Yes but that would also impact sdm845 as it uses this driver, so I
> wanted to get this one done so that we have support for rpm clock and
> then do the conversion.
>=20
> Would that be okay with you to get this in and then I convert this?
>=20

How does it impact sdm845? The new way of specifying parents supports
fallback to legacy string matching.

