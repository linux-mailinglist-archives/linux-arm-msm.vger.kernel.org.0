Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EA391303096
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 Jan 2021 00:55:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726157AbhAYVE1 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 25 Jan 2021 16:04:27 -0500
Received: from mail-oi1-f173.google.com ([209.85.167.173]:42166 "EHLO
        mail-oi1-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732202AbhAYVEI (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 25 Jan 2021 16:04:08 -0500
Received: by mail-oi1-f173.google.com with SMTP id x71so16247975oia.9;
        Mon, 25 Jan 2021 13:03:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=ZAwqj98MR9Q7ClbWqFCOrDrS0wZ7y5oWVoRsp1Uc8Jg=;
        b=ZA7seiCXka4RmpbtOmbyooxv3nSDgZNQ8eX373ebSiX28Bx7t7OFBpAmvjvU4BwjEE
         Fjr5TTty5PuR025NrnDiVXVK8V5/Y34++x/C7E1vBZGR2jnNq+qeNV3jDDxr/079LL4n
         HMazeU7QxEFzefDnoazKzLPuo7tdntB4lc5y0DvAjaQBtcO8iVP34zYC2Ux1QUf/WITY
         vQi1JKGxchjP90pr9jCL3m1ueDI+UNlV08tPQb5WRvsXj4Awo1ZJYCewyXVHcoCy87Fp
         t4c+f7Q+LBnFoZdL7C5nRdBFnwIMMUtLHftB8HU9BKId4dMyHZbacylT6VIYieMmfGU7
         Z5eQ==
X-Gm-Message-State: AOAM5337gAkZmdoJZGGD1lVpOeTTUFqghrK+tRs59O7WIAnoiWrxhoTO
        hjxPwPgXIzw+gj1j47LMhg==
X-Google-Smtp-Source: ABdhPJxaWuDn8g78XZz2ioVkt6sZEgohgAT/McZ6sycJ4AUyOMrSElz88xTI6906QqbvWxpIuefXmw==
X-Received: by 2002:a54:4804:: with SMTP id j4mr1208639oij.85.1611608607498;
        Mon, 25 Jan 2021 13:03:27 -0800 (PST)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id l110sm2673305otc.25.2021.01.25.13.03.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Jan 2021 13:03:26 -0800 (PST)
Received: (nullmailer pid 985759 invoked by uid 1000);
        Mon, 25 Jan 2021 21:03:24 -0000
Date:   Mon, 25 Jan 2021 15:03:24 -0600
From:   Rob Herring <robh@kernel.org>
To:     AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>
Cc:     devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, agross@kernel.org,
        linux-kernel@vger.kernel.org, martin.botka@somainline.org,
        phone-devel@vger.kernel.org, robh+dt@kernel.org,
        mturquette@baylibre.com, bjorn.andersson@linaro.org,
        konrad.dybcio@somainline.org, marijn.suijten@somainline.org
Subject: Re: [PATCH v2 9/9] dt-bindings: clock: Add QCOM SDM630 and SDM660
 graphics clock bindings
Message-ID: <20210125210324.GA985644@robh.at.kernel.org>
References: <20210113183817.447866-1-angelogioacchino.delregno@somainline.org>
 <20210113183817.447866-10-angelogioacchino.delregno@somainline.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210113183817.447866-10-angelogioacchino.delregno@somainline.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, 13 Jan 2021 19:38:17 +0100, AngeloGioacchino Del Regno wrote:
> Add device tree bindings for graphics clock controller for
> Qualcomm Technology Inc's SDM630 and SDM660 SoCs.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>
> ---
>  .../bindings/clock/qcom,gpucc-sdm660.yaml     | 76 +++++++++++++++++++
>  1 file changed, 76 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/clock/qcom,gpucc-sdm660.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
