Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A363128D7E8
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 Oct 2020 03:17:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730917AbgJNBRv (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 13 Oct 2020 21:17:51 -0400
Received: from mail.kernel.org ([198.145.29.99]:40004 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730912AbgJNBRs (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 13 Oct 2020 21:17:48 -0400
Received: from kernel.org (unknown [104.132.1.79])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 5E3BF207DE;
        Wed, 14 Oct 2020 01:17:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1602638268;
        bh=RBU472PFlxhQNCe6dN6+iCCt04Uc685ytofmwqbOn8I=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=0528nbaIHIGA+//giBP4FlibLA/RDZFyVW4kJXv6WIMPsLRT54/mxpnBFxzJtuGP2
         cvH1aGk9PDCig+82kxqKCSam+qtHg7a9bLvoKqXJEoqe38RAjM1uxTBvytWv/DEXKM
         IKDx0K0hsElIxifnCAr0OJiiQ19XrDfUaSsMPUpc=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20200923160635.28370-6-jonathan@marek.ca>
References: <20200923160635.28370-1-jonathan@marek.ca> <20200923160635.28370-6-jonathan@marek.ca>
Subject: Re: [PATCH v3 5/5] clk: qcom: add video clock controller driver for SM8250
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
To:     Jonathan Marek <jonathan@marek.ca>, linux-arm-msm@vger.kernel.org
Date:   Tue, 13 Oct 2020 18:17:47 -0700
Message-ID: <160263826718.310579.1264814457839774213@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Jonathan Marek (2020-09-23 09:06:31)
> Add support for the video clock controller found on SM8250 based devices.
>=20
> Derived from the downstream driver.
>=20
> Signed-off-by: Jonathan Marek <jonathan@marek.ca>
> ---

Applied to clk-next
