Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 40FF63578D0
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 Apr 2021 02:15:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229917AbhDHAQC (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 7 Apr 2021 20:16:02 -0400
Received: from mail.kernel.org ([198.145.29.99]:42220 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229484AbhDHAQB (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 7 Apr 2021 20:16:01 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id D279261178;
        Thu,  8 Apr 2021 00:15:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1617840950;
        bh=8Iffjz/PuMggNlUCZR7YZ1ybD6DtLmH4QilJSKb3pyg=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=DOxgBhMGjHXG8Qh/oTOG3vZwqPisbzeKa7gocQO3fAwUCSQcBIW4rlZTHSBePRF8e
         JU7rmwROmJ5vQbCaWp2c8bIXh4tgj6hKqOvNxDG75sWxu0o5wD0cXTIysO56pE1toM
         wXSxPUEt1VMjMUKkOIl5kcnRpjJVSCbcQXoeUFrxn1BxaSVrXIEu1tza6EEPPqZNP8
         03DDlhTr4hixUJRkE5T3qvESZfXKdlAyQJJLPm31UVZN8lZD9taNlilzQKAj+/BqQ4
         fMA1D2iDdVHuuGTITMOZj+hM1VPCWpLkTVG47cSG7fUv1N6Mk7rMVRdkt8M+S+GHfV
         8tL3+TgBsQg4g==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20210405224743.590029-13-dmitry.baryshkov@linaro.org>
References: <20210405224743.590029-1-dmitry.baryshkov@linaro.org> <20210405224743.590029-13-dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH v4 12/33] clk: qcom: gpucc-sdm845: convert to parent data
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>
Date:   Wed, 07 Apr 2021 17:15:49 -0700
Message-ID: <161784094974.3790633.5005622961186696617@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Dmitry Baryshkov (2021-04-05 15:47:22)
> Convert the clock driver to specify parent data rather than parent
> names, to actually bind using 'clock-names' specified in the DTS rather
> than global clock names.
>=20
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

Applied to clk-next
