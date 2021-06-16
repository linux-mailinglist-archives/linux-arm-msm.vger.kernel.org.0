Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 35B523A8F71
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Jun 2021 05:40:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229992AbhFPDm2 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 15 Jun 2021 23:42:28 -0400
Received: from mail.kernel.org ([198.145.29.99]:48180 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229931AbhFPDm2 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 15 Jun 2021 23:42:28 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 5A19B61369;
        Wed, 16 Jun 2021 03:40:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1623814823;
        bh=au93g7gCljhd/LM1FC4eoywQ9MhD/o8ogZOppWJhaaI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=svpKHwepRkYIL7lmUbmjqTo+05+YU8VemZFewlLI2nhrfCN4vb69+CQb/0SXM2OFb
         BaR/XGpBYNPqwLir19YQ4ap1I4KjpBQwc2/Ho+1ps7mlhKYWVq8XoHBb4Nw6YddTvx
         mqc6rAIR8n0w2jd1/BWaeXiHlwUvAsAqy9ZqcvvdYLGwYzov8/SIsSnZqM+pHAGXHY
         3kBdfDHeZ40ukR2KE67jtHuSlMUJWGZS5MpW4ZtfuHa3mlxzzK+3JuiuXZ0sOMIWmu
         wzmR2E4i66zfa949/a/3xlDexT4g8E+osuGldqovU0YPWAYPKwh9suuShS8tbEMabg
         k+6rdX8wHp3oA==
Date:   Wed, 16 Jun 2021 09:10:18 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Konrad Dybcio <konrad.dybcio@somainline.org>,
        ~postmarketos/upstreaming@lists.sr.ht, martin.botka@somainline.org,
        angelogioacchino.delregno@somainline.org,
        marijn.suijten@somainline.org, jamipkettunen@somainline.org,
        Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: sm8250: Add DMA to I2C/SPI
Message-ID: <YMlyojxGbZa8tCnm@vkoul-mobl>
References: <20210615142249.170512-1-konrad.dybcio@somainline.org>
 <YMk9D7hR9+uiDotz@builder.lan>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YMk9D7hR9+uiDotz@builder.lan>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 15-06-21, 18:51, Bjorn Andersson wrote:
> On Tue 15 Jun 09:22 CDT 2021, Konrad Dybcio wrote:
> 
> > Add dma properties to I2C and SPI nodes to make sure DMA transfers can go
> > through. While at it, fix up the property order in SPI nodes to make #address-
> > and #size-cells go after all the meaningful properties.
> > 
> 
> Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Acked-By: Vinod Koul <vkoul@kernel.org>

> 
> But I'll have to wait until Vinod has merged the compatible addition in
> the driver - or given me an Ack to include the pair here.

I will pick that up later today

-- 
~Vinod
