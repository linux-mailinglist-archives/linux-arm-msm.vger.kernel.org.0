Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 954A0476793
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Dec 2021 02:53:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232678AbhLPBxB (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 15 Dec 2021 20:53:01 -0500
Received: from ams.source.kernel.org ([145.40.68.75]:59978 "EHLO
        ams.source.kernel.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229555AbhLPBxB (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 15 Dec 2021 20:53:01 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id ECF13B82272;
        Thu, 16 Dec 2021 01:52:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 99549C36AE1;
        Thu, 16 Dec 2021 01:52:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1639619578;
        bh=a9f3wSpm1lc5Y3Y8g2ry6g5ORQ2Q/CCmoXTjdnyi+04=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=cdT8XuqAWd5hrlbID2xcyP4nl46/j2oUWx8NTQE/gM2nMRYvEsRDL/NLNIU9jLa4V
         WvUEJaUOjNQxtDH8xK+pKmt53Z9mkp6E7J40bVn8JTLzlmZiCnhMqdVII1bEPo4oy1
         aeJtiV8ADj7ahNWWTPQjxBWOHrgm3eNYiKWJzrDt5OfvYF+cDu1MAEg8XAK3ZUUTfl
         CoTlORlcexdeq0+WE0TdbIbC41FdtsK0aDSiRIODYORBbzsfb/ptF7x1Cdh2yb4GJM
         vZJlssJRY+/s6saNyFNybYan47+pz88nw+Q80AW1iNdNRoqfukNNvslJEg1bgXVtAD
         fo1pt4mGrt+6g==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20211215193704.2821775-5-dmitry.baryshkov@linaro.org>
References: <20211215193704.2821775-1-dmitry.baryshkov@linaro.org> <20211215193704.2821775-5-dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH v3 04/16] clk: qcom: camcc-sc7180: use ARRAY_SIZE instead of specifying num_parents
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        Marijn Suijten <marijn.suijten@somainline.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Taniya Das <tdas@codeaurora.org>
Date:   Wed, 15 Dec 2021 17:52:57 -0800
User-Agent: alot/0.9.1
Message-Id: <20211216015258.99549C36AE1@smtp.kernel.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Dmitry Baryshkov (2021-12-15 11:36:52)
> Use ARRAY_SIZE() instead of manually specifying num_parents. This makes
> adding/removing entries to/from parent_data easy and errorproof.
>=20
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>
> ---

Reviewed-by: Stephen Boyd <sboyd@kernel.org>
