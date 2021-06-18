Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8DBFE3AD1C0
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Jun 2021 20:04:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234830AbhFRSG5 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 18 Jun 2021 14:06:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37690 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234825AbhFRSG5 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 18 Jun 2021 14:06:57 -0400
Received: from mail-ot1-x334.google.com (mail-ot1-x334.google.com [IPv6:2607:f8b0:4864:20::334])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7787BC061760
        for <linux-arm-msm@vger.kernel.org>; Fri, 18 Jun 2021 11:04:46 -0700 (PDT)
Received: by mail-ot1-x334.google.com with SMTP id w23-20020a9d5a970000b02903d0ef989477so10493240oth.9
        for <linux-arm-msm@vger.kernel.org>; Fri, 18 Jun 2021 11:04:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=S75/1qiya/1BR4HVKhE/aTSWkl4eZLDvqKyT4tZSAZM=;
        b=Ctwqh0faj1yP3tSxUVjDuuIbSrbEQlYPyCJQ91VsxMFP1CILdrmPTUPjzGe7ZfYXAz
         pNUmwJBhNRqtvJoqiHo8CaZWn6cF6Rg3LngzQNqlWShMNE2R8whdbSuEwUFvtB1duzVn
         MS93h+jfbeHyyE6wXdqjBWk43KHh7SFmL2x3pUDJava+0bNRyuouKtD3ojY1pV1hVNUT
         WSz8vGU+/ncZ2weP+jPFSQg3yfHWz778a8t4PkG27m9ozO0Sp2wiObo6Yq16U/dstesW
         Dncz2tEh8H7lYdMXtdWji6MlWhXdMVbVQll0yhEB+BxKiQLMy+Ve7eLIDq5Lr0TV+tfI
         9Snw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=S75/1qiya/1BR4HVKhE/aTSWkl4eZLDvqKyT4tZSAZM=;
        b=ci1IgErrJFMkwivy2+/siijecEih/0WFx9aqNP0G3x0fcb0AeWpvw2Ga4ml/w1YGdO
         ff5GxpSkM0x8vuKYsi3neakl3Uk8E/pUF9G5BSHlh7wZGEYz6rfTsLWULNBiLZTDYTma
         Vgl2u+SFg+BVUbbqp/2hRZJraMB4GIOB9IZvNdkNr9keN8Zg73ZsSQzrfcP3cGNpLb1i
         dZOyJAzzHoj8vHaFkbIcMnENzmR2MpAaIGVHBB0mm5A8/ruus0RUnee+DXu0WA7iMGHg
         zU3oleRtDRX+JDYj63d56OkMHz8jQPyddz0o+wvxeItJ5QsTQM69AInjQ8+1uuUvpS+H
         XqsA==
X-Gm-Message-State: AOAM5329ZGOI8vbfHqAr6QY5jrrN+tIhU4x5tHtUjvbWRz7QdzP5HD/Q
        GnOS7UXy+x3zNiLNVVoILYSkRA==
X-Google-Smtp-Source: ABdhPJybQlXOwQWowdDDOIHgHEzzjY6NFupMXD+PI0xlKQhSK66+xqVQI23eb6hKKsNfyaokFgY2vw==
X-Received: by 2002:a9d:2f65:: with SMTP id h92mr10712732otb.125.1624039485882;
        Fri, 18 Jun 2021 11:04:45 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id v203sm1934365oie.52.2021.06.18.11.04.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Jun 2021 11:04:45 -0700 (PDT)
Date:   Fri, 18 Jun 2021 13:04:43 -0500
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Bhupesh Sharma <bhupesh.sharma@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, bhupesh.linux@gmail.com,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, lgirdwood@gmail.com,
        Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH v3 1/5] dt-bindings: regulator: qcom,rpmh-regulator:
 Arrange compatibles alphabetically
Message-ID: <YMzgOxoBexqKSZxl@builder.lan>
References: <20210617051712.345372-1-bhupesh.sharma@linaro.org>
 <20210617051712.345372-2-bhupesh.sharma@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210617051712.345372-2-bhupesh.sharma@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu 17 Jun 00:17 CDT 2021, Bhupesh Sharma wrote:

> Arrange the compatibles inside qcom-rpmh regulator device tree
> bindings alphabetically.
> 

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Regards,
Bjorn

> Cc: Mark Brown <broonie@kernel.org>
> Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
> Signed-off-by: Bhupesh Sharma <bhupesh.sharma@linaro.org>
> ---
>  .../bindings/regulator/qcom,rpmh-regulator.yaml  | 16 ++++++++--------
>  1 file changed, 8 insertions(+), 8 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/regulator/qcom,rpmh-regulator.yaml b/Documentation/devicetree/bindings/regulator/qcom,rpmh-regulator.yaml
> index e561a5b941e4..3546c6a966a3 100644
> --- a/Documentation/devicetree/bindings/regulator/qcom,rpmh-regulator.yaml
> +++ b/Documentation/devicetree/bindings/regulator/qcom,rpmh-regulator.yaml
> @@ -33,6 +33,9 @@ description: |
>  
>      The names used for regulator nodes must match those supported by a given
>      PMIC. Supported regulator node names are
> +      For PM6150, smps1 - smps5, ldo1 - ldo19
> +      For PM6150L, smps1 - smps8, ldo1 - ldo11, bob
> +      For PM7325, smps1 - smps8, ldo1 - ldo19
>        For PM8005, smps1 - smps4
>        For PM8009, smps1 - smps2, ldo1 - ldo7
>        For PM8150, smps1 - smps10, ldo1 - ldo18
> @@ -41,15 +44,15 @@ description: |
>        For PM8350C, smps1 - smps10, ldo1 - ldo13, bob
>        For PM8998, smps1 - smps13, ldo1 - ldo28, lvs1 - lvs2
>        For PMI8998, bob
> -      For PM6150, smps1 - smps5, ldo1 - ldo19
> -      For PM6150L, smps1 - smps8, ldo1 - ldo11, bob
> -      For PMX55, smps1 - smps7, ldo1 - ldo16
> -      For PM7325, smps1 - smps8, ldo1 - ldo19
>        For PMR735A, smps1 - smps3, ldo1 - ldo7
> +      For PMX55, smps1 - smps7, ldo1 - ldo16
>  
>  properties:
>    compatible:
>      enum:
> +      - qcom,pm6150-rpmh-regulators
> +      - qcom,pm6150l-rpmh-regulators
> +      - qcom,pm7325-rpmh-regulators
>        - qcom,pm8005-rpmh-regulators
>        - qcom,pm8009-rpmh-regulators
>        - qcom,pm8009-1-rpmh-regulators
> @@ -59,11 +62,8 @@ properties:
>        - qcom,pm8350c-rpmh-regulators
>        - qcom,pm8998-rpmh-regulators
>        - qcom,pmi8998-rpmh-regulators
> -      - qcom,pm6150-rpmh-regulators
> -      - qcom,pm6150l-rpmh-regulators
> -      - qcom,pmx55-rpmh-regulators
> -      - qcom,pm7325-rpmh-regulators
>        - qcom,pmr735a-rpmh-regulators
> +      - qcom,pmx55-rpmh-regulators
>  
>    qcom,pmic-id:
>      description: |
> -- 
> 2.31.1
> 
