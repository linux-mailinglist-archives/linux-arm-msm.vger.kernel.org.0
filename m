Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4317E17EAE7
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Mar 2020 22:12:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726266AbgCIVMu (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 9 Mar 2020 17:12:50 -0400
Received: from mail.kernel.org ([198.145.29.99]:34504 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726118AbgCIVMu (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 9 Mar 2020 17:12:50 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 14F442146E;
        Mon,  9 Mar 2020 21:12:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1583788370;
        bh=Y0kKsp4ZEnxt99dXihUsJMZ1guyBaJ+F1Weo+/PYGs4=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=eXK8cNmTVPNbMfKh1qidZ8533eaE3KDpSjdbGaYWWzBy4J+Pb6z9aV9HLtXAGYDfW
         zWoimguT592f2yFQ5JzeBA1p/Ajuscu8Sm4TzNK6Xckm8l17MeWzVd3M2mzjOei7cq
         bEfy/NqQ0126Uw366gzm+AiB/+mpU0G+1qbrzJu0=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20200303145920.GA32328@bogus>
References: <robh@kernel.org> <20200226214812.390-1-ansuelsmth@gmail.com> <20200303145920.GA32328@bogus>
Subject: Re: [PATCH v2] clk: qcom: clk-rpm: add missing rpm clk for ipq806x
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Ansuel Smith <ansuelsmth@gmail.com>,
        John Crispin <john@phrozen.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
To:     Ansuel Smith <ansuelsmth@gmail.com>, Rob Herring <robh@kernel.org>
Date:   Mon, 09 Mar 2020 14:12:49 -0700
Message-ID: <158378836931.66766.851774184706134250@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Rob Herring (2020-03-03 06:59:20)
> On Wed, 26 Feb 2020 22:48:12 +0100, Ansuel Smith wrote:
> > Add missing definition of rpm clk for ipq806x soc
> >=20
> > Signed-off-by: John Crispin <john@phrozen.org>
> > Signed-off-by: Ansuel Smith <ansuelsmth@gmail.com>
> > Acked-by: John Crispin <john@phrozen.org>
> > ---
> >  .../devicetree/bindings/clock/qcom,rpmcc.txt  |  1 +
> >  drivers/clk/qcom/clk-rpm.c                    | 35 +++++++++++++++++++
> >  include/dt-bindings/clock/qcom,rpmcc.h        |  4 +++
> >  3 files changed, 40 insertions(+)
> >=20
>=20
> Acked-by: Rob Herring <robh@kernel.org>

Ansuel, can you send this again and address it To: somebody like me? My
MUA fails at getting emails when they're addressed to nobody.
