Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E00FE7AC8B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jul 2019 17:40:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730903AbfG3Pkj (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 30 Jul 2019 11:40:39 -0400
Received: from mail.kernel.org ([198.145.29.99]:57688 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730217AbfG3Pkj (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 30 Jul 2019 11:40:39 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 8BF53206B8;
        Tue, 30 Jul 2019 15:40:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1564501238;
        bh=Hzq0ia0CHKkeUj+wGU+RlxUjicn8yuNyVPFWEwlJse8=;
        h=In-Reply-To:References:Cc:From:To:Subject:Date:From;
        b=J+IemHzqC/q/0eG0EA+O0zIUFE1RGjuSlcqYUZ/KV4a7h0Bzke3gwq4H1PyH+5uEM
         tV+g6r3oSYAM8Ehlj4tiSzY9JCl1O6MFVvXr4baS+V+HY6QKR9KD9qaCfws51eypmQ
         4kKL6/O+NmS4yh3X1v2eZn4E4iUJOgRk3KMLE/y0=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <63d15392-f296-cd13-7821-61d59d568347@codeaurora.org>
References: <1557339895-21952-1-git-send-email-tdas@codeaurora.org> <1557339895-21952-4-git-send-email-tdas@codeaurora.org> <155742286525.14659.18081373668341127486@swboyd.mtv.corp.google.com> <07bcd2df-a786-ea52-8566-70f484248952@codeaurora.org> <155751085370.14659.7749105088997177801@swboyd.mtv.corp.google.com> <f65811f8-42ea-6365-7822-db662eaea228@codeaurora.org> <20190715224441.F12122080A@mail.kernel.org> <243de3a4-292b-77c0-6232-0b38d124d183@codeaurora.org> <20190716232228.2B84F2173E@mail.kernel.org> <63d15392-f296-cd13-7821-61d59d568347@codeaurora.org>
Cc:     Andy Gross <andy.gross@linaro.org>,
        David Brown <david.brown@linaro.org>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
From:   Stephen Boyd <sboyd@kernel.org>
To:     Michael Turquette <mturquette@baylibre.com>,
        Taniya Das <tdas@codeaurora.org>
Subject: Re: [PATCH v1 3/3] clk: qcom: rcg: update the DFS macro for RCG
User-Agent: alot/0.8.1
Date:   Tue, 30 Jul 2019 08:40:37 -0700
Message-Id: <20190730154038.8BF53206B8@mail.kernel.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Taniya Das (2019-07-30 03:51:07)
>=20
>=20
> On 7/17/2019 4:52 AM, Stephen Boyd wrote:
> > Quoting Taniya Das (2019-07-15 21:22:02)
> >> Hello Stephen,
> >>
> >> Thanks for the review.
> >>
> >> On 7/16/2019 4:14 AM, Stephen Boyd wrote:
> >>> Quoting Taniya Das (2019-05-12 20:44:46)
> >>>> On 5/10/2019 11:24 PM, Stephen Boyd wrote:
> >>>>> Why is the clk name changing to not have a _src after the "root" of=
 the
> >>>>> clk name? As long as I can remember, RCGs have a "_src" postfix.
> >>>>>
> >>>>
> >>>> Yes, the RCGs would have _src, so we do want the init data also to be
> >>>> generated with _src postfix. So that we do not have to manually clea=
n up
> >>>> the generated code.
> >>>>
> >>>
> >>> Please manually cleanup the generated code, or fix the code
> >>> generator to do what you want.
> >>>
> >>
> >> Fixing the code manually is not what we intend to do and it is time
> >> consuming with too many DFS controlled clocks. This really helps us
> >> align to internal code.
> >>
> >=20
> > And you can't fix the code generator to drop the _src part of whatever
> > is spit out for the DFS lines?
> >=20
>=20
> Sure, will drop this.
>=20

Actually, I'm OK with this patch, but I'd like to see it in a larger
series that introduces another clk driver using this macro. The reason I
like it is that I can search for the same string name and find the clk
that has DFS enabled on it, instead of finding the branch which doesn't
have DFS. Sorry for the back and forth, I got confused about what was
going on.

