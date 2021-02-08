Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 88BB8313CF8
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Feb 2021 19:17:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235320AbhBHSQS (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 8 Feb 2021 13:16:18 -0500
Received: from mail.kernel.org ([198.145.29.99]:51874 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234035AbhBHSOI (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 8 Feb 2021 13:14:08 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 1788964E84;
        Mon,  8 Feb 2021 18:13:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1612808008;
        bh=IXhVb0x3DYW7w6PuPU/S9oCEIIp+MPQEfas69ZvZau8=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=bkDt6OwW93EQUg+HqxUIIl3TK1t4k2cPrA7AeG3a5w/xjpQlqwHG6hGUbmdjiWnYz
         mYvCMhZgtggKHDx+bBlzBV7FY47ff/eITdvX2uvMDdYfc4xzgCXzDT+Pfm2iA5ixGH
         sFlGYO9C/j8XTlIL5ozjKBq5R/ATqMLT3ET84mY9SUkz/Y39zNJ03z50CNrG/vthyX
         Ov3Ltk+q0+pU4+VLOAz+JHA0b/dH6J29ywq2fPDFT67bD6J61DcPLpL3vvNTyZd05r
         +x63neE0o3a0mJ2AKFdtHDtGJ+KrlvJQaXcOOZ8lKf+LSzf/QB0mUJDJMymjbIjYIL
         cFwdbrskUSrPg==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20210204150120.1521959-3-bryan.odonoghue@linaro.org>
References: <20210204150120.1521959-1-bryan.odonoghue@linaro.org> <20210204150120.1521959-3-bryan.odonoghue@linaro.org>
Subject: Re: [PATCH v2 2/4] clk: qcom: videocc: Add sm8250 VIDEO_CC_MVS0_DIV_CLK_SRC
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     bryan.odonoghue@linaro.org, jonathan@marek.ca,
        dikshita@codeaurora.org, dmitry.baryshkov@linaro.org,
        stanimir.varbanov@linaro.org
To:     Bryan O'Donoghue <bryan.odonoghue@linaro.org>, agross@kernel.org,
        bjorn.andersson@linaro.org, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, mturquette@baylibre.com,
        robh+dt@kernel.org
Date:   Mon, 08 Feb 2021 10:13:26 -0800
Message-ID: <161280800676.76967.2948364145444486689@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Bryan O'Donoghue (2021-02-04 07:01:18)
> This patch adds the missing video_cc_mvs0_div_clk_src entry to
> videocc-sm8250 replicating in upstream the explicit entry for this clock =
in
> downstream.
>=20
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Tested-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

Applied to clk-next
