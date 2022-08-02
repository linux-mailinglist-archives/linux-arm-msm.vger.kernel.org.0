Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 19137587AE1
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Aug 2022 12:42:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235915AbiHBKmU (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 2 Aug 2022 06:42:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48608 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236007AbiHBKmT (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 2 Aug 2022 06:42:19 -0400
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D9E01237EF
        for <linux-arm-msm@vger.kernel.org>; Tue,  2 Aug 2022 03:42:17 -0700 (PDT)
Received: by mail-lf1-x12a.google.com with SMTP id w15so21293426lft.11
        for <linux-arm-msm@vger.kernel.org>; Tue, 02 Aug 2022 03:42:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=bY01tj6bhjnSTa66elueqqLsj2KRUTIqIMSukoZtaQw=;
        b=a97TlgH47l/AS1nGVT0AYrCAVcEpLmIYQA9LhyxAHRkzibg3GpsAOJx5hzcHKYfUfL
         6zB2NUYACfU03NVqP6Ntiz4BU4+B2udhaR5dbWaiWA5V/H3zip9Pn+Yp2J59l3RDg+Bg
         Op4SqldumjC7042bHpyzVuiGzytgjuJ1M6ZlthX+4E6r9wG6fcdl/nFmnppvCKeJM/1W
         vxQMG1wnfIRjV3b2n+TfDD6lMDCfC47Hd/HUk+QmbdowrJ4OZamhF4rC4ojoq8nvn70d
         8Nw7kK55+P+vf9G7+xJvERRNbngclROd5qzHxn9tgJIGq90HyT8fUa9GqR+1LeT6Ha7l
         Dpdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=bY01tj6bhjnSTa66elueqqLsj2KRUTIqIMSukoZtaQw=;
        b=dAalbux8fCte5zr2eg60Gb90rt+9dra+Gx9b3zheN1hOjp+6QYKezvESl9wAxKFwgF
         hiYk2AICmIq7w8ILQNrQc22ncHEs98aVXcGoaNttBmN2mlssmw0rFQF2nwAI6zJo4i+q
         ONteiyOexk2CZ+YsCo50vyq/P898pytlmmT/E6+2QvgwBCchL0ScfhKtBa9uJFrSbz19
         PT94CYIizoTxusoETBottenMR5esLL7VVGiSfynpuBf18i/yB28N4pPziagadaCTjYia
         IobnLSfo7uktVLNJDs3MQWtnB+BWgEAvW24Ay0Sd+zZ9Myog/kiiyxim64jjaHsPXQTf
         TY4w==
X-Gm-Message-State: ACgBeo0jDhQlDbJ03K589VPQmPrR0a59EyBCtqE9G45M8nbispRAr4AR
        gxgwGWso2wBpJ1tFG8N//k3nfA==
X-Google-Smtp-Source: AGRyM1tvktEOKcMN0kcHboburZYkTpFq6B9HgJK5w2AHNVauLf3Qm2ECohk0A9nW1L0PEfCOJt/r9g==
X-Received: by 2002:a05:6512:10c1:b0:48a:b8cb:ef2d with SMTP id k1-20020a05651210c100b0048ab8cbef2dmr6884441lfg.384.1659436936306;
        Tue, 02 Aug 2022 03:42:16 -0700 (PDT)
Received: from [192.168.1.6] ([213.161.169.44])
        by smtp.gmail.com with ESMTPSA id v8-20020a2ea448000000b0025e2c5a12b6sm1884264ljn.129.2022.08.02.03.42.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 Aug 2022 03:42:15 -0700 (PDT)
Message-ID: <e40e808c-94e7-395c-459b-d2b6428ba2fa@linaro.org>
Date:   Tue, 2 Aug 2022 12:42:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH v3 03/13] dt-bindings: regulator: qcom_smd: Sort
 compatibles alphabetically
Content-Language: en-US
To:     Iskren Chernev <iskren.chernev@gmail.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Mark Brown <broonie@kernel.org>
Cc:     Andy Gross <agross@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Robert Marko <robimarko@gmail.com>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht
References: <20220731223736.1036286-1-iskren.chernev@gmail.com>
 <20220731223736.1036286-4-iskren.chernev@gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220731223736.1036286-4-iskren.chernev@gmail.com>
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

On 01/08/2022 00:37, Iskren Chernev wrote:
> Sort compatible strings and their descriptions by PMIC-name in alphabetical
> order.
> 
> Signed-off-by: Iskren Chernev <iskren.chernev@gmail.com>


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof
