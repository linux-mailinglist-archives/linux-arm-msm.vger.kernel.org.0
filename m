Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D65F7426325
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Oct 2021 05:38:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236409AbhJHDkN (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 7 Oct 2021 23:40:13 -0400
Received: from mail.kernel.org ([198.145.29.99]:53392 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229714AbhJHDkM (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 7 Oct 2021 23:40:12 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 9659760F94;
        Fri,  8 Oct 2021 03:38:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1633664297;
        bh=SO4WWpRN/VNmcG2ITuyiW6lfCl8pOr+q36Q7RPC9DZ8=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=Fy0Zpv+qtvCO2pDFN5GfD6iMoPsiO9RFt+LDUEBp6395rf1zpVcOXy4FumHjgvrxK
         xGksKR1opi7LjlCdlDNNC7oM5Qt0w2/TvZNO9uBfgcqs5UOxKP4govb/v/b7LAKU9H
         8KqcEaVrIk91PEHHEeOLr1HNqlm3bMiwErPHj+AT5AVexyyvf4lXWo8PRdXpKIS7n6
         wzu6a+pg3/2hFxqY3gnM5ZYn/cZq5yQSAyISqpbY1jI0IwDarBgJQwzoNxGe/AjyhH
         pOrgGhspPV+4SN79KeyKiYTRkgDs1twaaMOPKULKRfDcugA+w1WOJE3Gl93NZHklTg
         LdTTwGN93Cm2w==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1633579571-25475-1-git-send-email-tdas@codeaurora.org>
References: <1633579571-25475-1-git-send-email-tdas@codeaurora.org>
Subject: Re: [PATCH v1] clk: qcom: gcc: Remove CPUSS clocks control for SC7280
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Rajendra Nayak <rnayak@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        Taniya Das <tdas@codeaurora.org>
To:     Michael Turquette <mturquette@baylibre.com>,
        Taniya Das <tdas@codeaurora.org>
Date:   Thu, 07 Oct 2021 20:38:16 -0700
Message-ID: <163366429621.2041162.1682687728343834256@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Taniya Das (2021-10-06 21:06:11)
> The CPUSS clocks are kept always ON and at a fixed frequency of 100MHZ
> from the bootloader and no longer required to be controlled from HLOS.
>=20
> Fixes: a3cc092196ef ("clk: qcom: Add Global Clock controller (GCC) driver=
 for SC7280")
> Signed-off-by: Taniya Das <tdas@codeaurora.org>
> ---

Applied to clk-next
