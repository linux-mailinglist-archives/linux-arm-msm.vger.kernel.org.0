Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 187695E9C6F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 Sep 2022 10:49:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234518AbiIZItr (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 26 Sep 2022 04:49:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33400 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234533AbiIZItS (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 26 Sep 2022 04:49:18 -0400
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2485C3CBE7
        for <linux-arm-msm@vger.kernel.org>; Mon, 26 Sep 2022 01:49:15 -0700 (PDT)
Received: by mail-lf1-x133.google.com with SMTP id 10so9741199lfy.5
        for <linux-arm-msm@vger.kernel.org>; Mon, 26 Sep 2022 01:49:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=MW04zFbYiz7tW78FOCuEC7QbJfqoqdmSRXNLnpBucog=;
        b=XA0TuMNFuN+TfZQGGrr7npbEEY4hCAqo6Jz6K4A4rTxF7CgS3bXBxFaM7l2+WM6TMd
         GD7Rn5Untjl2hvQRmyG1jW+duqKBGH1dhYqbm5dVvZoD48FTGosdP4p0J8DThcpvTTOo
         Od5/wq3xdydD3pD2G/mTWy4rq3pj1GrpLZNdHqQtb3ApJvF7F8sZeiSkeh4E0WxUFnuI
         J5OCEFe9/vf5v/WDlqKEaxHhvl0HW36PYeSr/53FPiUXmKZ5/ani4CJlAR0LrbJlVe8M
         cqR22DRFt6vO66GZD1aIrGTvJAXMl9uWBN54NuPvjokCTJQDx+2UOUYDerMI5QQ+0QYN
         n7FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=MW04zFbYiz7tW78FOCuEC7QbJfqoqdmSRXNLnpBucog=;
        b=wlPvQtVennJjifIkXhc2fgCcTL+HPzueI4+Yal0ywhwGYi4Kp4DyuyJh0ncFcc9kl7
         vKS/fM6rPVFQK0jOnWLvXb2EYz8oV+iOq7q/gkdqoTMoB+2EL4GR13YK0ZNghJiRzUni
         pMYoBi3VatF/qy/8jJ/2cIWPPYmPTUoxzEYluIGHUzQvWxYjvggO6SZXD5JfopQEhoS8
         OKeu/vvqxvFdfCahRmStrNyow4c4yson4yIIHKmaoTp4CYUcfH+OhcvkGP802q5kT9Vn
         JCghamVhTay2/TE3QY3MghcAqHZRRq5ZymTaXjsEhtAasnQTNHn3kIkds2Qk3D06f2wV
         qQnQ==
X-Gm-Message-State: ACrzQf3T9msD7le0TkYDV4EMANi2DBodwqMsJsccdloeKLMSrQByxSI7
        TmJkFIdFlzYvoHwVUR2RV8v8wg==
X-Google-Smtp-Source: AMsMyM65BSGZfk37fWVfoZ822v2YVm3uoBhCISkf8YnrW3SkUAOlq2/hfHHyw4bTOyvbhMcwNQtqZQ==
X-Received: by 2002:a05:6512:2304:b0:49b:24a:f0cf with SMTP id o4-20020a056512230400b0049b024af0cfmr8807596lfu.373.1664182152986;
        Mon, 26 Sep 2022 01:49:12 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id a30-20020a194f5e000000b0049d3614463dsm2472453lfk.77.2022.09.26.01.49.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Sep 2022 01:49:12 -0700 (PDT)
Message-ID: <6454e34b-f9b7-257d-4717-4a880998d08f@linaro.org>
Date:   Mon, 26 Sep 2022 10:49:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: Re: [PATCH 1/2] dt-bindings: mfd: qcom,spmi-pmic: adjust pwm node
 validation
Content-Language: en-US
To:     Luca Weiss <luca@z3ntu.xyz>, linux-arm-msm@vger.kernel.org
Cc:     ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Lee Jones <lee@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20220925211744.133947-1-luca@z3ntu.xyz>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220925211744.133947-1-luca@z3ntu.xyz>
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

On 25/09/2022 23:17, Luca Weiss wrote:
> The LPG node doesn't use reg, so adjust the documentation to match that.
> 
> Signed-off-by: Luca Weiss <luca@z3ntu.xyz>
> ---
>  Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml | 8 ++++----

Already sent:

https://lore.kernel.org/all/20220828132648.3624126-2-bryan.odonoghue@linaro.org/

Best regards,
Krzysztof

