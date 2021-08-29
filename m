Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 783EC3FA894
	for <lists+linux-arm-msm@lfdr.de>; Sun, 29 Aug 2021 06:05:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231684AbhH2EFx (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 29 Aug 2021 00:05:53 -0400
Received: from mail.kernel.org ([198.145.29.99]:36146 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231563AbhH2EFw (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 29 Aug 2021 00:05:52 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id D7B1F60E94;
        Sun, 29 Aug 2021 04:05:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1630209901;
        bh=MAYiamhDm9DOIAo9uTeHK/0zbXL47HaBOiTnzbDazTk=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=Ryv+D2XvILiHSKKH0GCulQaaQtSy6NGmMW7awjwHSN0BCGlPuaS7j8L/rVHrNHzIl
         MAT2aOY8gZaOKluDxQGupUsV35cVjq023cpiMH8xn0gwauj2WfgEr7sFwGRHZ8f8L+
         ESMPtnKpBUrgGd49YpLOrKoYWt8o8QhpN0pXGrzxmHA8HMjiJbVMXOetYVOyRGS89G
         xC1M5iu8Xfqp6KxBUfrnJEAGlNczdv9dlJw8Vb7aba6Arb64mJ4AFz0QYZrnilH7j0
         io8HpfpC4UBc80MMUZEfpmqSr6AN9RoiDP0+f9B5jWQTfWNQAq5FgfYcFa5Cqi+lMe
         CwlHTyl9yqW8Q==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20210820203624.232268-3-konrad.dybcio@somainline.org>
References: <20210820203624.232268-1-konrad.dybcio@somainline.org> <20210820203624.232268-3-konrad.dybcio@somainline.org>
Subject: Re: [PATCH 2/2] clk: qcom: Add SM6350 GCC driver
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     martin.botka@somainline.org,
        angelogioacchino.delregno@somainline.org,
        marijn.suijten@somainline.org, jamipkettunen@somainline.org,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org
To:     Konrad Dybcio <konrad.dybcio@somainline.org>,
        ~postmarketos/upstreaming@lists.sr.ht
Date:   Sat, 28 Aug 2021 21:04:59 -0700
Message-ID: <163020989969.2676726.14949286261692907756@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Konrad Dybcio (2021-08-20 13:36:24)
> This adds Global Clock controller (GCC) driver for SM6350 SoC
>=20
> Acked-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@somainlin=
e.org>
> Signed-off-by: Konrad Dybcio <konrad.dybcio@somainline.org>
> ---

Applied to clk-next
