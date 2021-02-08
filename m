Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CD2D0313D01
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Feb 2021 19:17:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235329AbhBHSQ3 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 8 Feb 2021 13:16:29 -0500
Received: from mail.kernel.org ([198.145.29.99]:51962 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235339AbhBHSOU (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 8 Feb 2021 13:14:20 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 9A71864E8F;
        Mon,  8 Feb 2021 18:13:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1612808019;
        bh=C7GjMYNLJMljN7lmawlVsauPPVFd0wi72EnHN9oORM0=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=KlOYLiOUeSG/RxCJqJ3BM+A6iXijrMLaryRNcMD8W9rLuFEPMsO57BggrRNsNHqlb
         fDh42y+8roIGqr7wCcVsF1+BVLvzZoGwXM0qlnmOp1FA/yo40YTZenyGgOlUjTdfQV
         6d0TeeogvTPeiTrLg4hMPNGT+gFgOrleMUCDDIUW86QSj+ERqe1y3oUOueJQcwaf4L
         qzRDDRvigwfkI1EXavNDjEuhzht06ISVjJQfREhNzyPwYO8In+OuKE4VA9ct6cx71k
         3B1oCIAeaHaSarhdpEOke+BHLohmrDXBkomeeBuFWdSubpAOFkBhhpJD/GP3rW1al9
         rLboGE5o7QiXA==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20210204150120.1521959-5-bryan.odonoghue@linaro.org>
References: <20210204150120.1521959-1-bryan.odonoghue@linaro.org> <20210204150120.1521959-5-bryan.odonoghue@linaro.org>
Subject: Re: [PATCH v2 4/4] clk: qcom: videocc: Add gdsc mmcx-reg supply hook
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     bryan.odonoghue@linaro.org, jonathan@marek.ca,
        dikshita@codeaurora.org, dmitry.baryshkov@linaro.org,
        stanimir.varbanov@linaro.org
To:     Bryan O'Donoghue <bryan.odonoghue@linaro.org>, agross@kernel.org,
        bjorn.andersson@linaro.org, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, mturquette@baylibre.com,
        robh+dt@kernel.org
Date:   Mon, 08 Feb 2021 10:13:38 -0800
Message-ID: <161280801828.76967.3162321241032485646@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Bryan O'Donoghue (2021-02-04 07:01:20)
> This commit adds a regulator supply hook to mmcx-reg missing from
>=20
> - mvs0c_gdsc
> - mvs1c_gdsc
> - mvs0_gdsc
> - mvs1_gdsc
>=20
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Tested-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

Applied to clk-next
