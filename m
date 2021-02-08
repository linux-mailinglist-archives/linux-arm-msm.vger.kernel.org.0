Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 30D65313D59
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Feb 2021 19:24:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229690AbhBHSX6 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 8 Feb 2021 13:23:58 -0500
Received: from mail.kernel.org ([198.145.29.99]:53900 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235471AbhBHSWN (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 8 Feb 2021 13:22:13 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id E269364E6D;
        Mon,  8 Feb 2021 18:21:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1612808493;
        bh=PaUwwuACkeA24EBxDaL2CPwsLKk5yKAW5STs7E8F33I=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=ihNzkE9h2oe6SjAN6IE7Bnh0tWUT48VWDEcuCSe+y42kUBew8nBdLBOa3put/D2lM
         m+hyb/d1quhecV9/kM2FUxSLaIgSy1NOEqPLtWX/WlKS5fvIczUm8p7tw6fD5boKJu
         Etly5uR4allcOJumP8jroyLieQr6WMOKcSoQj/sYtXHxqaz3UUMn85n/5kWJkBlMcV
         t6mmIInvraZBMtY4y7Ma13MDvuDpK8j5zhfgIJ1tEQwwju27V5OtzFsSWhxmE+7dhO
         YhMlDVPlyjfNotPjXAtQ+ydW3e6oMS0+zSqpoHo8TnIAoP4fZYwHvq6xcKgggZa/Rp
         5EKiPOrKZRgeg==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20210114221059.483390-9-angelogioacchino.delregno@somainline.org>
References: <20210114221059.483390-1-angelogioacchino.delregno@somainline.org> <20210114221059.483390-9-angelogioacchino.delregno@somainline.org>
Subject: Re: [PATCH v2 08/11] clk: qcom: mmcc-msm8998: Add hardware clockgating registers to some clks
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     konrad.dybcio@somainline.org, marijn.suijten@somainline.org,
        martin.botka@somainline.org, phone-devel@vger.kernel.org,
        linux-kernel@vger.kernel.org, agross@kernel.org,
        bjorn.andersson@linaro.org, mturquette@baylibre.com,
        robh+dt@kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>
To:     AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>,
        linux-arm-msm@vger.kernel.org
Date:   Mon, 08 Feb 2021 10:21:31 -0800
Message-ID: <161280849168.76967.8269855685273520624@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting AngeloGioacchino Del Regno (2021-01-14 14:10:56)
> Hardware clock gating is supported on some of the clocks declared in
> there: ignoring that it does exist may lead to unstabilities on some
> firmwares.
> Add the HWCG registers where applicable to stop potential crashes.
>=20
> This was verified on a smartphone shipped with a recent MSM8998
> firmware, which will experience random crashes without this change.
>=20
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@soma=
inline.org>
> ---

Applied to clk-next
