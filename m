Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6118862457E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Nov 2022 16:19:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231436AbiKJPTn (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 10 Nov 2022 10:19:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37030 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231439AbiKJPTQ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 10 Nov 2022 10:19:16 -0500
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B2FF62EF78
        for <linux-arm-msm@vger.kernel.org>; Thu, 10 Nov 2022 07:18:48 -0800 (PST)
Received: by mail-lf1-x136.google.com with SMTP id g12so3883998lfh.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 10 Nov 2022 07:18:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=eFEEXIDHwjKXLyd70zU5amZbOu4MtludkFNwK7zJs6U=;
        b=fCHogmjHGZ4P12zTb5as/N2A23La+5BnkszxGG7bKiC7+bVY9AZaqZKrk6CnxNLmkQ
         g3XAeSodGULHj9+l3i0lTU1MjKe1O4AD0Rt6LTdLmV5EEZLLmvay7xvAdiGY75fGCmPp
         JEY38zDxhtixPsVzq6IvVSqUenxJe68I7xMkRXhbz0PhfxyMIC9sWbMcDta/lfSBN16v
         my56dh0egNalVt3LfeaWKeXUg+qpsYP6PUYaJicdCl5Za3tdEmvENBU/E4M82lUVHbbw
         8+p6MpfDPn6d8i9SApQcW+IoPA7DquRl5FBcVeJOGq0s/VRxA5snRuz+vpgBlCdRWPPn
         78Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=eFEEXIDHwjKXLyd70zU5amZbOu4MtludkFNwK7zJs6U=;
        b=pC+lrrUEuNo8+Flml7yQWUB6DbDPTHJ0cmnNnlUOVg4yZ7oQ6uRFWKdLW93lnGSShA
         CgWrrqzRU8550t94MRMcGv1Zy+gk2K3hr1d93FEwscvQR2vT6mBsY31ceOit0Gx6jJxL
         oU8dM+heOBAOCLQEMTZ/vxCjPbxU6h9GhEOvHpN/c0MG62LC8/plbOtzpSzfokFwKpJf
         5vbm6vnLO+LS3+Ou3Xd63Y0jgSq/Qe8ikPohNnBVokmOG6/WgYsdowy4kpKnDymaWBqo
         CffzIeju2N2s9OnVB2b7P95bSnOI9NR0Q2fnYNaL71RC8xbDwKPb2xLwZnIEngVXViPd
         BoYg==
X-Gm-Message-State: ANoB5pmM8i3jCJLRcK2uQJaFaFQUUKszFxsBRKQVXXxeAjPsy3gtwW4c
        JmVbqOeTHbO2YeJxbA5xlyMmkA==
X-Google-Smtp-Source: AA0mqf5s3CZi9HZimurexystHtK8Dfa0q3xU/K9pQ5fgCBYdq6uFLSqudJosKqKUqLfGPJ6b5Dz5kg==
X-Received: by 2002:a19:8c1e:0:b0:4aa:c23e:dcb with SMTP id o30-20020a198c1e000000b004aac23e0dcbmr6031010lfd.410.1668093526421;
        Thu, 10 Nov 2022 07:18:46 -0800 (PST)
Received: from [192.168.0.20] (088156142199.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.199])
        by smtp.gmail.com with ESMTPSA id p9-20020a056512234900b004a46f92a15bsm2790589lfu.41.2022.11.10.07.18.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Nov 2022 07:18:44 -0800 (PST)
Message-ID: <bfa39bcc-ac81-e47b-11f3-5b600a8a5ac3@linaro.org>
Date:   Thu, 10 Nov 2022 16:18:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v7 1/4] dt-bindings: phy: qcom,*-qmp-ufs-phy: add
 clock-cells property
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Philipp Zabel <p.zabel@pengutronix.de>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org
References: <20221110151748.795767-1-dmitry.baryshkov@linaro.org>
 <20221110151748.795767-2-dmitry.baryshkov@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221110151748.795767-2-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 10/11/2022 16:17, Dmitry Baryshkov wrote:
> Add #clock-cells property to the QMP UFS PHYs to describe them as clock
> providers. The QMP PHY provides rx and tx symbol clocks for the GCC.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  .../devicetree/bindings/phy/qcom,msm8996-qmp-ufs-phy.yaml      | 3 +++
>  .../devicetree/bindings/phy/qcom,sc8280xp-qmp-ufs-phy.yaml     | 3 


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

