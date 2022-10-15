Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 644A85FFAAE
	for <lists+linux-arm-msm@lfdr.de>; Sat, 15 Oct 2022 17:03:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229691AbiJOPDu (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 15 Oct 2022 11:03:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46824 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229681AbiJOPDt (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 15 Oct 2022 11:03:49 -0400
Received: from mail-qk1-x72f.google.com (mail-qk1-x72f.google.com [IPv6:2607:f8b0:4864:20::72f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 855C053030
        for <linux-arm-msm@vger.kernel.org>; Sat, 15 Oct 2022 08:03:48 -0700 (PDT)
Received: by mail-qk1-x72f.google.com with SMTP id b25so4267217qkk.7
        for <linux-arm-msm@vger.kernel.org>; Sat, 15 Oct 2022 08:03:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=IRXfSr+AeJv0MDB88/3kkIzBk6djfX71HiJlpWU4fUE=;
        b=MmNUcHP2ChrnBow08VljA5fxjIYdGdDepyU/T8jyoNfEZdrye6p7nDfP9FjBDOKVgG
         5mJKLtnhMb8gmCWTmmZs3Ke43wVPjRut9cStvukH2/lAqR7/TVw35JytHekj+Ye67jk2
         nMX6wmw1o3MayEAAqiGcp75av5wh1I+vDoBuIOU5C9TYmWKDP0GBx0i/N1HPViH47g2b
         ZVL256lmHrunPp9hJ6dNf9x46d9RElwFHae8Dax8VkpvGD6qW0nQjY70x/WLK0M4PS9P
         47w6FEu0K0xS20KOj1jyca5js15JmJDnzcRjUC9TyRGK6TyprRPxsDv55c7x+hny2gc6
         xWvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IRXfSr+AeJv0MDB88/3kkIzBk6djfX71HiJlpWU4fUE=;
        b=c919m2azXvMVbzKIPWlxwGWDXmMXKZqfex4aILuZJW2YtYsC/l9wEm+JIozQwYMzxB
         tiUEvdJO8oBtpt1R+tIc8wNa9jOdeFvQki/+R8TLkHabf5kJeSMdTTVZDm/UPGlcRWz6
         VPDGGh+GQ3JrW8JVsLxxzRcvNoXPznFYIZ2F6RT1ABPSd1Q5zBnPYNduACjHn1t9bZcw
         Awc2/aSXSIFcDh/pODhO6sWLUmFWXP6ENYM00LKjHrMkSmBXtsy3acbG4E1eENU5+JwR
         kVPeURN1r1aWNB5O+1tCiIwBcxpAZ0L2nJRGnJOLsvHw/dtRoo/EK3TGZw+D26TaCIay
         67Nw==
X-Gm-Message-State: ACrzQf2WvT47Ij8bnzcLhaEBCK3E3wHsD0c4R3OR8jZD16NnsjcXLCus
        U4jgSXUYKrn6W98sZxO5qc5gsnUwY7vBOg==
X-Google-Smtp-Source: AMsMyM6wOKBU8VXQG0sRCrLxwIlgwQtSfm9xcCrWrVzcLIRW5wCFiAzyTPdGmhqToNeXn8s8PO/zvw==
X-Received: by 2002:a05:620a:45a6:b0:6ee:a169:f22b with SMTP id bp38-20020a05620a45a600b006eea169f22bmr2009569qkb.244.1665846227687;
        Sat, 15 Oct 2022 08:03:47 -0700 (PDT)
Received: from ?IPV6:2601:42:0:3450:9477:c2f0:ddea:ea08? ([2601:42:0:3450:9477:c2f0:ddea:ea08])
        by smtp.gmail.com with ESMTPSA id v12-20020a05620a0f0c00b006c73c3d288esm4981055qkl.131.2022.10.15.08.03.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 15 Oct 2022 08:03:47 -0700 (PDT)
Message-ID: <dde4c160-e7f5-5759-d45b-c4608d1f28c1@linaro.org>
Date:   Sat, 15 Oct 2022 11:03:45 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.2
Subject: Re: [PATCH v2 6/6] dt-bindings: qcom,pdc: Introduce pdc bindings for
 QDU1000 and QRU1000
Content-Language: en-US
To:     Melody Olvera <quic_molvera@quicinc.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Marc Zyngier <maz@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20221014221011.7360-1-quic_molvera@quicinc.com>
 <20221014221011.7360-7-quic_molvera@quicinc.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221014221011.7360-7-quic_molvera@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-5.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 14/10/2022 18:10, Melody Olvera wrote:
> Add compatible fields for QDU1000 and QRU1000 pdcs.
> 
> Signed-off-by: Melody Olvera <quic_molvera@quicinc.com>
> ---
>  .../devicetree/bindings/interrupt-controller/qcom,pdc.yaml      | 2 ++
>  1 file changed, 2 insertions(+)
> 


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

