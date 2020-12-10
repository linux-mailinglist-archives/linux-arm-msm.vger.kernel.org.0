Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 183D52D4FDC
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Dec 2020 01:50:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728627AbgLJAev (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 9 Dec 2020 19:34:51 -0500
Received: from mail.kernel.org ([198.145.29.99]:55944 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728594AbgLJAer (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 9 Dec 2020 19:34:47 -0500
Content-Type: text/plain; charset="utf-8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1607560447;
        bh=4TARjwYhNFnj6QciTDFtrWixOmzOTsMerXGUK8iWkHc=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=Y/sIVVDON2sj95CQ5oQrnw4MOWOzakswyv0CEISDZP9zS8rVO8HHTFi8NVIEl69FY
         JVkVsUisbkBGdPCAbuQVvQL2EY8wIl+yjsiqpnPkmcskPZKKLUMACyvf4iBOwtPwI4
         Sy72i2ijjJwgmD2SpHuuVMR67d1LonXLkpeuZ88K5P1Oui65lJobtCc1HhoZgzqklc
         Oge81jifwMwtHx2lg+rmRPUwb3whgEIwSK0bvUqDQ6WJAZInhsXqFNaWEJzF5k6uqx
         NOFt9a+XZCfRou7TLDWxeswsjQFTK2dTkURGtXd+yf6wqHO+tLh9ggsdNWfq2sbmQp
         +nTvq9R4tmZpA==
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20201126072844.35370-4-manivannan.sadhasivam@linaro.org>
References: <20201126072844.35370-1-manivannan.sadhasivam@linaro.org> <20201126072844.35370-4-manivannan.sadhasivam@linaro.org>
Subject: Re: [RESEND PATCH v4 3/6] dt-bindings: clock: Introduce RPMHCC bindings for SDX55
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     bjorn.andersson@linaro.org, vkoul@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Rob Herring <robh@kernel.org>
To:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        mturquette@baylibre.com, robh+dt@kernel.org
Date:   Wed, 09 Dec 2020 16:34:05 -0800
Message-ID: <160756044598.1580929.5678948124033294871@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Manivannan Sadhasivam (2020-11-25 23:28:41)
> From: Vinod Koul <vkoul@kernel.org>
>=20
> Add compatible for SDX55 RPMHCC and DT include.
>=20
> Signed-off-by: Vinod Koul <vkoul@kernel.org>
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> Acked-by: Rob Herring <robh@kernel.org>
> ---

Applied to clk-next
