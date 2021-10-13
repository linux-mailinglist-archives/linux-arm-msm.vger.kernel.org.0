Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 78B4D42CA6B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 Oct 2021 21:51:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231245AbhJMTxA (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 13 Oct 2021 15:53:00 -0400
Received: from mail.kernel.org ([198.145.29.99]:37196 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229529AbhJMTw7 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 13 Oct 2021 15:52:59 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 3164B610A2;
        Wed, 13 Oct 2021 19:50:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1634154656;
        bh=Qo88RRyOt64j7+08prsyQHVAw/B+SOseGVO3GTYGKnM=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=kf0x192TAlcxyRsRJH3n4hsMNu8TYIlvJh0PvW8ohswOZNS1UCcilEtilHdfRc0w4
         5wWdg/0NZ1nh7AtkoNbYTzMkMQM+B9/OfAM6IzSnEA1UTfcFe9Rsd2Cqjja38vm5Gn
         3mB5WaXT6rza5O0TTvZ5emyd6RV/W+0b44SfSAJlxhES1yraAha2YHksV355HhN48c
         Ge1bS2GGUz33zAZ5hUTLcIOG+Sbzmg7HS+0HfpFGjTn6SqZBGmGQbYYSIxa6rOrLUt
         +GXBrFi0fvG1wTX9KZKn7mD+aGn7q1ANNDqnZWCbrzGaaxTqda9X/TuMsbj0dAYld4
         53EEgNkAdTI1Q==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <4614587c-b87a-4375-cb6a-6af6f5462c6b@linaro.org>
References: <20210829154757.784699-1-dmitry.baryshkov@linaro.org> <20210829154757.784699-8-dmitry.baryshkov@linaro.org> <YV8WsQb9H7+CaLjP@ripper> <4614587c-b87a-4375-cb6a-6af6f5462c6b@linaro.org>
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
Date:   Wed, 13 Oct 2021 12:50:54 -0700
Message-ID: <163415465484.936110.9292145029740247591@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Dmitry Baryshkov (2021-10-07 09:16:13)
> On 07/10/2021 18:48, Bjorn Andersson wrote:
> > On Sun 29 Aug 08:47 PDT 2021, Dmitry Baryshkov wrote:
> >=20
> >> Now as the common qcom clock controller code has been taught about pow=
er
> >> domains, stop mentioning mmcx supply as a way to power up the clock
> >> controller's gdsc.
> >>
> >> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> >> Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> >=20
> > Once we merge these, I expect that the boards will start crashing if
> > the kernel is booted using an existing DTB?
> >=20
> > Is it okay to just merge the first 6 patches in the series now and
> > postpone these two until we've had the dts change sitting for a while?
>=20
> Sure it is.
>=20

What's the merge strategy? It goes through arm-soc?
