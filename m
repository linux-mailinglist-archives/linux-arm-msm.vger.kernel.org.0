Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 917575EF1AB
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Sep 2022 11:18:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234970AbiI2JSe (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 29 Sep 2022 05:18:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54088 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234939AbiI2JSd (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 29 Sep 2022 05:18:33 -0400
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 011621406C3
        for <linux-arm-msm@vger.kernel.org>; Thu, 29 Sep 2022 02:18:31 -0700 (PDT)
Received: by mail-lf1-x129.google.com with SMTP id g1so1299495lfu.12
        for <linux-arm-msm@vger.kernel.org>; Thu, 29 Sep 2022 02:18:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=kc3ZUAL7WQah+/Fhr7W6V5w2wd3MWGg+6pISLsDcInI=;
        b=JbmOPO8O2IY9w37qC7AVYBpBYGgWcdUCkEiLm8j+zcd4hRAzkLPmZ+c3bnIosKBndN
         wK9E3rxJR3x6JVVKBgsSD24SB7hLAzlfYm5Zti4nsPymgLjh34ONJr8ZvIhzIW8l0iRH
         S/YDDAvInXynnGoumULv4WmWN4VcLm+8nQe6S4y0+S/9kugebPCatJ2TwiJfA3EgO7Zy
         5TaExbvcociEVLuC2CTFYxkmbowZTquZEMXY7wVD6y8ygxGe72teB4jISwpqVSJYPvUr
         kQWlGiETkGNtN4b9klUQgx+6YhEgaZ+5v+h3dgh5DJSIlodlzDGlMUf0olH2yUE7qq/y
         2ccw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=kc3ZUAL7WQah+/Fhr7W6V5w2wd3MWGg+6pISLsDcInI=;
        b=B40L2b++VhE6PfSf3Ph5aEy2kzKuS9JT6aCQc4U8Wk5jUOO9er3/dZC8AL9qxL/jfn
         4+vvsS2rRg9vvh26thxKW4KbgA+U0Cu1InhuVezRoz5z217I/0ROpicRJdmVB8aSD6G2
         ILJIiGWm3rYqUCjZdk4TabZGUkZEWPXMHZpVTwYOJgb/L9KryD6bntT/obBLq53kbDAq
         UTHqWl8YYlbwBxglIe0t+qIMKjzDKNhobqLNLQnJxspOsBIbGNvqWXXfeGv/M9SeVrYh
         AJet6zZjHoKij0EOlAZHiZnZ/Js8n+1QUoiM7pTrKJm25C45ZTbzUF0Ot/oYu9qRgZ6b
         8/Eg==
X-Gm-Message-State: ACrzQf28uU5kR+08j78Yd837gYPO0bsF8qMZLyjPS9CS1iITHxWOlC8B
        1zkIBBMWR/p+EaZdXQTOhkqhnFJjn0GaDQ==
X-Google-Smtp-Source: AMsMyM4EF0p2/Ik6h93Z4rtV/D0MipOZQ/7AOh7OhdvB4Fu2GeKp4pWrtAvsv9AbEbQt1WQhZM2aog==
X-Received: by 2002:a19:5015:0:b0:498:fe6c:39de with SMTP id e21-20020a195015000000b00498fe6c39demr857252lfb.263.1664443110397;
        Thu, 29 Sep 2022 02:18:30 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id k17-20020ac24f11000000b004896ed8dce3sm729637lfr.2.2022.09.29.02.18.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Sep 2022 02:18:30 -0700 (PDT)
Message-ID: <3bef6840-9d68-68e5-0a7e-7e8c06c31025@linaro.org>
Date:   Thu, 29 Sep 2022 11:18:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: Re: [PATCH v5 2/5] dt-bindings: remoteproc: qcom: Convert wcnss
 documentation to YAML
Content-Language: en-US
To:     Sireesh Kodali <sireeshkodali1@gmail.com>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht, linux-kernel@vger.kernel.org
Cc:     andersson@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh+dt@kernel.org>
References: <20220929050209.1464526-1-sireeshkodali1@gmail.com>
 <20220929050209.1464526-3-sireeshkodali1@gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220929050209.1464526-3-sireeshkodali1@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-6.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 29/09/2022 07:02, Sireesh Kodali wrote:
> This is a direct conversion of the existing txt documentation to YAML.
> It is in preparation for the addition of pronto-v3 to the docs. This
> patch doesn't document any of the existing subnodes/properties that are
> not documented in the existing txt file. That is done in a separate
> patch.
> 
> Signed-off-by: Sireesh Kodali <sireeshkodali1@gmail.com>
> ---


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

