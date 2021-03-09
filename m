Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 62C0E3324EC
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Mar 2021 13:11:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231143AbhCIMKs (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 9 Mar 2021 07:10:48 -0500
Received: from mail.kernel.org ([198.145.29.99]:59492 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230140AbhCIMKY (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 9 Mar 2021 07:10:24 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id BDB0C65259;
        Tue,  9 Mar 2021 12:10:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1615291823;
        bh=Mo6aBMyEs8piPIcIRdhjTmk5dd1sBIQGmUnkUaQ/imo=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Tt7ITlXzAWyPB3w8fQQUrutwZg7yPg6k8xFV0f84PAIrc+fhF0Cg4dun1WD0v6bIH
         kWFF0lrzM0EJhqds51z/9TshQx7DsSpOkuuFYvmoi8SMWjIm7gZymzXLZQEQ/VP7jl
         H8v0+GnO+mVUoKAhLRvwmBc+0IoBqm017j9QrrARFSrgLe00uxx4CMl1V+t5jWsx0L
         dbbZdbxe0AzGBlZWa2BvHZZIuFmAefI82QERtMSE/zRLGOJTbGpf4MAn7OS/jzyBsl
         OjdyBbdTdvCByUYTe1ZaQgK8Hc4Wy4JEcZVHMqpFzAiptPajVFIiKwZTnWUaTkOfFt
         9Nfyxsm9+Ivzg==
Date:   Tue, 9 Mar 2021 17:40:18 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Andy Gross <agross@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@somainline.org>
Subject: Re: [PATCH v2] arm64: dts: qcom: Introduce SM8350 HDK
Message-ID: <YEdlquVoe/8t3hUS@vkoul-mobl>
References: <20210308182113.1284966-1-bjorn.andersson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210308182113.1284966-1-bjorn.andersson@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 08-03-21, 10:21, Bjorn Andersson wrote:

> +#include <dt-bindings/gpio/gpio.h>
> +#include <dt-bindings/regulator/qcom,rpmh-regulator.h>
> +#include "sm8350.dtsi"
> +
> +/ {
> +	model = "Qualcomm Technologies, Inc. SM8350 HDK";
> +	compatible = "qcom,sm8350-hdk", "qcom,sm8350";

qcom,sm8350-hdk needs to be documented

With that:

Reviewed-by: Vinod Koul <vkoul@kernel.org>

-- 
~Vinod
