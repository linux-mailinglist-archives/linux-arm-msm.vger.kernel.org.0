Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D79C746E3BE
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Dec 2021 09:08:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234323AbhLIIMO (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 9 Dec 2021 03:12:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57408 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229941AbhLIIMN (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 9 Dec 2021 03:12:13 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8155BC061746;
        Thu,  9 Dec 2021 00:08:40 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 45DC2B823BA;
        Thu,  9 Dec 2021 08:08:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DD423C004DD;
        Thu,  9 Dec 2021 08:08:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1639037318;
        bh=YQw61mKrYvu1B2ydHzCKi6VJb47kAtAO9NHFPexToNI=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=a8To7U7vZUOQRWnbeufzIb80rhw6iaeGdVdA/XWkOViM2I/jdz0C5PCRjAWBeQOmI
         iEBG5OfGEF+aty/AJgYSklTEWwYUx2iJYfTTwc7DNznY1ZP8pLMEF9ChJL1qYNCSb2
         q2kUw4bygxfFWHtwvwzMTp1B+64Ccx9aadftcD7ESCqo6sHm7SoV4KW0EyeMvFDTLh
         sZ8VE8OvPPPDFfIY8miQekGO9stzFubqrKTmLS0MKQFevUgftN2rGEW6BgKCga/SCi
         FO5lv3N3gTojzgjqOyiuImHZUplOW2SwlRn4hMY3J53sf2TGWUGaEUKBPD46eWfCBN
         GreIWm1E4evtQ==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20211208175430.1333594-2-dmitry.baryshkov@linaro.org>
References: <20211208175430.1333594-1-dmitry.baryshkov@linaro.org> <20211208175430.1333594-2-dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH 01/11] clk: qcom: gpucc-sdm660: get rid of the test clock
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Taniya Das <tdas@codeaurora.org>
Date:   Thu, 09 Dec 2021 00:08:36 -0800
User-Agent: alot/0.9.1
Message-Id: <20211209080837.DD423C004DD@smtp.kernel.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Dmitry Baryshkov (2021-12-08 09:54:20)
> The test clock isn't in the bindings and apparently it's not used by
> anyone upstream.  Remove it.
>=20
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

Reviewed-by: Stephen Boyd <sboyd@kernel.org>
