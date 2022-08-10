Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EF4A758EED6
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Aug 2022 16:53:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232777AbiHJOxm (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 10 Aug 2022 10:53:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39376 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232541AbiHJOxm (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 10 Aug 2022 10:53:42 -0400
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2561174DEB
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 Aug 2022 07:53:40 -0700 (PDT)
Received: by mail-lf1-x130.google.com with SMTP id z25so21626363lfr.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 Aug 2022 07:53:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=aGcGjED9prbPBXnEB6gWrGKTgZxRPTJLA4DQ/XLkI90=;
        b=Ox4Wzcy5pKhz+wGnJubAlRB50SpwPPFQtxPTnXz4tGPDdxZggNaFHJ/lEQnuojsTMV
         WJ0gWOIGF1Adrz2Q09kAZDNk//AZbTgVAfCWAxD7cGEYb9wxGp4SDBurw8EQrlWHZ1iI
         Y25R7jBUOy9ig/24To6JpJ56XskkPgDkkQNbeGY01v4l86mJedW/Q/DWzcjAJo1qb55k
         eZo6v3GWD13zRbJhLh+sVKS6yNathv9xLJIz+wMoT2jbjKYRmne++NlCC7zpLG0J6+4+
         /+qv4MSa2O09VoTx+eEKY6eQtn9S9xHWindKIorT1C2e/sN/wLfTciTW/oJnH+vVXycC
         SVPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=aGcGjED9prbPBXnEB6gWrGKTgZxRPTJLA4DQ/XLkI90=;
        b=MVPvGpraFVbOp9MMAOPQ02WSEhwi8JRW24Zgzs59ZT7INMyWx6vvWy4uWRl7II3i1l
         YI+JF5MbUvAoUBQ2LC6J3aI0gmuPbZ8vpnl0xzMHuCzIkUJ6tuunSkI2l2fuLmLscWfz
         iSJmQ4BKCT8olPH/Ilu9HU7VC258qCiLT1jlPk73MJBmIO7u+B56hRhyVGEHRm4Ytczw
         hzL0/It/9f8LwPhP3Q8T24Ft25Qfm3I8dGzrQ1iQiCAK2jLLeM7LYvEe9Xl3k9npDFC2
         r5hZDOYC7mUEyCqLYi5sHEs21kCsmXcwotz933ncUkSJ0ydrTYXWMa7bYDtrXFx0jRU3
         zwKQ==
X-Gm-Message-State: ACgBeo1dV3gIC33oCyfFPyEWqGZvLY4uX0FNItuPDH1ki+RfPYPBM09d
        hPnt+rv3uYuEG8sPlIZ/I2nZDVCR9JxhGDpn
X-Google-Smtp-Source: AA6agR4PT+52gucEyV74DPfu0zHmbsxiOgaNV76cFokC2FJAHzDCKIlbVUVZxtcpkXV3OIQBCKxnEQ==
X-Received: by 2002:a05:6512:308d:b0:48b:b7d:f1e5 with SMTP id z13-20020a056512308d00b0048b0b7df1e5mr10637923lfd.199.1660143218514;
        Wed, 10 Aug 2022 07:53:38 -0700 (PDT)
Received: from [192.168.1.39] ([83.146.140.105])
        by smtp.gmail.com with ESMTPSA id c5-20020ac25f65000000b00489ec0d7636sm367637lfc.110.2022.08.10.07.53.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Aug 2022 07:53:37 -0700 (PDT)
Message-ID: <413f84e8-d21b-0002-da59-f532f3df250c@linaro.org>
Date:   Wed, 10 Aug 2022 17:53:36 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH 3/4] arm64: dts: qcom: c630: Add Embedded Controller node
Content-Language: en-US
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20220810035424.2796777-1-bjorn.andersson@linaro.org>
 <20220810035424.2796777-4-bjorn.andersson@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220810035424.2796777-4-bjorn.andersson@linaro.org>
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

On 10/08/2022 06:54, Bjorn Andersson wrote:
> The Embedded Controller in the Lenovo Yoga C630 is accessible on &i2c1
> and provides battery and adapter status, as well as altmode
> notifications for the second USB Type-C port.
> 
> Add a definition for the EC.
> 
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof
