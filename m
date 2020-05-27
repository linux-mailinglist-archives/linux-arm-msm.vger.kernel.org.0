Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1559A1E35D3
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 May 2020 04:42:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726549AbgE0CmN (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 26 May 2020 22:42:13 -0400
Received: from mail.kernel.org ([198.145.29.99]:45358 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726746AbgE0CmN (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 26 May 2020 22:42:13 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id A9F6020787;
        Wed, 27 May 2020 02:42:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1590547332;
        bh=SuLUW/+t5hK/JiJ8DiytO9PLWmKU9EkLXaGPAU49CWY=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=hnigH+duwn3RVQm6TGBXWN6Qs5gYBgPsdGMmDTjsAyB/jgmcSmpvTWIjmwMhpb3pl
         zow6T/92FP0Yp0kc+Y7zFaQmBk/pu2kppPnXBzRzU92GWDjTK5G1dkPAr82ALsxtzv
         436FAKSdss1QzvxjGW/I90lmCb/2FZ080JyCmMkQ=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <86a7c49f-44ea-11d3-2983-8443ad7ec309@marek.ca>
References: <20200524210615.17035-1-jonathan@marek.ca> <20200524210615.17035-2-jonathan@marek.ca> <159053527806.88029.14584721858766224777@swboyd.mtv.corp.google.com> <86a7c49f-44ea-11d3-2983-8443ad7ec309@marek.ca>
Subject: Re: [PATCH 01/10] clk: qcom: clk-alpha-pll: remove unused/incorrect PLL_CAL_VAL
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
To:     Jonathan Marek <jonathan@marek.ca>, linux-arm-msm@vger.kernel.org
Date:   Tue, 26 May 2020 19:42:11 -0700
Message-ID: <159054733196.88029.15629810054630863245@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Jonathan Marek (2020-05-26 16:30:38)
> On 5/26/20 7:21 PM, Stephen Boyd wrote:
> > Quoting Jonathan Marek (2020-05-24 14:06:02)
> >> 0x44 isn't a register offset, it is the value that goes into CAL_L_VAL.
> >>
> >> Signed-off-by: Jonathan Marek <jonathan@marek.ca>
> >> ---
> >=20
> > Any fixes tag?
> >=20
>=20
> This doesn't fix anything (its unused as the commit message says), does=20
> that still qualify for a fixes tag?

Sure. Even if it's unused it could be used by someone who backported the
patch somewhere.
