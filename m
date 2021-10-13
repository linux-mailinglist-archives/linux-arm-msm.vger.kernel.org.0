Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8E7EF42CD67
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Oct 2021 00:10:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230142AbhJMWLf (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 13 Oct 2021 18:11:35 -0400
Received: from mail.kernel.org ([198.145.29.99]:41522 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231147AbhJMWLe (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 13 Oct 2021 18:11:34 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id C1FA6610CF;
        Wed, 13 Oct 2021 22:09:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1634162970;
        bh=xIG1F21bS6mX1Pu1DeS0JUv1ggyB9Pr3QpT+P3WvXjM=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=kH12Yec4HbPetogA0tckrCoQVAJzwOwYF6rD/xOBuXZEI7LT2yy1jVVPtX9D9/Aa7
         HfDKNkB8GJ3Tzx78Wd+TbAar+G21QaqaZAF+gDLxezRu4tmoW1aLk/Ecw2OZN97zko
         DsuWsiqYzhfo9ZU+NPzqJNRnGw2fVF4EswGKVbo7VsILebmsNXJzKgfQ+3VwDBicjX
         3K5TOBcPuSzO6X9rgmZacyfwOjC7Sm73bX7FdHe/9TNyVPMhcEqT+7+p6Z0GQ9pXKq
         dCkhefHKgGmse3aU9pgeOzjWCLcJO/L8UmuT1h2XdDkTwApqyKny3ODRheQFeXzpXQ
         2ooUqvyEv6Ewg==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20210923162645.23257-2-konrad.dybcio@somainline.org>
References: <20210923162645.23257-1-konrad.dybcio@somainline.org> <20210923162645.23257-2-konrad.dybcio@somainline.org>
Subject: Re: [PATCH v4 2/9] clk: qcom: gcc-msm8994: Modernize the driver
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     martin.botka@somainline.org,
        angelogioacchino.delregno@somainline.org,
        marijn.suijten@somainline.org, jamipkettunen@somainline.org,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
To:     Konrad Dybcio <konrad.dybcio@somainline.org>,
        ~postmarketos/upstreaming@lists.sr.ht
Date:   Wed, 13 Oct 2021 15:09:29 -0700
Message-ID: <163416296959.936110.11740293057085265488@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Konrad Dybcio (2021-09-23 09:26:35)
> Switch to the newer-style parent_data and remove the hardcoded
> xo clock.
>=20
> Signed-off-by: Konrad Dybcio <konrad.dybcio@somainline.org>
> ---

Applied to clk-next
