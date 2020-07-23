Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F0F3422A454
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Jul 2020 03:06:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731394AbgGWBGM (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 22 Jul 2020 21:06:12 -0400
Received: from mail.kernel.org ([198.145.29.99]:52298 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729423AbgGWBGM (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 22 Jul 2020 21:06:12 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id A25802080D;
        Thu, 23 Jul 2020 01:06:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1595466371;
        bh=O7z5DCoAi4Xu7UzI3rgGHjrWcS50NvtztAbu552gvjk=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=M0GUegne2U06Hs5J8//RxDtE7n99J5kRQ1A7/ZziPPFb4sXyI2SgCpmCgJvZYkEuZ
         wrbiPx4m8j8YiyjvJ3iIrcYCkz7134mZ9n5Lox8w87Q3AJde4gWebUaOq5zgqGA0ZF
         5AMZYli9N1V0if4vBlCXz7aNp2FyBMtuzmLj5+UI=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <69dccde9-f577-6266-07cb-820930bace68@linaro.org>
References: <1594796050-14511-1-git-send-email-tdas@codeaurora.org> <69dccde9-f577-6266-07cb-820930bace68@linaro.org>
Subject: Re: [PATCH v0] clk: qcom: gcc: Update disp gpll0 branch for 7180/845
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     David Brown <david.brown@linaro.org>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        evgreen@google.com
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Taniya Das <tdas@codeaurora.org>
Date:   Wed, 22 Jul 2020 18:06:11 -0700
Message-ID: <159546637100.3847286.13662517451264201995@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Dmitry Baryshkov (2020-07-21 07:31:56)
> On 15/07/2020 09:54, Taniya Das wrote:
> > The display gpll0 branch clock needs to be always left enabled, thus
> > move the clock ops to _aon branch ops.
>=20
> Does this also apply to sm8250/sm8150?
>=20

Probably.
