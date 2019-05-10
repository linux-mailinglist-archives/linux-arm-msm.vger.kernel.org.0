Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BA0101A2B0
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 May 2019 19:54:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727569AbfEJRyP (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 10 May 2019 13:54:15 -0400
Received: from mail.kernel.org ([198.145.29.99]:53264 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727551AbfEJRyP (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 10 May 2019 13:54:15 -0400
Received: from localhost (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 89E7F208C3;
        Fri, 10 May 2019 17:54:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1557510854;
        bh=TPcYCKnbp3auhRg3X0Zai1KmfmkYrRP7IMwzQaXcZaQ=;
        h=In-Reply-To:References:From:Subject:Cc:To:Date:From;
        b=wUhYsGhmnx1usumemDEOYHTOVFf6PU8tbg2IXIe/iuDX/i15g95hkvlwKP8OoCIvt
         1/2jeuMnBye7x16Uq8fCbTNqjvgSsSbr4FmmMzzJgWWKwMLUViybFcyKBAfHIqsUrf
         aZaHWVX8DhSfZnWKf+JqWwF7NN0phV8g+WK6QZ9w=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <07bcd2df-a786-ea52-8566-70f484248952@codeaurora.org>
References: <1557339895-21952-1-git-send-email-tdas@codeaurora.org> <1557339895-21952-4-git-send-email-tdas@codeaurora.org> <155742286525.14659.18081373668341127486@swboyd.mtv.corp.google.com> <07bcd2df-a786-ea52-8566-70f484248952@codeaurora.org>
From:   Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH v1 3/3] clk: qcom: rcg: update the DFS macro for RCG
Cc:     Andy Gross <andy.gross@linaro.org>,
        David Brown <david.brown@linaro.org>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
To:     Michael Turquette <mturquette@baylibre.com>,
        Taniya Das <tdas@codeaurora.org>
Message-ID: <155751085370.14659.7749105088997177801@swboyd.mtv.corp.google.com>
User-Agent: alot/0.8
Date:   Fri, 10 May 2019 10:54:13 -0700
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Taniya Das (2019-05-09 19:58:39)
> Hello Stephen,
>=20
> Thanks for the review.
>=20
> On 5/9/2019 10:57 PM, Stephen Boyd wrote:
> > Quoting Taniya Das (2019-05-08 11:24:55)
> >> Update the init data name for each of the dynamic frequency switch
> >> controlled clock associated with the RCG clock name, so that it can be
> >> generated as per the hardware plan. Thus update the macro accordingly.
> >>
> >> Signed-off-by: Taniya Das <tdas@codeaurora.org>
> >=20
> > This patch doesn't make any sense to me.
> >=20
> >> ---
> >>   drivers/clk/qcom/clk-rcg.h    |  2 +-
> >>   drivers/clk/qcom/gcc-sdm845.c | 96 +++++++++++++++++++++------------=
----------
> >>   2 files changed, 49 insertions(+), 49 deletions(-)
> >>
> >> diff --git a/drivers/clk/qcom/clk-rcg.h b/drivers/clk/qcom/clk-rcg.h
> >> index 5562f38..e40e8f8 100644
> >> --- a/drivers/clk/qcom/clk-rcg.h
> >> +++ b/drivers/clk/qcom/clk-rcg.h
> >> @@ -171,7 +171,7 @@ struct clk_rcg_dfs_data {
> >>   };
> >>
> >>   #define DEFINE_RCG_DFS(r) \
> >> -       { .rcg =3D &r##_src, .init =3D &r##_init }
> >> +       { .rcg =3D &r, .init =3D &r##_init }
> >=20
> > Why do we need to rename the init data?
> >=20
>=20
> We want to manage the init data as the clock source name, so that we=20
> could manage to auto generate our code. So that we do not have to=20
> re-name the clock init data manually if the DFS source names gets=20
> updated at any point of time.
>=20

Why is the clk name changing to not have a _src after the "root" of the
clk name? As long as I can remember, RCGs have a "_src" postfix.

