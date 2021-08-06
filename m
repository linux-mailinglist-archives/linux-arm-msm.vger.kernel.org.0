Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9449A3E211A
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Aug 2021 03:42:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240872AbhHFBme (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 5 Aug 2021 21:42:34 -0400
Received: from mail.kernel.org ([198.145.29.99]:34058 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S240808AbhHFBme (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 5 Aug 2021 21:42:34 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 17B3A61184;
        Fri,  6 Aug 2021 01:42:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1628214139;
        bh=nRGyPrE0zfRUK8FHMZWtP0wDpba/i79gItLekjwSF08=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=W8NKl1RWcI3h4QwD3yIkeWpLjv1abj/TZcm9H2BqzHkOHUsnp9LizY5Ts2B84fggE
         hCWHZ1cblFcSVSA/9joj6OO0M6tLwlG9a492WerRjRgM5ygGLV+s+9JS+kDrZ8JzB2
         6ZQRvr1vITlu3EeUIP8CZBDrmfE4f9SKkRq9iD4OKbjYatIQC/2OTN1tgAywg2Uvt+
         wxrJRnqGTkhy4UzlLXFQZnw9gGLSDwMWiheULH4TRA9jgFY2gz/z+C2LJhH6rQ5njY
         5gjlTg0YZnNR7cPAsrvCTCOu7foqxqrcEpl3xtfgYtfIosgW/Puce5JvTT/MTOioMP
         MPZPM8vczTPrg==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20210731164827.2756798-2-iskren.chernev@gmail.com>
References: <20210731164827.2756798-1-iskren.chernev@gmail.com> <20210731164827.2756798-2-iskren.chernev@gmail.com>
Subject: Re: [PATCH v3 1/2] clk: qcom: smd: Add support for SM6115 rpm clocks
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Andy Gross <agross@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht,
        Iskren Chernev <iskren.chernev@gmail.com>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Iskren Chernev <iskren.chernev@gmail.com>
Date:   Thu, 05 Aug 2021 18:42:17 -0700
Message-ID: <162821413782.19113.1911724221661020342@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Iskren Chernev (2021-07-31 09:48:26)
> Add rpm smd clocks, PMIC and bus clocks which are required on
> SM4250/6115 for clients to vote on.
>=20
> Signed-off-by: Iskren Chernev <iskren.chernev@gmail.com>
> ---

Applied to clk-next with lots of effort
