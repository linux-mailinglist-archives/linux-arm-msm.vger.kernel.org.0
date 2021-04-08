Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 42A423578DC
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 Apr 2021 02:16:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229796AbhDHAQl (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 7 Apr 2021 20:16:41 -0400
Received: from mail.kernel.org ([198.145.29.99]:42446 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229484AbhDHAQl (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 7 Apr 2021 20:16:41 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id DA47B61028;
        Thu,  8 Apr 2021 00:16:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1617840991;
        bh=M+LQDk/+C4uHhfQ37lcjLEj+u02ep8f6qSQzZI3X5YE=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=IFOIsJ+E+mmyhG3URBq3oKm2xhV0tYOHn29UxMrC9V7XtJIxNVK9ypTQdeIMxZgnK
         3DZZENZrtPGd8gRklC/K+jV1PjRe04idWXZQXyPFHw51Be9G7mJ5m67B9vkpHbY+Tu
         cgFxJ7WXsieFgswCW0/TGY0kFVBUMp4sCUD10nm+4U18Dnc6CJD1DRL1eKF6fx9Z1/
         njXWwy43/GMENFS50sfxRsPrNhz9tYukgV/i/MSgyHRogJZEYR8giDYnWHwIV2Nbh9
         2BfDJBl9ZtQBTfz6lHFE4LIqN4uYbxqiviaoDFxOCmTb90jjn88lCeMfokuPvZwqNS
         X2FVHls6UVGLA==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20210405224743.590029-19-dmitry.baryshkov@linaro.org>
References: <20210405224743.590029-1-dmitry.baryshkov@linaro.org> <20210405224743.590029-19-dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH v4 18/33] clk: qcom: dispcc-sm8250: use parent_hws where possible
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>
Date:   Wed, 07 Apr 2021 17:16:29 -0700
Message-ID: <161784098971.3790633.8906559873059002259@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Dmitry Baryshkov (2021-04-05 15:47:28)
> Switch to using parent_hws instead of parent_data when parents are
> defined in this driver and so accessible using clk_hw.
>=20
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

Applied to clk-next
