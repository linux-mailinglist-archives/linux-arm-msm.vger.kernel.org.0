Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 417762D4FAB
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Dec 2020 01:43:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729003AbgLJAfT (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 9 Dec 2020 19:35:19 -0500
Received: from mail.kernel.org ([198.145.29.99]:56098 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728963AbgLJAfQ (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 9 Dec 2020 19:35:16 -0500
Content-Type: text/plain; charset="utf-8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1607560466;
        bh=dGu8x7s/80OJUUCRF1FFqmK37Libi85qRHutPmZx3qA=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=CliVdxcHMRmOdigIpVGjYV/FRrBKyYGGfIZwP5bS3nnlDcvqs1iQ3pNlBufTxTOIK
         YURYbZb9AA1IcTYrxgFnU0vPdosDipI0V631O+kS/bm08KvERv3Km4W6omzya/Ofo+
         GI0lKXPpEmxw8+j7m9BGio71SnWSOCIXEJ0/d8uuiLRJys+fJssT1DCKcHcKoxNXuw
         UC4Wh7zzqjRCGh3AzEQakm1RddjbaVAIz0aanx0JN5WwhmK1nO+EaG3NK1ivw8AQ9d
         d95VcC5Vr2VLcxZAr1kyzg5Xs9Y4PAcAOyjlWVrh6ld2KvDmAjY0CYF7NRAe3Q0d1o
         6GleiPyuT+EpQ==
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20201126072844.35370-7-manivannan.sadhasivam@linaro.org>
References: <20201126072844.35370-1-manivannan.sadhasivam@linaro.org> <20201126072844.35370-7-manivannan.sadhasivam@linaro.org>
Subject: Re: [RESEND PATCH v4 6/6] clk: qcom: Add GDSC support for SDX55 GCC
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     bjorn.andersson@linaro.org, vkoul@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        mturquette@baylibre.com, robh+dt@kernel.org
Date:   Wed, 09 Dec 2020 16:34:25 -0800
Message-ID: <160756046559.1580929.6449738302849701410@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Manivannan Sadhasivam (2020-11-25 23:28:44)
> Add GDSC support to control the power supply of power domains in SDX55
> GCC.
>=20
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> ---

Applied to clk-next
