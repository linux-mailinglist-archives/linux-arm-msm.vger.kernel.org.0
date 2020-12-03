Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 83B072CE2B9
	for <lists+linux-arm-msm@lfdr.de>; Fri,  4 Dec 2020 00:35:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729901AbgLCXeq (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 3 Dec 2020 18:34:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40074 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727278AbgLCXeq (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 3 Dec 2020 18:34:46 -0500
Received: from mail-ot1-x342.google.com (mail-ot1-x342.google.com [IPv6:2607:f8b0:4864:20::342])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3F840C061A51
        for <linux-arm-msm@vger.kernel.org>; Thu,  3 Dec 2020 15:34:00 -0800 (PST)
Received: by mail-ot1-x342.google.com with SMTP id j12so3509738ota.7
        for <linux-arm-msm@vger.kernel.org>; Thu, 03 Dec 2020 15:34:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=Nlt5TCZHrcUiLfPk4cKZXl+okLQJSI7yOB6iAjOGzWc=;
        b=y5SLYw5aFhViOAGUSfQe/vsfi792mLpmL6RQ8gptc9iXRps4I4XyzK3B5+4qvAKU2+
         g5ZrtsejLP5UB2oV9aiYdrbTDgW09+K8yTZxIi0zM6r2VhnuMJ/T3WlrAoC/mesW/jAU
         E46NkBnjNvLSg91sXuCosyWkeDotJtxi7ZsZ6uRTlp6UBgcV8LGY7eGhUx8ivv2NGmmF
         22jYCqroVAqveOLvzni9aCqPIqBvsbPXv2pGiGwMsyzujWJsXD4aHjAcBXlE057MO0Bf
         BU2FiHE7S5MODvy5mzZI+c8b+PUnchspHeuMeIlsSrlc5XoCfN2Ms23+tx/1NiOIgI2V
         PGng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Nlt5TCZHrcUiLfPk4cKZXl+okLQJSI7yOB6iAjOGzWc=;
        b=PAgeDvnLo3Ws9ScerdHJj8g9w+xAK99JKCqhYlqqCYM30PPORuojU+qaJqtm1Uuv2Z
         /webAZqX+Dr/75sh69D227Fhw7TD9ASdW+o5RRxhnXccoFAcY8a3Ai7ivkIfuSKrSuhA
         uNIqaoL72muhGdpOPrhrwY1/vtO08zfGbJi0QW0LvzyCpwMbo+lfqGlBL1O22vfmfHsW
         o9ktecL3PYbzb4/rVoWJ8BrIftltdc1Y3jZ4QHCYli5OKIaZUnQB1DmkiLWUAv3MqBAy
         6OjxqEWMwNrBNXgt5PvPLQRt3QjXqFGF34qKDRCseGKShx2oOgs+KHRcYQiSQ9qugtbM
         49mw==
X-Gm-Message-State: AOAM530uECa2DzKkVxPpmixNnct69dwXUqjLE7YtiMtwhVYEN3YvaT6/
        M8VwIrhoGpX83r99y87RB/LaLw==
X-Google-Smtp-Source: ABdhPJzUGMCjZFhGEILX4taCuORPDa4llhRz+7yRCWz//95EVkzuFKSrUIxo+MkrDkz9QMOr/GUpsQ==
X-Received: by 2002:a05:6830:1456:: with SMTP id w22mr1454769otp.47.1607038439555;
        Thu, 03 Dec 2020 15:33:59 -0800 (PST)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id u66sm222457otb.48.2020.12.03.15.33.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Dec 2020 15:33:58 -0800 (PST)
Date:   Thu, 3 Dec 2020 17:33:57 -0600
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Vinod Koul <vkoul@kernel.org>
Cc:     Mark Brown <broonie@kernel.org>, linux-arm-msm@vger.kernel.org,
        Andy Gross <agross@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Rob Herring <robh+dt@kernel.org>, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH 1/2] regulator: dt-bindings: Add PM8350x compatibles
Message-ID: <X8l15Z6TXnbJdl1P@builder.lan>
References: <20201203071244.2652297-1-vkoul@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201203071244.2652297-1-vkoul@kernel.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu 03 Dec 01:12 CST 2020, Vinod Koul wrote:

> Add PM8350 and PM8350C compatibles for these PMICs found in some
> Qualcomm platforms.
> 

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

> Signed-off-by: Vinod Koul <vkoul@kernel.org>
> ---
>  .../devicetree/bindings/regulator/qcom,rpmh-regulator.txt     | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/regulator/qcom,rpmh-regulator.txt b/Documentation/devicetree/bindings/regulator/qcom,rpmh-regulator.txt
> index 97c3e0b7611c..0f5f4029d9a2 100644
> --- a/Documentation/devicetree/bindings/regulator/qcom,rpmh-regulator.txt
> +++ b/Documentation/devicetree/bindings/regulator/qcom,rpmh-regulator.txt
> @@ -26,6 +26,8 @@ Supported regulator node names:
>  	PM8009:		smps1 - smps2, ldo1 - ldo7
>  	PM8150:		smps1 - smps10, ldo1 - ldo18
>  	PM8150L:	smps1 - smps8, ldo1 - ldo11, bob, flash, rgb
> +	PM8350:		smps1 - smps12, ldo1 - ldo10,
> +	PM8350C:	smps1 - smps10, ldo1 - ldo13, bob
>  	PM8998:		smps1 - smps13, ldo1 - ldo28, lvs1 - lvs2
>  	PMI8998:	bob
>  	PM6150:         smps1 - smps5, ldo1 - ldo19
> @@ -43,6 +45,8 @@ First Level Nodes - PMIC
>  		    "qcom,pm8009-rpmh-regulators"
>  		    "qcom,pm8150-rpmh-regulators"
>  		    "qcom,pm8150l-rpmh-regulators"
> +		    "qcom,pm8350-rpmh-regulators"
> +		    "qcom,pm8350c-rpmh-regulators"
>  		    "qcom,pm8998-rpmh-regulators"
>  		    "qcom,pmi8998-rpmh-regulators"
>  		    "qcom,pm6150-rpmh-regulators"
> -- 
> 2.26.2
> 
