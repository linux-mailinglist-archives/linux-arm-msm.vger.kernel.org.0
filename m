Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 66D996B252
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Jul 2019 01:22:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388915AbfGPXW3 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 16 Jul 2019 19:22:29 -0400
Received: from mail.kernel.org ([198.145.29.99]:47252 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728601AbfGPXW3 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 16 Jul 2019 19:22:29 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 2B84F2173E;
        Tue, 16 Jul 2019 23:22:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1563319348;
        bh=oH4dxe1cgmLfNgwvsKs5dsQmg2kxXHsnnY8s7bp/4vs=;
        h=In-Reply-To:References:Subject:To:Cc:From:Date:From;
        b=05KDeuThBfQLNN93tJzzuUbxEQwPQMNAVtCIUJOYkpfO3j4iXkrn7TyEKcJZdpClO
         59v/mKf44ALLlh9T8aKu0Cgmd01WETJh3G+88ofr5WY3kQ6LfZ4tFu5KSUx8GlaIyw
         TmDrAQjomZGMSlzIPon57Op/XQWwm/4TwUUe7SFU=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <243de3a4-292b-77c0-6232-0b38d124d183@codeaurora.org>
References: <1557339895-21952-1-git-send-email-tdas@codeaurora.org> <1557339895-21952-4-git-send-email-tdas@codeaurora.org> <155742286525.14659.18081373668341127486@swboyd.mtv.corp.google.com> <07bcd2df-a786-ea52-8566-70f484248952@codeaurora.org> <155751085370.14659.7749105088997177801@swboyd.mtv.corp.google.com> <f65811f8-42ea-6365-7822-db662eaea228@codeaurora.org> <20190715224441.F12122080A@mail.kernel.org> <243de3a4-292b-77c0-6232-0b38d124d183@codeaurora.org>
Subject: Re: [PATCH v1 3/3] clk: qcom: rcg: update the DFS macro for RCG
To:     Michael Turquette <mturquette@baylibre.com>,
        Taniya Das <tdas@codeaurora.org>
Cc:     Andy Gross <andy.gross@linaro.org>,
        David Brown <david.brown@linaro.org>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
From:   Stephen Boyd <sboyd@kernel.org>
User-Agent: alot/0.8.1
Date:   Tue, 16 Jul 2019 16:22:27 -0700
Message-Id: <20190716232228.2B84F2173E@mail.kernel.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Taniya Das (2019-07-15 21:22:02)
> Hello Stephen,
>=20
> Thanks for the review.
>=20
> On 7/16/2019 4:14 AM, Stephen Boyd wrote:
> > Quoting Taniya Das (2019-05-12 20:44:46)
> >> On 5/10/2019 11:24 PM, Stephen Boyd wrote:
> >>> Why is the clk name changing to not have a _src after the "root" of t=
he
> >>> clk name? As long as I can remember, RCGs have a "_src" postfix.
> >>>
> >>
> >> Yes, the RCGs would have _src, so we do want the init data also to be
> >> generated with _src postfix. So that we do not have to manually clean =
up
> >> the generated code.
> >>
> >=20
> > Please manually cleanup the generated code, or fix the code
> > generator to do what you want.
> >=20
>=20
> Fixing the code manually is not what we intend to do and it is time=20
> consuming with too many DFS controlled clocks. This really helps us=20
> align to internal code.
>=20

And you can't fix the code generator to drop the _src part of whatever
is spit out for the DFS lines?

