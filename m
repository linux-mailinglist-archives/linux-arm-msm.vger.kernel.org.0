Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1E8A06E5A6C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Apr 2023 09:25:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231135AbjDRHZw (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 18 Apr 2023 03:25:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40684 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230502AbjDRHZu (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 18 Apr 2023 03:25:50 -0400
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com [IPv6:2a00:1450:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4CD60729B
        for <linux-arm-msm@vger.kernel.org>; Tue, 18 Apr 2023 00:25:23 -0700 (PDT)
Received: by mail-ej1-x62f.google.com with SMTP id c9so31849553ejz.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 18 Apr 2023 00:25:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1681802721; x=1684394721;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7jkgL+b5V4O44os5DC9KysOQHt9MZnyQJNFWvy+bd6E=;
        b=gqoE1qHWgHNCQJWiZ7BoM/UfHZ2jwJxGb/dgYzmzSaTGMrRDgbPLfvgTxyO+HkmmJe
         dhxqav4ZbR1di4ssH7fe1Cs2kcm2aKkj8QikRzmhPX8cxOWUbWKqd6K9YCHv+VvYenbC
         WckYdslW+ddFSAIn2hn8Z7PbAUX/BCIjRVy0AxOwHGMl4b2ZUiw3eI8CCaVvqmf1UVG6
         CWQiLmbUsTmp5VTl3gJP4HRH/1FdmEKBidwReMwu294kJy4/5gyQ+j8kXPRi1YdYs3Cl
         WmQ7GyfxRZABwl+5nv35GCtaCJnIDGYUpchSVbuUXUKekMHVYGPu1KbF+1F57sqhAjkC
         90ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681802721; x=1684394721;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7jkgL+b5V4O44os5DC9KysOQHt9MZnyQJNFWvy+bd6E=;
        b=TZkajf56COTEunO0d9+jnnBQigCg1hUkUq/IsfNZMqQs863uzOsd7APRB2PZJOvk4f
         nwfmiqgxnnyQ+MKkdR9stUCsR7zZ6Lv75KrYHlYzqNQdiDJVzw/SpTBwuocNs0I/NLPc
         Aw75IpEamCLH4Aia3N37tekagTBWXTJAsO0wcEor5ZAXBP5DXr3UQrj1Tlc8Y770BC7G
         mEmbwuD3GsosN4DseQjs6hbznzJBPbQLlv1ppm5l57ae4+r+pZIWwgzslZx2aWvgQpM8
         aCQEomEEWf1A8PzCPRU0uOyUjjGAGu37qZFkv60+yjdV4Tf/dkvQDqtZ2pbBxALadXeK
         p/aA==
X-Gm-Message-State: AAQBX9eF496WGgCG1K9ai0lX4lZ3LHXAJq/I1nIhGsdtcIVuby0IGLQy
        I3QwirngwTK/AKnIlELdphzZ4Q==
X-Google-Smtp-Source: AKy350YzWEKp2HO9rthm+fYXlQ8HuAQYeGnrRg4/J9AIF/xn6OfMA7UN0hhuA1+jHaEthWWA2XOjqA==
X-Received: by 2002:a17:906:3ed6:b0:94f:5847:8a8 with SMTP id d22-20020a1709063ed600b0094f584708a8mr6724532ejj.23.1681802721697;
        Tue, 18 Apr 2023 00:25:21 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:a276:7d35:5226:1c77? ([2a02:810d:15c0:828:a276:7d35:5226:1c77])
        by smtp.gmail.com with ESMTPSA id y15-20020a170906524f00b0094e1026bc66sm7810355ejm.140.2023.04.18.00.25.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Apr 2023 00:25:21 -0700 (PDT)
Message-ID: <081254ca-e583-db3d-d3fb-9b64d5f861f9@linaro.org>
Date:   Tue, 18 Apr 2023 09:25:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH V4 1/3] dt-bindings: sram: qcom,imem: Add Boot Stat region
 within IMEM
Content-Language: en-US
To:     Souradeep Chowdhury <quic_schowdhu@quicinc.com>,
        Andy Gross <agross@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>
Cc:     linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Sibi Sankar <quic_sibis@quicinc.com>,
        Rajendra Nayak <quic_rjendra@quicinc.com>
References: <cover.1681742910.git.quic_schowdhu@quicinc.com>
 <bd3350e3b0b02669cffa4bdaf9a0a1d8ae9072d1.1681742910.git.quic_schowdhu@quicinc.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <bd3350e3b0b02669cffa4bdaf9a0a1d8ae9072d1.1681742910.git.quic_schowdhu@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 17/04/2023 17:08, Souradeep Chowdhury wrote:
> All Qualcomm bootloaders log useful timestamp information related
> to bootloader stats in the IMEM region. Add the child node within
> IMEM for the boot stat region containing register address and
> compatible string.
> 
> Signed-off-by: Souradeep Chowdhury <quic_schowdhu@quicinc.com>

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

