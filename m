Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ABFD7203280
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jun 2020 10:49:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725907AbgFVItW (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 22 Jun 2020 04:49:22 -0400
Received: from mail.kernel.org ([198.145.29.99]:34740 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725912AbgFVItV (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 22 Jun 2020 04:49:21 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 069E620578;
        Mon, 22 Jun 2020 08:49:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1592815761;
        bh=nqEHgJ/8zmmb+slp1bSk06vjVO02xSDQ92E2cQ0WCu4=;
        h=In-Reply-To:References:Subject:From:To:Date:From;
        b=dRtGB3B4q9cxOd8MTr4qujLsF6cHhJ93qEa/sbiWi5ixp2NySc8agWhHVgrnNYDtg
         I8UrfDCOVchUbM8RNKSGrlS2uM5EBGsuU7nHGG2PUPSbp70eHeS2eMB9KI3/uwzwoE
         zUBVlFU802PHsllDuuwcECRYgMyS4IL+oykhu860=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1592800092-20533-5-git-send-email-sivaprak@codeaurora.org>
References: <1592800092-20533-1-git-send-email-sivaprak@codeaurora.org> <1592800092-20533-5-git-send-email-sivaprak@codeaurora.org>
Subject: Re: [PATCH V8 4/4] clk: qcom: Add ipq6018 apss clock controller
From:   Stephen Boyd <sboyd@kernel.org>
To:     agross@kernel.org, bjorn.andersson@linaro.org,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        mturquette@baylibre.com, robh+dt@kernel.org,
        sivaprak@codeaurora.org
Date:   Mon, 22 Jun 2020 01:49:20 -0700
Message-ID: <159281576034.62212.7529127708731581039@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Sivaprakash Murugesan (2020-06-21 21:28:12)
> The CPU on Qualcomm ipq6018 devices are clocked primarily by a aplha PLL
> and xo which are connected to a mux and enable block.
>=20
> Add support for the mux and enable block which feeds the CPU on ipq6018
> devices.
>=20
> Reviewed-by: Stephen Boyd <sboyd@kernel.org>
> Signed-off-by: Sivaprakash Murugesan <sivaprak@codeaurora.org>
> ---

Applied to clk-next
