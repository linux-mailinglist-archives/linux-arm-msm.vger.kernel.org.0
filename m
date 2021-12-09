Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CC97C46E3CA
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Dec 2021 09:09:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234381AbhLIINB (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 9 Dec 2021 03:13:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57586 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234380AbhLIINA (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 9 Dec 2021 03:13:00 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8E36CC0617A1;
        Thu,  9 Dec 2021 00:09:27 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 5792FB81671;
        Thu,  9 Dec 2021 08:09:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 124E8C004DD;
        Thu,  9 Dec 2021 08:09:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1639037365;
        bh=sn2ycKQ2FVwkXka7uaHJnCGdGr7FJdMfzWnvSqiB6U4=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=ttaHLGA1R/Q4zn2/3KtQZDODevqOD43Bb07b8PxVqesyCrKnstHvqsyYoNQRcjlvu
         mu0J97ITlKvBDMrw+hHbID9O5mEf6eHd5jtEWOa4b/5Xvih6wyBs4Lxrdh3qswirSw
         70Meedu5t6KDcI0GZQRPGjLgR2CmrtCB6mBX8d8D7z1sTfXTQX3WmpT/NZ1E+MYhuj
         bo9LXLkRvsz0bxznW/plHCeCApRdDwzhj7LNPfPq4n1eNhpGGadE44pyiGnxPjQXPg
         sN80FRSJxKAyEQ8sIvYTpdpX+H9t3UKVvppYmSCpatBC8MLL663ZyJEtfuitCqwYsp
         uCjnTIl6UkxPA==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20211208175430.1333594-4-dmitry.baryshkov@linaro.org>
References: <20211208175430.1333594-1-dmitry.baryshkov@linaro.org> <20211208175430.1333594-4-dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH 03/11] clk: qcom: camcc-sc7180: get rid of the test clock
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        Stephen Boyd <swboyd@chromium.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Taniya Das <tdas@codeaurora.org>
Date:   Thu, 09 Dec 2021 00:09:23 -0800
User-Agent: alot/0.9.1
Message-Id: <20211209080925.124E8C004DD@smtp.kernel.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Dmitry Baryshkov (2021-12-08 09:54:22)
> The test clock isn't in the bindings and apparently it's not used by
> anyone upstream.  Remove it.
>=20
> Suggested-by: Stephen Boyd <swboyd@chromium.org>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

Reviewed-by: Stephen Boyd <sboyd@kernel.org>
