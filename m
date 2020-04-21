Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F15821B1ECD
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Apr 2020 08:30:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726052AbgDUGau (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 21 Apr 2020 02:30:50 -0400
Received: from mail.kernel.org ([198.145.29.99]:47302 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725902AbgDUGau (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 21 Apr 2020 02:30:50 -0400
Received: from localhost (unknown [106.51.105.242])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 7FEF82071E;
        Tue, 21 Apr 2020 06:30:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1587450650;
        bh=NbWlzsSd92SHEbV7Q4wF1d3G9+h4a+r74B6/amf9bNc=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=lxUc3yqhf/uxX43+c8yYEl1ob6I5X8rSPuMXf9SKCpVv9pPw0I05pYeJt9KTCoKR8
         J+JL5+Pjcfl4+1Ianj1WAuX+CsCsP/kx2XqG7Q6aJSI0+tq78fckZYArRGhr+IUw4c
         cmOL5ajXMgp1C5TID0yILpw+jAGoLsEheHqPNDMs=
Date:   Tue, 21 Apr 2020 12:00:46 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Andy Gross <agross@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] Qualcomm SM8250 regulators and UFS
Message-ID: <20200421063046.GB72691@vkoul-mobl>
References: <20200415061430.740854-1-bjorn.andersson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200415061430.740854-1-bjorn.andersson@linaro.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 14-04-20, 23:14, Bjorn Andersson wrote:
> Define regulators for SM8250 MTP and add UFS nodes.
> 

Reviewed-by: Vinod Koul <vkoul@kernel.org>
Tested-by: Vinod Koul <vkoul@kernel.org>

> Bryan O'Donoghue (2):
>   arm64: dts: qcom: sm8250-mtp: Add pm8150, pm8150l and pm8009
>   arm64: dts: qcom: sm8250: Add UFS controller and PHY
> 
>  arch/arm64/boot/dts/qcom/sm8250-mtp.dts | 351 ++++++++++++++++++++++++
>  arch/arm64/boot/dts/qcom/sm8250.dtsi    |  71 +++++
>  2 files changed, 422 insertions(+)
> 
> -- 
> 2.24.0

-- 
~Vinod
