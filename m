Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 166C146E3D3
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Dec 2021 09:11:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234407AbhLIIPH (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 9 Dec 2021 03:15:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58060 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232443AbhLIIPH (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 9 Dec 2021 03:15:07 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1192AC061746;
        Thu,  9 Dec 2021 00:11:34 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id CD268B823C5;
        Thu,  9 Dec 2021 08:11:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8D886C004DD;
        Thu,  9 Dec 2021 08:11:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1639037491;
        bh=SP5fNBxSWgqHUyZpucf/Y4EOGZXLRzfdPLgVrLfYxaE=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=nUYz8ic9apBhufKmTZtW+lpsxvI/tSG9EpsAExgfgyPt2+uxxBPPRygqaPc90CcjJ
         ny6azizCpabqTGKZ3vPYzHV6tKJqKtv3JSYQR4e9i6jDEcifoMxCSnM9n9265AXCxS
         iZrKybyLOQju2i8lQJZ6+nGvMyeeTd7Aap7hDGn6AQymkBJHJiriftQ27RvqyHJZG1
         y6CsJj8TRryhaLfnVnaB1iurlPoUSTRjtj38j9E9bZhhmBnICtQv36ICJEI8SCacBU
         +KBL7RQrYMGkwimXfTiAEkG3AzSox7ZSlUAQO537UDTtc5kGoeqT4/WTjDL4pSmT/c
         laoc8M+i4OkTQ==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20211208175430.1333594-7-dmitry.baryshkov@linaro.org>
References: <20211208175430.1333594-1-dmitry.baryshkov@linaro.org> <20211208175430.1333594-7-dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH 06/11] clk: qcom: camcc-sc7180: use parent_hws instead of parent_data
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Taniya Das <tdas@codeaurora.org>
Date:   Thu, 09 Dec 2021 00:11:30 -0800
User-Agent: alot/0.9.1
Message-Id: <20211209081131.8D886C004DD@smtp.kernel.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Dmitry Baryshkov (2021-12-08 09:54:25)
> If all parents are specified as clk_hw, we can use parent_hws instead of
> parent_data.
>=20
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

Is the code size smaller? Would be nice to add that detail.

Reviewed-by: Stephen Boyd <sboyd@kernel.org>
