Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3627F5B58DD
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 Sep 2022 12:57:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229994AbiILK5a (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 12 Sep 2022 06:57:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36320 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230050AbiILK5Z (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 12 Sep 2022 06:57:25 -0400
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 53C8338698
        for <linux-arm-msm@vger.kernel.org>; Mon, 12 Sep 2022 03:57:23 -0700 (PDT)
Received: by mail-lf1-x12f.google.com with SMTP id f9so13456044lfr.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 12 Sep 2022 03:57:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=HMWJPzdm7LYZ0h8otC1FbEzhBnQw85P+nGu0rzixY9o=;
        b=Mpl5aGqpSDa7nHFLKV0y2Y9pxhx/FXwd6kelexR5s5QnvobWEc4atfr04mAKCbSooR
         Eqo0wROh95s0AT0YMPmCLgf09bV9TG9ellmi4xqC5g66/npUr/U/h23XwFLu4DfE6NL2
         qUohoW8NjiQTheKYoYkSsUxizI5AAnFqJ0NDl0ruWseusK3QLXmM5OAOqrKUfGFnWNOR
         IDWi9Y02U2stPGe6586/V88b5x2gL5xhCn+yW2N3AbvcU8HHqHEmoBd1oGtTn3SUzlIj
         j9kd3BrwEUSaMOl6bTBIIUdYNK3aJeRcbvxuKkv0O1YK/DpR1wYDHpKnzBxeNXoVwhxF
         U8LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=HMWJPzdm7LYZ0h8otC1FbEzhBnQw85P+nGu0rzixY9o=;
        b=N9UpENNAxfVyCWsk2b5YvBROHwErFcFPMXqBRPQBizoDwa96ZVFUUD82dov8XhArKJ
         CyJYhQI5KszKzfZA0Z0I9cepfQpbmda4m/1Smcrynq99tNiRSlwzzJLTYdta9XTdBvIr
         BSi8T/i9QkdilfTv0GJG3rPjVLUckHRTOIB3FdsVOPdgAM7B5CgqH318gkTbg+Ye/Hv5
         OQgVMGECfhdR8NSgUMqjOS2Y4SGyRaVCizKgEi2TLOs0a5QTC0xFql/I6biPt9J4VJlQ
         5xL86SBgWUWe8XAqb8xyIkMKOgY1LE3MqaNKAPJpIa8pJjy6HUBTzWkzLSm4+TY9Y6+P
         eCdg==
X-Gm-Message-State: ACgBeo18EAq+W3SeexdI0lMMbjtz1yZkWNO4LDWYOK2wOQ9vB37X+ePw
        1cWbNJ1cQQqYaT+k0g46Mu1IyQ==
X-Google-Smtp-Source: AA6agR4f4eXl0jS5Wl8xvyRDaq8ZjEEr6LcKUwnHnsVlC107wKXUmp3ypgBDV5IxJD8HCS5Vl8cxrg==
X-Received: by 2002:a05:6512:798:b0:497:aa2b:8b10 with SMTP id x24-20020a056512079800b00497aa2b8b10mr9034975lfr.636.1662980241513;
        Mon, 12 Sep 2022 03:57:21 -0700 (PDT)
Received: from [10.129.96.84] ([109.232.243.34])
        by smtp.gmail.com with ESMTPSA id c28-20020ac25f7c000000b004917a30c82bsm999821lfc.153.2022.09.12.03.57.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Sep 2022 03:57:21 -0700 (PDT)
Message-ID: <4eecf3e8-78ef-7fa4-c615-7b7f27465a7d@linaro.org>
Date:   Mon, 12 Sep 2022 12:57:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v3] ASoC: dt-bindings: Mark old binding
 qcom,cpu-lpass-apq8016 as deprecated
Content-Language: en-US
To:     Bryan O'Donoghue <bryan.odonoghue@linaro.org>, agross@kernel.org,
        andersson@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20220911230803.1286202-1-bryan.odonoghue@linaro.org>
 <20220911230803.1286202-2-bryan.odonoghue@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220911230803.1286202-2-bryan.odonoghue@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 12/09/2022 01:08, Bryan O'Donoghue wrote:
> We've had some discongruity in the compatible string of the lpass for 8916
> for a while.
> 
> Mark the old compat as deprecated. New SoC additions such as msm8936 and
> msm8939 should use the compat string "qcom,apq8016-lpass-cpu".
> 

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof
