Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0BAAC7173B9
	for <lists+linux-arm-msm@lfdr.de>; Wed, 31 May 2023 04:32:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231558AbjEaCcS (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 30 May 2023 22:32:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57000 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230465AbjEaCcR (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 30 May 2023 22:32:17 -0400
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CE40E9F
        for <linux-arm-msm@vger.kernel.org>; Tue, 30 May 2023 19:32:15 -0700 (PDT)
Received: by mail-lf1-x136.google.com with SMTP id 2adb3069b0e04-4f3b5881734so6051042e87.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 30 May 2023 19:32:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1685500334; x=1688092334;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3itwahMmB1UBwkG6X+PepeOiTL6PAVjXLX5f9/pMwaU=;
        b=VFlwuGeO8w/pM/AeJMgyHF+FMli5xaj0d799vMfLPhQvJ2I2IJXMWdCE+asTMgrIPF
         or1ApbAZF89qVcpC02gu0Lj8ZBV36YKb+BmEmB2IVc/n72SoPo9YGlCoTEwsZMSlY27Z
         Tvdh2QDTo+hcJNpe93g0NTrMsT5aOqFKHSEG+VR5J4+qMD9GkO3VKUA+FnqNvd4Y23RF
         hyHDO4E3qbU3IADheDziPv4e7jrevSYdQAOmtRfzWAvQCxGp7qzbPkD6uYWvBr7kmSTG
         aUGQ782hCrsu6kvtYxOiumciZSFEH7xmFaz9oxeOSenMHbn8CTpBjvKpqkd3HHgyHhOw
         IsGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685500334; x=1688092334;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3itwahMmB1UBwkG6X+PepeOiTL6PAVjXLX5f9/pMwaU=;
        b=LVBMWV8rt4mr8YHSgaWfbH4a/GgNTimJjbxtmyTgVJHFbCo3WxGlrlSfo4BK561qAz
         uzDrH5CaIb13NCcHt/4lENZ96BTQFV661RsDEyY67Z7Gni/vMrw/4Df5gjyvFb3jO8Wx
         u2AEquROGvRHOux8jLfQ9efeahjfc1VRTHI+WNi4WUC3kyzLEqOgWIOW3nWPRvJL4vop
         TzkVbMgKjcTYsD5GJwMjR1gtST5qWtcoHAdH0tkl7V8lrUELkddtfqv3VxXz/XwnH57c
         tItpapyl5uUMmBtZY5D2B2GZuKmtK795965IxsfiSSVqJ5IDZ0f5lWF/0NR0LfO8Hgc3
         PI9Q==
X-Gm-Message-State: AC+VfDylIa310gdpFkJlpoKRbGLySayj24HhZmxfnQw+UF83Hxnhojcs
        der6DQzM893BoxAPEnVnq1+HJUnkGW5libxIU0c=
X-Google-Smtp-Source: ACHHUZ7iWvIFNpO8N8bZ9ErNMxB2P1HCXawHic779aRrQlo4wiur+nVpGLwirk5d7dh8rYrBcPD2iw==
X-Received: by 2002:ac2:515e:0:b0:4f3:bb14:6bac with SMTP id q30-20020ac2515e000000b004f3bb146bacmr1742359lfd.56.1685500334110;
        Tue, 30 May 2023 19:32:14 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a0db:1f00::8a5? (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
        by smtp.gmail.com with ESMTPSA id o13-20020ac2494d000000b004f38a139073sm533010lfi.12.2023.05.30.19.32.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 May 2023 19:32:13 -0700 (PDT)
Message-ID: <e5a7efed-0124-a9a5-167d-21542155c288@linaro.org>
Date:   Wed, 31 May 2023 05:32:12 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v2 4/5] dt-bindings: phy: qcom,msm8996-qmp-usb3-phy: drop
 legacy bindings
Content-Language: en-GB
To:     Krzysztof Kozlowski <krzk@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>
Cc:     Philipp Zabel <p.zabel@pengutronix.de>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org
References: <20230521193635.3078983-1-dmitry.baryshkov@linaro.org>
 <20230521193635.3078983-5-dmitry.baryshkov@linaro.org>
 <c22c21d3-b34d-7d09-1302-f67adb9ac3e9@kernel.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <c22c21d3-b34d-7d09-1302-f67adb9ac3e9@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 30/05/2023 14:51, Krzysztof Kozlowski wrote:
> On 21/05/2023 21:36, Dmitry Baryshkov wrote:
>> The qcom,msm8996-qmp-usb3-phy.yaml defines bindings for several PHYs
>> which predate USB -> USB+DP migration. Now as sm8150 has been migrated,
>> drop the legacy bindings completely. No device trees use them anymore.
>> Newer USB+DP bindings should use combo bindings from the beginning.
>>
>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> 
> Please use scripts/get_maintainers.pl to get a list of necessary people
> and lists to CC.  It might happen, that command when run on an older
> kernel, gives you outdated entries.  Therefore please be sure you base
> your patches on recent Linux kernel.
> 
> You missed at least DT list (maybe more), so this won't be tested.
> Please resend and include all necessary entries.

The resend was sent minutes after sending this series. But I'll anyway 
send v3 to fix the issue reported by Caleb.

-- 
With best wishes
Dmitry

