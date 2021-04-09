Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5222335A5C0
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 Apr 2021 20:28:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234508AbhDIS2n (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 9 Apr 2021 14:28:43 -0400
Received: from mail.kernel.org ([198.145.29.99]:43072 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234494AbhDIS2k (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 9 Apr 2021 14:28:40 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id AE742610FC;
        Fri,  9 Apr 2021 18:28:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1617992906;
        bh=ZNK3TuYhJCzGu8T+SlczJWZtL8b/8DFtxQhVE6LIw7o=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=UCedhY4BZNpEUDfnsyybtNvQh1k+Uz+zw97sD77392ran+pgOK8ybQJtwZY+wOV4b
         wCtC0bdO2BT58tOcN500JSCNeElykPlNzwvfSGGFmt0X3Lslh4XaXz01IHZZLQVQCx
         jRuohfNmhgWmyBysj6k2PickQhr3+EFPyAHAPG2w9teSdNr7CkgSl0TRmSywDfiIRT
         vkGknEqUEr8rmoemDRbXfwmXZ7dddVelGqxipZ5xpPKFdbhlHEzl6oZmLbZkXX/eje
         sE6vP//MmpaqB5qUNgAjYV0N3Nmy26YfuPu1BJ7QWe890crn2vQq31mIIdgxQEiiWT
         qdEiL5fbboO1A==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20210409082352.233810-4-clare.chenhui@huawei.com>
References: <20210409082352.233810-1-clare.chenhui@huawei.com> <20210409082352.233810-4-clare.chenhui@huawei.com>
Subject: Re: [PATCH v2 -next 3/3] clk: qcom: apss-ipq-pll: Add missing MODULE_DEVICE_TABLE
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
To:     Chen Hui <clare.chenhui@huawei.com>, agross@kernel.org,
        bjorn.andersson@linaro.org, georgi.djakov@linaro.org,
        mani@kernel.org, mturquette@baylibre.com, sivaprak@codeaurora.org
Date:   Fri, 09 Apr 2021 11:28:25 -0700
Message-ID: <161799290558.3790633.18178161611801578190@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Chen Hui (2021-04-09 01:23:52)
> CONFIG_IPQ_APSS_PLL is tristate option and therefore this driver can
> be compiled as a module. This patch adds missing MODULE_DEVICE_TABLE
> definition which generates correct modalias for automatic loading of
> this driver when it is built as an external module.
>=20
> Fixes: ecd2bacfbbc4 ("clk: qcom: Add ipq apss pll driver")
> Signed-off-by: Chen Hui <clare.chenhui@huawei.com>
> Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> ---

Applied to clk-next
