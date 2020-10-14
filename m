Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1245728E55B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 Oct 2020 19:30:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729756AbgJNR37 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 14 Oct 2020 13:29:59 -0400
Received: from mail.kernel.org ([198.145.29.99]:54150 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728813AbgJNR36 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 14 Oct 2020 13:29:58 -0400
Received: from kernel.org (unknown [104.132.1.79])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id CA07D21D7F;
        Wed, 14 Oct 2020 17:29:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1602696597;
        bh=9437E/K9Qu+aoCzM51wOQqODMRawCtymxfccbkH8RAg=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=eks+5Kx4x2WnR4nUpLvMdfiVWyzWm5JoGDPo9Bq00dK+flYHLoHgfmbKE240fVYJV
         sbwxEVQFAvy6fydc0i1sIQW1ykWt92bll4Or+qHXsJTEeQuqp2RCKX+gfiI+WJxfJL
         jn4xKmR0TfVZWouJjCFRZyXN6xaybJyawk5JmxHA=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <153b313c-ff06-c91b-5adc-4cc3c5cd1a6f@linaro.org>
References: <20201005225914.315852-1-dmitry.baryshkov@linaro.org> <20201005225914.315852-3-dmitry.baryshkov@linaro.org> <160264174883.310579.10321983404701479878@swboyd.mtv.corp.google.com> <153b313c-ff06-c91b-5adc-4cc3c5cd1a6f@linaro.org>
Subject: Re: [PATCH v1 2/3] clk: qcom: gdsc: enable external switchable power domain
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        devicetree@vger.kernel.org, linux-clk@vger.kernel.org
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Jonathan Marek <jonathan@marek.ca>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>
Date:   Wed, 14 Oct 2020 10:29:56 -0700
Message-ID: <160269659638.884498.4031967462806977493@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Dmitry Baryshkov (2020-10-14 02:44:31)
> On 14/10/2020 05:15, Stephen Boyd wrote:
> > Quoting Dmitry Baryshkov (2020-10-05 15:59:13)
> >> On SM8250 MDSS_GDSC (and respective dispcc clocks) are children of MMCX
> >> power domain. MMCX needs to be enabled to be able to access GDSC
> >> registers and to enable display clocks. Use dev_pm/opp to enable
> >> corresponding power domain.
> >>
> >> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> >> ---
> >=20
> > A general question is why is this done in the gdsc code instead of
> > somewhere generic? It seems that genpds may need to change the
> > performance state of other genpds. I vaguely recall that genpd supports
> > connecting different power domains together so maybe this could all be
> > handled in the genpd layer instead of here? Then a regulator could be
> > put behind a genpd and similarly be connected to the gdsc and turned on
> > before turning on the gdsc?
>=20
> Basically because we need not only to enable the genpd, but also to set=20
> performance state. This would mean creating a separate regulator driver=20
> calling dev_pm_genpd_set_performance_state() from enable/disable paths.
> Does that seem like a better solution to you?

It does sound like a better solution to me. Unfortunately we already
have that generic code here in the gdsc file so lifting it up into the
genpd layer is a bunch of work. It is certainly the end goal.
