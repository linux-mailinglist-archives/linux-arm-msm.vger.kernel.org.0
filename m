Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D15AD583C2C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 Jul 2022 12:38:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236044AbiG1Ki3 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 28 Jul 2022 06:38:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35074 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236038AbiG1Ki1 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 28 Jul 2022 06:38:27 -0400
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 53BF8564C1
        for <linux-arm-msm@vger.kernel.org>; Thu, 28 Jul 2022 03:38:26 -0700 (PDT)
Received: by mail-lf1-x12a.google.com with SMTP id w15so2185982lft.11
        for <linux-arm-msm@vger.kernel.org>; Thu, 28 Jul 2022 03:38:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=8m/gkzSEeNVGRFeYIZRczc0LCDlyyEDYTWCS8S+fEHE=;
        b=XqLaXF2NeoAQW2dMnoSIDTZU0KG6eCdZEAY5fhmVPd/5x50fX4JXudcgltKeyaotQ0
         O5ULowKZ4NKoWL2xhBvMkDBRHlO+3nZnyD8rVN0R1USPZ5NqUi53UsRnmrRriN3vSfR6
         H/4PSGLLVf+pz3k34Epn+3R6uSXJEaaEinGw5oBQmu2/vBKiVsFg8d5CHssFfN1khEGK
         CEC3/E/6j4XJQ+X7zbw1+0HDRvHXdG8YrYuQJl2B+KJlqxsllu1E9xZTjEGFKKoqdkc2
         RXOVtqLeYuiHlVZeS3f7HeKxk8Y8d3cTS+oUii8HaBeXv1mSk7fTYM+2ildVCtirszrh
         KqZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=8m/gkzSEeNVGRFeYIZRczc0LCDlyyEDYTWCS8S+fEHE=;
        b=kklyG5zSncnC9YMnDShzb8cEMBD0/qb81aIux0d4VHtrZ5T+sKe3N839gbzWjkkjXf
         3qxlORXujOzpeAFq/bWOqWN9BbU0FbpCbEpOZ7pwFBYGS/7W/soR87nYv0BeGjPHZgrI
         XTKRs82UlON9scI9rW4cxGiiRQOAtkGZvzF4AQuv9/NzG2+AmORCyJ0wE5soK3WF1oOY
         SM1+sSy4+u2/DhdS/67vhwMLk+WNhIOEknkDbtpIvvMU1PaneE+RLhyj3gaTvp6FM1i+
         5khI34QWHQpnmbBd9e5Q/MiuYlaHtn6ezqk6RWFo8xbMyDkHn/D/krhhYMoCRnrEykgu
         NIzg==
X-Gm-Message-State: AJIora8gbD/MDQ0PIDmuBgsJE+tdpLqLD46ZI6XvQWYd9IqQY5laA0KD
        7WRkNrJI1toZV6W3c0AGe7MGgQ==
X-Google-Smtp-Source: AGRyM1s0UetzE1MnFh1Eb1ryFBat7KSzR7WNDyYfOitPLcyRuZriydrL2o7MLluKluE7GI2HTDn+cA==
X-Received: by 2002:a05:6512:3b81:b0:48a:9787:7837 with SMTP id g1-20020a0565123b8100b0048a97877837mr6118077lfv.678.1659004704638;
        Thu, 28 Jul 2022 03:38:24 -0700 (PDT)
Received: from [192.168.3.197] (78-26-46-173.network.trollfjord.no. [78.26.46.173])
        by smtp.gmail.com with ESMTPSA id r1-20020a2e8e21000000b0025e0a13bf42sm76850ljk.53.2022.07.28.03.38.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 28 Jul 2022 03:38:24 -0700 (PDT)
Message-ID: <d8510e53-673a-7913-32be-1be691a79511@linaro.org>
Date:   Thu, 28 Jul 2022 12:38:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH 4/4] dt-bindings: firmware: Add Qualcomm UEFI Secure
 Application client
Content-Language: en-US
To:     Maximilian Luz <luzmaximilian@gmail.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Ard Biesheuvel <ardb@kernel.org>
Cc:     Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Steev Klimaszewski <steev@kali.org>,
        Shawn Guo <shawn.guo@linaro.org>,
        Sudeep Holla <sudeep.holla@arm.com>,
        Cristian Marussi <cristian.marussi@arm.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-arm-msm@vger.kernel.org, linux-efi@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Vinod Koul <vkoul@kernel.org>
References: <20220723224949.1089973-1-luzmaximilian@gmail.com>
 <20220723224949.1089973-5-luzmaximilian@gmail.com>
 <e88d1036-dc58-3fc8-c388-edba9b2d62a7@linaro.org>
 <87c19c5a-d7f4-7183-1322-f62267e01b3b@gmail.com>
 <11e5c369-c0da-7756-b9e2-ac375dc78e9d@linaro.org>
 <2e522bcd-5d55-e87f-126c-514f5edaa560@gmail.com>
 <53a602e2-0590-6c6a-597b-fd55faa3a4ab@linaro.org>
 <acd7b231-3167-e35c-5cdf-8b3127a7d710@gmail.com>
 <95cbcda8-d1bc-376c-b338-92d1b923f04a@linaro.org>
 <fe2b820b-9f3b-814b-4792-e6685b13ede6@gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <fe2b820b-9f3b-814b-4792-e6685b13ede6@gmail.com>
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

On 28/07/2022 12:25, Maximilian Luz wrote:
> On 7/28/22 09:48, Krzysztof Kozlowski wrote:
> 
> [...]
> 
>>
>> For example like tegra_bpmp_get() is doing.
> 
> But tegra_bpmp_get() can also not differentiate whether the supplier driver is
> ever going to be successfully probed or not. I'm not sure you can ever really
> solve that. The only thing it does in addition is check whether the phandle and
> device is there. Or do you mean those not being present by "broken"? That's a
> point I agree should be improved with SCM.

Yes, at least it checks if phandles points to proper device and device
is there. That's what we want.

We are not solving here case of providing being in a module which never
gets loaded (thus endless EPROBE_DEFER). Such case is ok.

Best regards,
Krzysztof
