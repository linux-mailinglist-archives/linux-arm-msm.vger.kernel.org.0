Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 072DF42CA3F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 Oct 2021 21:43:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231445AbhJMTpO (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 13 Oct 2021 15:45:14 -0400
Received: from mail.kernel.org ([198.145.29.99]:35752 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229529AbhJMTpO (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 13 Oct 2021 15:45:14 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 684BC610E8;
        Wed, 13 Oct 2021 19:43:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1634154190;
        bh=BhT6SqEkehl40vU45WfzoE165F3P9RUFmFnIz7Lnuso=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=oBGX19XHlOU8ZYF3/jOOETdKajKUGMhfb+1yTyonCkuwZClP/lxFKTrgjtdyUatB6
         BFRn/Nsa7s3hBEG3+vASZJR6j71Sw7T26glh9/44pkBkqHrOUxnGKXsGHd9zt5FfuQ
         IyZw390cY1dY7AmbgcH8J1BL7NV6KmYKpq4k7a+7mTDIygbun/XwZt++U+KtUeuQH+
         GpJhFOVOJ2ui9pVK5fMkr6hMzlrVIz2LNqjkfxljGQSwOSWiY9+Q5Mu2UUHxcMAbs9
         E1o3ZeWClj9eoFiACViQ1XXEuaDq4/iuswfIpVRjLLXHmrz5IvxiVrgVZj2te1QQlC
         eh18dc15pP+Sw==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20210917030434.19859-2-shawn.guo@linaro.org>
References: <20210917030434.19859-1-shawn.guo@linaro.org> <20210917030434.19859-2-shawn.guo@linaro.org>
Subject: Re: [PATCH v2 1/3] clk: qcom: smd-rpm: Add .recalc_rate hook for clk_smd_rpm_branch_ops
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Loic Poulain <loic.poulain@linaro.org>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        Shawn Guo <shawn.guo@linaro.org>
To:     Shawn Guo <shawn.guo@linaro.org>
Date:   Wed, 13 Oct 2021 12:43:09 -0700
Message-ID: <163415418915.936110.7575629658773367684@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Shawn Guo (2021-09-16 20:04:32)
> As there is a `rate` field in clk_smd_rpm, clk_smd_rpm_recalc_rate() can
> be used by branch clocks to report rate as well, rather than assuming
> the rate is always same as parent clock.  This assumption doesn't hold
> on platforms like QCM2290, where xo_board is 38.4MHz while bi_tcxo is
> 19.2MHz.
>=20
> To get this work, XO buffered clocks need the following updates.
>=20
> - Assign a correct rate rather than the fake one which is being used to
>   generate binary value for clk_smd_rpm_req interface.
>=20
> - Explicitly handle the clk_smd_rpm_req interface value for XO buffered
>   clocks (.rpm_res_type being QCOM_SMD_RPM_CLK_BUF_A).
>=20
> Suggested-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> Signed-off-by: Shawn Guo <shawn.guo@linaro.org>
> ---

Applied to clk-next
