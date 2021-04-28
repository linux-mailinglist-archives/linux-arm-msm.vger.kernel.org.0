Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 43DFB36CFF2
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Apr 2021 02:20:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235844AbhD1AUn (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 27 Apr 2021 20:20:43 -0400
Received: from mail.kernel.org ([198.145.29.99]:51386 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230368AbhD1AUm (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 27 Apr 2021 20:20:42 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 9BF37611BE;
        Wed, 28 Apr 2021 00:19:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1619569198;
        bh=MJTwLnoFZCSbNOl+6JT4GyxAxbQH/L2S/7bsnNdD72w=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=N7TtZ4zO1w074zQXSr1P/Z7PgTCK6gEWv2j1h+8urE/Ka2tef2y1NkFM7JDG0zWli
         zGWhi9FzyTI2Y8qSI7sLKFMWfwU48FrAi2+IFtzWCNkvAIGLklg8hfeJgQbEKqwmrN
         eDmEVlF4iM8IDtfHIE4bQAVo3kkgNhweXI7X6c7CT8wLrIxFn7xxf6pew3AX2LioDA
         T6H9zL0QaeKyYE8oGgTj6acFqwHu8pRyLmtFSLoNDMaSiL3yo+4xOYeCIWVYgnZZt6
         XoZux3P5lrIxqOVGwxaG6Cg2rZ/d2F/JVddsPryr+mNRGQItoKKxZke/9Yt9/giWfm
         rHLWYhjBsK8Hg==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1619334502-9880-1-git-send-email-tdas@codeaurora.org>
References: <1619334502-9880-1-git-send-email-tdas@codeaurora.org>
Subject: Re: [PATCH v3] Add support for duty-cycle for RCG
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Rajendra Nayak <rnayak@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        Taniya Das <tdas@codeaurora.org>
To:     Michael Turquette <mturquette@baylibre.com>,
        Taniya Das <tdas@codeaurora.org>
Date:   Tue, 27 Apr 2021 17:19:57 -0700
Message-ID: <161956919717.177949.9925740807826300314@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Taniya Das (2021-04-25 00:08:21)
> The root clock generators with MND divider has the capability to support
> change in duty-cycle by updating the 'D'. Add the clock ops which would
> check all the boundary conditions and enable setting the desired duty-cyc=
le
> as per the consumer.
>=20
> [v3]
>   * Implement clockops for get_duty_cycle.
>   * Return -EINVAL for Non-MND or HID RCGs.

We don't need cover letters for single patches. Please add these details
after the dash before the diffstat on the single patch.

>=20
> Taniya Das (1):
>   clk: qcom: clk-rcg2: Add support for duty-cycle for RCG
>=20
>  drivers/clk/qcom/clk-rcg2.c | 81 +++++++++++++++++++++++++++++++++++++++=
++++++
>  1 file changed, 81 insertions(+)
>=20
> --
> Qualcomm INDIA, on behalf of Qualcomm Innovation Center, Inc.is a member
> of the Code Aurora Forum, hosted by the  Linux Foundation.
>
