Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CDD96125AD5
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Dec 2019 06:36:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725987AbfLSFgH (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 19 Dec 2019 00:36:07 -0500
Received: from mail.kernel.org ([198.145.29.99]:46592 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725817AbfLSFgG (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 19 Dec 2019 00:36:06 -0500
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id AD605222C2;
        Thu, 19 Dec 2019 05:36:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1576733765;
        bh=SphPqeX+O5iIOIShcb3YDC1d5sRfJwLkxLogSjEcn9s=;
        h=In-Reply-To:References:Cc:Subject:From:To:Date:From;
        b=V8Prj0YDFwA75GBp1ddOn/96sqam6QW7/oUTjTSJoghdtDDWsH41RFHZrPJ2PRY+n
         cY80UGmF/Q/285RTL7xc6xHh+0gUsPf5kQl29PbEIiroycpy9t7tnd+jp6ZKiCd/b5
         hsh8IDVmBXgFwbEeOi/yE5G+AoK2mpyUz/sQ6vUY=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20191204120341.1.I9971817e83ee890d1096c43c5a6ce6ced53d5bd3@changeid>
References: <20191204120341.1.I9971817e83ee890d1096c43c5a6ce6ced53d5bd3@changeid>
Cc:     linux-arm-msm@vger.kernel.org, Taniya Das <tdas@codeaurora.org>,
        Douglas Anderson <dianders@chromium.org>,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        Matthias Kaehlcke <mka@chromium.org>
Subject: Re: [PATCH] clk: qcom: gcc-sc7180: Fix setting flag for votable GDSCs
From:   Stephen Boyd <sboyd@kernel.org>
To:     Andy Gross <agross@kernel.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        Michael Turquette <mturquette@baylibre.com>
User-Agent: alot/0.8.1
Date:   Wed, 18 Dec 2019 21:36:04 -0800
Message-Id: <20191219053605.AD605222C2@mail.kernel.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Matthias Kaehlcke (2019-12-04 12:04:12)
> Commit 17269568f7267 ("clk: qcom: Add Global Clock controller (GCC)
> driver for SC7180") sets the VOTABLE flag in .pwrsts, but it needs
> to be set in .flags, fix this.
>=20
> Fixes: 17269568f7267 ("clk: qcom: Add Global Clock controller (GCC) drive=
r for SC7180")
> Signed-off-by: Matthias Kaehlcke <mka@chromium.org>
> ---

Applied to clk-fixes

