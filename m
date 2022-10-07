Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C387E5F7B30
	for <lists+linux-arm-msm@lfdr.de>; Fri,  7 Oct 2022 18:11:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229874AbiJGQLJ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 7 Oct 2022 12:11:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59188 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229555AbiJGQLI (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 7 Oct 2022 12:11:08 -0400
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com [IPv6:2a00:1450:4864:20::22f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A620BDD880
        for <linux-arm-msm@vger.kernel.org>; Fri,  7 Oct 2022 09:11:04 -0700 (PDT)
Received: by mail-lj1-x22f.google.com with SMTP id f9so6220708ljk.12
        for <linux-arm-msm@vger.kernel.org>; Fri, 07 Oct 2022 09:11:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6Gvc8fqi/2AEmdHY604fpet8nsmZJz86UxEHbRfCTg4=;
        b=Wu6OTYc9nqxwhKUhzjWzKdAigZFIIZdvCmxw3qO2c+L5VA1Sb/kW0GqiBJNy5+eul0
         7JziFuVTEH4M9qYXM+kMTXf1uf52ne5JuuPHVAXtWwwKahIzZ/lKPBPIC1saXb2sz3A7
         1m5bXCtijVS7shIGzKwnmtoRsfmOSmImviwe9RxP9iGH3ufZ4pMpXkMbn9w9nWIiidVE
         t3lxE3rRg23XT8r219PxluxI/oXSukV+Q1D6b+ja2Wp8RIwQTH+aR3dBXG2BbkI20ntg
         nV8cl8PhWJpmWfhqtxStSjg3MOfZTnu7lgANgcPpB952EtUBn+Re5csSw+koe6cgHGJ5
         yvlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6Gvc8fqi/2AEmdHY604fpet8nsmZJz86UxEHbRfCTg4=;
        b=2B/Lj82mOaGbb+hIKpncKRN23GrSYPzT6L7BB2kez2Vq+f9K/oZ+HYVYhMxW/dEl91
         OXtJv56U10Ly+o+G2HFiWDg+oAfLig0mYqaNXK5EVqdqT7LdnkVp2RxCFtkt4IB0JH3A
         +pLolLFAMl35PbIW4USfW0Q44UgGrFAMSYLzEbt72rTyhjwQeLg1YqOf6QsVr69hCnRd
         B+3i4BFBkgZQlo1E3eNhSc384Z/NBI8xI9h5+6nGIM0nFLOPoz3xs5SXc9Wlo59mFvv6
         n606eBmdbrpmKm4kzSE4Sw/9EZU7QL2SQAXv3xn5E8rjlbMOjDePfBNyvqc3OegOX/nQ
         nbYg==
X-Gm-Message-State: ACrzQf3FRiOFX3qQ0sUgYBb6CiTMVP2afy+ymCOHvYN4xFIE+GIXWpXV
        O7j1ESsqWZ1gVRe7SrQWFsj34Q==
X-Google-Smtp-Source: AMsMyM6VMpmNNV/gW1o9aka3SLcAVhWfc/YLrY6/6MpXiONtY0MwwaXzKw7mrS6jwyOhtOE/UZ6hxw==
X-Received: by 2002:a2e:a4c7:0:b0:26e:89d6:e6e7 with SMTP id p7-20020a2ea4c7000000b0026e89d6e6e7mr277356ljm.179.1665159063028;
        Fri, 07 Oct 2022 09:11:03 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id u9-20020ac258c9000000b004979df1c1fasm346005lfo.61.2022.10.07.09.11.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 07 Oct 2022 09:11:02 -0700 (PDT)
Message-ID: <bc8d020f-9026-84c0-42b0-27ca11ddfeae@linaro.org>
Date:   Fri, 7 Oct 2022 18:11:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH v5 0/3] Add dtsi for sc7280 boards that using rt5682
Content-Language: en-US
To:     Judy Hsiao <judyhsiao@chromium.org>, bjorn.andersson@linaro.org
Cc:     Andy Gross <agross@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        Srini Kandagatla <srinivas.kandagatla@linaro.org>,
        dianders@chromium.org, mka@chromium.org, cychiang@google.com,
        judyhsiao@google.com, swboyd@chromium.org,
        linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20220930152613.2018360-1-judyhsiao@chromium.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220930152613.2018360-1-judyhsiao@chromium.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 30/09/2022 17:26, Judy Hsiao wrote:
> Put sound node and lpass_cpu node settings for boards that use rt5682
> codec in the sc7280-herobrine-audio-rt5682.dtsi as there are different
> choices of headset codec for herobrine projects. Common audio setting
> for the internal speaker is in sc7280-herobrine.dtsi.
> 
> Change Since V4
> - Rebase and include sc7280-herobrine-villager-r0.dts change.

Please use scripts/get_maintainers.pl to get a list of necessary people
and lists to CC.  It might happen, that command when run on an older
kernel, gives you outdated entries.  Therefore please be sure you base
your patches on recent Linux kernel.

Best regards,
Krzysztof

