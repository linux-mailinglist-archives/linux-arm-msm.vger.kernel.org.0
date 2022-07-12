Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 78AE5571E8D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Jul 2022 17:12:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233970AbiGLPMa (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 12 Jul 2022 11:12:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44020 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233343AbiGLPL5 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 12 Jul 2022 11:11:57 -0400
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 24BE3CDA23
        for <linux-arm-msm@vger.kernel.org>; Tue, 12 Jul 2022 08:05:17 -0700 (PDT)
Received: by mail-lf1-x12c.google.com with SMTP id bf9so14385398lfb.13
        for <linux-arm-msm@vger.kernel.org>; Tue, 12 Jul 2022 08:05:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=eGwG/GucKtL6olAe03PTpskcUrGGme5wFAKul1wFsWI=;
        b=SWzYJNZira/kSD2dZalBhulw3VV5xRFfjlB/RSI9dDu0fA13/oSzL41eqGYa++1jAk
         C06lMwaI2L9osPXfNuGuROkRveJ7i4uqIm2ofiHdmd4k9up20IXhoiRFUzeSCOj7TKbg
         kUVGwkNbv1aGNXMK3g6n2m4CmkO1H/yq7EzsiFDYGYu70xZN/IACio7ft+hPA2AT2bQv
         XaHFaL73BXmyvS9bdftVdKmxmKZa9zNOWIGx4uidlJuxRhVI3bpMYyQW3mjD5j9jOF+v
         BaqxEtffVvZqbhvDeyxtcekMKqc9Y3txJQOutKV1BHWlvoCBxlJ/4c0pKd+ZV+S99Hzj
         NuQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=eGwG/GucKtL6olAe03PTpskcUrGGme5wFAKul1wFsWI=;
        b=VpFvMZzwDNLgDQY+oV89dwHb36WmpYpXWDdi6bRAWqjaGEVR+zkYeR1IPyMecru74a
         fnFWOqOAP0lonsxeftomA7Y5UjGVf0m7LRulY6rKJQAAq0QsTMWKa5QnH+dBJwF+68Fh
         iQCNQlX0TG6RE8O7OX+sXVspz1INgJGj3TfdCO/WZiwVQgYAfYL7B01jFRJJXxZAiFHB
         mykxDTXwShhZjMvCYBADzojZRWx8SSlCC6L31nEJRd1XryX2dJJlNAUMiLVzC8TpqyeF
         kHDvfJtymAtnnhOcW8VDDEEgTUgoWsc5/RlgsYnH/jCIBO1bBY381P/7a0RUmI98L5kg
         1X/g==
X-Gm-Message-State: AJIora8VNhmu1ZjPshBsDmQeF2jj7Y+AtkdMOf1ddiUP+z5z2n72twS5
        4//dWXJqr/uJuTBeTeCXmXMsIQ==
X-Google-Smtp-Source: AGRyM1tnRiDGALVOqovwNutFSwMDBSaQrzCN7zruoaePsdNhRGTqPVNBMmA7XnUbngXN4XD4/gZ6uw==
X-Received: by 2002:a05:6512:224a:b0:489:db85:53c6 with SMTP id i10-20020a056512224a00b00489db8553c6mr7580747lfu.383.1657638310861;
        Tue, 12 Jul 2022 08:05:10 -0700 (PDT)
Received: from [10.0.0.8] (fwa5da9-171.bb.online.no. [88.93.169.171])
        by smtp.gmail.com with ESMTPSA id g20-20020a19e054000000b0047fab4c3651sm2240528lfj.85.2022.07.12.08.05.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 Jul 2022 08:05:10 -0700 (PDT)
Message-ID: <3a0d3e52-a403-36c5-fc39-f45dce94c1f8@linaro.org>
Date:   Tue, 12 Jul 2022 17:05:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v6 1/2] dt-bindings: arm: qcom: Add Xiaomi Mi Mix2s
 bindings
Content-Language: en-US
To:     Molly Sophia <mollysophia379@gmail.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Stephen Boyd <sboyd@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org
References: <20220712145139.9473-1-mollysophia379@gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220712145139.9473-1-mollysophia379@gmail.com>
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

On 12/07/2022 16:51, Molly Sophia wrote:
> Add documentation for "xiaomi,polaris" device.
> 
> Signed-off-by: Molly Sophia <mollysophia379@gmail.com>

This is v6 and still not changelog. No cover letter either, which would
 describe any dependencies.

Sorry, you need to follow our process:
https://elixir.bootlin.com/linux/v5.18-rc4/source/Documentation/process/submitting-patches.rst


Best regards,
Krzysztof
