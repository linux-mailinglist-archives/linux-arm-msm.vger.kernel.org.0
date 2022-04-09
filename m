Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EB79B4FA979
	for <lists+linux-arm-msm@lfdr.de>; Sat,  9 Apr 2022 18:26:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242585AbiDIQ2F (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 9 Apr 2022 12:28:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37722 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232701AbiDIQ2E (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 9 Apr 2022 12:28:04 -0400
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com [IPv6:2a00:1450:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 56C423EBAD
        for <linux-arm-msm@vger.kernel.org>; Sat,  9 Apr 2022 09:25:56 -0700 (PDT)
Received: by mail-ej1-x62b.google.com with SMTP id k23so22883641ejd.3
        for <linux-arm-msm@vger.kernel.org>; Sat, 09 Apr 2022 09:25:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=EQSwR7QanYSaJAzWNCqeAe6R2n+cXNhVnYOQMnz5UoY=;
        b=jp4aMjRkaftf/a9ytETy1kGs7QnFvvDYaJFNDfhds2rNYQIqPoykF6Ahz+3uG7XQlz
         DBH8W3Q2KPjgDtHslh0CsWrmN4UMdfQQHVYZEfGg/HGiQO63+IRS7bPaVue3NegsQwtl
         3QAao+M2UFdTf2aMpPSlRS4TLX+cCdMzHe5EsuXoGCyDbVl3UjMPggUPD/Wfgp5bcScu
         T/2pKA5tU0ZaMrn43BqvaWkV/JCWO7wctbpC17aT/FdpWd4ow3AJTSoCjq97i+aEkgTt
         qkCmFf2Xx69Gu7qVhuSeeoNgbDT2ZlGjQBe2wNSHy7hTCsHct/It60lzOC5xT4MaIqsL
         Z5Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=EQSwR7QanYSaJAzWNCqeAe6R2n+cXNhVnYOQMnz5UoY=;
        b=BhVuO3VAOnfIhAnLiCprMVVEfmcqu5vzAkxxaSCJrOlY9Qxr6bkXlZCzKaVCKvLXrr
         8vJrAgCJViUgmKNAmBIVOeFzpijaP23E8GI/dMN6qDKAaYcmlA8DhR/qIDbe6uxZO78d
         7vX3h/zBttWnsTCbfQMH33715ICg9QmZuq3n0UVnJQPJ2BnDAErpv4z7VpXa4ydwoyA+
         PdZae8szIwH8aXYt7BWOtF3663bO190FQMSiWLLvp6EETfLtbqksdaxtHfQkQgzaz1Ic
         740KMHwgRGg2EsjUk6OhkT8giWAyqq8FbwtZdb4M5leK3b8pd3WHqZvaaTYOCharwnP5
         KXcg==
X-Gm-Message-State: AOAM530Unu7kljE8th6VaThNmDWVA96UAvzgzgq65ZyzYOXYPlzozQU1
        BlDw6RGXxpHx5Q4lklg9anzn7A==
X-Google-Smtp-Source: ABdhPJyMKsGM5vFbWpvCpI9xV6zqdiaFCdcADKK9S/5OIVr1SV32qzYZPI1q3iSWJza0kGZSuDsmlw==
X-Received: by 2002:a17:907:97c7:b0:6e0:defd:342d with SMTP id js7-20020a17090797c700b006e0defd342dmr23201073ejc.231.1649521554991;
        Sat, 09 Apr 2022 09:25:54 -0700 (PDT)
Received: from [192.168.0.188] (xdsl-188-155-201-27.adslplus.ch. [188.155.201.27])
        by smtp.gmail.com with ESMTPSA id o3-20020aa7dd43000000b00419db53ae65sm11983482edw.7.2022.04.09.09.25.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 09 Apr 2022 09:25:54 -0700 (PDT)
Message-ID: <b0b62e41-daa2-ca9d-f580-3e298effdf40@linaro.org>
Date:   Sat, 9 Apr 2022 18:25:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH 1/3] dt-bindings: arm: msm: Add sc8180x and sc8280xp LLCC
 compatibles
Content-Language: en-US
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Sai Prakash Ranjan <quic_saipraka@quicinc.com>
Cc:     devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
References: <20220408213336.581661-1-bjorn.andersson@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220408213336.581661-1-bjorn.andersson@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 08/04/2022 23:33, Bjorn Andersson wrote:
> Add compatibles for the SC8180X and SC8280XP platforms to the existing
> LLCC binding.
> 
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---
>  Documentation/devicetree/bindings/arm/msm/qcom,llcc.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof
