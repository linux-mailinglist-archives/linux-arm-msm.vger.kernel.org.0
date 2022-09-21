Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 071665E53B0
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Sep 2022 21:18:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230020AbiIUTSQ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 21 Sep 2022 15:18:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57922 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229828AbiIUTSO (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 21 Sep 2022 15:18:14 -0400
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 541C190C44
        for <linux-arm-msm@vger.kernel.org>; Wed, 21 Sep 2022 12:18:13 -0700 (PDT)
Received: by mail-lf1-x12b.google.com with SMTP id a3so10840167lfk.9
        for <linux-arm-msm@vger.kernel.org>; Wed, 21 Sep 2022 12:18:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=j7Zzskc2rhkyZt4aqWcee91EDVAwF85JPaMAbyfab3Q=;
        b=Mhx8OwegiP6Jv0hMBn8Y4RWNWr0LVYQ32+KIyYLk1RJWq2KBq2Mk4lk1USxlERFZIW
         NEFus+5qn33Rf/D13z+fy50CZrm6onl+1DYRLTHZdqo0Xq0L1IqGoJCghDE+gUZNU6bX
         W+Lzl1WRkmIkcQVa8Xoh7eJ/9Qp3qmjj3JlCQ5aYwqgRbsOsbgnErp/RgfgOm2/3sB9q
         O87Shl/IEKEQKkfp54oqeP1Kb2ZVCM6hgZaCFQUUVIiCfjGvpze54xE0CaM/oXKOPC6V
         4JuBjShKyXo+WulWpCzCc1bCIWql5ijD9JGklxjn8eI1mk0AGsAGQFeIzHklFhMvc+vh
         b6sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=j7Zzskc2rhkyZt4aqWcee91EDVAwF85JPaMAbyfab3Q=;
        b=JceQ24Xl+WKy+A6JVtZGcVXH327Tc1pAecifbXvwjgOPfQLDtSHn3i5nl/fNMhsy1L
         RrcXg+C+tgQlWFtkfW3eduuULpzKBvawUrdR6LnuCIoUsiaz+76Dq+K6ORgWfjJTXRit
         iv9U7E0hnBZQgwOJeRdr5qa50xnwtb55srUH9mzDdEdyeEGVioIASXge1j6gqAPf36Gs
         Zhc3eklB2iiQcbQnh9wavA9Teh3JoccISq93E6HY/lfz5A8B3gwCPWI4qc3WLtFURbuW
         DT6oSsGdsH7/vBOYPYW0vEPn4ImiWjnuTYV48bqTw6sRfaYBxSo3L3eh6hv2KnZ6Wimy
         tLtA==
X-Gm-Message-State: ACrzQf0+GplZUGM0Aim9whYKOWrJzAUm9ZmZ/wqv1DfMJJnQk8FrQpNl
        alyxEEWh+OBNdodejbIvIhSJqg==
X-Google-Smtp-Source: AMsMyM79FUTqb3FH+w/AQyWA76aHLgd9cF6t83YWs9qLpGlQ1PFAP5b5BleFg8D2meqIKEtclShxPA==
X-Received: by 2002:a05:6512:11c8:b0:497:c19e:c709 with SMTP id h8-20020a05651211c800b00497c19ec709mr11719279lfr.152.1663787891679;
        Wed, 21 Sep 2022 12:18:11 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id j12-20020a056512344c00b00494a1b242dasm567177lfr.14.2022.09.21.12.18.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Sep 2022 12:18:11 -0700 (PDT)
Message-ID: <e4e2b3a5-cbf9-86a6-681a-8089d4e22cbc@linaro.org>
Date:   Wed, 21 Sep 2022 21:18:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH v4 4/4] dt-bindings: remoteproc: qcom: wcnss: Add
 compatible for pronto v3
Content-Language: en-US
To:     Sireesh Kodali <sireeshkodali1@gmail.com>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht, linux-kernel@vger.kernel.org
Cc:     andersson@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh+dt@kernel.org>
References: <20220921043648.2152725-1-sireeshkodali1@gmail.com>
 <20220921043648.2152725-5-sireeshkodali1@gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220921043648.2152725-5-sireeshkodali1@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-5.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 21/09/2022 06:36, Sireesh Kodali wrote:
> The pronto v3 remoteproc is similar to pronto v2. It is found on the
> MSM8953 platform, which is used by SDM450, SDM625, SDM626, APQ8053 and
> other SoCs. Since the configuration is same on all SoCs, a single
> compatible is used.
> 


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

