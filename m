Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6603047679C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Dec 2021 02:57:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232726AbhLPB5w (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 15 Dec 2021 20:57:52 -0500
Received: from dfw.source.kernel.org ([139.178.84.217]:38948 "EHLO
        dfw.source.kernel.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229836AbhLPB5v (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 15 Dec 2021 20:57:51 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 8AFB761BCE;
        Thu, 16 Dec 2021 01:57:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CF3CBC36AE0;
        Thu, 16 Dec 2021 01:57:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1639619870;
        bh=md7SQcrefh8HQOTLMun8wiHWtrWuocFyHTOblJQd8/E=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=k4W6++TSsPh593JqrUSyJfXS53/AN/g6ii5AcCGCCRjE538f8lbkhZT2JHh7W96bw
         FF7RnE/MJahUKLhrHUICm/85ak9zSd0rAkVP9urbaWz0KNWZrVtAvPef8qlJ5ADZ/w
         ED91qhlq0U6k6O+uWrFr0S6zy2meYkULYP4WuKwHtWB6Hof3A8dcg8k9WfTe2D6gHw
         CDRxIGlTRxpY/XqvU1BKoiis2/YENCd3swCAEIyCvppKB1lsh0QQskSr9KxsCOMM77
         oWC9xeuU13itQyRL4dVQ2IKCYViMJCBU5hZeBViLACEDMCv2E938qwS/YH7dvKfTUn
         0h+UajSeVdP/w==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20211215193704.2821775-10-dmitry.baryshkov@linaro.org>
References: <20211215193704.2821775-1-dmitry.baryshkov@linaro.org> <20211215193704.2821775-10-dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH v3 09/16] clk: qcom: camcc-sdm845: move clock parent tables down
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Taniya Das <tdas@codeaurora.org>
Date:   Wed, 15 Dec 2021 17:57:49 -0800
User-Agent: alot/0.9.1
Message-Id: <20211216015750.CF3CBC36AE0@smtp.kernel.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Dmitry Baryshkov (2021-12-15 11:36:57)
> Move clock parent tables down, after the PLL declrataions, so that we
> can use pll hw clock fields in the next commit.
>=20
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

Reviewed-by: Stephen Boyd <sboyd@kernel.org>
