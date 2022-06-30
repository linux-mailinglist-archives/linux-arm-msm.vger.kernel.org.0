Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3F85C562284
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Jun 2022 21:03:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236785AbiF3TDL (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 30 Jun 2022 15:03:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41280 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236790AbiF3TDK (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 30 Jun 2022 15:03:10 -0400
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com [IPv6:2a00:1450:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A24E913E28
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jun 2022 12:03:09 -0700 (PDT)
Received: by mail-ej1-x631.google.com with SMTP id h23so40718471ejj.12
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jun 2022 12:03:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=GpKJCo0z+0F48dHPgWjsxiLcXHO5Rv5PyoIecr+e2rs=;
        b=MccCW8dY7vG3xhtvzfyIfsmly5wO9Bj3r/786LZlsTGJG1KtSTawNyUDha23FOPdbt
         in321vPuFvG5p140Q3D+gRkJQIESxX/qIta4M+mYf5Xs2RUmXsaBoclV/MK7CAbYewtc
         tgKHKVu9cpUg+dV3bSHaLQdx1Nfmzu088v5fqh/+I8Dil02llhQyd4F824GEa/1UeqZ8
         aI85iC0P+64xOSKC9i5kStuzFf6bVycus9GZo7SbUY76978kgcdxbTdxw4jXVdZprPTt
         KXBVgQi+KLoL/eCP90eaIW4rOQWYYx4hRVwq1xQkiFq6R6fgtks2QviX1VowECBbr2Xd
         q49Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=GpKJCo0z+0F48dHPgWjsxiLcXHO5Rv5PyoIecr+e2rs=;
        b=7l0ybSbZeKx1bOhq6TEf8na+nr0hk+bnM/vXOh2nWbhWFwh/Kuxi46aDl5KmJ5CLSo
         Uc4Sq83+MAYzLLJ7gOa3PJpAzQ20ajiXwsApZl8FixA417dvMPklqI2drFTEJZ1Is6MX
         XdGnk+OuFqtj1K6REw1vw5QKWeGuKUMcak+QOCrOKjERLDxbKpvhuRKUbYFa7aBZ+Vv4
         gVUsKKrRtKCzQwGOW2n5H3UGIiuURGTRLWt/qQonyYrDHm6owysyWxywKQcqFfb3LCu7
         VFNuYyuT/dCXugVEZYiR694g0sGK9wPhwQh4733I75OQac8nLrI9aqKj8BYer9+65Uhj
         lloA==
X-Gm-Message-State: AJIora+vMiPgDctx7j6VZ/jEqckfKcT85y0MGaV8TXMixIl1mUJUxa6Z
        zN8iQXHJ+30h1RlVyDacEY5imQ==
X-Google-Smtp-Source: AGRyM1so7aTmcV3aL5Tj0v8g4vOpq7WUBZK6Lcz/cmcmwzkaTjOH+yON1rQFOa6/2xM9DqNP+6+aiw==
X-Received: by 2002:a17:906:4f:b0:712:af2:29d9 with SMTP id 15-20020a170906004f00b007120af229d9mr10490071ejg.751.1656615788289;
        Thu, 30 Jun 2022 12:03:08 -0700 (PDT)
Received: from [192.168.0.190] (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id d10-20020a056402400a00b004357ab9cfb1sm13692392eda.26.2022.06.30.12.03.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Jun 2022 12:03:07 -0700 (PDT)
Message-ID: <b0a2686f-2749-1269-4855-0f889dfd056b@linaro.org>
Date:   Thu, 30 Jun 2022 21:03:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH 4/7] dt-bindings: msm: dsi: Add vdd* descriptions back in
Content-Language: en-US
To:     Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        robdclark@gmail.com, quic_abhinavk@quicinc.com, sean@poorly.run,
        airlied@linux.ie, daniel@ffwll.ch, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org
Cc:     quic_mkrishn@quicinc.com, swboyd@chromium.org,
        bjorn.andersson@linaro.org, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org
References: <20220630120845.3356144-1-bryan.odonoghue@linaro.org>
 <20220630120845.3356144-5-bryan.odonoghue@linaro.org>
 <9BCE52A8-E26D-43A0-86D2-90DFE6CB6C62@linaro.org>
 <d177d650-0c61-0ae0-17bb-9d4311582652@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <d177d650-0c61-0ae0-17bb-9d4311582652@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 30/06/2022 19:30, Bryan O'Donoghue wrote:
> On 30/06/2022 18:16, Dmitry Baryshkov wrote:
>>
>> All three descriptions are the same. This looks like a c&p issue
> 
> Those are what the previous values were.
> 

No, original TXT had different descriptions:

-- vdd-supply: phandle to vdd regulator device node

-- vddio-supply: phandle to vdd-io regulator device node

-- vdda-supply: phandle to vdda regulator device node



Best regards,
Krzysztof
