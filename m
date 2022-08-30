Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 035045A6020
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Aug 2022 12:04:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229786AbiH3KDz (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 30 Aug 2022 06:03:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50684 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229673AbiH3KDB (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 30 Aug 2022 06:03:01 -0400
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 86B31EA336
        for <linux-arm-msm@vger.kernel.org>; Tue, 30 Aug 2022 03:01:03 -0700 (PDT)
Received: by mail-lf1-x12e.google.com with SMTP id v26so4555101lfd.10
        for <linux-arm-msm@vger.kernel.org>; Tue, 30 Aug 2022 03:01:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=1vsrniCH21cQJi1AfySbh7bugG44hFxHE8Sy+Hntiwk=;
        b=HzEo0niWeAC8aKQqyqFbwgRqbRe4kL4w+rFcfhEiUnl8R8zXVN5SiCXZScEe2pcOoq
         ieRfESHyJCuGXO4Q8PPz6tANwH/2AZrOBp8KWk0vybY7qlx7YRqUkXrXVBqbBZeaey0O
         e9UfjCbIoJsAwpR4CwbpcTroOD0yfhjfSewlAL9F01srSi/frfFDQyvWgTM8O55t1Duz
         Q7dz9LsIj/vcuIbyZS0e9rVzFqzRTVsD76PXJ+T1kpm4XUVVTEF5f5XPwsF1mvMrQ44r
         JPBTBRZyaxvxOE9C0AYWgvKdphdRM61pU0kKcG6uhKVEBIjdPPmNQdX4oB2QFNb03ixT
         6kdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=1vsrniCH21cQJi1AfySbh7bugG44hFxHE8Sy+Hntiwk=;
        b=TzSZWXmD73IENcVO9Z2jdb2ZkMFBsRtCUzWC/1YU3na8ayem79tO9osIRP1Ti7t3rn
         OhNRj1ckdjElhtdJo5o4pjWLaZyyZ1cWZ6x5UFvH2FWcC3ofqfYxGmIOzYskgnnvOkfy
         zEq+Gc+UYmSxUVu46+ofFrimpL0F/ax38fXCB2ve9HDuyF8SmRpbOuGINh00H7YsHjmt
         HYAOZ+f0GVH+LXeTFRURJlflP3IWIPJs4Cr1FQ0O7NAHkI5T+RnR9JTGlCW27V4sG71/
         aXbPbr5ijy8zLbdmuDoGMsZu1i+l7+j4ZLBp8dfkSm1tjjzpUYe/NmwZPbOMNGLZUuUm
         yT6w==
X-Gm-Message-State: ACgBeo0pJZISSUjexOiNjSaRLCdwJ0IgF74t+9ZMGwdc8YHn8xf52cJ/
        onMoqdz+9Eq9dAcgfMEsb+ao4A==
X-Google-Smtp-Source: AA6agR6JwZ1ofnEQJEaI5BlUALdbq4Lgo8rV4qkvxdvx9GZIe4ECEls5ojSqQMsoo8Z4PgZif6hXIg==
X-Received: by 2002:a05:6512:3b9d:b0:492:d0c5:c3a5 with SMTP id g29-20020a0565123b9d00b00492d0c5c3a5mr7209870lfv.129.1661853661270;
        Tue, 30 Aug 2022 03:01:01 -0700 (PDT)
Received: from [192.168.28.124] (balticom-73-99-134.balticom.lv. [109.73.99.134])
        by smtp.gmail.com with ESMTPSA id h1-20020a05651c124100b0026181a42284sm1208849ljh.88.2022.08.30.03.00.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Aug 2022 03:01:00 -0700 (PDT)
Message-ID: <2c1d887b-b2f8-dec7-f19b-771e0d3055a1@linaro.org>
Date:   Tue, 30 Aug 2022 13:00:59 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v4 4/4] arm64: dts: qcom: sdm845-xiaomi-beryllium-ebbg:
 introduce Xiaomi Poco F1 EBBG variant
Content-Language: en-US
To:     Joel Selvaraj <joelselvaraj.oss@gmail.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org
References: <20220828205723.20834-1-joelselvaraj.oss@gmail.com>
 <20220828205723.20834-5-joelselvaraj.oss@gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220828205723.20834-5-joelselvaraj.oss@gmail.com>
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

On 28/08/2022 23:57, Joel Selvaraj wrote:
> Introduce support for the Xiaomi Poco F1 EBBG variant. The EBBG variant
> uses EBBG FT8719 panel manufactured by EBBG.
> 
> Signed-off-by: Joel Selvaraj <joelselvaraj.oss@gmail.com>
> Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>
> ---
>  arch/arm64/boot/dts/qcom/Makefile                 |  1 +


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof
