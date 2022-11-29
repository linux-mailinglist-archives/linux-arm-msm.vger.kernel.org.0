Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4D4F563BE2B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Nov 2022 11:42:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231415AbiK2KmL (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 29 Nov 2022 05:42:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59194 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231741AbiK2Klr (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 29 Nov 2022 05:41:47 -0500
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com [IPv6:2a00:1450:4864:20::229])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9CA0A5E9C1
        for <linux-arm-msm@vger.kernel.org>; Tue, 29 Nov 2022 02:41:45 -0800 (PST)
Received: by mail-lj1-x229.google.com with SMTP id q7so16295594ljp.9
        for <linux-arm-msm@vger.kernel.org>; Tue, 29 Nov 2022 02:41:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZtYXzRsTdCq7std1aGVz0fXEow/AILibVpfL8OE22Yo=;
        b=MdV7zEj9ROHn4e36hiD7oewmaODUFIunGTw3JmhO4L9iPZF7FqJIwlpvCPSBsmzGmg
         naisABNFfyln+Noz8k3CV1tUHry9qew7pujXB5n1wqn+es5COz10ZGSDWbOZlxHZuWqK
         KpDFdeQHN5ypuEeNfjVJIZxWmPdY/b1UoLS6Dby7PrC84ihCGw4RQJoC3iHDOPf5Iejt
         wZF1mi7hXDnQukn+Bin5KsxttuWUM/k5usY/2pEWmB5zT1+6GObEks7WACidnj3WdCCr
         eL4jLYWGlz5sbyUdRLe2zRRN7EQSHh1bb00ELitkIpxkNgFvLZKQat6z4sVvrTBLCZLY
         LiuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZtYXzRsTdCq7std1aGVz0fXEow/AILibVpfL8OE22Yo=;
        b=UHPJLfl7zYaIx1NWvJYLxTfTs3NWc+y+s4NlflGLMD9HaUbZ6UvNtoNuCkSzHz7sLp
         1eMAYaMCXi3mFfBg+zy8XjgNB1S2ip1YoDoxbhFIYJ+IbEH3saNmtDKbc+w2iVgjKNlr
         IyBD+Mi7M8LY0lqMnHjUReOU2S5cimlyrTUR6QjFUoR2nYFUpmL/ygotY1DuJt6foNob
         v6XnQIY93BFz1goRNIx1LhkPqNzZ0j0lIoJ9k7d/1GWEJKQyl80rTbYjI6vLEvUl7Vwz
         nc9FzcMWTq4UyK/QykVCM2h+gUED01B4I4AfNl4pqAIx58Y0mrIwzCE7DW9k9Cf+Bu0c
         IWxQ==
X-Gm-Message-State: ANoB5pmCEhMG1lnHY/bw5GyBOPPJKPr6TzfYNzQyJ3JMAyiLghNec7Pv
        kRhOGVLbLdfBdmvW5bjshAa53Q==
X-Google-Smtp-Source: AA0mqf7iflJ7icsv7xJShrnlf0ZQgs2OdTmBUZjjCorvootyqYjFgXqgXLJ/mlsk8WYmYT6NF7DyfQ==
X-Received: by 2002:a2e:b88d:0:b0:277:452a:473c with SMTP id r13-20020a2eb88d000000b00277452a473cmr12160111ljp.454.1669718503998;
        Tue, 29 Nov 2022 02:41:43 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id s19-20020a2eb633000000b002772414817esm1493598ljn.1.2022.11.29.02.41.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Nov 2022 02:41:43 -0800 (PST)
Message-ID: <db270248-fc0a-6958-a43a-4ce01ae08347@linaro.org>
Date:   Tue, 29 Nov 2022 11:41:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH v6 1/2] dt-bindings: arm: qcom: Add zombie
Content-Language: en-US
To:     Owen Yang <ecs.taipeikernel@gmail.com>,
        LKML <linux-kernel@vger.kernel.org>
Cc:     Bob Moragues <moragues@google.com>,
        Matthias Kaehlcke <mka@google.com>, Harvey <hunge@google.com>,
        Stephen Boyd <swboyd@chromium.org>,
        Gavin Lee <gavin.lee@ecs.com.tw>,
        Doug Anderson <dianders@chromium.org>,
        Abner Yen <abner.yen@ecs.com.tw>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
References: <20221129183213.v6.1.Idfcba5344b7995b44b7fa2e20f1aa4351defeca6@changeid>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221129183213.v6.1.Idfcba5344b7995b44b7fa2e20f1aa4351defeca6@changeid>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 29/11/2022 11:32, Owen Yang wrote:
> Add an entry in the device tree binding for sc7280-zombie.
> 
> Signed-off-by: Owen Yang <ecs.taipeikernel@gmail.com>

Really, you ignore for the second time. When you missed my tag for the
first time, I gave you comprehensive instruction what you should do. So
what - you ignored the instruction now? Do you even read the feedback
you receive?

It's a waste of my time. Implement what you have been asked to.

Best regards,
Krzysztof

