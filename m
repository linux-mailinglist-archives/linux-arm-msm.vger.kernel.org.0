Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2F3E53578BA
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 Apr 2021 02:14:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229825AbhDHAOw (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 7 Apr 2021 20:14:52 -0400
Received: from mail.kernel.org ([198.145.29.99]:41784 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229484AbhDHAOv (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 7 Apr 2021 20:14:51 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 8249661178;
        Thu,  8 Apr 2021 00:14:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1617840881;
        bh=+etKLezfjjySbJ41nsIb7F9o7LLHI8iENnAvrvjVQu4=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=QFsKHlfrkkMPU470v6qrqlKnXa0qTF1bAnHbFGKD9ZAz+bRApsi6XO5byTeFxsHxq
         YKyAvCza79gp9+9FzVZS7fKzqRObwinSUEesLevawwBMum8Uy7+IO6D8+qXxAIV4Lr
         4p0IDTcMkzO44BP3WGo1P1tEYa07P0Als1R3m4tQFNXu3MbdwYFUK5H2vMAwMhBnzc
         +K4o0XcMCrh8DucIIr1QvzMKPw8WdtsbTkn3cMQcZljr8syXPzpyQfbWCIqLQo0QCm
         YIOobbOUROthNKVcLanoUZ6xFHG9N5lAAh5t1JKdXUOZm+HS0mB7OXOcTh9V07fM7/
         i29zbhrwBHpQQ==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20210405224743.590029-2-dmitry.baryshkov@linaro.org>
References: <20210405224743.590029-1-dmitry.baryshkov@linaro.org> <20210405224743.590029-2-dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH v4 01/33] clk: qcom: dispcc-sc7180: drop unused enum entries
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        Taniya Das <tdas@codeaurora.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>
Date:   Wed, 07 Apr 2021 17:14:40 -0700
Message-ID: <161784088019.3790633.13382684066145327265@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Dmitry Baryshkov (2021-04-05 15:47:11)
> Drop unused enum entries from the list of parent enums.
>=20
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Reviewed-by: Taniya Das <tdas@codeaurora.org>
> ---

Applied to clk-next
