Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0ADA465FBD6
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Jan 2023 08:19:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229954AbjAFHTQ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 6 Jan 2023 02:19:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49210 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231720AbjAFHS5 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 6 Jan 2023 02:18:57 -0500
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com [IPv6:2a00:1450:4864:20::332])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9A4A57816A
        for <linux-arm-msm@vger.kernel.org>; Thu,  5 Jan 2023 23:18:27 -0800 (PST)
Received: by mail-wm1-x332.google.com with SMTP id fm16-20020a05600c0c1000b003d96fb976efso2942824wmb.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 05 Jan 2023 23:18:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=uymr+EslUp8EqejpciiRzBBlWnLjLu5bMnDY1fDFA+U=;
        b=oTZbkZtovB3HLWOtVT3OCUsmvFBZbSiMmXc1p3LXMmYPYUDD3DOUqg6SsHztTs3Dnw
         L+z5mCjSPmKHPeGyrHGORgGZ4ajAp09OuF+xAMU9+x8nkq8VDtI6bdTZt5cezaObkkiz
         uX7i8BVP6dzv241BgUyHvPvgA7lLI4KOOwr6ggTypkE078Zty8EdGyJtQGg+m8QFqoWi
         AD6t3pC2o/dkGZh7xdb6ws4Be7Yz+EGWKl8vi4OPA3CiuyMlZYfB8XOrPtxO3z3NAVc1
         BpoYI9DIGtv3i59Wvh/Ti71sDluSMca344CYxtrPERmsvmsjAKmClT3gxwI05ANNpX9v
         dqDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uymr+EslUp8EqejpciiRzBBlWnLjLu5bMnDY1fDFA+U=;
        b=O2f9bEc0BuqfEY6VMiZGMEdFpuOq/nM01cZC01s0N7XbnWmSLPzGjxqPpFxRsb2h4U
         YYXwqwqj+lL+QMIl0VMK5dtS+6CQUze3eXBuU+BRj02d1POUcHTfGbe//t15cB7Cj4kL
         DvXT/jf7QJtO2o6WkhUatLgQmIaLl/OI/CMG2eqQxRMfl2ivlOf9H3SRz+rNW6HpotsN
         RzZDsNha2T9BZzAPazrHSpLVSaVqWrHh30xIvayQOFUXLysavwbslhRa3dF6SlUMZIZh
         gOn+LInTs9/+PHHdVBZoB9jSNyGrw6fkwe1vFsJSReLWOMZi5laov6GgiVsOeqnn342b
         k/3Q==
X-Gm-Message-State: AFqh2kpgRv3K318zpLIEVq3cjNLcwbDkDagOsC6ei+kJcyxs6ripQqdw
        I1Se5K3WDSuwJL5Kfop8YBP1Sa2g9XACicnd
X-Google-Smtp-Source: AMrXdXvy6MS/jUIHUdH1LF0M/X52le8844L/0iRR3YoWgYCboXI+dMKiHPtNijyqDhgVUlPVQw9J5Q==
X-Received: by 2002:a05:600c:4fcf:b0:3cf:68f8:790b with SMTP id o15-20020a05600c4fcf00b003cf68f8790bmr39456245wmq.11.1672989506148;
        Thu, 05 Jan 2023 23:18:26 -0800 (PST)
Received: from [192.168.1.102] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id z25-20020a1c4c19000000b003d1e1f421bfsm5048093wmf.10.2023.01.05.23.18.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Jan 2023 23:18:25 -0800 (PST)
Message-ID: <25364b98-0b32-8283-7630-bcf0f6c22b4e@linaro.org>
Date:   Fri, 6 Jan 2023 08:18:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v2 1/3] dt-bindings: interconnect: OSM L3: Add SM6350 OSM
 L3 compatible
To:     Konrad Dybcio <konrad.dybcio@linaro.org>,
        linux-arm-msm@vger.kernel.org, andersson@kernel.org,
        agross@kernel.org
Cc:     marijn.suijten@somainline.org, Georgi Djakov <djakov@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Sibi Sankar <quic_sibis@quicinc.com>, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20230104171643.1004054-1-konrad.dybcio@linaro.org>
Content-Language: en-US
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230104171643.1004054-1-konrad.dybcio@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-5.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 04/01/2023 18:16, Konrad Dybcio wrote:
> SM6350, similarly to SDM845, uses OSM hardware for L3 scaling.
> Document it.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

