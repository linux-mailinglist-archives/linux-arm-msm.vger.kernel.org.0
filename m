Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4CE53319437
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Feb 2021 21:21:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231497AbhBKUTt (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 11 Feb 2021 15:19:49 -0500
Received: from mail.kernel.org ([198.145.29.99]:45462 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230382AbhBKUTU (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 11 Feb 2021 15:19:20 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 63CEC64DEA;
        Thu, 11 Feb 2021 20:18:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1613074720;
        bh=dBdBd74td7Pi4h4WMiQX1zHS6/dDe+9OwhZJthEgIlM=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=JTjvVZgD6ChIT1lqZ2pVRTBkdu8VdL6hrw6ImOG979wBjKgwrLEHKqAL0xjPqv/lm
         CzlG8N3R7zS/CNhxPx3wFimTA6fVvGwFdZC4enlihDtWv33voxdqeJCWnpIZraV2Bw
         nfh6kRfg18o1FzD7hKoxG31A4EqT3asT2Kl+pS0EZ1d7iEapxaJmgZhhUdNgD0i/bH
         H3Kfy/e30z0cRxzuOSKg78NYt/AAddraggqvK14EHw14kFcKzK6+7nWbAQQ62E22hk
         nwd3WEn+PmM21YV67qGxIRyLN3eRkwRGG5sGJt00H7oVgcK5Dlg716bmLkLnqV95Hw
         sXu9V+anCQI6Q==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20210113183817.447866-2-angelogioacchino.delregno@somainline.org>
References: <20210113183817.447866-1-angelogioacchino.delregno@somainline.org> <20210113183817.447866-2-angelogioacchino.delregno@somainline.org>
Subject: Re: [PATCH v2 1/9] clk: qcom: gcc-sdm660: Mark MMSS NoC CFG AHB clock as critical
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     bjorn.andersson@linaro.org, mturquette@baylibre.com,
        robh+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org,
        konrad.dybcio@somainline.org, marijn.suijten@somainline.org,
        martin.botka@somainline.org,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>
To:     AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>, agross@kernel.org
Date:   Thu, 11 Feb 2021 12:18:39 -0800
Message-ID: <161307471912.1254594.16323754724259359108@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting AngeloGioacchino Del Regno (2021-01-13 10:38:09)
> Similarly to MSM8998, any access to the MMSS depends on this clock.
> Gating it will crash the system when RPMCC inits mmssnoc_axi_rpm_clk.
>=20
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@soma=
inline.org>
> ---

Applied to clk-next
