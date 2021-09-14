Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 55EC040BACD
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Sep 2021 23:56:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233952AbhINV5t (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 14 Sep 2021 17:57:49 -0400
Received: from mail.kernel.org ([198.145.29.99]:48756 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235050AbhINV5s (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 14 Sep 2021 17:57:48 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id AD138610A2;
        Tue, 14 Sep 2021 21:56:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1631656590;
        bh=26RRDY4MrZRQbocGIi6oFL7ljTt1+HyBdeo7BWgaEQk=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=rT003wPUsYOAJsOIrh5OiC2X9TCTTYGabsS1zZE7RxoQXAftXmBP4J3BmEUh2Z2ud
         NibvcfZOaaE7md8JZ13O+Yo3/afFRxcMciO4eWAPb7akXDlxj4rRR73TwJSOG7Y2NU
         EaCwxQkGPvUhzuWVPtnIHHjY8yHVUgOUTsICcdoi4A74mmKCb+rpt5uFtw+X9C87ij
         yQiT/aJ1/7ndD36XvCztA9b43CQjHIxOTrdBxTS4ZaOUFeb9F3HbxILinEvKYylxxY
         DQ9MgrnEAljriNvk/v4Of3OjEE9jxujWh8wYmdCcwr4A+Qzg99e1JR9/CpfUbzErr3
         yUZYFbp993NIw==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20210914025554.5686-2-shawn.guo@linaro.org>
References: <20210914025554.5686-1-shawn.guo@linaro.org> <20210914025554.5686-2-shawn.guo@linaro.org>
Subject: Re: [PATCH 1/3] clk: qcom: smd-rpm: Add rate hooks for clk_smd_rpm_branch_ops
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Loic Poulain <loic.poulain@linaro.org>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        Shawn Guo <shawn.guo@linaro.org>
To:     Shawn Guo <shawn.guo@linaro.org>
Date:   Tue, 14 Sep 2021 14:56:28 -0700
Message-ID: <163165658855.763609.14080313241484048687@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Shawn Guo (2021-09-13 19:55:52)
> On QCM2290 platform, the clock xo_board runs at 38400000, while the
> child clock bi_tcxo needs to run at 19200000.  That said,
> clk_smd_rpm_branch_ops needs the capability of setting rate. Add rate
> hooks into clk_smd_rpm_branch_ops to make it possible.

This doesn't sound right. The branch is a simple on/off. If xo_board is
38.4MHz, then there is an internal divider in the SoC that makes bi_tcxo
(i.e. the root of the entire clk tree) be 19.2MHz. We don't model the
divider, I guess because it isn't very important to. Instead, we tack on
a divider field and implement recalc_rate op. See clk-rpmh.c in the qcom
directory for this.
