Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5928534D8E6
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Mar 2021 22:14:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231815AbhC2UNj (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 29 Mar 2021 16:13:39 -0400
Received: from mail.kernel.org ([198.145.29.99]:42210 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231908AbhC2UNM (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 29 Mar 2021 16:13:12 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 1B97A6192F;
        Mon, 29 Mar 2021 20:13:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1617048792;
        bh=8DIZ+JWJBIByTZrkqVmW48ZtUZDoGgeYzah/9SenDlU=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=BLH1mnrgqNfLqsJpyV75FjuMDEAemH63WsN9V6sDW5QkGAa9feLy1nw27wmaB5ka2
         lcLSyU2kGdEi1Mucg6S36NRSVy2Q4PJYLyJzLraeD8dcAGiFz2mJDfVfwOqQiwVRkh
         arUKknhXiaE/k9A963VgckOXErHAq/ge6Pq0vs9e+BJZIk5sWT8EoIcOwlpqo2Zood
         8aiPdAapd1/XtnWry3K5M6G+Aarau8fzEP0dwMzbAv8TpXl3IAU4XtUPqfz8BJABOT
         996xaMUKFt5unuZ4eC7uejFLBUf1rDqx5AJ7/SuZjEJr5AP7BYHu1L3po96y/c7jmF
         YaqIEaGvuFOvg==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20210327092857.3073879-1-dmitry.baryshkov@linaro.org>
References: <20210327092857.3073879-1-dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH] ASoC: q6afe-clocks: fix reprobing of the driver
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>
To:     Banajit Goswami <bgoswami@codeaurora.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        alsa-devel@alsa-project.org, linux-arm-msm@vger.kernel.org
Date:   Mon, 29 Mar 2021 13:13:10 -0700
Message-ID: <161704879057.3012082.16461217665128806379@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Dmitry Baryshkov (2021-03-27 02:28:57)
> Q6afe-clocks driver can get reprobed. For example if the APR services
> are restarted after the firmware crash. However currently Q6afe-clocks
> driver will oops because hw.init will get cleared during first _probe
> call. Rewrite the driver to fill the clock data at runtime rather than
> using big static array of clocks.
>=20
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Any fixes tag?

> ---

Reviewed-by: Stephen Boyd <sboyd@kernel.org>
