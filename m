Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AC1D55EE2D5
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Sep 2022 19:15:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234431AbiI1RPi (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 28 Sep 2022 13:15:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34076 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234608AbiI1RPG (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 28 Sep 2022 13:15:06 -0400
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 04003F088F
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Sep 2022 10:14:18 -0700 (PDT)
Received: by mail-lf1-x136.google.com with SMTP id i26so21338485lfp.11
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Sep 2022 10:14:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=P1v2Hc7pW0Y9IexF7yr50NijeQQED1eZuGgU1x8TnQY=;
        b=IB9dPB4sZqz6rhwZI5qErRQZEO79YqDmhucVn5PJ9QcHyTn11lSxL7+SltqKmogfew
         gMlaT5fGLPALgbiAfgqQTyxZxQjYd+QIzpvmncOJTyYw/VQKfti3pQ+WtDv+a9BJOrs7
         h5uz0Ymh4mMX6jHX9O9k7JhA5jqlBtqVjAXn/mDc1oLOltStMLr+r5sXpVPAo+VYuEpb
         /CDLXB5Tkm5OHGZxn+lTww3qG2CPsh3Ke4W6Jhzp9AojjmyehqRD/PWFwIXKKi/1ROlB
         cHj1cdk3ny9EoaNn+alic2oHPCrvdHoGTG0GRWoKCdZgnbzVj7/FENeg43xTajU6LAYZ
         yd8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=P1v2Hc7pW0Y9IexF7yr50NijeQQED1eZuGgU1x8TnQY=;
        b=fjnDpBaYGxI5jSprNXo5KqS0Pd9z93UuRj3uvmqbOGwMt4CMelEGMVHWc12uy1eMy4
         zwxK70cs5Id/ySqruJfT4lZQTD0vjjdcxjmWFoF+Yx/b+rLZF+Xd66tw95+/h6HFaZCm
         k07CmwceVyvGjpX+iuyIHDHpa3mlKwNejgwA8Qywr0/D0Gsg3ByeoAlcBg8HEFv//dCG
         pxlJgjZTIKmH7lrkM2NlUiFGJa/wAnGTgIDhZ7fQaqG2BvOuXm+myhz7WsFJh4gs6LW5
         WqSIM/VacI6Vy1yEpnew7Jdy0pj8GMzA/Db/Ffb69g+tuNZ8tJHawZ3ahvnQ23Ui5zdL
         b4qA==
X-Gm-Message-State: ACrzQf2BlcLRfOf92dWjBUOctLRvFnc/VDU3eF8J9m4khZw638jERcEW
        5ZTg2cQBwZ6ztqGR5GZLhZFEPA==
X-Google-Smtp-Source: AMsMyM698J9L0Z8aQ1TqBaoWfxdcCnrZtxZPwG+mSs0pGWscSl1ohKfoWWsMn/ZeV8NeqMI+FnKP5g==
X-Received: by 2002:a05:6512:3b9b:b0:499:b2b7:c3c1 with SMTP id g27-20020a0565123b9b00b00499b2b7c3c1mr13473178lfv.54.1664385256925;
        Wed, 28 Sep 2022 10:14:16 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id l17-20020a2ea311000000b0026bfadf87e3sm490505lje.20.2022.09.28.10.14.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Sep 2022 10:14:15 -0700 (PDT)
Message-ID: <0de46fcf-198e-14da-3594-c01f9c717202@linaro.org>
Date:   Wed, 28 Sep 2022 19:14:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: Re: [PATCH v3 2/5] arm64: dts: qcom: msm8916-samsung-j5: Drop from
 Makefile
Content-Language: en-US
To:     "Lin, Meng-Bo" <linmengbo0689@protonmail.com>,
        devicetree@vger.kernel.org
Cc:     Stephan Gerhold <stephan@gerhold.net>,
        Nikita Travkin <nikita@trvn.ru>,
        Julian Ribbeck <julian.ribbeck@gmx.de>,
        Josef W Menad <JosefWMenad@protonmail.ch>,
        Markuss Broks <markuss.broks@gmail.com>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
References: <20220928164806.179314-1-linmengbo0689@protonmail.com>
 <20220928165909.181028-1-linmengbo0689@protonmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220928165909.181028-1-linmengbo0689@protonmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 28/09/2022 19:00, Lin, Meng-Bo wrote:
> Before moving msm8916-samsung-j5.dts to msm8916-samsung-j5-common.dtsi,
> drop it from Makefile temporarily to avoid errors.
> 
> Signed-off-by: Lin, Meng-Bo <linmengbo0689@protonmail.com>

This change does not make any sense. Rename of DTS into DTSI must be
together with adding back that DTS.

Best regards,
Krzysztof

