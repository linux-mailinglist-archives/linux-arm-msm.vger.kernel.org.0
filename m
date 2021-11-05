Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7F537446AE8
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Nov 2021 23:29:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231354AbhKEWc2 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 5 Nov 2021 18:32:28 -0400
Received: from mail.kernel.org ([198.145.29.99]:33478 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229940AbhKEWc1 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 5 Nov 2021 18:32:27 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id A047A60EE9;
        Fri,  5 Nov 2021 22:29:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1636151387;
        bh=zTa8NeOLlZY9rOnUeE9DsM6ltvHHHwJ6pez9o/KBqvs=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=TXk8Y1lNqwkpGz7MpemhCG1HVTRYVAcD0ooHBojAXSejkjYcyM9vnZ6BE2H+H4Dnj
         C6Co5tKJKpk+5yogPqI+p/m2P7mFdn25uJUbcCoQZXrWtL9gytGDiGQ/hiEFEpV/eK
         +v9lYP/7b/0IDN7Yqoqx96FKR51fTsOWtRPhxhz7nMxC6Ylcl8Li27czcmhDWbIZnU
         qjhnBlQH2pD8yUwNiOWwrupkjUaqYWBSjeiIen/lIk41hGoWiRgP7YQWNYEYylowFm
         2VGSoIqdXV6RmroLmmR2qn06bG3k7aubye6nBJI886iwwklDH79JBBtlVzLXUvIQm4
         6sOKVS8ZWHI9Q==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20211104011155.2209654-1-dmitry.baryshkov@linaro.org>
References: <20211104011155.2209654-1-dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH] clk: qcom: gcc-msm8996: Drop (again) gcc_aggre1_pnoc_ahb_clk
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Taniya Das <tdas@codeaurora.org>
Date:   Fri, 05 Nov 2021 15:29:46 -0700
User-Agent: alot/0.9.1
Message-Id: <20211105222947.A047A60EE9@mail.kernel.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Dmitry Baryshkov (2021-11-03 18:11:55)
> The gcc_aggre1_pnoc_ahb_clk is crucial for the proper MSM8996/APQ8096
> functioning. If it gets disabled, several subsytems will stop working
> (including eMMC/SDCC and USB). There are no in-kernel users of this
> clock, so it is much simpler to remove from the kernel.
>=20
> The clock was first removed in the commit 9e60de1cf270 ("clk: qcom:
> Remove gcc_aggre1_pnoc_ahb_clk from msm8996") by Stephen Boyd, but got
> added back in the commit b567752144e3 ("clk: qcom: Add some missing gcc
> clks for msm8996") by Rajendra Nayak.
>=20
> Let's remove it again in hope that nobody adds it back.
>=20
> Reported-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
> Cc: Rajendra Nayak <rnayak@codeaurora.org>
> Cc: Konrad Dybcio <konrad.dybcio@somainline.org>
> Fixes: b567752144e3 ("clk: qcom: Add some missing gcc clks for msm8996")
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

Applied to clk-next
