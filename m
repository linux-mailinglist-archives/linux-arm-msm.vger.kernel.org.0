Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3F67770729B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 May 2023 21:54:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229937AbjEQTyO (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 17 May 2023 15:54:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39076 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230200AbjEQTyM (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 17 May 2023 15:54:12 -0400
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com [IPv6:2a00:1450:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5039A5B8E
        for <linux-arm-msm@vger.kernel.org>; Wed, 17 May 2023 12:53:52 -0700 (PDT)
Received: by mail-ej1-x629.google.com with SMTP id a640c23a62f3a-95fde138693so83322566b.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 17 May 2023 12:53:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684353231; x=1686945231;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=S1CrqsM6REqqjoJg43OXDGuz7NrBfq2XBbMd1jfiYc8=;
        b=nvFFiKYK8Inxz6gI7jNROeHfhT6g6NHZMY6a2hM/5cg9Sf84l/e8H0NbMLKIs47H+0
         8VJUQzEyaVkXOB/ua7avOI/uAS+bfgVuMYkQH6ULHDWqaTHHdnxpTTvx5zLxIbDB9yX6
         uUXe8WCWiaPDWdTIcxuAYYQXdXpYRgxP+BWGilbqkpk8k8fO6abnI0tzTv8mRdtDEg5T
         Ux8gjXK+vWlMTwZlcGjIPnfyZ6uq+fR7cVZzKnpXo27aUnD+y5iuCjXHEPjHDw2G47Vj
         Q+bg0DTGUYC7VBRn9krK3I8mtkpS4RIn/Q4A0BEZurur4dwUz6jcPrPk4lMFh+F+up3H
         aszQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684353231; x=1686945231;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=S1CrqsM6REqqjoJg43OXDGuz7NrBfq2XBbMd1jfiYc8=;
        b=gggrPiyy6IkVQ8T+6lBOj2GBhlQKE8d+nw95M+tK0q2QsxFoQJj6v5U7XHD3FUyWq/
         U9IxdG99EDP66QH8P4cIk8uL6yFJaozz5VPeLPIELP485psMUreOCsbp5m0W+mTqtMRj
         MQaTkncR67dD/Bz1JOtCANbV7Hdw8kOg8pQiGHF/gThej5tvLA9x15yIDnHo9NCPsz0H
         rX1n8IfxK7LbPZ/gXK4cX6a8QLhpmDiy2kX7nFCxId6LTLKH3Jaz2kqB7b21J5pSxYv7
         gbAV1OZcA9xqKEc2i/r+wV5nwCyC4MeT1h5XWy4WSkStohRnOx9KgETtWxzdexrUa8Bj
         lebA==
X-Gm-Message-State: AC+VfDxK49GAF28FjTguqvj6EE1bQvcATyNhlDkhHlkgbBs0sL2zOsHQ
        3xH3XOqcIESItQkvJKmwAV12UQ==
X-Google-Smtp-Source: ACHHUZ6seXg68qlaecH8kXGxgTC8MS1cd368+AF+wm8KhxoThOghaoWEMvs7Dt2XSDe4oDfE36cyfA==
X-Received: by 2002:a17:907:d24:b0:94a:4e86:31bc with SMTP id gn36-20020a1709070d2400b0094a4e8631bcmr3716917ejc.13.1684353230888;
        Wed, 17 May 2023 12:53:50 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:d7a:e7cc:21b3:c435? ([2a02:810d:15c0:828:d7a:e7cc:21b3:c435])
        by smtp.gmail.com with ESMTPSA id jj8-20020a170907984800b00965c7c93655sm12525855ejc.213.2023.05.17.12.53.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 May 2023 12:53:50 -0700 (PDT)
Message-ID: <8b2248e5-a89e-a296-8044-0dc552754f35@linaro.org>
Date:   Wed, 17 May 2023 21:53:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 2/3] dt-bindings: power: qcom,rpmpd: Format RPMh levels
 better
Content-Language: en-US
To:     Konrad Dybcio <konrad.dybcio@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc:     Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20230517-topic-kailua-rpmhpd-v1-0-cd3013d051a6@linaro.org>
 <20230517-topic-kailua-rpmhpd-v1-2-cd3013d051a6@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230517-topic-kailua-rpmhpd-v1-2-cd3013d051a6@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 17/05/2023 15:19, Konrad Dybcio wrote:
> After adding the missing levels with a nice, easy-to-read diff,
> reformat the defines to make them nice to look at..
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

