Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 746D43E2137
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Aug 2021 03:50:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241265AbhHFBu0 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 5 Aug 2021 21:50:26 -0400
Received: from mail.kernel.org ([198.145.29.99]:35370 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230437AbhHFBuZ (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 5 Aug 2021 21:50:25 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id BAA0A60EB9;
        Fri,  6 Aug 2021 01:50:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1628214610;
        bh=4yY2f3P6xCyFtufN8S21ZwHcak1iKypQJ0UMXKwRhiA=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=IjqQx1ICQF9kEdmFfW4OevvP7WW8WGfZTkZGuBbwXPLBZuAbIOiFrKnqgOQbFbANZ
         4XofeuTTzwMjHfjFGT9LLlVk/Sqa3seW2Rg7qP5Ic2jy/jJXbBLoMvACbAmLsqeMfy
         o3Yzyzg/mlDvHJ4oklGXgbryvktgu3/P3qKihgzOm37PE52dp+rfz3L4GJpzCyCDiN
         TeaE9buNLWKwmdhyiGfsrYKaVE2+6iVhmqL0+DLSOCQBdiDxtFtkV//C5DMX5sjJXZ
         BZ1/rIs6IzaS7gZorRibU49rIMuu3G8VE7QkGbU/prnnKG8Dyh2G0pvfBo9JRREBdB
         MOPAtRuydNabg==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20210805222400.39027-2-konrad.dybcio@somainline.org>
References: <20210805222400.39027-1-konrad.dybcio@somainline.org> <20210805222400.39027-2-konrad.dybcio@somainline.org>
Subject: Re: [PATCH 2/2] clk: qcom: smd-rpm: Add mdm9607 clocks
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     martin.botka@somainline.org,
        angelogioacchino.delregno@somainline.org,
        marijn.suijten@somainline.org, jamipkettunen@somainline.org,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
To:     Konrad Dybcio <konrad.dybcio@somainline.org>,
        ~postmarketos/upstreaming@lists.sr.ht
Date:   Thu, 05 Aug 2021 18:50:09 -0700
Message-ID: <162821460959.19113.12052330278621244298@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Konrad Dybcio (2021-08-05 15:24:00)
> Add support for RPM-managed clocks on the MDM9607 platform.
>=20
> Signed-off-by: Konrad Dybcio <konrad.dybcio@somainline.org>
> ---

Applied to clk-next
