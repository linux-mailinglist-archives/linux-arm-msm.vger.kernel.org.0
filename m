Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1B1D7313BB7
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Feb 2021 18:56:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235018AbhBHRz7 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 8 Feb 2021 12:55:59 -0500
Received: from mail.kernel.org ([198.145.29.99]:44870 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234885AbhBHRye (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 8 Feb 2021 12:54:34 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 42BE464E7D;
        Mon,  8 Feb 2021 17:53:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1612806833;
        bh=j+9+0z2l9m86Rum3fYcNXr0o+bRo5dP+6OkmKs+gBqo=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=Pai6+r+b5iT8+5T5l8nTHNRhbOGDOGjSRBPCRVNQzZlGJ6DYXO2q+NQeILrpoUQAH
         y7hvJ9Ej2GRQ8gLUBBrR9nMzx+FUQvJA7J1+2fWwbghAqQj9XtTZUc5GQe+Hu3PnJh
         1Qi8aH4YzEzH1wnCNzhDAi+/jWdILsUT8YXSjwmG1CDNzlMmrtivGq4TZ7TrfB5bFo
         aDN9NUvbh9KnlXNRc3vo8NKBQ76EsM00ixTtcO3Z9S9qwsCb2z4KvrD4dvyNc4ZMnH
         6hGlRj2DO5xF4krXrmEzP9cY7cCB8SK9LUpl1S08IvfN12tXYI73xurtCx9ijjBy7L
         yY9x3WIbr78lA==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1611128871-5898-1-git-send-email-tdas@codeaurora.org>
References: <1611128871-5898-1-git-send-email-tdas@codeaurora.org>
Subject: Re: [PATCH V1] clk: qcom: gcc-sc7180: Mark the MM XO clocks to be always ON
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Rajendra Nayak <rnayak@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        Taniya Das <tdas@codeaurora.org>
To:     Michael Turquette <mturquette@baylibre.com>,
        Taniya Das <tdas@codeaurora.org>
Date:   Mon, 08 Feb 2021 09:53:51 -0800
Message-ID: <161280683188.76967.6497784586600635867@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Taniya Das (2021-01-19 23:47:51)
> There are intermittent GDSC power-up failures observed for titan top
> gdsc, which requires the XO clock. Thus mark all the MM XO clocks always
> enabled from probe.
>=20
> Fixes: 8d4025943e13 ("clk: qcom: camcc-sc7180: Use runtime PM ops instead=
 of clk ones")
> Signed-off-by: Taniya Das <tdas@codeaurora.org>
> ---

Applied to clk-next
