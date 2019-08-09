Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 64B75880B1
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 Aug 2019 19:01:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2436801AbfHIRBt (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 9 Aug 2019 13:01:49 -0400
Received: from mail-pl1-f196.google.com ([209.85.214.196]:43754 "EHLO
        mail-pl1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2436819AbfHIRBt (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 9 Aug 2019 13:01:49 -0400
Received: by mail-pl1-f196.google.com with SMTP id 4so38194883pld.10
        for <linux-arm-msm@vger.kernel.org>; Fri, 09 Aug 2019 10:01:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=mQxrbMZs/P0o3fvXA6rWNom+DiEV73SK0CyreYYoeco=;
        b=g6XhQsxjBSHr7B3N+XAUtFobb0a6Qhe5NzHTss0Z3N6hg2Lj+w3Fc0+mmNK2ddfzvi
         ifdSm4AhQex1l9YpBOIBpix6YdbZOV3YEZwpEtlX6mo9FqK78njXXUYna5ZR0htvQx/y
         UKMsMYhVHHTqr8vrEKRG+NgGoxa4/GQCEA7LWdQniWGLP5Vat73a5CUg/j4noYI+DBHB
         w5ozBbNcUGYPs9kTfnRkyzATzV3yR/z7w6sn7p8gS61o5vb4HmQL6NB2JOd2qN8egQsq
         dTFxGmIo15mJ9xI0fyMSsjwVonsgWtbdqRBtGdBK2OKm4wl4HIq5vemoAlCnrSzrzVXR
         RrcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=mQxrbMZs/P0o3fvXA6rWNom+DiEV73SK0CyreYYoeco=;
        b=V1/V2r2JP74PWi4Sul00Kbs52Ufk8T/SCUFaZQiTaazA4gPb/y6XNu6Dags+VS6JZX
         8QTB/z7Q8juz57nC0cvjhb4dIDEaQzxl5TJvIy7Zx08zEv5pNOaFxx3yYY5pmFoZoATJ
         MOkGM7OOZPpU5k7ie9FvolpHOLY/E1jga3jcKqZfpEXzxTPi4zgz9PEpxR4lWLO1j84u
         kL4NNlBFhPuHhiH+Ra1iO4dfYKYLo75UtNNdfSsAZo9DNBDct8AqEIFLIEFHUqkY99Kp
         GG1Qr3+eNUatVOnBc3Hm7q3Tac3ZwBsoTZC8dhBn9PcOLa2dPfGRofZG5IwGD0o3mR0C
         0HMg==
X-Gm-Message-State: APjAAAVHEGu6S8uFipa7Xeabvdn3dcZ9rmCocmIUeAvrSl6z9099BkbT
        R7E0nJSyM3mzCmfkHI8YLsUyeA==
X-Google-Smtp-Source: APXvYqz/+EaQnfQKxiBOqQ5ZQQWWUCD2VOGKCRvqtpriP1SeTj/ziKt4NAn1mwADltF9GXsvm1S38A==
X-Received: by 2002:a17:902:e613:: with SMTP id cm19mr18634717plb.299.1565370108924;
        Fri, 09 Aug 2019 10:01:48 -0700 (PDT)
Received: from tuxbook-pro (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id 4sm111526529pfc.92.2019.08.09.10.01.47
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Fri, 09 Aug 2019 10:01:48 -0700 (PDT)
Date:   Fri, 9 Aug 2019 10:03:22 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Vinod Koul <vkoul@kernel.org>
Cc:     Mark Brown <broonie@kernel.org>, linux-arm-msm@vger.kernel.org,
        Andy Gross <agross@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 3/4] regulator: qcom-rpmh: Fix pmic5_bob voltage count
Message-ID: <20190809170322.GO26807@tuxbook-pro>
References: <20190809073616.1235-1-vkoul@kernel.org>
 <20190809073616.1235-3-vkoul@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190809073616.1235-3-vkoul@kernel.org>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri 09 Aug 00:36 PDT 2019, Vinod Koul wrote:

> pmic5_bob voltages count is 136 [0,135] so update it
> 
> Signed-off-by: Vinod Koul <vkoul@kernel.org>

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

> ---
>  drivers/regulator/qcom-rpmh-regulator.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/regulator/qcom-rpmh-regulator.c b/drivers/regulator/qcom-rpmh-regulator.c
> index 0ef2716da3bd..391ed844a251 100644
> --- a/drivers/regulator/qcom-rpmh-regulator.c
> +++ b/drivers/regulator/qcom-rpmh-regulator.c
> @@ -698,7 +698,7 @@ static const struct rpmh_vreg_hw_data pmic5_bob = {
>  	.regulator_type = VRM,
>  	.ops = &rpmh_regulator_vrm_bypass_ops,
>  	.voltage_range = REGULATOR_LINEAR_RANGE(300000, 0, 135, 32000),
> -	.n_voltages = 135,
> +	.n_voltages = 136,
>  	.pmic_mode_map = pmic_mode_map_pmic4_bob,
>  	.of_map_mode = rpmh_regulator_pmic4_bob_of_map_mode,
>  };
> -- 
> 2.20.1
> 
