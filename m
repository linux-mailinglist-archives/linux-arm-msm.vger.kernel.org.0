Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 783002A758D
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Nov 2020 03:34:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732297AbgKECeG (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 4 Nov 2020 21:34:06 -0500
Received: from mail.kernel.org ([198.145.29.99]:52956 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729068AbgKECeG (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 4 Nov 2020 21:34:06 -0500
Received: from kernel.org (unknown [104.132.1.79])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 528BE20756;
        Thu,  5 Nov 2020 02:34:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1604543645;
        bh=4Gz8Y6YTmSLnyneQQ/XyRD1JV9M9ZirwwMg6IPjBqc8=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=S4xg7q0u5RH/0N0ctB7D7UM05xHyZ35aoj2b12IAGTodNwWBy+3AQQWXV01yUIKR4
         7hMAEmsttkPkjAgih8i68FaCJTWmW2ZNFTQc9hJeW/Qmuz1Kv1DXV8i+3LovHkR0zC
         uDHGvB5hmPo/ykToq7mKMboKUNpotCDao27P/o0o=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20201019154857.v5.1.I4567b5e7e17bbb15ef063d447cb83fd43746cb18@changeid>
References: <20201019154857.v5.1.I4567b5e7e17bbb15ef063d447cb83fd43746cb18@changeid>
Subject: Re: [PATCH v5 1/2] clk: qcom: lpasscc-sc7810: Use devm in probe
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Taniya Das <tdas@codeaurora.org>,
        David Brown <david.brown@linaro.org>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        linux-soc@vger.kernel.org,
        Douglas Anderson <dianders@chromium.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
To:     Douglas Anderson <dianders@chromium.org>
Date:   Wed, 04 Nov 2020 18:34:03 -0800
Message-ID: <160454364376.3965362.5357320867705242531@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Douglas Anderson (2020-10-19 15:49:34)
> Let's convert the lpass clock control driver to use devm.  This is a
> few more lines of code, but it will be useful in a later patch which
> disentangles the two devices handled by this driver.
>=20
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---

This pattern is common. We should consider pulling this into qcom/core.c
and consolidating code a bit.

Applied to clk-next
