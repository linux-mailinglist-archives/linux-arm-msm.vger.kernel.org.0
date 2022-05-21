Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 25C2752FDD1
	for <lists+linux-arm-msm@lfdr.de>; Sat, 21 May 2022 17:26:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1355398AbiEUP0T (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 21 May 2022 11:26:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55928 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1355436AbiEUP0L (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 21 May 2022 11:26:11 -0400
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6DCC310FF6
        for <linux-arm-msm@vger.kernel.org>; Sat, 21 May 2022 08:26:10 -0700 (PDT)
Received: by mail-lf1-x12c.google.com with SMTP id p4so17410493lfg.4
        for <linux-arm-msm@vger.kernel.org>; Sat, 21 May 2022 08:26:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=l0FO30ijLD2RBWmW1sZZ75F8v77vXVlWEzIkxrjeYNU=;
        b=FjdK5L+i0BohRG/pLptNfBiNkz2x/G+YooeR/rWNH/YP1sG4rxSCENq5HoI4V5OgSA
         KaB7rzqZHIK1sfLeem7jNce6svhn8G303eCviULO7ViPW4bV7oap1gr+SsHs9MI3CBxv
         sOQMyxEEN0N/8UKfZ7OH0T0H/5sY2EGso8e6D0+AMIx4W2GThEWxCzmFIRW3G7x1RDOw
         LdWgqGZQvXlGIqiDIQdEuDcXYBkH7Vh76Wng9W2EwmXuUwMZrG7w9VeUoO2GjPtNT9+2
         nU+Z2XlM+6i9j/L9wnSk1vxGJv4XNtyuf8R55yBDvvKrf8Al+xtvfa89QWMnpo840A2H
         fNrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=l0FO30ijLD2RBWmW1sZZ75F8v77vXVlWEzIkxrjeYNU=;
        b=YL4tqxgfvq42qM1k29QMLHkKmtAT24Mm9cNKg2n8kaDYsSgkSmnoJOZHFjCucHjDEk
         zeEvwr+gk5eg/KSpl9a2OZKc6J8TNbaiFdVn7YSzZ2L4gMHssWLrh2skrAogitwwnRPx
         jBVhKUvkARAbBbstYsIqygDT4S+sVoeuNkBgRcTLoS4dkb3yyDpgQBW66uHdDXcjiuBF
         T8dKgCeiuheTz1MBZjHKDtIjT2SBD1rDImSubPA9AYdpEs22s4F3A/MUgduen2dvt7xI
         knflBh0tB3B28gm4uXGemYcpD7lTQl2dclZY6+1e6h0WcE26DxFQJLDrrARNeFqKWSub
         1SFA==
X-Gm-Message-State: AOAM532lDlWua/rOXvALLStMI6NFsWD8xs9vQ+gR0QVRBUiIZvd8CqHm
        hR1qXt0UQYXLia25bIa0jffXpQ==
X-Google-Smtp-Source: ABdhPJwkn1JS3+QEw42fCfDl+jEUY3dLUq7WDEaEUgKq4tTlc3DQYjH0oQJcUokZCtSFnga4kPd9YA==
X-Received: by 2002:ac2:4e10:0:b0:473:c870:f93b with SMTP id e16-20020ac24e10000000b00473c870f93bmr10765667lfr.517.1653146768784;
        Sat, 21 May 2022 08:26:08 -0700 (PDT)
Received: from [192.168.0.17] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id v8-20020a056512348800b0047255d21186sm1094474lfr.181.2022.05.21.08.26.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 21 May 2022 08:26:08 -0700 (PDT)
Message-ID: <d09435fd-8216-ad01-05f2-d2c2c6b98aaa@linaro.org>
Date:   Sat, 21 May 2022 17:26:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH] dt-bindings: clock: gcc-apq8084: merge to gcc-other.yaml
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
References: <20220521150835.1488683-1-dmitry.baryshkov@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220521150835.1488683-1-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 21/05/2022 17:08, Dmitry Baryshkov wrote:
> There is no need to have separate bindings file for the
> qcom,gcc-apq8084, merge it to qcom,gcc-other.yaml.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

This makes sense and we already discussed it was preferred over my patch.


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof
