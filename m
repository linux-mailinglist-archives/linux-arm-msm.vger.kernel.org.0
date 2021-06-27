Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6C7C83B55EC
	for <lists+linux-arm-msm@lfdr.de>; Mon, 28 Jun 2021 01:46:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231678AbhF0Xsm (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 27 Jun 2021 19:48:42 -0400
Received: from mail.kernel.org ([198.145.29.99]:55654 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231508AbhF0Xsm (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 27 Jun 2021 19:48:42 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 4ED7960FEF;
        Sun, 27 Jun 2021 23:46:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1624837577;
        bh=+nT0mJER1hBQ1oFK+9lqRvtBnr1c3IDijt7DiiL+dgo=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=tOYVv9a/dFAYjoIF9QmL8ELvSIaocp8NVF8LbXSnc+ZvWrXYhoQWBk4qRIobOMFFS
         Lq4kYj3kSsoKHGmWkvG3yQxHpWeDpzsMNndM1IgX5Kj3hU+Lz2QoLsXMBE70f9Leax
         c89fsL8ik0lh0SYaLencJiwMfc0hV8pJWiVyLTEACCwrqQ7ni4JVKjArVrQuJqiGba
         onQJkJyfulPymd64pA4OYtayuO/CzO75ybVyvCbfGgyUzo94WbL59kLCnQjzIvOYxr
         kIX88TX0LObzVe8JJvlhNqRChTtDX4fbiiQBzlMbzaR/InzeQPfEVwUBrgSi8QMpIN
         5xwoG2xiM2skQ==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1624449471-9984-1-git-send-email-tdas@codeaurora.org>
References: <1624449471-9984-1-git-send-email-tdas@codeaurora.org>
Subject: Re: [PATCH v2] clk: qcom: gcc: Add support for a new frequency for SC7280
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Rajendra Nayak <rnayak@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, robh@kernel.org, robh+dt@kernel.org,
        Taniya Das <tdas@codeaurora.org>
To:     Michael Turquette <mturquette@baylibre.com>,
        Taniya Das <tdas@codeaurora.org>
Date:   Sun, 27 Jun 2021 16:46:16 -0700
Message-ID: <162483757601.3259633.7788849421892603556@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Taniya Das (2021-06-23 04:57:51)
> There is a requirement to support 52MHz for qup clocks for bluetooth
> usecase, thus update the frequency table to support the frequency.
>=20
> Fixes: a3cc092196ef ("clk: qcom: Add Global Clock controller (GCC) driver=
 for SC7280")
> Signed-off-by: Taniya Das <tdas@codeaurora.org>
> ---

Applied to clk-next
