Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A81B52D4FD9
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Dec 2020 01:49:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728825AbgLJAe7 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 9 Dec 2020 19:34:59 -0500
Received: from mail.kernel.org ([198.145.29.99]:55984 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728814AbgLJAey (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 9 Dec 2020 19:34:54 -0500
Content-Type: text/plain; charset="utf-8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1607560454;
        bh=K2MpEpA8jcerZIQ8Rt7+kiRAG4CnNu77BAl2iClDU1k=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=ZuIteLp47zvhQbyXFI6QbCvAceDBx/3a6AGEoyes5lYe0EaXnlcy1QlPh3ZOdPCEd
         PvfIFxLf6zId0xoQm+BgJ25X6nLjTujcbpQt42WlI7mlULupaMYQmdEwAaFxEnEh3b
         CWBp3pj+N45wooXq0JV4OahRQCI7U5rkqzH1bLM2AcFooqQ6TVKd7Tb6DOnSjFJyv/
         ZhbXggbrUxvgN24WT8Vf7uEEc/ginpfag3SuZ+BrIxADARjQqJ4YtqYcNFI981pcbZ
         WL43kmvB5mtuIVhjf+uaMu0+jv8wFRoMTVxOwcaGhZXtYkiV8kvCJeJNro38rpSSlP
         5yYEOPNgHWdpQ==
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20201126072844.35370-5-manivannan.sadhasivam@linaro.org>
References: <20201126072844.35370-1-manivannan.sadhasivam@linaro.org> <20201126072844.35370-5-manivannan.sadhasivam@linaro.org>
Subject: Re: [RESEND PATCH v4 4/6] clk: qcom: Add support for SDX55 RPMh clocks
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     bjorn.andersson@linaro.org, vkoul@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        mturquette@baylibre.com, robh+dt@kernel.org
Date:   Wed, 09 Dec 2020 16:34:13 -0800
Message-ID: <160756045309.1580929.3468153555339144385@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Manivannan Sadhasivam (2020-11-25 23:28:42)
> Add support for following clocks maintained by RPMh in SDX55 SoCs.
>=20
> * BI TCXO
> * RF_CLK1
> * RF_CLK1_AO
> * RF_CLK2
> * RF_CLK2_AO
> * QPIC (Qualcomm Technologies, Inc. Parallel Interface Controller)
>=20
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> Reviewed-by: Vinod Koul <vkoul@kernel.org>
> Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---

Applied to clk-next
