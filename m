Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0F8563AD1C2
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Jun 2021 20:05:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234852AbhFRSHm (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 18 Jun 2021 14:07:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37866 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234825AbhFRSHj (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 18 Jun 2021 14:07:39 -0400
Received: from mail-oi1-x231.google.com (mail-oi1-x231.google.com [IPv6:2607:f8b0:4864:20::231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 32A74C06175F
        for <linux-arm-msm@vger.kernel.org>; Fri, 18 Jun 2021 11:05:29 -0700 (PDT)
Received: by mail-oi1-x231.google.com with SMTP id l12so11423041oig.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 18 Jun 2021 11:05:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=Bvi78Zd6GX5YNAaG4s+yD+PlQBH4Eh2/pAFrHeVBYwE=;
        b=rwkgdvp2zu3lwuD16xmbOWHlWG0T4d4FOoL89lDC6sJFsCtulCKW7uOtAvz0dLQvm+
         Kr3VjcAgj4/M2m5vIcWvkm1KuNBvqHEbGBR6ug/PQ50U17CMmSBhMoaQZ9hoZcH1ACL7
         /LVvNjVwBsxJvMQLCOx4kwPqMzsWw2fnmWzRNCKRvW2+5ktm51i9OdlKA1WAjETnxg1i
         HJxIwfJ3r5WHmW/7JuTs5CkwwsMqT76ZXOv2EcvHxRe/e08DFY+TzTkcjj+UnD962eHA
         y3ZjUKSyhURO4m2TTmU3/cq+bT+rRLxY3nEE9kcs8luSrtMaxckLiTlynqsbSWmk/8n9
         AP1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Bvi78Zd6GX5YNAaG4s+yD+PlQBH4Eh2/pAFrHeVBYwE=;
        b=sbedf/L2uMxC6ND3CJjLLXjAT/Ec6vn4ObW3xKYwCdYxmgCwMCvljNc0EJQTRrzMNH
         u/TfvovAv/KZhs9aSftXeC4OHzWQ4n6KAw/lBhj27Ac/h73JOg0A+bTI8mp/Eo+pW96w
         6zwN4IxPiEndgwLDmcGMHvFjc13NQMhvZZPY7LEXR0iIAK5GrCC2SH05xWJk7rinD+D9
         O0AZvHC2QMV3Niu8GhrmkoF67/xIm36rbD7QyX95pc7N8PlWfTN20lmGV6KgCni8XhJf
         C4jy5B8BYep63xsO5zMwbCFXA6+rWbY23UZzmoAcaRzN6N4GB8YJQWPra1OD5DChqlvn
         XHzQ==
X-Gm-Message-State: AOAM532ofX2eOQjXbQjRsbc8aFgIBCniLhVftfiA0CosiMz1OzhYw+9m
        nFcLXLtbUGgjq4RaBcZcUdlPuA==
X-Google-Smtp-Source: ABdhPJx+O4Ohn0bpzaetfkCQuSnoTyUvmWksMW+IFQbMW6razIYtFu3GUhWCCyYQclDceASykllM6Q==
X-Received: by 2002:aca:c453:: with SMTP id u80mr7903458oif.93.1624039528569;
        Fri, 18 Jun 2021 11:05:28 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id x2sm1936180oog.10.2021.06.18.11.05.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Jun 2021 11:05:28 -0700 (PDT)
Date:   Fri, 18 Jun 2021 13:05:26 -0500
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Bhupesh Sharma <bhupesh.sharma@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, bhupesh.linux@gmail.com,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, lgirdwood@gmail.com,
        Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH v3 2/5] dt-bindings: regulator: qcom,rpmh-regulator: Add
 compatible for SA8155p-adp board pmic
Message-ID: <YMzgZqCdqM3Gn4c4@builder.lan>
References: <20210617051712.345372-1-bhupesh.sharma@linaro.org>
 <20210617051712.345372-3-bhupesh.sharma@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210617051712.345372-3-bhupesh.sharma@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu 17 Jun 00:17 CDT 2021, Bhupesh Sharma wrote:

> Add compatible string for pmm8155au pmic found on
> the SA8155p-adp board.
> 

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Regards,
Bjorn

> Cc: Mark Brown <broonie@kernel.org>
> Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
> Signed-off-by: Bhupesh Sharma <bhupesh.sharma@linaro.org>
> ---
>  .../devicetree/bindings/regulator/qcom,rpmh-regulator.yaml       | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/regulator/qcom,rpmh-regulator.yaml b/Documentation/devicetree/bindings/regulator/qcom,rpmh-regulator.yaml
> index 3546c6a966a3..34de38377aa6 100644
> --- a/Documentation/devicetree/bindings/regulator/qcom,rpmh-regulator.yaml
> +++ b/Documentation/devicetree/bindings/regulator/qcom,rpmh-regulator.yaml
> @@ -62,6 +62,7 @@ properties:
>        - qcom,pm8350c-rpmh-regulators
>        - qcom,pm8998-rpmh-regulators
>        - qcom,pmi8998-rpmh-regulators
> +      - qcom,pmm8155au-rpmh-regulators
>        - qcom,pmr735a-rpmh-regulators
>        - qcom,pmx55-rpmh-regulators
>  
> -- 
> 2.31.1
> 
