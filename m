Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 387A35BE015
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Sep 2022 10:31:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230196AbiITI3n (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 20 Sep 2022 04:29:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52162 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231673AbiITI3F (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 20 Sep 2022 04:29:05 -0400
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com [IPv6:2a00:1450:4864:20::234])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D61933B948
        for <linux-arm-msm@vger.kernel.org>; Tue, 20 Sep 2022 01:28:51 -0700 (PDT)
Received: by mail-lj1-x234.google.com with SMTP id b24so2077306ljk.6
        for <linux-arm-msm@vger.kernel.org>; Tue, 20 Sep 2022 01:28:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=fw/SHkXwMkFKfWuM1sqn8CqRzURyBdIM50KT9clJT54=;
        b=nJeWvr0d6HGaY7Rx+/e4ufvu9Hx8TyU31qtiGH02hsStlIWZGO1+2w+NYnfLbzx1pF
         x6CboFt2zqRgj29ytiysh2dzIv5gxyJdHqdTW+va3LLp/PCsp8UWJ9NQ7ys0AUwsMdHS
         yN9gHytHgqM7AerVvw5UlvVWkAuI7K/rwgt/+Hw/2xBOjbx+P2BWLy41sWBKRF1Jq0gH
         j5PijGwYg6HhGKrY1/kgUUOcIR81mrABTDv0dZoI2VrfIJFsuDe+/d7jiVws9EyyZYSi
         fY2SBk4jmsRFWSe0of/s91dqwRedg4rHJOfMMJL24CSR4sK2MgMZJ5W/hYKGs+CCl8Op
         db3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=fw/SHkXwMkFKfWuM1sqn8CqRzURyBdIM50KT9clJT54=;
        b=M/EYcjIIyUrITOnyTD55cI5JANcbO5fSL5UPgSOMweUSNPcwaDjX5wBNfug2NaecR3
         J6BOLgNyEVtvCvZDfW4/7bbYOG2hN2oFOFiiGlHDWDV4dgC+9vZ9qxAh6hlnhuO5NJm8
         +4yrvbFafmBkNMjRyaX7lXuW/rYscqfBX8ODMQ9rCm7Ujd21jWa/AfmWrtM+J5+fHw8i
         Wh7RU+IOfPeNhKt7InT3VHg5B5PSfTuJ8nnorpjPg4vGcrZPPsYvS9BetwC8QWQsfglJ
         JZbutEwptPsjSiytxmiVeZMPKp3A8JOjJyO5m2ITrYDATUvCVoz5SNoECuNr9pk6ERw1
         uq7Q==
X-Gm-Message-State: ACrzQf1ptNl4cwypWGcPF3HbE0qyTnoBTPXVjPWh1k+q9rLYXNmRBJkQ
        38wEv7dpAXQBFy6zNSEqxv4/zg==
X-Google-Smtp-Source: AMsMyM4k5mvClZP+uOnzG27BVLGmAA6O22iRISymumTCjmPyl/oCtpyTB5PCAXP2f+0mwWSgJoaRmQ==
X-Received: by 2002:a2e:a555:0:b0:26c:2f4c:f019 with SMTP id e21-20020a2ea555000000b0026c2f4cf019mr6653777ljn.245.1663662530224;
        Tue, 20 Sep 2022 01:28:50 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id dt13-20020a0565122a8d00b004946c3cf53fsm201611lfb.59.2022.09.20.01.28.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Sep 2022 01:28:49 -0700 (PDT)
Message-ID: <7b7f7b59-03b9-3ad6-96ba-5b0b8a69ae01@linaro.org>
Date:   Tue, 20 Sep 2022 10:28:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH 0/2] SDM670 RPMh Clocks
Content-Language: en-US
To:     Richard Acayan <mailingradian@gmail.com>,
        linux-arm-msm@vger.kernel.org
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        devicetree@vger.kernel.org
References: <20220920022251.3073-1-mailingradian@gmail.com>
 <20220920023012.4433-1-mailingradian@gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220920023012.4433-1-mailingradian@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 20/09/2022 04:30, Richard Acayan wrote:
>> This patch series adds clocks controlled by RPMh for Snapdragon 670.
> 
> Oops, sorry. I added the wrong description. This was what I meant to send:
> 
> Subject: [PATCH 0/2] RPMh Support for PM660 and PM660L

Send a v2.

Best regards,
Krzysztof
