Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D919357D199
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 Jul 2022 18:33:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232483AbiGUQdI (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 21 Jul 2022 12:33:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38260 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229513AbiGUQdG (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 21 Jul 2022 12:33:06 -0400
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com [IPv6:2a00:1450:4864:20::22f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8BFE089AA0
        for <linux-arm-msm@vger.kernel.org>; Thu, 21 Jul 2022 09:33:05 -0700 (PDT)
Received: by mail-lj1-x22f.google.com with SMTP id a13so2279772ljr.11
        for <linux-arm-msm@vger.kernel.org>; Thu, 21 Jul 2022 09:33:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=iffrYTg3sVIuxqKWRtih1r3YonbBoKOkVbMWdzc2ePA=;
        b=HO2NDBYcrHDja8jnRvrZq6eaXrJz9BIby8hzuMJq+F0sddvo7BSyLaXpzAFonEzQI4
         N4Xnr5bFs49BpgIup9//yM80iYMw2P2MVlKRUvVNKmy/3Shmh7akaN6p2CYDZ363WoS5
         mxAH6QqzmMCg91Gol4qp3CMCqxcaJJFGpOH/EX9XSwHsGO3NPvuiy/JlHVP2lXCQKw/o
         wM9sCMnl0CE+bcliu2x3+uaefhr8sgJ1irJSM/WEcN8pZ0OG2ShczZFrUGrHYza7edUx
         QmXCAbDhSs6aHFS531H5YgkMMnHYMX3cu0bMCWeSU4OHNV77JpFpAAodxp8+KyM3G0XG
         obbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=iffrYTg3sVIuxqKWRtih1r3YonbBoKOkVbMWdzc2ePA=;
        b=uiwaGg3+9/SzBJ9T3lSZeBPY7aiTy38kZoQbPvX63kdPJxOCTEhQbuFWQtTKVJjqRv
         p2ekdwKDT5hvpAd3sZX69kPDnba4lyqpZla91i12sQ7OMmu7BPfH11Z8sc+Wfn652y4Q
         AOazeK31Y9tdicrfSzEG+OJ18VRMhoED8DuJ0EBj1ZbVokMOaohOxFgFib600tEPju1x
         mBI8KQTRzX85RWaqBX8/NpsMtZEplox1CQ/wRs5JJVPetjs2wbxga+MTY/zqZj2dvV0P
         sujrts5yb+yxCRt9A88yzJRsFFcBfTjAUFCLI68KrWd6HVyehnmJdcGpvQUPJjim27PI
         c2pA==
X-Gm-Message-State: AJIora9SA2QrwvmF3vlgdn5PMilbWFlJ+OR64DfIYdNsyDke/dcKhpfr
        Hy2estPqd54fvBGEk+6voj6mIA==
X-Google-Smtp-Source: AGRyM1vAOzyzzseNyUORZqR4bh2b8onS6sl5MywASjqL55Y6ugmGl6zxZAApdoAeR9EQE4lavDjMRQ==
X-Received: by 2002:a2e:94ce:0:b0:25d:82c6:37fd with SMTP id r14-20020a2e94ce000000b0025d82c637fdmr18280437ljh.15.1658421182140;
        Thu, 21 Jul 2022 09:33:02 -0700 (PDT)
Received: from [192.168.115.193] (89-162-31-138.fiber.signal.no. [89.162.31.138])
        by smtp.gmail.com with ESMTPSA id i4-20020a2ea364000000b0025dec0c29bcsm31125ljn.26.2022.07.21.09.33.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 Jul 2022 09:33:01 -0700 (PDT)
Message-ID: <4b2fe9d0-f590-0fac-79fa-bb05da1d61df@linaro.org>
Date:   Thu, 21 Jul 2022 18:33:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v3 2/2] dt-bindings: arm: qcom: Document additional sku6
 for sc7180 pazquel
Content-Language: en-US
To:     Doug Anderson <dianders@chromium.org>,
        Yunlong Jia <yunlong.jia@ecs.corp-partner.google.com>
Cc:     LKML <linux-kernel@vger.kernel.org>,
        Henry Sun <henrysun@google.com>,
        Bob Moragues <moragues@chromium.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>
References: <20220721033918.v3.1.I10519ca1bf88233702a90e296088808d18cdc7b1@changeid>
 <20220721033918.v3.2.I7ecbb7eeb58c5e6a33e32a3abf4d6874e6cb725c@changeid>
 <CAD=FV=WSBgupLFMCZgianck6uTkAyqrG0WK2ChSbNbJdhOPdLA@mail.gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <CAD=FV=WSBgupLFMCZgianck6uTkAyqrG0WK2ChSbNbJdhOPdLA@mail.gmail.com>
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

On 21/07/2022 15:37, Doug Anderson wrote:
> 
> Not worth sending a new version for, but normally I expect the
> bindings to be patch #1 and the dts change to be patch #2. In any
> case:
> 
> Reviewed-by: Douglas Anderson <dianders@chromium.org>

I would say worth v4, because otherwise patches is not bisectable.


Best regards,
Krzysztof
