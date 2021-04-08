Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 217113578D6
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 Apr 2021 02:16:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229687AbhDHAQU (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 7 Apr 2021 20:16:20 -0400
Received: from mail.kernel.org ([198.145.29.99]:42332 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229484AbhDHAQT (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 7 Apr 2021 20:16:19 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 50DF161178;
        Thu,  8 Apr 2021 00:16:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1617840969;
        bh=WkWojShefQJsv3oaRMrNFc29H+bunI03F4WFzBAd0EI=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=X+TtWiZpLctLweXBi/ikHwVQZrLPJQTfcAf+I3uqmhF5iOdhsoMKeyywjrpvqO1k5
         12TPyS1OQCHlZg7YaNiuJ0T5Ayc1AXFADdNAezKQMfGs9Pq6VYauaZJfeHlF2qTKJ2
         eH3pFespMb+CAqJA+EEg8MagmWxAXtbARN+ysiLn2v0uzi+ccv8CMsd0sEjjiKAQIt
         CBV/iMtf+4nAIso3WdV9D/TRm9wwP8y3O+T1Wl1WqOaB3wePbBv8+bH/ja7kVEMagE
         3U0PGKalShlQWOK8KrQLBq75k9c7JfjWol40SrFcjniNnOV0djFxC6vSXS+gRTaPkV
         m5AexkvXw/uQQ==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20210405224743.590029-16-dmitry.baryshkov@linaro.org>
References: <20210405224743.590029-1-dmitry.baryshkov@linaro.org> <20210405224743.590029-16-dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH v4 15/33] clk: qcom: dispcc-sdm845: get rid of the test clock
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        Stephen Boyd <swboyd@chromium.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>
Date:   Wed, 07 Apr 2021 17:16:08 -0700
Message-ID: <161784096813.3790633.9577234061449289054@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Dmitry Baryshkov (2021-04-05 15:47:25)
> The test clock isn't in the bindings and apparently it's not used by
> anyone upstream.  Remove it.
>=20
> Suggested-by: Stephen Boyd <swboyd@chromium.org>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

Applied to clk-next
