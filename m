Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DCBE611DC58
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Dec 2019 03:59:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731823AbfLMC7U (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 12 Dec 2019 21:59:20 -0500
Received: from mail.kernel.org ([198.145.29.99]:40448 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731465AbfLMC7U (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 12 Dec 2019 21:59:20 -0500
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id C83A02253D;
        Fri, 13 Dec 2019 02:59:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1576205959;
        bh=RH3Pptee/5aoHYQ4RNVUdCSN4XCmcGNcg+JaAX4xUW0=;
        h=In-Reply-To:References:Subject:To:From:Cc:Date:From;
        b=DnGwVAEll/LFXIy4YypUwzLAccpIARE9XytX1h62/9Jv64FK7FB6m8pXi41WYF5+d
         0Pq/qaEpUp8GA06zT+ttkYfl8hmLHDSME8TBxRKwb6iMCs1hghYSkJ0QjCb5ch4kXX
         OCK3+Qa4UslrRzfFJxViyij/DLYGq+0OyUV8c88c=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20191126153437.11808-1-georgi.djakov@linaro.org>
References: <20191126153437.11808-1-georgi.djakov@linaro.org>
Subject: Re: [PATCH] clk: qcom: gcc-sdm845: Add missing flag to votable GDSCs
To:     Georgi Djakov <georgi.djakov@linaro.org>,
        bjorn.andersson@linaro.org, robdclark@gmail.com
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     mturquette@baylibre.com, agross@kernel.org, tdas@codeaurora.org,
        anischal@codeaurora.org, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        georgi.djakov@linaro.org
User-Agent: alot/0.8.1
Date:   Thu, 12 Dec 2019 18:59:18 -0800
Message-Id: <20191213025919.C83A02253D@mail.kernel.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Georgi Djakov (2019-11-26 07:34:37)
> On sdm845 devices, during boot we see the following warnings (unless we
> have added 'pd_ignore_unused' to the kernel command line):
>         hlos1_vote_mmnoc_mmu_tbu_sf_gdsc status stuck at 'on'
>         hlos1_vote_mmnoc_mmu_tbu_hf1_gdsc status stuck at 'on'
>         hlos1_vote_mmnoc_mmu_tbu_hf0_gdsc status stuck at 'on'
>         hlos1_vote_aggre_noc_mmu_tbu2_gdsc status stuck at 'on'
>         hlos1_vote_aggre_noc_mmu_tbu1_gdsc status stuck at 'on'
>         hlos1_vote_aggre_noc_mmu_pcie_tbu_gdsc status stuck at 'on'
>         hlos1_vote_aggre_noc_mmu_audio_tbu_gdsc status stuck at 'on'
>=20
> As the name of these GDSCs suggests, they are "votable" and in downstream
> DT, they all have the property "qcom,no-status-check-on-disable", which
> means that we should not poll the status bit when we disable them.
>=20
> Luckily the VOTABLE flag already exists and it does exactly what we need,
> so let's make use of it to make the warnings disappear.
>=20
> Fixes: 06391eddb60a ("clk: qcom: Add Global Clock controller (GCC) driver=
 for SDM845")
> Reported-by: Rob Clark <robdclark@gmail.com>
> Signed-off-by: Georgi Djakov <georgi.djakov@linaro.org>

Taniya, can you ack/review this change?

