Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AB5E8723722
	for <lists+linux-arm-msm@lfdr.de>; Tue,  6 Jun 2023 08:05:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230499AbjFFGFj (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 6 Jun 2023 02:05:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54572 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231534AbjFFGFa (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 6 Jun 2023 02:05:30 -0400
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com [IPv6:2a00:1450:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 57F8710E2
        for <linux-arm-msm@vger.kernel.org>; Mon,  5 Jun 2023 23:05:00 -0700 (PDT)
Received: by mail-ej1-x62e.google.com with SMTP id a640c23a62f3a-974f4897d87so590126466b.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 05 Jun 2023 23:05:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686031498; x=1688623498;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=L9h6iIn8tVMxDio3DDyTS9fJwTAuNwCTFgsK9pHhOlo=;
        b=btZtmzTuI4MLVs+fYn14ZcCdRVIabbztQnAttPga6eE3e+r43+2jhik4nZnxAyehEG
         +hlXK6+pEhMvIFYsHSTZCgPFq3n72lrHIly4TuYWRIkg9fccQf6GPBkki/fwy2nfFR1L
         6id2R6puXXqyzQzZ8EiugsDJugS7MHcJH4BrPNgQu90oqnaD6hEOBDiTA4FYzNcFGDu1
         zf70oJbrRdcGt8pjU9BiqwR2lhWO1V6IuMbWVrV3avFSOnqeHZ8ltbic9kmjm6trqLlW
         HjrEwPcwF2LVilPS0yN30RFKcCGs/WvQF/yCw56++zcMJf8M7L3+CpWofZ8Ie+jtIk8A
         y4KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686031498; x=1688623498;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=L9h6iIn8tVMxDio3DDyTS9fJwTAuNwCTFgsK9pHhOlo=;
        b=HRp1ePePid6odwPdO/ebarfFu40fj1h2Nx/BWTdJXMDsP11oJ9656G14H2UiqzB2fA
         +KrQdxM1NGtkd0Edat1D4sXXUjHANqWUqJhfsNSofs9MZX89R04lRSTuZiPDkTKSwdM/
         YNmwyB/cjD8O3Oz1qyQjke8ounpk684mU4YUeT13U0wJxwtk/gXnmblG7Zsr44Zku8/9
         OVokw46/pYXmKTH1q91uxKhXWQ0vcrYh6CkXySWwk2AgsGintvtffV4gsCMyzUd8bgoi
         BS8r6VXJgsmZtym4uL2hqBy30RH5Dt4GWGcLD4Lu3DxMPzj+3fY8fjiQTgUUXg8pZcM0
         Lykw==
X-Gm-Message-State: AC+VfDzud0rOSvOEWIJY1IeVBujLBxWkY9PnmXjf+cVDzt5CTdc4fGDe
        tBUJLHT0U9ow/D72UMBSjadp3Q==
X-Google-Smtp-Source: ACHHUZ4HwHDNxVn79sHOEZUVTLCrNDJeMg/HIqnfWkb9LuwZmOx7L2932vKhcn3a/Rnq71N5KvWdwQ==
X-Received: by 2002:a17:907:8a0a:b0:969:fc68:fa9a with SMTP id sc10-20020a1709078a0a00b00969fc68fa9amr1224348ejc.40.1686031498531;
        Mon, 05 Jun 2023 23:04:58 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.26])
        by smtp.gmail.com with ESMTPSA id ks2-20020a170906f84200b009534211cc97sm5123968ejb.159.2023.06.05.23.04.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 Jun 2023 23:04:58 -0700 (PDT)
Message-ID: <99873cd6-b9d7-8d3c-323e-9711315a67dc@linaro.org>
Date:   Tue, 6 Jun 2023 08:04:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: [PATCH v2 05/10] dt-bindings: cpufreq: cpufreq-qcom-hw: Add SDX75
 compatible
To:     Rohit Agarwal <quic_rohiagar@quicinc.com>, agross@kernel.org,
        andersson@kernel.org, konrad.dybcio@linaro.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
        rafael@kernel.org, viresh.kumar@linaro.org, tglx@linutronix.de,
        maz@kernel.org, will@kernel.org, robin.murphy@arm.com,
        joro@8bytes.org, mani@kernel.org, robimarko@gmail.com
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev
References: <1685982557-28326-1-git-send-email-quic_rohiagar@quicinc.com>
 <1685982557-28326-6-git-send-email-quic_rohiagar@quicinc.com>
Content-Language: en-US
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <1685982557-28326-6-git-send-email-quic_rohiagar@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 05/06/2023 18:29, Rohit Agarwal wrote:
> Add compatible for EPSS CPUFREQ-HW on SDX75.
> 
> Signed-off-by: Rohit Agarwal <quic_rohiagar@quicinc.com>
> ---
>  Documentation/devicetree/bindings/cpufreq/cpufreq-qcom-hw.yaml | 1 +
>  1 file changed, 1 insertion(+)


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

