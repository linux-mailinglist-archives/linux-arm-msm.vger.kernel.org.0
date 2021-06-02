Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B7F7A39816B
	for <lists+linux-arm-msm@lfdr.de>; Wed,  2 Jun 2021 08:50:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229976AbhFBGwE (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 2 Jun 2021 02:52:04 -0400
Received: from mail.kernel.org ([198.145.29.99]:38034 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229753AbhFBGwE (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 2 Jun 2021 02:52:04 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 8350361090;
        Wed,  2 Jun 2021 06:50:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1622616621;
        bh=zLYlC44JwKKSpRlcCYDmPAMa/Zf94xrsm6JGjdW7c5U=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=QON80Ix//rxQJ95d36yEHlASvU3nMORXMjA6g4S6qdzCl196mK9BE4l8idCPt6Dte
         pSHMHTsyY0FpxmpajkZh3PCrueOYXhXYacCFe7lcvfdEiAL74TDirT3o2eITx2t2v1
         p60Un9+/65lLfOtRPRfENcfkiaRVnirgaFJWjCU4Dgdk2jURVh2meRQuClHibfVcvX
         NO2GNDmLLoGvaBROm8UtLRLRYQnvrcSt46hr00vfniTaqml4L+jMnWP3PByWjQa4OD
         6Snlp5Kv416DUS+yx1omotwNb0UZKuLISW8XpRgRhqJ93mt6I3fmeRpV46FWXogmHS
         NAsBdpszjVJAQ==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20210313020310.386152-1-konrad.dybcio@somainline.org>
References: <20210313020310.386152-1-konrad.dybcio@somainline.org>
Subject: Re: [PATCH 1/2] dt-bindings: clock: Add MDM9607 GCC clock bindings
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     ~postmarketos/upstreaming@lists.sr.ht, martin.botka@somainline.org,
        angelogioacchino.delregno@somainline.org,
        marijn.suijten@somainline.org,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Taniya Das <tdas@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
To:     Konrad Dybcio <konrad.dybcio@somainline.org>,
        phone-devel@vger.kernel.org
Date:   Tue, 01 Jun 2021 23:50:20 -0700
Message-ID: <162261662040.4130789.3654997759500822604@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Konrad Dybcio (2021-03-12 18:03:07)
> Add device tree bindings for global clock controller on MDM9607 SoC.
>=20
> Signed-off-by: Konrad Dybcio <konrad.dybcio@somainline.org>
> ---

Applied to clk-next
