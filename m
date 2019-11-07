Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D8C70F3AA4
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 Nov 2019 22:43:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725906AbfKGVnx (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 7 Nov 2019 16:43:53 -0500
Received: from mail.kernel.org ([198.145.29.99]:56272 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725882AbfKGVnx (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 7 Nov 2019 16:43:53 -0500
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 8A82E2166E;
        Thu,  7 Nov 2019 21:43:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1573163032;
        bh=JH9xA4nJOudRup6QA6tAKiiprVPdG/whs4CxVPLhFGw=;
        h=In-Reply-To:References:From:To:Cc:Subject:Date:From;
        b=kBPm1x/Mce0IteeCTGnsUjx3gg/H6oFxeIOpmPkBuZQdkugIrTOClGkZWWvc6t8BW
         7Mvu7ZQKVxDEUrGSXw6LP5GJvec1Z8Uivk5YEGmaRiMRVG1g98aXwSWHKicf2y1285
         /lUpdhKMugQtareAO/aatqbAI1QcbwKMq71CZfeo=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20191031185715.15504-1-jeffrey.l.hugo@gmail.com>
References: <20191031185538.15402-1-jeffrey.l.hugo@gmail.com> <20191031185715.15504-1-jeffrey.l.hugo@gmail.com>
From:   Stephen Boyd <sboyd@kernel.org>
To:     Jeffrey Hugo <jeffrey.l.hugo@gmail.com>,
        bjorn.andersson@linaro.org, mturquette@baylibre.com
Cc:     agross@kernel.org, marc.w.gonzalez@free.fr,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Subject: Re: [PATCH v5 1/3] clk: qcom: Allow constant ratio freq tables for rcg
User-Agent: alot/0.8.1
Date:   Thu, 07 Nov 2019 13:43:51 -0800
Message-Id: <20191107214352.8A82E2166E@mail.kernel.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Jeffrey Hugo (2019-10-31 11:57:15)
> Some RCGs (the gfx_3d_src_clk in msm8998 for example) are basically just
> some constant ratio from the input across the entire frequency range.  It
> would be great if we could specify the frequency table as a single entry
> constant ratio instead of a long list, ie:
>=20
>         { .src =3D P_GPUPLL0_OUT_EVEN, .pre_div =3D 3 },
>         { }
>=20
> So, lets support that.
>=20
> We need to fix a corner case in qcom_find_freq() where if the freq table
> is non-null, but has no frequencies, we end up returning an "entry" before
> the table array, which is bad.  Then, we need ignore the freq from the
> table, and instead base everything on the requested freq.
>=20
> Suggested-by: Stephen Boyd <sboyd@kernel.org>
> Signed-off-by: Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
> ---

Applied to clk-next and fixed the space thing. I guess ceil/floor
rounding isn't a problem?
=20
