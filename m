Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4259864D7C1
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Dec 2022 09:31:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229629AbiLOIbB (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 15 Dec 2022 03:31:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34766 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229595AbiLOIa7 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 15 Dec 2022 03:30:59 -0500
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5BB0721836
        for <linux-arm-msm@vger.kernel.org>; Thu, 15 Dec 2022 00:30:54 -0800 (PST)
Received: by mail-lf1-x12c.google.com with SMTP id q6so14480465lfm.10
        for <linux-arm-msm@vger.kernel.org>; Thu, 15 Dec 2022 00:30:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1nubbTn0X1wcvUu3/5/PdXjK0reyrINTPOAFtZva9rc=;
        b=KzKuO0G19doKvDgWW+Er/PQhroljZZN0XoShykf5gPDp7MjxheNn8+D4xCFVfJ4CFz
         0unPNOlFn0bRZT+ms1UbRT4WSjGQ/RgKz+h6xI66i8n5BmjBpNcTjpYcQwCC73jZiCR0
         vXU7h4ZBiW/PZVDbJLZ35QujADweQzq6PMaG0+jHghnCT6aZ/8awlNiBksRf8NDUiYGC
         L5orYzp8WI73xltEoXI7Ozj2qPcJvYo3iN21rbu5QpJ3qOLUv27a54VXy7Ux+KmtPv/+
         VZCQ0O6fhuavy//uHyeIF9vaOwhEz7C20ugcVJaw/ptWZRrg/3SuxBP5fYAOzsJjDiaa
         gpSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1nubbTn0X1wcvUu3/5/PdXjK0reyrINTPOAFtZva9rc=;
        b=Tvza3QdL15wKTiyQEwCIfXbI3lToXaG5ZDQHYJsvpRDyVlg4euxqQJRDOVoyZOdQAm
         flZ7C2Vl3BSahKyJLaVeCXeQ+ZkpbGxQyeY1fB8PZwqKu0cLxgkfiqrHtGXA9DffJ3sI
         XqBpvEa1wpPKs6FWjJYWYNOOcmJ/SwHxJJQpnx9vkIvcRa3ZPq21Hn84FJ+6S9D4FJzb
         0Cn8SCNeT/QH2vo+ayXo5iTJhxCB7lju5eaA+h7ZjxZDjEAW3oWV4tWdVVVkO+mdtXG7
         9K7VdJjZoMrVQzYaL0pyqZR9xKlPHMbY1a1RWrWJYfKKiyuyiqedAT8rMoGRWlfd0t76
         IzpA==
X-Gm-Message-State: ANoB5pnj+0QuUfz6vYrXfNBGepoql7gDUYMbEypeYNPRaXGavkmBC+ET
        S737GqCMx5hm9q9AOh9ieN/sWg==
X-Google-Smtp-Source: AA0mqf6fJHdHN0DDDQXAHuMYSuB2fwKiz39i8hQ9SanfSbkECvDtGf2RJTjbbuAu9b4dFQmZGI0JYQ==
X-Received: by 2002:a05:6512:261d:b0:4b5:d:efb2 with SMTP id bt29-20020a056512261d00b004b5000defb2mr10492506lfb.14.1671093052644;
        Thu, 15 Dec 2022 00:30:52 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id r22-20020ac25f96000000b004b4b600c093sm1099737lfe.92.2022.12.15.00.30.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Dec 2022 00:30:52 -0800 (PST)
Message-ID: <2d736e84-921a-44d8-eedc-47382b190ca0@linaro.org>
Date:   Thu, 15 Dec 2022 09:30:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH 4/4] arm64: dts: qcom: sm6125: Initial support for
 xiaomi-laurel_sprout
Content-Language: en-US
To:     Lux Aliaga <they@mint.lgbt>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Kees Cook <keescook@chromium.org>,
        Anton Vorontsov <anton@enomsg.org>,
        Colin Cross <ccross@android.com>,
        Tony Luck <tony.luck@intel.com>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20221214093342.153479-1-they@mint.lgbt>
 <ea20c58f-3a53-7cdd-8669-228c4acac49a@linaro.org>
 <5a511002-5cd2-b95b-a45a-faaf78e2f4a7@mint.lgbt>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <5a511002-5cd2-b95b-a45a-faaf78e2f4a7@mint.lgbt>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 14/12/2022 18:26, Lux Aliaga wrote:
> I'm a bit confused at the "Node name: usb-id" comment. Should I change 
> "extcon_usb" or "extcon-usb" to usb-id?

Please change the node name, not the label. So extcon-usb goes to usb-id.

Best regards,
Krzysztof

