Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8C35D42E598
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 Oct 2021 02:56:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233766AbhJOA6f (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 14 Oct 2021 20:58:35 -0400
Received: from mail.kernel.org ([198.145.29.99]:36682 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234657AbhJOA6e (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 14 Oct 2021 20:58:34 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 8694361040;
        Fri, 15 Oct 2021 00:56:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1634259388;
        bh=U4dnARrBWAJGLPP9DHiCUoMVYjVtEHe13X6lFc+M2aU=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=qlv2hEphxGUqwrs6OgVrQ1UYPmDSQcG/2vTNOcEzktQCqWVNJublBs/jENA4ARDal
         6fpoHJismQiFl92yxnSea4s2/o2bdx+t04Hm/u45VrgGgoyc24DQBWXVVTxTpGptY2
         lUk1TZ+Cb2JBNTsFm3L8fHgUG/u6bCkcC42GtcXt5bIHsQ5CX3lzfxanUguAap4dAX
         M/lIpb4UCpMJl5aKBORuFJjQFPIV4wl8plINzng4UGcKwi7btU8ZR7pEY4D2r4sSDG
         P1SFSARbuNCsmA22FPoP7P32grG+GjHa79dshW1EDhVe0Zvjeizqc7iHMf2o5Ez2yk
         +C3UNJ5gpYvdA==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20210829154757.784699-6-dmitry.baryshkov@linaro.org>
References: <20210829154757.784699-1-dmitry.baryshkov@linaro.org> <20210829154757.784699-6-dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH v7 5/8] clk: qcom: gdsc: enable optional power domain support
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-clk@vger.kernel.org,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mark Brown <broonie@kernel.org>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        linux-kernel@vger.kernel.org
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Jonathan Marek <jonathan@marek.ca>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Taniya Das <tdas@codeaurora.org>
Date:   Thu, 14 Oct 2021 17:56:27 -0700
Message-ID: <163425938743.1688384.8904532659751492259@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Dmitry Baryshkov (2021-08-29 08:47:54)
> On sm8250 dispcc and videocc registers are powered up by the MMCX power
> domain. Currently we use a regulator to enable this domain on demand,
> however this has some consequences, as genpd code is not reentrant.
>=20
> Make gdsc code also use pm_runtime calls to ensure that registers are
> accessible during the gdsc_enable/gdsc_disable operations.
>=20
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

Applied to clk-next
