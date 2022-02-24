Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 850094C22CE
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Feb 2022 05:03:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229828AbiBXECa (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 23 Feb 2022 23:02:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44310 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229481AbiBXEC3 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 23 Feb 2022 23:02:29 -0500
Received: from mail-oo1-xc33.google.com (mail-oo1-xc33.google.com [IPv6:2607:f8b0:4864:20::c33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6D58E16307A
        for <linux-arm-msm@vger.kernel.org>; Wed, 23 Feb 2022 20:02:00 -0800 (PST)
Received: by mail-oo1-xc33.google.com with SMTP id x6-20020a4a4106000000b003193022319cso1752404ooa.4
        for <linux-arm-msm@vger.kernel.org>; Wed, 23 Feb 2022 20:02:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=C47SZnnj7WECDuYywW/3ttGfgdVHSBmqkuTNTlr6sy0=;
        b=wgHtC2xqvLpVn9xvxBmqgieyVAnVQx7kC2I6olcvde4IiGA5Z4XAaTUTu9u/DdBwLK
         t5fLCkNWes9Y7YQ15yGJX8DPWjXoBpJQCgvLsK+vcDTwyN53ToQkaB2ia+ZcjlDxPb97
         tFZ+Yg3ZJh5V6i6RfGhxHg0iX4mWoX147AA3P8UZOuRwf2ub7oF4dmm7mIXqj5RDHNn7
         NeSucNPDFQqlqEK9aOJOWWjz1oIpZImbPg4oru8o7EYgWEvshg2RCVLqhZirmSsZ8LHq
         Hk98r6+8ZBq05q8MNJJqcgpoYtJPL+mQS8uMffNOnpOioENmIn1fPUQEaDNH6e/Pmv32
         zC8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=C47SZnnj7WECDuYywW/3ttGfgdVHSBmqkuTNTlr6sy0=;
        b=YjgW8RyGFCewd8NqaQJbJHplDjlOboqIOMdt5iKDIGPTjsBM6T8mZ8THCZzTfBM2iy
         ui/7iV86z50qtVM1QWGqsi7j/Dddc+9+QOeBkVeBu3sKlXb3Dyd5Lb2PSd8qDTIfzs6d
         ox0VjwQc/wTfiw5KA7YDjyZQFFDnnW5KgRJiKA1/bp5KEEtFpBu9JRJ1pbL6w2+ocqzO
         fFurWKusuinCEze7ucj/CJvdrkfkES/uh8sqO7TNPiqDpiaiFXYESGvBeYYLEOP/Scg4
         CkHDG8dfENqYfphoFRcrbV+R8kPYAtzbqx+tVckPQIYmArdFJmkBiLWnqzWcrcQVwzxv
         oMJw==
X-Gm-Message-State: AOAM532PG8V+WMjA1bJe+HEOtGsLsg6LHP1E9CTJd8PSBUfsVmpPVpN/
        qCgGojjchhQXbw7bye3jhMz/vw==
X-Google-Smtp-Source: ABdhPJwRTIhc2pUV92EutkmS/7Hg8M5b85r/Ho9yqDpZXPRCP+sSPj++3hAKbZ0FJffQTa20D2wzhQ==
X-Received: by 2002:a05:6870:2892:b0:ce:c0c9:6c6 with SMTP id gy18-20020a056870289200b000cec0c906c6mr5355157oab.280.1645675319819;
        Wed, 23 Feb 2022 20:01:59 -0800 (PST)
Received: from builder.lan ([2600:1700:a0:3dc8:3697:f6ff:fe85:aac9])
        by smtp.gmail.com with ESMTPSA id a32sm1023981oaf.10.2022.02.23.20.01.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Feb 2022 20:01:59 -0800 (PST)
Date:   Wed, 23 Feb 2022 22:01:57 -0600
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Ansuel Smith <ansuelsmth@gmail.com>
Cc:     Andy Gross <agross@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Taniya Das <tdas@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 14/16] dt-bindings: reset: add ipq8064 ce5 resets
Message-ID: <YhcDNW7Ylg1GRglG@builder.lan>
References: <20220217235703.26641-1-ansuelsmth@gmail.com>
 <20220217235703.26641-15-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220217235703.26641-15-ansuelsmth@gmail.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu 17 Feb 17:57 CST 2022, Ansuel Smith wrote:

> Add ipq8064 ce5 resets needed for CryptoEngine gcc driver.
> 

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

> Signed-off-by: Ansuel Smith <ansuelsmth@gmail.com>
> ---
>  include/dt-bindings/reset/qcom,gcc-ipq806x.h | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/include/dt-bindings/reset/qcom,gcc-ipq806x.h b/include/dt-bindings/reset/qcom,gcc-ipq806x.h
> index 26b6f9200620..020c9cf18751 100644
> --- a/include/dt-bindings/reset/qcom,gcc-ipq806x.h
> +++ b/include/dt-bindings/reset/qcom,gcc-ipq806x.h
> @@ -163,5 +163,10 @@
>  #define NSS_CAL_PRBS_RST_N_RESET			154
>  #define NSS_LCKDT_RST_N_RESET				155
>  #define NSS_SRDS_N_RESET				156
> +#define CRYPTO_ENG1_RESET				157
> +#define CRYPTO_ENG2_RESET				158
> +#define CRYPTO_ENG3_RESET				159
> +#define CRYPTO_ENG4_RESET				160
> +#define CRYPTO_AHB_RESET				161
>  
>  #endif
> -- 
> 2.34.1
> 
