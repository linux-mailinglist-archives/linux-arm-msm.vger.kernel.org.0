Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 142FD515E53
	for <lists+linux-arm-msm@lfdr.de>; Sat, 30 Apr 2022 16:45:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1382847AbiD3OsX (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 30 Apr 2022 10:48:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55110 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1382835AbiD3OsW (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 30 Apr 2022 10:48:22 -0400
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com [IPv6:2a00:1450:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1432961295
        for <linux-arm-msm@vger.kernel.org>; Sat, 30 Apr 2022 07:45:00 -0700 (PDT)
Received: by mail-ej1-x632.google.com with SMTP id y3so20324247ejo.12
        for <linux-arm-msm@vger.kernel.org>; Sat, 30 Apr 2022 07:45:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=Oy0xVVppw3qelUQn91ueEZ7VduJvpy8odEjGqqKlo1o=;
        b=u6xN0wCFJv3cexNP59tSC1QVYmfUiyE8i7LIuj/szhrIdwzshrYvdYV//O+mkjAGPh
         W3bCDfq4VaftSpkOoUhoB8HP1mlOEBlXNg4uTwMOWYth1I7KD+KLZdZtGDLqiku+EqEv
         719L5trEO48decxJx+WRmeI91lDT9zXsLruEBD4BWrv3XLCG7fa6YzecmEchFsbcMx30
         SXXFRYHU9uLWmzgwVF1NWVLLBTX8tk9BxQf5byNAQLvTgSGOHDefjsvLFnovGOk8dUry
         W5e0Ys9h7Jy3T/j94tC5PHuJwHPwCv+EoTk/q2Ucm1DLu1aCGhIJY15g+R0rnWXzcslz
         PpfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=Oy0xVVppw3qelUQn91ueEZ7VduJvpy8odEjGqqKlo1o=;
        b=pfVBPfqd18uJWhqEehbvPX2ornNxF0yBy4WA+e4DsX5qURrqlyyMYySrJxQVylMuv3
         yX91zPEgcfpXC8t7W49qHfi5y8s3vbbqQZ67iJE0bXiuB4W1o04DJTQ2+9CvlpEjtQbP
         i79eXP3OeAZDxOYkr5l9Boz3AWcNTddL6lPBJDm9vbirJP8cdppMBYPUrGBfXKid6NRF
         uK5ul/GJyqUN34Ro9xstXXt7QNpuJ1PSMAmXrJ5YXc5E3KATBk2rdc5P4RFiVEfX7j90
         I8ShrLBbRYlpadvdbbX03MScztld0jo/+hN6IQJYjKl5njaEh7HHoJDtlJ16M+KpXv7q
         4apA==
X-Gm-Message-State: AOAM530rJAIPisIar8bmmjwjT7SgCOmEvYQwJ21yf6NyWPozAdlelreX
        +EOFiBafsnEvBMGmt1ZrmFKSfQ==
X-Google-Smtp-Source: ABdhPJwV01wa7UN9N4o+K+6V9dicEDNKbkI9EsUJDussG7+bT4xtMjaSlzbFUiLEn1Vhuu6HSQL4Pg==
X-Received: by 2002:a17:907:94c5:b0:6f3:f30e:8c52 with SMTP id dn5-20020a17090794c500b006f3f30e8c52mr4180004ejc.660.1651329898678;
        Sat, 30 Apr 2022 07:44:58 -0700 (PDT)
Received: from [192.168.0.180] (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id hx14-20020a170906846e00b006f3ef214db6sm1675837ejc.28.2022.04.30.07.44.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 30 Apr 2022 07:44:58 -0700 (PDT)
Message-ID: <f56061fe-adec-a148-e085-0561f84e8b3d@linaro.org>
Date:   Sat, 30 Apr 2022 16:44:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v14 04/10] dt-bindings: iio: adc: document qcom-spmi-rradc
Content-Language: en-US
To:     Caleb Connolly <caleb.connolly@linaro.org>,
        Jonathan Cameron <jic23@kernel.org>,
        Lars-Peter Clausen <lars@metafoo.de>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Lee Jones <lee.jones@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>, linux-iio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Cc:     Jami Kettunen <jami.kettunen@somainline.org>,
        Sumit Semwal <sumit.semwal@linaro.org>
References: <20220429220904.137297-1-caleb.connolly@linaro.org>
 <20220429220904.137297-5-caleb.connolly@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220429220904.137297-5-caleb.connolly@linaro.org>
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

On 30/04/2022 00:08, Caleb Connolly wrote:
> Add dt-binding docs for the Qualcomm SPMI RRADC found in PMICs like
> PMI8998 and PMI8994
> 
> Signed-off-by: Caleb Connolly <caleb.connolly@linaro.org>

You got my review tag, didn't you? Any changes in this patch?

Best regards,
Krzysztof
