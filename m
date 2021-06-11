Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E05DE3A39E5
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Jun 2021 04:49:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230059AbhFKCvV (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 10 Jun 2021 22:51:21 -0400
Received: from mail-oi1-f173.google.com ([209.85.167.173]:34719 "EHLO
        mail-oi1-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231284AbhFKCvV (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 10 Jun 2021 22:51:21 -0400
Received: by mail-oi1-f173.google.com with SMTP id u11so4381770oiv.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 10 Jun 2021 19:49:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=ET0Wo9pMUsI9hBiKex+wY6Ul5+CPxPf28986pbN/EI8=;
        b=Iseiym3XfDQgP5PW7eJN1GwuNhwtjrkNSyfsk2d62Gjx6tZlaIQBmsm5i4cidk+odv
         e16sKIQ7BwJOk2C4LEALXoIAxEjHgGi62G0yRCUotsSccwggOlHDSkweK+zPSVp6O+/9
         gNnhRuw0jWJgwnE67tYQGX+sq2Ei2FoYKop4iMuR0ZURcFhtMK90C8H8fN1wVhdV7Vm7
         aiFbBiZFSsTqU0vS9vST8xfcTR3QkeIqdU1yEJf1NqmZjiZXIB2ue1EXxFCVbZ+GQkq+
         d9Ze2RSacRNjcGo6V9XjIlO82Bo4tPP9iluGBiZKJCYJfLYtUyrF74r18DHSyhxAeHPF
         gqHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=ET0Wo9pMUsI9hBiKex+wY6Ul5+CPxPf28986pbN/EI8=;
        b=CPEmI73oZYtO8T7jYYwB2srmlMRVmF0khkrlKNNRIirXa6QMBgAGBGOjY/9W4M+H+v
         oxBezQuUCCBcRaBqWCiWti8ku3sFXcr1OR1mgjIPMGbcZV1UNKTKYCezeGfr99JU+CrK
         yVluS1Tvz78L0gb0aJ/KEF7YsU31otU+FPvI97rWq4/LERPRPyHMVODwmR9ZeCmkSRHR
         uwU1dgk9/aa712Zm1etVyCOFtHXldgstDmRt+v5xR9NC8xvi84nui37A6SnUUwtlcQKv
         t7amlJHCa25ZeY2WoY921YM76QOQXswyPVJfswc1G350gVoYA2sDO9pcyPKRTkTgyVlX
         VEdw==
X-Gm-Message-State: AOAM530Xf+zgjHjV78pbfx47SAPvfcCKk8T0SwAFzTn0JHkqhmgO8obg
        bnFNA+icjFWot9j8gAUAS9RFjFqrE1822A==
X-Google-Smtp-Source: ABdhPJz04W/K9tQFYJrLbGW31b3a6sL0JI96PcarTWMMiRhX4hwe2np+7ggxBmcFSUfQkfxWI4JNNA==
X-Received: by 2002:a05:6808:999:: with SMTP id a25mr938976oic.123.1623379689633;
        Thu, 10 Jun 2021 19:48:09 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id a74sm929046oib.21.2021.06.10.19.48.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Jun 2021 19:48:09 -0700 (PDT)
Date:   Thu, 10 Jun 2021 21:48:07 -0500
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Bhupesh Sharma <bhupesh.sharma@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Andy Gross <agross@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        bhupesh.linux@gmail.com
Subject: Re: [PATCH 1/8] dt-bindings: qcom: rpmh-regulator: Add compatible
 for SA8155p-adp board pmics
Message-ID: <YMLO56Rr7UGUy8vo@builder.lan>
References: <20210607113840.15435-1-bhupesh.sharma@linaro.org>
 <20210607113840.15435-2-bhupesh.sharma@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210607113840.15435-2-bhupesh.sharma@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon 07 Jun 06:38 CDT 2021, Bhupesh Sharma wrote:

> Add compatible strings for pmm8155au_1 and pmm8155au_2 pmics
> found on SA8155p-adp board.
> 
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: Liam Girdwood <lgirdwood@gmail.com>
> Cc: Mark Brown <broonie@kernel.org>
> Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
> Cc: Vinod Koul <vkoul@kernel.org>
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: Andy Gross <agross@kernel.org>
> Cc: devicetree@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org
> Cc: linux-gpio@vger.kernel.org
> Cc: bhupesh.linux@gmail.com
> Signed-off-by: Bhupesh Sharma <bhupesh.sharma@linaro.org>
> ---
>  .../devicetree/bindings/regulator/qcom,rpmh-regulator.yaml      | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/regulator/qcom,rpmh-regulator.yaml b/Documentation/devicetree/bindings/regulator/qcom,rpmh-regulator.yaml
> index e561a5b941e4..ea5cd71aa0c7 100644
> --- a/Documentation/devicetree/bindings/regulator/qcom,rpmh-regulator.yaml
> +++ b/Documentation/devicetree/bindings/regulator/qcom,rpmh-regulator.yaml
> @@ -55,6 +55,8 @@ properties:
>        - qcom,pm8009-1-rpmh-regulators
>        - qcom,pm8150-rpmh-regulators
>        - qcom,pm8150l-rpmh-regulators
> +      - qcom,pmm8155au-1-rpmh-regulators
> +      - qcom,pmm8155au-2-rpmh-regulators

Looking at the component documentation and the schematics I think the
component is "PMM8155AU" and we have two of them.

Unless I'm mistaken we should have the compatible describe the single
component and we should have DT describe the fact that we have 2 of
them.

Regards,
Bjorn

>        - qcom,pm8350-rpmh-regulators
>        - qcom,pm8350c-rpmh-regulators
>        - qcom,pm8998-rpmh-regulators
> -- 
> 2.31.1
> 
