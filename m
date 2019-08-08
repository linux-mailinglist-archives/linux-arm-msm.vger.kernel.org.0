Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4BE2985942
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 Aug 2019 06:31:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727840AbfHHEab (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 8 Aug 2019 00:30:31 -0400
Received: from mail.kernel.org ([198.145.29.99]:42394 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726749AbfHHEab (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 8 Aug 2019 00:30:31 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 189CC21743;
        Thu,  8 Aug 2019 04:30:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1565238630;
        bh=1+URRL/j1c6HgZHm2mFbkwJnj6VhhDQ/uYDMJL+bsww=;
        h=In-Reply-To:References:From:Cc:To:Subject:Date:From;
        b=AoK5J6tsBtjT5LrjB5/Jsz4NnqGOAmXU2c7HMrVwVV0s46E1oCl4zmmbpJcVu4MWP
         2l109zLiFvNdiN6hlhITPkbrc3xfDEVhvVe6Pdun69359Ez4frtNuIT6+emDqpYVV6
         bStOdoBTh+OK14xNqGIWQHOXZAGzurRJMu4rtSBc=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20190722074348.29582-2-vkoul@kernel.org>
References: <20190722074348.29582-1-vkoul@kernel.org> <20190722074348.29582-2-vkoul@kernel.org>
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Deepak Katragadda <dkatraga@codeaurora.org>,
        Andy Gross <agross@kernel.org>,
        David Brown <david.brown@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        linux-clk@vger.kernel.org, Taniya Das <tdas@codeaurora.org>,
        linux-kernel@vger.kernel.org
To:     Vinod Koul <vkoul@kernel.org>
Subject: Re: [PATCH v4 1/5] clk: qcom: clk-alpha-pll: Remove unnecessary cast
User-Agent: alot/0.8.1
Date:   Wed, 07 Aug 2019 21:30:29 -0700
Message-Id: <20190808043030.189CC21743@mail.kernel.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Vinod Koul (2019-07-22 00:43:44)
> Commit 8f9fab480c7a ("linux/kernel.h: fix overflow for
> DIV_ROUND_UP_ULL") fixed the overflow for DIV_ROUND_UP_ULL, so we no
> longer need the cast for DIV_ROUND_UP_ULL, so remove the unnecessary
> u64 casts.
>=20
> Signed-off-by: Vinod Koul <vkoul@kernel.org>
> ---

Applied to clk-next

