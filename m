Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 936363B5630
	for <lists+linux-arm-msm@lfdr.de>; Mon, 28 Jun 2021 02:04:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231702AbhF1AHL (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 27 Jun 2021 20:07:11 -0400
Received: from mail.kernel.org ([198.145.29.99]:39646 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231689AbhF1AHL (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 27 Jun 2021 20:07:11 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id BABE9619C4;
        Mon, 28 Jun 2021 00:04:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1624838686;
        bh=jnrU4OqHHUR7T+feCy/mtShGxn0Hc7wAnUaJsntkUn0=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=l+U179oYqSPu6GZwntHJkKrFfXdZI6kirjJKA1DaVXQft2NaNcmTfcDy0l+mp3KDW
         bsgkzLquvezikn4WTxXWprxQ5ve09NWODzogDy5PQootixEiyMI7l1k6ELG41p0gzQ
         MlHbfzukyM+Tg7aYA8m325ArJpPCi+MWNgnO9T9ygVAJbzccroc1gFKFNqLWkB4WCW
         4Ea3SbwiMnWSPJpSQJy5VZFZ8eOboXmZ/XRVun6wq0OKXHB0VjJ+xVtq8oN99on7c5
         rflne5eFLlHcDXSKSW32kRh07+RBdasAiYgsrrLuESTIkNAw1+DDMvWPZohUnH3qA5
         FBQqrHyoAtqHQ==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20210609061848.87415-1-pulehui@huawei.com>
References: <20210609061848.87415-1-pulehui@huawei.com>
Subject: Re: [PATCH -next] clk/qcom: Remove unused variables
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, pulehui@huawei.com,
        zhangjinhao2@huawei.com
To:     Pu Lehui <pulehui@huawei.com>, agross@kernel.org,
        bjorn.andersson@linaro.org, mturquette@baylibre.com
Date:   Sun, 27 Jun 2021 17:04:45 -0700
Message-ID: <162483868555.3259633.6909021362342403973@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Pu Lehui (2021-06-08 23:18:48)
> Fix gcc '-Wunused-const-variable' warnings:
>=20
>   drivers/clk/qcom/gcc-mdm9607.c:122:37: warning: 'gcc_xo_gpll0_gpll1'
>     defined but not used [-Wunused-const-variable=3D]
>   drivers/clk/qcom/gcc-mdm9607.c:116:32: warning: 'gcc_xo_gpll0_gpll1_map'
>     defined but not used [-Wunused-const-variable=3D]
>   drivers/clk/qcom/gcc-mdm9607.c:42:37: warning: 'gcc_xo_sleep' defined
>     but not used [-Wunused-const-variable=3D]
>   drivers/clk/qcom/gcc-mdm9607.c:37:32: warning: 'gcc_xo_sleep_map'
>     defined but not used [-Wunused-const-variable=3D]
>=20
> Let's remove them.
>=20
> Signed-off-by: Pu Lehui <pulehui@huawei.com>
> ---

Applied to clk-next
