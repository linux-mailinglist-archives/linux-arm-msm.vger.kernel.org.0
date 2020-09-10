Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1EE542640DB
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Sep 2020 11:03:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726600AbgIJJDw (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 10 Sep 2020 05:03:52 -0400
Received: from mail.kernel.org ([198.145.29.99]:42074 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725920AbgIJJDv (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 10 Sep 2020 05:03:51 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 06455206A1;
        Thu, 10 Sep 2020 09:03:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1599728631;
        bh=PXXK58jPCqS6xYVS0F97ACb3SCnVEU4nMHvu1m+Yjww=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=u5/cueTq+S2bdNS+dHMZ3rey0YBx20X/O3idxF7MPKKoBFhB4uB8oNjCldahtEx29
         gXpFp9cGK6chH8HZamzspUrTZUyCWy7c6pYp8umQlTBTawp8P0wRXER6fvIUcjF3vS
         oc6q2KtIBUxFLCVYO6B4DrQaVY2hD8J95MCWeWVg=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20200827141629.101802-1-jingxiangfeng@huawei.com>
References: <20200827141629.101802-1-jingxiangfeng@huawei.com>
Subject: Re: [PATCH] clk: qcom: lpass: Correct goto target in lpass_core_sc7180_probe()
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, jingxiangfeng@huawei.com
To:     Jing Xiangfeng <jingxiangfeng@huawei.com>, agross@kernel.org,
        bjorn.andersson@linaro.org, mturquette@baylibre.com,
        tdas@codeaurora.org
Date:   Thu, 10 Sep 2020 02:03:49 -0700
Message-ID: <159972862952.2295844.10882678924928944990@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Jing Xiangfeng (2020-08-27 07:16:29)
> lpass_core_sc7180_probe() misses to call pm_clk_destroy() and
> pm_runtime_disable() in error paths. Correct goto target to fix it.
> This issue is found by code inspection.
>=20
> Signed-off-by: Jing Xiangfeng <jingxiangfeng@huawei.com>
> ---

HMm.. presumably

Fixes: edab812d802d ("clk: qcom: lpass: Add support for LPASS clock control=
ler for SC7180")

should be added?
