Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D68B85E8E9B
	for <lists+linux-arm-msm@lfdr.de>; Sat, 24 Sep 2022 18:51:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233791AbiIXQvo (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 24 Sep 2022 12:51:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56260 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233507AbiIXQvn (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 24 Sep 2022 12:51:43 -0400
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A4D8C5283F
        for <linux-arm-msm@vger.kernel.org>; Sat, 24 Sep 2022 09:51:41 -0700 (PDT)
Received: by mail-lf1-x135.google.com with SMTP id d42so4847085lfv.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 24 Sep 2022 09:51:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=gNYZXt17DV/TexDp3xUIxIPFrk7l1dxnMeGcWYpvKqc=;
        b=JNWiIDzI1b8sukTpns+Lk7aRagy1FgJ9qdsApmFw7kCKjKULcSd3II2b4295RHm+fs
         u4jVIsiUnYO7BMciotcDLM9bjeh4pMMuTY14i5VFQNV0mWLk8wgaenqMGdgKo/iWBXDJ
         Hi1yEHtdLkN8PzxCfQU8ijPetRANQN5VTRAUYmOyTeLMrlH5fp4J1YBI5ZoclLf/RioV
         PtamN7Pj19znhKOOy5yDx4n5SXaBR0OZ7C/Xu9z0XMbmoNdnNN0YNj6aUZYqOJHky9n0
         b+T48tKY+S0Ebz6B5Oq/hJn9G3groJf2uyJwxBzeQp7h2RUvp3qkP7Mr5F7SgxLycvlF
         VDNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=gNYZXt17DV/TexDp3xUIxIPFrk7l1dxnMeGcWYpvKqc=;
        b=pvEh2ZcCVwF414cokNRb3YB7bsHR+l5Pu7urPB4IgdoCUS+H0qk04xs+PxtHx6YlJ+
         ZSHETRc0Al0Cet39JFJ4vq9mlQDxz7jCDbHn+LUDYHVxgL+7eJ4cS46+D74gsEBwASOI
         h4a/reVnadspPI/W66rnl/TxNAffQf+YH1PMvDLZ7X9b7SC5yxij58CvI8pc38ONNxRM
         +AiH+htl/eemOu0hKJjSRnS09RytOr2kt0hr2u98omGfIQD2A4jUBfyrzcPgDFITXVxi
         Z6Uj1i0Cj/VddFo5riuobydNlrOJ/kXi9wXHwrhczbtM3pzjb3f8J7tF0981N5PV4gdl
         w07A==
X-Gm-Message-State: ACrzQf0MSEZnWtbWARSj19sNMSWaY8Nphhxz4v8e2otq3hkadWd8cRFr
        wnr1hsqx3TNppl1gdiIhleIB5A==
X-Google-Smtp-Source: AMsMyM5CHH/ZsNiW9lJ5OD7gJPm901E5o8Bx2ECC2tyQ1epDZOqy2PL/sJufViaObBxO3YpcKjiQ3g==
X-Received: by 2002:a05:6512:22ce:b0:497:499e:c966 with SMTP id g14-20020a05651222ce00b00497499ec966mr5231439lfu.402.1664038300021;
        Sat, 24 Sep 2022 09:51:40 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id s13-20020a05651c048d00b00262fae1ffe6sm1822913ljc.110.2022.09.24.09.51.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 24 Sep 2022 09:51:39 -0700 (PDT)
Message-ID: <a14ed141-4839-cf91-10fc-f4e03f969e0e@linaro.org>
Date:   Sat, 24 Sep 2022 18:51:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: Re: [PATCH] ARM: dts: qcom: fix node name for rpm-msg-ram
Content-Language: en-US
To:     Luca Weiss <luca@z3ntu.xyz>, linux-arm-msm@vger.kernel.org
Cc:     ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20220924145126.24978-1-luca@z3ntu.xyz>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220924145126.24978-1-luca@z3ntu.xyz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 24/09/2022 16:51, Luca Weiss wrote:
> Adjust the name to match the bindings and fix the following validation
> error:
> 
> <snip>/arch/arm/boot/dts/qcom-apq8026-huawei-sturgeon.dtb: memory@fc428000: $nodename:0: 'memory@fc428000' does not match '^sram(@.*)?'
>         From schema: <snip>/Documentation/devicetree/bindings/sram/sram.yaml


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

