Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0FD4C3F8DE8
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Aug 2021 20:36:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232070AbhHZSgu (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 26 Aug 2021 14:36:50 -0400
Received: from mail.kernel.org ([198.145.29.99]:56112 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231312AbhHZSgt (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 26 Aug 2021 14:36:49 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 3433860F44;
        Thu, 26 Aug 2021 18:36:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1630002962;
        bh=WPN8j0PhulQdWhjtelVwI3oUaVCKv8+ViKWIOVeZN1o=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=dMUEKWWFnzT/Q3rk/+KvJlNDxaPYOd/qMV5KyFBzmSJk5XJZvtnB+dNbqJEGopvz0
         g2m0LoybjUzroldYEwy5z9ko5lMEHN1Ul9dlClx+WpSoSoMzdaf5YtBWmca7cGeOBL
         CdUrNzOB6ia+2Kbt4msWteZFBmpPHVKYp/lVbXMx5O7C6o4tuur0hO4En/Bqw7bzGo
         xWEfqQnsw9cXvjs4kOKsGY5h5aKTub61uhqv6TjbMxbAcBgSk8F0yzqc9Lfd5INRNO
         tvSjH203D1AbEBGYHz40vYcsRAdIh6SeWBvmVqC4d/KQpwDaSHEPNh1fWSGeefr9O/
         8bJExuVnWbCwg==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <162510009624.3570193.9612972387190530602@swboyd.mtv.corp.google.com>
References: <20210630225952.3337630-1-dmitry.baryshkov@linaro.org> <162510009624.3570193.9612972387190530602@swboyd.mtv.corp.google.com>
Subject: Re: [PATCH v2 0/2] clk: qcom: fix error path and cleanup in gdsc support
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        Rajendra Nayak <rnayak@codeaurora.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Taniya Das <tdas@codeaurora.org>
Date:   Thu, 26 Aug 2021 11:36:00 -0700
Message-ID: <163000296093.1317818.17674882452780510494@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Stephen Boyd (2021-06-30 17:41:36)
> Quoting Dmitry Baryshkov (2021-06-30 15:59:50)
> > Fix error path in gdsc_register() and cleanup code in gdsc_unregister()
> > to properly unwind all genpd registration calls. Both patches bear two
> > fixes tags, since part of the issue was present in the very first commit
> > adding support for GDSCs, part of the issue was added when adding
> > hiearchical power domains support to GDSC code.
>=20
> Should also include the author of the patch that is being Fixed as an
> FYI.
>=20

I'm inclined to drop this series from my clk review queue unless it is
still relevant. Is this still a problem after Bjorn's fix to this file?
