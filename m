Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EE5B142CD6D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Oct 2021 00:10:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231171AbhJMWLs (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 13 Oct 2021 18:11:48 -0400
Received: from mail.kernel.org ([198.145.29.99]:41784 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231177AbhJMWLr (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 13 Oct 2021 18:11:47 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 6B26E610CF;
        Wed, 13 Oct 2021 22:09:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1634162983;
        bh=jVibAd5k8EZgrGtx2NS7ynxRfMtbS6b4hovVI5iKc2M=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=etjl9jfnoVfiqMLsYv16OgwjomaAcQNsbSWwvkKrSB0jPU7uE98rQzzma4D3Fmggx
         JhYdJzMO2nKG/A59sBd4w8eJObV6BN+xfk/dLI151DTUT3y8qqh0WZb7eYi/lRHUCy
         G6w1qQ8/lATszAPC2seYTp7oy20KEpU09cymGDmAx+tx6om8xpewUY6cPwGKQwO/jJ
         G3KmYBWJ0V5Ejkax3PXE7tbiHOTaA6u+Jg+ut+oVjiDiDBpHn0D1RpMKjrGEgmWO+q
         aMmfmMfF39VEpEuGfo5KCriDBYNiNktfMugfaYi0Xywc/0BcIIHVxdSQmZPaJK9T5R
         gqxbdII77NrxA==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20210923162645.23257-3-konrad.dybcio@somainline.org>
References: <20210923162645.23257-1-konrad.dybcio@somainline.org> <20210923162645.23257-3-konrad.dybcio@somainline.org>
Subject: Re: [PATCH v4 3/9] clk: qcom: gcc-msm8994: Fix up SPI QUP clocks
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
Date:   Wed, 13 Oct 2021 15:09:42 -0700
Message-ID: <163416298231.936110.18234896035575608640@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Konrad Dybcio (2021-09-23 09:26:36)
> Fix up SPI QUP freq tables to account for the fact
> that not every QUP can run at the same set of frequencies.
>=20
> Signed-off-by: Konrad Dybcio <konrad.dybcio@somainline.org>
> ---

Applied to clk-next
