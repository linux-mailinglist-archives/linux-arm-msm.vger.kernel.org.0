Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1F2A7319391
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Feb 2021 20:57:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231503AbhBKT4C (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 11 Feb 2021 14:56:02 -0500
Received: from mail.kernel.org ([198.145.29.99]:38242 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231341AbhBKTzk (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 11 Feb 2021 14:55:40 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 8E15A64E5B;
        Thu, 11 Feb 2021 19:54:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1613073299;
        bh=/zAveYO8aN4I5yU1lhFXaYJWzFu7+sbkC0mYe3GfEbM=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=usxwNNYwvmBJx+kIluXX7W1jYOjkiT9A1vHtL2ukyg0NxDgMt0lOsMYvXOsh1yRLn
         oJr8gNjRL9DTZSPH3twndBUINMkpKksVs0daRaJbMPoz7CU4uzR1zfVCl+lTagB74K
         sOuqhqlRo6HfB0qcztn9w138t6INRs2Rx6T8/ngvVIq3RzotH++8Oc8ywq4MNfxclP
         pZdFpZgx/7Ld8TZkNXWJUNFpcfLYBH7jHEJXliHQ0KuxPmI3yhdgCBO4iWSlfmwyVc
         Depk056mtLO9z+jGMYTwz9F9FV3f25oRWqqBUryRCUggwSytFH45Q9ok+UZvyhUdcW
         baGMbLMKCY8ig==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20210126124540.3320214-5-lee.jones@linaro.org>
References: <20210126124540.3320214-1-lee.jones@linaro.org> <20210126124540.3320214-5-lee.jones@linaro.org>
Subject: Re: [PATCH 04/21] clk: qcom: clk-regmap: Provide missing description for 'devm_clk_register_regmap()'s dev param
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-kernel@vger.kernel.org, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
To:     lee.jones@linaro.org
Date:   Thu, 11 Feb 2021 11:54:58 -0800
Message-ID: <161307329831.1254594.13688803820338131067@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Lee Jones (2021-01-26 04:45:23)
> Fixes the following W=3D1 kernel build warning(s):
>=20
>  drivers/clk/qcom/clk-regmap.c:97: warning: Function parameter or member =
'dev' not described in 'devm_clk_register_regmap'
>=20
> Cc: Andy Gross <agross@kernel.org>
> Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
> Cc: Michael Turquette <mturquette@baylibre.com>
> Cc: Stephen Boyd <sboyd@kernel.org>
> Cc: linux-arm-msm@vger.kernel.org
> Cc: linux-clk@vger.kernel.org
> Signed-off-by: Lee Jones <lee.jones@linaro.org>
> ---

Applied to clk-next
