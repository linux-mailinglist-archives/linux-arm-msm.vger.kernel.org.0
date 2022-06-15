Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 896EA54D3DC
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Jun 2022 23:40:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244325AbiFOVkl (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 15 Jun 2022 17:40:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33410 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235490AbiFOVkl (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 15 Jun 2022 17:40:41 -0400
Received: from mail-pg1-x52f.google.com (mail-pg1-x52f.google.com [IPv6:2607:f8b0:4864:20::52f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 21FDD3A71E
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Jun 2022 14:40:40 -0700 (PDT)
Received: by mail-pg1-x52f.google.com with SMTP id 129so12571090pgc.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Jun 2022 14:40:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=E9ERFJfmycetiewLsnmPEUf5XGwsEH0WUvIwEqLk+7s=;
        b=ttJN/MGyhYY6DGazXaoQqpX+PSl81iONtGWiRVGGyQJycYL5aAU4x+kKpmRyu0Hsjp
         fcUFQA9DPiXWusNHCI5SwF7dtfoq27GhyKYZVRwPUVp0xl9q2wR7jB5Y5OhdoBwYwmVg
         s2pkhk/gEkd1GpbOqbgtWYk1Y6TGaibyIW9ZhgaDSO0cHHwqTQbYZkQpPxW756AFy3Y+
         7Px/hNO31Ei4BRE9FubcBHP9lSEuAUgIkR83rVGTvBbF/pB/TUng+UFCC5DxawNkXYP2
         /U2tvrhwk6VncuD77fjMrRKzkv2Yv5n9YnSw3j/nKRVKCCo9yCyqJoyc4A7yFKm1wR5z
         kmGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=E9ERFJfmycetiewLsnmPEUf5XGwsEH0WUvIwEqLk+7s=;
        b=0zOgRo7SqgQavA5W2gs//gSgl+m9Iwy9nSSFagPU68UbxZAUYJA3OTq0+QOPP+ZcTl
         bfzWsd5KpGFKIURewROoNCFqj/j4vshqQyQQ21CKKiFknanMZi/KF6bo41V8z8c4ynMW
         FCAFAC8u2qYL2JZaRd8Xj4/sW0LvU6x3EgdtEBUKyMVj8Pd5mwCGscQ2g8JpHF9esiHT
         EA+bEz51SvgS/M2QLFlUKFwOyM8XNXZNkYwfBScv3EwQ3ftMuiSfoH2jTeIXjs5RkR7J
         eGbxJ4GUw++NF9oyOZ1e2ac2Ns5ktApyK4uy0eBdvvtxSdn2vGGpCHeKANA+hL+YEPiJ
         DJbA==
X-Gm-Message-State: AJIora/64GN7hhsclOzObjFblTpQAvKNcE60Bcc8E9PXOZuujpMmHUS6
        P8cCAYzDQ4PUXSOjyyX8EDR/jw==
X-Google-Smtp-Source: AGRyM1sMKXkKuZQnP6khsj5hB3YYQDGwcOOc6pFBBPKzk2thLFoH4KcLdt7LufAaCkTq/ji06lSuFw==
X-Received: by 2002:a63:fe49:0:b0:408:9928:44da with SMTP id x9-20020a63fe49000000b00408992844damr1516490pgj.373.1655329239625;
        Wed, 15 Jun 2022 14:40:39 -0700 (PDT)
Received: from google.com ([192.77.111.2])
        by smtp.gmail.com with ESMTPSA id s17-20020a17090a5d1100b001e0d4169365sm2330350pji.17.2022.06.15.14.40.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jun 2022 14:40:38 -0700 (PDT)
Date:   Wed, 15 Jun 2022 22:40:36 +0100
From:   Lee Jones <lee.jones@linaro.org>
To:     Caleb Connolly <caleb.connolly@linaro.org>
Cc:     Jonathan Cameron <jic23@kernel.org>,
        Lars-Peter Clausen <lars@metafoo.de>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>, linux-iio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Jami Kettunen <jami.kettunen@somainline.org>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH v14 03/10] mfd: qcom-spmi-pmic: read fab id on supported
 PMICs
Message-ID: <YqpR1FmubmQPHzXV@google.com>
References: <20220429220904.137297-1-caleb.connolly@linaro.org>
 <20220429220904.137297-4-caleb.connolly@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220429220904.137297-4-caleb.connolly@linaro.org>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, 29 Apr 2022, Caleb Connolly wrote:

> The PMI8998 and PM660 expose the fab_id, this is needed by drivers like
> the RRADC to calibrate ADC values.
> 
> Signed-off-by: Caleb Connolly <caleb.connolly@linaro.org>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Tested-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  drivers/mfd/qcom-spmi-pmic.c      | 7 +++++++
>  include/soc/qcom/qcom-spmi-pmic.h | 1 +
>  2 files changed, 8 insertions(+)

Acked-by: Lee Jones <lee.jones@linaro.org>

-- 
Lee Jones [李琼斯]
Principal Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
