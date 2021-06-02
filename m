Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 318CA3981C8
	for <lists+linux-arm-msm@lfdr.de>; Wed,  2 Jun 2021 08:55:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230081AbhFBG5H (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 2 Jun 2021 02:57:07 -0400
Received: from mail.kernel.org ([198.145.29.99]:41744 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229922AbhFBG4s (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 2 Jun 2021 02:56:48 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 5027E61359;
        Wed,  2 Jun 2021 06:55:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1622616905;
        bh=mK7o3GcfqjDeO63jrM5y3qHZM42ixi418rI06C5uYhk=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=gChyNay2GntgA3mPKCW57aX5IuhuLOVc6U8i6VSVCv7ZDXAPhlnTbwWBXOGj9wHAh
         VbUuY2CdtTJpO1nrg2MNlG2RecCGStaUDGAsKbo0mrJ8N1WkDuJYizwcsJkuU9oUNI
         HmWJoU2VopQLxFw2pQn7xf0AJ17kXTcd43pFDbk/PQTLaszqlVqhVzybHv+EqnCI7G
         SLgkdrIWvFco5wwPySg2ntu2q+M8nvIcZ25F5vGdVBPKLG8iiFdFgIuFG5ebwFEGzD
         /S47pOBHYNfVDSeHIV3eXDBRdBT4YdSw+0EduGhNHbzFhDIMLEIXlpwp2CBO15y6R8
         gc8OY4cv7XuPg==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20210503191837.GA2220566@robh.at.kernel.org>
References: <1619519590-3019-1-git-send-email-tdas@codeaurora.org> <1619519590-3019-2-git-send-email-tdas@codeaurora.org> <20210503191837.GA2220566@robh.at.kernel.org>
Subject: Re: [PATCH v2 1/6] dt-bindings: clock: Add SC7280 DISPCC clock binding
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Michael Turquette =?utf-8?q?=C2=A0?= <mturquette@baylibre.com>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
To:     Rob Herring <robh@kernel.org>, Taniya Das <tdas@codeaurora.org>
Date:   Tue, 01 Jun 2021 23:55:04 -0700
Message-ID: <162261690404.4130789.10296098922791923637@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Rob Herring (2021-05-03 12:18:37)
> On Tue, Apr 27, 2021 at 04:03:05PM +0530, Taniya Das wrote:
> > diff --git a/include/dt-bindings/clock/qcom,dispcc-sc7280.h b/include/d=
t-bindings/clock/qcom,dispcc-sc7280.h
> > new file mode 100644
> > index 0000000..2074b30
> > --- /dev/null
> > +++ b/include/dt-bindings/clock/qcom,dispcc-sc7280.h
> > @@ -0,0 +1,55 @@
> > +/* SPDX-License-Identifier: GPL-2.0-only */
>=20
> Dual license please. I'm tired of telling the company that complained to =

> me about having dual licensing for DT stuff not dual license their
> stuff. Please pass that on to your coworkers.
>=20

Taniya, is this going to be resent?
