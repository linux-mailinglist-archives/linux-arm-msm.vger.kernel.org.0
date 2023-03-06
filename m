Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 84A416ABF33
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Mar 2023 13:11:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229571AbjCFMLW (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 6 Mar 2023 07:11:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35712 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229867AbjCFMLV (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 6 Mar 2023 07:11:21 -0500
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com [IPv6:2a00:1450:4864:20::52a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CDA62136CC
        for <linux-arm-msm@vger.kernel.org>; Mon,  6 Mar 2023 04:11:19 -0800 (PST)
Received: by mail-ed1-x52a.google.com with SMTP id ec29so6740426edb.6
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Mar 2023 04:11:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678104678;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dXXDv20oyIhFDtsn9uklD9c0zy8fR1z46fgL4x2Jxss=;
        b=wxJIF7g78D64zgpqvEfsgdLluKGUIF/zdeI93/iv7RlNvV9WkHrhYmLOXsl1n4QiEG
         NkwhwNmGxrJ4pk5NU7CYEnxcwiVPVgQmGuvM+hMdKOhTmLX5T+xCUD2G3S0LUbjUB4+h
         ml+DtRbsZTKZk4R9/+Jjg8VnrNC9ycwVswuYea3Np06WBqpvjktvWcsKmY4qXYNzhF0a
         cVA3Itsje1C7UaSSvSfjd1xbWR5bYIC5nlZPAHskN3JSs/Y4pX5odt25aPyVpNSr0APN
         xi7/HziJK2O5SRpD8WatJwh7Tl3O/Cs9Nq3xRZRbF3++/gsrN3PZdPma2/8xpUwiMIBP
         yUbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678104678;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dXXDv20oyIhFDtsn9uklD9c0zy8fR1z46fgL4x2Jxss=;
        b=cehEqRgAsM5XUEbiNMTCna1n9w/LqdLDgccZ5syO+QmfjpQAzOPVXYl8QHue2SNCYc
         tMA2QCbmL6o9L8ujAks5sCXkAxAEATY4c41CBIgG+2yoNK19V30c/dpmsFD7bGJQEq/t
         gAWJBos6JqiHfrdgBsZbek07hUIZvy9cGeEsdy0twXz15paJxqh0I9U/ISjTQUdtOtyJ
         Srk3Hyc4UWE0V9niboavw45DfJ1IruCDcmIX+bTC2wA1KmZf+shl8JhujRHVj14SRUSA
         m28moSYWycmP8Pp6onbwjL3vaIRDmyaThWXc0c8IOjrGeRzGJXUQyUW/XPBYVDhafsg4
         ZXTQ==
X-Gm-Message-State: AO0yUKUUxz45fX2ASxMJhEWrJ2vqTOEWNIWGr/V2PJ35t9kFLl3SDVVA
        vFCYIexYnFLaI1aD2FJP6B4j2ick6nsPKwEsqEg=
X-Google-Smtp-Source: AK7set+GU4fNOIsRhOI6jqzg9s/8MOc2CKjbbixF+E7Ssdt+X7llMyzpDfa8nJ7SCAXWvtmieBwuwQ==
X-Received: by 2002:a17:906:1604:b0:8ef:fd8:9d04 with SMTP id m4-20020a170906160400b008ef0fd89d04mr9781846ejd.27.1678104678318;
        Mon, 06 Mar 2023 04:11:18 -0800 (PST)
Received: from ?IPV6:2a02:810d:15c0:828:d85d:5a4b:9830:fcfe? ([2a02:810d:15c0:828:d85d:5a4b:9830:fcfe])
        by smtp.gmail.com with ESMTPSA id ku17-20020a170907789100b008def483cf79sm4437909ejc.168.2023.03.06.04.11.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Mar 2023 04:11:17 -0800 (PST)
Message-ID: <518fd95b-4b8c-108b-8525-4ffd093380f0@linaro.org>
Date:   Mon, 6 Mar 2023 13:11:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH] dt-bindings: mfd: qcom-spmi-pmic: add pm8450 entry
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Lee Jones <lee@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Stephen Boyd <sboyd@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
References: <20230306112129.3687744-1-dmitry.baryshkov@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230306112129.3687744-1-dmitry.baryshkov@linaro.org>
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

On 06/03/2023 12:21, Dmitry Baryshkov wrote:
> Add bindings for the PM8450 PMIC (qcom,pm8450).
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

https://lore.kernel.org/all/20221217003349.546852-2-dmitry.baryshkov@linaro.org/

Keep changelog and tags.

Best regards,
Krzysztof

