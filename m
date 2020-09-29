Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 92C6027D68C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Sep 2020 21:12:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728584AbgI2TM5 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 29 Sep 2020 15:12:57 -0400
Received: from mail-ot1-f68.google.com ([209.85.210.68]:46410 "EHLO
        mail-ot1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728166AbgI2TM4 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 29 Sep 2020 15:12:56 -0400
Received: by mail-ot1-f68.google.com with SMTP id 95so5517115ota.13;
        Tue, 29 Sep 2020 12:12:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=GgjKuyQJoERzQMpEMuhlPCE13zkCByWUan2/5brhiCU=;
        b=ahYCxdjGh6vc+8vs84tn5CP4iJMl3GXT6gnodJscDP47jLs032Q9ElcLIwO+I8Jhak
         1JY1JC3kdcZG64eg2bthagAuxpjsdb6QYBpIxR4P868Z/vFK2ZxK5PgB6bpHEqoRk2Tb
         7cWTxXlB/WOX8ZzIVXiHmYRwhhrvlG0IETfeNQW89H5zfo/4OYdwvkDMn8UssEr7o19s
         QEmuYyuofv6LxHb+jCQ7xkqZoTUR6KPJi5L/AtQVM3LDtvnalXmREI4IhvVWvWxTZdMo
         4+jAcS9I9PDCZ0Xa0pJfAV3aVLwTCfI+E9dyx7Goc+rBdttVadDZBzj+1kkXxTV5/gO8
         V2Rg==
X-Gm-Message-State: AOAM530zWxyi8/Lze2Sz758r9T28hoBRgu5hdo/GgP1k8SNaXVNgYpyJ
        1dY9fGZgu4KWyINDEIzjvw==
X-Google-Smtp-Source: ABdhPJzWyMYcV45E2qABB4g0dlueAf1l8Bg8xQxbnk8POFF0QM48+jRHidYaB2vtazxWKOyqiyLcMg==
X-Received: by 2002:a05:6830:ca:: with SMTP id x10mr3612103oto.344.1601406775723;
        Tue, 29 Sep 2020 12:12:55 -0700 (PDT)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id k16sm1201190oij.56.2020.09.29.12.12.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2020 12:12:55 -0700 (PDT)
Received: (nullmailer pid 987780 invoked by uid 1000);
        Tue, 29 Sep 2020 19:12:54 -0000
Date:   Tue, 29 Sep 2020 14:12:54 -0500
From:   Rob Herring <robh@kernel.org>
To:     kholk11@gmail.com
Cc:     agross@kernel.org, bjorn.andersson@linaro.org, kishon@ti.com,
        marijns95@gmail.com, konradybcio@gmail.com,
        martin.botka1@gmail.com, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, phone-devel@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] phy: qcom-qusb2: Add support for SDM630/660
Message-ID: <20200929191254.GA984478@bogus>
References: <20200926131157.14633-1-kholk11@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200926131157.14633-1-kholk11@gmail.com>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sat, Sep 26, 2020 at 03:11:57PM +0200, kholk11@gmail.com wrote:
> From: Konrad Dybcio <konradybcio@gmail.com>
> 
> QUSB on these SoCs actually uses *almost* the same
> configuration that msm8996 does, so we can reuse
> the phy_cfg from there with just a single change
> (se clock scheme).
> 
> Signed-off-by: Konrad Dybcio <konradybcio@gmail.com>
> Signed-off-by: AngeloGioacchino Del Regno <kholk11@gmail.com>
> ---
>  Documentation/devicetree/bindings/phy/qcom,qusb2-phy.yaml | 1 +
>  drivers/phy/qualcomm/phy-qcom-qusb2.c                     | 7 ++++++-
>  2 files changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/phy/qcom,qusb2-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,qusb2-phy.yaml
> index ccda92859eca..97dae24752b4 100644
> --- a/Documentation/devicetree/bindings/phy/qcom,qusb2-phy.yaml
> +++ b/Documentation/devicetree/bindings/phy/qcom,qusb2-phy.yaml
> @@ -21,6 +21,7 @@ properties:
>                - qcom,ipq8074-qusb2-phy
>                - qcom,msm8996-qusb2-phy
>                - qcom,msm8998-qusb2-phy
> +              - qcom,sdm660-qusb2-phy
>        - items:
>            - enum:
>                - qcom,sc7180-qusb2-phy
> diff --git a/drivers/phy/qualcomm/phy-qcom-qusb2.c b/drivers/phy/qualcomm/phy-qcom-qusb2.c
> index 557547dabfd5..a4d706b361b9 100644
> --- a/drivers/phy/qualcomm/phy-qcom-qusb2.c
> +++ b/drivers/phy/qualcomm/phy-qcom-qusb2.c
> @@ -702,7 +702,8 @@ static int qusb2_phy_init(struct phy *phy)
>  	usleep_range(150, 160);
>  
>  	/* Default is single-ended clock on msm8996 */
> -	qphy->has_se_clk_scheme = true;
> +	if (!of_device_is_compatible(phy->dev.of_node, "qcom,sdm660-qusb2-phy"))
> +		qphy->has_se_clk_scheme = true;

You should just pull this from the driver data.

>  	/*
>  	 * read TCSR_PHY_CLK_SCHEME register to check if single-ended
>  	 * clock scheme is selected. If yes, then disable differential
> @@ -818,6 +819,10 @@ static const struct of_device_id qusb2_phy_of_match_table[] = {
>  	}, {
>  		.compatible	= "qcom,msm8998-qusb2-phy",
>  		.data		= &msm8998_phy_cfg,
> +	}, {
> +		.compatible	= "qcom,sdm660-qusb2-phy",
> +		/* sdm630/660 use the same config as msm8996. */
> +		.data		= &msm8996_phy_cfg,
>  	}, {
>  		/*
>  		 * Deprecated. Only here to support legacy device
> -- 
> 2.28.0
> 
