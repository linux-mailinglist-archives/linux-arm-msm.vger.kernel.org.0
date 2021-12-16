Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A8C96476791
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Dec 2021 02:52:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229782AbhLPBw1 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 15 Dec 2021 20:52:27 -0500
Received: from ams.source.kernel.org ([145.40.68.75]:59816 "EHLO
        ams.source.kernel.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229555AbhLPBw0 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 15 Dec 2021 20:52:26 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id A9CAEB82272;
        Thu, 16 Dec 2021 01:52:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5C9E0C36AE1;
        Thu, 16 Dec 2021 01:52:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1639619544;
        bh=2K9pQwdDDy0y7J8ky39c4Hw0XfqTtJ23Y0jH3DESgSU=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=pgX13SCsdoMvQ+cgN9POgV9j87/OuKriLwKV/KCl+wDELTntNFFmCWS9drMEQhsFT
         GGiH6ce4wqVULJ+LTxBUphA0Gey4GzMQ8CQLL+yjzYKUJnBR9IWTa0SHm8S8WGWDOn
         FXiiPSflBTiWn2IE2W2AYftk9vMuMGpCSnh+18SfMhh31B8brb2M2Ior4eyk2/+3H4
         eepfhYzMxq4hX6LPqo5oVTlfnj4KC2h0aUt3AylTgNphpPtd68HIqfs0QJ9jv6tswV
         BOc9UkZewSLKJW2H/Ltym8J8NgxuSHvzhTmKQCOZiIrEKrdGMC9nGFey2DuUgZqtoz
         4QGzF/724jhsA==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20211215193704.2821775-2-dmitry.baryshkov@linaro.org>
References: <20211215193704.2821775-1-dmitry.baryshkov@linaro.org> <20211215193704.2821775-2-dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH v3 01/16] clk: qcom: gpucc-sdm660: fix two clocks with parent_names
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        Marijn Suijten <marijn.suijten@somainline.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Taniya Das <tdas@codeaurora.org>
Date:   Wed, 15 Dec 2021 17:52:23 -0800
User-Agent: alot/0.9.1
Message-Id: <20211216015224.5C9E0C36AE1@smtp.kernel.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Dmitry Baryshkov (2021-12-15 11:36:49)
> Two clocks are still using parent_names, use parent_hws instead.
>=20
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>
> ---

Reviewed-by: Stephen Boyd <sboyd@kernel.org>
