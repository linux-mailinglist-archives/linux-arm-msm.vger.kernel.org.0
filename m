Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 250C61E357A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 May 2020 04:22:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726277AbgE0CWV (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 26 May 2020 22:22:21 -0400
Received: from mail.kernel.org ([198.145.29.99]:37348 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725826AbgE0CWV (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 26 May 2020 22:22:21 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 1A286207CB;
        Wed, 27 May 2020 02:22:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1590546141;
        bh=pLOLjdatirb33TNQ/xSfkJSHnzqTKSS4J4mW9ArbwO8=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=ePYPAd8WKPEzFoF8AWDgLL33HVvfsRaC2yqJ+LROpw0Jx8XLeDGWEjwNHOohuvCxf
         845BL1ljCiYHWkrLagGgujvxgICdkhC+lwyQazhBrjOzCOY7GQbAgrGwRi8qoDNF8t
         Pa4vJYReHEiXlbNOhLnoxIH7eJp2FBDuCzKXuTs4=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1589709861-27580-2-git-send-email-tdas@codeaurora.org>
References: <1589709861-27580-1-git-send-email-tdas@codeaurora.org> <1589709861-27580-2-git-send-email-tdas@codeaurora.org>
Subject: Re: [PATCH v2 1/3] clk: qcom: gcc: Add support for a new frequency for SC7180
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     David Brown <david.brown@linaro.org>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        Andy Gross <agross@kernel.org>,
        Taniya Das <tdas@codeaurora.org>
To:     Michael Turquette <mturquette@baylibre.com>,
        Taniya Das <tdas@codeaurora.org>
Date:   Tue, 26 May 2020 19:22:20 -0700
Message-ID: <159054614033.88029.7512708640140771352@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Taniya Das (2020-05-17 03:04:19)
> There is a requirement to support 51.2MHz from GPLL6 for qup clocks,
> thus update the frequency table and parent data/map to use the GPLL6
> source PLL.
>=20
> Fixes: 17269568f7267 ("clk: qcom: Add Global Clock controller (GCC) drive=
r for SC7180")
> Signed-off-by: Taniya Das <tdas@codeaurora.org>
> ---

Applied to clk-next
