Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 83D313578C8
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 Apr 2021 02:15:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229497AbhDHAPg (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 7 Apr 2021 20:15:36 -0400
Received: from mail.kernel.org ([198.145.29.99]:42060 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229484AbhDHAPg (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 7 Apr 2021 20:15:36 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id C718D61028;
        Thu,  8 Apr 2021 00:15:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1617840925;
        bh=j8H31g8zV93rjMxRIENLY1akWVsKkC+kc2Kul0WzPIg=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=TwJWgNMCQjEw0G/Z2R5YcHQeyEQcHa/b+hVKmleBF81LsxheeywuqTN3luRCyUVWj
         0B+RP/LvdXgjSCVP7Zm4O63tsfBEABFdEQRUlsLVGATkpmIK6f5oKDlVGPGbmwNFcY
         OEPMIBV3zKa72UuzlxK+QFipJgo9fDEhGS/hM0obwo0zNFPJ9yY+V8bOqOad170OsA
         2DsF3KMWP6N/RzuZTvdBCvFgSL21OAZ4d1I/7f7Oikc3E2LP7C3ehlzENKgBZTPrMb
         ivEZHNSoC7cOCH28J7/fB78rTTbcPKBxWFwOgqH3JxpHJOV4WRJoh0Pm2f0OKTyrDK
         +4oYb+Lz2e0Rw==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20210405224743.590029-9-dmitry.baryshkov@linaro.org>
References: <20210405224743.590029-1-dmitry.baryshkov@linaro.org> <20210405224743.590029-9-dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH v4 08/33] clk: qcom: videocc-sc7180: drop unused enum entries
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        Taniya Das <tdas@codeaurora.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>
Date:   Wed, 07 Apr 2021 17:15:24 -0700
Message-ID: <161784092462.3790633.845943264081486253@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Dmitry Baryshkov (2021-04-05 15:47:18)
> Drop unused enum entries from the list of parent enums.
>=20
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Reviewed-by: Taniya Das <tdas@codeaurora.org>
> ---

Applied to clk-next
