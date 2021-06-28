Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A4A123B5602
	for <lists+linux-arm-msm@lfdr.de>; Mon, 28 Jun 2021 02:01:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231768AbhF1ADx (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 27 Jun 2021 20:03:53 -0400
Received: from mail.kernel.org ([198.145.29.99]:36600 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231709AbhF1ADw (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 27 Jun 2021 20:03:52 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 02FB5619C4;
        Mon, 28 Jun 2021 00:01:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1624838488;
        bh=C0mM8kBMd3VD7tttt8n24YWpksKW/HJK/MIIwHcYnPE=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=SP94FDHKX61G+nO78JNdsdU2/txiIVAKcIJH6JQlcT6YdeH62uUpMGv8Hg4wNkOeh
         H6/Ts6WjZMG5i+G4EUvd0VsYFaH6bFYbQegFiVzFuNg6nlPd1t21h8/Rju0Tkp4CTb
         ve4BsphcIeG/Jym9WxOOV++SyqM13ROxi1Q+KEYEOENK3+TvaDveJITDWTT8YulkZ0
         wG3Hp5K6u6B8wYFMgl9whr1sWOkOz71FikABh7pDJ4vvCE4i+XNKN+4TwfKlU8EZEB
         uwoYaN3wB4FV2N5+SEnOSf6fuNq5WAbggiOe/kKVROFaqOpgEkEuLyITKNE81YPwCo
         pMS5FZQYJJEvA==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20210418122909.71434-3-bartosz.dudziak@snejp.pl>
References: <20210418122909.71434-1-bartosz.dudziak@snejp.pl> <20210418122909.71434-3-bartosz.dudziak@snejp.pl>
Subject: Re: [PATCH v2 2/5] clk: qcom: gcc: Add support for Global Clock controller found on MSM8226
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Bartosz Dudziak <bartosz.dudziak@snejp.pl>
To:     Andy Gross <agross@kernel.org>,
        Bartosz Dudziak <bartosz.dudziak@snejp.pl>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
Date:   Sun, 27 Jun 2021 17:01:26 -0700
Message-ID: <162483848682.3259633.12714299318722524172@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Bartosz Dudziak (2021-04-18 05:29:06)
> Modify existing MSM8974 driver to support MSM8226 SoC. Override frequenci=
es
> which are different in this older chip. Register all the clocks to the
> framework for the clients to be able to request for them.
>=20
> Signed-off-by: Bartosz Dudziak <bartosz.dudziak@snejp.pl>
> ---

Applied to clk-next
