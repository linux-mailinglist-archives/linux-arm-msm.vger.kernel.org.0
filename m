Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9E9C7600014
	for <lists+linux-arm-msm@lfdr.de>; Sun, 16 Oct 2022 16:53:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229572AbiJPOxj (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 16 Oct 2022 10:53:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42660 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229725AbiJPOxi (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 16 Oct 2022 10:53:38 -0400
Received: from mail-qt1-x832.google.com (mail-qt1-x832.google.com [IPv6:2607:f8b0:4864:20::832])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9027C3F302
        for <linux-arm-msm@vger.kernel.org>; Sun, 16 Oct 2022 07:53:35 -0700 (PDT)
Received: by mail-qt1-x832.google.com with SMTP id r19so6426002qtx.6
        for <linux-arm-msm@vger.kernel.org>; Sun, 16 Oct 2022 07:53:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=M617hUvDTpcFldbMirW8IIk1uyeowTMveYy1yVY2fm0=;
        b=oYhVG46jOla5tkhSF0Jlqh1Ynjmnbw+LFwUsB7noqbu1FtN/o3MmL7qYcuQH0uSLrc
         GvnSlCwIAg0klW50RN7piUw2pKm1pRUAjggKPHWSrZ3wr+fQXRHIkzOmywtrkQc3Qi3v
         10n5fzQ+MNMTwNwyimpRkOKhav1ndvI8sGJhxQc5uGCO7WrAF7LLTlSrIgaA+00GQ/yt
         NehaavngrV8ziMgWWXnnSJrB6pEA9mzD5Y4HX6y5AdMQHS8jnpfijk4mp0vD7OLLXVvn
         2IOiQ0rQowYB4v7k4K1cLwpWz+pOM83ZUOvAn0wkjA51hddD7S5pnnEh5DU26EtCPZZk
         WPSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=M617hUvDTpcFldbMirW8IIk1uyeowTMveYy1yVY2fm0=;
        b=Ypp+mBKrvSXO9d0I0pN+EN4cTA0JFrzA/VsJRJaiTsZkREjHoN3rCbuZ+smjxrnqea
         /0aUkbkIsyrnlTyT1KtUF2CP3bfiK7E6esdUNZJ2QjBu8fFGHRMfaEpR2gy3MhOhtcvi
         vh68y1KPf1kNv8EHGXHSdgC1VgOvv5PuT8EnBP3n/gbP55v8hz5DZVl/EgdH05pyUG6G
         4z18G2fKU06x1peLjQR2C8he+2bktk9+qvXaeRTurBBXrOD/acA5UmsWwPexPB0aw3Tb
         pJGiaon3HUkqDJjp5ui8FKUr9SE7ELNdMzWF/qmRwt9DIFpE4QkTMQ13aLNItqTWoAuG
         udvQ==
X-Gm-Message-State: ACrzQf3FweJY/OPkj5EfRIiZOBgP0IFEPt/eorEmGj4b6q/9jCozWs3C
        u9lZWhl8qlbXJm3TbI9vR73vrg==
X-Google-Smtp-Source: AMsMyM7EoF905CSD7P1QLRs54RDbWyurGOEQ+o4lDGC81gASGR8Yp7CprIB3QIAQlpjWkVq0WSEwrQ==
X-Received: by 2002:a05:622a:651:b0:398:5034:9e85 with SMTP id a17-20020a05622a065100b0039850349e85mr5406552qtb.277.1665932014173;
        Sun, 16 Oct 2022 07:53:34 -0700 (PDT)
Received: from ?IPV6:2601:42:0:3450:9b13:d679:7b5b:6921? ([2601:42:0:3450:9b13:d679:7b5b:6921])
        by smtp.gmail.com with ESMTPSA id de4-20020a05620a370400b006e07228ed53sm6890016qkb.18.2022.10.16.07.53.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 16 Oct 2022 07:53:32 -0700 (PDT)
Message-ID: <bc1aa679-7173-c9a3-c35c-1da8b6c6f1f2@linaro.org>
Date:   Sun, 16 Oct 2022 10:53:28 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.2
Subject: Re: [PATCH v7 1/2] dt-bindings: input: document Qualcomm PMI8998
 haptics driver
To:     Caleb Connolly <caleb@connolly.tech>
Cc:     phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        devicetree@vger.kernel.org,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Jeff LaBundy <jeff@labundy.com>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-input@vger.kernel.org,
        linux-kernel@vger.kernel.org, llvm@lists.linux.dev,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Rob Herring <robh+dt@kernel.org>, Tom Rix <trix@redhat.com>
References: <20221015172915.1436236-1-caleb@connolly.tech>
 <20221015172915.1436236-2-caleb@connolly.tech>
Content-Language: en-US
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221015172915.1436236-2-caleb@connolly.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 15/10/2022 13:30, Caleb Connolly wrote:
> Add bindings for qcom PMIC PMI8998 haptics driver.
> 
> Signed-off-by: Caleb Connolly <caleb@connolly.tech>


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

