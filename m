Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5A8FC95E7C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Aug 2019 14:28:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729823AbfHTM2O (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 20 Aug 2019 08:28:14 -0400
Received: from mail-lj1-f195.google.com ([209.85.208.195]:41143 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729409AbfHTM2N (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 20 Aug 2019 08:28:13 -0400
Received: by mail-lj1-f195.google.com with SMTP id m24so4926710ljg.8
        for <linux-arm-msm@vger.kernel.org>; Tue, 20 Aug 2019 05:28:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=uSzA+deYH2CA9sfLAmC6fnAqGQzVRMWEGet1t+TVBoo=;
        b=HKqtRuUZ58wIwblQWEIbUZFmXWRuGk4NU9tAUzOKCxLpSRRo8w2abY622YAEMBcLE0
         Wf+wh88u2FQQjUMA8xp/XB6K+8DYK1tUbsCdPLJsDeMw8hs+yMCJ2gG3UiOl4fyZ1CJr
         UUVqtyLcMG/Uj/QV6xHXqqOLBCkicXJ5FxIaWwvUfyi6Z9JA9l0aFrAaIydQWsB+ENA/
         j04F5W/FjlgqFt7DP/jA++d+RK5IEcKXF8L0rv2UrOIUz5fpLNZdaZs9kWS0ETY0nYKq
         C6zHO9F4zbx9hqqPJ6NFwI1iJJCPoWAPVoZ1ww44GsZe2+RMEe9Q/nlfChulCO9cqns9
         IBgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=uSzA+deYH2CA9sfLAmC6fnAqGQzVRMWEGet1t+TVBoo=;
        b=L+FItm1U0ovncJ6L3DxHnmVSK0BdS5OFa4njgah5mI1DEVrRvhCpUeZovtqXxvjVXR
         xnW56vA/Yx+VlSY+PLwRQUxWA+ba4y5yQM46WkhDuw9fpeazhdDcb6+sCrFXwzeAHIY4
         FQfmoWw0+m8GH26CEiY37bDeHac/FKVHn7I+IvywKAnLXmYGhUrfFYqH2be6U2ktrlJM
         7Y6e7ge5aGz5xGZ3r37cj/koBsJCwINX2R9gCyAB2o2YhpqsbhppnWBpECJ9hSaDZdxd
         qI1Q7f3A2SsumSGhz5f0NVBmaYbAuy6zp8aPSc9AtFG8rOAO3dDvlO/6h13+uOm7kvc1
         JXNw==
X-Gm-Message-State: APjAAAUVs61GT5FGWmg+oXFMjT9cktkq7vSTU366rVTczhkdY2HBug2I
        IWJBHwCRzdZsyFoF+UyJbsAj6Q==
X-Google-Smtp-Source: APXvYqzKK0zYhpY7S6oRVdVZMZwTxac1W5ObEPYIk1O2MIyJnBkh6iBXLFOiY3le7gy0rvfjEbn+5w==
X-Received: by 2002:a05:651c:1a7:: with SMTP id c7mr15354585ljn.89.1566304091923;
        Tue, 20 Aug 2019 05:28:11 -0700 (PDT)
Received: from centauri (ua-84-219-138-247.bbcust.telenor.se. [84.219.138.247])
        by smtp.gmail.com with ESMTPSA id j30sm2863475lfk.48.2019.08.20.05.28.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Aug 2019 05:28:11 -0700 (PDT)
Date:   Tue, 20 Aug 2019 14:28:09 +0200
From:   Niklas Cassel <niklas.cassel@linaro.org>
To:     Vinod Koul <vkoul@kernel.org>
Cc:     Andy Gross <agross@kernel.org>, linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Sibi Sankar <sibis@codeaurora.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/8] arm64: dts: qcom: sm8150: Add SM8150 DTS
Message-ID: <20190820122809.GF31261@centauri>
References: <20190820064216.8629-1-vkoul@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190820064216.8629-1-vkoul@kernel.org>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Aug 20, 2019 at 12:12:08PM +0530, Vinod Koul wrote:
> This series adds DTS for SM8150, PMIC PM8150, PM8150B, PM8150L and
> the MTP for SM8150.
> 
> Changes in v2:
>  - Squash patches
>  - Fix comments given by Stephen namely, lowercase for hext numbers,
>    making rpmhcc have xo_board as parent, rename pon controller to
>    power-on controller, make pmic nodes as disabled etc.
>  - removed the dependency on clk defines and use raw numbers
> 
> Vinod Koul (8):
>   arm64: dts: qcom: sm8150: add base dts file
>   arm64: dts: qcom: pm8150: Add Base DTS file
>   arm64: dts: qcom: pm8150b: Add Base DTS file
>   arm64: dts: qcom: pm8150l: Add Base DTS file
>   arm64: dts: qcom: sm8150-mtp: add base dts file

Use consistent naming.

>   arm64: dts: qcom: sm8150-mtp: Add regulators
>   arm64: dts: qcom: sm8150: Add reserved-memory regions
>   arm64: dts: qcom: sm8150: Add apps shared nodes
> 
>  arch/arm64/boot/dts/qcom/Makefile       |   1 +
>  arch/arm64/boot/dts/qcom/pm8150.dtsi    |  95 +++++
>  arch/arm64/boot/dts/qcom/pm8150b.dtsi   |  84 +++++
>  arch/arm64/boot/dts/qcom/pm8150l.dtsi   |  78 ++++
>  arch/arm64/boot/dts/qcom/sm8150-mtp.dts | 375 +++++++++++++++++++
>  arch/arm64/boot/dts/qcom/sm8150.dtsi    | 479 ++++++++++++++++++++++++
>  6 files changed, 1112 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/qcom/pm8150.dtsi
>  create mode 100644 arch/arm64/boot/dts/qcom/pm8150b.dtsi
>  create mode 100644 arch/arm64/boot/dts/qcom/pm8150l.dtsi
>  create mode 100644 arch/arm64/boot/dts/qcom/sm8150-mtp.dts
>  create mode 100644 arch/arm64/boot/dts/qcom/sm8150.dtsi
> 
> -- 
> 2.20.1
> 
