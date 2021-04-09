Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 22DE235A5BA
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 Apr 2021 20:28:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234355AbhDIS21 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 9 Apr 2021 14:28:27 -0400
Received: from mail.kernel.org ([198.145.29.99]:42764 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233332AbhDIS21 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 9 Apr 2021 14:28:27 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 32C0F61104;
        Fri,  9 Apr 2021 18:28:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1617992894;
        bh=EIU38+Lo6HLc+d74IA5mznWnrfYOAvkjeLHf/MsM2j4=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=IMVYmflNXCIhDdMBxXJRUo09dyB035FdpRgHNXk4l9yeXTNE1aZazt8pwKk6NYiGb
         JR1901SI0Wf2FiWshTSXV/ExUDcfAZUY9utOJ30Xv6zhTwcSvPlvMPTRnUrePeiTRY
         WOWJBGL8Jgjtgf8B0t9ArVV44PFjACp/As5CGi1nF8FAWL7W8uE/TAutZuZ9OcPpJK
         dNHOXzi1mOrjYhCTz6mkh8xcHB2Pg9+IuQINKAVafs/s147JyNTdX7vbQ12doXvQjx
         XnXzISdhHMXQ1EkaxwauDA7hBs7J6jJ9eN6JBE2MgPJMAH/T6NXH7q+iFe7olsGEKk
         0eAbZ4DD7wBaA==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20210409082352.233810-2-clare.chenhui@huawei.com>
References: <20210409082352.233810-1-clare.chenhui@huawei.com> <20210409082352.233810-2-clare.chenhui@huawei.com>
Subject: Re: [PATCH v2 -next 1/3] clk: qcom: a7-pll: Add missing MODULE_DEVICE_TABLE
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
To:     Chen Hui <clare.chenhui@huawei.com>, agross@kernel.org,
        bjorn.andersson@linaro.org, georgi.djakov@linaro.org,
        mani@kernel.org, mturquette@baylibre.com, sivaprak@codeaurora.org
Date:   Fri, 09 Apr 2021 11:28:12 -0700
Message-ID: <161799289289.3790633.9043783772034578675@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Chen Hui (2021-04-09 01:23:50)
> CONFIG_QCOM_A7PLL is tristate option and therefore this driver can be
> compiled as a module. This patch adds missing MODULE_DEVICE_TABLE
> definition which generates correct modalias for automatic loading of
> this driver when it is built as an external module.
>=20
> Fixes: 5a5223ffd7ef ("clk: qcom: Add A7 PLL support")
> Signed-off-by: Chen Hui <clare.chenhui@huawei.com>
> Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> ---

Applied to clk-next
