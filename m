Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 032C43578E0
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 Apr 2021 02:16:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229505AbhDHAQz (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 7 Apr 2021 20:16:55 -0400
Received: from mail.kernel.org ([198.145.29.99]:42506 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229484AbhDHAQy (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 7 Apr 2021 20:16:54 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 466DF61028;
        Thu,  8 Apr 2021 00:16:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1617841004;
        bh=vm82k6nCeDQ0bdql121pPIKoIF3V02vSvpt3Q2T7CeM=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=FNXgwZVDGLenXn8X5umVe/UpG/DUCcF2Rqf8xx5WALpmglHen5XlZ4307aROdo6OH
         EX2W4L5qtjjppulYnaSpAheHpLSBnuqLMqq5mKgz8KPeoxeIuJlhtNPeFfrdv8iSz+
         VIdENgeL9sThQQ4I7y8B123ZrD2NRXVLGBEWX+Emwg62OyWqJ9x6sy7hCwpOinMN42
         ejBbWNcJERuRZYhhB6fI1tyxr1htnstqBCSNqTFgEd3wBSWqA3/ObbQGKDEfx7Fm+3
         CTp2BmL5XFgso8hTB8E/ClJ8JqjyIm6nIauAMka/v32KWI0g3sJGYoWFC2Sxe/S4SI
         Wt6XYmfW6Pb9g==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20210405224743.590029-21-dmitry.baryshkov@linaro.org>
References: <20210405224743.590029-1-dmitry.baryshkov@linaro.org> <20210405224743.590029-21-dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH v4 20/33] clk: qcom: gcc-sc7280: use parent_hws where possible
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>
Date:   Wed, 07 Apr 2021 17:16:43 -0700
Message-ID: <161784100312.3790633.11484520756570099265@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Dmitry Baryshkov (2021-04-05 15:47:30)
> Switch to using parent_hws instead of parent_data when parents are
> defined in this driver and so accessible using clk_hw.
>=20
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

Applied to clk-next
