Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 02A1F3578E8
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 Apr 2021 02:17:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229922AbhDHARU (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 7 Apr 2021 20:17:20 -0400
Received: from mail.kernel.org ([198.145.29.99]:42630 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229480AbhDHART (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 7 Apr 2021 20:17:19 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id BE72861028;
        Thu,  8 Apr 2021 00:17:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1617841028;
        bh=S1LNNO37FPuo5v8p2XoKELsgeyl8Om24C24RtsHoeMk=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=DeNENA+SVzTwImH/7V7nTLQLi8ftwjeYWGk0L8c7NiWOx6isj8h9hOk37e6PSGRNP
         t8EL3zSSwnALuiYvuvEgZpPkftGhNQg0OooN0zr8WPBQW1Jcnhx/SgdvDouN98oocH
         p52sMsuXZ5CWz4KS2Hlxd8LJPyneEpvdFwpB1vle2cStH8SUEii6NHsNDRdLSsP6Cz
         CKmwGiQ/wmwCk6+hikMg9u08Iljnw/IOiSf+A1SiCJtczDX8ln8/Z/CNa8g9ucXueR
         3cq1cPBM9yTeMM9rJPdzrLZINjTgXcyeMJ7GDXSW/kHZi9XkwBXzu8IYtWPjjm9shm
         cYeYpDDhtFp6Q==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20210405224743.590029-25-dmitry.baryshkov@linaro.org>
References: <20210405224743.590029-1-dmitry.baryshkov@linaro.org> <20210405224743.590029-25-dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH v4 24/33] clk: qcom: gcc-sm8350: use parent_hws where possible
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>
Date:   Wed, 07 Apr 2021 17:17:07 -0700
Message-ID: <161784102757.3790633.14660165967244702341@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Dmitry Baryshkov (2021-04-05 15:47:34)
> Switch to using parent_hws instead of parent_data when parents are
> defined in this driver and so accessible using clk_hw.
>=20
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

Applied to clk-next
