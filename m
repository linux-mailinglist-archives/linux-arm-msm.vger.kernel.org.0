Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 586D64C49BD
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Feb 2022 16:55:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239004AbiBYPzK (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 25 Feb 2022 10:55:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39834 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242462AbiBYPzG (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 25 Feb 2022 10:55:06 -0500
Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 840091DC988
        for <linux-arm-msm@vger.kernel.org>; Fri, 25 Feb 2022 07:54:33 -0800 (PST)
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com [209.85.221.70])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 4E65A3F1A1
        for <linux-arm-msm@vger.kernel.org>; Fri, 25 Feb 2022 15:54:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1645804472;
        bh=ouYw861PBb4TrQfZvscDmF7VmBdgdNmfagROVWpjg6Q=;
        h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
         In-Reply-To:Content-Type;
        b=eb10NVJYId60LXHeXZ029yamG5C+m+e6HR8DDfm8IAZnkWW5F46b+I899ggt8kUFK
         jAwAsTR+6pOCDObrXdpTflIcHemnOs6OC+XQfhK9edKLdCcurk2ocS/ybqEtCkpawV
         Q182Z7jPMLW9565CjdLBK0D9JNgzdJU16GkP3OefSzw8a9+U0QORDJEUjlhI4ozXZ5
         BSXei2lBfc7ra7hfia3xmmvWk8pIc8PbWeQlvh+Z+g0pX9GaJUy6GNgS4iN9bgLSyd
         movZCR1+JI/5sM30Gpm252tUOgbNT+ZOFjRF1rXNbCNUUignXxOZJas/ssMpzSQ5Wu
         gGZZxO7taa/5g==
Received: by mail-wr1-f70.google.com with SMTP id k20-20020adfc714000000b001e305cd1597so1024324wrg.19
        for <linux-arm-msm@vger.kernel.org>; Fri, 25 Feb 2022 07:54:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=ouYw861PBb4TrQfZvscDmF7VmBdgdNmfagROVWpjg6Q=;
        b=SA0TCQu1Ar0NKHq7kLtd05yOTqluw7MMhwkfnuL6HWTit6lxTtQyeSrkLJgxJ9ZSPc
         hC5d98beSKAGGrmtqMg2iTR2Y6iPXGvDwP1KWT2WdwVUbUHPBrANiL7wwbHLEvhFqptP
         coee8iMRMCaQwMUZZ9jj+NBcdCDOtyGgldQeDf0dt6qjo/PgsJDW0Krq2L9obldhSh+j
         +ip8ylLxm1rXTPgvwF3SYYcEUHy4dPzT8FeuAHuJG0GQnYQV1L60nsy7SNftENLZRfw0
         CGHLw8pLFkKo4h4q1s1DhPrLje4FzW4Dz0S5ERB/GNNjYPFHJy+Bo4IaMnH8ZL3O2j4r
         8Cag==
X-Gm-Message-State: AOAM533gw5o1pdX9NjNokOvR1qeblGnc2oksi7l7/5QEqVl0ooD3UoqS
        5adwhGTZb95HmmD+w3lRtiALgg9HtuVnzgTPeG2U0YDztlVN7OEKq0iugvRaxsej0xO6ayC1zmI
        hwckiXBY+WG/ShFb6USwY/sZoe0xfFLtVTC2jHZqa/i0=
X-Received: by 2002:a5d:584c:0:b0:1e8:88b8:419c with SMTP id i12-20020a5d584c000000b001e888b8419cmr6975729wrf.96.1645804472042;
        Fri, 25 Feb 2022 07:54:32 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwSy6zmHkvN0jOvBdaFqnPofjL1tVeT2Ad/dBAi2F04eFTRfUM9AEDrUny0g3KKLPCrwn+JVg==
X-Received: by 2002:a5d:584c:0:b0:1e8:88b8:419c with SMTP id i12-20020a5d584c000000b001e888b8419cmr6975716wrf.96.1645804471886;
        Fri, 25 Feb 2022 07:54:31 -0800 (PST)
Received: from [192.168.0.133] (xdsl-188-155-181-108.adslplus.ch. [188.155.181.108])
        by smtp.gmail.com with ESMTPSA id q7-20020adfc507000000b001ed9f31afdcsm2593072wrf.3.2022.02.25.07.54.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Feb 2022 07:54:31 -0800 (PST)
Message-ID: <ec083f3c-b4b8-c3d0-fab3-2af5c4195d90@canonical.com>
Date:   Fri, 25 Feb 2022 16:54:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 1/2] dt-bindings: interconnect: qcom: Add sc8280xp binding
Content-Language: en-US
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Georgi Djakov <djakov@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Odelu Kukatla <okukatla@codeaurora.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20220225042710.2317732-1-bjorn.andersson@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
In-Reply-To: <20220225042710.2317732-1-bjorn.andersson@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 25/02/2022 05:27, Bjorn Andersson wrote:
> The Qualcomm SC8280XP platform has the usual set of busses, add a
> binding for these interconnect providers and port definitions to allow
> interconnect paths to be expressed in the sc8280xp DeviceTree.
> 
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---
>  .../bindings/interconnect/qcom,rpmh.yaml      |  12 +
>  .../dt-bindings/interconnect/qcom,sc8280xp.h  | 232 ++++++++++++++++++
>  2 files changed, 244 insertions(+)
>  create mode 100644 include/dt-bindings/interconnect/qcom,sc8280xp.h
> 


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>


Best regards,
Krzysztof
