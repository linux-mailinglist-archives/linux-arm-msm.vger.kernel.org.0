Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DBCB1293158
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Oct 2020 00:38:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388252AbgJSWim (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 19 Oct 2020 18:38:42 -0400
Received: from mail.kernel.org ([198.145.29.99]:41996 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2388245AbgJSWim (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 19 Oct 2020 18:38:42 -0400
Received: from kernel.org (unknown [104.132.1.79])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 1677A222EA;
        Mon, 19 Oct 2020 22:38:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1603147122;
        bh=8W/h5XEBWGQWtqsEZjw4lr98DMheeA7pOXZm//R6+tw=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=O5PgNIbcntSL3cPa/SbkQneWQkCNiYnuyux7NJFY+9T2Sgm7j/u0GgqnLy/GoDR1h
         Qc56wI7V+ZxkaUa5s6VoC4E9WNebcLpeM5UX0oIR9Vx3orvObgx/0JwwZMfKIEndJU
         66VsjjSXYRYYdIezoXBNEBD9P4GTA+WcPdFEsBi4=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <CAD=FV=WAVoZ59p51HxBwBNXsXcirRbUAjeGuZ4T9G-O7Tvzqfw@mail.gmail.com>
References: <20201014171259.v4.1.I4567b5e7e17bbb15ef063d447cb83fd43746cb18@changeid> <20201014171259.v4.3.Id0cc5d859e2422082a29a7909658932c857f5a81@changeid> <160281818774.884498.11509417433655580732@swboyd.mtv.corp.google.com> <160290009516.884498.11234055455838582432@swboyd.mtv.corp.google.com> <CAD=FV=WAVoZ59p51HxBwBNXsXcirRbUAjeGuZ4T9G-O7Tvzqfw@mail.gmail.com>
Subject: Re: [PATCH v4 3/3] clk: qcom: lpasscc-sc7180: Re-configure the PLL in case lost
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Taniya Das <tdas@codeaurora.org>,
        David Brown <david.brown@linaro.org>, open list:
        ARM/QUALCOMM SUPPORT <linux-soc@vger.kernel.org>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>, ;
Illegal-Object: Syntax error in Cc: address found on vger.kernel.org:
        Cc:     ;
                        ^-missing semicolon to end mail group, extraneous tokens in mailbox, missing end of mailbox
To:     Doug Anderson <dianders@chromium.org>
Date:   Mon, 19 Oct 2020 15:38:38 -0700
Message-ID: <160314711876.884498.2451675615619114259@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Doug Anderson (2020-10-16 20:17:56)
>=20
> I'm happy to repost a v5 of just patches #1 and #2 with the newlines
> fixed next week, or I'm happy if you want to fix them when applying as
> you alluded to on the Chrome OS gerrit.=20

Please resend. Thanks!
