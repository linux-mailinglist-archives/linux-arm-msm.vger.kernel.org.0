Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2F81242CDE4
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Oct 2021 00:25:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231452AbhJMW1C (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 13 Oct 2021 18:27:02 -0400
Received: from mail.kernel.org ([198.145.29.99]:47632 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231474AbhJMW0q (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 13 Oct 2021 18:26:46 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 7CF91610D0;
        Wed, 13 Oct 2021 22:24:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1634163882;
        bh=iSkwlRSRUWxKgv/2zZ5IoJVxhehEVym6q1lNDUtMr9k=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=pFKUopZKh08yrj61vatpQGXCh02umwADgnzkpoHciLXSSegAAeuBhXdbI2R8u1IFG
         Vk8Pk6t2eZTrn34gpLZZ96hp9UDV/sNyMe2F1xnaMeMWuIQG5Yhu390nMVenM2qaHf
         ovkIzWC2X4Fzp9gPhL/+Wsqws2r7Zfwk4ggEHP2TLvyyar58z7QqlgDkzYL2fr6Q9Q
         c4trSzNyl9gPoIcmTQxaUZQ5JbR370uoHACyFbUOALNnNcUeYtjozcQz4GClqSJXoc
         SeZ0qbdMYcetqxLwxakPGzQsm7zLRy9Zf5d3hFn5x6WYqk6kv16ojvmalunMzygtQe
         KqfNwlSztvkFA==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1633484416-27852-3-git-send-email-tdas@codeaurora.org>
References: <1633484416-27852-1-git-send-email-tdas@codeaurora.org> <1633484416-27852-3-git-send-email-tdas@codeaurora.org>
Subject: Re: [PATCH 3/3] clk: qcom: Add lpass clock controller driver for SC7280
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Rajendra Nayak <rnayak@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, robh@kernel.org, robh+dt@kernel.org,
        Taniya Das <tdas@codeaurora.org>
To:     Michael Turquette <mturquette@baylibre.com>,
        Taniya Das <tdas@codeaurora.org>
Date:   Wed, 13 Oct 2021 15:24:40 -0700
Message-ID: <163416388091.936110.10584826404239603287@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Taniya Das (2021-10-05 18:40:16)
> Add support for the lpass clock controller found on SC7280 based devices.
> This would allow lpass peripheral loader drivers to control the clocks to
> bring the subsystem out of reset.
>=20
> Signed-off-by: Taniya Das <tdas@codeaurora.org>
> ---

Applied to clk-next
