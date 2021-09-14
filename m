Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3BAE840BA75
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Sep 2021 23:39:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235069AbhINVkg (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 14 Sep 2021 17:40:36 -0400
Received: from mail.kernel.org ([198.145.29.99]:45244 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235044AbhINVkf (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 14 Sep 2021 17:40:35 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 76BFC60E8B;
        Tue, 14 Sep 2021 21:39:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1631655557;
        bh=Tje2Sud28lCgq/rRJXPAhPNcTU/4sbGMApfgsWl9sWA=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=AozRXsaRlGpwAEV85SFqhMOQUMboMAM4AQ6Q4CI4kEJDcBQt8Iq2KCdeJw1CPKv/p
         TrjmGpFAKJYrnIchbFbtDj2iIpFic9CmA0eA2OCMVGW9LsnaAxBecPqEIBKyDvY4py
         BEBnthKUNId64Diu3a7JRNtxB5awkdyl2YvoVs7Svn60tsDDwdEkBIckTuLDOz5L6c
         eL0YVAYdeC/WtUncqJGxP5BSmGkcbJntB2KvB/l7KkF9D34GA3LkU41jPLmYCXFsxq
         +W/9NMkqgxb/KcUQ3/VBpFO5ZiKCBXn8shyY5MHsy2H++AXmGpOmJ30t1UFqbnpb/f
         WmJfLFv7xv4Kw==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20210907084843.3999-1-caihuoqing@baidu.com>
References: <20210907084843.3999-1-caihuoqing@baidu.com>
Subject: Re: [PATCH] clk: qcom: a53-pll: Make use of the helper function devm_platform_ioremap_resource()
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
To:     caihuoqing@baidu.com
Date:   Tue, 14 Sep 2021 14:39:16 -0700
Message-ID: <163165555614.763609.5940355051490935672@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Cai Huoqing (2021-09-07 01:48:43)
> Use the devm_platform_ioremap_resource() helper instead of
> calling platform_get_resource() and devm_ioremap_resource()
> separately
>=20
> Signed-off-by: Cai Huoqing <caihuoqing@baidu.com>
> ---

Applied to clk-next
