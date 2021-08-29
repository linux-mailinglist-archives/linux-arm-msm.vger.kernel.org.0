Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9DC2E3FA85A
	for <lists+linux-arm-msm@lfdr.de>; Sun, 29 Aug 2021 05:51:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234658AbhH2Dwa (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 28 Aug 2021 23:52:30 -0400
Received: from mail.kernel.org ([198.145.29.99]:58476 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234467AbhH2DwW (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 28 Aug 2021 23:52:22 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 66C3C604DC;
        Sun, 29 Aug 2021 03:51:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1630209091;
        bh=T+GABwA0FrhRhceiZG+I013v5BAz1FlMtTw3sPU6rPc=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=eEkoK//4tq9qb1YdcYX0q13UNDcUm0Rway2uPkC9N+yOHKPt8H6FsQM0cFp2LIsWD
         /6JVxkSwj8LR907k359DF+m5GAFelDGGcQcgM+VMVhlwBSRs8W+Y/n34kj5G6y93Sq
         LO+8zX9zzgF3HRzV9OMnKSh2setFz8VFKb0NCETZd9dHaAljktzm2nWj6Nh9LDkCh8
         fHpwHe1G42LwEGhAWq0PB4MEWtLOlmWeY47ROvQs/ZN5FzWmlVIAS/1cwIpuYS1XxG
         hnvPOB1st1HTEr21EANgGsqpzpIE8+Kw/QVg8iZhAkbMNuLEXTONjTABkFU7ITd9Y5
         wfOi3TP2XqiMw==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <42c3fa20-7ffa-255f-ca28-6f0aa2aa4a13@linaro.org>
References: <20210727202004.712665-1-dmitry.baryshkov@linaro.org> <163000270629.1317818.2836576068466077505@swboyd.mtv.corp.google.com> <42c3fa20-7ffa-255f-ca28-6f0aa2aa4a13@linaro.org>
Subject: Re: [PATCH v6 0/6] clk: qcom: use power-domain for sm8250's clock controllers
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
Date:   Sat, 28 Aug 2021 20:51:30 -0700
Message-ID: <163020909027.2218116.11109424225803296345@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Dmitry Baryshkov (2021-08-26 14:56:23)
> On 26/08/2021 21:31, Stephen Boyd wrote:
> > Quoting Dmitry Baryshkov (2021-07-27 13:19:56)
> >> On SM8250 both the display and video clock controllers are powered up =
by
> >> the MMCX power domain. Handle this by linking clock controllers to the
> >> proper power domain, and using runtime power management to enable and
> >> disable the MMCX power domain.
> >>
> >> Dependencies:
> >> - https://lore.kernel.org/linux-arm-msm/20210703005416.2668319-1-bjorn=
.andersson@linaro.org/
> >>    (pending)
> >=20
> > Does this patch series need to go through the qcom tree? Presumably the
> > dependency is going through qcom -> arm-soc
>=20
> It looks like Bjorn did not apply his patches in the for-5.15 series, so =

> we'd have to wait anyway. Probably I should rebase these patches instead =

> on Rajendra's required-opps patch (which is going in this window).
>=20

Ok. Thanks. I'll drop it from my queue for now.
