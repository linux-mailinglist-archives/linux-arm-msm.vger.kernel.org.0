Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C358469A796
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Feb 2023 09:58:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229975AbjBQI57 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 17 Feb 2023 03:57:59 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33288 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229716AbjBQI56 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 17 Feb 2023 03:57:58 -0500
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com [IPv6:2a00:1450:4864:20::532])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 60136BB8A
        for <linux-arm-msm@vger.kernel.org>; Fri, 17 Feb 2023 00:57:54 -0800 (PST)
Received: by mail-ed1-x532.google.com with SMTP id v11so10371188edx.12
        for <linux-arm-msm@vger.kernel.org>; Fri, 17 Feb 2023 00:57:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JxmTPfEZSHv/qWrcZKvsN9uAVFNGcnCsPAcIEn+aGbM=;
        b=S3hhqXofYhKYklwyVx1ZiaQVV6VUVxQl+CNp6N2KHoO/UUbSNw+3Td5LP2oYASqzUE
         M7OAtXBpVInxsSayj23toB0vGa3eNd1R/CQzLMYehtOMXDEuBo+jRRWtYPdl3O3ymj68
         wYm5hr3vcVph1ZKGwrTvEzyWyqWU+0sH66QfQFNQ5nNNs3PNdXWT6Mnsh0c/A065HGBh
         HRXIN+ARWXjVn2pAjZRKGW7pfCQNiJlAeyPy7XkwY8NKMPUL2xL+YDZWiQEw9m4eW24e
         Bp2IAnTkMM6ZShPMQdvPc31wCddIrMcKmJiEhEQDYvqTObdVIhFFUpBQ5bxu+X2sU97g
         bIkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JxmTPfEZSHv/qWrcZKvsN9uAVFNGcnCsPAcIEn+aGbM=;
        b=41uvHahQQsTcu1Q4Fkf7i0ZbxNBzry7/VF9GWP0jp0XFdwu4SihlTiElB/4JTi7q45
         Q4EdoRsA2TPzoEdzGSo5Au4YrIOlTewBu1iJ8jOOiBn2h3pXc7gyipYgxdv9sk6ruADV
         nBzYRceC2CaJNz1nhJigV+BnxAcf+HpyDRLVi6jGknpWSqtcRmoIqDJJQ+1RWN+112LR
         WUY0icObYPa7IoXHd7+cGa6itwzJybWViYAtKvykNf9H/14GLyKD1XXsu3NQUloq2sbF
         iXvIiSbOeCCWpB7g1HES7LvPX1YOHgN87BPn3ZQ4mOrF0rhZ8zq+qJdiYuRYiu2Vdkhj
         GyWQ==
X-Gm-Message-State: AO0yUKWbi4SP42lbEcGKNBubw5RSO8F0s7kyjJNdZqYVxVEHWFoJFdiL
        lOVdnFAyGILsGoWpr5nbmFwgRA==
X-Google-Smtp-Source: AK7set9s6X9YCl0+Jv/Abcpk9KSI2ZLrpWThyt+bZQlD5CjypRTHefOM/EEsy2zJt587ycEEWaGNUQ==
X-Received: by 2002:a17:906:944b:b0:8b1:3ba8:3f4d with SMTP id z11-20020a170906944b00b008b13ba83f4dmr8436182ejx.70.1676624272837;
        Fri, 17 Feb 2023 00:57:52 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id jz19-20020a17090775f300b008b17cc28d3dsm993330ejc.20.2023.02.17.00.57.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Feb 2023 00:57:52 -0800 (PST)
Message-ID: <6217b51c-4982-8548-688d-8bfce97d3352@linaro.org>
Date:   Fri, 17 Feb 2023 09:57:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v10 05/10] dt-bindings: qcom-qce: Add new SoC compatible
 strings for Qualcomm QCE IP
Content-Language: en-US
To:     Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        Bhupesh Sharma <bhupesh.sharma@linaro.org>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Andy Gross <agross@kernel.org>,
        "David S. Miller" <davem@davemloft.net>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-crypto@vger.kernel.org,
        Neil Armstrong <neil.armstrong@linaro.org>
References: <20230216131430.3107308-1-vladimir.zapolskiy@linaro.org>
 <20230216131430.3107308-6-vladimir.zapolskiy@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230216131430.3107308-6-vladimir.zapolskiy@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 16/02/2023 14:14, Vladimir Zapolskiy wrote:
> Introduce a generic IP family compatible 'qcom,qce' and its two derivatives
> based on SoC names rather than on IP versions. Having a generic compatible
> is only partially sufficient, the QCE IP version can be discovered in
> runtime, however there are two known groups of QCE IP versions, which
> require different DT properties, these two groups are populated with SoC
> based compatibles known at the moment.
> 
> Keep the old compatibles 'qcom,crypto-v5.1' and 'qcom,crypto-v5.4' for
> backward compatibility of DTB ABI, but mark them as deprecated.
> 

As I asked at v9, please mention that you document already used v5.4
compatible. You do not "keep it", because it was never there in the binding.

Best regards,
Krzysztof

