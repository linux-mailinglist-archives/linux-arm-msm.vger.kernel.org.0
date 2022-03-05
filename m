Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 668E74CE72B
	for <lists+linux-arm-msm@lfdr.de>; Sat,  5 Mar 2022 22:12:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232621AbiCEVNl (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 5 Mar 2022 16:13:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39570 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232609AbiCEVNk (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 5 Mar 2022 16:13:40 -0500
Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 263786C911
        for <linux-arm-msm@vger.kernel.org>; Sat,  5 Mar 2022 13:12:49 -0800 (PST)
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com [209.85.208.71])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 00D133F5F9
        for <linux-arm-msm@vger.kernel.org>; Sat,  5 Mar 2022 21:12:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1646514766;
        bh=c7nvDWFcwUU/UCEXDJQ70xZTwc42c5nskfhluppR+58=;
        h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
         In-Reply-To:Content-Type;
        b=B2nfFygCbl/IfokpY9TqXZqYKX2OA+4PFQfgrVtdz/3QQGCkwSHGuLJv9+QhME3Hc
         dEUwwbOZXxT4fnQs7c2qOcCEQCvUPFWC3x+OQTFWzyKEXevC+V9j7UYv0AOhjy0JcL
         hiRA0kqcwIf0uJOWY8bdhjOOoBRtFQ/UZYMmWsOt1n6Yh7EPWgJQjq/3Z+cSljrKdH
         w0BLOdwWjJwMFh2+CYb/7oWOE3rof/ZgnzGe6lAB0BjRfVInnmYI29WUOxmAQWdb2k
         GNBUrWvKVjweMn1oeCJNi8/f6d/DYVTstIVOBKMPzzqW2dVwSaQyXRcRF2BWSxC02/
         OtxOmr6ZFBiYA==
Received: by mail-ed1-f71.google.com with SMTP id y10-20020a056402358a00b00410deddea4cso6028149edc.16
        for <linux-arm-msm@vger.kernel.org>; Sat, 05 Mar 2022 13:12:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=c7nvDWFcwUU/UCEXDJQ70xZTwc42c5nskfhluppR+58=;
        b=yyQJYtY5VFBiBggjyVwVHg7LurchjR1XlN+A9wrAoyBwsADz4o+PIyHN+hIEuFNgdZ
         CE44r1qzqh6ovE4sIbgftBWTCH1cn1tAfW9fcFOpvmXr63cf9unBeykh4bTft/lzVtv5
         AODhCJvnzHVS6qjTQt3DBWR1i2LXw2lH3/6dx1i0pIK7p38HhmVuCWxJlZuVT92eloeC
         HmWe36YHJduouX6zN7S8Yfbf67QSJXcJ6a2sXHsxmdnMkcqMpTF5hnekLFaxsmhbWWnS
         mSsP16mc/4Bj+isn9lqkg7HGfAoxwcMWqU/bZymgnZo+OMPvw0s3A9p7Mtlg1sPWPTf9
         xD2A==
X-Gm-Message-State: AOAM533YL/FroxVmMBWHB8XV9igwPGF1cucxVmnIbvHlkEu1tBlhAIN1
        5G4ZBOuDUUOFV1b2JZldW6xokeNabFJqQYhFdc3pAb4GVPDIeZO8NSslsAh9sC30VBIz5iyXp+l
        JL4MMAqzSGxEYFdCZ8CnOU8VmJNp6a1hQDCRon2bGjX4=
X-Received: by 2002:a17:906:2846:b0:6ce:21cd:5398 with SMTP id s6-20020a170906284600b006ce21cd5398mr3859153ejc.49.1646514765639;
        Sat, 05 Mar 2022 13:12:45 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwQWtd1Rccv7Kbrfkpj21uOWYbCPVJQ8Isf4LoTsdDQe/XmKzNu3ITY1TALeARndSrDs8ssrg==
X-Received: by 2002:a17:906:2846:b0:6ce:21cd:5398 with SMTP id s6-20020a170906284600b006ce21cd5398mr3859151ejc.49.1646514765494;
        Sat, 05 Mar 2022 13:12:45 -0800 (PST)
Received: from [192.168.0.139] (xdsl-188-155-181-108.adslplus.ch. [188.155.181.108])
        by smtp.gmail.com with ESMTPSA id o2-20020a50d802000000b00410d7f0c52csm4018060edj.8.2022.03.05.13.12.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 05 Mar 2022 13:12:45 -0800 (PST)
Message-ID: <ed2c1e67-4d45-5602-7adc-be0451c7ae1f@canonical.com>
Date:   Sat, 5 Mar 2022 22:12:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 3/4] dt-bindings: firmware: qcom-scm: Document msm8976
 bindings
Content-Language: en-US
To:     Adam Skladowski <a39.skl@gmail.com>, phone-devel@vger.kernel.org
Cc:     ~postmarketos/upstreaming@lists.sr.ht,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Jassi Brar <jassisinghbrar@gmail.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20220305164906.16853-1-a39.skl@gmail.com>
 <20220305164906.16853-4-a39.skl@gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
In-Reply-To: <20220305164906.16853-4-a39.skl@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.8 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 05/03/2022 17:49, Adam Skladowski wrote:
> SCM driver on MSM8976 requires 3 clocks.
> Signed-off-by: Adam Skladowski <a39.skl@gmail.com>
> ---
>  Documentation/devicetree/bindings/firmware/qcom,scm.txt | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 

Same as in other patches - missing blank line before SoB.

With that fixed:

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>


Best regards,
Krzysztof
