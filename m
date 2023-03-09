Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A47286B1E11
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Mar 2023 09:29:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230104AbjCII3k (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 9 Mar 2023 03:29:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60900 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230094AbjCII3X (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 9 Mar 2023 03:29:23 -0500
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com [IPv6:2a00:1450:4864:20::533])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 99F11E487C
        for <linux-arm-msm@vger.kernel.org>; Thu,  9 Mar 2023 00:27:27 -0800 (PST)
Received: by mail-ed1-x533.google.com with SMTP id a25so3982342edb.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 Mar 2023 00:27:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678350445;
        h=content-transfer-encoding:in-reply-to:from:cc:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YYduG/Bcmu9NPPmwSKTMuZPf8YDgxXGdRWgnP+qoWu8=;
        b=rkmkI5jIk3QDSxiUKCdxvPJQEePjs3LY0yNfoBgsvBatlCgroAG+UJ4n8jlWm1z+zf
         4H1usWjTSumuMp1VzkFlTZnivzb8i13sivLkMtfNTW8Xt57xZK1P5vkxXu7x7BzMSRmo
         NQnyeBNU/R+NYKURr3PmwgSIjP/Wlh66PgD+bPuUaeS17TgivgWfHGi1b9ZPttv7ivfp
         yRisWYwTTP2iiihu4LydgdJ0lmF6q20rC2yRulLRexozjHBmwGDI56doy6C9olIlzxaY
         iK1kLyH0eW5yoTNwK0B18/skQ7VvLF84Rt0Mekw06Ci3MSL8hfBN2fX0rzSoXDbF47sc
         Q2Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678350445;
        h=content-transfer-encoding:in-reply-to:from:cc:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YYduG/Bcmu9NPPmwSKTMuZPf8YDgxXGdRWgnP+qoWu8=;
        b=Cvrrin/5ZKKfTuaN+vuXKQR7LhjxyTiw2xnALqXO6IkURkyFprQ5IV2gZGxY2IrztH
         KoaDRhd8ZCofb8UtpBhrNkmJV9evXnqo85fcfZAjK41dTvo5Ue3+ssNr15LxXfCBJ9EE
         D6n5iiMEZMKtY+GROY91hW5vam3fMB9JNq+hvFwPvddzb/vYb4YntY4eHJpCK8fQ8zlV
         aDoSq0zNhmmfTkzbtk0pfQrsiv7D9KNi/r0fNV/LEoYGqvvv25mnKCU52tP+w/m8i7PS
         8FMIO6eXrfkh6t7ELaO3HDNVfiFpog6yxVYAf6vZL+x8ZKM0DrLt2+iHXIUVdGWB3gIh
         /KuQ==
X-Gm-Message-State: AO0yUKVi+iys7YkxUJsFqRsrnp9lwWDq/uAAfPn80gIkg9pMqFwtNieH
        P9oK2l+/2teu1n+WOOLCN6/o3w==
X-Google-Smtp-Source: AK7set/hGQYMclII6drCi+1VpLYiPnyopU8ViBSDK48kAcF5QPIQpFX3tD0Q3oPoOgezzIW+XkG8qg==
X-Received: by 2002:aa7:d84a:0:b0:4ad:316:b4e6 with SMTP id f10-20020aa7d84a000000b004ad0316b4e6mr20325419eds.42.1678350445264;
        Thu, 09 Mar 2023 00:27:25 -0800 (PST)
Received: from ?IPV6:2a02:810d:15c0:828:7ee2:e73e:802e:45c1? ([2a02:810d:15c0:828:7ee2:e73e:802e:45c1])
        by smtp.gmail.com with ESMTPSA id w22-20020a17090633d600b008b907006d5dsm8665494eja.173.2023.03.09.00.27.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Mar 2023 00:27:24 -0800 (PST)
Message-ID: <4b115ff2-a137-dd12-472c-f2248ce6350a@linaro.org>
Date:   Thu, 9 Mar 2023 09:27:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 2/3] dt-bindings: remoteproc: qcom,sm6115-pas: correct
 memory-region constraints
Content-Language: en-US
To:     Bhupesh Sharma <bhupesh.sharma@linaro.org>
References: <20230309082446.37362-1-krzysztof.kozlowski@linaro.org>
 <20230309082446.37362-2-krzysztof.kozlowski@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230309082446.37362-2-krzysztof.kozlowski@linaro.org>
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

On 09/03/2023 09:24, Krzysztof Kozlowski wrote:
> Qualcomm PAS devices expect exactly one memory region, not many.  Also,
> the memory-region is now defined in device specific binding, not in
> qcom,pas-common.yaml, thus also require it in the same place.
> 
> Fixes: 838c558bb8bc ("dt-bindings: remoteproc: qcom: Add sm6115 pas yaml file")
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

I think the sm6115 was not yet merged, thus maybe this patch is not
needed. If it wasn't merged, please squash it with original submission
and send new viersion.

Best regards,
Krzysztof

