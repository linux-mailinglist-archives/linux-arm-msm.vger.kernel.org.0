Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 15B0446E3CC
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Dec 2021 09:09:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234380AbhLIINR (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 9 Dec 2021 03:13:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57666 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232443AbhLIINR (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 9 Dec 2021 03:13:17 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6D1F8C061746;
        Thu,  9 Dec 2021 00:09:44 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 39969B81FBA;
        Thu,  9 Dec 2021 08:09:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EB5F3C004DD;
        Thu,  9 Dec 2021 08:09:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1639037382;
        bh=dyoPmuVQv/pivE7rFYGqGvekvnh2r7YZytEdGdKGQ6s=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=aNvBXSxfs6twLddxiC4tiUdbN+K0eWarEhfzW003HJy1zR3WgJyNcU8hLGYpUM3nf
         8dxLefPoiLzcl0ZOIeWOOdfZXR/D7x+fFmiYpUHTV9Cu4A+nEYQ7Q+nJuF/I8HfIIq
         1h2xh6xvDjnhxtPSDo33Ch1k7sRxN3SQiVEed7ZZmOa5y/OEjEkQd+WtqE+YfXpnBF
         8M5Jfz+7EHl8pNCYZPaQDm1mUe6neT+0Ohij0a6vLvCJRu+AqjsQ+zzDJAZViHt55x
         9QmFie0jg0jb0JDYqAxLBdwvJXBi244NicrurmqUdzome2RSmeZL4/f4WPeVdJFruT
         B8Md55xYfKI8g==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20211208175430.1333594-5-dmitry.baryshkov@linaro.org>
References: <20211208175430.1333594-1-dmitry.baryshkov@linaro.org> <20211208175430.1333594-5-dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH 04/11] clk: qcom: camcc-sdm845: get rid of the test clock
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        Stephen Boyd <swboyd@chromium.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Taniya Das <tdas@codeaurora.org>
Date:   Thu, 09 Dec 2021 00:09:40 -0800
User-Agent: alot/0.9.1
Message-Id: <20211209080941.EB5F3C004DD@smtp.kernel.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Dmitry Baryshkov (2021-12-08 09:54:23)
> The test clock isn't in the bindings and apparently it's not used by
> anyone upstream.  Remove it.
>=20
> Suggested-by: Stephen Boyd <swboyd@chromium.org>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

Reviewed-by: Stephen Boyd <sboyd@kernel.org>
