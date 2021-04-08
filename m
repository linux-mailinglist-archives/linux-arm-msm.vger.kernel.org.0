Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5C0223578D4
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 Apr 2021 02:16:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229795AbhDHAQO (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 7 Apr 2021 20:16:14 -0400
Received: from mail.kernel.org ([198.145.29.99]:42300 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229484AbhDHAQN (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 7 Apr 2021 20:16:13 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 1E9FA611EE;
        Thu,  8 Apr 2021 00:16:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1617840963;
        bh=zYtJ2+nKxcbBRDpesgmKV84628wtmLXGi3Lt1v5ACkk=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=qnRYgy0voXdIIBptZ3wh3k0FhymhkzNYYLlY5+2fxY6/fGAsh4Yvr9oD5Bmg28YHl
         jv/WEcLVyOhhrJzftrEqV6EefZDti5WjhkflA+jz2gDhebOFAJFFaI8Ahj5nv31FlV
         JTBawu+x7dIpsWb/j/kYA4aagxd5ck2YxFyY3W6gMqHkR7Hm6BJEL6MHKEYYzDCQJT
         XpuHf7Js4BstadDFYUHU2ZHRrRx8svIZnIvVfJpFc6AOCFeWpO2QORGzevkGYElrSM
         naRQFPZv6Rmo0Gj/cDKI8TG4UtdsZMdP9/1PdsUBU8Ou9i7XLmUXUAyQOEN0le2qPQ
         4zCI3x3Oxi/Qg==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20210405224743.590029-15-dmitry.baryshkov@linaro.org>
References: <20210405224743.590029-1-dmitry.baryshkov@linaro.org> <20210405224743.590029-15-dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH v4 14/33] clk: qcom: gpucc-sdm845: get rid of the test clock
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        Stephen Boyd <swboyd@chromium.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>
Date:   Wed, 07 Apr 2021 17:16:01 -0700
Message-ID: <161784096184.3790633.10445687939759362899@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Dmitry Baryshkov (2021-04-05 15:47:24)
> The test clock isn't in the bindings and apparently it's not used by
> anyone upstream.  Remove it.
>=20
> Suggested-by: Stephen Boyd <swboyd@chromium.org>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

Applied to clk-next
