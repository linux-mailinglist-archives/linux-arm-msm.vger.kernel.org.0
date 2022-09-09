Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0C8C45B3D48
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 Sep 2022 18:47:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231302AbiIIQrX (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 9 Sep 2022 12:47:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35660 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230302AbiIIQrL (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 9 Sep 2022 12:47:11 -0400
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9F523145FEB
        for <linux-arm-msm@vger.kernel.org>; Fri,  9 Sep 2022 09:47:09 -0700 (PDT)
Received: by mail-lf1-x12b.google.com with SMTP id a8so3642996lff.13
        for <linux-arm-msm@vger.kernel.org>; Fri, 09 Sep 2022 09:47:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=bfzSyFF46ifX38zUWogpF3ZN9XCyY5YdKQPWMnyMhBA=;
        b=sJJTDn+167/60KxVXAwetrvS/mBKJoT3XImW/Vfc/qXtGFmQuTCRrLT/O/aQk9xAty
         joJ5DfSi0sNJKiOcAHDbpyBeCAye7jEbTFUE4mmN1n2vnpjdN2bzgptwDbH9fEpNSTie
         djeuXrjvicS9qrhZ2GQ21UavYKjxgd6l0/PqBcUrI3QFgT6M5Jqb5gPGB63Fj+wyS2rv
         io3d51+VcUDIjuVY81wCjgWCdbNSeU5dNY+t5gr8YV39A2Omp39aqSRLrPwy7K4UwvN1
         MRBHOMQNLP212iGcGosG3hkhW1nBRKSae0ILeutt4I7ANtl5OVk2OvBI0C3RgUqfQFDp
         a3qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=bfzSyFF46ifX38zUWogpF3ZN9XCyY5YdKQPWMnyMhBA=;
        b=akfjksuj38yrG8kRPz6LWCHjBImBmGGPGpBmJ2ng0J0V1u1O/ogfu3d8xfSjkiOYUv
         4wkaQiFHD8ACooPZeL0XIxtupLgmNcNgaUWuE+AAQWp6tfrn+0tWyiHUlpMSlaUje/mw
         CZCMemrhU5GyhiLjcNk4CwK8DVFPf4vxqjA23bQvwYkoYQ6VkzEBFDklBUBuPrJ5rMxq
         3raiEnex3ozdeSVIDF7m3y0oy5XGVa/W55brkuKjMuEdOspB1uKTVQgm1i5dIKGD7aDb
         DuuPGW2LKPUgGJQdISzDuP2XZYZ4Gr19ieyVpGHReL2y+QPFNNEdag7fxrXv67xsxBhy
         LU6A==
X-Gm-Message-State: ACgBeo3LiECV8/g1V7jev4Z5O3TF2fDdBWw3cv5DN75kbBPoW2Ughv6S
        N8Bgeh56UmMirhrqIqlFnBtuHfM7tjluyQ==
X-Google-Smtp-Source: AA6agR7bcvO0BR4pZ0MnbFrfWtX1i6iP5cbbfLMKgpNbni1L64U+WaI1aRzDr1cdZOoKa1QjRfA80g==
X-Received: by 2002:a05:6512:310:b0:496:a0ca:1613 with SMTP id t16-20020a056512031000b00496a0ca1613mr5201154lfp.394.1662742028039;
        Fri, 09 Sep 2022 09:47:08 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id c6-20020a197606000000b004947844e277sm142654lff.178.2022.09.09.09.47.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 Sep 2022 09:47:07 -0700 (PDT)
Message-ID: <ded53a2a-e4ea-7675-d9c1-eb080e317b6c@linaro.org>
Date:   Fri, 9 Sep 2022 18:47:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH] dt-bindings: remoteproc: qcom,smd-edge: Add APR/FastRPC
Content-Language: en-US
To:     Stephan Gerhold <stephan@gerhold.net>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Stephan Gerhold <stephan.gerhold@kernkonzept.com>,
        devicetree@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Abel Vesa <abel.vesa@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        "open list:REMOTE PROCESSOR (REMOTEPROC) SUBSYSTEM" 
        <linux-remoteproc@vger.kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>
References: <20220908181432.458900-1-stephan.gerhold@kernkonzept.com>
 <20220909161652.GA1448908-robh@kernel.org>
 <CAL_JsqKVb54yckiky79mK5FdEf-Vf7SyVU01Jdpo9whOqq0spQ@mail.gmail.com>
 <0b6f5b4b-247e-7573-04fd-05d037533aa3@linaro.org>
 <YxttwK1FMCMZ+CyS@gerhold.net>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <YxttwK1FMCMZ+CyS@gerhold.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 09/09/2022 18:45, Stephan Gerhold wrote:
>>> And dropped for Krzysztof's series instead.
>>
>> Technically Stephan was first and his patch solves it in partial way,
>> yet still self-contained way. I am fine rebasing my patchset on top of it.
>>
> 
> Feel free to skip this patch if your series contains equivalent changes.
> I mainly submitted this to unblock my qcom,msm8916-mss-pil.yaml series
> so I'm fine as long as equivalent changes have been applied. :)

Thanks Stephan! Your work is much appreciated!

Best regards,
Krzysztof
