Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0D40F5F9D16
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Oct 2022 12:53:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231520AbiJJKxc (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 10 Oct 2022 06:53:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50678 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231352AbiJJKxb (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 10 Oct 2022 06:53:31 -0400
Received: from mail-qt1-x832.google.com (mail-qt1-x832.google.com [IPv6:2607:f8b0:4864:20::832])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C33E06CF47
        for <linux-arm-msm@vger.kernel.org>; Mon, 10 Oct 2022 03:53:25 -0700 (PDT)
Received: by mail-qt1-x832.google.com with SMTP id s21so6232397qtx.6
        for <linux-arm-msm@vger.kernel.org>; Mon, 10 Oct 2022 03:53:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Xy8fpuJt/D/8e5m3HaubX+n0ipc5LUz+M1CWldAwem8=;
        b=dcwn1cJibO5t54SdJbBHVWJQbT9zl/+4qG1/f6YDDPNRuPnKTXLZUvWLp2EFWeXb0t
         szYTjLx4UzlQX2Oc8mvvHnrd3OadmR2xWbioR8+hj5JHWyKQubEUoHqsFFJKYvuCtyME
         xG2pXJvZCPS2j/1wkSLqHDs+5+vyb8ZNHLVtXuujcxibSGKQGPpqQgiRcspp62FunueO
         kmQn70OJPI73qw/Py/lVmC91Y1I0LyYqjUQy3sRl75tF4D7pgW3NyizFcyI6CLnFv2YY
         9VfGQC+P17vHQcKUtFq8vUNU5q8WzL+g2JWlfQd8HTNoX3acKmFGhiZtGVKqqyMlA4vF
         VLUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Xy8fpuJt/D/8e5m3HaubX+n0ipc5LUz+M1CWldAwem8=;
        b=CjXfZty+Br+wPxgJWLVSOyI8nrXydPnX0Fx2yDhuyOP+LrIvOMl85MsSFHmG+M8ocV
         j0PZPeYFA65NnwckV3jmXB1EKq5au/0Du1F+EVK8qxWS4mnE3fkGANKKY+qCp+fmr9vx
         Tx1JwUj8GBceeJ67nSfLQLAq9ttFbspTD6DKar93OXrCBHOofoO/iZkFQKnLWeACNW3X
         /Mdzc5k6n+vGXLmmwbL2HIcyH/Is3KKvGceQZSgvlxRTBn+mtTyslgzKU2ipDqHWrzh3
         b0E0ah5jbVN0JP5VJHz6YxFmTjVMC90MygcpNNdT0hW3YYKk8p0d896Uy3yK+qQf0G0V
         KVVg==
X-Gm-Message-State: ACrzQf3yHNtUaUJPp+vdy46ShEMyxYBp5EQNh9b4bBR7QIzNJboeTNTD
        tYbHpYic4MSd/kta29rPtk0U4g==
X-Google-Smtp-Source: AMsMyM54r0khL+4+D0zYWzbopmWTAikc4uAyv6IhhRY1Z5b5hpVemd6zRKw34dqbW+2yi6IFN+nT3Q==
X-Received: by 2002:a05:622a:1002:b0:35b:baaf:24bb with SMTP id d2-20020a05622a100200b0035bbaaf24bbmr14306304qte.85.1665399204993;
        Mon, 10 Oct 2022 03:53:24 -0700 (PDT)
Received: from [192.168.1.57] (cpe-72-225-192-120.nyc.res.rr.com. [72.225.192.120])
        by smtp.gmail.com with ESMTPSA id u11-20020a05622a010b00b0039014fd4b9bsm3999395qtw.47.2022.10.10.03.53.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Oct 2022 03:53:24 -0700 (PDT)
Message-ID: <2b3c9151-6dde-1be1-07a8-0ad3d616a259@linaro.org>
Date:   Mon, 10 Oct 2022 06:51:12 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH v3 2/2] dt-bindings: remoteproc: qcom: adsp: Add ADSP on
 MSM8953
Content-Language: en-US
To:     Sireesh Kodali <sireeshkodali1@gmail.com>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht, linux-kernel@vger.kernel.org
Cc:     andersson@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        dmitry.baryshkov@linaro.org, Andy Gross <agross@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>
References: <20221008174658.336470-1-sireeshkodali1@gmail.com>
 <20221008174658.336470-3-sireeshkodali1@gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221008174658.336470-3-sireeshkodali1@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 08/10/2022 13:46, Sireesh Kodali wrote:
> Add support for booting the Audio DSP on the MSM8953 platform. This is
> used by SoCs like SDM450, SDM625, SDM626, APQ8053, etc. Since the
> configuration is the same on all SoCs, a single compatible string is
> used.
> 
> Signed-off-by: Sireesh Kodali <sireeshkodali1@gmail.com>


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

