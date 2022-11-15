Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8B52F62A0FF
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Nov 2022 19:02:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231596AbiKOSCD (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 15 Nov 2022 13:02:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53746 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238376AbiKOSBs (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 15 Nov 2022 13:01:48 -0500
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com [IPv6:2a00:1450:4864:20::334])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 999011FFBF
        for <linux-arm-msm@vger.kernel.org>; Tue, 15 Nov 2022 10:01:46 -0800 (PST)
Received: by mail-wm1-x334.google.com with SMTP id ja4-20020a05600c556400b003cf6e77f89cso1660045wmb.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 15 Nov 2022 10:01:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ieee.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Q6tyLu//sUdUlLfcb+DLobo5/aUjbDUieQQrm3E0uXs=;
        b=QKK3vP1kJ3b/VDq/Nra/LHQfVXh4tiB8yugNkjQYZiLyNuxM/Lx8EvsLd8ASSZznPf
         NwgpqmLiYOTkSHv76ADFSf41VKWx8zQ8mJt4dsYKH+cqHNwEQX8Wh7ejXPFcFkuCw9lI
         baMyGF7lQH9nHhZg9PVX13r8htppxYKWTRgIc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Q6tyLu//sUdUlLfcb+DLobo5/aUjbDUieQQrm3E0uXs=;
        b=uysrGdqJ6KY4nyDc9ObBSakGkzY1mdyzJvBefB1Te2nE4ZQyBezAFtzHdwKa0b+h4n
         XiE3Uwe+uopHFdjUnW7f8fJfMzovXRPtBG73wah3FwidqKQXBYpGWzFsW+gwo6Z5Ob6E
         K2NeIqEY+FLhowCbvUc63kJ1SvmUzIeJDLK85kGFh87U9NQ0XmKhzqUhbmJDOi7GXq4J
         GR85eja8YL5hBRFxvttX0otN/MLq0UV8j4NgXrR9KN1KIJA0onsUU2HjFBoK6JbV7lca
         ZOeWlcZzDVcxhkFOGj1FNBIxeFGijqgWse8tOdyYdXFvq4LfbMhS9R1n3wYTnYkLHJny
         s7Og==
X-Gm-Message-State: ANoB5pmruiaUXnZsLo4+bUSrkXelMzNTAp7njCuh2RcRjStbSwM1GEDl
        VO7K9XbY+lJ6p0GK5VCm8SRvAg==
X-Google-Smtp-Source: AA0mqf7kpB6uatetwA12Z7FJMUL5Vv9yVzLk2ylYofFLk0c7x+23o2Aq0ZJU541qCl2PbDG4LWyEyw==
X-Received: by 2002:a1c:2581:0:b0:3cf:6a83:c7a3 with SMTP id l123-20020a1c2581000000b003cf6a83c7a3mr2279349wml.21.1668535305126;
        Tue, 15 Nov 2022 10:01:45 -0800 (PST)
Received: from [10.211.55.3] ([167.98.215.174])
        by smtp.googlemail.com with ESMTPSA id c2-20020a05600c0a4200b003cfd4cf0761sm14788029wmq.1.2022.11.15.10.01.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Nov 2022 10:01:44 -0800 (PST)
Message-ID: <96374132-d05f-0b78-0b9c-8818c39fcec8@ieee.org>
Date:   Tue, 15 Nov 2022 12:01:43 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux aarch64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH net-next v2 4/5] dt-bindings: net: qcom,ipa: support
 skipping GSI firmware load
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Alex Elder <elder@linaro.org>, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, davem@davemloft.net,
        edumazet@google.com, kuba@kernel.org, pabeni@redhat.com
Cc:     andersson@kernel.org, konrad.dybcio@linaro.org, agross@kernel.org,
        elder@kernel.org, linux-arm-msm@vger.kernel.org,
        netdev@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20221115113119.249893-1-elder@linaro.org>
 <20221115113119.249893-5-elder@linaro.org>
 <a4c4257b-1467-2ccb-f546-d58c6356a39a@linaro.org>
Content-Language: en-US
From:   Alex Elder <elder@ieee.org>
In-Reply-To: <a4c4257b-1467-2ccb-f546-d58c6356a39a@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 11/15/22 06:56, Krzysztof Kozlowski wrote:
> This is a friendly reminder during the review process.

Yes as soon as I saw your message I remembered that I'd forgotten
to add your reviewed-by tag.  I can send v3, but if the network
maintainers are willing they could generously add it for me.

					-Alex
