Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C6AD53578BE
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 Apr 2021 02:14:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229869AbhDHAPE (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 7 Apr 2021 20:15:04 -0400
Received: from mail.kernel.org ([198.145.29.99]:41864 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229484AbhDHAPE (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 7 Apr 2021 20:15:04 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id DB92D61028;
        Thu,  8 Apr 2021 00:14:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1617840894;
        bh=UiXcGBJh4c0kSXwp2qgyukk5odAkVAwc7x9dCgrxAAE=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=UXdEWudN/65t+BJZiGmlUPKe8GMAIb7C/F2xb6/GpRwoqAl46xOEZbrzGBk05Sl1+
         RLHbdqkXuJ69JjEZV0t8Vnen12AZn4kIx6arWjXEc8hDUiApbn/SdiF3v/Ig9nNThj
         xoWYwSV8eRtOHRabvjzkfuFiaX5sVtEqFPiTzYNQ5hP0Ll6Ehp2piPx8F9lOpneJS5
         6EeA48rWn/daTaRT4WSjWRBL+fhkSBmXn6QEXGLXkWg9kALnPvHvmYgYAF3/s/9TqH
         2/gEWCONbPU+92EElBlv7/dwOqyvhEbYaMXZduezrP0TDVhivlSO8LmmjMrUJm1HaQ
         JupiwHX0vqmUQ==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20210405224743.590029-4-dmitry.baryshkov@linaro.org>
References: <20210405224743.590029-1-dmitry.baryshkov@linaro.org> <20210405224743.590029-4-dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH v4 03/33] clk: qcom: gcc-sm8250: drop unused enum entries
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>
Date:   Wed, 07 Apr 2021 17:14:52 -0700
Message-ID: <161784089272.3790633.1123538698790984471@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Dmitry Baryshkov (2021-04-05 15:47:13)
> Drop unused enum entries from the list of parent enums.
>=20
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

Applied to clk-next
