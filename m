Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E23941E357E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 May 2020 04:22:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726853AbgE0CWZ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 26 May 2020 22:22:25 -0400
Received: from mail.kernel.org ([198.145.29.99]:37416 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725826AbgE0CWY (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 26 May 2020 22:22:24 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 7051D20873;
        Wed, 27 May 2020 02:22:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1590546144;
        bh=1Y7J1NdYDG9N/vDOJYQc8LafLZ6M0SRIKC84TW68RBE=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=MyC3201OWySGnjrWvCe/P+rBJZd1I5SC+ILGIuSlT0h2fuhWy192SfQ3pKmi8ZMd5
         Hel524FqTu8Y78oIZXYqEFx4P6UqExf284+JQrKsk+7d5h9NX1eFGv/kkUHwPv8kr7
         M2mI8Bwn6lU2CRuh9SVu7g7/tDxBLIWI77Zu/+CA=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1589709861-27580-3-git-send-email-tdas@codeaurora.org>
References: <1589709861-27580-1-git-send-email-tdas@codeaurora.org> <1589709861-27580-3-git-send-email-tdas@codeaurora.org>
Subject: Re: [PATCH v2 2/3] dt-bindings: clock: Add gcc_sec_ctrl_clk_src clock ID
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     David Brown <david.brown@linaro.org>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        Andy Gross <agross@kernel.org>,
        Taniya Das <tdas@codeaurora.org>
To:     Michael Turquette <mturquette@baylibre.com>,
        Taniya Das <tdas@codeaurora.org>
Date:   Tue, 26 May 2020 19:22:23 -0700
Message-ID: <159054614359.88029.2985546320122491978@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Taniya Das (2020-05-17 03:04:20)
> The gcc_sec_ctrl_clk_src clock is required to be controlled by the
> secure controller driver.
>=20
> Signed-off-by: Taniya Das <tdas@codeaurora.org>
> ---

Applied to clk-next
