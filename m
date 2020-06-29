Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1AEF520E396
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jun 2020 00:03:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390578AbgF2VPi (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 29 Jun 2020 17:15:38 -0400
Received: from mail.kernel.org ([198.145.29.99]:35990 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1732303AbgF2VPi (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 29 Jun 2020 17:15:38 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 1AFD7206F1;
        Mon, 29 Jun 2020 21:15:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1593465337;
        bh=OdIEw/I6XjRn2q7lfeju3B7URR0/9lhFPMhXLS+TvPs=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=m6NY+7/VerlVfjB2bNmk0y5ULlvTos4ODieZ99Oa6tkik3B29fxbnxNbRBU4rCI1S
         Sydk5w+jU44A5SluaGzr4H269zwbci7d2lFrrwo/2ZIMMIqlCuT4gaugeRYfnmExgk
         vtW8JeSzhJEpY6BCB7VBoOz5XpLpMmmqVoV9r8Co=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20200628023055.50608-1-weiyongjun1@huawei.com>
References: <20200628023055.50608-1-weiyongjun1@huawei.com>
Subject: Re: [PATCH -next] clk: qcom: Fix return value check in apss_ipq6018_probe()
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Wei Yongjun <weiyongjun1@huawei.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        kernel-janitors@vger.kernel.org, Hulk Robot <hulkci@huawei.com>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Sivaprakash Murugesan <sivaprak@codeaurora.org>,
        Wei Yongjun <weiyongjun1@huawei.com>
Date:   Mon, 29 Jun 2020 14:15:36 -0700
Message-ID: <159346533636.62212.17293772427230982378@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Wei Yongjun (2020-06-27 19:30:55)
> In case of error, the function dev_get_regmap() returns NULL pointer
> not ERR_PTR(). The IS_ERR() test in the return value check should be
> replaced with NULL test.
>=20
> Fixes: 5e77b4ef1b19 ("clk: qcom: Add ipq6018 apss clock controller")
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
> ---

Applied to clk-next
