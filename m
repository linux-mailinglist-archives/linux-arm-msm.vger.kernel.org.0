Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B70AA1B1EC7
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Apr 2020 08:29:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726403AbgDUG32 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 21 Apr 2020 02:29:28 -0400
Received: from mail.kernel.org ([198.145.29.99]:46520 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725831AbgDUG31 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 21 Apr 2020 02:29:27 -0400
Received: from localhost (unknown [106.51.105.242])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id A64B82071E;
        Tue, 21 Apr 2020 06:29:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1587450567;
        bh=XX2Z1MnEGgpM2FjLeaLRE5D5nE8CnfrPsDfrRFKtZZI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=yMUyc0edgPRsn74aYRLZkQIWt0fDtz+93laA98Qcu8MnJWiXYhbtixOHrX5xziY9I
         g4GyAOOeQtVlY4v48z2aIh5NFKZFo1AfDHpvw5dfrobYSUb0PViz0/+zeLgM2u4Bp7
         jGYqEXKEfOcgjdEcDpb5lPt5N4/l5ySimHw1wO5Y=
Date:   Tue, 21 Apr 2020 11:59:21 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Andy Gross <agross@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] Qualcomm SM8250 PRMHPD support
Message-ID: <20200421062921.GA72691@vkoul-mobl>
References: <20200415062154.741179-1-bjorn.andersson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200415062154.741179-1-bjorn.andersson@linaro.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 14-04-20, 23:21, Bjorn Andersson wrote:
> Add rpmhpd resources for SM8250 and add the relevant node to DT
> 

Reviewed-by: Vinod Koul <vkoul@kernel.org>
Tested-by: Vinod Koul <vkoul@kernel.org>

> Bjorn Andersson (2):
>   soc: qcom: rpmhpd: Add SM8250 power domains
>   arm64: dts: qcom: sm8250: Add rpmhpd node
> 
>  .../devicetree/bindings/power/qcom,rpmpd.yaml |  1 +
>  arch/arm64/boot/dts/qcom/sm8250.dtsi          | 51 +++++++++++++++++++
>  drivers/soc/qcom/rpmhpd.c                     | 19 +++++++
>  include/dt-bindings/power/qcom-rpmpd.h        | 12 +++++
>  4 files changed, 83 insertions(+)
> 
> -- 
> 2.24.0

-- 
~Vinod
