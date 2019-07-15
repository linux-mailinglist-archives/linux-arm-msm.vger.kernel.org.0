Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B8DA969F23
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jul 2019 00:46:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731925AbfGOWon (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 15 Jul 2019 18:44:43 -0400
Received: from mail.kernel.org ([198.145.29.99]:47134 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731225AbfGOWon (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 15 Jul 2019 18:44:43 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id F12122080A;
        Mon, 15 Jul 2019 22:44:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1563230682;
        bh=vRJ6Yk/9Jwix106bwTxs1UaEqw5UAMjMYWYOULH4nUE=;
        h=In-Reply-To:References:From:To:Cc:Subject:Date:From;
        b=bzFYVhVZOKKep/6iOszimP/qX7BX0s5XZr0TUj7wx0SrjvWzvEQfJNPkO9rNl8w29
         0VjWI9GfO0fFsQqO9kRR+akSpLMHbaDjAeX0fGlKPYXLVEVD21BEmZmWu+CTJ2T9Gh
         HN1fzr1rXHkb9Z4ZGbMS2JPI8B407WQehWRMj1oU=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <f65811f8-42ea-6365-7822-db662eaea228@codeaurora.org>
References: <1557339895-21952-1-git-send-email-tdas@codeaurora.org> <1557339895-21952-4-git-send-email-tdas@codeaurora.org> <155742286525.14659.18081373668341127486@swboyd.mtv.corp.google.com> <07bcd2df-a786-ea52-8566-70f484248952@codeaurora.org> <155751085370.14659.7749105088997177801@swboyd.mtv.corp.google.com> <f65811f8-42ea-6365-7822-db662eaea228@codeaurora.org>
From:   Stephen Boyd <sboyd@kernel.org>
To:     Michael Turquette <mturquette@baylibre.com>,
        Taniya Das <tdas@codeaurora.org>
Cc:     Andy Gross <andy.gross@linaro.org>,
        David Brown <david.brown@linaro.org>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 3/3] clk: qcom: rcg: update the DFS macro for RCG
User-Agent: alot/0.8.1
Date:   Mon, 15 Jul 2019 15:44:41 -0700
Message-Id: <20190715224441.F12122080A@mail.kernel.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Taniya Das (2019-05-12 20:44:46)
> On 5/10/2019 11:24 PM, Stephen Boyd wrote:
> >>>> diff --git a/drivers/clk/qcom/clk-rcg.h b/drivers/clk/qcom/clk-rcg.h
> >>>> index 5562f38..e40e8f8 100644
> >>>> --- a/drivers/clk/qcom/clk-rcg.h
> >>>> +++ b/drivers/clk/qcom/clk-rcg.h
> >>>> @@ -171,7 +171,7 @@ struct clk_rcg_dfs_data {
> >>>>    };
> >>>>
> >>>>    #define DEFINE_RCG_DFS(r) \
> >>>> -       { .rcg =3D &r##_src, .init =3D &r##_init }
> >>>> +       { .rcg =3D &r, .init =3D &r##_init }
> >>>
> >>> Why do we need to rename the init data?
> >>>
> >>
> >> We want to manage the init data as the clock source name, so that we
> >> could manage to auto generate our code. So that we do not have to
> >> re-name the clock init data manually if the DFS source names gets
> >> updated at any point of time.
> >>
> >=20
> > Why is the clk name changing to not have a _src after the "root" of the
> > clk name? As long as I can remember, RCGs have a "_src" postfix.
> >=20
>=20
> Yes, the RCGs would have _src, so we do want the init data also to be
> generated with _src postfix. So that we do not have to manually clean up =

> the generated code.
>=20

Please manually cleanup the generated code, or fix the code
generator to do what you want.

