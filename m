Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 32BDB42E501
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 Oct 2021 02:04:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233311AbhJOAHA (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 14 Oct 2021 20:07:00 -0400
Received: from mail.kernel.org ([198.145.29.99]:33212 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231305AbhJOAG7 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 14 Oct 2021 20:06:59 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id A48A9610FF;
        Fri, 15 Oct 2021 00:04:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1634256293;
        bh=NTVvnYfTX40BVmMw3eQJlMEhFmoZ5nVsXELnf4BFFgA=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=DsAeDVKe1VC12UutWfTT+11iBF4eP4oVbA6UWDfVBS7c8yC14lmqVHdM9X3BcJeyS
         20od6YlUcHPYFh2een03d8UYfQheZT8gHLI+GbMO8ybzzAmwpneZdrqnLozuxEAiqN
         oCIAs15dXXY5eShS+/j5amqUmwodm80LdadV96Bk8ZMYyz+gE5e8CTnfuPn0HbK3Oy
         ZvX8zXIdGnQS57v0Xc12MI3bj7+Fl/7J2CppYpSb7aA4wu07H0Sq/mcc0n7cIyao4M
         g0xACX8TWE4rmyLMhMeJWyJm09WwMehqejLftaaPc8PwhtoTGyYTBrG6rh2s2cRaqS
         frRs8AhUVwnWA==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <070b1b25-3718-5f3a-869b-a3954fdcc7c5@linaro.org>
References: <20210829154757.784699-1-dmitry.baryshkov@linaro.org> <20210829154757.784699-8-dmitry.baryshkov@linaro.org> <YV8WsQb9H7+CaLjP@ripper> <4614587c-b87a-4375-cb6a-6af6f5462c6b@linaro.org> <163415465484.936110.9292145029740247591@swboyd.mtv.corp.google.com> <070b1b25-3718-5f3a-869b-a3954fdcc7c5@linaro.org>
Subject: Re: [PATCH v7 7/8] clk: qcom: dispcc-sm8250: stop using mmcx regulator
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Andy Gross <agross@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        Taniya Das <tdas@codeaurora.org>,
        Jonathan Marek <jonathan@marek.ca>,
        Michael Turquette <mturquette@baylibre.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-clk@vger.kernel.org,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mark Brown <broonie@kernel.org>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        linux-kernel@vger.kernel.org
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Thu, 14 Oct 2021 17:04:52 -0700
Message-ID: <163425629248.1688384.14367506222343416862@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Dmitry Baryshkov (2021-10-14 02:53:41)
> On 13/10/2021 22:50, Stephen Boyd wrote:
> > Quoting Dmitry Baryshkov (2021-10-07 09:16:13)
> >> On 07/10/2021 18:48, Bjorn Andersson wrote:
> >>> On Sun 29 Aug 08:47 PDT 2021, Dmitry Baryshkov wrote:
> >>>
> >>>> Now as the common qcom clock controller code has been taught about p=
ower
> >>>> domains, stop mentioning mmcx supply as a way to power up the clock
> >>>> controller's gdsc.
> >>>>
> >>>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> >>>> Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> >>>
> >>> Once we merge these, I expect that the boards will start crashing if
> >>> the kernel is booted using an existing DTB?
> >>>
> >>> Is it okay to just merge the first 6 patches in the series now and
> >>> postpone these two until we've had the dts change sitting for a while?
> >>
> >> Sure it is.
> >>
> >=20
> > What's the merge strategy? It goes through arm-soc?
>=20
> I think this should go through the clk tree. There is little chance of=20
> conflicts.
>=20

The other thing that concerns me is that we don't have backwards
compat code. If things are going to start crashing that's not very nice.
Is there some way to make it work with old and new DTB for one release
so that we don't have to worry about this problem?
