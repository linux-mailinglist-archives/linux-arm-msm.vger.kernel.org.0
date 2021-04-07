Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1CEAB3578A2
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 Apr 2021 01:43:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229505AbhDGXnW (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 7 Apr 2021 19:43:22 -0400
Received: from mail.kernel.org ([198.145.29.99]:37468 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229480AbhDGXnW (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 7 Apr 2021 19:43:22 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id BF32B611EE;
        Wed,  7 Apr 2021 23:43:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1617838991;
        bh=zvDvexnQ3lxvfbkxPzZwdmHaygW1faXEHMvj7hRACLw=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=StDDCiNFax2oC40TjnVooVHrSB55k4y33XxnwSkC/GEWIz5k42ey/jrlp15EehlVn
         25U1bBMD1TObEN+NzKKX6AfvJ5nVBVYs9ocugIjSr/G00UhjklSlwps6kRnQb3Z6re
         HPubDPltwa267KhcuaDhy4xRqhDvLgSxmaCmMu4jHA3TIaa9CsdkgyiLzgHnSO2oGF
         CYcCsNrRDG1KC2u+QAoJ3RgKo9++H1O1fFBzDxlmup9yBSCRSPahCU7QBuMer/Um7m
         16C0BM9GugDsLYgtGbLAm9NXxk265Gfmsr90TH743aTlCfjs+gPdE+4gBB4MhMVbY+
         wZabwZwImRT4A==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20210405224743.590029-1-dmitry.baryshkov@linaro.org>
References: <20210405224743.590029-1-dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH v4 00/33] clk: qcom: cleanup sm8250/sdm845/sc7180 clock drivers
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>
Date:   Wed, 07 Apr 2021 16:43:10 -0700
Message-ID: <161783899042.3790633.9490108430627961819@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Dmitry Baryshkov (2021-04-05 15:47:10)
> Cleanup several Qualcomm clock drivers by removing unused entries from
> parents map, removing test clock, etc.

Checkpatch complains about block comments. I'll fix it up when applying.
